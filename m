Return-Path: <linux-arm-msm+bounces-79191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733EC14A92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F290401F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AD932E6B5;
	Tue, 28 Oct 2025 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0IqJFet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF8D32BF43
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761655109; cv=none; b=mO2yB9/263YFmMNkWdRYaWAI0BdL2KqdWmUf6eBgGoZquG0jPHbkPcu6tV/R3owsP4UqIJYl8LVOh9aovuNgXbjHVQBhX+grcOm5Qjpn56hjytLITXgjUnNYaA6O8Aa1rzJtGkiy29Dr6cNcodb09ZkftYZF6k3J+x5/f8f57lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761655109; c=relaxed/simple;
	bh=Mf8h+h03L2bzW9mDWJu5js5WAT5mXmT3aoXz60/jCXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LPiHHdgTWuzF4vufc80d9jjul3adP3CjxPvLn+pJJJ5tfmHjMUubE5drFWkPAy37GpjuxTumf8QHhuXX+x0VakUaqmrE+w1Gxk9wu66UtW85EhkK2Ml9AIin61qNc3JwqlZCDsF4PdJlXkSmUrqBPt0vD/QcblOdP7fMyESGrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0IqJFet; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso30474775e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761655105; x=1762259905; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HQWTTzmS8TT5Tb3R6tEELAasWZz7XbENUTZplMJ86A=;
        b=Z0IqJFetPGGFPuwImtjEtxkeTZPhmVRBtAq9cVoxxsQhess3dVoIVNhcH6inPJlZMJ
         5nwjjzCB2xsf0K3EUNq3cX314YgiuwFnIpW87Kt+m9bMzXIlVvF6KRVzSUpfmHYfZLzN
         bTJDudOANt5w/Yc8QeBznKjbpP4OC1OUbtIzLuLJn+h1ryoD6WlRz+GPdr+bzb/xLfHa
         A5jXDvzAzJ1Z/quBT80vX0ylv4njbEPPWMTqkOS0TvTEsuBfmeSEf2KMTthrFkw3543x
         ZVkb8bp7/GJnROnPqMvmsbGLTrhYYIEsHhjJJwlnGNNTcQqSJd8soDBZe/KqCdDCSmB8
         MKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655105; x=1762259905;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HQWTTzmS8TT5Tb3R6tEELAasWZz7XbENUTZplMJ86A=;
        b=WO1UosPI14iZb6ExYnunaOzSUcsEo21oFUpG2nc2XmhfhK0OCv0H75PckruriGMiTG
         zZ+LN8/qICotYFypne9EfricVm9qOtvFI3UV5nU4LNlEA2V5qyF/CAsblDF8n+QUTV+u
         h3mqJA+xnHXb2w9PE46mchxNVlDTOREi08Iu9UqcIVvmrRqYn6VZQHOUPgMAr3hsMd2i
         nrlH96zht33OSknEMA9avjOYyA84ZM+gbpZegmG2yqZR7N9MVzggabVF7/JITFrx24wu
         +W3ZbzSWJOMaaBJ2NmJWpJAVCpPxm587EAhTWHBdyCLv+muu5c6T6k43tHQEQ+ZYec/Z
         NGRg==
X-Forwarded-Encrypted: i=1; AJvYcCVZMJPevMMDHzggwL6n9igtSquEMpLi9nmrej8xyBvNbC0y4FtbWPhjUCEaUGZOmz6CTTSqekQosTUwFgR8@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjHpbkCAkWByfm+n4QG5Mps9BJZGRQPdJISNl5g2/t2n75csn
	wCRencvttsiJ7RKVWXoqUvtgA9h5KKTOcp0YZlfEO3MnOu9PVo6AJcH3MveD0S/gC70=
