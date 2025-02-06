Return-Path: <linux-arm-msm+bounces-47020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1C6A2A5ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639B516783C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1393B227569;
	Thu,  6 Feb 2025 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THGFrobb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197A22686F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838259; cv=none; b=rzUatVheE3g/NQG8XLLbgKx1RePNcC//GIWCA6xpgKwfwRJltE5DVQtbIN0KJHXs0SKhE8lSDg8oTsWO+HiLuUvrg1ZNSKPXQuIZRZ2SbaqUak/f2gaj6xJBeYSQMDo0MjWS4gcVDObqaZI8KQbt1qnpwRUx7SLOn+0VFdABdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838259; c=relaxed/simple;
	bh=MzJqTBbgVZikYINge+bhb7KDDv91pVxB3kwYflM5OHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V0SQ77Op9YHFseuWb15G7bttYVY+KGYBp2+vCGHpiD+UH4L0hvm9OHFkvW2agIRXq0ZIItG0Umifvpk916IIuGLPFJ44IK80B9RUwe7etgISjpk4fuaUj2Gt+g6aWrokjojpJhL3BjtYPrFDWFwOnZT07aUAxLlHlTiJORTUM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THGFrobb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so7107265e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 02:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738838255; x=1739443055; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDuu/5ae2pAl9B/nnmOid8arcrDr7kGudQUK+fpcdUc=;
        b=THGFrobbZOLPpyTYrPCvogOGK0zkbUtMM/2Yz3k/A1+pPClpoOessNAQapSn4OthZc
         qo59zpaHsDttKvHYg019y+7xl0Z9I/ZSjPcCIHjhXFkAHkvOw1GGKFQjjhmaXiuUC5xg
         ibdBInV1K1zukikvXv7BEoJ6jv19mkJJyu0MkYV14NL6WEn54mOH3rmizp/1K5kq1jTV
         HLWGsLri4HOrsuYnNNcE8Qv97kZgI6Dbsn4RxUNfabpjAIgRNkOlv2DqJc2qcqpnIqwa
         KCRybWYmtRD7NP/LQ1HS6fLUn4mqoJ/LwJrutb43H6Qoyp1aCYIr1WW+AUQor286uYbt
         Fhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738838255; x=1739443055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDuu/5ae2pAl9B/nnmOid8arcrDr7kGudQUK+fpcdUc=;
        b=iQyl/yGHCgDH9JO82lPtpFTSZylpS416bVgn7A3t7PvbYLhq152D4sRDYhEvymBxTS
         jkkC9Kw3W7OrEFDRSCPccwsJYPxsIeyO6/MpOz2UJCUixxCULEpDmqjGabU8RNW4WGQd
         fQkWwW7UxtGXqcsEkuj68q6iMqlRNJjEtGUj2mIec+kpQZ7PGWA/NXql2Ul70aqc+ecx
         SM6p4QzwK5Gko2HBAnxYy5JiUUCaxM1LMB6SBoiigYXb4MsOlUm4MsaPFjzNI1ZBE79s
         zXyvZDhRLn1rlXmxZe23fOhgt1QOGwhFOZkTLVizbKBgNfHjkM+H67ZL21McTXQiQ2Rk
         AkQA==
X-Gm-Message-State: AOJu0Ywk5hpmcgOrT7qmngaw+oW1Ri+aqZlCgLsF9N1RUm28P2Ym19Qb
	oRX9RYHSYkoTbqdl0j9BOuLEUzLn9MLX0E8N1qAvi3RfBJWAGotkYZPQF6Dz7+kEguN/9OlQHfb
	1
X-Gm-Gg: ASbGnct8d9KuYqO+rLJQJjLwJEQgb8Jumhy0tTaJxjejWP0MFxDGAX/sOCjXH8zuUrg
	bO+IijQ+kGutLUcLCCxZh6CbC1nlRaRc9xSt1hOhl9alVO2TsnoNrcQbGhMRjO3u0twqBJ13mi+
	dKDp1yCSrQ1dQ0ggwU1DrfPLEQ+XhoC069QQ9pH8+IRc8Ssn94URIl4QpsPnDdqsUCJF3D+tnHF
	gAqqqhsWycBblUdW3ixpZGsgDDARadsRMIFCNQ7fTq5IjZHB1CedNcTReeMonldjRuzCMJHxvp4
	wrOzzXqqAMXjeRA=
