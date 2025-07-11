Return-Path: <linux-arm-msm+bounces-64573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E961EB01C79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40768585798
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821932D373A;
	Fri, 11 Jul 2025 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqSd/0N+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758962D23B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238684; cv=none; b=LPRvLxWNqhXu9lHamvaJ7KIBnT0DUWMGBj6nesTADtlMXvmLS/FudplDSoZvwE/+BBa3Es9LmYvEsA6ivjSyfmfjdorOz6GG/cjsv2U0GlgdWHfHv93roriGoHGGRvWFsqQMCt2a+yVcAWMLSRwOk/4WF6f1IgipIc9aV4S0lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238684; c=relaxed/simple;
	bh=5VDFXA8I+E5iXu2Bb9Dkpc45x4jcmubRsSn5foFMXjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YS5FtMa3jDO7LTf3wM1bOg/M0On0voxmNsd9az8Bs996Fn6ZMnr0fnPKRqh7qmZW6RGkD7am8P6lGApAnr3BitPxWI4L882A45Y6d4sj9TAMrixdscEjbbEbPFbL5wg1uYXlJUbDbNd8QWOrTgTXdLd4i5J5QdkPoA3RGHAlbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqSd/0N+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54700a463so1229809f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238681; x=1752843481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1AQyvuxz/zrLJ/xQ09mTaJr5J8m3jd+X+5DNs4wLi0=;
        b=RqSd/0N+SgKDKa//Dvwb03fYb1HFmFjFNvrjCSTv2Y2TDSI9voxbGBHaewOPCHjOCp
         bpCTM+ZOOgnvSwKRM0XOegA8I0elU+s8BNKKELlSI9VqlYYXJI9x3B0joLUu2WmmS2Or
         +GiUGThboBz2ZdLW/ONWPmgx4AaoX2F5CVIMuF4Xg1HyCIrQg92pxcK5wZ9n9BPHu2pf
         Of5tA18ts+KHNzG8sBT/tGGG/67P5xKdFf580KfQHxgWNGsZnhFD8jS3c4ZTAIiGDSxD
         m6x58bzR03qmIg446JwtEdT4OfAfCWaXLAO0Oo39cdr26unIEmSnKFRgnS3rGvHsOItK
         4CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238681; x=1752843481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1AQyvuxz/zrLJ/xQ09mTaJr5J8m3jd+X+5DNs4wLi0=;
        b=WzmNCx+kbv1CLb4NMzmnhVzh7SOhOpsWTad/PXT2LiUJItGcOX9ri4mmew/T9eklFg
         ppgITSyVSwsk7hAMaht5Qmv9jEMv6BknI/Ib0N0W4KI6AYjAOmC3XvIo2iDnUHJswrJO
         9yxZWKLWj7nptUlKZ9jd3SFB+ViPNUOoSFn2nC69tSkPdGKE8vSv+rJ6N/tcGkv6gH3M
         LCaXjsEJIxGAX0E+0YE9yOKwkykVp8mpdFd6GVJgpEaARFTV3Y+fNblP/CJvXA+R3xkI
         U/8iePy2dfl7AJtNa+UwudFtMRnRu4ZDam/UfP2x7MMrDiTdn7vGsF7pKEKhNAUgbJdR
         64ow==
X-Forwarded-Encrypted: i=1; AJvYcCXv5zHHekMZ5fcERS8yzSnq2ostBntuR/XNeKLJkgMSeuL5szD7EwVlb8FZNGloF0s+zbyIExPUqcf9VOog@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsNdPZBKZyQEl6kEWsDmm9ZIw8I6f3Q4gVgdtGSjv69acQWW2
	KhbrEaQuqnap68oqqCFjYzqLt5rb6KAnEtNDPPxqXXR2WS+XdC2zUgKevHjzSfKMXgs=
X-Gm-Gg: ASbGncvmfIVIAVM1uzo63DfmlWI9bSRhc3NEUy25KgVXRa+FKqBsfkWN/eopFWeOeUb
	8tWRD13axlTIeBlCgoXOW+c+x4VQu9iJq1qikSjd2X9mWNkTInUWBZa1QoPYBzcYSQXKySxQMC6
	baLrxXZ0eJPBslhTrc5FOmyO+P7yOo9IImJh1zLrb6Irik0cCHY7GfG1P23MSrVMs4lxXqsCkou
	VaMRWEKG8SOAJIelTAWvw/WsNMIE45qzpFQSuPA8iSU2G0tLV0oxoP72YW9VPl3BOxjASGH3xAk
	eBo4o6eofwXl8hMylQwXRcDO7YoacSEXvGBjUWy1d8pVrvqYOfIxUoZjXPwunMyIYcrkX+Y35oC
	PZqg520GijY5UfeXf9tc6pTfXXuTWyscNf02MRweG1h87il6MXn7pHxMTZIbn3crN