X-Gm-Gg: ASbGncvVKVXwEdoQ3IM4UlN5udvuX3c4o2UBqpBNt7tuLcfnkw2go8+VJRo43jTumj1
	NWxHjQTnyIvQazgHiqaVxRADGPMio4JPFAfobIMZU1UTQz65Otmhwww2+GB7JisYQb1yBrLymTv
	tlrCBxky1/a3NcSKLJY6J7vD+BwOlUUDuMlEbCQ9RHwvq5BUJijESSoiLCyqtHWwivD/aezcq58
	qiEkqXlVU5zrytOxFPSlqjmjY4jpqe3x6X28lB+Wj7+zF5XuYQf4WH51m+Hbf9HY3bIHCTAcybc
	VZn2aFfh7Q9C83MreJFES9pMOhYT/9fswEQqxU67jFgV9N0BVWh+P/jklT0IDfvkV6UfwEQEgB/
	9GgYFvEPyewg+dwJEq5SJAczAnaPPs6GLTa4exVEA9CgqSfZIXFLjDHydvofwGaeSQhfZjDKnfg
	==
X-Google-Smtp-Source: AGHT+IGyxD6kxKArelGRFtmyoU+oQyoUCEToyxb454tLZ6do6Faoc5fje7htOPBCBaso+JeJcI0k3A==
X-Received: by 2002:a05:600c:548b:b0:46d:996b:828c with SMTP id 5b1f17b1804b1-47717dfa90dmr28285375e9.10.1761655105404;
        Tue, 28 Oct 2025 05:38:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm21087888f8f.26.2025.10.28.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:38:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 14:38:19 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
X-B4-Tracking: v=1; b=H4sIADq5AGkC/x2NQQqDMBAAvyJ77oKmDTb9SvEQklUXXNNuUCzi3
 xu9zVxmdsikTBle1Q5KK2dOc5HmVkEY/TwQciwOpja2qc0TOYks6FUwn/ANSdDHiMP0k0WxJWf
 vIT6s8w5K5KPU83YN3t1x/AE2YNXUcAAAAA==
X-Change-ID: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Mf8h+h03L2bzW9mDWJu5js5WAT5mXmT3aoXz60/jCXA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpALk+kUF8P0aVK/w8f0AM9SlSRvIOPU68KBcGK
 PM7XHH7f1+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQC5PgAKCRAbX0TJAJUV
 VsnWD/9BDr2abdk3/NrmmBGMD8VxoWsJxnPo4WRfEjpZxhrNa0p0ISrW79FWqyUm35dCaVmQFvO
 wCiGBC3jHNfOYMIdWGnMCJAP7y9uttfzGyWW7j494avIDvuQKTa/IFQoUa+nqaHa0JdOklX+nPl
 OonLpbwdsJ/6tjmbnIyVG3lqeas14RPcZ0rKKS7SJADHJDxVjIKKpF1mgqpwPnr6DLQaqUxXW1K
 0SApilA0nJhYIT5fqkI3i2lBE+6FpcftOIYxyx5ce8PSRZz9zLE4QKCtuDhIVPZ752RHj4f3z86
 wAAsUkqK6tIk5n22bAY2awmTSp6eggnWs1EiHqgkjyohDOsqMSah8gQCnA8bl44tHEUkYooNJj2
 GrBCKGJEqdkiL1cBOgvSk6WPPGtaGAVq1PzyGeo7Rwzs21hEpTJZEbGChzpBjXoyUnIdf8878S/
 6Vfjl+nOB6ybpcRBLICWuQD0H7GxD61mJTWutk6NuBtjaB4DerA7dDbYk0IjNSkiaCsmoQnQoAI
 nCVyBHKU9BYfkb+raWMcy2rr5IBubLD4ZBqpVs+auH3UXE/dtTIzWhc+CsewgiMuJN1E+GRQmIP
 eBbJk2HseHGPuxVxtneYp4l45JDvFwng9ST9WfAZ/S1RISXMMJNwhXj1VtSmcfOcGQWm96QvGTl
 V2Hx3ejMmtlE/uQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the Glymur DPU compatible to clients compatible list, as it needs
the workarounds.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
The compatible is documented here:
https://lore.kernel.org/r/20251027-glymur-display-v3-1-aa13055818ac@linaro.org
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613084ffdfbe685d4406a236d3b4b74..c21a401c71ebe768115364bf282dd324f8222109 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -367,6 +367,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-gmu" },
+	{ .compatible = "qcom,glymur-mdss" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


