Return-Path: <linux-arm-msm+bounces-14821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C9886B90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCE26286770
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E7A3FB96;
	Fri, 22 Mar 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qg1PBbAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745C3EA9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108353; cv=none; b=NrEvLhOTZPLjXbgxLTEtjuGbawYQBYZwbg1ni9Wl+kMsWn1a4NKkbv9hqjkYKpcG0z0WR59Hvuzyg8HwPq+xOuaCLsHrXmDUz76xi9iJYC1a4EINyItViqMq7/mOunNqPknCvryzEcppUrYdE0KMsZvX3LMM5tSIypX7ER7O7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108353; c=relaxed/simple;
	bh=IgT4+xRocS8M5wk/3lmG0GxyTSAdBsg+wpklnOeL6Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n58ty2CCYmiYP47Sl1WcoZizEUbbsKvRSdDuWyGScVvjhxw/MNhcPTmnTM6xEbrnL+2ZbKhmhX5/n10f8lfYrBcvWJ4mUzsR4NRLkigjljU9W62mcJOa32j4el3T3PwgiTx5E2qtOQGjZDUy1Bo0N7vK8fZ8E15hztigybH/VcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qg1PBbAB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso3517448e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711108350; x=1711713150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFZxx2UwPM2nBQnLVlAqPOPRxmWU3w/rNOLcl3bJZUI=;
        b=qg1PBbABLPDfWwRs3ygTZVrWtllX496q8STFJGZtCjvKyJhsO9mxiZsxEWKT1yaaCp
         xz/5l1gNiibY8M3NdkQsXTXVrMLpQTtTUmvZ+OWYhX079uJ+1l9JYeZYPm3ojBVEVc0U
         ENbKm0XC5PaxOrhM6k//bmfcLVxcJiusGEmUiNUQNAcedOi/+AEPgr5TrIqNG6P6N/9C
         6XeHUxtn5Fp6SaID9aYXlAImuXRfifpviyIByRwluLEiiC9zdxQnUHG7hXY9puuVdJn0
         /eJf7+zW7+kwDntBl8PS7yZLzEVRgCVl0pByNY2dNhHzhp5QP/vEs/gnGUtCMV0kcWm2
         fOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108350; x=1711713150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFZxx2UwPM2nBQnLVlAqPOPRxmWU3w/rNOLcl3bJZUI=;
        b=nl4qiB17Jt6j4tDphpbcELp7tfEtj8u3aoMeWGRvwwxEb3gehPhWwtnrQEMAK44qv9
         2eB8gI2BjFAdnbvoXFEXNtvRMv+vgyX35UZcpYWh/Hn3o943TXDlusO1+BH8jFXAWJFl
         LainkdR3oxfXDA/NlCAB44bFxRk5ZUloO5zBvMXkgKncyuf1hPXTi9U13TkgEe2KZWMG
         tMAKSMC/feI9kQ989CR/0e8CSJRAUe5a/ALDAFVgpAKgdbGB0j3R7QuIk2l/2Go0zlTY
         GE1nct8L18wxDsLeF1QwgTDhHEUbViCKIJ/XTOXRzXqhi0FXg3ce0RM6Cb/Trj4Bzp/s
         4kRg==
X-Gm-Message-State: AOJu0Yz9Af1uFC8iTRytd8eF989+WIjKSR6JOqzjaw1fLNgJfEtGIqdM
	OvsGiyduZyMIZzg8oYTvNLCtI7T7RRTdxV5U3k53Gd7/aAFx2IfQ8ey0B25GARfceJ82haq6hrY
	B
X-Google-Smtp-Source: AGHT+IG/jpImd+74cJpDvqgMQH4H0z+Fx5j61CWob0GHIrApd+FoZynZ+G0poPgWWbm37l9foD0zNQ==
X-Received: by 2002:ac2:4d9b:0:b0:512:fe25:550b with SMTP id g27-20020ac24d9b000000b00512fe25550bmr1914280lfe.47.1711108350006;
        Fri, 22 Mar 2024 04:52:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y18-20020a056512045200b00514b644bfebsm320136lfk.299.2024.03.22.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:52:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 13:52:21 +0200
Subject: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port
 description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org>
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
In-Reply-To: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IgT4+xRocS8M5wk/3lmG0GxyTSAdBsg+wpklnOeL6Po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/XD8P8u5tI87RiC6XewacrflVNqopreBWKP9t
 9Tqvu7flDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf1w/AAKCRCLPIo+Aiko
 1So3B/wM09s5VU5vvA+VGaqWk0PQBFCt7j7gEcwo60Yo3ByKoaiwN/K9JHq58KMflp5arvS/Mzv
 xLCtecLRtGLGrOxzdEJVVXH4wesgxrvalNgiWsZLjT9GN4S0GyHlFawrNAsIO1xMNsqIMSBWXXQ
 Fu6ihJsBktqP9gE8IgL9f6Qylg7vrWaAqQDIDGMgWrl2uObq68L2hArkuXq5i4tj9obooXkFU2V
 aELzmYLKH4Yk9GlBf3w5LvJf6p/tm9KYBOcak6qy7Ud0RPbo0jjT/EVfTEwuFUUS9XdES462Xpb
 Vo6hPMibBuLF4JA+OJmjID0zy1u0lLc3Og1GGYBwYx0Eab+F
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PMIC Type-C controller doesn't have separate role-switching signal.
Instead it has an HS signal connection between embedded USB-C connector
node and the HS port of the USB controller.

Fixes: 00bb478b829e ("dt-bindings: usb: Add Qualcomm PMIC Type-C")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index d9694570c419..63020a88a355 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -84,11 +84,6 @@ properties:
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description:
-      Contains a port which produces data-role switching messages.
-
 required:
   - compatible
   - reg

-- 
2.39.2


