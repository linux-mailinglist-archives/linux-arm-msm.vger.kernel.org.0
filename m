Return-Path: <linux-arm-msm+bounces-10373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266184FE31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEF791F22022
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D92317C68;
	Fri,  9 Feb 2024 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diz0RxLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0967168A7
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512978; cv=none; b=Wz3DcosQkb1woYkoQgXl7jywQA0pnOl72Nxa28ECKdSjzqPSdVzwoVlqNtRMDAJts0zk/BNXBWP+NYXBPmLHgO4Jn09DqLLyUaWbxc9/Oc7U6rd7+7y7N/Y3xzAxFmmRB6VDZ7MECt9HGTZ8Y8J1fkSlCv/SlEQNMnudvAt9RxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512978; c=relaxed/simple;
	bh=lb27xhI4gdBF4UHcwKFr8ScxLgxp1+CafppHA2L6fhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BflPaacAootXP3KAvr2XLDp77/pyGIR8aLnJ9RbLEjzb5pH2mmkQlSMCZHRu1FGEZvXwFOB4PYpi1flz+5kP00Bg2uSX2RaBtFtnNJNwd/azw5xXz4EN6H1IZ4ndqJvf9k/dZqrJF8M3MI/Gf0sMp4wBZK2k7Cl1cxDJB/q62FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diz0RxLJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a30f7c9574eso168013766b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512975; x=1708117775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqgwRixA6ApDI8sPrNg91MKVrvVSPJRcKUUS08MgCmY=;
        b=diz0RxLJzazmqTqNIGo7qY4VFqslspNbVO+20rQCIPYd2VKpI7pGD4ukE735U8NLzu
         QAAEojlQx7AAChqHczIA35fL+zQbDCMOsOpDjkpT4HNBwsRSp7Kckzk/3IzKjjJwD50O
         JzWvsQYN/fsvixg3gITcV8DzlzyMAtOXt3swy3rRVM7mJsLkkRuofjGI06XuNIHF74yi
         JeoFEEnnKJYsroYDzIGuWkhgILSi/3c+1AVOtN9lL6weMdxDk3fMuzoW9z8LWQs9STJM
         zYxSkrPRbPGAKG1wFyoexAN136xFVlBt2iuKeCehvwtbJqDT32/q4j221Jlpwzz/6EJ/
         K+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512975; x=1708117775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqgwRixA6ApDI8sPrNg91MKVrvVSPJRcKUUS08MgCmY=;
        b=lKbVfHixBvN1mJbNzEvj1ur61t+0vkcuaoMWdgf/712P91uosllI9TEwLd+GnLs7cX
         sid4LoEjA92OxcPVxu+VTrxqnUOJogmzu3b1SQDC8UZPCZjPWiBT+e5YrAT7AtQqsSjG
         Vyp4A+y285BaqU+hIQDHI985AJ/guuFwE/VRxiHj6MieCGC8TWVQxmTxcCHFqivjxSG/
         uhKK86HoMdtYY6kLzQT3rgXMFMiBUVkLS8x8ins+DgJ31nc9bFNSym0Ov3duYzHiGq5A
         IZO2/KQUXKuamPqr3sl7OujhC2SUeVQ52N/2on+9J2yh1XCo4XIfemXJ1dIYj9idIVmT
         BRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyFNCaGQQvbCUq20uldZbzGUyYZa5u+Qg2rMFKhDgJwv3T61ubbsKka2D/X/02YJXAcVx02CGTtMH1JGMdOUp1AsWqpUCnlhUYWGI/hA==
X-Gm-Message-State: AOJu0YzP5AbJjS2IE+lx+4srJ9iza/Re9DrEE22e+0f+YVzl2uFJtTID
	b64U1kI+//9k7Q1ZgTS7ALvXfFj8sr9B9H4FaOE/h1URYIep+7DZFH2Ean455g0=
