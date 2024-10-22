Return-Path: <linux-arm-msm+bounces-35343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189499A9A28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B942E1F23984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85DF147C96;
	Tue, 22 Oct 2024 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhD+RMdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3914659C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579372; cv=none; b=DTB8pA6rzG92nYcmFbEcK4/tNC5Lga5ic3N2vAKIfHFRwbL+ZYDioSXmVeEnNsxvhSDqIxkGZFAcZdluiNVZz8cyeXSzeasOqktRXmw7yssT/vyEIJA0svr+5vd2Ekigg4XKCWBnV88FDzC09ciXMeoCjjmJotDGqoc95nmdESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579372; c=relaxed/simple;
	bh=6PBa+Qvoo1U7dPLtQp2fv7kQwyV0nwSgzL0nLq/hfpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOGSYmErfKb8+43M2cgjoh2sU5uO2ey/KjW2oCr5MEQ3eOwZDb781NfmR3Pr84V2HqdGd3/rfJjJWgOIEljencU+Iz9P5GnYeGCxHbynkq1RiLT1hlWP/KoI3ew/TafdT1nCCEBwQ1paFsr7gFit/uMp10D1gemFzwdlajp0MhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhD+RMdP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4dbb4a89so527506f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729579369; x=1730184169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztbetuKuCAG4xpiy9biwiMZIEYTR+UuLmyONPGKxx24=;
        b=YhD+RMdP3J+I+cFUnS7f9pJZ555Mivu8oYxXd1k0T1T95KVvhaoXQedRm1TocQ3Tdb
         eCZ+dq88x9Lx1WtAE2IwIZyeVYPIh+oUxLC6B2sRt6cH1OQNDctDpTJQWUCmksKPtn69
         suUiGJ2eyW860Ewm3x5DY6KXUQ+QeKQY8KQmx77BzKUckTPBOQvx5u/myNns4AttJz0K
         tbvwYWQNgZQqpO9wHT0CDLBlHmws2FA28WuWwEl1OhFJTeQXSI0mn6771Fj9m61VS6hu
         qVzZ7Rmfz/iILbP/T7E8uZnjBi03NToHCJJAkB4PLesuzkE9LJs3vNtMV2sBT2/b+FoT
         KZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579370; x=1730184170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztbetuKuCAG4xpiy9biwiMZIEYTR+UuLmyONPGKxx24=;
        b=NQb4fIMMJU3TePY43St3WYpjogo9jq9nb+IHCiSmtizNNgc4ulHrOFk7w6i+0t3u44
         saz0QH98EqCnPtDtlKIlnXTNwexM1PLQItKLiDTk3s5atdTx4zQduMxpeQy2VAmSW6k1
         4DiJHSmAYcf62pZCBtga2H3zdKxbwr0ys3vuSw4nf55g+S3oD0BsdVP78kAkvIuS6MWa
         8Ra9h3pZfOeiAO7PpjZ0N/KBB3v8Vee4c22gakJg16El+nLYqDZjR6ABhJrGXUaeAkZy
         kdxA6xm1UIhs/SJZsvRYleJmjlCa4kLhWzZZxt7xTg3WH96TFE6Z4XalftYdMg8ZrKSC
         sDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdPe0HlVGvkogcjbbalJsY0Di6OuZJkXphxGl/zYNLuuuXHOInOpW9aj9109lB3T6GbGbD2CJEnWg1d3kx@vger.kernel.org
X-Gm-Message-State: AOJu0YytFiOrjBG8kbJEFC6eUrx5IwRs7p97ga26AZF6OhOFii+T5bgi
	aW4/ZtwAe0SJfLUzlLNRe6sKb+uA8MbsXoyKqunfhvxMD9/ktnB2DZ1yC/d9QdI=
X-Google-Smtp-Source: AGHT+IEHQ0Nm3uSdjaODv2aTXm+D9OjTtt75SBNZU7edu3Bqv7g5ZesIWn1TqWP3SdH5sWHuh6A8pg==
X-Received: by 2002:a5d:5889:0:b0:378:955f:d47d with SMTP id ffacd0b85a97d-37eb4860850mr5014701f8f.11.1729579369586;
        Mon, 21 Oct 2024 23:42:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc501sm78231705e9.43.2024.10.21.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:42:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Subject: [PATCH] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add SM8750
Date: Tue, 22 Oct 2024 08:42:45 +0200
Message-ID: <20241022064245.22983-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document compatible for Qualcomm SM8750 SoC LPASS TLMM pin controller,
fully compatible with previous SM8650 generation (same amount of pins
and functions).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index db7214362301..e90a5274647d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm8650-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8650-lpass-lpi-pinctrl
+      - items:
+          - const: qcom,sm8750-lpass-lpi-pinctrl
+          - const: qcom,sm8650-lpass-lpi-pinctrl
 
   reg:
     items:
-- 
2.43.0


