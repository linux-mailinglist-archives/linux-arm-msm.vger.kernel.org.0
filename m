Return-Path: <linux-arm-msm+bounces-21741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE428FCAC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAB931C22E51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 11:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1527193082;
	Wed,  5 Jun 2024 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYV0gazN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FA31922E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587818; cv=none; b=WR4t7Y0sQJAYuptGCV3t/WhpE8XQLkxUkkRLrpIwOMUpPz+dqgqbuYjX2TWkneTCZk7GQpkU6OzdjuQIS++1FVs39gJjGY9E7goKzmMCHf4FOQNm7ka+yKBXKW4VKXkl3CIJSFoHTCBjO6JIFVtLxAbbBwHPKzZ5dBIrQEQF6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587818; c=relaxed/simple;
	bh=0GIPaRevDNRx/wPrHhuPUBfNf5OKm7cQz515RQ5q9iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EvFGbRHXWS5Y2nGEJbLFQSpadDSfc0oODaMySkUTiQIElmFJqTqMLb0tsG/5IvZ7wDbAjhGQ5hsvKo3JgYEjJ+CQos3QimPMd7W8ej/A2CSXl042eUbiy5DK2PQFhnRRx9VnehZPKnQr2Ob5q4/G1gG1Em3ZJeecfHkdjFgaZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYV0gazN; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35e0f4e1821so4581427f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717587814; x=1718192614; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3j6XQTmAPHANze14GjdABlxabfBKYaZBM898HcyxrWw=;
        b=eYV0gazNfe3MrgHj3eRSkcrH5/HMFcKXRwfLvHhl4zvUJGml7iIWDPNmU0F5OMlmdi
         vElgggpgyj9GzuPniq04BUQ5F+pab+zcJizvVLHI79XR+DCtO0Puq3T6NKO+91+j9E9G
         8J8DKa34KOYFvkQszYtTOuQoBYiK6CbKXCpzS8/gH9fafgXHATI4W8T9OEDi/Mcm6LNs
         XpjKpGoL5L1A7QjiY2j4SDkS376/jfldHGRxEcYZuoPKpJ1zmb2IHXiqfmaR4PYUdY+I
         PHqd/9B7SX+zANE9zpPbgRyCXIceHrpIYTfpCMiRbvPOhcuYWlmHKgf5nWdVpRo0vXBk
         ED6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717587814; x=1718192614;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3j6XQTmAPHANze14GjdABlxabfBKYaZBM898HcyxrWw=;
        b=ePtm9ZjAjG86s27IPKvHAMob6MlSYFNJsrBHAiKm2n3QZLmzRWzqecQCgpjfNBekzv
         2CVmiOWItz/EZOyIzLVCKlCtDJ9jsT/p0su9GvprJPTaBBvjC3iccxrS70kQkuCoJhJC
         ZTNVO6QDk+pX8+STnIbPuPuAjfTs2QLPjv2sHk9NhPRQj8HpHAOBxuEklUilKejUVgvC
         RMhTocGD8I6NHYa9UNMxu15pNWd3dTiKkDfZy5hSIUflQ2GJ3Rq2E+UmbBYqs9aXxy7a
         85y0kfia0KFsYh2KB98XxQ9owPYImx13tTMQsnT9GjjK+B8msEe9GU8G47Ji+8Zq87gR
         V4Qg==
X-Gm-Message-State: AOJu0YyZcCjr0AQElIwA4mxgKhKnWAQzZBPh8ihbuakga/83BKv6zmDS
	dCMFO0NA4r+SOU63m75140xnfMWnX4tFAPJMaaFayB9rxso1vPnAC7M0A1b7B8E=
