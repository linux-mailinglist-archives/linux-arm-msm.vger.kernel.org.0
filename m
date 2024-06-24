Return-Path: <linux-arm-msm+bounces-23887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25622914434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CC0BB22559
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 08:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEDE4AEDA;
	Mon, 24 Jun 2024 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5u6w6mD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047349625
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216363; cv=none; b=okGSuTyuKuBtrMagrSUuOOWDzkpdwRptGHVtpCQOXBVB/SyS8cuP9UuCcnC/LxYGs+Itq4aglEepZXDBa0Qo2CW7YZdd97lKh5yN5qIMK/pafrxTEHkiDk3cXhfHLhk/oIWm6LASvtX1s99jql+KGH46iG4JIK632rax/s86vEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216363; c=relaxed/simple;
	bh=U/4kw5IG79Gsn2kPtSO6sfS0IfZ5NSqFkcAhXyCMABw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDEZuUiITztSSGhwA9sF2WNBMAkxgJ1kxQqbGE3YYDWZrHbPz5STo3PdZhMXaySK7bw3w8draNcFA7oS8wQw5SZCGuPbVoWNqh2h5ujNzb8WgHyT2X845P4FndrivqGdc4TcZXVilXW5mwJ5fuaQSj0w6cEkmcbTEY6Lq3hBESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5u6w6mD; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec1620a956so47860861fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216360; x=1719821160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktOl1TdyOiIKzT9WKgPBAfSIkppzwpfD2FA95WZskPg=;
        b=q5u6w6mDlaVVbYDBeFsAm33k4N8L+aIRrCL2bpNG4vDJFxSP0HAoFDsFIGmJiO3RCQ
         1Ke56N0o/OeJIM1wqm911KYthEdKKC0yduO+fDCvEObQcVZM1MN0+X9Lo4BEs47qzmBo
         rPpkH0+GwsqXK9oBvuOtJZOZRNyvLFN6BDMcegK6jCHHFWD7sWZt8DDmFeHl4s89AT5M
         X2SjiAKb0pgJNOHRCG+ToQGytcOcRn5R42selWtYNcBvF1ckyD15lU87UNikL0lUy7GS
         rqeIuEdKdDReQNQevqcCHNHz1Y34HZwBUgPvmHy6Z8hGXfGiuhn/DIi1kYgdszsQf4fF
         M0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216360; x=1719821160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktOl1TdyOiIKzT9WKgPBAfSIkppzwpfD2FA95WZskPg=;
        b=JnApJWBj95My8FGKEbY6BtG8Ua2PSdB8Ij5Alhjq3JiU0GGXI1RkemS66lnsFCIHuP
         Awqvl+zmvtB4p9uafR50aiRz0kdekmr1IKNsIscGA9+0AHAamSx1rpROtlGDx4Ydz5tq
         HcjmwzW3GAdim8nMBK8gfg1lj8nzPyeT1szg87YbD/hYtEZU0bpnpendcOAGHjgrHKOu
         B/HswJCzz5AmsJrylPHrSrZheVhpbtiSUKjtsAeA0QvsQ1TqPEqhIwZKouFQ8SvLaQFP
         8LlPhEzPPpDQnQWdpaN4j8pFUzCaaYxJATsKXiyOsCHQMuit+ZLkQo+kB3VCEUIRPGpY
         fPjA==
X-Gm-Message-State: AOJu0Yxi5pFryIX2aTP/RfqXIBN8QkJFDhmkOodx2pyZXU0/EIu2w3/S
	Y+3quOHKq6Cz2BAWbf/rhe84t+VoNiDhZbgnR8lbZQYaqXBq6GF2yLHJT2l463c=
X-Google-Smtp-Source: AGHT+IFikCUGMq0UTL86rjBwiRetioGQQvG4GE/IGZtmz7TODV3GyLgbG4wupKORlCuu5umrIJPHzw==
X-Received: by 2002:a05:6512:401a:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-52ce1832541mr2791403e87.3.1719216359895;
        Mon, 24 Jun 2024 01:05:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm9280284f8f.104.2024.06.24.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:05:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:05:51 +0200
Subject: [PATCH v2 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-topic-sm8650-upstream-fix-dispcc-v2-2-ddaa13f3b207@linaro.org>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U/4kw5IG79Gsn2kPtSO6sfS0IfZ5NSqFkcAhXyCMABw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeSjjPByt2B3EFJuzbEuiV+a0ElumZUUDhDdwd3M6
 2AiXUBSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnko4wAKCRB33NvayMhJ0UnwD/
 0QQCRTICcNcXK35BooQCJ/xDstdEc5xcmDffrhOcLnyTUZXpW5qf2vfdV8ihWBu0h2JWHu/FEzbPIW
 jL3J1bk0NopRro0jXZA8RPszGtitpG8hZSAOu9RAlcfXItLBDFwjufjtLelv6HBZqPtbzugN1nckf9
 okf+DWzrOovEGwPI/A7NAXBJPjPEv8xufp4l8LJWZtqclhfB+FrkZjlAobrVJ99jVL57GjWQg0Evny
 T31GxGvR7eSQL0lkxFscb1fCLC2fk5KB1ktZP6fhC4TRUnWNcH4eelsxUJoznjnugOHBtNrzKXXA8f
 g+Z56GESEDhpXKL1uAS01CSv60tpsC1aj/dh3VEoUVMuVzh/CYO2Ogyji6FeiZYtHzTYkUouR6Qc5N
 6Zk+XxDxrBQ6LqiSdHTtLkAumlTDZ2YC6XWL45YEEhGPHlyH2bL2LKDCtUElasPHqs2ISPZYpGkUuh
 jIRYPveBGzAz6g7vL/qKUwBrmB3bEUI+fLkz/OlAgzDrsb1wtIkSRRJtYBxp0OY+iBtQLJGWx9LVlm
 hJRCR2zy4eiuu0J8lzc7q0pvIYzkrceFpZIfq1lmtaB1gapQbwvdxb9aG6BgxF3P91K2ldVlJg6eDV
 qd28gyOUWfZkBUz3XH8tn5br1EXd5nsqBEVNxo9pML7I+8Aj8TIESxZxvwZQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
and byte1_div_clk_src, the clock rate should propagate to
the corresponding _clk_src.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 360b80377ed6..1222a26c45c8 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -696,6 +696,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -710,6 +711,7 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.34.1


