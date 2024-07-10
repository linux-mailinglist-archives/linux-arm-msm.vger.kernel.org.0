Return-Path: <linux-arm-msm+bounces-25859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8192D587
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84F01C22688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 15:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A859936AF8;
	Wed, 10 Jul 2024 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwJC/PHz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA717194156
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720627043; cv=none; b=AjyKMD938OnlTfR9mxVqw5GLrbt3OawwQBufV7LT/UepbxLYPHF2Ua8UcHQkzkA/jmQsYDkegRjLX2vHm64Vkdt71AFIfFkACAFSBpyd8fnqMdXLd9lpatmsvHOCDeLfrcuMBU/qeuBfQKhPFhTXQFLu+DGdL07n2vKbVy0JQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720627043; c=relaxed/simple;
	bh=ckjcHD3fkP8UGIBWxU1ZMaTjWw9VjUn/fMjmY62VgFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WK1qOB6v9I9vy/dKUvzHvW/U5e9c/LZ9YslT/3KjopdNTWFqEjMswNt8iFgS+keQ9I7YwwfTB3Xdo8swoEVG9R8NIrwiiByxTAXgYp47R9HBjkdirxFPOj0edhQ//ZqM3yQRgyh8Jbp5ls5IuvshcY8nKmeFgFdLbLW7v1shPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwJC/PHz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3678fbf4a91so3288054f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 08:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720627040; x=1721231840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnfobWpsEh1CTQ1nMG8bJe9u9N98dynELs2GKuprvwc=;
        b=cwJC/PHzYOm0nuf1mX2cGU9atU4xcdCj9PHpScJRxxTuY9G5QI6QjsVFxX/DfPjcYM
         Sla/eqSXBWs6XMGGi1h1R60V01TSsnHZeM1TRPxtxixFtny3Npc2c02iB+zKY57RYWtK
         EWaBSTEnYN1UzIdul7Ia3erMdSl1FTySFLRbc4J4gKqIdjMBjtUfTy9KvFoSW9Gv8ds5
         GoqQATUq3SV4v9Zr0Uagjxx+WrePv7wt6SUPTdrKqp8KYeU+V3AbBdeiTdjFU7pEJR7L
         4yQSEugGfkPg/I6pftFUYM+2uQJjrgLVK5+wwwIMRZE5Y+suhe1in8YXZlDU26lKiDCQ
         gLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720627040; x=1721231840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnfobWpsEh1CTQ1nMG8bJe9u9N98dynELs2GKuprvwc=;
        b=VZz0tIASoy3TZU09PZeTjOJpov01VJUAtvlia92TTKelkc0e7m2tSd+0SsPbtmhp1q
         Hwv0fVDziPFgN/RTZmM1zO5jQtbU7hBoyCVgciE/xgFxCS3tzBSadS+o6D+YphlaV37D
         kxAtHjyTJPhYPal0aP+xXMKR0DdCKMyQDJGuhXvusWGXZwKc3U1PYiL5iAWkCY4ONvxq
         ikuD/aRwi8czZ42gUzA8VDsyt4R0ZYmMGthebRqdt+FUwy0b5+B8dmtVmLqNh07YyGCZ
         B1y+R9/fDPABJqBZmxwaMmjhLFwHAWs0z7Ek6q2gCTS/VvlIv0gRGQHrN/ZNUDBHs30B
         0yBw==
X-Forwarded-Encrypted: i=1; AJvYcCUji2BqGBtFrsexJ6RGHdU8y0m2F0pzuTICvj5DB7T2Ogq4/8W34jgkuxPI85ws0wsOtIWu4JpY4bQZIECp0tI4i6y97RZw+Z+5stqZ/g==
X-Gm-Message-State: AOJu0Yz6O5B+hXtj2j/voOlm2cDnR6YRvtvDI3H0Qciq8Q0BURekRHOA
	i8IDaK8Gr2ww9J3QYCmAKd4wDkndDvbqzrm81sxTGu3U9YsL8Uz8wkN68uPi9sU=
X-Google-Smtp-Source: AGHT+IGxWJ+uQVCF1vScgzbj2bCdlzRN6GNu5flmFzxZ33UHXWfSYIOVihzegxxgknjCW1PWHA/VvA==
X-Received: by 2002:adf:f84e:0:b0:367:8459:a56c with SMTP id ffacd0b85a97d-367cea73576mr3670317f8f.15.1720627040274;
        Wed, 10 Jul 2024 08:57:20 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e02esm5668009f8f.3.2024.07.10.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:57:19 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible
Date: Wed, 10 Jul 2024 16:52:23 +0100
Message-ID: <20240710155226.130086-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for "qcom,msm8916-acc", used in msm8916.dtsi, to the dt
schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
index 202a5d51ee88..3fa77fe14c87 100644
--- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
@@ -18,7 +18,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,kpss-acc-v2
+    enum:
+      - qcom,kpss-acc-v2
+      - qcom,msm8916-acc
 
   reg:
     items:
-- 
2.45.2


