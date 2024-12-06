Return-Path: <linux-arm-msm+bounces-40800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD99E7443
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2A516BE7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4238E20E702;
	Fri,  6 Dec 2024 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bN76madY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968E20E33A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499188; cv=none; b=cABLibzYHgE4eywzxqceD2I5HiRsuB62BRIPz/phxP0VAkzjtnzA1I/BU1yPiP3fFcMafIuAdddQEQAcjiTAq5iXnMW6lL1Lj2mE1MCWrX6tWhGxtzVkYk8nuUQ7E+gsrF9fZ9wsmi85Q5kMojREoblZbSEf86aZFQbTtbaT09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499188; c=relaxed/simple;
	bh=YbzJyTv/oTBDHS1yAIVmtG9Pfe0m29H12bVn1RFZ3Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2cL9VSswop9SaxFgDN6qBYI9Blu5Cf3A4wYWdEQkhI5lQRPj/N831E2YFMGFBYLJLdK2OuAt31MgtA5vEvXXx0OCZSgObFaA4/tnzR4g+abNhDUAX+osKlNmRWtbizIhQcvSjQqO5Tf/9GuLw2nlsBiP4RjkqT8FMIZdFNd19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bN76madY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434e398d221so112625e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733499184; x=1734103984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxLilH9bLiMPjJPMsLhe62iLYudDtWX7jg4MWEe1Wys=;
        b=bN76madYN2Mt9+A1/zPPgWsPI9Uq+WLlbRMGdptdTuZnMoX9sWq6CAL8yAiNkVdmT+
         u6+/25U11u7Or9z4moUpgTqdYfg4z5XLalLucgn0GiMQsvWjZZdPzqYdnHFxY/zB/fjl
         BY/4RIX9oAfPyQmWhu3c2ffqx8K5eqqjQdCLC31ADvYzeA5oFQsjAQXbQNNQy2uuSiHf
         f421/GXXGx1ym7U0URSZ1P/OMuMfD9z9JcXPbNrkYFrvw5BUK+uU1dCqzjBmIO4EHw7c
         SrcsAxkbD/TY5xrnTD9IvsOOW5KpeIjoriroF/2hMiHJDE5XVG2chTiC1J/KYE8/fNZO
         4LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499184; x=1734103984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxLilH9bLiMPjJPMsLhe62iLYudDtWX7jg4MWEe1Wys=;
        b=gMF3/O63epVn43PyiBrRUQANsnxZG0dVhYRgQOLtRMzEuuFhkiBvgQLSmLac2vJIsp
         9EvIdcyz2DMRE4TYyO5VieDtQN52dEifnGZVdvj6dVbEFHnmjZX2Mpb2PUbsP8d+MXKu
         o2w+HZtKypPQat4zMqsjD1UzP/VjrQ5367w7ZnZCoTtK3clj3IGln6u/Skq47YRhbEgW
         WjdsE2PpYykUf0bMX4h7ZoP6cN3ra55FbgbE3omJCb2rxMJQeVseqIfzHjra9ErxYUhM
         outR3TBtXRSNb77kjzPfgTYhb6nZcqAPQBoRsMUwNBbZ/qOWGm5TAjHFWtqXsR5MNYZh
         phsw==
X-Gm-Message-State: AOJu0Ywf1GxLb4MK1xUMA5fhXiStv2s0DvqUd0goHklcTYL2+h1QDuYD
	OMnI9bw88JXQtRoTx6K8W70ek3iCu7JQ+W3YRI4LNU0MUDpiEG5NW9WcXhAbItk=
X-Gm-Gg: ASbGncuKxx/YNODHnJoxkwPiENeVVPD0XtMJciQFVA14fToKiM4wCOH9RNcjQ40r7MV
	K4OtSvtxYeSukoKxdpye1kvHcoTCS5U/Zd8El64TzcuUVyHWLmDmEvkN41RP06gr3op8gHqcouV
	YR+P5dCA1KmuVc7vplPbqd3RLjIm1fSufjGGD2+Tjm0so3IHkAxTeimwAbwpq3rSfzjiIo3DrB3
	4H4l7f3PZrxA4wErkWaY9LKm2umxAzHQGRLQESRLp15AL4RBbz1MQVmmNWjzO1H9Q==
X-Google-Smtp-Source: AGHT+IG/VAhXZnoGXOnDEIW9ftM2ZM2FPS1lrP1HyDeJwJANTrBVm2ZrnFq5fp7A4yZz4UPekl0OCw==
X-Received: by 2002:a05:600c:1386:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-434ddea7919mr12495145e9.1.1733499184662;
        Fri, 06 Dec 2024 07:33:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm61158035e9.29.2024.12.06.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:33:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 06 Dec 2024 16:32:32 +0100
Subject: [PATCH 08/19] arm64: dts: qcom: sm8550: Fix CDSP memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-dts-qcom-cdsp-mpss-base-address-v1-8-2f349e4d5a63@linaro.org>
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YbzJyTv/oTBDHS1yAIVmtG9Pfe0m29H12bVn1RFZ3Ek=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnUxkUIN3YPoGxYSFq4JGa3HxEIGuSgtmACqK/L
 OD+p4WDwKeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1MZFAAKCRDBN2bmhouD
 16KeD/9IAl8RjhKYTokeVJApO7vVrOAknRXcqnRh3B/yrWo6v9hvKoSHu6wiDzYpbegm4llFygG
 8R3ITsRh6PwR4o1GprrcpwEnvMDxYvrBcQH0lNFWXabtzBz7CNoTAb5qpQzF2gJDtf2zrUvz0oB
 RoThUOAa0dQB3F/vwOd4/3xiCcsf9iJnf6TEmFNKuxWUxWCdvpjs+otoHrb6RSykxdTGIMDBYtN
 PnDq3QKLkQVa+2+gSOpxljnzhX1Cw2Sv4RQZMcLRVwb1SFffvybMHkoBEq+Kk1ts3CJfP8OCN/g
 HD17zdMM8JPayOaHkFp1i81TfG3hvPl09Og4CfZg5BzsRzIluOt4M8uZIuRIlsyv+PFM5OpLex0
 LvTk9XTJ99cxSXtQIkaOHCyBNkZ7B/7c1Vcx4I4rx87/Qi7sJAs8/n0DMatDNIhhXO5IV69OB54
 eHaX563uCb+Opjno/QafhUaVxseqDM1OOWWrta3sL/5eKHpDk7I/oebAp5Anqt0RNiE2YQjzGiY
 WLSibPLiNlAdm3JewEvegYFLYei/U5dTx5buoT1N+rjW6+/SGxKe99InGv88CvsbeZ258hW4SAB
 BObuU2cIuDdkAe4JOMf5wVQYI3Vq3vdhxuCsCyXL8vOdXn19/rDjuUfII5GE16DClRNtiqDPzw+
 HIxYQnXMeKz21qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
copied from older DTS, but it does not look accurate at all.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index f454015c5b90c7d792c01bf85256812857d79c64..541b88eb5f5300ef9e20220305ff638db9b2e46b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4716,7 +4716,7 @@ nsp_noc: interconnect@320c0000 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8550-cdsp-pas";
-			reg = <0x0 0x32300000 0x0 0x1400000>;
+			reg = <0x0 0x32300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


