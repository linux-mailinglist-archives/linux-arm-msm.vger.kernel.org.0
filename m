Return-Path: <linux-arm-msm+bounces-4813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A78139A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2BDC28141C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F0D67E9C;
	Thu, 14 Dec 2023 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rypMenmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AB0134
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:14:01 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50e04354de0so4916790e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702577640; x=1703182440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jeq677NEMB1IsnQAjs4/+yBvpQgDXfs4klZEe8r6nwY=;
        b=rypMenmuMdO1QbcrihnIVf2JXPhpJGZC0ibYEr6hPjfqhNVsru9owGy6iOLu+yWQZL
         6YzMN7WOwW1eoSfh/nzVhcIHwvdVc+LzkGmE9/+PtO6s8Tet+9a7HJ8DOH9Wt89Vco6R
         x2vXDNlr2A6pinNEripZvIn2kBch+KxLIqTlxBuDKMqiAmfKtoaBoa/0LK1eu+wpa1/5
         fwpYE1DeQ4yc4jrGiaDL4ppnA2wxA7ikfnNZU5Fi+SzyTf8UU5ZoJZbYRUm20l8s384y
         r0MKAW+DxWsUi+BfQM+O/mH4y73+XHEscyElcWqMo5IM8VyhoEfCRb+plNMIKHvBvclt
         Js4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702577640; x=1703182440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jeq677NEMB1IsnQAjs4/+yBvpQgDXfs4klZEe8r6nwY=;
        b=xRaTVHitl2cQRSj67OUMohXvwfSZKiSsJapnelN4JWLfF8D9FOdxDdYdh3TXSjfDtz
         FIOoI8epo/3JGHBJIQA2fz91b40FZzBpKfCHDDLRr6/uckodWG4QtM7Oq/g9mrOOYUxQ
         FCk04kZNPHo/eI0jPZtT/rKRzKQSlKYD6h6qXqNM2a6Z0C4rkocHTnSXuLgOTxBDL2Uf
         BQ0JGXmfukK4iEy02u1iix/4ZLzZ61r+QHNPrQfog9c4U9nzvUaNoj91ieJVnkVhCd85
         KMvBTzBvH29AyIwiHM5AJCTNUk8ppGdjGocawtc3w4okJo7ZKjuHoZ7fmxfAW4TGlWxD
         hiJg==
X-Gm-Message-State: AOJu0YwqIKdm3fh2b0QXpQftvPHW+zBAd5vKn3GAoSckU9LZ5CLQG6mB
	Oey2yrk+ihy4y84or96rS5/nPQ==
X-Google-Smtp-Source: AGHT+IH+63IBJ9rieYmdKRPNhHxIM+WiKLHtfWsJ9OIE/+7mq19A5B8k4ZmO4Euqa6cdaiIKAp6nLg==
X-Received: by 2002:a19:e043:0:b0:50e:17df:a992 with SMTP id g3-20020a19e043000000b0050e17dfa992mr815321lfj.33.1702577640041;
        Thu, 14 Dec 2023 10:14:00 -0800 (PST)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n11-20020a0565120acb00b0050be6038170sm1928838lfu.48.2023.12.14.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 10:13:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 14 Dec 2023 19:13:43 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sc8180x-primus: Allow UFS regulators
 load/mode setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-topic-sc8180_fixes-v1-6-421904863006@linaro.org>
References: <20231214-topic-sc8180_fixes-v1-0-421904863006@linaro.org>
In-Reply-To: <20231214-topic-sc8180_fixes-v1-0-421904863006@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Gustave Monce <gustave.monce@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Level: *

The UFS driver expects to be able to set load (and by extension, mode)
on the supplied regulators. Add the necessary properties to make that
possible.

Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index adddf360c7fc..bfee60c93ccc 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -386,12 +386,18 @@ vreg_l7e_1p8: ldo7 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
 		};
 
 		vreg_l10e_2p9: ldo10 {
 			regulator-min-microvolt = <2904000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
 		};
 
 		vreg_l12e: ldo12 {

-- 
2.40.1


