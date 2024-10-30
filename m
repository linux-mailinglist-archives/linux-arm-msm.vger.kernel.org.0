Return-Path: <linux-arm-msm+bounces-36425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C591D9B6246
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E5A1F212D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17F81E765D;
	Wed, 30 Oct 2024 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whm3yS11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C261E572B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289066; cv=none; b=TW8x/QSDySXLMX8Bg5Oe1Q9QGKNz+pVt761xUftNm0swEOlGcBvPXPUDIBArTru/J3wCoyahSrW/i8d9m+bb3BT99L0t8aQPs4YnPYQj5VDzzUaBhi2RlOdVX7gfL+HTaz+kEsX2sMMAZY4sMrvRZvpu3uGhcmAotCt4CsEl64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289066; c=relaxed/simple;
	bh=/m4eEeH/K4gVgsor+dioESR28ChoPLKFbc+zI6OiNzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va3TbBq9vCnA4QuVoupXNAirJmQBHoI1m4WXrEEOp/XHO7rNXgdA5ZdJZgsTaE4ZOYuSYH0J9N1DMV1cGS/mUik1XBUB6SYqbYmmfEtNhdNxeHoIJf3Z4RZRIuRx09F2c6gU3CRTL243onCiljhTVDlvhbFyJolBDjV+GWbpiUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whm3yS11; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3110b964so51954521fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730289062; x=1730893862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEPqrg+2k56fMzsfJgsEKMFhYFCOknVp80XNEhgscRA=;
        b=whm3yS11Zd20rZ7b40q7yTfOdL0Az2o2hF7kpgXS5wXN4XFcOJ3bt6bhqKdcRaFW8W
         cQAIFESbqGVDVzy/cw54xVpAMRvc/7S5nc+WwHk+k0gLtL1aP9guwB9i0FCSXhotTCwv
         ZQekmLPe2J8SWh775vuXPamIhWmrmK9TMYxEFfuS/TlXfsc6eTiW12T7ecGydZlbhblo
         9inkZ/qLshCylgcs+1KqEyNsSBBIrr0pyZdHYTaoKzfb7YBhETI7Y2RKw4zq/NfGievl
         oB6RaDKcydGTd7ZLb4eAM90TiCp+Hps+6qcv8nQI6A35gSgtQBksi9aHDL7y1Jm5O2Lk
         JDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289062; x=1730893862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEPqrg+2k56fMzsfJgsEKMFhYFCOknVp80XNEhgscRA=;
        b=H/GyJTvmT1L2EiqxXtu86yeW+/jNzOz7QZZa3UKmAAePDo2pCp7MukHFs7Wbg99BX1
         rE/BowJV430aJgiGa/NwuTkP5yz8YHTPQTmSWdbWSd/0M3f1UNeuG4+AsbZZbGUYhmH+
         fPP5i5JD4/I+eu1f+OVurZkKVXX74H7g/swNIAF/cE2MxBgzwMUe1f2IrxL9zJAdJXtk
         ycvWsrxbwACQQV+rR6a9Kr6+CYl+JhRbd/z70OY6zoyP2d3iKIUD13B2oRsgncOmvt2f
         ou0XDN+ssq50LXLfuZaZEghMihDv2MobROe3YGc+ZW0vR1sMJPoAVm2k5ZzRbzkLcRvu
         7VEw==
X-Forwarded-Encrypted: i=1; AJvYcCVYDa1AUD/JRZy3Gh4HPNo3rBkIH9BtAsqVbPoEeEXSocIzfafXiuEPwSMiDNceD+NnY35gmAcQlqNJR/+E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8eH4njNcPLXHnG6Tc7pq+WgQSCh76n9d4fdh332qNwdU4XAk
	8bEcz5D0QtToFPlkiJnKHPpWsKZMD5PHrK3/nUP7CZ6MhUc/WMC55EqkHrXRe2M=
X-Google-Smtp-Source: AGHT+IFfsSDuF8yjSH7MrjK7alR8o3pQZJSBe3ew6+bFZBlQOYzUeCVYWB6TBGFds0mLUxqZc2A6gQ==
X-Received: by 2002:a05:6512:3b2b:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-53b3472951amr7793508e87.0.1730289062472;
        Wed, 30 Oct 2024 04:51:02 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb81a5760sm233049e87.84.2024.10.30.04.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:51:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Oct 2024 13:50:54 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: extend to support
 SAR2130P platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org>
References: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
In-Reply-To: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/m4eEeH/K4gVgsor+dioESR28ChoPLKFbc+zI6OiNzA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnIh2he7Cjxfo4pJ5Rx48TkRWwgoLIkL9HqERaU
 TN4ASQK/SSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyIdoQAKCRAU23LtvoBl
 uKk6EADAuMe5tcrgS4CqYrx78W9Z0PAhuY0pWPyY4yNbFqT4SqjM95oCi9GhSspWMDv0hHHeF6w
 V4Qb+q74NGJHg9dMfYMp3EA/nODJFWlHLE/DkT3BiwMmmoNFae8WI4T0yf9VGrsayE1xlUKoV9T
 hAsL9WEH1kCz2OmVKjwnudTxvQpVnbaQ+KbOmilFiN7Ke8RSaJzie5EmbPk8VTON9bsVTIduxUk
 7A1amX60rncZkkE6T71Nd+EK54fN6PeLIfVHTqiKGyODchosl5rx+lahwL5tVTsTxr2q/KNaSKd
 lY1uZUOhIu0iM1XtrEAVSN013wkbCVn02mmgQHtOOR9s+ApwK1ae9YebYJ/kDQUOFv6QM+jdkdC
 JkW3TyF3iedRuvD5ESDr7F1wHGuaWkEXvyI01L4SjuQ/pP69llN/FFu14Sq+sEE+nq9J6Q/0zpJ
 gbFCWhWme3mBe8cLDRTMxTCc2ccGmXOVKsex8uD+gwervaiqZbn1+s8x88HRbJrmBCrVyl0kLGO
 CmEGEa2fYe+W0KmzfliUAkJK7jJYQBUMjrBM+ljcUXMzZr2+7wP+/zQf7o48c+Sdx2G19tMvQNJ
 +Bgt8fKcTSN+aSg6zdvshgCZMNDOzz7RgcKntGQo8mFW6+FohSub/n207KShRD7q/91UfjXJfgb
 VwgklK/H5zO6ucw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the patterns in qcom-soc.yaml to support Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d0751a572af39eecbbd2f8323a6c3c94b3fdeeac..1add7267f541a24e82e0cec62af6f0c839aca267 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
   required:
     - compatible
 
@@ -31,7 +31,7 @@ properties:
   compatible:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
-      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
+      - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,

-- 
2.39.5


