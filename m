Return-Path: <linux-arm-msm+bounces-27021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0793BF0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17CAFB22835
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 09:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C47198853;
	Thu, 25 Jul 2024 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQQr5Qkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114F198830
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899530; cv=none; b=qMAkZZs2qHCF1/qIskGs+myFqD9xkP9LVi6r8GXaq5rTFSH0Pnra/aRCZxGdkfmvnLCE6a9QXUXSS0XuV5QFwcYhSE28VmblNWegeoNaCFgEMQDTyjW0/Stz3tPTbu77MUZ03P3miY81fYof6oxfX4R+5MP4NiMhXrW0iGeBYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899530; c=relaxed/simple;
	bh=0YFEJi/WmQ/U4OybGyjc7Rq181VxIAo6erfNivtbOZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+4LlWhquz0cN6fa815oARGYpV2S3YRDeK0MQ6HxLLJMbjM/O3uocJoiuMF1D+VcKpAJAd4QopHG+q+3PkMSAqn81ft44mB00KkykQyTLiZ4lg5XW0kt+BqHdgsPNvjA1x0kfIsm2NsY3S/98lioSSD9ec4xyVQzhjj7rKqxfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQQr5Qkf; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so10202631fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721899527; x=1722504327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCOtS+JQDOh3lld/j8QIIBoHly9qM/Xm+yrx3ENKznA=;
        b=AQQr5QkfJpATwz9u5Ik6msL0Uyu/Nff16rOqKSveRkugQVWPePDEpNI5jsa3tqrOQA
         S5XlfbDDA2IorGumTZmNUHXJN+7MlBaIodyMP+tk3SD61v43qpQguQWJz8aN5noQEt+U
         vGeEm9T5FGjIU900/ijj09TZw6HzJlRp/dYNbFkF6pM9WzA9/64utWHPRw6vgLBkHAoV
         xmNIH9qZiRVqOhEmcy027QvwJhxiDI+yF77NubJSsupWkiRCnMmdNlj/VpR9OQf7Vt/5
         dtCZltaOUgo1eiGYP3NzBJkIO+2v90skLmMQcG3Sb+dPoU60cSFkFr1PpspN/gJeeuku
         gmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899527; x=1722504327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCOtS+JQDOh3lld/j8QIIBoHly9qM/Xm+yrx3ENKznA=;
        b=b8xxjbmDP+3ZaSnBKbLDy7nMaUySkB9XIqIsvnMZ0mCCGA8e6eKRJOlJJfaiyZ3Yss
         uQFfpsQ4nGQQxCY6bhA3NQz6qIDTl9G1CORkzJ318HmQ8XXS9TpClnUDTbUagTTaXwjo
         Yanfbw+1i3X2jKtMjrgJzlxNhB5A8CA9xIxa1vSFef64ZbMz/ME/gORpgTYU3WCFtLM5
         5hNM76uIM+3kWXNE6vVugIL0wjlB1r3XjOatrOwqw/Ycbk5HIUkA9RpbOyFi7qSGavYA
         RlBxcnERrG+EhsaUFuJwJMHi1CK4oIX63i2pmXn+7R9ckO2p+ddF/X+IMX9vcWXsev6w
         5QOw==
X-Gm-Message-State: AOJu0Yzu4OH8p06ru4iyfYg3bk+eXU+Z11N02segGTcYyTrTPxNiDip6
	1FUqlVOIfh9rrWFJL1/j+ncfokHKdPvLx4VA7gJVqAWCXGWKFTJCZC7G/dJcOKw=
X-Google-Smtp-Source: AGHT+IEcrJ3ZZDkd2FkI8wiYYADKO7Kk4PfC61/9vDE9WsXeqSuZscjvzYcMoth2EgYAsIohbWjVFw==
X-Received: by 2002:a2e:7d14:0:b0:2ef:232c:6938 with SMTP id 38308e7fff4ca-2f03db740edmr9284271fa.6.1721899527087;
        Thu, 25 Jul 2024 02:25:27 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427ef3f45cfsm65830385e9.0.2024.07.25.02.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 02:25:26 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Thu, 25 Jul 2024 10:25:16 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: pmi8994: Add label to wled node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-pmic-bindings-v3-1-d7f6007b530d@linaro.org>
References: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
In-Reply-To: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=0YFEJi/WmQ/U4OybGyjc7Rq181VxIAo6erfNivtbOZY=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNIWSbEmRqbNeySZ+zXw4GaBb5Wif7Nl1JwMjkycc78h8
 umUz1YsHaUsDGJcDLJiiiyHm76seb3dSejK9qpTMHNYmUCGMHBxCsBE8qwYGS5tzuG/v3A5y9Ze
 ZYWb/oonJl5Yt4BRYoLBK/HcDq1t8+cxMlw0tVzN/W3ejv/vv9i3/oiw03Bp0kxTyWfsZLGNf5w
 XwwsA
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Add a label, which is a required property, to the wled node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 36d6a1fb553a..9ee59e6d2cdb 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -57,8 +57,11 @@ pmi8994_wled: wled@d800 {
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
 				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp", "short";
+			label = "backlight";
+
 			qcom,cabc;
 			qcom,external-pfet;
+
 			status = "disabled";
 		};
 	};

-- 
2.45.2


