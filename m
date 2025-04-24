Return-Path: <linux-arm-msm+bounces-55431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA3A9B0B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EF1F7B73F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996D429291C;
	Thu, 24 Apr 2025 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQRWxIZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE840291171
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504064; cv=none; b=XhxHVzaMdGapTGUuKy0j3vZmklYbCJQLACaerhMlubJrOGaT2mPj33612dODlKfa46k3pnKziN87KhjoB2Sk+rmU/Yd2cNBtPMPtmY2BP1qtgPRyePTz89LxC0VpGIztMVdWL2iJEZlqKxqzsuhpc8mh+C66Rg6xFHESUQQh2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504064; c=relaxed/simple;
	bh=l8MXGFGw31uuwPrLVCURxj+dBhiUP5Eq/JDGE+Ioyyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTchR76HhnFxPEQVix0P4olVbiBY6+BI7eyruJd5ShmPt5Gq3a+SfVFL1gDBt3kYQU1ZQ8gYCTb5JSHhMdO7L5CouEgSKps8gpqacU7giDkXZEyFtDCrLg15WX9rThNJRk15h8e+X/DMwHV3Cz/afmp+TqdeFG5eudjdK6/q0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQRWxIZ8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso5333545e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504060; x=1746108860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULK/WgQrAoOKgv7yTbnqoplbgLc/ybTV2ol4z7wD4V8=;
        b=rQRWxIZ8fpXO6y7A7UEoBuCu58ZSGVRY0fjpUvj5yf8BrVkOihzZTjogYnJHmrD9OG
         5bBkzKMlKMuW7rijJvKvn5tzGE4ax3rinG5VQMmuwWDDuQieJiCbQmPJDAMonyD/KNBe
         cfZbIYruffocTqvtlrq7tyjPuoXof+RxuzdU2huHJcpAqTA1ujaVCIQRTZKoTztXvzwh
         qZMS1XOZsce0KykvQTP+oDgnnDxzTkiBHhsH6l3NUVVKKeZ39mJEAUhN2/65eho8OO4X
         IHXSFmu5YI3FeaFhWrHR1akw5UVoAhlIobKVnFlNNIkIfax5YE5OOBHoU4//QWZhg5DI
         vofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504060; x=1746108860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULK/WgQrAoOKgv7yTbnqoplbgLc/ybTV2ol4z7wD4V8=;
        b=WNeSDdm+6G3pFFBmoHDLI23g+ePXZSd6Ms1Za0TjhiSIVZHrR7bylyBKeQNNV8ZRI/
         FaYoWWfmUx/AMDYvrj2nWtkZ4AunVGu7BUWd+vxTqtH6yGsDKPK+qpIhnY1uaBEwv9+0
         4obmWhaoMY7uzUgxWj66XD/A7ScTsNVLOCI4wIgPbn9WYxl2Xz80KkOwo7dcFTPIaKUD
         bYMl/by1jiEzsuT+LS7swch2WHtPYzQP6fQ/rR38/l/vBIGAKA4F2XGzcGztABmaNkrc
         eDIPPEPHaLl/sSjM+w3+qZxefAulrOpK1xClqT2rpbrprF29TmaXEkRogB7sDGNaSYeC
         jp+A==
X-Forwarded-Encrypted: i=1; AJvYcCVY5u/f9iK3MmmMvPgQdeT9t2fFrYnAEo8EYIgOQweu27XYaMV6JZ+jmkiuclRWbXwnoc3GuvgKBq8Al2vo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vTtwrhwM0B1T5D+L615WogVVHqAPyzOODPQLlJuE6xidT/GH
	IyCG0m9Zw+BIjsPmWKNanZm8UZbadncWKBczDrKmYkqGt8RchsMKiHsrP4Xwhfo2W4wuv3gqDR6
	p
