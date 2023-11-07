Return-Path: <linux-arm-msm+bounces-34-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD907E363E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 09:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FA40B20C30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 08:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24124D306;
	Tue,  7 Nov 2023 08:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFf5aoZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B528D50B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 08:04:42 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E6418F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 00:04:40 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so9024659a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 00:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699344279; x=1699949079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bmn5eiaE58u9BZEkyunhEFzoCx9m/5MWM1mIBk7TdSg=;
        b=aFf5aoZ5pVH5l7u4+4mvFc8mBE17uup67AygY3iB+dwtYvNSUCxOiGcRhQ0jucdYoN
         9BDXrNWYfAc5QVeJt3q/BTyJsMtTZ841BxNt5rQfU1alj40G9DQV0MlOrGZgVRcFGFlV
         afqA1SSlS8oteBKtggi8KrdxKlnlf1HFANiuyLwTkkVgx/x3I98Px9r0Mz3SItAiXAG7
         lKeIpnjC8zTtU4se2z0/bmDpjKDRYplHN0IXGwumQVqZqo59tqSYJQjLaOxTdPatcGoA
         qwzCzYWne2E+bSAZP3YT6vsAc05otZybGNBsvzOxqINw3QVcdCMqHdjJz7TPA6WtaN03
         8MYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344279; x=1699949079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bmn5eiaE58u9BZEkyunhEFzoCx9m/5MWM1mIBk7TdSg=;
        b=Pv0OWlZnoIaP8PQq7sSeH+Ut7QoPmgLdTNHx4T9i8lxf7Y1nTuO78GSagMzw5DPwbX
         DS2xzPa2SJsvlOnxCUww3OI5k7Yqn1/nfR9uo3H7epvtXvMac6qy/mhpvm4+BU0x1oVV
         kdmfB26MM5Bxy/MiBymlbqji7tg9eZmHk8rqFomIGMEFMwJ+llhcxyWcJUE1ZmgtRx0X
         ywlQOw31gxwGtU7GMqJDGJxCbdE2S1FSSHWYTlcoBCxXJfz70ypkArytKj1Ojek8UEO1
         0MCEbOEc7eVhrWEVjH+WfwudGZv34ru7HaQ7ny9HR85y8djJW55MWPQhCGlUJz54aIpz
         t3vw==
X-Gm-Message-State: AOJu0YxT4O++/CNri/oa/k3Qam7E7PKrIezCZLjZFRXJLiCs5UuD+ztn
	w48QUq/+U3SZBlSU7D8sZWLyN4vkCPDAf7Ww+N4=
X-Google-Smtp-Source: AGHT+IHNFiZZAS89De+r2+NiutX0cPO4+E7YrX4WohWqo/WH7cVUrGbpP8xLShQxZ+YINYWMxIJEPQ==
X-Received: by 2002:aa7:d755:0:b0:541:29c8:9575 with SMTP id a21-20020aa7d755000000b0054129c89575mr25058249eds.28.1699344279060;
        Tue, 07 Nov 2023 00:04:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id x16-20020aa7d6d0000000b00532eba07773sm5049106edr.25.2023.11.07.00.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 00:04:38 -0800 (PST)
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
Subject: [PATCH] dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries
Date: Tue,  7 Nov 2023 09:04:36 +0100
Message-Id: <20231107080436.16747-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm QDU1000 DTSI comes with one LLCC0 base address as pointed by
dtbs_check:

  qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:2: 'llcc2_base' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Recent LLCC patches were not tested on QDU1000 thus the LLCC is there
broken.  This patch at least tries to bring some sense according to
DTSI, but I have no clue what is here correct: driver, DTS or bindings.
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 580f9a97ddf7..d610b0be262c 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -64,6 +64,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qdu1000-llcc
               - qcom,sc7180-llcc
               - qcom,sm6350-llcc
     then:
@@ -101,7 +102,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,qdu1000-llcc
               - qcom,sc8180x-llcc
               - qcom,sc8280xp-llcc
     then:
-- 
2.34.1


