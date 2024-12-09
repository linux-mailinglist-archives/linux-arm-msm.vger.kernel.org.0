Return-Path: <linux-arm-msm+bounces-41065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCF9E93CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C4ED285004
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6C2224AEC;
	Mon,  9 Dec 2024 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwjWWKg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8022488E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747059; cv=none; b=i8ZnwteALMpfrV5Ntwx4B5x39hTDK6+GZzxjNrunk/Rf5iQXooQ7NyXipIuY+SjHwCfor90Nr6Q4ABUIhR0IJSZuYMvTFJyr4M3TVNbk/rtG2ylsO/M6Jx1XlNssnUI0IvNoqqvkw8kFNU7UJiDoIXGPeirKMSMH0ZILbMAriN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747059; c=relaxed/simple;
	bh=dXTvMwZ3IWa8w/PCirVYpiMdDockPwSZQVUAZm7Ua1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnxec4hgdcfX4hroVH+Tk3nWonJQtqOfFRKf2FW/pbEoWtDpmlzwZFQD5Z03ELAddr8pv0MIGrc4IR0ZeZUHz4Ms+rBto9P6XT2GnLarbVcJIdIfSn7hrV4jb7ekpWYoVUQ18R53uvCQCPLt7wj1vSR7n5VcOsGx4RfkeDEwAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwjWWKg/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa680fafb3eso11770166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747056; x=1734351856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoCVrD28ayqu5D/DI17RscermoixTp22627F0aNO5EA=;
        b=ZwjWWKg/iwSlnFS+GTCOaFYbL/Y4ag4IGujXPUwQJ7U5gJfs9Z6M8NxNePkPFWv3y4
         lMUNLBgNHer3UmMQVJEcXybf/nDsJX81h+juUNafmMuMUtbA6Os0ukHNci4yAnj01pKN
         tcUr66SbmlX+a+5Ilk4I12bdQKKdIqhMVmubbrVAXwH4cOkBd9ODOwrUuypzD9V0FhWP
         mLdLzkNrwGwWcJHC8RwRn+sLaFzqqBGYDSQ8rF1O1weHkM/GxDbr6a6oaEla6WbEB+Ta
         itX9PTo4/Rk2U9dTfYxnc28QEXup+J7jEGlRFvQohb/5aPQc+TjHX+EetdY4fSnk8zrh
         pshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747056; x=1734351856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoCVrD28ayqu5D/DI17RscermoixTp22627F0aNO5EA=;
        b=a/yJE1gcmPueXeoBaSfpANPutD8+agzXzwYqUtA1WqOQUGMqu1FlrxYthBEQbVQmSZ
         wkQTLdY+cj1C6PqQ2UMzRJklPE5zrku4TgPkNttIwoTgel8WE+jP/JaGNR10WbxIMyvJ
         I4SP3rcf9OOYk33MG/MuHoNBPr3QDavNE3R+W/F6rvwoVXnwTDxNoYGZBM8zdVYrbFH4
         N83tKKCStpwh+ojLe7GRmI9msTPuk7G24tlrA8ImsIVSp+YDUBvlXL7xQpfmyitYHDs8
         3xophZTLoiPCqmHvYqpMnk4CKIvZvXA+//0Fg2Wy6ZmDPvlj/GRcNPZbZq7f0TSlW/hC
         b5NA==
X-Gm-Message-State: AOJu0YyA34coIUfqa9XBC5pm0FwiYadavQPuTCAFWIJS9rMEE+tu9AUV
	+IV59U9+ccNn+M313Bne/VvLljJmhZ2jLFcOOMN88ATIlKpajOOTt+nOVzYcOFc=
X-Gm-Gg: ASbGnctluIa+8P2VP6Byav7M9Izd85Hv497O2+HD9WMvGyVn7j5xXRynLzGzG9EEknu
	Z0/1eaouCp5pHhWfKwUk8rR/xX9WHAgT7MmLiVHEpg4W2acBop2MiSRUBY08CIfb7fqOfn/Ytgo
	2xL4u5ctEZTtSEz83b1iBokQxUq1l1PFE9I1WUBI7NvBjv7ZrVaJhD0P6ku0z8H0oeM7LVWzNO1
	66dFwBso/2wnF62H/jDoXLGT5H0M4y1703qiEE6sxvUbn5BgpfOs2HJ6c9CV2MCgg==
