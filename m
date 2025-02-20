Return-Path: <linux-arm-msm+bounces-48720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F540A3DF20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F065D420A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877C620C024;
	Thu, 20 Feb 2025 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKnQhDYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F27D2040B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066270; cv=none; b=IWGXlWEAHsy8YXSHVIOL/pSTH1H+T0frPK/SYh4B7ybcf9lKzV1UUdbVAhD2zXkshoihFk83zhztXES+99iP2acrhyQBqI/vVr4WDuDoTSQyTNhZjK7UdLAbV1ljRZ9vwcCthT9R0Nes40s8Vdqsv0Ad3PGoSOP1IDk88tk2ZCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066270; c=relaxed/simple;
	bh=QaT8J47seIEi5/AqERBFPC5Z6bI3D140tXarK9vkgJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swmqi9MayrfSJiWGeEeubs7Vag+Ek87/IJa1mseAN0PUaCIKutI4070I38aNkMgaZ64XBksvLl8tMOAmt/bRWZXeTEp5VDhioAAbExC3TFAen8a19a4pX3vOQLGY+jBoAytiE3jYDArVjSt4prjZFYN+EJzLeBhTe8bOrH3RHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKnQhDYW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso177446a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066267; x=1740671067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GY/lZUViwVvA9Lc814pusY/ZYVJenJoYIgN/xOpSxU=;
        b=QKnQhDYWXi2sAe3KnMtIzwRq5760NsDiY9O26Hk1wx6uT/ZmgM0wMKdbL2AFa2zI7T
         hVuiCBp/PHD3tYOzwmm2bDfm3T7engUNuON5gHShRF1u3fFsujYkeqNf6ciQ9oCW5HUs
         htX7WaSYLfeh526f1PK9jNDZ5DvvQF8iz/sMl3qVWRtxqT3NFejDPAdoaWt89kEM8bDZ
         bwTueBdqXQDs0mCeibwFFm4d79LajNLIeP6Env42uAmiNtZ7gSW5MRbHs5wK4X6AHBrm
         HDwgqA/WkpLZiftcTzYU3Y9yPWEIGbKj7w//Cs6P4JfiopEnxqtS/Z2gn/TH0nL61TUb
         BfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066267; x=1740671067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GY/lZUViwVvA9Lc814pusY/ZYVJenJoYIgN/xOpSxU=;
        b=NObEFfZ4mwFHc3rQSbP7Y6wclsa606LVWKGr2l6YF7JTofdxH4nVaxErt6WH3N90Zv
         +A8CmovDFLSWMmTeSNUviGXBqAgcCa1fXnSvBCWTpKyLcP73s4OtRELhxVsag/3dfRru
         0iWyWtl7kqKs5BdNNoesZ4Iwpm+juOw+xEkfwHOk0G95+2PfWitrnGdOtZ7HInuSvMwF
         KXvQk6ZDd8WGC0aWPiYf9ZfFcpI6HbcfRuMI6axnb2MbrWdqUOnZwGbp7nSBRM2XifoR
         EqRYn4PCEA2UUXrURhfL8/MZLqD84w7jJwu1KrdzPKYEWAz50/O5b7XegAdKFUnz/2F6
         8x3g==
X-Gm-Message-State: AOJu0YzZrDVr1KHvGmut5eix/Q5gJt93ikt+rzSAC1gPw4WGAswGdNFY
	KoJT09s6ovUqVFS+EP4gi8J+nDZGD9+yJX1UDc+p+fDXXydYtRibiJmSB6c0DgE=
X-Gm-Gg: ASbGncs4TkheblqTlaUsBCBaXtky5OFLq5pVcyZRSRxQ2zOZJgPVE9s0TTcD39rSFLm
	8+6dKk8OScgkcQPDesTZlOTIqBfci2rOqDjvf+XVd3LJnlBXLBuuh8bO6xbllKTMnu0TFCSZ2KR
	FGt3tfw/9UsVV4rGenWsTPMAMoUxCNAwx/OuqRVOW0uIt5iRQdev/7/eHNxFxFZ6vBjEDVKDYUl
	uXZ1QWhZMB+1CubHmW/l9nhdW0/VtTu8pneEGHs4+2VrIIJ6hoskIYz87r4Y/v+gzDF3Lip7Cyw
	UV0G5huG1z4rg70BRJrDZ1fOF/20B37DC+H4OKXgI+Ox+0GqqodrYXH4wFxpr4LIyA==
X-Google-Smtp-Source: AGHT+IHLTciDFqhxiwXeG0PLjQsh/Odlyfht1PecSHhE2+xPvT+0dQpZWOBYf/R0I1dg5b0HlvFtsA==
X-Received: by 2002:a05:6402:348d:b0:5e0:8275:e9dc with SMTP id 4fb4d7f45d1cf-5e08275ee92mr3309701a12.1.1740066266928;
        Thu, 20 Feb 2025 07:44:26 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2881b3sm12418151a12.77.2025.02.20.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:44:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Feb 2025 16:44:14 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8750-qrd: Enable CDSP and
 mention MPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-b4-sm8750-cdsp-v2-4-a70dd2d04419@linaro.org>
References: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
In-Reply-To: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QaT8J47seIEi5/AqERBFPC5Z6bI3D140tXarK9vkgJ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnt03TRHmqfeq47U+kN6c7Hq+JWe0KuzC6smSPf
 FdLWNCLnYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7dN0wAKCRDBN2bmhouD
 13NlD/9bAvhaQTy+BSphMYPGYWakfVJyYjbg/Hw8BOfOe8OT3CsAWQAVC84oPlkygrSY4PvvPtT
 9mLxmiEcAIp/4jYKMIbyY33vNCDGa6yTXDbsh7xytKjjLCj32fRpQlISuFuUKZg4w/myzfk6VWb
 ALXDIEUJ0yYSXlQELjUbg4v5IHyBu5zd7gGHuE1gYssyQdBz+bbva/3BoyPemKSDMQH3IKfKCB+
 fAGh6PrRBcputu10lo6/2K7Hz0/32y2LxuUyf/Qrj/AU6lGOBiucW8QxpbXEgDmBr2bEX/01dJD
 mdokMVpecAMxYxJOh+N0XGFQiEmfzzMXwdMMJ1RDZUChy+wgHDd8AjljO8dS462u6vp+NR1kXVO
 vu+Zftvun/v/6XCBVlSDrWQsLI+AtPQGaUUMAmfLCpLWZnNYO9S/SdBOpnpbJCdK8liOL5kjatr
 Cn1M9d0Zw+5/2HNbQQLhQ2R++mWQAL5hsfkFYNHjOle3AIc9JtyXkrOu7AADzZsGyFxyFEOCkUT
 SKeA/jKD4UnMbD5SIy8+I/F2HO9jmk7q9yAuISW5iEtLilJm49OM0JZ9wmJU0N/jO7xYplDaZV4
 SUEc2efv2o2dm76nRPuDqsBC9TMMlLB/N0l7/PPf2H8vtmGaJYEwkP+I0O2bldM18C7YkByCEo9
 aTlOk21NF5JqTjg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable the CDSP and MPSS (modem) on QRD8750 board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Not tested on QRD hardware.
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 341774bb042ff88af8acf49c2f0ef14f9994dfc9..840a6d8f8a24670a01376f8fce511da222159016 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -789,6 +789,20 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8750/cdsp.mbn",
+			"qcom/sm8750/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8750/modem.mbn",
+			"qcom/sm8750/modem_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;

-- 
2.43.0


