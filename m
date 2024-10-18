Return-Path: <linux-arm-msm+bounces-34965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F376C9A3F49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 15:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7336E1F24366
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0511FCF56;
	Fri, 18 Oct 2024 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYZ3jHr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D151EE03F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257242; cv=none; b=LGeVvcfhvME2Y1KxjQfDdOS4bDptJ+SO9HiB3mE7/lYg/cqKiQd+VXBS45XWX4aVLFSB5uAENiAe2tKcoos29ghXC9m4qe5eD73cX9zHnAygzc+DaH/EZgmhykX6owU6WzZhfSBnoQvHqTTYpgeGZeOy4B3toEgWUDtZLvhODFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257242; c=relaxed/simple;
	bh=ug5jCdtMI0+B4bUF/QGKMlM43w7o11eBByOdR2+MeSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ULOzWaC/gs86DZqEiTxpD4VkLrc/KJ+BFGOZoXucrd31nyQY0tctfjcI86D+jwOIufyBNXRulSIPScqmxBhEej3m/exuikaaVRabbhm5JJ31QZ4MKBptK/cmU+4RouEgiyxe/KK6571BkbC1M7NmvQhjyQnJqx8DHYLliC6GAqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYZ3jHr8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c452180so21768375e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729257238; x=1729862038; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slJkaosW6XMQOpTqyPk6rQj2FnZm8OhDSZzBFstpf7g=;
        b=LYZ3jHr8LovtvZ8sFTVTrvoRaXWKgbHN2vTGep4ej8Fs+eQ4Z1Fa/mK3ix/h+o9Aa5
         6xhGMyaNrH2dL3sxJHKqI8B7lg31N9Z0BtGXIaNBg5/IWMVim8awKJBUc3biwuDerCFt
         GHCbIfC3CV0tb/cJXOmZadPaJsotYhkA3zPedoEhrGgDzroqoLBtpLeR5C3TK2519KyM
         6fvF7PgJVOO5T3hdZLhVLkBzz1OPt35NJn8mlZNFkNC0p8tnsOjUrbTkXPjNfJHzm+uE
         Luhlgdiy2H3JbFZJQ2NDNriP026DDsVjw3CZmY0GT17mbThUgfu5xtCBHwc5ig7B04PF
         Zqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257238; x=1729862038;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slJkaosW6XMQOpTqyPk6rQj2FnZm8OhDSZzBFstpf7g=;
        b=U1T/YdpDeqPEs8A+IdcWJ8zOJ3kryxrYW3CRLQNiuZsAp9Dw28MIwRtul/Kd7l9Ugz
         F/3yUgXWvZfxkSugigeu20DTBt37zqMXeGE4AW8NJtw8WYlC4LJ1wqLly/SlfWe7JiZR
         jaqLV68K2F6tjFSx2slf9GvE/zgYaehOYkTCq8Jy8etcs6Ipcdn/VyRGuN+8yFFR60QH
         99yNrwNrtmBq1nNCotv4UMT1tngVgQchES1oP3dZERK5jl8ivPS+wZJKu5M+SRSdo/te
         mdQtqPUs86mk1zZuMXa1H5bWFoifxLOGC3/W5fWz4rVSsNQmQrvdiv8HAL0s0FXqeUra
         Aqxg==
X-Forwarded-Encrypted: i=1; AJvYcCWGgmtz7+AtwYpiE82nXC3L2pDJm0uYytQwpFqHRH1O//qaKyPJFM7x0PTNrpEyWcA4B32VB3LK23fk8iLw@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRCav/q0Z07HU6cTqoPzdrjoFjtR/hqHA8vvcAdOoO7pLGInQ
	R4ddXP8kcy3x4w1GznBzGgtQwQhauDGUq4Iabxbn26SDzEfOECozpPtwAzGjvUrrllMY8xDU7Mm
	w
X-Google-Smtp-Source: AGHT+IHTaWCjtMZo2yvANXCpoAT6BwaQPtKmWGyPC3YgUVT4hU9B4bthUkDj2W6aDK83oYueMqn31Q==
X-Received: by 2002:a05:600c:5489:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-431616415f4mr15802505e9.10.1729257236139;
        Fri, 18 Oct 2024 06:13:56 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027e3csm1948418f8f.4.2024.10.18.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:13:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 18 Oct 2024 16:13:47 +0300
