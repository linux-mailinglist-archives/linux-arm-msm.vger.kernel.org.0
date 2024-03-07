Return-Path: <linux-arm-msm+bounces-13630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C087584A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 21:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6A4281E96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 20:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83845139580;
	Thu,  7 Mar 2024 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeF0tkYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0AD130E48
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 20:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843200; cv=none; b=LFrDL1M/BwahS4DfvG+mY9CcLwhUPhfj7/oLnftK0bJJZbD9ynQsyUjL4OdpFWM0NidwJmWzDZhKMs71Jaw4D+hS2QdeAscTrremyvqd4JaETTYpG6pEA+CFclojIrjOFDJ4LT2tpj5CV0YcgkYFB/9WcTvumVN8KQyHNgpPt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843200; c=relaxed/simple;
	bh=8/DGQ83cSrSaq7LKUH+VcyTeHlJ4+6SBCpMrcm8Id5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMUx24sXdNg0Mq9VdUpqPulkbjJkxVnES66u1HaEGW36exD7xbiWT0AQPKyT8DAC9t/RfBW+HrkGyNHJO85oA47J5e2oIcQbPlg9z0ZWfEgPOjf3DbDnrq152FZW/P7GBeS/dEXNW8kKtPuZaO3qLPZyXYoSmiBZeUPNFymaK2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeF0tkYM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513181719easo1112800e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 12:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709843197; x=1710447997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXLwWeiszGpI6rrdYGEs9FVibKJ/VcRC9EN9PxgZG1A=;
        b=FeF0tkYM7p8K+uO++OZ+5ekUyR1DFYG/YzA+aWPOQXeW/qiIZpWxAhmJW4QSQL1m8F
         K54AIDCUW7xBfSeFn92dcNV2mawKKHTXo4f2kYXkUmjWlq+i4DGldo/H9LpuJzqNl/UP
         9un2Pe1hL274UPyaElKN1lVzOJUNloP5IbZ7snDh2cQuyqbxAtrdUUi0YrrEdHbGLBQ/
         cd9EvjQvBOXxGQeMyh6Se2qbbZCuYlteYGlPq3QzMzagiCcoWN3LcDLb8yDf398CROgD
         3ZqHKqn9WqM7mPm/Mw7s1SwxJwKXCaMvsKzO9xBYa5o+2zVIMwrcDYkZjUyWt+1OqBTn
         sOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843197; x=1710447997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXLwWeiszGpI6rrdYGEs9FVibKJ/VcRC9EN9PxgZG1A=;
        b=qcn2nxgbIMn4ygmILwe6vFC7v8DWXy3sV9+VS/wLuXGNlIXoFj6LJaEvi44836aVAV
         KETgeyBtCtQEzp0XCi1I2QcjayLNPeEntfLgBG7XGtae7pVqkQ/ATumIcjxftR/wdpxj
         0V6mTOBn46P8G5SitUum99rdRZ+gI1fS0LwfH5IIRGbyqCvmzrPArILUebCcFkbY/hsV
         ug1aosbWUJ1aZ5Vxgh7MJvUWwLX08dUS3TNxvJFP+TRhI67I0imJr63mDGQDQIA8swxO
         1RinIrMZXMTIgoVZ5Ur+rGGRqoLyl2XfCRuhWSfrQetQG9JVzzUAj6XjvpOgn1tuyEH0
         15ng==
X-Gm-Message-State: AOJu0Yxacd0+3LHvMxNO6XOLW+R1UPzLK2wRi9mwVvc2FekioC/pBm2J
	UCmdWGLvW9+sFKWh3jwVcG2HvXbT4zHDQgySUO3IyKynm2qf1pCgtN6RTIqOsPk=
X-Google-Smtp-Source: AGHT+IH93hG+h+Zy3uBuBwbbaDvrwkiy3pPB5UMxB0V3Sm698sVGTruTmwRMuXQR/YJ5ItnZI0ed2A==
X-Received: by 2002:a19:e047:0:b0:513:5b81:f2f8 with SMTP id g7-20020a19e047000000b005135b81f2f8mr2139044lfj.54.1709843197150;
        Thu, 07 Mar 2024 12:26:37 -0800 (PST)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id dw20-20020a0565122c9400b005132bf9f8dcsm2957606lfb.303.2024.03.07.12.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:26:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 07 Mar 2024 21:25:55 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sc8280xp: Add QFPROM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-topic-8280_nodes-v1-2-4eba20e08902@linaro.org>
References: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
In-Reply-To: <20240307-topic-8280_nodes-v1-0-4eba20e08902@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

Describe the QFPROM NVMEM block. Also, add a subnode to represent the
GPU speed bin region within it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a5b194813079..a3725d917bef 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -862,6 +862,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sc8280xp-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@18b {
+				reg = <0x18b 0x1>;
+				bits = <5 3>;
+			};
+		};
+
 		qup2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x2000>;

-- 
2.40.1


