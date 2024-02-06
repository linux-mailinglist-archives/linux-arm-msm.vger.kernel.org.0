Return-Path: <linux-arm-msm+bounces-9990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782B84BD3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA0A1C23864
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E7E1CA8E;
	Tue,  6 Feb 2024 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kSNUn91d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887161C291
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245043; cv=none; b=I+3ig2T+iD1U1urfEkN2AQYlHfQVtbjA2qpVcxprSLYBebxqOj/L8APQQ61mNRJC0RzDg841xTcfuQlxIFWWrJy+KHk+VxY4Q4PsM8LLKYkYvCdKXCLS/28lawat5ZYQN7pJ6j0qZzIBbMt7zhI4eaVt524s+8rSzh8hUSZY6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245043; c=relaxed/simple;
	bh=z0UvCR3eA/Pj02vuX/VE6kFABcANNusSJTpXlxREtE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqCkZ7EbdQvjxFRITS78/0fRTAAyj6ccfaKZL2q/CthHPVex4+nGd7QlS4ZJ3bZ9FlE3DIFPnaH6sn15Nv7sSxR0QCWISTpoMIWFezfB6+obrbTT3VIbCMp96FpkMKoXq38eAJZTepDiXWjRkapSX3ha3dkaB8qf18WgtcdGQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kSNUn91d; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55fbbfbc0f5so1669424a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245040; x=1707849840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTXMySSjM+TB9gHsIW2sZkrPWRgmdi9eib/Lrz67hao=;
        b=kSNUn91dCfpEHeuLWtzAYRP5N8N8b+NAYs3JHKfhb39UtLfNuoMDWm1untJxj4NW1x
         XLxZP9wv7I7FVfmgyvGOrOZcT5LqMenORW/YH9Lwfe2PGSUXkMZBqeU3WpESAaexhBSv
         dbbt0m7wXqrM3vZOp9JSgF4NHNmzG77RDXMbJuonlUH7UejWO2B/Pabate51LyNKCX0u
         SltzUj8tEZCt/00fc8mbnhxH9BMaXDVs+3QzSBt2Nc4C/iFF0jKlarksVsLneL/PY352
         rUbd2l2iJZgt6ICegjRdO9naF/rMvbG1VGc3VzdXzLRVJcpZYZWBoSk+wvqxWM8ctcWn
         UKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245040; x=1707849840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTXMySSjM+TB9gHsIW2sZkrPWRgmdi9eib/Lrz67hao=;
        b=Tcl3l6RnEZdwMWPsz/EpfjC/Uu4R26x9lBInxpavKqHvdeTqst7/8Gmhl7ymrT6sl7
         lastx5S1I5m8xkKAR6Wt52d/mW7t5lMllyTGfqgOth/HLyzhxKeE0nwGmkTZJVGlpzwD
         TSvI4WGRzutvEzcwmBjzbitbd+/DGqs9Du35wL3AEelFVsQf311hc4OOkZPXrVLCxvtW
         /lRzGhD774cDlLzy35tB0xpAFf3luipnnZMpB2oVRl4alAQ9VBcPCCyeBcZ5gbdccn3t
         6KjgYIKqFubdAtf9GvDKpsqRn+74pwuaSSl4kSVxmYatbo+TyufFj5UQDk20tHMv123d
         YyNg==
X-Gm-Message-State: AOJu0YzFQVeGihyUpQ4zwnmkiiKFiyK8nz4LWdaQLkZT8+UyaPFS1WX3
	X/H7LbvSuVn2zm8KyrWOmKShOQt/mqVAaHwpllVMQdzHrAHSaEF/wIKqqZianYc=
X-Google-Smtp-Source: AGHT+IG5uMZMjX6h98nWMSRbSnIRSsKQ1Wi2SXVTsg+zAzkQdsMS+ErVE14TEWkjRXRbhkktBGBIrA==
X-Received: by 2002:a17:906:c102:b0:a38:32bc:bd24 with SMTP id do2-20020a170906c10200b00a3832bcbd24mr2260583ejc.36.1707245039950;
        Tue, 06 Feb 2024 10:43:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXhJSLgRrI+1tJO3R6fUdpSrGmCCIZjRlWz0bKqd1nMxD0oU17TOtxCG2zSkg1xGhZXlOZZTY/pHtkj89aemRURa4JINJndaRyzFAk3Iz8CKv/HwC6pMM8jqgDFpqn7+SS08a6mDmjymWE2uAlySAs8FwFMZzNNDsZkJemMydczdJNORe+U/aOKuuyak+rPW/FZVCCE+D8Kd7T5v6lTijQI9JbYZ4ziSJrhoH5t35VLbJuIkChisoOUt1O4dMMyw+ByzLXHgp1L4GiMelP7BgoYSKJ735TA+tUXPxEW+cNoqTbhaLxkGI9cweCAVy+zhgpnJl6MOKkD20CDaR8z3eqyrt0fx2Xv8IhlEslL8nfoOWjoW4uT9eEuFOIylUeK3zHrSAz7KXK0xW57Z/WqHzLyUv2Pmf4raAyI9KNQJE0HTgZrvnK70rnRAlSp3TwZSvHqIq+bOYTd
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:47 +0100
Subject: [PATCH v2 14/18] clk: qcom: videocc-sm8150: Set delay for Venus
 CLK resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-14-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1115;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=z0UvCR3eA/Pj02vuX/VE6kFABcANNusSJTpXlxREtE4=;
 b=uwAcFMJiU9sa8CMjznz4S5ue15VbSRNhDDSuo3SKtpqPYbgs3tcYdBzNoRVm31F1Yprjuf7Kj
 pVU8qTsf3boC4aeZeNpffu5UHI33LrIK+c+GTrxq3Lb3JieCOC5auPj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value was obtained by referencing the msm-4.14/19 driver, which uses a
single value for all platforms [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/blob/LA.UM.9.15.c26/msm/vidc/hfi_common.c?ref_type=heads#L3662-3663
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index f1456eaa87c4..bead5186a5d6 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -215,7 +215,7 @@ static const struct regmap_config video_cc_sm8150_regmap_config = {
 };
 
 static const struct qcom_reset_map video_cc_sm8150_resets[] = {
-	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
+	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { .reg = 0x850, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_INTERFACE_BCR] = { 0x8f0 },
 	[VIDEO_CC_MVS0_BCR] = { 0x870 },
 	[VIDEO_CC_MVS1_BCR] = { 0x8b0 },

-- 
2.43.0


