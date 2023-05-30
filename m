Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B70887165A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 17:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbjE3PDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 11:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbjE3PC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 11:02:59 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0137FC;
        Tue, 30 May 2023 08:02:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 67D9A1F8C8;
        Tue, 30 May 2023 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685458975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rvShh+QoY0xMt1yIZ9lTYh2RF2r+OOZF+xiCIF/gIs4=;
        b=rvUHjOP34/ASLRamj5l5DSB8l8Xawy7OyeU5w3v9rlztpMY7mTeT/WaARYFxvloiaqgUBa
        jQmkFAsdUP8UdZ8xxdLEbq0YR2veXpjYEw18wUqfSTtNYSOEGvgJ+nhEQqqjTUWzmidEa7
        oS+7OvnXrnsp4Ez5Dj2MM7E6VSJnlZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685458975;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rvShh+QoY0xMt1yIZ9lTYh2RF2r+OOZF+xiCIF/gIs4=;
        b=6ALh6uZAVo7AfzHirll9BVv7PrXGCIsgYg8TRNy1BtGG8CWTf2Bfefeemy9H6yQ1ag6PwM
        84BGlRx6Ya5pkIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25E9813478;
        Tue, 30 May 2023 15:02:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4AJ+CB8QdmShegAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:02:55 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 02/13] fbdev: Add initializer macros for struct fb_ops
Date:   Tue, 30 May 2023 17:02:42 +0200
Message-Id: <20230530150253.22758-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530150253.22758-1-tzimmermann@suse.de>
References: <20230530150253.22758-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For framebuffers in I/O and system memory, add macros that set
struct fb_ops to the respective callback functions.

For deferred I/O, add macros that generate callback functions with
damage handling. Add initializer macros that set struct fb_ops to
the generated callbacks.

These macros can remove a lot boilerplate code from fbdev drivers.
The drivers are supposed to use the macro that is required for its
framebuffer. Each macro is split into smaller helpers, so that
drivers with non-standard callbacks can pick and customize callbacks
as needed. There are individual helper macros for read/write, mmap
and drawing.

v5:
	* fix whitespace errors (Jingfeng)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/linux/fb.h | 112 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 2cf8efcb9e32..ce6823e157e6 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -538,9 +538,31 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 			   size_t count, loff_t *ppos);
 
+/*
+ * Initializes struct fb_ops for framebuffers in I/O memory.
+ */
+
+#define __FB_DEFAULT_IO_OPS_RDWR \
+	.fb_read	= fb_io_read, \
+	.fb_write	= fb_io_write
+
+#define __FB_DEFAULT_IO_OPS_DRAW \
+	.fb_fillrect	= cfb_fillrect, \
+	.fb_copyarea	= cfb_copyarea, \
+	.fb_imageblit	= cfb_imageblit
+
+#define __FB_DEFAULT_IO_OPS_MMAP \
+	.fb_mmap	= NULL // default implementation
+
+#define FB_DEFAULT_IO_OPS \
+	__FB_DEFAULT_IO_OPS_RDWR, \
+	__FB_DEFAULT_IO_OPS_DRAW, \
+	__FB_DEFAULT_IO_OPS_MMAP
+
 /*
  * Drawing operations where framebuffer is in system RAM
  */
+
 extern void sys_fillrect(struct fb_info *info, const struct fb_fillrect *rect);
 extern void sys_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 extern void sys_imageblit(struct fb_info *info, const struct fb_image *image);
@@ -549,6 +571,27 @@ extern ssize_t fb_sys_read(struct fb_info *info, char __user *buf,
 extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos);
 
+/*
+ * Initializes struct fb_ops for framebuffers in system memory.
+ */
+
+#define __FB_DEFAULT_SYS_OPS_RDWR \
+	.fb_read	= fb_sys_read, \
+	.fb_write	= fb_sys_write
+
+#define __FB_DEFAULT_SYS_OPS_DRAW \
+	.fb_fillrect	= sys_fillrect, \
+	.fb_copyarea	= sys_copyarea, \
+	.fb_imageblit	= sys_imageblit
+
+#define __FB_DEFAULT_SYS_OPS_MMAP \
+	.fb_mmap	= NULL // default implementation
+
+#define FB_DEFAULT_SYS_OPS \
+	__FB_DEFAULT_SYS_OPS_RDWR, \
+	__FB_DEFAULT_SYS_OPS_DRAW, \
+	__FB_DEFAULT_SYS_OPS_MMAP
+
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
@@ -604,6 +647,75 @@ extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
 
+/*
+ * Generate callbacks for deferred I/O
+ */
+
+#define __FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, __mode) \
+	static ssize_t __prefix ## _defio_read(struct fb_info *info, char __user *buf, \
+					       size_t count, loff_t *ppos) \
+	{ \
+		return fb_ ## __mode ## _read(info, buf, count, ppos); \
+	} \
+	static ssize_t __prefix ## _defio_write(struct fb_info *info, const char __user *buf, \
+						size_t count, loff_t *ppos) \
+	{ \
+		unsigned long offset = *ppos; \
+		ssize_t ret = fb_ ## __mode ## _write(info, buf, count, ppos); \
+		if (ret > 0) \
+			__damage_range(info, offset, ret); \
+		return ret; \
+	}
+
+#define __FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, __mode) \
+	static void __prefix ## _defio_fillrect(struct fb_info *info, \
+						const struct fb_fillrect *rect) \
+	{ \
+		__mode ## _fillrect(info, rect); \
+		__damage_area(info, rect->dx, rect->dy, rect->width, rect->height); \
+	} \
+	static void __prefix ## _defio_copyarea(struct fb_info *info, \
+						const struct fb_copyarea *area) \
+	{ \
+		__mode ## _copyarea(info, area); \
+		__damage_area(info, area->dx, area->dy, area->width, area->height); \
+	} \
+	static void __prefix ## _defio_imageblit(struct fb_info *info, \
+						 const struct fb_image *image) \
+	{ \
+		__mode ## _imageblit(info, image); \
+		__damage_area(info, image->dx, image->dy, image->width, image->height); \
+	}
+
+#define FB_GEN_DEFAULT_DEFERRED_IO_OPS(__prefix, __damage_range, __damage_area) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, io) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, cfb)
+
+#define FB_GEN_DEFAULT_DEFERRED_SYS_OPS(__prefix, __damage_range, __damage_area) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
+
+/*
+ * Initializes struct fb_ops for deferred I/O.
+ */
+
+#define __FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix) \
+	.fb_read	= __prefix ## _defio_read, \
+	.fb_write	= __prefix ## _defio_write
+
+#define __FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix) \
+	.fb_fillrect	= __prefix ## _defio_fillrect, \
+	.fb_copyarea	= __prefix ## _defio_copyarea, \
+	.fb_imageblit	= __prefix ## _defio_imageblit
+
+#define __FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix) \
+	.fb_mmap	= fb_deferred_io_mmap
+
+#define FB_DEFAULT_DEFERRED_OPS(__prefix) \
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(__prefix), \
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(__prefix), \
+	__FB_DEFAULT_DEFERRED_OPS_MMAP(__prefix)
+
 static inline bool fb_be_math(struct fb_info *info)
 {
 #ifdef CONFIG_FB_FOREIGN_ENDIAN
-- 
2.40.1

