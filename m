Return-Path: <linux-arm-msm+bounces-116566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y03DGketSmrIFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7ED70AEE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a6J5Jm+e;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368833014BC3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF0339FCAE;
	Sun,  5 Jul 2026 19:14:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24984369D67
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278858; cv=none; b=A1HQAUZsLWGMf07KRGV11TB8rVYQmkV4UijExWm4ccnvN9JRkwBIkJxkxUlWmdcbCxbHuqkMbNlPW2ob27f6X29M+2Cykzbr3fBwvQci+BFXRkoJBHw/6aJVhGSUdWjb9906U9l7FbMOqf3NI4MYAkT/nT0NppDn1D7Z0zVjMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278858; c=relaxed/simple;
	bh=TOpopsFtZ1PPnGuz7Qdse1Rb2dSOsjvazts1+j2Qsuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZ7Lsq4upsC6XSCd5e4CERwlm5YToDOKb7xgWREAJVXuwMsI72k0ELYHkGMhzSEUbG8ZrrTmcWzmSoiT6iiX+EH3hQvJN3Lzkpgvb5FTuTUMIwD1dtWP2wDfGmd725AsWEuoNmHqhQjCpW6OHUdRt6Rpd/pHcarQk6BZbOpPL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6J5Jm+e; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so4502535e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278855; x=1783883655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=a6J5Jm+e/0Y1MOQMKzqVXOgFWmPwSOW9R3EAG2I8i9WF56GGFJH4v49p4Hefof7PPX
         2yNB88FOsoKwn2ygn2mYcAab8PDsx95HZ/e6CoWbja4X+7Ln+7LE67KubhU8YNfa4RQR
         Ms1QAhPU54VAKPNnn+u7Zmec6P7PMDxvofonikFk54GiWxiohSad9uWurRcK3qPupBPh
         MHf1Z1Oqzrep5h0LDGu7PoFscbeNO/ImAuAYsNfwywpJ2nFl3jvpfdFuldqMTe+4ypPZ
         l6MelFntwDrGnycL9y1h1EFL/37LeVYsMWmkhDLb5Bz5IoAg3NvdZnDUTjgItJPuoIrl
         crYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278855; x=1783883655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3eyPuG/7N0ePFJ/qBb/yJdx1/OQTbqvhMmqlXZb7jM=;
        b=FSOIJ3QO5HUdQl+qINulX+eEnL3dRe0MJMgHZUVAOJKDoCvYs1hj21d6fcrcDZSRPr
         PSIqWCusaDq1Cr6he6FthcypJDfhlBHheEBbjycsCvVMVKdXgcklWOwvTWRSUmIDVDvy
         Pj4UR1BRHRabJuMbGCeCs/AisMFdAeibgbVuj8EJGhbLjLaFrq+8bqdJGhUQH8QPYI0A
         /vyE1U60RfaC4SEK52mT8h1IyPjI/4MQcon3F5RlNGmsg/rFfR3WLRZUjpTmpY20ECwg
         n4dZYZG6NAHMB98n3ZYpUNIU7K24rX52+lE3ccBjci58Nk4X2boeCnlt4yH/3L/iienS
         k5Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rpzx68BCW7XNGKoKm/bzRu5qinbmGcGJ0E94kvtsTPsuWBulmehq47liZ+aFPgrR4ofLJOKvaaiUr9WwGh9@vger.kernel.org
X-Gm-Message-State: AOJu0YxOi9KN9PSewTJRJQcqPdNxvjMv6eTZXO6YLnJOxUUfAqGuh9wp
	vOnOzJe3ORUbSUbgKid10PtOn7byoKYgAs61gWbObOYpFY4SzH+EDRE=
X-Gm-Gg: AfdE7cmBkKb8fAM8KJo1AuRQknRbAK0EUc1p3alEW49XNzN8u/sBYLmdQU6I8IpWYNX
	j7s8cwXvJrahjX9OKM7xwVaNlLphK/estHuhQ/BrFi8GHWUjhDX8FGnt+kCRbuTFurJ+dTn8Fnz
	XiSXAh+DXYoQmH3YWOaQskXOhcHYCsdipVKsr+RpgIx316w03Ph+oRFYXY8hQtdm+/4fjYLDIC/
	69IVStcp5mHFuzLSwFQ1OofDq6wumtjMOIIr9SZFgTY9fvHLHqFhGgQLZvuhtBKszbsgi9iXPLW
	p0OUSb1QBGwoUcCfdZlRiNSOc+vT4zGt1n8u5HpeYHvAnhWUe+9XmatO+oQD9ZdyS98EG68Khzh
	npvprJEN7RMZZ0P+Az2qGRuCvZsatMkM+O8fngfx6iq7pQI25CV1yX5KiuxLS0beqFoxy6gJx9t
	9d4GOVHE6XWVUqPv8Y20zO11aa/wT92KbL/6nApf2f
X-Received: by 2002:a05:600c:628f:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493d11d7d55mr92320425e9.9.1783278855325;
        Sun, 05 Jul 2026 12:14:15 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:14 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:35 +0200
Subject: [PATCH RFC 01/13] iommu: arm-smmu-qcom: Configure lpac device with
 split address space
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-1-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2198;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=TOpopsFtZ1PPnGuz7Qdse1Rb2dSOsjvazts1+j2Qsuk=;
 b=swnPSg6jJwnfwPpO2lUtsliGm7jHo9gqL51QEmCML+oAIm1zPDuCFHYdt3TNVGcjeXVx38cVC
 13fGjbA8BMDAB0TZwyRx8GCJenaSAUzrSU2r89a5X2KYaRbtynBvrSe
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116566-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E7ED70AEE3

We want the context bank used by LPAC to use split address space just
like GFX.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..48a590aaeb5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -35,6 +35,8 @@
 static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 	{ .compatible = "qcom,adreno",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,lpac",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-gmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
@@ -217,6 +219,7 @@ static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_a
 }
 
 #define QCOM_ADRENO_SMMU_GPU_SID 0
+#define QCOM_ADRENO_SMMU_LPAC_SID 1
 
 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 {
@@ -230,7 +233,8 @@ static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 
-		if (sid == QCOM_ADRENO_SMMU_GPU_SID)
+		if (sid == QCOM_ADRENO_SMMU_GPU_SID ||
+		    sid == QCOM_ADRENO_SMMU_LPAC_SID)
 			return true;
 	}
 
@@ -305,9 +309,9 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 	 */
 	if (qcom_adreno_smmu_is_gpu_device(dev)) {
 		start = 0;
-		count = 1;
+		count = 2;
 	} else {
-		start = 1;
+		start = 2;
 		count = smmu->num_context_banks;
 	}
 
@@ -394,6 +398,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,lpac" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },

-- 
2.54.0


