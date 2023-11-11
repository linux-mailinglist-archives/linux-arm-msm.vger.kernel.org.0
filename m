Return-Path: <linux-arm-msm+bounces-509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359F7E8CA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 21:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF5EFB20A3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 20:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F67911720;
	Sat, 11 Nov 2023 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1zBnuKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66DF1B283
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 20:47:31 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5E72D64
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:47:30 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9d216597f64so506961466b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699735649; x=1700340449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Peg1pxCwGlnhNKPOTBWdvFK6RQItCTgLiK4ys22+0zI=;
        b=q1zBnuKZgE8y/IgPhTpQCy1JhBOB4879vLQuhvTmXNGAOT70oRsrnWRRGMi+K/RpkN
         pasJP1BhPp3rX9kXmXOQCaGTDBDWBV0vNF3o5Z3avjHm2jk6etL0Rw8ljatHsvGNOTeC
         YM1eQjy4eku2213kDgS+yYpdAQv9lYfUAatfKcE8N6ajJG5TnSjNG0rz/qinNLexK2oj
         iqOBfYznH9pIPFdJPPDx4MnkakKLo1IuDaYjqxztISHt/wJwhrvIE8HBYuUU5JxD+Tzz
         CilP9Gb0oEAMG7cLW57MBOQcyhm3x1E94+wLbpyeX9voe7FzynlrcmgTZ58lEs2ckjew
         tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699735649; x=1700340449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Peg1pxCwGlnhNKPOTBWdvFK6RQItCTgLiK4ys22+0zI=;
        b=e9TC/uS/Irw8uUE/6lyPdzAI3FqYndluutOzyM6msXoPk0F/IHG56Uo5+ZBww0HyuV
         GFSTLwI48MdzqtDJQHmaA3Hv2WMpADgUv8LN7iYEDD73gPRDhCVX756YWPedsfog+3GL
         A8WJNpipL9VWp/e2vIi24Jzsboe7bQBR7ahaNiBV19N2bpqyIqEsd7b3gUqR7HQq9YqG
         QBC9hdt1fka9eKXiUAOYmX8fRt6mle9cBNdkeKUX6oXi1z74aSXi5MeJgvjmNwC64+j2
         XA/toTYykNWNIrQ9scM9UOMy2DstqOfScX9UO10wkhTw0Gz+PuakzbSewatTSZWcaH1N
         Ommw==
X-Gm-Message-State: AOJu0YxnTj1z0RsQjvcWZLy6oowPsKlGYtr/bO4pceBuyINV9AsbarSK
	fh7OliPKATeh7+nL+pzJ47Jy9w==
X-Google-Smtp-Source: AGHT+IE/AWG1HaOZp60zhem7NngI/0APEHckp98uQ4HTdPA7+GViVgAA3x2I697DRgKOwHFqYwMXbw==
X-Received: by 2002:a17:906:234d:b0:9d3:f436:6809 with SMTP id m13-20020a170906234d00b009d3f4366809mr1743119eja.39.1699735649053;
        Sat, 11 Nov 2023 12:47:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dc3-20020a170906c7c300b009b947f81c4asm1547346ejb.155.2023.11.11.12.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:47:28 -0800 (PST)
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
Subject: [PATCH] arm64: dts: qcom: sc8180x: align APSS with bindings
Date: Sat, 11 Nov 2023 21:47:25 +0100
Message-Id: <20231111204725.35707-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SC8180x APSS Devicetree bindings expect qcom,sc8180x-apss-shared to use
qcom,sdm845-apss-shared fallback:

  sc8180x-lenovo-flex-5g.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
    ['qcom,sc8180x-apss-shared'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a34f438ef2d9..6f5c07fa6c2e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3421,7 +3421,7 @@ intc: interrupt-controller@17a00000 {
 		};
 
 		apss_shared: mailbox@17c00000 {
-			compatible = "qcom,sc8180x-apss-shared";
+			compatible = "qcom,sc8180x-apss-shared", "qcom,sdm845-apss-shared";
 			reg = <0x0 0x17c00000 0x0 0x1000>;
 			#mbox-cells = <1>;
 		};
-- 
2.34.1


