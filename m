Return-Path: <linux-arm-msm+bounces-78146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8673BF5F5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 610A93B08A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF88E18DB1F;
	Tue, 21 Oct 2025 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ko5PChQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0D280CE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045062; cv=none; b=dWAhJb1uI7IbNMRXr7cOJBs8ry2LvLLGq9MBf6+DOg5Z2ODewY+wIcFsPyepcsQ7E98hESHGHg3ge1mUglevVd9XdgSksxADk+eNYxSBMqFuCzJxpTf09PHeZBg+EzPXNTKPo36f4dPuH4+a0VfMGCg3H15aAPCbJexpdll/SgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045062; c=relaxed/simple;
	bh=rx99oBPed2XJKc5oyfumby0hPyGNK0fC4ws05bQ8ryI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEO8nuiR9+I3Su8gkeqgpoKFcWhrouyi6Py0vCSGhvBFCTPPt7y/tLgEedYHheUIKmoI0to9+G4qB6lPMnnNor2egR/0aMV+8oyxQWisYzutAktVScZEU2p8cBg36muV8yFCH5COqHDo2u1Q9ra/xdkAAjzyEiEJc+odoJAKrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ko5PChQT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42844985499so308275f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 04:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761045059; x=1761649859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZxh2RHqPkMdvbwb2L7q+GZUxl/+aVRyGR8X3MbWpuw=;
        b=ko5PChQTG5U4GLD9ym5HO0hJe6ioEBrROyasQr9lQHS+GJ1T5O4FFt5osxsGi/9jtK
         eTfnrmALGE1s0sdBEG3gJHnvYnHjViMnrG7GPOgco/o65Km5CJLiNL4yHLPJl5PnsWlA
         DonJSCwA1HdWMiKfrYeGng7S2H8vWeZbITW6bUxp3enH65HIYCvsLoJOJdYUX6m2cUqk
         JpiTmX/hj2J8kpan5PEmuxMSKseSV2p5u+fMhrcuDpongFenuDEJBA7oRQgBjq7jhZeS
         hVkurbMMTzNstBfufa2iX8RbRkMTPqAbiGRg0vKon8Dsz+JQlM5jENQXCdcuTTguNAXJ
         dG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761045059; x=1761649859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZxh2RHqPkMdvbwb2L7q+GZUxl/+aVRyGR8X3MbWpuw=;
        b=avbEeYNpk1lsWepwyxCBFmM5QBKNVcSrt/ljxV7VgycYy9M9icZTZav/XdR8sRO3op
         iJV4pTEKyaVXwDxXxEcj2ahqM/QBfVEElSqdPNFSYpSAWGwNmQmcgxuG2cc+hAbHkFhc
         2ZBQvx6QbAmRiAIoxaaRsJrV+qDpeowoX7eSt5Bqa7u/qZmoU0ekuSNItlpqGS+I3LKf
         s/XYb1DjnizmyRKxBds54kwi2Q7zSreFiOgtY+LxaxenfqvNMpx+v1ATtRFVlZFZbrpc
         K8X6W3+rf40AP0yGHV3apuIxJfcPOX3Va3oNmaGkpZqtcuZv+6nz9/fwgkbxsBWirn0b
         jMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCURb4kJSjY4kqF1H/vCnm1h0U3OKQpBOTs0hj1/CELt752Enxq6N796JokjQJLbd4kChGALgQmUcF38Ei4l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mDPcAD+jhZZjXpTUYsCJyAG4SOhC1tHhutykxmgCt/Uc5JyW
	Q6amUkwG9aedFEqWu4OnxKFyMPen1MmdNnoEMjRHjmmXJjN7ZRxPunLlcb+RS51MI/w=
X-Gm-Gg: ASbGnctdxh2lXTFrCb3FyBq31DD2F2QVyBV5bC9cRWyd/nISggiuiyluno+oLnjrFqt
	eYR5CXpz3XcaAW6AuDvasb6Pqy30RmkwSkjmV2z45I7oObvTUpozWKw9nr8kP4zRSp1RvS2rVqo
	fGgvynAPSwW0zRAIrvZd6jUS9xCzmxQdkd5gJx5cObgorJWelHyjpAFFTgRB6nkqCcaSsiG+Vjm
	vfRWZszMkX2pbpb+2hNDYxbs0ho/QG4WWD0Xsg7sylFJsTr0MVbCAPhMqclGvUNPhnofUP5VXqU
	sjOOS+uF3oc9sXlKZjXyqArEEg8oG/qivFCuCDZvQpCBjI7q7S6RXgSHmwv0/VuLavEGTc7unOw
	8HkP7z3cL2VfQep+PU252TQZ5uWFpiRNFtQPY4f8oSDbunZZ8QbhgAvANsvrSL3obJUDpPFOia9
	IkTFfOXnniG3At60TWY005K4je5uHThc+D
X-Google-Smtp-Source: AGHT+IGVDBYsOBdDa5NG0DSZa5Yr0ZnxdYzLYQZD37fgSLb7c/VmYVbHh3NUBKG7BjssK7ci3BmYKg==
X-Received: by 2002:a05:6000:2311:b0:427:52a:7ca4 with SMTP id ffacd0b85a97d-4284e52da1fmr1195908f8f.4.1761045059441;
        Tue, 21 Oct 2025 04:10:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce06bsm19510485f8f.45.2025.10.21.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 04:10:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for DAI properties
Date: Tue, 21 Oct 2025 13:10:51 +0200
Message-ID: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
'sound-dai-cells'.  Reference the common DAI schema to bring common
properties for them, which allows also customizing DAI name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..08c273f707c1 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -198,6 +198,7 @@ allOf:
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
+        $ref: /schemas/sound/dai-common.yaml#
         oneOf:
           - required:
               - aux-bus
@@ -295,7 +296,7 @@ allOf:
           minItems: 6
           maxItems: 8
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1


