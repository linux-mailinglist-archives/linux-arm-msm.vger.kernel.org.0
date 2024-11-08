Return-Path: <linux-arm-msm+bounces-37364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB29C274D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E97AB1C221CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7EB20B7F2;
	Fri,  8 Nov 2024 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CP3M4rWD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF71F26DD
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103511; cv=none; b=SUEuOAKfj4QRki9mqUFzCrQQ2mutcq12qVHMtOvWe3c3mBVbJVbBeVUE7AXh+D2kueVxzLICIw+H0lN29xPJZQdsbzeV6sWi2Bqd2j8ypFaQRD0Q1PFVmf5PUqeK33E1mRSRSs070sNeUDhSYpUMDaDbgv8RQeEEDPZskU18QZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103511; c=relaxed/simple;
	bh=Az9J2UP1mu0XRiDGxanJoUIHnlD5Edqm6sLePuQhlsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tO/ChXjdwqWxvkrQOf38RNXHQKDo87ZWkHaYRzFO4P8ipZbA6fQQiJbIer5vFrVWY/dj5GEH1I3DG0AXR95Ht7xM32BfcStQJHtKR3x/XDSW9k6C3wtkgViX2+mIIGqjBdIZciQ2TkNmhIXgzBrYxkpMQ85fX8gxnuVjJOWaD6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CP3M4rWD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so1521561f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731103508; x=1731708308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzmLOtTwZ7weJNVBomnXbzf01xp3RZEzWqeJqXh6Ehs=;
        b=CP3M4rWDthntWL3nMlnhm7oCzFtKJ9SDOcqS2DWqI6U7XV8i/x3iVsl2g4eZCMXeXf
         islBNoYuP+HJWE+fsBkeK8h2I/2SWeDCSMxTpcbo2sq+eFeeXbj14Rop5wAoPfvUjBfU
         s0zl71K4fqV3Y0LOA6OCqECg5+dAA75EKjZlqgZ2O1PRudGdkstTL6fIlpsH+8zaGAjb
         43M33zlE679y2uLmaU9LAmi8Ywj8/b3n75znLjwwLLGpAAp2F8xrjUbqVp98C4Cv6nax
         beIrwOOlZMpXIFm2EFsYziGZza8UC/mFihY/HL3ZQIXta5MVtwKShkJubbRVQG9Bf0J4
         Flkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103508; x=1731708308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzmLOtTwZ7weJNVBomnXbzf01xp3RZEzWqeJqXh6Ehs=;
        b=CcGBQEPmQCN/xQtGOwCKFgK9YUnTfer8lHAh7vJxbHClclq4qBA73A3YSP4JosqG6c
         XnM13JsAumhZtkBxq8bLM0VIIjLGnyWr7Em19RUqihI8aSLdQJuIA+UlfZkkoo408xNh
         CtFMG9gp3xQwX8WpM93xgPea7WCRtJmx70rfAExQ57yTKpLVvZwmAUxwWxBTDfnMuUxd
         sbHBNGkbPbBhUY4ByY90ev+u90yP1ZiL/bfCUSkZCOiJek8la7EFw2fnET+XmY+jhqz9
         vsg7RFxU2vm6WdsXy071Cz2AA1A9U/3auLHhBe21tf+iOwcIe9QMn2azBE1+6nX1jhYJ
         ziNg==
X-Forwarded-Encrypted: i=1; AJvYcCWBcLtySpGz2WQ5cpvaPt0JthrT1G6i5X/cWok543xQ2J0k5FBEnaO9olFjKMCnRjkYMcem2gwvex9CBneR@vger.kernel.org
X-Gm-Message-State: AOJu0YznsDrKMMc9atXO/hko++7VqyAvC5l1DHhbao5TBQyUPsph1Lmj
	ETOSeCXiIs9MJed8H1LoBDA/hRGUyLaSaOp7RwsxUpSdUvpg/Qawj2tT41Ay/jw=
