Return-Path: <linux-arm-msm+bounces-47326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B45A2DED9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 16:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834AF165141
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE45D1DF75D;
	Sun,  9 Feb 2025 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6yNn3k3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6094D1E526
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115595; cv=none; b=n7Rx4Jova4/FZp1dbpIXd4sLnm5h4pYnizTyKWd181t9W/IUxeI/feZjW5DDS3vR+As8oGdSsQhf0LyULBzFzGa+PNzXY+qNy8n5qft9oBk5fejaJySS3hFzl2Um6K5k4fi/ZTF9RNG64lt0RxZIhPPRzPg+QKcfP9m9bnxIRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115595; c=relaxed/simple;
	bh=cARFp4SIhGtLx/eCixlAl4h9ZbuuApwEVo2cNQXqnyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d8wJhTsFgN0woFfmfPoh56amNk9YPqdQ6Aw0VHF48c7MiHAZOhgvSim09vN1GM0ErIkyD38lOXPmdLk9DTARhnzHdklG2iz0AdzWrzK/cprSDKyc0SlOfAh6S0/umVFTkS2+shZqHJjRTIZEOu3rTu5wVVw4Ho2OJBCfoHJ6bP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6yNn3k3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f74c4e586so14137715ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 07:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739115592; x=1739720392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/kvIzQrtuFWagP0ZFJ0py48diq2bMBbEg8k6AGhhM8=;
        b=O6yNn3k3+aebmvrvgNfgPOSc57qDwnRQUTCjhtMWLyhcVL+JcRBYg26nzo/ggRWgB2
         XEWb1E/D08PAvmDUlkgYyFlpRU4Ge9aZi7WAD+NlJzbLlAlnSII/wsxgE3efJT2sP6Ux
         UU7lYVtjgd/ILuFQGhStbxB44fHEYt20Bbuasz9pfWYUwh+7CLgwIdWFQ29ZnsIJELfg
         VS/x3Jiwl0Ij9jRF5J+lSe2xYm6AGGpZ2VLsvNh58zLnjNNjiYFPGZdxj/z4xVY1P6Za
         mn5ysgBxLQ2RqV4JJbk2VNHTqBxlaTIfaHODQ8NG+ce095O8ULTe3PEDr8Ep31bdI+x7
         b2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739115592; x=1739720392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/kvIzQrtuFWagP0ZFJ0py48diq2bMBbEg8k6AGhhM8=;
        b=eeHR++nAGPnDUG6CfuwQZy+63Qw8AgqiGUub6eETqpYanWZE2pFMRE8loMcbmw8NsW
         6s2Y8hzrCjrsx93O1R3TOLLGT6FZN2YeyGsn9RoNLR7JOJ144+0gMR4ZtnSNgmsdnPJa
         IG4TtPj6Tqq1Dj8vohxyEKV38kZnl+ODvg8Q5HDxfLj5+q/jAyqwfZjyHKeAeNpCNePH
         hyD/ub0hskItGPs0+//aDkoIyV6Tbi/H9A83tXPJDAgeq7N+ZIBfjBsmQZEfsTZ3ClCc
         LsdHvj4WSYJ8ZWbbmOLpe5i5ePnh6YeF7xtWgJSVMm3WBO+DGYOGHS1eNTLwCu9Nnf5b
         hR+Q==
X-Gm-Message-State: AOJu0Ywvm2LnA5MInu0+dfWavwuonoJ1wjghnP8PYHb695JzU0MHRgiH
	EQEviYsrKl79RT52f1pp5vGvVs4Nax5NJW+NysmzoaPB4bU6fThLVZoV2Q1uvnilalXo7IqXHXY
	=
X-Gm-Gg: ASbGnctl8Vk+gzPJqHkIXUjnBT/CxNiIKNV30l38Bhyj92MoLSzYd7I5KAqRNnHLoBj
	bhr3IJ0P6uTJYk8bTqBspyu8Xn7UK5+S48rWaHulzEXh9yIE5c/DqoY2MJ0DK5hLEK60SJ9k0i2
	j9ESGwwC+0znZ68iQuttpawkxEgfWioGd0DDxVogSRAckRkWspIOWRozMUaLIxZlgdeXqI3qyQ1
	ry/IijzP1wz2sVrpa8/fv6S1QIvcrz2dncnZaSPy7vvwsu4nwUTVquLjh34zGTYtoWoyxzE+u3E
	xgfyCtnx/w8XUHKmdSdn50kOA8esaYtIEwbQLLYE4K19Hw==
X-Google-Smtp-Source: AGHT+IF4pqcL1CA0s4DBaR/hb1zv6OAkpbvkONKhQYvXu/1axVV/kqi6HnIszoiR+HbDfFDdXVaPxQ==
X-Received: by 2002:a17:903:285:b0:216:2bd7:1c27 with SMTP id d9443c01a7336-21f4e746605mr166465975ad.33.1739115592714;
        Sun, 09 Feb 2025 07:39:52 -0800 (PST)
Received: from localhost.localdomain ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e0casm62105095ad.174.2025.02.09.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 07:39:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add 'global' IRQ for PCIe controllers
Date: Sun,  9 Feb 2025 21:09:40 +0530
Message-Id: <20250209153940.3489-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'global' IRQ is used to receive vendor specific events from the PCIe
controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..7355ef9bac21 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6421,9 +6421,10 @@ pcie0: pcie@1c00000 {
 			     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi0", "msi1", "msi2", "msi3",
-				  "msi4", "msi5", "msi6", "msi7";
+				  "msi4", "msi5", "msi6", "msi7", "global";
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
@@ -6579,9 +6580,10 @@ pcie1: pcie@1c10000 {
 			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi0", "msi1", "msi2", "msi3",
-				  "msi4", "msi5", "msi6", "msi7";
+				  "msi4", "msi5", "msi6", "msi7", "global";
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.25.1


