Return-Path: <linux-arm-msm+bounces-24809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554691E530
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D6228244F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B785C16DEB9;
	Mon,  1 Jul 2024 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj7XViuU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3E16D9BB;
	Mon,  1 Jul 2024 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850848; cv=none; b=qF4h1lQ/NF+Noe/7dka0qhZqL1wta7pCKnJpkYMVRiEHZWxi10sM3Z9/KO5NBDbvBovsyOg+GyFEyhSep0nkwPTpEKS9frCVf7rrg4SXo2Y6r/vn07Jy+VA9oaiw6Iv2WmEJRgyhyR/m1dvNg7t02lJnFV0WJYmH9e6Vw78nZ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850848; c=relaxed/simple;
	bh=S8trBRWU4Awt2Hdyx4x16x7C3F21AJMjvj1VIrEa89I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAqJo0v1VOXrpDjeu2TtIshJ63LeBnm6e2THRfNYSyTUd2yeMNDPQc4N0ZPerz8dUstejzCefoeX0g+671dwW3bTVW8KJoCabgjctSzjNj2T8l1RHdHSJ+N2BXm0ueGb/QBb+60UThIpIuY9GuVpO5vjii4hZ3JtSplnYbLzlKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj7XViuU; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3762eadd807so11338995ab.1;
        Mon, 01 Jul 2024 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850846; x=1720455646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWZgmKDZRrdhr1uUXK85/zqvq+/aZOrwP+oxnXRYvAE=;
        b=cj7XViuUm4ziw+N+pSaPRWG/IJop/My+n1au47WpdrMBnJ1eZLzgx2Yhlimd7UjHgE
         MPKrJ+B5REOmJUE3U/Aw2eue9IkZYO5BlCeE3gyAvRsnIU9iTZi69bnYQFUusCMuJedk
         ACbt8pMvtFE3/WSk0M04HvOkILiF1OPWaAt7py/l4d9Nzh/YPbV7XO6UXSSAvb3poPJA
         96xBbhHyQjogG6uG00XH3zkRfEW6xHcTUojAgxCtUA9KRmv7kFFjj3TI9Nn6ioYcwehk
         2RJK3MQkq7i8fPQkCrB2pnNSwefm3znFCMPcvLp2qP+e6fFD+XZmEnakfgSdnTPfTfj2
         5HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850846; x=1720455646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWZgmKDZRrdhr1uUXK85/zqvq+/aZOrwP+oxnXRYvAE=;
        b=gVSiXeQuLOm6YTtj2z+Jt+OKM7aTlxafWfnSiGqpLUSYo8MltKx3F0VFDyHMtZPQce
         ONxrIKL91deh9+R2EHKNv723rI9dNpjY1NjNKLqY50XpeOvTTRwmy19jKEHur2lTtTUb
         uxztRcz75u8kERZWGowlhX+vs/7pf7U2EwpkeEnMzCDcU0ZZAgVRAiEjNca0ZTHbULX3
         ketoAY9V9Yx9EnpzDSRJkTCmFLbAMhFPnkmGBAGfd3ICSjMdY2X0EZS3Xo3a2Sr7xp/z
         FJsxn4Q6xGSCUONMdGYd7NjYRJ2x26dllI/68NUZhti1/3/5LrbrL7srXCyOp7QaXSn5
         cYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhmfrwml8pw7osizGwoZt0DL5BXo+sQ14OyvZERII7qfgIhTRBeVRkyI2HviuMEz991xFCmXlDx+k+ve+KMSdUKhq0ZLQNkZzo1be0
X-Gm-Message-State: AOJu0YzB572T7MxZz7VykrBvqEviodtaYCCZwWnphsVq1FA1XXuSpCt5
	Wna5l5PCHlNXx87zMC4icxoIi51G0sq9fup5joT5n3D7EHa+jGBvGtqxZw==
X-Google-Smtp-Source: AGHT+IF4Q6jy5QIuCLxDiDWQRsnx6iHXwtvUgTE2lXBFYwEqB80Yt/8yPSYVyA6IBWuuR1iGqEUB/Q==
X-Received: by 2002:a05:6e02:1645:b0:373:7f70:bb8f with SMTP id e9e14a558f8ab-37cd2bedbf5mr95954605ab.22.1719850846207;
        Mon, 01 Jul 2024 09:20:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c8ec501sm5246854a12.68.2024.07.01.09.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:20:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Pranjal Shrivastava <praan@google.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/3] iommu/arm-smmu-qcom-debug: Do not print for handled faults
Date: Mon,  1 Jul 2024 09:20:11 -0700
Message-ID: <20240701162025.375134-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701162025.375134-1-robdclark@gmail.com>
References: <20240701162025.375134-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Handled faults can be "normal", don't spam dmesg about them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index e4ee78fb6a66..681fbdfc325d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -419,10 +419,6 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, iova,
 				 fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
 	if (!tmp || tmp == -EBUSY) {
-		dev_dbg(smmu->dev,
-			"Context fault handled by client: iova=0x%08lx, fsr=0x%x, fsynr=0x%x, cb=%d\n",
-			iova, fsr, fsynr, idx);
-		dev_dbg(smmu->dev, "soft iova-to-phys=%pa\n", &phys_soft);
 		ret = IRQ_HANDLED;
 		resume = ARM_SMMU_RESUME_TERMINATE;
 	} else {
-- 
2.45.2


