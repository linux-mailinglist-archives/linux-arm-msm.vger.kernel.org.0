Return-Path: <linux-arm-msm+bounces-11332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29442857B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 12:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFD91F24C1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DE359B6A;
	Fri, 16 Feb 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HcKXPtbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6C059B54
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708082106; cv=none; b=CDAVxF2k2EEqqgtlO2l/Z1bcsd3FcBsztPP+dEHhsOUVCeNR47epQqrpqSu9WAuTRN7Z/YcLG9C/3tt1AUUKgMOnfXxYG9kXccKm5zffSD0K/X0C/1wIsm/rqY71PH0iTpdIjN22WNzVAFU19BTAS9mzWo9c6PrPHTghRI1+Dsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708082106; c=relaxed/simple;
	bh=yM4B0VhR2ZyFTPfWAEKWUVg6SZcpAA9Nr+YwCX34LyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUC+m5OZtBKuKMLJjTrkEtuHW9Cv+7VTsFzMx9jta2UlnnhvauOAo1N/gAEI0KHdXHy9b9bSAHveZKrJDdRg6cNoIkJTI6ABMkY9DFTYjERJtWL15sNth8A48bjZBhw2dww3QLzt9CjdyHCQaooNd1l1hPTnH4xxYW1fwxEHdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HcKXPtbn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-511acd26c2bso2737622e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708082102; x=1708686902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUgMys9cICLgxqIOovzi8G6eHIHr5srSA/v9QvAfrFg=;
        b=HcKXPtbnQ1NQdbKRbh8B0xkZ+NM5fvdaYclCwn1j4U+s93bHmBArznSeybYoAJSqNu
         RiuTbWueD9lDH4+zoxUjHYVcyh2ad8638oWv3NYR2YHNzdMAjWFhWoVLQFmP7jICchdT
         gEv33T7oI80/6CQT4tGhY3KRP4rBUAhaPoE40nkqUxaYlwvr77YMHvrq9VJBsrBY778b
         arTPv3vmS5MP1UVo6YOCn18HHJWtY96nq0TzBMhPvU2K6KSSlU82/IHHSMuuBZMUEEvb
         rD3025k3lWB+Qmf/5Qh+Xp/XnEhCs6Om3Z9xAiYgIoz/oV0UO68pKPGi/wLdkJGjWCjs
         nA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082102; x=1708686902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUgMys9cICLgxqIOovzi8G6eHIHr5srSA/v9QvAfrFg=;
        b=KZH0+w5AJFgtQyUsvBAHIjUemGpwpIjRw/xD7ABCCKM3oTa2Xk3w50T7Lf5BUOGew4
         T97lNexeIj8cAUlwbTGhVMf8jFgLxQTp8PZ3SStjtyW0sg09LjvcQ1RwdGJlQwYs/2uv
         0s+8aDNE2q9rzyPsfriuD7JTyyx2ZjEziQjAjLkuqLXOJ/T6dXi5Jo4JBiNgQmlkfFHv
         5o0oEx3wKqwS5ibISJcro3eezMIBqTTxDgIKW4XFVoAbvEMyKntKTJZ/0ysiRl2krw+F
         diuGqr1m5I5+Wm5sKhVQMI5avhAHr3+Vm5xsfMzVnuKUlfauR8UqObgO+Hb5gTtYa/CH
         lPcg==
X-Gm-Message-State: AOJu0Yy99aOmiZk0HXPtKkXp8FCrYy0gBti8JLklZ97+mzFESufhD51S
	5tZIxEGKkhy3z7CPuXN7ehqKjfHnpEa3IBrL+fjyElPeWjUI1zafjUUet/Q7VXg=
X-Google-Smtp-Source: AGHT+IG7HmZHE2ZsKWOSvcHAEXT8LuBwudH4+K43CtYLnUccRWSpPzg8kdHWb5SA6e75D5tNTnjXdg==
X-Received: by 2002:a05:6512:344d:b0:511:ae1b:eea9 with SMTP id j13-20020a056512344d00b00511ae1beea9mr2955947lfr.56.1708082102386;
        Fri, 16 Feb 2024 03:15:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p2-20020a056512312200b005118eeb18b4sm573405lfd.45.2024.02.16.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:15:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 16 Feb 2024 13:14:59 +0200
Subject: [PATCH 2/2] dt-bindings: clk: qcom: drop the SC7180 Modem
 subsystem clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-drop-sc7180-mss-v1-2-0a8dc8d71c0c@linaro.org>
References: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
In-Reply-To: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yM4B0VhR2ZyFTPfWAEKWUVg6SZcpAA9Nr+YwCX34LyI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlz0O0zvRZcNKy8jiAUU/MWxzRSa+mJnvvysYa/
 Gr0d7qjJrqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZc9DtAAKCRCLPIo+Aiko
 1YlYB/93gE8WzFMydukrlZSg9wcHH83C8jLHU6EVGDT1Mj3xSy9Pz2HaB7LdgoCjf3TT0gHcOJ4
 VEG/69viSW2ZnN5GOSZu5fvMDYynY3KoqZaInQuN3pZALyp6+dGJaI/4vsZXwsCaeTRhQBwdkVe
 qT3pZmYF0C5jH1ztZkaVBFYhKPM2p0Urr9ZNil2ezdgCUPDs18rj6dd75X/m2j1TzJE8U3wGmX4
 dGNGGu3nUGjVjXBr3muo4xXzPjixiBzjvjWqpUQpf0olm6vFu2/8w4kDNXzu080z93VEAjJQuRc
 yEGheKkzlRcUM0bES/vgQT2fKmrrbgQHnBqlVaRvWB7a4/T5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This clock controller has never been used in the DT files merged to the
kernel. According to Sibi, it only worked on the pre-production devices.
For the production devices this functionality has been moved to the
firmware.

Drop the bindings now after dropping the driver itself.

Cc: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 61 ----------------------
 1 file changed, 61 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
deleted file mode 100644
index 873a2f918bac..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
+++ /dev/null
@@ -1,61 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sc7180-mss.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Modem Clock Controller on SC7180
-
-maintainers:
-  - Taniya Das <quic_tdas@quicinc.com>
-
-description: |
-  Qualcomm modem clock control module provides the clocks on SC7180.
-
-  See also:: include/dt-bindings/clock/qcom,mss-sc7180.h
-
-properties:
-  compatible:
-    const: qcom,sc7180-mss
-
-  clocks:
-    items:
-      - description: gcc_mss_mfab_axi clock from GCC
-      - description: gcc_mss_nav_axi clock from GCC
-      - description: gcc_mss_cfg_ahb clock from GCC
-
-  clock-names:
-    items:
-      - const: gcc_mss_mfab_axis
-      - const: gcc_mss_nav_axi
-      - const: cfg_ahb
-
-  '#clock-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - '#clock-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
-    clock-controller@41a8000 {
-      compatible = "qcom,sc7180-mss";
-      reg = <0x041a8000 0x8000>;
-      clocks = <&gcc GCC_MSS_MFAB_AXIS_CLK>,
-               <&gcc GCC_MSS_NAV_AXI_CLK>,
-               <&gcc GCC_MSS_CFG_AHB_CLK>;
-      clock-names = "gcc_mss_mfab_axis",
-                    "gcc_mss_nav_axi",
-                    "cfg_ahb";
-      #clock-cells = <1>;
-    };
-...

-- 
2.39.2


