Return-Path: <linux-arm-msm+bounces-26378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F055393335B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C92282824
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB0313CFBC;
	Tue, 16 Jul 2024 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVtV7x52"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24843770E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164416; cv=none; b=bNCoIMNlvnOukPuuoNv4l/NKjT3o1SQpXhZh419XZ59qNqLE/WwGEDTXtu/6rq0FMi2isyaqRx+FnNUKPFuuUyP6xxQgmpiwvjl+LNOCIfT3RUSfg/dPTzXhG8hGxUP/5gHbL+DyKJFvJpsUUYUGCnaK22ssxcV8aoyxSlNbXQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164416; c=relaxed/simple;
	bh=a2go+jGwlSDiQOgfMpQCSOKm3iOn59OWJW1jPgAWHmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnz3my0GT0TFM2ndYXKUbIyR3RmmdPvzY1uE90MqAP6uoeDCKSUfcpIrhWuDWKfthpyD30vrEu0iNwNWvhpJGJJWqwEDcXQDaaJJPivM8wf5BUuVNdkvRXUg72TsU1y8D+kFcIjflFmBjYvknOTowmY/xfDpOiqdps5c+2Xnw38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVtV7x52; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso1603301fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164413; x=1721769213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvoN5XWXNiKajtlpi1yXe7yyLXYYY7zXOAtfKaYfrlI=;
        b=fVtV7x52GygcFpa3xAyNiVlKaGxmrYMU01PwcIDKfGRWBb3W0ZbgA4If3JTt0VHj/5
         G+zF873J7Ds/tPj386FWQrNw1BytpzNFG52qEExogTochU8F0oPrCrOiq/AnqrTeEaj5
         V9LQPNfzCXQYulCSPuJJz8doQTQ5Mr76z30DdRypNdMkQuHwTz4yiiENchvP5rJabYLl
         r5QJeUB6iqa6PKwmsjKSBv6j2eiCrWcgNXyg86ayuVlFBQGjsSY9H/udPovbnv9rY0s/
         EUuw3+EMV88wYyVkp7pFcpUnGiuxqD23LRR2NkI/Lo1t2ysZWkco6ZMF8tLKMRaHXTEX
         Lujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164413; x=1721769213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvoN5XWXNiKajtlpi1yXe7yyLXYYY7zXOAtfKaYfrlI=;
        b=ZhWNvYUIg1cUYruJQClFKP19w7aUw62vKFoXaBqMy59PfIfhwo3FSajhnpRNKZrKQI
         22P2HlN6X+4yX2P54b53hZmyh7+aZc3UMf5TcydLeEBtnPyV9dQANLjW0g/Qq4UB6qDy
         QoSQaU5u+cd7LjCFdVSQgOaRwKR2k/BjCUQuj5unDm3vZk4Bhk+Hd21t8uK2Q2agT2TS
         od0soYqRzO9pSoosRaf25EDs/7J9owQ3mApNg7WpX6hLDkgniWWcS+9zYBpBY/soHP/m
         yUvDCtckdO82m75Bm0btnSfVxdtbW3B2cbhzFdEcVCCdQI0/am5IZgrHdTgT6Eh8N6Vk
         DJQw==
X-Gm-Message-State: AOJu0YzaDJc/yWy43aCK4L94H33xSyWpQB0LocFWm08mlpN4W6XGDbUz
	2kY1nXVIm1jnXCdzd67owCH3E+Ugb38wYCROF+M1vM2+bG2EVsoawy47djGRuB4=
X-Google-Smtp-Source: AGHT+IELKvEuuFfv3x0tkkA2AkRpTpW53crvkZoxzdB2JA0Fy64RdcgxWzl7Wd2EbEDxHNoHEeG8Gw==
X-Received: by 2002:a2e:6d12:0:b0:2ee:8a4b:3dd7 with SMTP id 38308e7fff4ca-2eef56e3cc8mr9882211fa.15.1721164413173;
        Tue, 16 Jul 2024 14:13:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:29 +0300
Subject: [PATCH 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for
 mdss_dptx1_aux_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-2-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=a2go+jGwlSDiQOgfMpQCSOKm3iOn59OWJW1jPgAWHmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ5OAQE3OdhmzCYh6Z3HVU41rDsaaB0h9tfN
 c5BjaM4Tc2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbieQAKCRCLPIo+Aiko
 1dHCCACvQ6XPrkbMjT8SZ6FIfOv9jPhBSRpmkAVgD8fQBBbEOIPRl6JvS1poSDXtaaxYAzWcDAA
 jgl6TR4f5a08Eo9+JtZnmJqSy2XdA/NkD7MEHzB7TdVrg42F5u/u+jh3kaFL/CO1Wm/NwE7fgHU
 16HxlcnRVTU2SlIDKchliV6pPl65v6dy060vh6gyKhfeZbD4bqcVV9dZl3NNI6efUA1Q1fjcbRl
 bmVycuRv60JgbMYcqKd0y1iq0dHIdHgIP4N4sbKfUDtcf0VeqIrlBAIHZwJ45TIwv6NGS25GnmL
 PiG5b9H6z2x4qJPRILVJGBh9hNHqKAKs5Zff1Si8ssoBglGv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

clk_dp_ops should only be used for DisplayPort pixel clocks. Use
clk_rcg2_ops for disp_cc_mdss_dptx1_aux_clk_src.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 09e4b1e40e20..8ceeb17bbb37 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -400,7 +400,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 

-- 
2.39.2


