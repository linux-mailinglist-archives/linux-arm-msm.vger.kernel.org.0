Return-Path: <linux-arm-msm+bounces-32-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41C7E3634
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 09:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7FC1C20929
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB6AD53F;
	Tue,  7 Nov 2023 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qj8lAp25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2097D50B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 08:04:24 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D80F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 00:04:22 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so9178549a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 00:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699344261; x=1699949061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FB2VcHLhZHHgGwi+MjMB7tS8or/xAoujhJnXOAckqMM=;
        b=Qj8lAp25lG2Fgruy+JQzNjY1Rw/Aw1lgJVFC9UAYSuW2JGm0ONQskmFDg3qirVJwQF
         dN5IyV8IJXkWrB/wJkn0JWydMx9uR93wsE4hXmqAkgmmmgBpBcySZWVOccg6DWYgXBCv
         g0h3He2wU8MZqWV6XICIpHDftCf85oYSTCaZqL6nmLS6tRxENidR73DOca0oMGOUmQD2
         o2aM0ixzzWMqpLUxGockJfVx3Fj7vgDfY5XTmCnwzROoxTWdrvzqDiSEw2OSl3Bizk2l
         1eu5mlKSEibuAVIjLUiUcQ6+xR3hwHqVQbmmttG2Xjrw4oEBLM5iZlvt2W2a7kdPwTGb
         O0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344261; x=1699949061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB2VcHLhZHHgGwi+MjMB7tS8or/xAoujhJnXOAckqMM=;
        b=ghwZsdIZKFIacAPuYBgnwzJz4JT+xjgKYmjPQh8vUcOf8QdGY9D6eebO0kAUdDPMws
         XMLdT3Eb7tdeARed3JBwE4d4G03qy+wk/PUcCP/aBs375R8a7cureqE9hhJZ6EvEjxrG
         bvB6X8h+SvImhyBrE49dD+XErOw5I/4MjlvroevK+cGL7JNyX3+FWGK7yKdSssj92E+K
         bUGdDQ/2UWPZdxv6wF4QI1C3RMlc5Y4vCf0DnrhTeZfujEfKiGOp9fq+obKXnMPK3/oB
         jX0TmfOUs90MGbDSJc2WXzxC+mTefFNTmeC+r55oUBNKApLrOEiJKXlfOQsvLtn7glsS
         71bA==
X-Gm-Message-State: AOJu0Yy/bfGdJWTq3Y8qIkm3tvRdpsSnfaPaRyY7zu1n5h8OHpexB65q
	aK7onpOGHW90BE155AbQIryxOw==
X-Google-Smtp-Source: AGHT+IFR+aJYWXhyvAFvm5RFoCOIyUrphvM/LPTdFXLLozBi7vigz5t/WcftOptI9fK95JruMkvELg==
X-Received: by 2002:a05:6402:520d:b0:53b:3225:93c2 with SMTP id s13-20020a056402520d00b0053b322593c2mr32412780edd.8.1699344261228;
        Tue, 07 Nov 2023 00:04:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id r15-20020a50aacf000000b00544f8271b5fsm83449edc.8.2023.11.07.00.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 00:04:20 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: dts: qcom: qdu1000: correct LLCC reg entries
Date: Tue,  7 Nov 2023 09:04:16 +0100
Message-Id: <20231107080417.16700-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to bindings and Linux driver there is no
"multi_channel_register" address space for LLCC.  The first "reg" entry
is supposed to be llcc0_base since commit 43aa006e074c ("dt-bindings:
arm: msm: Fix register regions used for LLCC banks"):

  qdu1000-idp.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 14155776], [0, 438304768, 0, 524288], [0, 572293416, 0, 4]] is too long
  qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:0: 'llcc0_base' was expected
  qdu1000-idp.dtb: system-cache-controller@19200000: reg-names: ['llcc_base', 'llcc_broadcast_base', 'multi_channel_register'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 1c0e5d271e91..618a101eb53a 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1446,11 +1446,9 @@ gem_noc: interconnect@19100000 {
 		system-cache-controller@19200000 {
 			compatible = "qcom,qdu1000-llcc";
 			reg = <0 0x19200000 0 0xd80000>,
-			      <0 0x1a200000 0 0x80000>,
-			      <0 0x221c8128 0 0x4>;
-			reg-names = "llcc_base",
-				    "llcc_broadcast_base",
-				    "multi_channel_register";
+			      <0 0x1a200000 0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 			multi-ch-bit-off = <24 2>;
 		};
-- 
2.34.1


