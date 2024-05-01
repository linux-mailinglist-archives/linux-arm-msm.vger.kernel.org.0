Return-Path: <linux-arm-msm+bounces-19071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA338B8E02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 18:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B4721F21A03
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 16:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D74C131BCA;
	Wed,  1 May 2024 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxGjyRLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E8131743
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580392; cv=none; b=bAo1cZmWtJ8VC6bd/eVJ6acD/IYLTfF5UizoZ4/sMBnNZQF0BW2G5ehRcEmoN8v0GB+nmPhEDTLA9BLqQBuQZrNtCXreYC1axRVqYd4A9l+4O34d464g1egR6t5b/WfIa0FkrzMnzEBPewS3ue/3MT3Hhxg2OMj6PyoI/Ttb7+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580392; c=relaxed/simple;
	bh=naWFrW0qlpkbnfyMNz6lkTT4Kg5gQ1w71bgFqDbRi3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQh2vOdiSNhzyoIo6b/pmb0GGMNPep+89yM1ZBU441BRsF8kZtBOQkQfkXb9YCOdszTWJXlTQPPdS/T0/xgs0RcUUWt+1WUUP5OwiaWvLX50EbUnNCmhzPALzJAyzf2hNVlaS+ulOa2Uk4/aPAG5qQ38bQy5v4MI1Z7l5q80YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxGjyRLH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-518931f8d23so7102487e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714580389; x=1715185189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlBgmHn/PpDtQuONndN96choDJkuX35LPpUAOc/PmjE=;
        b=GxGjyRLHcDAZIkTBzK3wXaDcPdcYty/+Ah/K1XFYmnAX1IyGk2WVFya+b57G0NTynE
         Pkq5orai+/qNC0GV2JKvAXFGy29olEf3eqBUATo+UcZQZ3RQdgemVhRKDKt2uj0+8/0q
         n7pVCd1VAgW6Yt2jk/vfDeHJI3hFVQA3tmzWiptSAW43eTWDemJZgjhZzBxY1oldxeHL
         P+BJJpGlJDUqKyzGAwPBjqBkty2aF6X2Wa6PkXVFB5qCBvCdQNrQyk4MZfwcth9eLJz3
         7kEf6Cj/Yq8C+J2kQxCRB1STRiQwJXBbSNjPgf0nR6rDva0yuXbZtA/PsAF0nZwDRIYP
         VZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580389; x=1715185189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlBgmHn/PpDtQuONndN96choDJkuX35LPpUAOc/PmjE=;
        b=a+jpYTtjamxejCoibbMqjpal3agGwH13XTUy2mPqcBLD3D2C65Oq/BUtGYFHrtekaR
         s0Qkq1AxwkXPtIlYcRkNUe30gadbbVhRrID6khuMGfCRz0DdgJMOnNMvXFG2AvaSC3Cu
         AP9UZt3sUoQSqxV2QVEI0OX0FVUm2pcmvA+h4V1Ji9Wqsi9b4iIimcn68uprBNtSSiv0
         zOgrdU4IovyV/dlKltDWqY8ENCnQsoW1GIY9yk7XMwXio6n0uxcAXX2r3ZMT/QdkK7So
         0jdhxcjoxBCduh4T2bn1KAwBKv3LRKuxua0ynjKOtDnUq5+6kC9fBF490i2tZmWOsGO2
         Btdg==
X-Forwarded-Encrypted: i=1; AJvYcCUsOzrv3KY1XOT3gflmTBYYDePtvsY15Q8JiiTiotHRpQQG43rHRbEiJeraItyME5D4Iw6HXaRMohjPhTVjQ+/Le4dlukRos2KmsRJaSw==
X-Gm-Message-State: AOJu0YyNJ6O2NPtaxpes82Hlv7AshlIWyzMeOobSuNtCpfJZO/HGhvcq
	A9NUuLcdA+qzSjiURM25vcsQBF5ViBhACEJxXcDJ+0B17jYV8O/w91oZxvtcRGw=
X-Google-Smtp-Source: AGHT+IH8FWbYXk3WZsUX6Htio1PWuqLPJdA+M4B9jVwynpQ7Y34McbPbsLdTXEBKn2F/NOZNkgGkPA==
X-Received: by 2002:a05:6512:3a91:b0:519:2828:c284 with SMTP id q17-20020a0565123a9100b005192828c284mr2198578lfu.65.1714580386985;
        Wed, 01 May 2024 09:19:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d30-20020a0565123d1e00b00516d0029383sm4909306lfv.28.2024.05.01.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:19:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 01 May 2024 19:19:33 +0300
Subject: [PATCH 07/13] arm64: dts: qcom: sm6115: add power-domain to UFS
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-qcom-phy-fixes-v1-7-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Wronek <davidwronek@gmail.com>, Andy Gross <andy.gross@linaro.org>, 
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
 Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=naWFrW0qlpkbnfyMNz6lkTT4Kg5gQ1w71bgFqDbRi3E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMmuZwoMNt8+h8OWQtoxvqSZIxiOCZBaMItpbd
 b/edI/5yvGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjJrmQAKCRCLPIo+Aiko
 1eZ7CACMljpmbXnA5ga9/FaUsBK5o+tLmIW71XhWxRYNLrt8LMrExJ4ipQK0K8sWVC/looM7E/R
 u7XZZ7lBhiqujgBmVDadEoCCXwNOC/TywEiJ92xuL0vxnq+kVahLBmqTs24oGW87n1Z142516f7
 uyVkoLc9H0RYffUSnOurYUZ5vg/dZUdySGjrV2MMAhLOb+PdPolrSChfj/wtoRQGSoRwVoWIZSz
 za0TYe6q4Bn7/3HjjUvStVIbss2akuYGHOnJ7/zx+jH+SwEIZirRJVNVVobMsx7ufawo5ZBTw7b
 7uW+TcAQVjV7dwgP6qTnUV7Nrhs35mcse7ZfzM0vXQifmcse
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The UFS PHY is powered on via the UFS_PHY_GDSC power domain. Add
corresponding power-domain the the PHY node.

Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index aca0a87092e4..5896868d9e6b 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1230,6 +1230,8 @@ ufs_mem_phy: phy@4807000 {
 				      "ref_aux",
 				      "qref";
 
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 

-- 
2.39.2


