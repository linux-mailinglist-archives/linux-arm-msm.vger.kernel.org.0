Return-Path: <linux-arm-msm+bounces-36640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC49B87ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 01:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8E2281077
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316FF1459F7;
	Fri,  1 Nov 2024 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3MmYjoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C82744E
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 00:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422180; cv=none; b=NHlSA3CjXrSbFv6909loR5tBUarK7OCvVRd+83bY06UIj+q80C/fxiUKQtiBFdPLE76AJob+ikUj75BhKNGgx4g6Gsmv53yUoq5Dx1a8/JyRpODuW0mBH4/JyiunFh1pcKKOM1SaUea5usQ3oXHCsdojScgyFC3L5A7SWI2FPNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422180; c=relaxed/simple;
	bh=zcM1aHQYb28gPOVZ0wEf8ewRZmUMyO3eFjxSaGLZXBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdIrBP7DVgkdwwrv5B3UyeJmkgwFyAvs/1w+rRACjLEHnHTP9OZnbDwh2Y3XeDWRNERt1Hr7ackAiiXCJSrppMS5bsP/LWyI2nZe+3M612VdVQezYrXHSibsQ1aLvw44gnBltoJslXefW5iqMktTEMoAa0CkaiXoOYd2V2EbopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3MmYjoE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1438714e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422172; x=1731026972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e0gd3zVp6cTvvyF3EOIt0/nD+72AfihXakLkWnGh/A=;
        b=g3MmYjoE+zHvwJ70S5ZCFEvtRdFyJl1UKiOkCGL0M4y/h5hCtQTQSXQgA25vxkY4Qf
         Acl23Bs5jZ2rTgvBoiEEXfbK3h/TJ9mm2CZYR7A9kct0c99pfTTBXuhyrDAP9RRXXsRU
         0fkIVnnPoMYQNH4EfLF4X+2ge0L4YiIy5Dwpt3dzwAOUm2KvPkHn0qBdWSpPJsl4bypi
         d2BM1oHSpUmOg/550MaNJztrnS6FnyNqTA8md5PiXDZhRRD+SYq/t5AmfZXCk659tbZT
         hWxeGAgrAWNs2koVtnSpjXWBWiUzsHrvWB5rz/vwptoCwQPcYH976PIkZZgOsSutN8//
         u6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422172; x=1731026972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/e0gd3zVp6cTvvyF3EOIt0/nD+72AfihXakLkWnGh/A=;
        b=dTTsU6Lj/BApYdmBJkEf+ElF4AM4BCETrlvpwusJNsak5zXQR4cjbbfG6UejVNyVa0
         xLDZ6rLbEEIo6ne6XHZg6Y0ZY1t6tZHRXY7A03FuGhHp6VrSgZYlllAIbfGl4qBkVMmt
         OpXJi+9/StS0ptmliwIngP8G9XX5lCRT3Q8zCdlMysSdYWinZ0xWLmBeXDxw6jBOZHJi
         cVRJQ7E54BmRSbv0dG8nDGgVJlWoDOlxooN6sBsXKrTF2MeYlspSmOhDYdBoD6cL4xjj
         +0UfC4Zp7dpMnmhUq0A9hL4zO4FU75T/WbFE25XA/rWrlBaBiP6AqH/OIIdR/rDiYRzu
         UtXA==
X-Forwarded-Encrypted: i=1; AJvYcCWOD+tC977kGJfXeu24N+aiXw0Q+mK1ii/g+2Q2WUEtxKBjERTYWDD9q7IF4bN52Qh1jyPGu/9alm2yFZt1@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXyZ7J4pwnwpLbXHpl/edyD6O2vcaBx8gNLqjihg5/vZHj9Ob
	Wi1bgkS2RreHQ4bEWvYsWOHTm9lurFxLJx/aI5vSpER9v4NmxI1bnTXvBC4H53k=