X-Google-Smtp-Source: AGHT+IHIVDvAZ9KeXkry77mCaFFi9ouZZbUWyjp2SQ2uFzjZsUsdi1NEo0buPV7KcrlM4TESdEMANQ==
X-Received: by 2002:a05:600c:19c9:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-4390d42e700mr50795305e9.4.1738838255209;
        Thu, 06 Feb 2025 02:37:35 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4592sm49995885e9.32.2025.02.06.02.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:37:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 06 Feb 2025 12:37:13 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add the watchdog device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>
X-B4-Tracking: v=1; b=H4sIANiQpGcC/x3MMQqAMAxA0atIZgNpRS1eRRxKEzWLSitaEO9uc
 XzD/w8kiSoJhuqBKJcm3bcCU1cQVr8tgsrFYMm2ZKnDbMSRIULPjLc/w8r7grN30rBtuO8ISnt
 EmTX/33F63w/IFxdzZwAAAA==
X-Change-ID: 20250206-x1e80100-add-watchdog-fa8e3d23d760
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8Sbc+9AjrkQTbCMtMMCPQAPcIf7iIHyukTUIWEOh+Rs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnpJDo6bB6c3SE4b4sty/ynLLRh8FoK4/mhIlPh
 aEjYPvfHUGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6SQ6AAKCRAbX0TJAJUV
 VpFlD/0RcRNFyKskPmOZGdfJ6wlhOK8bdJzD/4oj0t3qW115KMecwBLdABzi4VZwYKcgZUqBBLp
 nsT6osKBBZU9F14X3w5mm+JZfNUAuth5pbJ8LN0G8jIbPBqJnURGyr9Jc3lf2oS218sXNIqVtGM
 +6hgmVc2h7cFKO/MWUxhEWiDHYQXGw4mB/QWCXDXQhUlofaGEQcsKbDJym6jnzzbG1ReYfpoQI9
 SenfGJR0gq2h5M+PP5RZsXmj9kzDg9ashdKAYqxnUqA1hNeeZgS2nF2wNT6NFo2JhgIArpyL5RP
 8/F/V5/rnftSaEMCxoBWg6ASCJSyHmN0jUYy6EEWTS0g0FeOs2Vgz2lp3sc/Lir1L+6N1RIKoZz
 9Eo821r8NFCLavqN9LAtuCxVc19Pfg9qXIAo6ytnqRUWcTCWK0JLvgz3TZ5YWszXUeHm4VDCDol
 +O5mY5j4x9PV+eDshwg9a+P+G+pQjXBrFE/356j4sRPGZrPgRpb9ujnjsH1UJJ+0hvnF+Sx5ZVx
 Zb6GJHacS5rgy86nNpYeGIx8swzgmW5If94zwBZwvn3kdkFQ3J25SwIvJuYmsk7HFMCZ6qdeU6q
 XPmTd/ZB3UP07xHf1smalfUOrIYclcntoFLCrJpsVeQ/x+b1iOhyx4nCHhcBpU+4RjKk+sw4APF
 NAnC8G7rZI1NW2w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

The X Elite implements Server Base System Architecture (SBSA) specification
compliant generic watchdog.

Describe it.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..007815699e4b9137c3b5cf72263c9dd3a64e6bb3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3708,6 +3708,13 @@ pcie4_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
+		watchdog@1c840000 {
+			compatible = "arm,sbsa-gwdt";
+			reg = <0 0x1c840000 0 0x1000>,
+			      <0 0x1c850000 0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0 0x01f40000 0 0x20000>;

---
base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
change-id: 20250206-x1e80100-add-watchdog-fa8e3d23d760

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