X-Google-Smtp-Source: AGHT+IGED20EuYrpVnsaQAht60P6B5x0FyZqdTMHIPCvsHAfOQfLEtwlg6QKs1bwugOpl8ZZaSiqyA==
X-Received: by 2002:a17:906:718e:b0:a38:66ef:14d3 with SMTP id h14-20020a170906718e00b00a3866ef14d3mr185447ejk.13.1707512975165;
        Fri, 09 Feb 2024 13:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTpvx9yM7mnErFtcDnUGDjP2VK//6k7DMnglmnFSfOgK97aAHSUofzQz3YO5rJnGrWRPsvAJoH3/eSqzs70LjH+cuGqtUvaOqZnd8UU+4KJITo0L/N96XfZxBVXqg2Ep+fXVg+6+SBfMihCI/DwhrCvo/VBwoC7MzfVnhMvV+2XgVlEDr+b6w8/+4gTU6ELNLADSa8UQy8p2weJx0s8oRI9IFkrXbloI7xVaB4df+m+eeMz/BOOjY/8hmjOpg6sruukekjDAPzjttEzFzzI/gyKtDekl/QJFPZISI0x8kyT5n4bWyzXWymyPw+UaCu+5OHxgC8WGItMzkxRbhTvPeb9Q8RhrMV48hDEFV2mxL1wsAi/juBFlF6YRPswUcvqw8c7kqlew71t9xrJXGuIV/HyXKzYOWI4vEIZuAR6qAkzUox/9bRK80vZz2FiJOAzBD8aKA0rI+f6MeU51PsXKyW0HqjOy1n2tZKv6LwNssgwB6dgReiHSHfFYjtjgDEx64rjA==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm1108516ejd.22.2024.02.09.13.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:34 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:22 +0100
Subject: [PATCH v2 01/20] media: venus: pm_helpers: Only set rate of the
 core clock in core_clks_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-1-fa090d7f1b91@linaro.org>
References: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512970; l=1871;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lb27xhI4gdBF4UHcwKFr8ScxLgxp1+CafppHA2L6fhU=;
 b=BYvxPbfQJO7lZPWc2Cb1EyRuJYBoAGwkeSywbuVSkwUn87PLDSMt/XU4H0pRNhwd6qD+yw/lD
 VK47K5Ow3XpDISNmeEH1vufGckVWwM9QPOQHOXKTn0E10ZcSJM+i/bf
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Commit c22b1a29497c ("media: venus: core,pm: Vote for min clk freq
during venus boot") intended to up the rate of the Venus core clock
from the XO minimum to something more reasonable, based on the per-
SoC frequency table.

Unfortunately, it ended up calling set_rate with that same argument
on all clocks in res->clks. Fix that using the OPP API.

Fixes: c22b1a29497c ("media: venus: core,pm: Vote for min clk freq during venus boot")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 502822059498..8bd0ce4ce69d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -41,24 +41,23 @@ static int core_clks_get(struct venus_core *core)
 static int core_clks_enable(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
-	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
-	unsigned int freq_tbl_size = core->res->freq_tbl_size;
-	unsigned long freq;
+	struct dev_pm_opp *opp;
+	unsigned long freq = 0;
 	unsigned int i;
 	int ret;
 
-	if (!freq_tbl)
-		return -EINVAL;
+	if (core->has_opp_table) {
+		opp = dev_pm_opp_find_freq_ceil(core->dev, &freq);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+		dev_pm_opp_put(opp);
 
-	freq = freq_tbl[freq_tbl_size - 1].freq;
+		ret = dev_pm_opp_set_rate(core->dev, freq);
+		if (ret)
+			return ret;
+	}
 
 	for (i = 0; i < res->clks_num; i++) {
-		if (IS_V6(core)) {
-			ret = clk_set_rate(core->clks[i], freq);
-			if (ret)
-				goto err;
-		}
-
 		ret = clk_prepare_enable(core->clks[i]);
 		if (ret)
 			goto err;

-- 
2.43.0