X-Google-Smtp-Source: AGHT+IEL0p06Hwmo+9E/f1lCO4dyZG2n/TdjzYJd+woyN99M4MYMI2vd+kMHzKES2YH6I7KFGRLVew==
X-Received: by 2002:a17:907:c008:b0:aa6:79e6:5b03 with SMTP id a640c23a62f3a-aa679e65d87mr176768466b.6.1733747056131;
        Mon, 09 Dec 2024 04:24:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm309925866b.159.2024.12.09.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:24:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 13:24:06 +0100
Subject: [PATCH RESEND 3/3] clk: qcom: spmi-pmic-div: simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-cleanup-h-guard-clk-qcom-v1-3-b1077540230c@linaro.org>
References: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
In-Reply-To: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dXTvMwZ3IWa8w/PCirVYpiMdDockPwSZQVUAZm7Ua1o=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGdW4WqjVaZZPkcN8v9OPTJHUcgo366JtrL28bgL8+92JHHiT
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnVuFqAAoJEME3ZuaGi4PX+/cQAJk+
 Nt95XiYbAfyAfpF+qC/Os14df5UkJTTbXxd/sOxHbKrDVc8xSx1fyqDWRaTcOD5Pe0wiD4glAzh
 FlXAenPqrW8yS3Vsne+gjpl3Yy9MknYypm+Wieyxvw3Uc0WUYJ9J3uf24bzJk/a0RGQIG/lq/Qw
 oOH6GoFnzTfQCDQeILelFLUkuYrnxQi+k1rs5rdVVL+8JYOBNoOVnjcA3DGFXvHmfWlV+f5xJcF
 JtcXMOUMZVrhra+7Tp7oLXbgaANGpci3rsCG+1cYV0OHsa0nqSivyPVfaIvX2PeBYJuiRUxbnBM
 /07FS0Cgmh4IYDM/zGJUQpXv66VARq3957sN/+kxJa3aOGa7KUjn8GQTZiu/pr5vr3QHA81ou76
 CbqlYK4hEWS59pz/LAp5afj6TZIHqK+4v/oHQfttCrpGI+nojazSGCIlC0oA5Pkvz6rDlllc19n
 YEo90GQZW5Z06eYCyzJ2UocPPDpWsGI3vU9aNgpXoT4RYLSvrWUXLcLR3WyF72Vsa8mCH/oEVab
 oDk2Vl6hs7wb/GtKKh2ljMeeXrL1k+JuSnERSXmF7hPTqNNvlJF7bO7xJVX6MJZOtxhuz5ELHyT
 j8Je7O7bNIj7bs58E1Gfvfdo69Pk9YphLl8kHumVDITdXye1khfPUhziiSbxHT8okOoRoCITbw0
 ymeVV
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f394031eb0e520b1b59e863dfbda4312f4f8215b..41a0a4f3b4fb316827365a522079dcd99630c49f 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -140,30 +141,26 @@ static int clk_spmi_pmic_div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clkdiv *clkdiv = to_clkdiv(hw);
 	unsigned int div_factor = div_to_div_factor(parent_rate / rate);
-	unsigned long flags;
 	bool enabled;
 	int ret;
 
-	spin_lock_irqsave(&clkdiv->lock, flags);
+	guard(spinlock_irqsave)(&clkdiv->lock);
+
 	enabled = is_spmi_pmic_clkdiv_enabled(clkdiv);
 	if (enabled) {
 		ret = spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
 		if (ret)
-			goto unlock;
+			return ret;
 	}
 
 	ret = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_DIV_CTL1,
 				 DIV_CTL1_DIV_FACTOR_MASK, div_factor);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (enabled)
 		ret = __spmi_pmic_clkdiv_set_enable_state(clkdiv, true,
 							  div_factor);
-
-unlock:
-	spin_unlock_irqrestore(&clkdiv->lock, flags);
-
 	return ret;
 }
 

-- 
2.43.0


