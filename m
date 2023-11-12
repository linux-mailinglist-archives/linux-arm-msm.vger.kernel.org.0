Return-Path: <linux-arm-msm+bounces-524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1E7E8F0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 09:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A799280C8C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 08:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FE26FA4;
	Sun, 12 Nov 2023 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmS1ptkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3563D2
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 08:01:43 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC07B2D7C
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 00:01:40 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so4649036a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Nov 2023 00:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699776099; x=1700380899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVy4gWuMugdV/2nkK2imd9WAk4KEtKIXGLzvxEIxyNI=;
        b=VmS1ptkAr5U/IqTEtm4FPs9xDg2uw4qI4hPt7acE/oLbgPd9lHo63JzIkU0IzdMaZh
         SqH0E0UHEUoZuUgf8VUuiAbKZsrYlQutiF55oYPbeElD0DM1oEQXlxIx65qGfCUY6bgX
         iKmGEg8gRKrCwNSmJ+0GSmgwuc7aJ+1BTSgHwu+XyDl16+vHe5Nml0qTo+XjmGDCq4ru
         RXUgB1H1LcdmMHhzwcXJX3bnu2lMvtVAKghK9KEegdl3gECwkhjjZlbgcBVOhREtYBAb
         nm8QYQGLZWHdSv2fuU75YCIjZ2MYIyWQZ2617Yo3/Ha4j2GPHTGOVwi9XJPZNTTh6djK
         QPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699776099; x=1700380899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVy4gWuMugdV/2nkK2imd9WAk4KEtKIXGLzvxEIxyNI=;
        b=vVMwtD8kA7o0IhI4XLdblirAlmiegmLbhnrAU5rI/d/LmgDe7Ic0bPABBssJfdwFhV
         mHsMyvgjdvU/D2BnTMPai2Uwlrb+HZIqvUd/uspG4ghyo7PKty830TdtF5kdy6S4ETkg
         AWTMODfZURSdYcYW2GIYuCN7Q1rZiwesXO/S3gj0OUEEcOeNuBId7msJletAN36ZWH/I
         Vc9o0smTuRUe2Q/3PsKwmYpmG7eZLMmClA2wNEgsCFyt6gmTUwO8r98zlhpcAukPD97y
         51iSO8dAadrSaonE4wW6/OMEyXUEkTSLJLixy5kKup/n+CVyGDGgatNXBavxRG/TPA6I
         UB+Q==
X-Gm-Message-State: AOJu0YxNMFof+qKDMJAq8w5l8MatLHxvOiK+ewJFAy7yc6C2QZz9bR+K
	WDs+xeafSrIGJ276yPEznZMB+w==
X-Google-Smtp-Source: AGHT+IFk2SC/gCXF1vOoZcz1yCGI1DG9uN2HVqfrT0piI4SZh5LsA+fKVx4uH18X8czMh+xz0xD5dw==
X-Received: by 2002:a05:6402:681:b0:53e:7881:6bdf with SMTP id f1-20020a056402068100b0053e78816bdfmr2654868edy.14.1699776099431;
        Sun, 12 Nov 2023 00:01:39 -0800 (PST)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id bf17-20020a0564021a5100b0054351b5a768sm1940853edb.82.2023.11.12.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 00:01:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom: ipq8064: drop unused reset-names from DWC3 node
Date: Sun, 12 Nov 2023 09:01:34 +0100
Message-Id: <20231112080136.12518-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm DWC3 USB controller bindings do not allow "reset-names" and
Linux driver does no use it.  This fixes dtbs_check warning:

  qcom-ipq8064-ap148.dtb: usb@100f8800: 'reset-names' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 40cfee17265a..d9771e8f9a1d 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -625,7 +625,6 @@ usb3_0: usb@100f8800 {
 			ranges;
 
 			resets = <&gcc USB30_0_MASTER_RESET>;
-			reset-names = "master";
 
 			status = "disabled";
 
@@ -671,7 +670,6 @@ usb3_1: usb@110f8800 {
 			ranges;
 
 			resets = <&gcc USB30_1_MASTER_RESET>;
-			reset-names = "master";
 
 			status = "disabled";
 
-- 
2.34.1


