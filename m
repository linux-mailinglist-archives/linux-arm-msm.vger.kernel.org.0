Return-Path: <linux-arm-msm+bounces-64996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4BB05682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6631C23074
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6FA2D46C9;
	Tue, 15 Jul 2025 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hL5jnk/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2A2D8DAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572049; cv=none; b=ibG6XlM2UxJWkoQNXcr/+qwYQnVkpHpH7KssG9aoawTLwa9MIZfcDTM1+zqr0oeAjToyY4bHMizTQ62ry/XWzxJdh3p1/RNmwxGF9JYT5k+8UyLoU2t5yE8yxHyLoppTp8fAomHygw/7vRRy9vngZmaF4Bwy+04FXYtC5CvHA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572049; c=relaxed/simple;
	bh=aLq6w6iMVx9A+GXdrTT+UqPhvEMW4mi+b5uKE2VvZds=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kNmoxUBr3xs5pNpwgf6iXPNGif5Qf2l16hi1YOMF8U99dVq+mQM3+pYvBwnM7EuRCcdUhgTHkYzgjJCWNew9PUCT24zbhirG34uNFVoSX8Va8+Stgszg4kSBUqafcHZzp3ZEIH63LK/bST+oQ72x/bqeNFarHRgYPbb1JDeZExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hL5jnk/q; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d30992bcso41916455e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572047; x=1753176847; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TkuKuazKKizZ6ZlT9w9fSwNujhSChJOs2f7h5A8NbUM=;
        b=hL5jnk/q/MoarJr5KKTYLX2ssSlmCbW4/hDt8l4S1bmrBnzzvwZrBJu8juomSPIuI4
         UPS6xkJ2WlYBBoU+F2F+EPbnEdGY9kU8QF8wA0Z7lKscVMep/xg+XsI34Afr71wJkd1p
         NRACVuXRaaVVlbSKKoVBhMe9tqxVH2s+cGX8BFlcdPx4FWcJCNup9IkxZr297jyGzZwQ
         scdHobauKyIrs+DB64jrCe4gmefIdvAiSP/JfwUkpKcOUaVWEJwZZMYF23CGafbw5n4J
         FJnwVWOlERtlGqEuIetNpN8D2rbj8oREx2hbc9kfsJE/+xOaJMebWbyRPrWVM17UPu3E
         JDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572047; x=1753176847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkuKuazKKizZ6ZlT9w9fSwNujhSChJOs2f7h5A8NbUM=;
        b=XQgMJJxtaGLSDmqIdJhMBq1Q0EeGo+53r9bepMZenETxE2uNM1vc0bl/uOV9hyMmBh
         s4iF+4L4EGFl3u3VHusImbmT1ptRtI4lwfG/BPaFVFGQFfVNUgbeLBAUoQu9C0PP+hqu
         lnuN496HZU+fKBicESnkcNE+E0wlkSFtePyIhsQ15+YgM42/0WXXXqd+g3fsUutk+9oX
         qlPsb7cMkraM5YNM9rgBJMReTHSzNndj3LiLL2xD+ZjmEhDb29+INTvuItsmxZFHRcTv
         Qfu6IC+gMvE6fztIAkEola+Pg/L48n5QWaaWt+naPxGOJinvS0pWiJ5HzNmnSAMB3qqR
         yQjA==
X-Forwarded-Encrypted: i=1; AJvYcCXNwo7lmOE2FYsOb5MV51gH2zsR4bsj7vRqUgNXb/U5SJdpU8yghbSsgbdgWCQrjNFqonB2fHbbMkjWYCca@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHSLAbbCrUauAEb+/wMvuIv/0LXReDHluGrWl0RqvLwVOvL5E
	I2qsjPob/sYFo00QTl8dk5AE3f1MKHYsYXoDYhKz7P4UIMntAc8ho8/8MvDfsDrZ4CgQ9GUaJ5S
	1vg==
X-Google-Smtp-Source: AGHT+IGHXP0t1xMDlthuKsBdUUCbcrAxXrLxIuWqHsf1c70IZpuqDuBfFbcmN2MndgHaJWicrlcB1Kwa1w==
X-Received: from wmsn28.prod.google.com ([2002:a05:600c:3b9c:b0:456:2003:32a5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b0b:b0:456:1e5a:8880
 with SMTP id 5b1f17b1804b1-4561e5a9020mr52008185e9.13.1752572046722; Tue, 15
 Jul 2025 02:34:06 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:33:36 +0100
In-Reply-To: <20250715093350.2584932-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250715093350.2584932-1-tabba@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715093350.2584932-8-tabba@google.com>
Subject: [PATCH v14 07/21] KVM: Fix comment that refers to kvm uapi header path
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

The comment that points to the path where the user-visible memslot flags
are refers to an outdated path and has a typo.

Update the comment to refer to the correct path.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9c654dfb6dce..1ec71648824c 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -52,7 +52,7 @@
 /*
  * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
  * used in kvm, other bits are visible for userspace which are defined in
- * include/linux/kvm_h.
+ * include/uapi/linux/kvm.h.
  */
 #define KVM_MEMSLOT_INVALID	(1UL << 16)
 
-- 
2.50.0.727.gbf7dc18ff4-goog


