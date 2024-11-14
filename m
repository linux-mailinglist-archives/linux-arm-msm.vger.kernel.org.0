Return-Path: <linux-arm-msm+bounces-37858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E419C7F7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 01:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907821F23A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 00:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F85014A82;
	Thu, 14 Nov 2024 00:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imE9kxfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D80125B9;
	Thu, 14 Nov 2024 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731545257; cv=none; b=MIfEkcHdxYNclwUvWAYaVCdzBI0JditHFGo24lWZd0vLn9eNgVOiG2aW6C0FwDBEm/rYzpgKXVoznz7vX1sKwInU9MYnN3OdBe+CQK5cYOu+WIgbXCELarEePphxfCDojjERomsQPpo8QTttm7PtqLFnpDaQ+AI4YDZU1klnC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731545257; c=relaxed/simple;
	bh=IdsOiPVpkymG/J7+hE0qmbsOoZxpB+jRc3dtEEvfF0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Le/bUNplGZXOuXaEFTPtZVfzAdiI0yxrmip+a1/PRykvyyQAyc2Tp/afFlvQMWxC9Gp6mWS7cVHoDNto5Pafr1fyyscCcfjtBf48Xlfjc2fYxL1oQdeUMlql0vHPhO5i6MtjO/Adu0f5tNVp87rd1UiS48nW3LQhtmXsXWb3gEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imE9kxfW; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a6af694220so230845ab.1;
        Wed, 13 Nov 2024 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545255; x=1732150055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfeWIa2nRRaLMa7E3TxB2pqTwWPv20hKS0WKJTtnevs=;
        b=imE9kxfWvX6+mWjznUtqS7VlvBu+Z//55UR2p/jwRFfbVkSByIETGW+VV9LuPcVhAR
         22nbCW89lOQoNXHO6rsed1VjBnxF7lz2nBgtA66nbc98fM07SzxfJGxCyPpSHOmCXp6G
         DQge1FesnHlKjX4PAaAFowJ2RTum2vrNf2HxLoc54dW+JuOHn4tLa8hXgfUF3Lb7flYb
         /bXB+McjYGBtw10YR6wnbKJMNy0rx/JY1K9+hlyW8nFIMSruR3OotRcGu1+Leq7Kk+2V
         SjdkqjHCvb7w4v5kp0nKEv2/dA+P7qZv3eTH8ODUCYp8ihx8VhjZrgwDpOwaPWSND5TQ
         VLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545255; x=1732150055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfeWIa2nRRaLMa7E3TxB2pqTwWPv20hKS0WKJTtnevs=;
        b=iI8rAJXpz1GrtbKYJt7iu0k8tV1hXTDwAsu1H5odVT+hfWySphv6o3TXFaA1nRsGwM
         Oeos3IuDOs3VPsaoHkZe/cSQW5Jel0hIDPd783PoqTF1uIhBNagqRCUtY4ygkOX1WPdr
         mrgWFlVzG4Wm/t0smhpJ60maYvDp3zrkxySzAeacgPtve84TNak5ddijEJtfH803phtC
         nDti+lrayWPusKkaTcmnZJe4/NjYMxAvdXXvhGI+Wv4Fg3Of4MBAgLB45TSHNJe04WRZ
         V7XTnvs2pR5RaYXSh7LFVfabGsLXtuj5lTUW46WCO1Btfc6xyclsVsE5m/Mc9IBnsWIi
         cP7w==
X-Forwarded-Encrypted: i=1; AJvYcCXS4FgS+0CpFM1RV2SZOdxlC8Ren7cyJnpY7FaudkYN2CLXP+qJzPPerDbvblk0+YzeE/CO21kINXyE@vger.kernel.org, AJvYcCXXiqpjPvDFDH9aDumCRStiSR2Vp9ji7uWTX04FDPuF2YXNzGzEq+uV5Kz4+H64ncohGkHbIP5460HvstyMGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJhGwK73KOyS225Gz4GkP2gnqTlT2xnwS0g9MKXeqFSS3FqskW
	JWKp+JTjT3oyvUbphUTPVZrw/5KOBaqiCULuQMXEkc0rc/EsokgA
X-Google-Smtp-Source: AGHT+IE/YfqP7Sjx0YczZnwTlxJkpO38uTXKwcD4NS9fALu47F5QGMi2FVOxn8z8wQMbRGQuOsqucQ==
X-Received: by 2002:a05:6e02:749:b0:3a4:ecdb:d61d with SMTP id e9e14a558f8ab-3a71fe3b539mr4886115ab.8.1731545254783;
        Wed, 13 Nov 2024 16:47:34 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fc619bfsm5011173.42.2024.11.13.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
Date: Wed, 13 Nov 2024 19:47:16 -0500
Message-ID: <20241114004713.42404-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.

This IOMMU has the compatible strings:

	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"

While the SMMU 500 doesn't need an entry for this specific SoC, the
SMMU v2 compatible should have its own entry, as the fallback entry in
arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
unless there is an entry here. This entry can't be the
"qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
SMMU 500 with different handling.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4b..601fb878d0ef 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -567,6 +567,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
-- 
2.47.0


