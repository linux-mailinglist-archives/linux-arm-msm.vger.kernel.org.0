Return-Path: <linux-arm-msm+bounces-4164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F480C3BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B3F280AB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 08:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFB5210E9;
	Mon, 11 Dec 2023 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ki9H31C7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDDEDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 00:58:34 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso14590965e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702285113; x=1702889913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMUJTjvA3J26dSdTiEt4TdDVTDH3n4BQkpvTQmQkiVg=;
        b=ki9H31C7X8vN9idXqx1kUJrbMeA8MnKiviO8LYjZ0fJzagZtJCA76b9xZB9K2iAdUG
         +3uJHQHwmBwtzNd3gXx9Ghm83YnQM0Ue0VD6pwOip1rXgJEbxqRmXH4NsPWixenzuiCA
         IsCJHvv7WBHXsvz1Fck5jxcJv0Kt5fu8LN021qGFBe/LweomEFGGQE5fbSwDpQWAYAGe
         nyzCpOoAIkOb4BpX2G6tTuQ42M6PFWxdrqdPT0UDRFl1JB85zta7g8IiCGCT/OzBdbRM
         gNKzLixGoSJuwVnuIq4CjD9EQDs3kUdFH4f0vTwicNfy5YYzQYZ3uB9Sc61wURuC2JlR
         Hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285113; x=1702889913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMUJTjvA3J26dSdTiEt4TdDVTDH3n4BQkpvTQmQkiVg=;
        b=Lz+rtMQj/5UYpIwyNQ4LKlGTTtjlap1z2QSr7PFOF7+eLS7+Uk/aWGllafE9gOVNau
         7jSCP6IQIRY5DwIDcnaVSo5Vn0zOkyQdoqxCxcfoutEaN4TlIp1OShn4tJcefBy5nL8U
         yzt4RkCyyJvswR2CvY2M1QMDhfDYRS0SZAv2dQxnY9R6pzfFx7CT0Vn1OSxBkpyAD7TW
         PR2jHJhVaLB2HCOsQF5zdtEINh7EIpwTAHEA4ltMJ0U+66FeH+hV3z2LvHouPgTPDbrN
         iX5cbwnN1/CkYViSFaI5+cYhG+1HUPSg05b8CyPSjWWJLW0+HAHKDWpyd89f4b/N1pG+
         WhyQ==
X-Gm-Message-State: AOJu0Yz4V9ExY5gFkq7Edd6YUy5iOhZHwsldAYheBCzL98brEK2D4+CN
	m6kHjwsLi0Zo1j5r82z3czQwng==
X-Google-Smtp-Source: AGHT+IEdVHw9x75OQSgV0Tjh5ujbDy6v33ypmF+84RpcH9f9bSjyFP0uMPL2YIKrHrKqXdtkfHAc2g==
X-Received: by 2002:a05:600c:2108:b0:40c:24a2:6b0f with SMTP id u8-20020a05600c210800b0040c24a26b0fmr1777549wml.212.1702285113287;
        Mon, 11 Dec 2023 00:58:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id fl9-20020a05600c0b8900b0040b43da0bbasm12315067wmb.30.2023.12.11.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:58:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: document dedicated IPQ4019 and IPQ8074
Date: Mon, 11 Dec 2023 09:58:28 +0100
Message-Id: <20231211085830.25380-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated compatibles for the Qualcomm IPQ4019 and IPQ8074 SoCs,
because usage of generic qcom,sdhci-msm-v4 compatible alone is
deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 86fae733d9a0..c24c537f62b1 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -22,6 +22,8 @@ properties:
       - items:
           - enum:
               - qcom,apq8084-sdhci
+              - qcom,ipq4019-sdhci
+              - qcom,ipq8074-sdhci
               - qcom,msm8226-sdhci
               - qcom,msm8953-sdhci
               - qcom,msm8974-sdhci
-- 
2.34.1


