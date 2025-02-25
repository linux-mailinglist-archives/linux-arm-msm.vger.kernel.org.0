Return-Path: <linux-arm-msm+bounces-49263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75CA43AD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC5D1733CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558AA26BDA2;
	Tue, 25 Feb 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydj5M87M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654FE267F69
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477576; cv=none; b=an6d8ZqgygTq8npvFUwCqSPVTT7LqboVIvJOpwuf745/pMzdgQ5qeYLM52/Vzsh5K042BlkUK3TTOoRWhz6h4fyCfuSHkDTkot9mtSQR9opgOoca57xxCBIrdQumoocDOKNH/q6PM2LlMUWCXV7R0YZQfjVhhv29ziJ6rfmsszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477576; c=relaxed/simple;
	bh=9axhRUPtqIp6coUbfFJPOadnSuK9bR15DrSsGVMUkIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xd3TOijxb59DiBGyXiRM1R6lq0W60hx8n2PLeFvsIOxXS/h4GRd6qb+JMXqPFLabS10bad9aS9ns2eG2EVsPND6Fo4XlbMdWhemeDaCF8fDlMpt8O1gdXqmt77VolQN4Xh0YGu6CQdkAm5Z/8NGs5UPkt97/tZBBu7HXhpv/bsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydj5M87M; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb7d5a6577so59226266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477572; x=1741082372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2IH4+kpUxnVHlE+88wJ2mkHAu8KVwj1hJxUHrr0olA=;
        b=ydj5M87MtVf/Up3kuXI5wH4IPH53yACM9mOjOWAdDEJ1A6SyBTUGirxWsQG7dvMvsl
         hen12cdukrNxX4ijIYm03+96cKgLeNIk8RRSz+PiqKhSjC/XWiu4MTeH/7nruTXPTl58
         SwobR6Ilk4TEcKHxiOf2qU1OEHUaBt5VLUBFJB9jH72oudSARxr/TgPCbbuBBQvmrVv/
         jyur/gd7lGqqaKQ+ZFh4HVuPzqJCtZco4RdCKDALaH713rLHM4lxitxo2Sv1A/DCPbUI
         ZZlP8Q0mcd/vgJ4jcQ2rYDY1QBqAiNIQGN1OHZnmp9BSvPETKBYXHq7JCAAF8yKMyUCo
         2xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477572; x=1741082372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2IH4+kpUxnVHlE+88wJ2mkHAu8KVwj1hJxUHrr0olA=;
        b=d3VThLn7d/vycAD26Sl3rflbLTS3+KPVZ18DiNPWdXitnjZjqq4rxqE+fLlrapz5TX
         GdxEZknPFNQbPEqfy9yqAUj2jirMG7AwbqME5NQSeQIwhFfd0QPDFCX+wF8vBKaT1lvF
         wsT9QXT2HVm9BARBfmMZEnOq0kM1jHrVP3g96oyAV9kuKfjESER1LV5KlGDXVeanmjgq
         iRchHp6R6hle+bHZ2xLpXL9mWgazkZuvXlikartODDtl0ypeoWXWDONg8o3xFLyIHdEj
         Uu8Ic4Mv/AJll3kRqofTnb5CZv9ZnpLSTrKRK+ZH8nk7NyvcqY76W7sIasElMvFJasI7
         qs/Q==
X-Gm-Message-State: AOJu0YxzVbW3BdOewKmuOgCISFixaMZ/n/6JhQSKrcNWy3yKgEeEjqnZ
	bF/m6ugbHrcDHZXuuWS4B+oJ5FAldDDyfbQW5uSe7YkojqC+b66YLUGvQis3VGY=
X-Gm-Gg: ASbGncuNEFJIoB8ZSt81NJ5JoyPyjJvkTuhXqCJ4uep+9CcK68eMVuUbB8eaXqRMyo2
	YUdbaUj0EvNlp0xLlNbppkd8diguYYTT15aBK3oS0QSSUhiuxlsMFbURluqB3i7lCSBjsHHkusE
	jtDbu5+O6fnRNsG5F1xtkJecnD91bg6cQe6PwCzxQ+CfmDvJKapaKcxSWAIZcl44e9lFuNPkSN+
	2M/tsI45guZ0CkbjoISfQV4Qv6jrDrPyEjgqGI4oE1kCk4GXAT8AGMTjJsn2QXU8HDvCaYWyilu
	dE3odPdPredVYEFPvp5MPfrLHcXVBKrLVuwEAnqlFke7H0zUodFbt62btr4LEkatnnn73KK5e+j
	8
X-Google-Smtp-Source: AGHT+IEzJFTfwpzVJRQ2TXmtpDbGVyMV1SKSC8zAMLLwva0niWRxH2Iz2D/Kp26w4+Ab/IoK0ZPdQQ==
X-Received: by 2002:a17:907:6d22:b0:ab7:6056:7a7f with SMTP id a640c23a62f3a-abc09bccc3amr564699766b.9.1740477572405;
        Tue, 25 Feb 2025 01:59:32 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:59:08 +0100
Subject: [PATCH RFC 11/13] arm64: dts: qcom: sa8775p-ride: Switch to
 undeprecated qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-11-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9axhRUPtqIp6coUbfFJPOadnSuK9bR15DrSsGVMUkIA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRwryrWt4Axl8R2h2rToTzXHKWUW5i4Rts5F
 ccRySQ9QA+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UcAAKCRDBN2bmhouD
 19JoD/0TUzvpihO2CTpRHIsMRX9/3fR/cqRNustTfcnh6Nw2oHN9djgw51V96EL/YShHt8X9C7L
 q6sMZBpEs9UpSCxvbXgeAFXpqS9nk4eeyZaeSGJ5EwXKW+HyMalapX5Rg80dTV814KOiOtMOEDN
 C6D0DrPBIU9v9MBFCd9bHgsU8513UBeY5hcAC5XT+V+Z3apLoa/2fc0S+i4ypKhEBDvyyInbukh
 XXGeZrVSZyVKzVsjrJW7j1+j5+r5Zk4wAzgr2lRtMmYlSc1S0HhFT4mLlhjVB8l2VIxHwxnMixZ
 0frOs4T5SuC3ILy9FZ2ZXjseYbNQxsLCHIK6ePLv9l73ALy+vwEGXK1LeE04KA7gcqGwQVxtHuF
 wF3BgdLugE8U4QRvtWtGYvvXD3IwOVRmilxotDPSy1eWVpmY5+bOd5iGnYJc8I+MYugzdZR720m
 41NohI9FRJ97h8UOB+y3hC8M9aDPnHDpIs4zNwGsewhELfJfqeHrar7AdPPG6pX470mawLmVrDT
 Wq25z7QPbdDu/X2jyyrnacHJServhMWTkhJQxBNLvLRK2PaNp09+RaC1+G1D620wojQ6zB5WS92
 QCKNFt8B/h/OKfKva/V1Ss3oJS5RDaRtgU0dGL1CNHtXFZAt2HtRyEa1QzUqHb/rSGyqHZji0CK
 MmaSPRyX2v0kn3w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath11k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..fd841adc7791042f9cc6e3fdb76d250c7cbb6a0a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -878,7 +878,7 @@ wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
-		qcom,ath11k-calibration-variant = "QC_SA8775P_Ride";
+		qcom,calibration-variant = "QC_SA8775P_Ride";
 
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddaon-supply = <&vreg_pmu_aon_0p59>;

-- 
2.43.0


