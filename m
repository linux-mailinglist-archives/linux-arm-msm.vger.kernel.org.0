Return-Path: <linux-arm-msm+bounces-6118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E9820303
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 01:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FABEB222C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Dec 2023 00:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCD965A;
	Sat, 30 Dec 2023 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynx4kxj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB68C18
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 00:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso59390465e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 16:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894715; x=1704499515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOgi+o+MjKjY2YxOi6EGv4wA3oq59/BsZJsnakzxR5Y=;
        b=ynx4kxj7DITEGTK2A4oXlGnxTAzqCwD9Q3HDdzjzkgfyhXFps9ZO7WkBgGHTDjrvFG
         djNQfMGAVXs2YWH25881GjKqd5NfaBkhBOuiyzp2r1meMelu/sG6IjN/NJmepYd/d+vq
         D5LVRN2WIlDcgBjJzxpTrTFYOoW3wsQ6w1H/CQvkhcoQ8ZMDD30jzzC4Hh6tNa/L0Su5
         KTnVpOLnLsNf9rgh8v7G7u55kjFhguimTVyte30pGX98F6+rCm5LlJcfrmqwXvqIE/mh
         PGhZrsVUm1qLrYkE9PpcZXUnsRf3NktmQ/n4skLGrxlt6HfUXyjZcmjIIQs3yTh6+buv
         tqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894715; x=1704499515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOgi+o+MjKjY2YxOi6EGv4wA3oq59/BsZJsnakzxR5Y=;
        b=jbOu/OW8Qqrq+kzDX0OLBqUJawixyLKfSzex8AMIx9VrQgFFUJ6BWCjATkdKxMJPjz
         PGBODAQkSajzBbZiTAbSnG3v5j9DrlhPNBSwI1jm9BZJNEhXCqy7XXub7ZCNPViN39GJ
         PyqeD7gEJNk/29DcKRP8o1pjjxBDt6w6b4le0fEKmafjsuuyrfxOFMNHXt0DMReXpMoK
         Ni7F0qQW/Rw02VlygBnWhj9sG/KgaOw68Ug4naSE/T5ze5JdiKPQEcoTJ2bWlLp2JoNO
         CluPhwOgX1PpP3/V40kbYGN+nq2x7quo0QxS3WZPAkhpci6VFFR9SqLyqxUSysRSpHJY
         fm0g==
X-Gm-Message-State: AOJu0YxTTZB1OCW0dSZztqrfKja0kES5H6+q2+FHQJEy3egVcya+wOeI
	m4YdKslObkz5ZtJIrl+QnIP/QC7be1f/rw==
X-Google-Smtp-Source: AGHT+IFGW2LD2QW3k7rCqKitq8ItqwmF4Wvmdnno4bATw8RRQPICnYUGEn2XwykwzHPOCh840yW/fw==
X-Received: by 2002:a1c:7507:0:b0:40d:581c:f317 with SMTP id o7-20020a1c7507000000b0040d581cf317mr3636946wmc.127.1703894715725;
        Fri, 29 Dec 2023 16:05:15 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:07 +0100
Subject: [PATCH 06/10] arm64: dts: qcom: sc8180x: Don't hold MDP core clock
 at FMAX
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-6-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=1000;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=M8bX5G9YVihCaiyP4SOPHUALrA9FvX1X19kxYRjo79o=;
 b=qBSuZww/cfnY6WCaqXkt8K19wXn5NmgDE9scwK/qdrSuoEjfW6DBKSRPSIMJltFQ9bM9hN80C
 TfujnXtqcQXCxCmejJU+uXloO0bmM/1c6+xqffF22N8PJr0MZPWsIow
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

There's an OPP table to handle this, drop the permanent vote.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 8f7f5b74cdb9..3bb9d25b1dec 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2732,10 +2732,8 @@ mdss_mdp: mdp@ae01000 {
 					      "rot",
 					      "lut";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
-						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-				assigned-clock-rates = <460000000>,
-						       <19200000>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
 
 				operating-points-v2 = <&mdp_opp_table>;
 				power-domains = <&rpmhpd SC8180X_MMCX>;

-- 
2.43.0