X-Google-Smtp-Source: AGHT+IHa7ZZlYjS0LM7ksxCIRwWRnxpaFR1qej+SwC3mJbOktHRBCm8m/2h3a9AG1Xjj37cv3s8TMg==
X-Received: by 2002:a05:6512:acf:b0:539:f496:aa88 with SMTP id 2adb3069b0e04-53c79ea6c68mr2919492e87.53.1730422172088;
        Thu, 31 Oct 2024 17:49:32 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc958c0sm374510e87.28.2024.10.31.17.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:49:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:49:23 +0200
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: add QAR2130P board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-sar2130p-dt-v3-2-61597eaf0c37@linaro.org>
References: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
In-Reply-To: <20241101-sar2130p-dt-v3-0-61597eaf0c37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zcM1aHQYb28gPOVZ0wEf8ewRZmUMyO3eFjxSaGLZXBM=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJCWUCfG9+eiWcn/clpUMZZDiHhY8JHuE2g3Yq
 W2zV4kf/86JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyQllAAKCRAU23LtvoBl
 uNX2D/4sbyb4IH0jVvh5UE+wk5ysRw/EvJgsv0NA5LoryGReHYHlSDxAaBUn4qF6ymMh8g8yyt3
 3lxV08/9Vj+dG/fPWOVNooB9US1jdfX30Yvsr0J4cb2JfLiH5p7E1WhnBTr4Nn6r7WtVsti3tvo
 5Xg31rfwGhZxvsEE5ng7OhJgNg76Jm8vvjA1CMrd/vl7qALpuIk6ZbknYKdtdLRKhm9AYtbYyN1
 1K7Ut9u89t2zE/0fMTlpepsVGyLN/7qAulMDksXa1gDmKbSaj9d4nBwDMEBB0FvxQgf3BmEEkXd
 J+9Tgv4lPngCjWdcFf2Th2ETd0tARf4kT1MwoGHASC1zjCwoqMPbUHq2eNn27bQ1JkaMWsVOLOK
 ZQXwP+FgKkEf1xu85FDJS3GncRrwtr2+UFtfTjzt9uU5puU5G03R5NNxnMHxOBSHkrbxCl+mw+C
 Ctjfev+Bzd2gRwfZiSF3AfAfilJBzdrLwnbVwhhzTmVWaJFUk1asleoCYBrH+s5sMGIVxbxXITt
 Dc39RJ8+je1OniRZ7dT4qNlyIH03uiCyjywCxYvidRd2iHpwUQtw5o1CU3bBYmfmZfutDdCPMAH
 dhBhTAOZlTmm/NntFC7As82yh3YaiB2xARjoT8L64dN7B16R0Vygv1h/1cyS+fLMr8qyGbGPJX7
 /ilUS2KswjtjjpQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the Qualcomm QAR2130P development board using the Qualcomm AR2 Gen1
aka SAR2130P platform.

The qcom-soc.yaml chunks use explicit 'sa|sar' instead of just 'sar?' to
be more obvious for reviewers and to ease future extensions. Overuse of
the regular expressions can easily end up with the hard-to-read and
modify schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index c67dcda4c8169dd72e9b5d5ca4926991a730f67c..1c164e57fe9c8f911852b0222bd229452d1d71b1 100644
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
 
@@ -33,7 +33,7 @@ properties:
       # Preferred naming style for compatibles of SoC components:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+-.*$"
       - pattern: "^qcom,msm8[0-9]+pro-.*$"
-      - pattern: "^qcom,sa[0-9]+p-.*$"
+      - pattern: "^qcom,(sa|sar)[0-9]+p-.*$"
       - pattern: "^qcom,sc[0-9]+(x|xp)-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774aec48967eddbef4b4480dbc8edbe..02b2379ccf7741a0fba345d83d0ce7db731a3772 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -52,6 +52,7 @@ description: |
         sa8155p
         sa8540p
         sa8775p
+        sar2130p
         sc7180
         sc7280
         sc8180x
@@ -407,6 +408,12 @@ properties:
               - qcom,qru1000-idp
           - const: qcom,qru1000
 
+      - description: Qualcomm AR2 Gen1 platform
+        items:
+          - enum:
+              - qcom,qar2130p
+          - const: qcom,sar2130p
+
       - items:
           - enum:
               - acer,aspire1

-- 
2.39.5


