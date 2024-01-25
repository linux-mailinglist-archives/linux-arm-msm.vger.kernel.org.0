Return-Path: <linux-arm-msm+bounces-8208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C683BD49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A2FEB2C810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D0A1CD0A;
	Thu, 25 Jan 2024 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmDtWrBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FF1CA9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706174891; cv=none; b=nx/TsH26IFDDRtWeSKNZA3AN9gFfqreMKIjjwx74RoEvmqiEbFfvVL+03B1g2fsPyOesQrWZU5vYjwLMGQPu/x9AoSeII2GUH2I4loifO8GzUoEYbYJlI0MOxj7cBG05lPbYvzBD8rGWXqRfL38CuXR1mW70D4dlj7Ods69JHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706174891; c=relaxed/simple;
	bh=vM8sAjWAZdmpMApzUnKAm7BTvnMQ9KS6M6m1MOE6Rz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EN45/VfWGGc8fKsOpm3rvLHNKeEnrpD1+k/hZW68oLoKkVQzSfdK1Qm8aSpk9G9b4hcY22X1WzAW5QmqeSSOhK1jJZXgPye9vo8OX1OL9uiTDtsxik5oMrQPrXkVUF3VerpIZmk39N58Qw8lYogzg2dS2UAMrBM9+ifThoJDATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hmDtWrBy; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a50649ff6so7179033a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706174887; x=1706779687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTwXeJttr1S5lj9FfbVYYeUxM0hcJGZds3WqL24wOLw=;
        b=hmDtWrByeZ1Y7aHhWh53vXNQb7XD1U7esmPtbC/fNXqxn1IqDiqmKjX27OURDTQboc
         3nhaxez3+jZciYvC8KAMbI3dUDHwfoJczNO1RPshF6+eep5ASx4b2fjKkTZgbwhfX2Ao
         b/xZN5aasbzvCCCYGetYZluD1ZqLh6F4a1gdUCIHnplhDmSqaq+M0lQSRZtLXyvJsUAV
         uwR7w3y0P7Q18nCOXkb6LauIqNr1cET2cGJBiKpGStt/OMU4xDxfvxk+5bGPAO74qagN
         DY94eH+n5OXrB9neC0MmK+yxoUldhCb1hCm6oYQ1jrzHNt51xlZsCHDRDJcHc6Gwm778
         psXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174887; x=1706779687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTwXeJttr1S5lj9FfbVYYeUxM0hcJGZds3WqL24wOLw=;
        b=BlJXJmp7KY1x386fp9N9ndKxzrOv83UpyRxUMyUxt0xHZv8yaidA3I+rewt1S2rJF1
         4SdsF5eim9uf8Ta5W4Pcj2GJY1gRp9+dZmd0VRtu2ZwyTVivfHZpmjEUjDiG36bALZs+
         ovagbAhALjOrSdYs1N0fZ/l+Y9z5t7UgyiV9/MDQ4p02zUFmGIUkA2dHjcWO+6mItpPh
         YpJvPF3bR5FGJfYEI5x4eAeKgVkUr+6ho+KP0wFtBQImUUKB0lcgPXrehuz7zLGTBmBZ
         FHphNNKmQTV0UhatttOTOB4aOtf138XNmqLWEYl4vC/teOfM64QlS38aMon1mbHJJk5W
         ZH8Q==
X-Gm-Message-State: AOJu0YzLtuE9l//C7puSKHaKQwqGiVmkwzyjwgAobAW42GBRKdbXLTgl
	O8SSudEJuyfy41WSMkL8KNFuZxzxaAfNVk8WstQ4KDYdrVk2ILkorjJqbR3Sy9s=
X-Google-Smtp-Source: AGHT+IF4STyFToBkXX9Qf3dstQgW+j+GfF6phsrITwrpWr26gqU3SVpWLw58fThxoUw+27T3eqFPkw==
X-Received: by 2002:aa7:c55a:0:b0:55c:167:7206 with SMTP id s26-20020aa7c55a000000b0055c01677206mr376941edr.70.1706174887615;
        Thu, 25 Jan 2024 01:28:07 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402005300b00554af5ec62asm17356391edu.8.2024.01.25.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:28:07 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 25 Jan 2024 11:27:48 +0200
Subject: [PATCH 4/5] clk: qcom: dispcc-sm8550: Drop the Disp AHB DT
 provided clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-4-0f8d96156156@linaro.org>
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
In-Reply-To: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=677; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=vM8sAjWAZdmpMApzUnKAm7BTvnMQ9KS6M6m1MOE6Rz8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlsimeaXC4IQaaqMFuSTI/X6sHoHCXKySS2ZZwc
 Y0U0qsRcVKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbIpngAKCRAbX0TJAJUV
 VpG4EACXx2zpzkgGrpHYlxWC5e88R/xH4b60vUTfMKBaFuImspeeGadj/XwL/QuYYsERJUSA0iX
 zleQXXSnaq0LcPHG1HVDcMPorHotyHCRORKKDwhvuJpbx51pW9Ikwa6itvtziyYoJw1wMWWywxb
 /hJxYFr1dZyXyTJPLtipK59eGRxMhk2zYmDIm5ndz/IGG1UKaSlSzCG0zFEFqzA8copr7HYldSd
 HLTGnN9ziC2VY5LPiv1cOfP+UzZQ9c1Lzy/uxXwJ5EpNS7EaTh6AghUgVbofeY7PIm3IdSEZKPH
 lTbA2WOWgAJqt38KjIcW0l6QqosfYlElFJsGr6vIPGad16NLJnXsDFVWfg8A94o8yh1K7UQa5g2
 DEXe+oqDg4gXsAzQM8HzO5RcPu0n2/8xG45HdaV/+BFv7iPmSTx6UQvgrlns0KpLIEIfbHSWKp2
 XHnZz+XVvJiF1wRJ6GMFssfsthq0zMSnmRe/OJgElyIgSwBg3LqmT1c/N8e207wwf0waxS9bf4d
 XI4BHql9ntxAqiNQiMlohCm58L6US5rZYcTyAQdvxkot2CI4HmkUNyM2M+pgLUG3DbPfIt/ydNN
 Z5bU5WoluSr+oqXgVDiCheqFHqIteEU9Ma3y6foCYQPWvLva7OZnnjIbr6N9EUeJLcA//GW8JCg
 claAHhOiVsm3vdg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The GCC doesn't even register the Disp AHB clock. It enables it
on probe though. So drop it from the list of DT provided clocks as well.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index f96d8b81fd9a..b33795f8e8cf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -31,7 +31,6 @@
 enum {
 	DT_BI_TCXO,
 	DT_BI_TCXO_AO,
-	DT_AHB_CLK,
 	DT_SLEEP_CLK,
 
 	DT_DSI0_PHY_PLL_OUT_BYTECLK,

-- 
2.34.1


