Return-Path: <linux-arm-msm+bounces-14213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D90A87C8B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 07:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080B92822F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 06:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C16F134A0;
	Fri, 15 Mar 2024 06:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXcTFc6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6914016
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 06:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710482847; cv=none; b=CtfqJ56hIYKYJYaW5eGraVH+ydvhz7VOV56N2pYev8nYLrvl/Ji+iG2FD/rCa6VCYbDTcos4D97C6XklqONjZ7vL5wuGabCAQByirhN8bvg2bNvpNcpdE1j5+bUIy/M9SgrgEU2mPQZDyJPoj04rj/LfixHCDzfjBG8ZvtqskP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710482847; c=relaxed/simple;
	bh=rPfFrJBnAulSY0rHFnC89I3kUqU3f8YhptHrQUiyOjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ePKxI9NfPy9aBOuQBtBiWpOkBjb/OsQYoVk8fFK8V4m3qnm7GGSmfJeInpBjH/5FJfwqAwoTZPoalwFCSViGki4JAV4VIJH8oMWKKatbiiF84Mal5CvWnp60iSzCyvRPq78fnyuZRJka8t3SFF7coABGFn5xpwCyH1Z9qCFrh6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXcTFc6K; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso1657192b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710482845; x=1711087645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=OXcTFc6KRmvzJXSLqQ1wK5hWCgZ2kig1rFqI0KU224jnvEFBAFfxC5ePzx1qUnV8dF
         dAjk9entEtMnFE/K4Pq7IfpmjTkkbEPMZSq5x8ijmxkGpLarw62VAmNiHczIvLmCoOwf
         Wr7x2fIOFG0ScAaEJhIgiRJkY7X/58RL6ZncnqnkHNhoTZ+Gikq7R0CksadzqGi+cHuq
         yKlUAvEvXUOJ9aRHDduliAU/lCUXP7AHzsMjsS6PKMGDzhl+ZiJGjbxpatdT9zmZFhbD
         dxKhJNgvUrWQ7ishdToNJqv6zM1ym+oVuaY0FssxQQDMUdbZ5NvuQpNZ8/HCPEsw4R3o
         mmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710482845; x=1711087645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaoVf9eqjsot1BqIU97nmYIfRRMIaK539UE6et7+tDo=;
        b=tT9Vd19TfGzNJdyS8BjAoMKpUPBPH6npGBXJCazfixNLV+Nh8EVeDQfmpIwEr0s/Md
         O18+ws9xK1gZbznrOI7cerAkcQPCYaa4UcDY79wbCPKrM7hQXpBYTClN0unIEVaqktlb
         TqZqYNmt4UbB8BgHkSe0NqwQFaKymymsDBv5XF+r2dhwJi8FsrWu76+zTTylJiWq0y3k
         pXqGARhCQsT/lBYzV8lm9XA0WX9v6N+GlkeoVS+1v0qe83dngdf88We1IEKL+DSMrPb8
         sPC9JDi6CJjscuvy5rR2fK0Y4nYfx/TN5icCQAIAqzDU3vl7MjB2Oq4eD+gDXnN0MGVH
         SXgg==
X-Gm-Message-State: AOJu0YzNtgk6j4p3q8RCv+P6uLSFn+L2CQykHIJAqlwSajXQjmXDEQ0V
	keoHWgPSpYZIaAxlBONohUa9MhyL3iMOtJr7SFUiRtkEIfBaEzNdCM6pyX+Vgbsf3fFfZ7dKKKI
	H
X-Google-Smtp-Source: AGHT+IHFm4sFG8tL4mqeCjyXADUMibOeJ8dbQh7BVj68FUdxiCyg9F3bKknXFUQ7hjlVtpy4pVq/Rw==
X-Received: by 2002:a05:6a20:6a0e:b0:1a3:4c69:6030 with SMTP id p14-20020a056a206a0e00b001a34c696030mr1493226pzk.54.1710482844746;
        Thu, 14 Mar 2024 23:07:24 -0700 (PDT)
Received: from sumit-X1.. ([223.178.212.73])
        by smtp.gmail.com with ESMTPSA id lf11-20020a170902fb4b00b001dccaafe249sm2852024plb.220.2024.03.14.23.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 23:07:24 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
Date: Fri, 15 Mar 2024 11:37:05 +0530
Message-Id: <20240315060707.471248-2-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315060707.471248-1-sumit.garg@linaro.org>
References: <20240315060707.471248-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Schneider Electric (https://www.se.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db4..4ef38573e411 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1211,6 +1211,8 @@ patternProperties:
     description: Smart Battery System
   "^schindler,.*":
     description: Schindler
+  "^schneider,.*":
+    description: Schneider Electric
   "^seagate,.*":
     description: Seagate Technology PLC
   "^seeed,.*":
-- 
2.34.1