X-Google-Smtp-Source: AGHT+IHrwFKov63Ik27xiBV754Qf0dWcVyxOfFT4HMivHtHRF8QArSe1qiWFrNtACqgWjVKB3kd9sw==
X-Received: by 2002:a05:6000:2101:b0:381:f5c2:df24 with SMTP id ffacd0b85a97d-381f5c2e053mr742679f8f.57.1731103508026;
        Fri, 08 Nov 2024 14:05:08 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054ad23sm81676125e9.13.2024.11.08.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 14:05:06 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sat, 09 Nov 2024 00:04:43 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100: Add missing
 #address-cells/#size-cells to ADSP GPR nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-2-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Az9J2UP1mu0XRiDGxanJoUIHnlD5Edqm6sLePuQhlsk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnLosKnBa8xFqtyhLLtDN+doC2iJcThkHkGLB4X
 LsP6S44yveJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZy6LCgAKCRAbX0TJAJUV
 VoBAD/9wkrvhYlJ/zQiBbVEzmRj/lPsvVZkyhsoWO926ZW7iSX27GyaIbX1N8ZYjUYgDOAzahvA
 taTz81QSbi1/pR3WymEVDR9+/F/B6zQmXekIQmgk4qgP41kmJVE3UrVDYKRCjxwKeUbYZa0LZxK
 DlRT+ejuWH12MvK51JMXgbvKATPDkIdI6axiOdX1eCFH91SOEwWX+/Wk0BA1CSlosRl1JiLlNty
 OLinK8k/loQ45ycqHHPQZOgNLoKIs00aTaADcjuvXsKKXLMIoeAyxMTcxBjKCsU54VgPOLivUzH
 ZMDaPHh9hPPktN7twKdWqaVK6asv1BTFpOEJWKghygTDM3aLC587fZzp18OwNnRY+Y1QyHZB3d4
 06GPqSr6qpxmm1mTNJypOhrhTMjYil2VbfzUdsaFOAfTtUTHeONKIMhFJD+CnpkUb2ehD6lijV0
 yK1BMrFSu9G3F2RHfTyPZZ94UAYvZs+VIWKBB0DX+3ug4+y+FpLh9Famg45w3ehJq/U45x6ZIfQ
 MDYaM54QPozcE0BGoR0r/Te0l3DRTWoR5JELujluGGAQVwpjsnxmi+JYQvWgIIs4drw5MJcdhEA
 DtHIOYcxmpXYvW8RvBTPgN4qxlLXW+64DXoh3Oew4sDvggEEF7gNpNkNAkURMtXI4LRNY0GVsI3
 ZBK7tRCr2b7dycw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
handling") now forces the parent nodes to specify #adddress-cells
and #size-cells, otherwise it will throw a warning.

So add the #address-cells and #size-cells properties to the ADSP GPR nodes
(q6apm and q6prm) to get rid of those warnings.

Cc: <stable+noautosel@kernel.org> # Depends on commit 4b28a0dec185
Fixes: 99f63aea9149 ("arm64: dts: qcom: x1e80100: add ADSP GPR")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c6b554bac616b9ea6a183e894d4e3d58516fbcd7..568f9a295e497533344ba47ed1e4ae7aa3d2ab16 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -6232,6 +6232,8 @@ q6apm: service@1 {
 						#sound-dai-cells = <0>;
 						qcom,protection-domain = "avs/audio",
 									 "msm/adsp/audio_pd";
+						#address-cells = <1>;
+						#size-cells = <0>;
 
 						q6apmbedai: bedais {
 							compatible = "qcom,q6apm-lpass-dais";
@@ -6250,6 +6252,8 @@ q6prm: service@2 {
 						reg = <GPR_PRM_MODULE_IID>;
 						qcom,protection-domain = "avs/audio",
 									 "msm/adsp/audio_pd";
+						#address-cells = <1>;
+						#size-cells = <0>;
 
 						q6prmcc: clock-controller {
 							compatible = "qcom,q6prm-lpass-clocks";

-- 
2.34.1


