Return-Path: <linux-arm-msm+bounces-6207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D926C821738
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BF1E1C211E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558D263A6;
	Tue,  2 Jan 2024 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UjixGlLR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A5CA6F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7b273352so5724807e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172654; x=1704777454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxaN+74MTHKbW87U3iOEHa9v11H3irm3Sw8OT3o414Q=;
        b=UjixGlLRMtoDXmENv3TkS0XEQR0QngZ/HcCm8hf+d/HU/HgVIZv3nI22slfeNpHhL1
         txrylCUHEELGNOOk0WCQ6yR+UvVyK13ut4N+rYVczxp+g8pfi+4JoOwRnqNTCE+bHT2C
         Q/z/dqYSYLEfLoZDDO/yrQDdX3AIOSNmfpdKYeyvWk/+hEIglfYHufPY3GOLYJYt+NE7
         Vo4PuBcUB8/3aMCySbDqviN5YUsDusL7hRbYQ48Ja4lL7SgzrB0pYbCcRcMLRzkAyGE0
         djzyr9P6WQZTdLJxyuajIQW7c4CA7Nxnw79APZSkZ3QxSDjf5xPhveyhh5+tb/kmNzOb
         D41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172654; x=1704777454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxaN+74MTHKbW87U3iOEHa9v11H3irm3Sw8OT3o414Q=;
        b=OjMKjsYrcfh3IsvHfH94wsNIsJdS1H4f6DRWgc/NC5cXofyYeaLySVzc25wNPV7HoS
         uFM7T5Luc4wzcJssREk1ACmQeKqtI98uH9Bh0Idmf3xQQDwa9ZbHLLfiM/dRKPkAf8Sp
         VwD1kpn1WwUHJ4OUWB4ayiPYxwVCANhR6Dr9eLDGLc56lgDyaXKGn5ntSJnu8PHKTQZ2
         BsApjQ2ReqihtZ1MsivhGSAa90o/W3dwfPqhzQYyWnjRjb9x/wWGFVpiZ9OEsErsl5/4
         VwFfb65li0+ZtavpM76t6TASqJZVcOmwPqH0rY1ZMxyEcGboRWAFdfsTWWaDsgt1hBQZ
         fqLw==
X-Gm-Message-State: AOJu0YyzySvOXvzfsgOKkKfxRRchbFt+6PWkJogNTegL4qBPeAGjdQTm
	EEuqwCH8EGyV/fkPgB0yJZdKLEXflTfC/56uEL4yUz7Tt/OmaA==
X-Google-Smtp-Source: AGHT+IH8sNsNoOn0UenruAuMIcAMu43EGz8VLnvf1xcEVh9U37KyFW0TcB5vXd5Kr6k+iWZI75S2lA==
X-Received: by 2002:a05:6512:39d6:b0:50e:7fc8:f40c with SMTP id k22-20020a05651239d600b0050e7fc8f40cmr4717912lfu.54.1704172654363;
        Mon, 01 Jan 2024 21:17:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:30 +0200
Subject: [PATCH v7 10/22] ARM: dts: qcom: ipq8064: use SoC-specific
 compatibles for SAW2 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-10-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EgrF1ouyUBfwhdgqqoi+Ov9zEE1VZZvsISi69jo6W4c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xk/kKmNMQp15abahT3pMp/OORIApd5NX4BQ
 HvlpA5qQa6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcZAAKCRCLPIo+Aiko
 1W+bB/95XyxFyqVBxx06uIFR+z28eC9BDFgPkBA1XEg6Kd+/FZiOKpeJh5WuapsPBrc+5B5PP+I
 DZa7fXO5qPFD16shTUdC500pK7wUbZUIcFvyS5uBOj/+zV9zHRNe1TjDQx0z+9FnFmxiGKT8U3u
 2nsO/PsePnOqP2FTVZKfGjyK2qX2PWB/oMMAQGOb/IgpRmetdPEsWHFnkmNVxi+M4fbfrwZitKt
 m2jiaU5ZkeGBRtnKdIawcezj9iU+uN8848mcbAAbM7P5FrQjRPrNQqI2v/9u8fKZeztYkZEc/bl
 eJfF9zI/oJ6KWJ3bJFCd4jjQLTBWmAz/uLioeVDZjJOSlaL4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no such thing as a generic 'SAW2' device. Use device-specific
compatible strings to describe the SAW2 devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 6a7f4dd0f775..0621853c24dd 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -587,7 +587,7 @@ acc0: clock-controller@2088000 {
 		};
 
 		saw0: regulator@2089000 {
-			compatible = "qcom,saw2";
+			compatible = "qcom,ipq8064-saw2-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
@@ -602,7 +602,7 @@ acc1: clock-controller@2098000 {
 		};
 
 		saw1: regulator@2099000 {
-			compatible = "qcom,saw2";
+			compatible = "qcom,ipq8064-saw2-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};

-- 
2.39.2


