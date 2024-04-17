Return-Path: <linux-arm-msm+bounces-17747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E345B8A8C69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62DB61F232B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FF83A27E;
	Wed, 17 Apr 2024 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0AEpHIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FABD38F97
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384087; cv=none; b=F+9v+7VWZEWnw5gvtJBIiLlSE7MKU+e/bUFZcwecdMDOOANxERW6cdGDgEW+kZc1f6Ks0oRnXZ7yw3DQ6uHkLCHF422f64rcO7cv1YrXnfQqPLcuI1V9Zy7X+ZNg6v3MQUc7rPMnSEQrRtEGLf58wuBOvl5aIAfOA+Gc90nTjyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384087; c=relaxed/simple;
	bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLTj0oJ/huTV8GSl+D9AMvaOqaJZQB0TXO5RU6bUtsJSJkN8oMB1r0YWWjXfGsZh+B4+mIA2fjtlxN8RdC5gsdO4SUPQ8BcTHETAwkRLm07iLV+61ym16rsusFDYR/7/ddBDREQDnPHvxBDH5hzdENNo3xss+3Vq7PvIPQJd7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0AEpHIv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d3776334so67380e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384084; x=1713988884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=J0AEpHIvYSSzowqFT7y6Qhi7De3PrrdmmOIBgUKegFO4AdubkA2KtM3xTcoGDVSEKY
         gGt2PvQ3dmJA6uQsu6gbJFuybZ6vn6xDPOI0QnW3Mik3gHCyzf6F/yM6ocvYhcEjD2TW
         U8ejsaJHYt+ch/7hB4wvlyVZV8XpaihOLuujIYgX+lBivBupeSq8n9Nm1mGvgVNUwldB
         O0Sccp3VR2L0zcEn2oCqJqPPyQs3K9WJMHJHGfpq+e2XLtoYLzH8ktcqgv2/iAv9zv+4
         OvXq+9t8Y09waOh6QDbC03+IrqBynHXDox+nzj2e2Fajgg+SjQujW5t02ocIIZIYKYpw
         WAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384084; x=1713988884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lYudh1XGipLZp45Ed9irT2kjTBzp7nX6WUMRhG9/PM=;
        b=h32RCiwmVE8811QSYNcrUdnMJF4OWcSE48GI5vJKcox2yoHdHd9h3rt1wU9O3Yxry2
         z5IO+255pNfxk76w3DVkn7XAOZ6wtk7Q774gxoV2Ng86sp0vnWz9daT7JAQgVbIieMbx
         zj1nPlrPo6V8JpyxANw92FUSLALrktalIJFr0/2DFsXFSzX9U3hI0mf5gYKfr0H68dx0
         vG5G5uEbQ1sXBtU7MLP2UHFvzkWPcxWzlWyY9uW6c8S7Uyvq1SABjvJcylCeARwDLnlC
         624P0PToEQF0tl6CVYDteAWWXOH1UQ8EFTWYfIq8+8oSitOFKHQCcf6YYpIF6AmWkSQW
         mhNg==
X-Forwarded-Encrypted: i=1; AJvYcCXLJrBrl/6gKlYvTcxGiv8Um926SX569oW2eYoLMGJSoT4kfnuGoiJ/UDNLYSkxYKjfCECM/AHKvqkUfXqHw345eNrcp8zt2CnwdDPasA==
X-Gm-Message-State: AOJu0YwpfNp/Lkx7eDLWZHmWzFpnpt7YRXC/BRdRdhmXhHgEnff/v7XQ
	kFx3djjOVH7ITmHXdQTG1O6hcHZhEcIS6EXvlm9lMiqfVO2yl9oEXfXbMxdD1oI=
X-Google-Smtp-Source: AGHT+IGxbKfuE7tOKYWJaJSpGP1x/nWe/jbsF0dBAScwJnX0ukMTu47VDz749HA5eUzZvJ0MfqluBg==
X-Received: by 2002:a19:7506:0:b0:516:d0d5:6f60 with SMTP id y6-20020a197506000000b00516d0d56f60mr166215lfe.38.1713384083867;
        Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:54 +0300
Subject: [PATCH v10 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-2-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=f1k2/XtnKKT0QabjDTtzy+0Tu+D0+1BkiYHMuQzuNWI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICp/E095iDTa8F+bI7nMeF6DLZpKpnbK1WlsZ
 vC11586iXyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqfwAKCRAbX0TJAJUV
 VmOID/4/QtTIUnPQg72FBvwzNTf7Qn8PSseRsPOVcd59hjYGzXVIKJUjALH2WyOJwQ5+j/l2lkY
 9Asqjwh8s2qg4m/ftcu9O4VpjDhopW7Pmx8s0d/qvFAPVDaKFGH/7YQpOSY9kFBWHRuHnbT7DXu
 788a89Yyuydvhf3atnI/JCVVfYoxC6IfPeq5jwpyihUKXGHDCZqM9cAiQrW5beQNOVcIAjQX6BK
 0uzpDRsttZ9Iuj95MkOx+0OYD3aQUInhuOKVml/vkbTZ3ZLSZMA6QcaSCd3hZVHut8JPOAOt1rb
 zyHRO3OS9B0jPQkhc+RI8d2n3wBH1WuXAQWMD3egHcqvD2al1RpRoceNJwrfyx7zW7SR03OfE6x
 NMkAzMLgiDJ1RyMPir15bsw7DszLyybjM2+kYahi/2LpBLyc4M3qxZd4lu3c7iD2Y4iQphaHzFj
 LHeOfa/ii2BXa5UKaU8qD4/7dWMSCuTXwOlez+OnFH7i/nb+Q+a8N8Y9wKOEPzlcKKsoJo9jo8/
 W+O3lLIXxKVa/QQhWpDqKxdSzSZ7IzBvejeZhyxC5muWlS1dkiU7y3do5WGW79SXV4raWtnLgl6
 H9BaXkJyOK2YyEJWd0z/dhxxDPXxC5o35zjyUgbgAaz+0pLdTvYVIOmr6YTukdWGO4ohoaeeNhv
 ie9OSctpsnQjJEQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

As it is optional and no platform is actually using the secondary bus,
deprecate the qcom,bus-id property. For newer platforms that implement
SPMI PMIC ARB v7 in HW, the X1E80100 approach should be used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
index f983b4af6db9..51daf1b847a9 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
@@ -92,6 +92,7 @@ properties:
     description: >
       SPMI bus instance. only applicable to PMIC arbiter version 7 and beyond.
       Supported values, 0 = primary bus, 1 = secondary bus
+    deprecated: true
 
 required:
   - compatible

-- 
2.34.1


