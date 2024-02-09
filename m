Return-Path: <linux-arm-msm+bounces-10380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1784FE47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C46B2950D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A4C39AC9;
	Fri,  9 Feb 2024 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhiZz07Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D3238DEC
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512994; cv=none; b=Gh9j8/5m3KCb339tgKwjOZkO+0IG0hElKVJO7dS/KVaIsaYzNlZ2So5SBFGGpq9Ntg3HuehFP7ozlzJiyTd/C8KqRFI3jKOy9//Y85Q9Oz523oVBKAK23OunPNm52o79lRH+nfg1NmNTggV5YEfyn/AM4j59+j/vLeQNJXyw5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512994; c=relaxed/simple;
	bh=4x/me5yeOEh7Kc0NCGCe3k/ewNhk7l+PTAXEKLbJtdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6j5V/fCKsq0tcEHFt497r+L7F5Uc5I793Be5HNRPTv14H6p6Y1AV6RC7vQF7r1YqAJcmrqtI354s3grpq4ndEHf4fkiTDdErbNUEEINnDCQYk4xl7KWYRPAKWVeYJsGGZDG0FVvKOAgCgsbC6CrcJ3txbtK3TBUhM2N3+SWPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhiZz07Q; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a36126ee41eso184668166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512991; x=1708117791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clU3y8fBgJIxt4Cy2lqLbmum74KaZZM8VM+LPgiv+vQ=;
        b=UhiZz07Ql0p+y24zxQIMqRo1zLmhdji2ys76dPIywqHDgpw6lJqmS+a+FUs6wCWD1v
         lYT2jUE299B+5kq22myFDjdTRl4qOA5NuAu25q/g2XuHdL96MK8srvfoSxNzG6wET8cY
         rBbIpUn/H5jgnt5SJBzaRkLPQrP8XXh7BqBcQM7Peu8s1uNqfAvZmpA/0HajUYkqUNtn
         sWMyfQtcw5PHASYWWPBzfFpP3sQgWIX32b+ZO697KZksWWG3iSvCW0nQNi/fXCw8caav
         NWuj9l4thVUhh+jypKsQ/Bo0FPipzp+Nma14mbsUOki2HkHJ31lw2SYx4B5eNo6h8x2S
         6dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512991; x=1708117791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clU3y8fBgJIxt4Cy2lqLbmum74KaZZM8VM+LPgiv+vQ=;
        b=JCvTSYq+k8W/cVGfNg/znZP/z7X4Te7dYu6+t6w7xMf/LLpXvpx8KnoWJpoeKyq9TF
         42kbQNHylZ5I5FfkGgze7DVeXfCfPBDdTlaksC3otAfRmuANsL7M1AMCS0kg8UAdHdkZ
         PZwfyr1kLuUA5h9DwoGBGJv4unpqxPYeLhIm/v5lOaraARoNwoXDEpwXxpqxngAD/rzt
         b3g+NbDZDYGhlIvLhqk900Zqf3oE3UzZPpjVPvuJshYSFxguyFSsXltmEX6YIGUtJjbY
         JobTvpiz9yg30hwmcXCMI5cFaAr+4y7+jas0ntw7dwK4QbXnjLZ5J6ov17I6ZD6zbn3G
         Ddfw==
X-Gm-Message-State: AOJu0YxJE90oB460OBGCmk+LqXt0TzI8NF0EnlkYExdm/z26MXVytCqh
	2muYfk/WEMyxsRjfN/ZcKBdEPWObe2OmJMFSXwZagmItGYxaattERrz/ni0d1Cg=
X-Google-Smtp-Source: AGHT+IGdCSLjmTu54nZwy4pt/JpV9RwCayC/JuDbyxwWbkLW1VMMBQxw2ieEvUAsBp3Fe5UvW2bBmQ==
X-Received: by 2002:a17:906:5f86:b0:a36:f314:d8be with SMTP id a6-20020a1709065f8600b00a36f314d8bemr177645eju.38.1707512991022;
        Fri, 09 Feb 2024 13:09:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfK1hN2/I2FkTD/QlN2R7RH8j8SoCMNxmB8yrXSniS2G+ww3u2pToMXvVJDjVf8MGI4vTsLSNenCDCP2h5/olEpuVssyMgf9/94iNVi1gO2pCiGDasz1AqSOexpvElGbRI1VbLzQVllPrtiwK9ghp4U+pKOez78H/avBzE5sx7wnQrDMCdwrtKQzG9Ps6cC4BnvtK9Qo9Y277DDvobKnf5HF0xypDNnH/AbFD1y2WbhfahxppvC8csVkmN0gb6WnlQi2bbPh6zHQJ0Hp0QknUaNRVWShWfWfkdvXkLRsCQfPXtJ4gBJKu7MGFRiXPPhh22U3dm7wmKuvITllIZaqtEdlQfkm7RQkpcxAmxZcqt0E/l+rDPHiSnMd3iYtsKkPg8ooFKs7vl4gVeaHUgNgETXitZq+HtrEQz5xGrxfT7zotIr0BcwzAQJbM00ffSCQWfOdtbqhN68yfbjI1XTT05TDcVsraIgCRos7sEg+DUYM8tqf36EC1x6x9CqlwtBBrPqg==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:46 +0100
Subject: [PATCH v2 02/20] media: venus: pm_helpers: Rename core_clks_get to
 venus_clks_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-2-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512985; l=1211;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4x/me5yeOEh7Kc0NCGCe3k/ewNhk7l+PTAXEKLbJtdg=;
 b=AQAHlC80oGjh6PEJ42jPoSKbuJtBPAtDuFcaMaRA3r7rCnNIsr34E63ziRxXFsC+tD0h8A3HF
 KPIe1HYtMWkB4CySePVKqc5bctFpRgss76IcLM6BGkBSxFp9DgmD6vb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

"core" is used in multiple contexts when talking about Venus, rename
the function to save on confusion.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8bd0ce4ce69d..ac7c83404c6e 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -23,7 +23,7 @@
 
 static bool legacy_binding;
 
-static int core_clks_get(struct venus_core *core)
+static int venus_clks_get(struct venus_core *core)
 {
 	const struct venus_resources *res = core->res;
 	struct device *dev = core->dev;
@@ -294,7 +294,7 @@ static int core_get_v1(struct venus_core *core)
 {
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 
@@ -961,7 +961,7 @@ static int core_get_v4(struct venus_core *core)
 	const struct venus_resources *res = core->res;
 	int ret;
 
-	ret = core_clks_get(core);
+	ret = venus_clks_get(core);
 	if (ret)
 		return ret;
 

-- 
2.43.0


