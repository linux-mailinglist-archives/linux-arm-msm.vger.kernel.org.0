Return-Path: <linux-arm-msm+bounces-495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1177E8B24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 15:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41BA51C20848
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 14:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F29C14F9E;
	Sat, 11 Nov 2023 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0qdyuO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2E13FFA
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 14:20:00 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3A03AA0
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 06:19:59 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53e3b8f906fso4620935a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699712397; x=1700317197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptbiafykJ7pRIMqCQZ06p889hMKKC590ILuJm+wGBD4=;
        b=B0qdyuO/jUCpcDtPvNLuwdV38f5yqma60rauBCnaq2ysK7eOpMku3EGkNSnUbzTFfM
         37MKFNqPHx7yzdet44hHrdMaSuoY08KOzuaZnaZSIb8eUS56dL8vvEpc7lk2Bx3dRC6a
         prt4r+VI2V7hs3HgMgbNKX+NGB8+HViayYM+S/QARLnxwh8KKe6fpYGmxqXJnq3uNWS9
         ZV33sFTOJY2N+rcXN5ly2Ts4H1or0+JwkLDcaaOFlKyWy6ue+LDqD/dbuxHgj/XwLZEP
         xVN+dLKXFecjODi+PyRwPRcmIYZSvN7tPXP3Bg1dPg/TqF3NRX4wnAyVktE7KAexPPEI
         NuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699712397; x=1700317197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptbiafykJ7pRIMqCQZ06p889hMKKC590ILuJm+wGBD4=;
        b=uaCpPezwo9cVQQrlM7erKBVliBqdey7qLu5da7VTSazcQKpBGs2dWnG7mR6BzzJIOs
         1HiV345V2D6sAriII2eKZkcjm/6BGMagEt9219hQFlk9g/ZlPIMloaraH3AFd3abp9uK
         KiPl4CFBUGzmz+SCfU6Z0W/7k1hNlt+HkBf72K36MYarb8cy6oPl03ORsiuaGVr9Wbgv
         W6z1r6kqWY6CcMWx/OYakcDAswHGN7TbL5+72QEE+iSXwV15o3LydOoNzg4632PyUSBl
         ciwSrvRGkvp7+4+K2tLJLt6bQoOk6QfIKOIyCmAVLnuccVoPZvEjQKfiuh0RkwcJ7g+L
         n8Wg==
X-Gm-Message-State: AOJu0YzetjqkJ9UUn5db+Yuv3uWjlgIrSOqUCtk4CxFfvT1Xx/vEgceG
	PeRE0mFjRWP8G8XSObk//yvTMQ==
X-Google-Smtp-Source: AGHT+IF6WuaSFh+2WoYZFrNj5cszOB/hqZsoJg0oXGWaqi+IL9O7EVOR6XOKlu/R5PzGbWOpD3GPlQ==
X-Received: by 2002:aa7:dd56:0:b0:53e:7781:2279 with SMTP id o22-20020aa7dd56000000b0053e77812279mr1490668edw.36.1699712397566;
        Sat, 11 Nov 2023 06:19:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dm20-20020a05640222d400b00537666d307csm1035408edb.32.2023.11.11.06.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 06:19:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: adjust number of interrupts on SM6125
Date: Sat, 11 Nov 2023 15:19:53 +0100
Message-Id: <20231111141953.51841-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM6125 DWC3 USB controller comes with two interrupts (verified
with downstream/vendor code of Trinket DTSI from Xiaomi Laurel device).
Move the qcom,sm6125-dwc3 to appropriate place in allOf:if:then blocks
constraining interrupts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 64043b91ffb9..3f41362b2a91 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -375,7 +375,6 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm4250-dwc3
-              - qcom,sm6125-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
@@ -408,6 +407,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
               - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
     then:
       properties:
         interrupts:
-- 
2.34.1