Subject: [PATCH] dt-bindings: cache: qcom,llcc: Fix X1E80100 reg entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-qcom-llcc-bindings-reg-ranges-fix-v1-1-88693cb7723b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAApfEmcC/x2NywqDQAxFf0WybsDRoT5+pXShMTMGdNQEiiD+e
 6ddnsvhnguMVdigLy5Q/ojJljK4RwE0DykyypQZqrLyrnQtHrStuCxEOEqaJEVD5Yj6cw2DnNg
 8fd2E4KnrAuSfXTnP/8brfd9fNsYd03MAAAA=
X-Change-ID: 20241018-qcom-llcc-bindings-reg-ranges-fix-76437ff4c99f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ug5jCdtMI0+B4bUF/QGKMlM43w7o11eBByOdR2+MeSY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnEl8OTxusoEVgjXaF4HSD/+24Ni900zRicjnpp
 9BaNgYZg7qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxJfDgAKCRAbX0TJAJUV
 VpG/D/9f1kLhKvYULAvtFAeBM0q3KXExs1O3l5xUFcS7l+r8LEhtC0hxzlIKicZjSErMUO9QQUI
 fmuOQJS9k2dEux0opox0LujHxyxEVyYjyH+JGI0UsQg+r8d9gN1Pl0zqMbusY/Cpbgv6dhTJTYU
 ZbOGFyK1QyRt6WjgUhShsNxi3OUmKefMir5uMo69+1Q+Ac7BXfhXQoGwQy0uMtgQzBk74EQvmcH
 gYZp10I/wpWdTfjfKCLpW4rDVzym0czeyXASkK+4nnkRKSZphdZgL0XpM0TryyALg/mDHDs8GYt
 3Xl8GO3izqo1sKvz4E/KgPjXeJVxlGpCedNHGZ9+cljKpBY/2dfAwrzx6fhCHRhjPwt1VfPBMca
 d7/Rs9UCC+m4oC5oxcd3rnKIft8Yb5BJQe04WkXu5xyATg80j8zjJQjY9ozkP9LdDsS3Cp5dNyL
 9GUz01O0ust3L+C5K/xKar54khJVM3sV3NSYj/dlXjIbpPo/SB89v64tHVa5REHP68A1uGxqdfU
 3814dohqLlGXy5YVN8uU+wu3ws1I8JcAKCCu86sjYVjey008jYWPg6szNVrWyKTJYPu8X+zbn+/
 u3puwoPS90tZRYtwnTbAXdZbZuOt3Bz+S/+wzwYMJD/7xMRrMrfrHGup85szuQlcLnhC7FSKesb
 hiDJSQd7PTzIRow==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the missing Broadcast_AND region for x1e80100.

Fixes: e9ceb595c2d3 ("dt-bindings: cache: qcom,llcc: Add X1E80100 compatible")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410181235.L7MF7z48-lkp@intel.com/
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 36 ++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f031cd8b23cf48d566c3a760dab77..ee7edc6f60e2b4bf39ddc7c7ba8a8447c990c7bb 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -39,11 +39,11 @@ properties:
 
   reg:
     minItems: 2
-    maxItems: 9
+    maxItems: 10
 
   reg-names:
     minItems: 2
-    maxItems: 9
+    maxItems: 10
 
   interrupts:
     maxItems: 1
@@ -134,6 +134,36 @@ allOf:
               - qcom,qdu1000-llcc
               - qcom,sc8180x-llcc
               - qcom,sc8280xp-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC broadcast base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc_broadcast_base
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,x1e80100-llcc
     then:
       properties:
@@ -148,6 +178,7 @@ allOf:
             - description: LLCC6 base register region
             - description: LLCC7 base register region
             - description: LLCC broadcast base register region
+            - description: LLCC broadcast AND register region
         reg-names:
           items:
             - const: llcc0_base
@@ -159,6 +190,7 @@ allOf:
             - const: llcc6_base
             - const: llcc7_base
             - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
 
   - if:
       properties:

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241018-qcom-llcc-bindings-reg-ranges-fix-76437ff4c99f

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


