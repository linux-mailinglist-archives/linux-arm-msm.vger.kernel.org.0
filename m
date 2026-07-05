Return-Path: <linux-arm-msm+bounces-116570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5aogOpStSmrhFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:16:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078E70AF1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:16:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V4JICqZL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116570-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116570-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC76A3034B36
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EAB3A1A3F;
	Sun,  5 Jul 2026 19:14:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD6381EB8
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278867; cv=none; b=bVAYjwyQ3FzKckJIJcC/q1jNUafxHnGm4iYJasaFGH4PxCTGo96wlJTvxdEFRawllP5ULcAwEaJy88Vw1Nqk7518Nc9SjkKmyarmI1VWVJ8e11sbaQKaLWqXEwuUTc/TME6KNxqIxdbZfBZBqi9AKdsw766lzHJDL0VV8BwiV0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278867; c=relaxed/simple;
	bh=xCTorTjZtBUEYbL6NZx5Fd5BNvNcYE4Jm0bT2+wByeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duT0pagxBWH6zJzYR0bi/Az3Ls61R56o6hZJSXBK9aaivkXs+ggYMZ3fZMcDvkMmD88FRstA/T/EbUcGa//cnyOzi/v1hj5O8+y1VwrJV+GX4EOFYoUFgs3UJDsLh9iOIYiS/PI017YqkC3MegHtaZo4nFCNylpHOjnhND0qlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4JICqZL; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so888816f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278864; x=1783883664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=V4JICqZL9g54xA5d7N3r8RLcayJXfmXmZnCGmKS6CstQEZFaVhaJr2UhMs4xVABmJn
         RxX3y4CmIDb5yABJShETYRPw5PHaFFJtMyCWmdiek6/N56Zqh/lqE8GOFHhF0qjaLW5e
         3YXW44ad4GATUUjjWurokM9OFOk/qPkF47JravK4WXCm7UmaxixP+lYMS1pwPYNzppJ5
         CdbJqiUGcGsTIbOn2qpqmkHb8qCMxZ6LKd98C3kOpapIjCGfAxEUemaHUTr6CpkoHJ5n
         mGZqFjVk5IKQReJIQD9obxaoNM2wfRs6nKjIz5NBASWkHAjNiyZfIfGX2ikS9SqNolLU
         tINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278864; x=1783883664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=gvzGLu/ZMb7jpGJjUVmKbdEDtplUOEv3z9XKmMVuLikGSKOXyRZ3I0dx6vCUHNiIxd
         tV9dVU3dO0KcLlHrATXXkv8za+FezMLQmtQjc9KmiZRv7rjvFRwmD3EATFQq5zqGBP0Q
         Om6UnTuLMloe1Yui7Gala2PFH02932yeYHcTJWK4DiEa5ScED4vpBjVRmmmxG+6AcFtC
         SfqZQZSu640QSF0/fm1JydTFk4FJvC/n3eKS8NkcThl/0xJ5NxklwqiG6LlMCTFbduuG
         ra7HUpWEMI9D/Io9PX0hWmPW+znQjO2xgbxoGTfvR9sjyQPwjoNz6TGhNvHXl8m/TnPg
         pacQ==
X-Forwarded-Encrypted: i=1; AHgh+RoO9ulf27f+18HF73ZD4Wo0hDjuX0oJ9JnZScWkLtZoolGYaH9N4bn3sYbeuaeJguQ2nTXCTVyIpcmxAeNI@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXF37o1Lxa/OK4adypkkiFZ9a4Q+4YakmJO9bOSbAUgZvh/fd
	v32f0NsjVkSGZvYXAUxz4ch1AH1FTZsRjMQHni/IBpOV6e6wp9fbC5w=
X-Gm-Gg: AfdE7clkESJXu0FMcNcSIftuM3vpARoamCx88FsA3NcYg/krkia0JQI3tLZ4rQsBBSL
	1Q8RNbvgd5t/I2VexkJsoqktUijUJRHjo1zjGo5BGIJ1ROP35M0/ja5oi4fP+tDWvD7+w03E8iP
	JKVBulN1iN4SU8NYdE/0MePchWeAc0ge7UwtlOkmKKjT4O1QCUwpvuEcYWnKJf6NfgYDMOLm4d8
	44yJQPLX/XmM9bUAHLqenoxjucansff2qE1IPw6UzWOt0VcfSMtT68BtQif6asSovhKDDjaIoCv
	Bqq8c+ITnH02b6BMKNX+sf5wojp2pvqpWEt0nAlAfyq8Z23Z4ZPk4+dQE0LlSusEZoQvJqVpgrD
	EvqqTN77VX05py+tCc2nuwAvKDkTLC4rMAnFMvLAmrKBJaz6PRomKTQ9Txzayz/LEcoBIqcWigP
	Vm7xtHTiPcH23PxcM=
X-Received: by 2002:a5d:64e3:0:b0:477:f5c:9bf2 with SMTP id ffacd0b85a97d-47aace8e983mr9385528f8f.51.1783278863594;
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:39 +0200
Subject: [PATCH RFC 05/13] firmware: qcom: scm: Configure LPAC aperture
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-5-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3104;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xCTorTjZtBUEYbL6NZx5Fd5BNvNcYE4Jm0bT2+wByeQ=;
 b=JM9qT2757B3skDadThg2OlzWiKU5aLJo5x9qIqus/1JlX88Naikriu2+e98AC1wkrlG4Kxof/
 4ILHHS1V0i/AYzsBbF8lb5SHonjTx3ikmirYkFyCsdZyXrX0gQUGfCW
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9078E70AF1D

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..92093399f20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
 #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
 
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
 {
@@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
 
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | (1 << 8 | context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 71ce4cbbf27a..be374cf209f4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -668,6 +668,9 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+		ret = qcom_scm_set_gpu_smmu_lpac_aperture(1);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n", ret);
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..70fb93e303e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank);
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);

-- 
2.54.0


