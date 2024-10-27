Return-Path: <linux-arm-msm+bounces-36061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D379B1BAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6766F1F21B54
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074A2D530;
	Sun, 27 Oct 2024 01:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBoJN6BK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4111B67E
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992297; cv=none; b=L8i1VHVgCA59ktL0sL+6ParmH4kb+Pr8YWhZmZVwlFhJID1qDMVQLbfQibsUA6PjGDkJDRzg0JGfZ3PsYX1NBBZJ9CCvLgDn7NkL4PL7XGb59a1lRoDggLowDWpQ1ixBFIc/cwdbLfS5VMoFHI5sp9H0YNXKFpGHIauRxPupRTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992297; c=relaxed/simple;
	bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmNz7k/o7Yh0Mz1ymOGJJUX+F16mMiXnyMsSPW/PEUmxF3cOIQypR3UBN0fhxbHXxZOn/q8n5qZh4030XodKxhSARTCFhts1vZXO1WwEFo0yfEmdTUI3gJU21XTZqwsYPZv2JUrqFVOFeRcMKGuc3bzybld/p6XALWW2jGIv/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBoJN6BK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so3302556e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992294; x=1730597094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=uBoJN6BKuXrHL9fpZsFlgAEqdq0N+eC75cVNArxS1XiwrxNaVQ2jTePvhybwvGqWhS
         Rx4/R2NnezrprzU7z/OvV+wpSf8oargQNshyZti6MexdpMZkyD3Uzlq3ZlbltnWhbYHS
         57G1212BLXWPknnvEzJB5t975xPBeABmDGgCNLCZ6JIM2wJb9aKc6R80tOVwQhIjddvZ
         fRlnyt3J6mAgvQODlJ09r6mUkbGi2qWDZgDWPchIM82y4oEx9m+sh7lg/5S3HtcAf0mV
         VfsqeYJKF73UayqNRarGKL+YWUrfeqNZ1eHkUr9onufECLnItKre80PAeJrBKfSM6uIx
         J61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992294; x=1730597094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=WnW6AOQqLvJBWNJxbWDpN8DW/i+cI9A4zGllPURnv1hUgcqiZtpo7w7qK3IKGjegSU
         lJ3DJGPkzhGEOQM1VypyOSrcMRfEZLB4dyXBnUBJaGZO9ezohIcERLBpBrocrvJf2sOO
         7sdI+WK5n2G/lYsIH8fBr5/k1at3iZQ5M2TZphVap/E0BKxGHhCma3sByw/YAR2w3vDB
         hhfrZjq7Sv5Jq9dtU5KnabX/qtJkeEDAv66ter28e+J2hnlKt3x1tufzdZjJCzZJSL7T
         pWWyvq8Vm3e7/bKo9o9hp5C0X5fJZp5CSVBarcSxx6WfLm+jYPfMdAPbpbHcFntKXdkL
         oxQw==
X-Gm-Message-State: AOJu0Yya3a90xo/tURnm7Je/FpiJMHGMqqxLQBHhYo7Ebs637VgzdbOz
	+nMyoXaZeZfScbQeS1yaq5txq49uX+m452RLXmhZgYGhLQ680zAaEO0an8VbNsCW03aU1zsSHh0
	x
X-Google-Smtp-Source: AGHT+IGiYOPu0+miXsfKbA+BoUS68tGxCil0L/q/E6ujAC1kJirN/Wu3jo4yERfNnLwXRveE8yiTcw==
X-Received: by 2002:a05:6512:158b:b0:53b:1ede:9174 with SMTP id 2adb3069b0e04-53b33e6ba17mr1290073e87.28.1729992293845;
        Sat, 26 Oct 2024 18:24:53 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:40 +0200
Subject: [PATCH v5 01/11] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-1-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZfelovW8yJwroP9DWSn+u371BwGZ39g4zhc
 X0WuaZACzWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WXwAKCRAU23LtvoBl
 uLZVD/9KjCZahhbIEWCxRuljPtAZCJkKcUGWGvCa0w5lwUnNWnjgY5+6VkYmP2um+WXK5M3kaEv
 gao7u/IVhO5ET42WZ7b9zIIcMjHAKLW3ESB0uKpxBkdYo8gMD1jENngKmoi2Krrq/psYT6u0Q5K
 ImiSxl2LFwoUo3zubaPCaIXEI7zSdWArT632jqephKF7FlQQ2h4rPo+CzZ8JY+Gj2bsw7CkJ0V1
 Om0EPxEXy10AagjZbOw9zuBfkCYkEPImOyXGHPT9z1vp3TGaHxzH4zYLLSgqigVLSg35qr+29oV
 c8DZcW5yHM3gID845CufHf0ZKvqoNEG0Ux3YQtKWYo8OEIS2Z+M3n2tqBre3V4FQEgXg9GLg5BS
 iuRxUKirMYJNbWSbxeTg6nWkOss32U072vttexkL/vy+0UmSFnT1vKgDvN4D1ZsSxGaIYyu4Epm
 26Pae1dyzUBqt3mT9I21DFCnZWv0j3YvmMSnE/dSs1V7Eux6/nACv29qD6sSh6cPBZKCHuoCLXh
 uF1ja/qj4kB7AfEzjdA8ipgomvDBijqc/Kuav7/bzpc35IKkgMXgcqAgyXqSej/BBCqIWnSZjJV
 kjyCRgLqMXkfwfR95nmR9FuypK6I/HQUQxeMtdUKVVhVWRK+dbWM+JLp+9nnLhtyTgLjpZ9Bu0H
 Y4daYsFZpLe4kcw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for RPMh clock controller on SAR2130P platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c08cd4b906f18f6a48631da59ce9a..a561a306b947a6933e33033f913328e7c74114bf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
+      - qcom,sar2130p-rpmh-clk
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk

-- 
2.39.5


