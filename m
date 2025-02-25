Return-Path: <linux-arm-msm+bounces-49228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC96A438E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1063217BFDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCB026657F;
	Tue, 25 Feb 2025 09:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rj99jgDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA9265CC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474322; cv=none; b=Uv460T8B9qfTLGEP9Maw1JWq39JdtXjhLQVrZglgcSe4Vr2y/NkLU7HfYokfi9OfOjvVMsbeazGFHl8+tcP2HcFSrQJw5AWnPSgZViY2AyTzkE/blT7lE4YSz8Lj4rIOQ4eyWR4KEAbeGY3eAroseMxaBX1dbY84dqX25j+OnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474322; c=relaxed/simple;
	bh=o96kxA33+1DrhbtMAFBL4Wa8Hn4604gRt15P/wcggIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhr4HNfKaA0RZQWb/IFzIKZGe23RwKc7R1ILMVD0hSgNhUXpB8vfB5qRyqPKWBZODOrem9H+7bP/MBGwv1ncAjsO2T4aablra33IVBoHGTgqToAUSjB8qyRacXnR7FOh2I1hkU7MccUteEoGkPmcOwAmbSQkTS2yW2oDAQWdpTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rj99jgDq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso4543615f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474318; x=1741079118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ehOa7QEJ7cqt0L5jMNiAxatA6Uuy7MmcV53RpYdRAY=;
        b=rj99jgDqK6yECkkzkOV2T2YCwK7ZFa82dpIN4dv/XRJbeSan/x0IFjpVtFQO3sTEoB
         yJrMru14GwJ9uaS3yhr3C81XSPyOJfgCxhUyFkXMeInCOlneFHov8PPcTygEiMtElOCw
         cU+M7icH+se3kn+4Ka23usCMMGPY/hMWOx9UQFZl988EWgkFhFySs0LOb1qvXD/l9BbG
         KOk8teT2EPH7aqATNFt+Q608r8OhBcPtVCWsf2JoMEI1TbY+3mtFJZqSHZex4Wt5Zmil
         Gq1YnorT0s4NP6oB/hp+J6ARsIo8pD5locW8wFlROiEhvq7PKmnLJDSXUY6TPRk7xA6g
         nJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474318; x=1741079118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ehOa7QEJ7cqt0L5jMNiAxatA6Uuy7MmcV53RpYdRAY=;
        b=cDoENXnUQ528KYcK5lSnhPa7pAToVtDU4uUCvHXa/JMH1SkIV7JgU3BVp5W+uOj49h
         l93jLtJqJlS+8hvFlmb4M3YKlFZUhjavoLCNpyw8mngbUJaexbZFp02WRgN8tYC0JHeT
         gstm8P6mXpzbDQqLwwP+/+eIH99Ed4eZdvnKsRZLgFhlV9GZNq5oGxm6yVEW2UvZlpk/
         Z2/BLJk5cYGfZURXKEX3wG7OETYaddD7hXqZP12Ws6SxD92hL0y11QJlZOA5mzxuP//b
         eA/NgXvPaapj6aHJjJcVQo/qYUwC76IgajJf3ymC2SciYARgOVwLYqC//fHZz46jgDh/
         e6Gg==
X-Gm-Message-State: AOJu0YxvfF+DckKuFDbjeFjfZYy0kXhxRK3ruCw+IQ3Svl59ndz+3aG8
	Hpha0B8J6vg60HlMSn1Aa5FEAP0B5PnCzrIvkJGU0cPHw6YTMo+QPvAFhhGzkIE=
X-Gm-Gg: ASbGncsuEX8aUrjVkUG6bkcagfuC2w/EuGDHcRdhrGu1i6Nc62ArqqnRM3EY7Tr7QTC
	LIdfCBsBlHLvDBxNKHNfP854Dencd3xhSx5givB1IJbHcIOf+EuCwp1zd6yiKlRDG56Wtk/jLAz
	FXEbC41UjOcj54VCpC+pTuoc/4g4V3+HxXgb9eLygZgdq11g/I8KrmQJC5Ykd5Ye+jcTcePTR0/
	KMQ3dslDW3DTu5q5HaDKsLFbjvE1U51oVGQ+NGGZW8FoSTe0sXxO32/K3uWIutEdT3SmZFRDd4o
	oSPwQ8lMYna1zkytcruswfXwb5w9s1Vw0CAVPAxser9XbQ0=
X-Google-Smtp-Source: AGHT+IH2ZJqkhcU51FRNDxP7cqoLd2ysClzetd+2vjMdITpSxqbkRCJvF21LQcIWviwRZOaK7J+uww==
X-Received: by 2002:a05:6000:18a9:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-38f6f09c087mr14993157f8f.42.1740474318541;
        Tue, 25 Feb 2025 01:05:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86c93bsm1573540f8f.26.2025.02.25.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 25 Feb 2025 10:05:09 +0100
Subject: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document SM8650
 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-topic-sm8x50-iris-v10-v1-1-128ef05d9665@linaro.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
In-Reply-To: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o96kxA33+1DrhbtMAFBL4Wa8Hn4604gRt15P/wcggIw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnvYfL1rNkJHBYRMe4xHZwtWc5t05wyovD/w0krXGt
 XE8I77uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ72HywAKCRB33NvayMhJ0T+6D/
 9/rAzKiZ2Ef+u7ZXKQWwghwGgPOmMPhvn86QEDzGfNszva4mGYjRQTdQ2QYAEF+TzqtjWCUATNNiLL
 uDRl93fy9Mb+HgqNiGekRbsHU+eNLvaV+wR5iwbkOMIQ0bfff7AFXZ0wgsLaK4bkA1u6hU/20xn5KW
 E6kO5FJzVaWfcXPlHzjNgAY2NtqylhmwtC5D7QLDmE7y9BTjhoCxyd+jYfeeXkWeEHHoS0LSkUuTWZ
 LgP8T2bmZP8w+tWRtgVNUZcHiIi2c8F2uJbGQPSSGTG+YPcKUULX24wqYCp8/F1bAfINqwFU2K3HKh
 /HX7XSY8yiTIVZqmyxcAb75Q0hhWONoIVSkgfNM+fHXzWX+8Okf777dJoVrVWk9pEnMoP+0QCmyeC8
 ZsO6OlhBqhBeFgbV9jSOmZ2eFnAGUva8MQCBLZDBvInki19lpJhDyJn/IoRU5o9QkxbczFae+Vvi85
 ZaGlmRSp+ecrJHWYLSNxUx/vq+bx6GzIEqHtOq6S75X5w/8HQTMg7KiHa+q1ipgeB00JNiEeya9SNj
 Kv8uP1LXEtXe2zckJ8MVX8MVsX64tTzjn2GajCrs23Q9VWBnPiNy4DmCUjaxE5sAmsbyiymYqJG70V
 nMDoRMUY1+XhKtqYNocT1gRwLzGxxyjGxTJaFzlsvmuu3Vv8Vjza5+7aZRjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3df964196e599a57 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,12 +14,11 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    enum:
+      - qcom,sm8550-iris
+      - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -49,11 +48,15 @@ properties:
       - const: video-mem
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   reset-names:
+    minItems: 1
     items:
       - const: bus
+      - const: xo
+      - const: core
 
   iommus:
     maxItems: 2
@@ -75,6 +78,26 @@ required:
   - iommus
   - dma-coherent
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-iris
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


