Return-Path: <linux-arm-msm+bounces-3794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22D809784
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289EF282151
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8BB7FA;
	Fri,  8 Dec 2023 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7UxQK7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C498F171E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 16:44:26 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c9f7fe6623so18014961fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 16:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701996265; x=1702601065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WTwDERDtHj3CTZ7wFbbvBEJPnjqFeRCht0k5iEHuFc=;
        b=r7UxQK7S39mIyGi8ZGc/XCH0LTv90ROFcm/vzWC97qLiRvAWfcfk9/VjM9plD+aDy/
         qkZatxaW/kNY/RVt7eGg83KfNOME1QY28v5s8d9cah/AtX0Pze3IfHtpKYWboODtY9aV
         6lTNpiB22nu6JJBR8fWJyD7wfEKj8sHYnC6Cxn28DN58lKvQEaUhJVoQ4wK8FRiDABn2
         5lAMnhD0qLgNGA3LNCPCGgxejn4fdpHorVcfeVsgKvcTSm/H4fzWT1l8llphbYHErE7I
         9SYF7D1FVrjNGbCciZWhuF5xZWIXb5NJ3AGKeJiRtQ8gFkOQQ+uxFUSmRFha+H8LLaNd
         6foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701996265; x=1702601065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WTwDERDtHj3CTZ7wFbbvBEJPnjqFeRCht0k5iEHuFc=;
        b=R43g3GxwZFTqHHBFBA6PAvf+3/Vb2LqsWdM9vqSclmHqI7Z4/Br/7OTWSxfgTA+wKn
         S5FKyGL78eBch+X6FsXMH5mBSFp4OVN71SfnejIirE2iKl0n4QNBPuXWjmT2Pyo/g+Aj
         3tTpKH2T0BTqi/EwXi4WkipC+WRzToDYgTc5ZAt72x6iya8H0XmrK6vuHDP6OrbBt1u9
         W5xsSA/dFBMvLyofkXfYlWz3LBWRZSKi4KwO6/+qiKU7JQvAy/VJw004arRZSdbOxugU
         Zaw7p6Jq8rwCMv5qdVbiwW6tEhc6x27SQUvNshU78odcAO8nViUJVUfVt4gNG0AaQYmt
         DlNg==
X-Gm-Message-State: AOJu0Ywm/aCgBU21THh58jSi7sgOcEgBRIJOhaT3Ez9q1hV99xOL/V0f
	3HJLwBhnwbd5YDqLt0Vq6DzJNA==
X-Google-Smtp-Source: AGHT+IGO+O/Dh1t5pJH2yLuU8I982uAcr7rj19scL1UU5jVVmx2oU9Ztp/hjMOUeeAYWbsJR1/WXqQ==
X-Received: by 2002:a2e:80d9:0:b0:2c9:fa32:4261 with SMTP id r25-20020a2e80d9000000b002c9fa324261mr1390118ljg.60.1701996265060;
        Thu, 07 Dec 2023 16:44:25 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a2eb041000000b002c9f2c7cdecsm82645ljl.22.2023.12.07.16.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:44:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 10/11] ARM: dts: qcom: ipq4019: drop 'regulator' property from SAW2 devices
Date: Fri,  8 Dec 2023 03:44:16 +0300
Message-Id: <20231208004417.3393299-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
References: <20231208004417.3393299-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator nodes show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 9844e0b7cff9..d7bd97997ff9 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -353,31 +353,26 @@ acc3: power-manager@b0b8000 {
 		saw0: regulator@b089000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b089000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw1: regulator@b099000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b099000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw2: regulator@b0a9000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b0a9000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw3: regulator@b0b9000 {
 			compatible = "qcom,saw2";
 			reg = <0x0b0b9000 0x1000>, <0x0b009000 0x1000>;
-			regulator;
 		};
 
 		saw_l2: regulator@b012000 {
 			compatible = "qcom,saw2";
 			reg = <0xb012000 0x1000>;
-			regulator;
 		};
 
 		blsp1_uart1: serial@78af000 {
-- 
2.39.2


