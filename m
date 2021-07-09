Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 081563C280C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIRNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:13:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhGIRNv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:13:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06B38613C1;
        Fri,  9 Jul 2021 17:11:05 +0000 (UTC)
Date:   Fri, 9 Jul 2021 18:10:53 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Will Deacon <will@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210709171051.GB29765@arm.com>
References: <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org>
 <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
 <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
 <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
 <CAOCk7Np_2Mk481g-7KTf=Jk-i9ZHiAgX40pKBYckAAReEQbGyA@mail.gmail.com>
 <CAOCk7NqdpUZFMSXfGjw0_1NaSK5gyTLgpS9kSdZn1jmBy-QkfA@mail.gmail.com>
 <20210709084842.GA24432@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709084842.GA24432@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 09, 2021 at 09:48:42AM +0100, Will Deacon wrote:
> On Thu, Jul 08, 2021 at 02:59:28PM -0600, Jeffrey Hugo wrote:
> > On Wed, Jul 7, 2021 at 8:41 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> > > L0 I 64 byte cacheline
> > > L1 I 64
> > > L1 D 64
> > > L2 unified 128 (shared between the CPUs of a duplex)
> > >
> > > I believe L2 is within the POC, but I'm trying to dig up the old
> > > documentation to confirm.
> > 
> > Was able to track down a friendly hardware designer.  The POC lies
> > between L2 and L3.  Hope this helps.
> 
> Damn, yes, it's bad news but thanks for chasing it up. I'll revert the patch
> at -rc1 and add a comment about MSM8996.

It's a shame but we can't do much for this platform.

Longer term, we should look at making kmalloc() cache selection more
dynamic. Probably still starting with a 128 byte minimum size but, after
initialising all the devices during boot, if we can't find any
non-coherent one just relax the kmalloc() allocations. We still have the
issue with platform devices with DT assumed to be non-coherent and any
late call (after boot) to arch_setup_dma_ops().

Some bodge below to get an idea, not a final patch (not even the
beginning of one). It initialises the kmalloc caches to size 8 but
limits the allocation size to a kmalloc_dyn_min_size, initially set to
128 on arm64. In a device_initcall_sync(), if we didn't find any
non-coherent device, we lower this to KMALLOC_MIN_SIZE (8 with slub).

----------------8<----------------------------
diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index a074459f8f2f..bed65db3c42e 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -40,15 +40,6 @@
 #define CLIDR_LOC(clidr)	(((clidr) >> CLIDR_LOC_SHIFT) & 0x7)
 #define CLIDR_LOUIS(clidr)	(((clidr) >> CLIDR_LOUIS_SHIFT) & 0x7)
 
-/*
- * Memory returned by kmalloc() may be used for DMA, so we must make
- * sure that all such allocations are cache aligned. Otherwise,
- * unrelated code may cause parts of the buffer to be read into the
- * cache before the transfer is done, causing old data to be seen by
- * the CPU.
- */
-#define ARCH_DMA_MINALIGN	(128)
-
 #ifdef CONFIG_KASAN_SW_TAGS
 #define ARCH_SLAB_MINALIGN	(1ULL << KASAN_SHADOW_SCALE_SHIFT)
 #elif defined(CONFIG_KASAN_HW_TAGS)
@@ -59,6 +50,9 @@
 
 #include <linux/bitops.h>
 
+extern int kmalloc_dyn_min_size;
+#define __HAVE_ARCH_KMALLOC_DYN_MIN_SIZE
+
 #define ICACHEF_ALIASING	0
 #define ICACHEF_VPIPT		1
 extern unsigned long __icache_flags;
@@ -88,7 +82,7 @@ static inline int cache_line_size_of_cpu(void)
 {
 	u32 cwg = cache_type_cwg();
 
-	return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
+	return cwg ? 4 << cwg : __alignof__(unsigned long long);
 }
 
 int cache_line_size(void);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index efed2830d141..a25813377187 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2808,8 +2808,8 @@ void __init setup_cpu_features(void)
 	 */
 	cwg = cache_type_cwg();
 	if (!cwg)
