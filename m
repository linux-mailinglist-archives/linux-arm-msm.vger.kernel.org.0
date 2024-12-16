Return-Path: <linux-arm-msm+bounces-42365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AAB9F370B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DDA1887DC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 17:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947A9202F64;
	Mon, 16 Dec 2024 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP9Y8LO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177DA1C54A6;
	Mon, 16 Dec 2024 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369024; cv=none; b=YdMxTAp+Za+oBRs8vPXJNBVfeIxog71UUq//+uQgahnVE4cWmFcEpqgYyRUU5iicptyKfJMJ8LBjhILaOTmn442ANEw3cbX4SsJAuVk94mzzfsvXgvB3kvWQtcF23cyVMkGGbWyPoJVlz2T/8tC7Bd5qGGl7OwfvRRLXqOHGVPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369024; c=relaxed/simple;
	bh=3baokyYFvGF6TPpe6/8+A/JesNtE+sKXB2Z8P5colj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kntfbcRMrPEOV7yrgTfb45M4EFbgmSnPTtWjCzAJBBfukxzhFoW6dpaThDoSjDAYXN69aKSlemJNDOqbyy7pXy1gfhgUkIOxQp2zZBdgII8zf7rCptLG4xYV+SWLgFlLetQ/jLFrPi6S333VDFez19ekDrtbuBYi2ls/426NscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP9Y8LO8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2163dc5155fso37427065ad.0;
        Mon, 16 Dec 2024 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369022; x=1734973822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
        b=JP9Y8LO8+RqUDZy+h6YvRTtVDXBV2yQXYsalTM2Z6Hr3Ktb5yi/lr3PPeXrg3Jfh3h
         Kb++ZUuDKmFiTesqVOFeHNozoite7DAP1VFqqQxLsB+CU3JeeRqhMnVyYfONbQmr2m8P
         FVFcoI38bLEFY3Bcat+d9JEun866g03+nqnhbDOos7JFcbGGaXwqesEeqzgd9TJwCrsv
         ml1LnNEN1lIMmvuZx8Yiw3pP//wPNKC47ZpxrOLGjUXcQqG+BlVl6+KDoHsUuziU5TGq
         H2iK87TSXNTAn2gkX8HXGnuHlkeTzEe+A6dkeewmYgjtxjVoQLLn05IlSheKPYXnULmk
         CliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369022; x=1734973822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
        b=M0Pi1c4h1q6HtnlpTkKzhtL6zmF5p2e73mtXZwhZ+DrsujtmZNNPWPvKV84mYZ7AyB
         sieW7JiNPislpURrbqPQDX10/sjx0J1gGzo+P65j7qP7NBmfmNebaMgQFtbQgxN+CmUd
         R26Ez9NusISF1WS0fAo6t2pQ6Jc9N0QD5jYIkim63NSniFL/mScXp0sGh/zxJphtf8xl
         HPmddGGNvaUE32NPfhjvsIO2x5TxSv/0xtS/MI7NV7UoN8GpwBhXZdot6vjuVdG7ovUL
         V599TkUBCtrbrG1T4L+zCRrYvvWNIAhhuMyKALd5NSaiZHt2RObu3D0W4aqNxII8E79A
         kv0w==
X-Forwarded-Encrypted: i=1; AJvYcCVZnxuN35x9UJDMY5uBlVKmgARoT42dQIg1eXO8J/YJ9gjGsjjg8EkgYk7ejVojne6EICQkPE5EqdvAIkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmh8Hfjdg+pKE/8etHhboIM83G4l9W1sUbyM2G/fJA+7IGGhMp
	h9ULI+K3b9thphZK68iwMYc8qo56ic9NAqjsvnxwDBe7XEKLiF/2
X-Gm-Gg: ASbGncvpcvKMyHbBZJm4GDt7rpY42ihD32h2KlT2cv3Kwbu0JN+skbMYGVTGtKL087i
	lIEtQZThuF/MD2ITTe6u6bHJfnWT15IwXSsZ8s9U05S0hI26dS/FFbNm62yRM4+vvp1Zg09IV/C
	HaEYKBUGKUXeRJGTwbgYWUUCidQ150I4x/QD4N8IMsrifRS204RoKZaOe+H4d3ObbhyF/Isjp9G
	QMThbX05kT54VhDCaPOSQwrs8kPHJgN4OZxxO8aJbKjqfLWEOpNYS5ZBPgyclh99pX2cE5kut+L
	UGz0g7tkz4d2jYSTWYC773hkj00oMEQ=
X-Google-Smtp-Source: AGHT+IELBk5CES1wF4PHrucRwTPjdWhx8XVgyIQNlfgXs1jGjow9SanGNGa0Yz59QLbcpGn4/Q+npQ==
X-Received: by 2002:a17:902:c409:b0:215:a05d:fb05 with SMTP id d9443c01a7336-218c8dd54aamr3975465ad.32.1734369022087;
        Mon, 16 Dec 2024 09:10:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb4d6sm45181925ad.80.2024.12.16.09.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:10:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Mon, 16 Dec 2024 09:10:17 -0800
Message-ID: <20241216171017.4881-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

On mmu-500, stall-on-fault seems to stall all context banks, causing the
GMU to misbehave.  So limit this feature to smmu-v2 for now.

This fixes an issue with an older mesa bug taking outo the system
because of GMU going off into the year.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c4c52f7bd09a..1c881e88fc4d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	if (of_device_is_compatible(np, "qcom,smmu-v2")) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
-- 
2.47.1