X-Gm-Gg: ASbGncuZYy9q3QaTNebcH7jzxhSuVImvdIUffB3I03gYPpi1I3PJxxH0mjdCKxKVufl
	VkebxIperHOoVKFKZalyk9CvUT3W3f+dB3pza/vu0hN2Sy3Q1D6ztbwPitvTbBwErABB8GgvJFK
	wAPT4Pn1Sr7oDwkF5FZMXUs++vG28kD4zu1S9QfbfcFmQwTue1rZpahc6PHDZKgV5hizTk0ngOZ
	N2vw/2LCF3LioCO7jepwo1RtOEQum+MUOyYE3dbVW6QoSQK8EsuKCxGdmEUIOK5YWOJxyxeMDzo
	Y/w2YAhn3MsDJ4ASCXeQjEGg91s5v/8GmjIieGd5XEK4knYmY6bimQYGF0O5VWJLxlco22s6SW9
	7V93gfDSaSHyCLw53
X-Google-Smtp-Source: AGHT+IFE5/vk9/X0Lu9aLCAdTyRnF+oi4a9Eo+hij9nbvfLjJtzlSBwWD4MqvNxQh/Fi8Qjri674AQ==
X-Received: by 2002:a05:6000:220c:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a06cf65a2bmr2283431f8f.35.1745504059899;
        Thu, 24 Apr 2025 07:14:19 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:19 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 26/34] gunyah: Share memory parcels
Date: Thu, 24 Apr 2025 15:13:33 +0100
Message-Id: <20250424141341.841734-27-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gunyah Resource Manager sets up a virtual machine based on a device
tree which lives in guest memory. Resource manager requires this memory
to be provided as a memory parcel for it to read and manipulate.
Implement a function to construct a memory parcel from the guest's
pinned memory pages.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 80 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 7216db642174..ef0971146b56 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -634,6 +634,86 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 	return ret;
 }
 
+static int gunyah_share_memory_parcel(struct gunyah_vm *ghvm,
+		struct gunyah_rm_mem_parcel *parcel, gfn_t gfn, u64 nr)
+{
+	struct kvm *kvm = &ghvm->kvm;
+	struct kvm_memory_slot *memslot;
+	struct page **pages;
+	int ret;
+	u64 i;
+
+	if (!nr)
+		return -EINVAL;
+
+	memslot = gfn_to_memslot(kvm, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	parcel->mem_entries = kcalloc(nr, sizeof(*parcel->mem_entries), GFP_KERNEL);
+	if (!parcel->mem_entries)
+		return -ENOMEM;
+	parcel->n_mem_entries = nr;
+
+	pages = memslot->arch.pages + (gfn - memslot->base_gfn);
+
+	for (i = 0; i < nr; i++) {
+		parcel->mem_entries[i].size = cpu_to_le64(PAGE_SIZE);
+		parcel->mem_entries[i].phys_addr = cpu_to_le64(page_to_phys(pages[i]));
+	}
+
+	parcel->n_acl_entries = 1;
+	parcel->acl_entries = kcalloc(parcel->n_acl_entries,
+				      sizeof(*parcel->acl_entries), GFP_KERNEL);
+	if (!parcel->n_acl_entries) {
+		ret = -ENOMEM;
+		goto free_entries;
+	}
+	parcel->acl_entries[0].vmid = cpu_to_le16(ghvm->vmid);
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_R;
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_W;
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_X;
+	parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
+
+	ret = gunyah_rm_mem_share(ghvm->rm, parcel);
+	if (ret)
+		goto free_acl;
+
+	return ret;
+free_acl:
+	kfree(parcel->acl_entries);
+	parcel->acl_entries = NULL;
+free_entries:
+	kfree(parcel->mem_entries);
+	parcel->mem_entries = NULL;
+	parcel->n_mem_entries = 0;
+
+	return ret;
+}
+
+static int gunyah_reclaim_memory_parcel(struct gunyah_vm *ghvm,
+		struct gunyah_rm_mem_parcel *parcel, gfn_t gfn, u64 nr)
+{
+	int ret;
+
+	if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
+		ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
+		if (ret) {
+			dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
+				ret);
+			/* We can't reclaim the pages -- hold onto the pages
+			 * forever because we don't know what state the memory
+			 * is in
+			 */
+			return ret;
+		}
+		parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
+		kfree(parcel->mem_entries);
+		kfree(parcel->acl_entries);
+	}
+	return 0;
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-- 
2.39.5