-		pr_warn("No Cache Writeback Granule information, assuming %d\n",
-			ARCH_DMA_MINALIGN);
+		pr_warn("No Cache Writeback Granule information, assuming %ld\n",
+			__alignof__(unsigned long long));
 }
 
 static void __maybe_unused cpu_enable_cnp(struct arm64_cpu_capabilities const *cap)
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 4bf1dd3eb041..9a30d1beb3ea 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -13,6 +13,18 @@
 
 #include <asm/cacheflush.h>
 
+/*
+ * Memory returned by kmalloc() may be used for DMA, so we must make
+ * sure that all such allocations are cache aligned. Otherwise,
+ * unrelated code may cause parts of the buffer to be read into the
+ * cache before the transfer is done, causing old data to be seen by
+ * the CPU.
+ */
+int kmalloc_dyn_min_size = 128;
+EXPORT_SYMBOL(kmalloc_dyn_min_size);
+
+static bool non_coherent_devices;
+
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
@@ -42,11 +54,14 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 {
 	int cls = cache_line_size_of_cpu();
 
-	WARN_TAINT(!coherent && cls > ARCH_DMA_MINALIGN,
+	WARN_TAINT(!coherent && cls > kmalloc_dyn_min_size,
 		   TAINT_CPU_OUT_OF_SPEC,
-		   "%s %s: ARCH_DMA_MINALIGN smaller than CTR_EL0.CWG (%d < %d)",
+		   "%s %s: kmalloc() minimum size smaller than CTR_EL0.CWG (%d < %d)",
 		   dev_driver_string(dev), dev_name(dev),
-		   ARCH_DMA_MINALIGN, cls);
+		   kmalloc_dyn_min_size, cls);
+
+	if (!coherent)
+		non_coherent_devices = true;
 
 	dev->dma_coherent = coherent;
 	if (iommu)
@@ -57,3 +72,12 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
+
+static int __init adjust_kmalloc_dyn_min_size(void)
+{
+	if (!non_coherent_devices)
+		kmalloc_dyn_min_size = KMALLOC_MIN_SIZE;
+
+	return 0;
+}
+device_initcall_sync(adjust_kmalloc_dyn_min_size);
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 0c97d788762c..e40c7899cb07 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -349,15 +349,21 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags)
  */
 static __always_inline unsigned int kmalloc_index(size_t size)
 {
+	int min_size = KMALLOC_MIN_SIZE;
+
 	if (!size)
 		return 0;
 
-	if (size <= KMALLOC_MIN_SIZE)
-		return KMALLOC_SHIFT_LOW;
+#ifdef __HAVE_ARCH_KMALLOC_DYN_MIN_SIZE
+	min_size = kmalloc_dyn_min_size;
+#endif
+
+	if (size <= min_size)
+		return ilog2(min_size);
 
-	if (KMALLOC_MIN_SIZE <= 32 && size > 64 && size <= 96)
+	if (min_size <= 32 && size > 64 && size <= 96)
 		return 1;
-	if (KMALLOC_MIN_SIZE <= 64 && size > 128 && size <= 192)
+	if (min_size <= 64 && size > 128 && size <= 192)
 		return 2;
 	if (size <=          8) return 3;
 	if (size <=         16) return 4;
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 7cab77655f11..2666237c84c4 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -725,6 +725,10 @@ struct kmem_cache *kmalloc_slab(size_t size, gfp_t flags)
 		if (!size)
 			return ZERO_SIZE_PTR;
 
+#ifdef __HAVE_ARCH_KMALLOC_DYN_MIN_SIZE
+		if (size < kmalloc_dyn_min_size)
+			size = kmalloc_dyn_min_size;
+#endif
 		index = size_index[size_index_elem(size)];
 	} else {
 		if (WARN_ON_ONCE(size > KMALLOC_MAX_CACHE_SIZE))

-- 
Catalin
