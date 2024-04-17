Return-Path: <linux-arm-msm+bounces-17764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4888A8CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9121F246E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243173C068;
	Wed, 17 Apr 2024 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTTx1rE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03D3B1AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384429; cv=none; b=Vs3lQ9wZC8rTBEjLk0aUoFqqy6byqwFqnrzdNnFKWR4NXfx+ZBSYO/rQFQ6pHH+3oH78RBQABCoXHUqd08YDDV0RZo+sez1BjjPhmDRGvAshAC/eA2tBCLegIZJ3t0CU/CPb0psXaD9QJ767lKPYCpi/ZWPNBhhFwpd6HOpvIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384429; c=relaxed/simple;
	bh=K0ao8Vo7sPBfbnwTda3s2I9W96Cl7inckQMbp1qX6wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b216gee6/VcEf1qREQ10uRkFAeJhtZupc3LQzKBypqk8XHp7d2XWo76LUro65cSOFP9Qq2ju3WjRPo2ODfAFEBBIWMf/KTO/L1h8RoO62TYSBqgJ9+ZpYqYUWMMHe/m390AMHosvEt9Lh0hKctXo0hvSmXn2eaAB9qFwzCD0zkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTTx1rE/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso57373e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384425; x=1713989225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/wLorb8s/wxRn0nx2P3JnCqrMElCXyUmbwHbfSHp1A=;
        b=KTTx1rE/e0/MJ9ANl1oSARbwv8W7ncBoeGOJX7bNn12ZxzKuQRNcDekxBHw29w6cc9
         YSvzksw11PSlkWLKe010gnfmXoiTNoy0pd9mvKlmb0IeTZVyGN/nnVYkcdGKHwho41on
         4kh2fb2Ra8tQfS46BLOPAQOXVe9mT6OTaRKBJqWDP3XhmlK9ZImcE3uotU670nUb72EW
         CNZKM09h4ySvcSc/muU3IXDW8j1gQqLIM+waStnMb9I5lA/0dIu5LFzJQe8NzXD0xXcO
         g8a83vWH402yIyJ/igUeXrDzZFE2WjssOLqIbuVpTjZbQW6Vs8tWDjOFLJaYwRYX6Pt2
         ld2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384425; x=1713989225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/wLorb8s/wxRn0nx2P3JnCqrMElCXyUmbwHbfSHp1A=;
        b=aeGMhiwi7YwwgJmRa/X7HlLTbqeBNnNHHcM+oe8oWMpL9t02s2OIr/Pjh7zIh0cmHz
         fDr4Xfq0nh89+6X93G8vNR+NxhdXQf+MF+GS7SgGz4eCniEnfhrFe5NmLt+fhMiv2uk3
         ZmFBm/XK16wAB5soQz3PcpWrJLTgP4dnRaa6k3UQa9AkN8lCBmmFJ8/28mfResuS1JvL
         vdp73QVcz9OhP3MpVQ4tuJbDSfFmxuJcyNzjJa8yEFI96hSiwdm/XgQAVMSqVO/DUXPn
         r4Vllw6pj523IDU3sl1yJyq8e/d4+VdOGlDVvBWve+tJmXX0BRjvzFXM/ETn+ZHY4uVA
         iBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWikptIUtMxIYU4uGNVrncFyVQTmU+ZKGiBp5FIjdINMvtyC3/rv2S7lg5gLwXwiZ9dj0T1B5+HqAnI5D2n4vws0Z+MS1FKoSPnJBUVbg==
X-Gm-Message-State: AOJu0Yw9KDAS4WSAuEeKnUKmhM71j5Qr2kMzy13ipSPMbMQ2ctwrrBEU
	kCKjGVjfBDZHmSOO5hNft0TFPdnpZfDQ0MQbowpeZRmqfwykgy+cs7E3gRW3HBw=
X-Google-Smtp-Source: AGHT+IFhc+YiEEchmcEnwplLOB4LzpFRorv1csY8s/d98HoFZzUavjGEBrTgxsRrSSINY1ECFOPWKQ==
X-Received: by 2002:a19:770b:0:b0:518:9ce1:a5bb with SMTP id s11-20020a19770b000000b005189ce1a5bbmr221524lfc.54.1713384425537;
        Wed, 17 Apr 2024 13:07:05 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090615c100b00a524e3f2f9esm6128057ejd.98.2024.04.17.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:07:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:06:59 +0200
Subject: [PATCH 1/2] iommu/qcom: Remove useless forward definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-topic-qcom_iommu-v1-1-fabe55b3b7b3@linaro.org>
References: <20240416-topic-qcom_iommu-v1-0-fabe55b3b7b3@linaro.org>
In-Reply-To: <20240416-topic-qcom_iommu-v1-0-fabe55b3b7b3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384421; l=1236;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=K0ao8Vo7sPBfbnwTda3s2I9W96Cl7inckQMbp1qX6wI=;
 b=6cYUGa8Goag8a2aUNA1eqwMKeX2FK4TOEyCqJmO8C5udyr+6wz+22OMrZWc39n6z6JZ4MLaC1
 WxHuDRgmVY8DzAUtW9uZqmUkiiUQkzrtSPCIaYsmHLZi8HP7Tni0oxk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Simply move code around.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index e079bb7a993e..3dca9293c509 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -41,7 +41,14 @@ enum qcom_iommu_clk {
 	CLK_NUM,
 };
 
-struct qcom_iommu_ctx;
+struct qcom_iommu_ctx {
+	struct device		*dev;
+	void __iomem		*base;
+	bool			 secure_init;
+	bool			 secured_ctx;
+	u8			 asid;      /* asid and ctx bank # are 1:1 */
+	struct iommu_domain	*domain;
+};
 
 struct qcom_iommu_dev {
 	/* IOMMU core code handle */
@@ -54,15 +61,6 @@ struct qcom_iommu_dev {
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
 };
 
-struct qcom_iommu_ctx {
-	struct device		*dev;
-	void __iomem		*base;
-	bool			 secure_init;
-	bool			 secured_ctx;
-	u8			 asid;      /* asid and ctx bank # are 1:1 */
-	struct iommu_domain	*domain;
-};
-
 struct qcom_iommu_domain {
 	struct io_pgtable_ops	*pgtbl_ops;
 	spinlock_t		 pgtbl_lock;

-- 
2.44.0