X-Google-Smtp-Source: AGHT+IFCINtjBENaeAj10KtYw+ipI99HYuyHocaT2yFg53cizOICcvS4H5wwYoC8qC05rHejKDw6xA==
X-Received: by 2002:a05:6000:642:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3b5e7f34e49mr6891264f8f.23.1752238680724;
        Fri, 11 Jul 2025 05:58:00 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:57:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:53 +0100
Subject: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5VDFXA8I+E5iXu2Bb9Dkpc45x4jcmubRsSn5foFMXjY=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpSbcpVOwqqdTtfGI5BM/HqJWyqBUExf7p0G
 0Syw5dgTj6JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUgAKCRAicTuzoY3I
 OsGoEAC2MVpyLtQF+tRtU9rVblWxWJUGQDeI94C78Rh0mZLPctX1bvnhPFvnnpcAteCS+LZkJaB
 W918YbzQfidrn6w7PmXn3B0pNjsvhfrTaKjigDeQU0J/zj8WElu/79CtffjBbM1uFdFtQtKgzhy
 nMzzI+3jYNWfKGEfFzw9ZDRbxo2s4xkEKlhQIo0MIxr5X4rzvdI5KuIsjczjAsHBMYawT+LhpT3
 8YAC2i3MvtIsxLQnlcjjtAutEmgpr4r7qAKQFqLqWmB+ZWW4D0KE7SKTNZkYY+mvj4s61/vPOcH
 NHRI3Cq9J50DtDZDe6kCXfxfyK+Wdt8EzugSqVDzyGBTDwgK3A1yMJTbF50dO2aEsuQxv986D/q
 4ynvYNtr1QdMek99gCuFY8R18IxdSkdIdf91az5uzRjeDOiVkg8gxf2yFmHJLSbICF1onfkdTab
 vmYS5bSv+MbP1DUg+9vQvrmGABrz9QuFEoI0w63hIQJEzLnhuj/yPWuTH6N4BcRPEpoa0ieiUx6
 MJX5l2YsKAXX1J8Kg7sJ/X0tbuC6KQBHErkyfe4Ufmb8/aW5atTa0Unfy+TzpQAKRhjJZ8ZuUTJ
 kNR+T2s8qUfZ9JJhmX7R22GJTn3CjCELB4A7ylEaQMJ2+CdvgCeiBzHyFMibTmnmfNuFAQVWjze
 qfiZBsmx5CmjVrA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The first register bank should be the 'main' register bank, in this case
the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
to CSID or to other blocks such as the Sensor Front End.

commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
assigned the address to the first register bank "csid0" whereas what we
should have done is retained the unit address and moved csid_wrapper to be
the first listed bank.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b075341caafc1612e4faa3b7c1d0766e16646f7b..2438e08b894f4a3dc577cee4ab85184a3d7232b0 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -21,12 +21,12 @@ properties:
 
   reg-names:
     items:
+      - const: csid_wrapper
       - const: csid0
       - const: csid1
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csid_wrapper
       - const: csiphy0
       - const: csiphy1
       - const: csiphy2
@@ -190,15 +190,15 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb7000 {
+        camss: isp@acb6000 {
             compatible = "qcom,x1e80100-camss";
 
-            reg = <0 0x0acb7000 0 0x2000>,
+            reg = <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0acb6000 0 0x1000>,
                   <0 0x0ace4000 0 0x1000>,
                   <0 0x0ace6000 0 0x1000>,
                   <0 0x0ace8000 0 0x1000>,
@@ -211,12 +211,12 @@ examples:
                   <0 0x0acc7000 0 0x2000>,
                   <0 0x0accb000 0 0x2000>;
 
-            reg-names = "csid0",
+            reg-names = "csid_wrapper",
+                        "csid0",
                         "csid1",
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csid_wrapper",
                         "csiphy0",
                         "csiphy1",
                         "csiphy2",

-- 
2.49.0


