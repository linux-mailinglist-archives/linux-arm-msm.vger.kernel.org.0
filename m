Return-Path: <linux-arm-msm+bounces-51406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5CA61238
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CADF46246A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 13:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B2D1FFC4C;
	Fri, 14 Mar 2025 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ7erpiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F11FF5EB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958055; cv=none; b=WWWgqBUuLxaifYnYkg5U4FLGMLbkt8lVpyMsD7fuDYmMTdGFUFThsPu8H02w2ANq5HIU4DNVXoXy0fm6PmrcfU2l/TVEl1J98Z1eHEVbXQh5VsZrl+cB0VAAwx+I6Vpl5lGuaS9d0IEtguOj3kCI/YsESU4r7p21v4q0W+t7+gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958055; c=relaxed/simple;
	bh=cE3ZDLHMVCtIotuS81Y5prDseawFiAkM5c5zR5rn+Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDTda3YRSmfHFx3tJV30obazstu4dOofiz6FDF3mkuEJmmsRr+hsnnxo2qL5HEq4eRUv+uVq2g7o6r6G1pt9NolwL4VwuTdmm5lzbb36HaAxbs2h8qwzPgWtETOxQOxZ/hfm4aIEdHobILlcgX8qd7k4io5HGdWOIas25vgxa8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ7erpiM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29af3382dso336695266b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958051; x=1742562851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOgk5pHedNikU/L/p9FY9VlPsm+Vrvspw3iFuqU2V3I=;
        b=VJ7erpiMMJvhlswqK+g4DJFRLxeLyd5ulWnhuKVsREflXBDAZzcqzHfvMWC1J6Kw/b
         XDsAfaygDdQ+mMNXHktVOE4DjH0R/0rUfoc/2RHaRvuBF/waV+WfxbK3wpdF+iQVEP+J
         orpGNiP58h8hRioFc1RDaEMOTrLGp6dIYG+4Hce8wjbe4xeZaoaaVfPED0DZTUMYp8gq
         EIruhZ8zKNtDqFsPC9Z4A958tIUsUAqPePPV/GOz4lw3ctGlp0MWXzUhTsx10ZdPtH4d
         FGPqLhDV/zZvTDxiO0yOoGdJPc5+302Txsa5yfXjizXTNsVlM7FrQAI5gYzIJzPgnYxa
         7Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958051; x=1742562851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOgk5pHedNikU/L/p9FY9VlPsm+Vrvspw3iFuqU2V3I=;
        b=CbZRI+xyW1eP4D7BHChu8bvqbZAU72tzLMrogkVDVQlMcE/qg4aHYuwOgaOMPZeSeV
         FuRKl9vvU46Nfio2KEsJJJ9Mb3QamDxiwwLfFwD7KjqjceQ7ciQ8CXklv0Je4qng/opi
         VyEzp9TI9J7lPqq0Eik4tAA1rTbEWONO6wSRr266Xh2rnCpEC1uNdV8SBJ8mvt3TxMFx
         CqKmdKuFjBZSmYpTZLCtxuM0FtgQZzsjRc0ShfQ7+vKVDI5QW+TRrp2H5BDBayn+kZ7I
         tDHtEGQkqBCf7HUhdtV8Czp84rDTKZ0FsrcY+nShl3fCSMHfvfzGA0e0olEh7zfhiA+5
         rXWA==
X-Forwarded-Encrypted: i=1; AJvYcCVW+Gv9iTCWr1ChYoJh3fDKTaxv2vH+BTm9OfvHU047zDwsI7KfyL9eW3JUQHQPDeOW4HYG4trmMG9mbTND@vger.kernel.org
X-Gm-Message-State: AOJu0YzXm8azqU+4wuQnB1nypshdcRMuBewdrehSN3ySBKZY1nz0m3Jm
	z92kpxveY6MugvbtTfueCArAmiMzeg6qxxf4417Bh5cUedDDZruhG9ImAmIryR4=
X-Gm-Gg: ASbGncvjY0i+NkGqsfMVTi6yjlTHPokieX6pmQNDKRPBC14lUQMSD0QPEZQ65BvFrI0
	SKGpEnHawggK4dnweW6RNVwF3B+qHEW/qlZhlN0vK4abijSSev2c7JnR1YlSmSNbAYXFQH6WHdu
	ihhJ2W45AyRCGNCOxCAnyW5m3dJYDBDoY+KwA+IvqNOPyluLVzDjFWTuk9hu5GAdXFNvgEdCv7d
	WKrz09v1ozGPvNUmE11/+txiZPHUnptd0kBlUSeitSO2TMZl5jlPuFyffJ5ZcmEaoOJv2odkCXV
	DteM5qGvBE9x2UMI7BHV59Kg29mkxaxy/KobWTI4RRS9Xfc2S0ToUKz0NPZC7t0RoKikrndFL8t
	YPaw9CIXmMs9VzZ8JQZDWvlkKAllP1gR86XwWnCzWdIWGBu1xNfE9D5CM3JMf8eYVJFQ9
X-Google-Smtp-Source: AGHT+IFICfx6s2ahDilrUKjMY2hoAKzdOXRDKZ+U8wu5DRcXfNxv0E0ZqY3VVzjA0AW/yZ6QM1OUuQ==
X-Received: by 2002:a17:906:4795:b0:ac1:ad15:4a8a with SMTP id a640c23a62f3a-ac3301e01b5mr325622866b.10.1741958050564;
        Fri, 14 Mar 2025 06:14:10 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 13:13:59 +0000
Subject: [PATCH v6 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-1-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

[bod] Adding the opp to the yaml is not an ABI break since we currently
have no upstream implementation of this yet.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a26090186e4ee4397ecba2f3c2541672..18136694d35977f51a332b9040fe61d0b18ac44d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: MXC performance points
+      - description: MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1


