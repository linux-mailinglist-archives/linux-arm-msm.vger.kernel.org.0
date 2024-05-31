Return-Path: <linux-arm-msm+bounces-21281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2A8D6391
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FF328D61A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F14115B0E6;
	Fri, 31 May 2024 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bu//1GCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA416D304
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163570; cv=none; b=Dyki4sVOq7ozdE88KwOjDPCOUfHV7iZ0NA5uG2IflMfTuwbvlLXxqkcuudC0niVN3IOWJfH484J6wMXTt3flIz7WzVPcHGFIIwt8Xme74118ieZ78435cxqMASkvWP+fuoGmB1MsEtWpjzxdLmuGtcPxx+ApU71t8hnlugImuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163570; c=relaxed/simple;
	bh=G1mbxFDSj/Ucu6h1gu4swW6RlHFX5IaapGAaerzeETQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9Emgdr4cxkngF/IGDdcSns+L9x9Rd1r7DZgZfb5yODdLUE5DOiz/fR26yJ8PvSzFZ2muzqhfsVJtAgFU7mz5V/b+uLSatwlx6wGhMaFo+gWtd1i/N//45AeLm7gPbcOe6Sa48cVOyfR/Lf+Z5QvDcxSQ7G4PMzvI+rG5gdswr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bu//1GCU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421124a0b37so14122955e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163568; x=1717768368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXX5N6TMJTvJ8ql3IQZLlxHbkNQgw/Xjf4y9EU4Gv0M=;
        b=bu//1GCUesp4phPjgIn+9P+KM1iMYnPGTKigNQrsvhbzuhwBm2sthlstM/FZFBXRv6
         fBDXMNfIFlnVesImKbIj16xhV83Ojidvw7/mlHqiZJ4v0MnsIF4QQ7TxJxLJBomEuf8i
         VehMYBKO+FO5OlSdFANmrTl9M5AYZ3rWBOIE36qL+2N2H8X55MNWzlkOWOpoWT9Cpgzj
         nZDyyN+bxtJg1OeMrVdrewLu2/ap0VLoADs6jmNhoCtMCj49AYyltPAbenFO2Na2n7SI
         v0SVwV5zNktmosflqkbug9KnX1nshLRSjMHcDeucNOxj5HomWglj1S5Ofw7S6zYaR+P9
         9UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163568; x=1717768368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXX5N6TMJTvJ8ql3IQZLlxHbkNQgw/Xjf4y9EU4Gv0M=;
        b=f59Z4QlJp//lGYIOFxu1OZPEXbtGgCz2ZOM9H9lyezKLbuo0G9Dowq3/yBkQBhTOYC
         s7nbrtX4EHNMbtljZ4qDdfhRc+XIXxU2daU23v73oZ+iGBwP/0huDixnzjrAHD01Hb4y
         iyfTRmsBSg1CRND0n1kGhcSLq6lIh9uJjzdAwIjm50MNsKdKW4nhAwlIy4eR/7+2Aj22
         /btSNnLewv19k8BvvRqZX/5zdHQuf2l2qilAZUUFAnFzKl3qPjbRFRYq/cFgl3AKly0R
         FUJ3XHivXwzX2ho2RLZAnkKhVjUq399fhUzu1NH/RqJAkSiwxsisK6P48eBasGFGERO5
         smZA==
X-Gm-Message-State: AOJu0Yyx4FEsLW2vcBor3dJSACBLEtJTllE9cRQuGguza2s5HXXaxPUl
	VyZQIHnU1EqEnctx1abB4Vdqbq7Vw4AdienNICdO+J380qp08ZHtcfrC1YoQzvw=
X-Google-Smtp-Source: AGHT+IHffNx5kVfMEeNSOU+JAQ54453j63jtHWt0wf7LJObWn7S33HMYPbgtUrCa1ATYzFyEv5TZkA==
X-Received: by 2002:a05:600c:46d3:b0:41f:e4ad:9ae4 with SMTP id 5b1f17b1804b1-4212e076433mr14215585e9.23.1717163567792;
        Fri, 31 May 2024 06:52:47 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:21 +0200
Subject: [PATCH 03/16] dt-bindings: clock: qcom,dispcc-sc8280xp: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-3-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=G1mbxFDSj/Ucu6h1gu4swW6RlHFX5IaapGAaerzeETQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYZE8X+2LvEgl9epBZFcuvaQNZRCUXHj9nXk
 M7CKRUxtWuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWGQAKCRDBN2bmhouD
 1y0eD/4lWI9S06JmACZKT0wRL9qxzAeW57GP6J+XcpDrXhDEptRjGtaFgbgOUMEGuea07smU/6b
 Y9xjrLGHTErmNnVaVgiNP981ol2iQ1AA2fc21RBejpmiVnpXDa6x2YPLyObhroq9Gne7am6Evt5
 9JHUIglsEJbM1wNo4rDpFpRHHe31vJtBG6knFdCSFgdKd319E8rybIxr6s7b/32RY8gGzLLUASC
 HJBx6z5/43N4MKUuPooDtUbMIFX3fVpkje5NcKqt8TRbD2WElEXR02Y+WwvyqWhw/lnYP06Quiw
 toHFi407viBhvUZLoFmWj2x3uqrKPeev/bCqiqvf7J4CfngBVQyTEE9Dcl8FwbPPt3EJRJYN2dE
 tcuJw0NXfHKuzQiLKT2goZdHhQ74zGIOuEy083m/xOc2Deqrz0AAXy55I6JLRDqvFSOCxWpoYi1
 oj3UQTViwXZwzoVzK0aZWfg/0GsipWCg4KRRQYfO9CH+AnVkHhVd8SK0L96xA+h2zvWpigt7wrD
 CTquoBs4ynnSLm38u4OmWEHoZF2x2ZUP9feWY5SHsKmRI0dyFc591mTbwsn/odid8BvXulzU/43
 BDUqFtTHbCUVasScISWXXhW9w48T1pcVhwnSC8FSQTV9y0r5aqf7o/sQoE6aMETcYtm5I92K36D
 mKDfJ/YblZMR+4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SC8280xp display clock
controller is also some variant of standard Qualcomm GCC, so reference
common qcom,gcc.yaml schema to simplify the binding and unify it with
others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,dispcc-sc8280xp.yaml         | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
index 3cb996b2c9d5..ffae037779a1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
@@ -40,31 +40,19 @@ properties:
       - description: DSI 1 PLL byte clock
       - description: DSI 1 PLL DSI clock
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
   power-domains:
     items:
       - description: MMCX power domain
 
 required:
   - compatible
-  - reg
   - clocks
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