X-Google-Smtp-Source: AGHT+IH865p66lw4x2LZmxMYuezJKKDWUoV3nyY8R7CoXx5Z6tfcfp/lXHlTMUzuQCTJ7LOEh+GS5Q==
X-Received: by 2002:adf:a1d5:0:b0:34c:f507:84b6 with SMTP id ffacd0b85a97d-35e8ef1b8dcmr1744590f8f.41.1717587813594;
        Wed, 05 Jun 2024 04:43:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35e7dea1c3esm4851633f8f.66.2024.06.05.04.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:43:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 13:43:30 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650-hdk: allow more IOMMU SID for the
 first QUP instance
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGFPYGYC/x2NQQqDMBAAvyJ77sIasqHtV0oPEte6lJiQVSmIf
 2/wOHOYOcCkqhg8uwOq7Gqalwb9rYM4D8tHUMfG4Mh5CsS45qIRLd0DE27F1ipDwnn8ouaUNpz
 0h+xd6B8UOHqGVipVmr4ur/d5/gFeWorgdQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0GIPaRevDNRx/wPrHhuPUBfNf5OKm7cQz515RQ5q9iQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYE9kMjrsnWiE7WNIsOTxBIT23x8cQNKw63fdqRV0
 N8aPqS+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmBPZAAKCRB33NvayMhJ0U0rEA
 CIAr0gdIreDfpQx/XyHMz7lbQl8x/UanWbfUkmzalRCEaEZAlBWxi/4UOCyur2voJhc/SPMaDh4495
 nr0cZPngFtJcWIH+eTEFydDO9TU07k0FpJv80SJXPxtsevNbCQRCLFbaXHEZ3Mif+K2KxXQgWCWp1I
 OWAkX3GQmin4S//a2E47UFCAD3HKQ7ZAyoG92Lzc66WNmBj37qjY+kyqlyymSEcWKQejqc+OMrNG5t
 0D38zv/WoAtiO5kHQJQUmVa7sSBmHgS5/nHaRA51VmuDbRufaUQ4O/R5RYtX1AfX9wvpVB1GtFa7io
 19ngbVh+Ihj7ZIwUYZA1eB2HprmtxkNC9t4Elg+Cdlhr5Z8TWCgItSEmFD/omzS5y8GRoQNBIVX0R7
 eFqxRRYI6eYnASqO9hHpwRvgLFHkvI5W9IjKQdhg5g2ovTM6YEnLQumH1/4v7wgx3R/K4OVm/YwRJ5
 Z+nMnMlIGKipmAYBbImQj8qN27SIeIi3t1PNiRu3pf7JkLIEWImoXwWa3vCG/+EVgHkNbT+dla3BeL
 06bPKaf2Kw2zyyuE4u2PNImyFdb6ZDajjQ8g3P78ZJX7uXk2xamuAC3ZKRFV1tCxyONxSqSBL8dtia
 nB8StI1o1/YhLd02p2Bs2aN4LBjOOr+bxH6qw9uE9IN3yVav/8ZEoXj9z9LA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When triggering I2S SE DMA transfers on the 6th Serial Element, we get
some timeouts and finally a fatal SMMU crash because the I2C6 lines
are shared with the secure firmware in order to handle the SMB1396
charger from the secure side.

In order to make thing work flawlessly we need to allow more SIDs
while running our SE DMA transfers, thus add the 0x3 mark to allow
the 0xa0 SID to trigger while we trigger an 0xa3 SID from Linux.

This crash doesn't happen on the QRD platform since the SE6 is
configured differently, with FIFO mode disabled, thus GPI DMA
is used and we cannot exercise SE DMA on this interface.

The crash only happens when large tranfers occurs (>32 bytes) since
the driver is designed to use the SE DMA in this case, and there's
no way to mark the SE DMA as disabled or mark the GPI DMA as
preferred since the FIFO/SE DMA will be used is FIFO is not disabled.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 182864a3b6bd..5887d265a077 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -991,6 +991,8 @@ &qup_i2c3_data_clk {
 };
 
 &qupv3_id_0 {
+	iommus = <&apps_smmu 0xa3 0x3>;
+
 	status = "okay";
 };
 

---
base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
change-id: 20240605-topic-sm8650-upstream-hdk-iommu-fix-542619065c45

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


