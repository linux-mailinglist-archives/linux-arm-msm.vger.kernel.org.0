Return-Path: <linux-arm-msm+bounces-15430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6B88EDC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AE6B1F385B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43E515216B;
	Wed, 27 Mar 2024 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGUDT0JB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423A1514EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562938; cv=none; b=nVIE5mPmTDoe8w5YLWEaLVTeEkwjymDSkkFd4hWnbiP9BZ9JZ9x2rj+eaZojfdw6+9V4vg8StkFBCKh0zMv19tiUqiuRwPbpqbpojw+pZAQm5KsK14NOsHhS04RFpRhaimV/vR50Pjh/eTlyWww72CPVs57QpqPeo+U0krTF3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562938; c=relaxed/simple;
	bh=eVSp2SaXb6ZPEBSHNnDQtpmgf1YsvfYEdjUHzWm3f+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl7gHkeJkWDGr9RqRTgArTv5u5HU46dSz+UhoUq0XoVQbwtbgtkK9oU7AkStE3PHFffiQE1m9hzYv90ddsN1PlPGsdk18/v2LFoTTtVLQGExxw1Zs3cRot0sW39DeCv+GaX8N7SUvmB1/hPD5VvPQ/Qm2lkWZ97XdtkmsQF3K3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGUDT0JB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d700beb60bso950851fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562935; x=1712167735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wX0IpKx3jbsUc8KFF/llXZK/XjrxPJxaaSBhC3+nnU=;
        b=WGUDT0JBZguhcYWEsQyZPljvyoxw/2qMauHU4bnDXUcTFrvNco7zu+wufMKK2cDA2R
         N7ho/LKd9/XGGZBGp7iD/546lLAS184XlLREWUdNdLKnNVYMqSy3xcHh/NHVbKDM/zpE
         pRO/MJPpW76ThDlx9xDJv9/z2f/Ylwbvq4+4eQ+awRT1lt5AWW54NCu9lkGn8rftZJ0O
         k2BXYP/Nnz8GNKlqd87BM7NlUyHKdzT3WKECuLmzE+vCe6f4WeAs3YqABTeLKrhS7/Nc
         Kc4HqVQZwGV2L5/tsBsHyWuhfdHXU2BU5MVvIv4678ENkwLZSs4v66i/EDcgLU3jK5YZ
         rcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562935; x=1712167735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wX0IpKx3jbsUc8KFF/llXZK/XjrxPJxaaSBhC3+nnU=;
        b=KiRb4VTIY0/h6EZZAygrpG/66KKOh5p5VgF1ccp1KKUd+XjxySFj70/lKQn2R69NQq
         gEuT6wG0i2s22Nc3AldbJPzmJep//rl3v+vTGx2zkJD7PYGIiLEA1uQHtT09FCygYdOp
         +FZVMTWiKcCWhzkQ7s8fb4yUNz1rpbWAPIdmbJ5jJS2DC31MHuIYB5GQQeeVawDe+prZ
         veP44EjJ+jh6ZqbSXIIR1Rmu2q+9P6hwy/Kz14W7QoxEBUdJYwowKO0qgmEkt0TYl4pW
         M9sTreM0Gm+DNsuUetXsBs0CcutmpScXRLu/xwkyLR0zFF7HkWia6hwi3zL9R0+96Yuc
         tqMg==
X-Forwarded-Encrypted: i=1; AJvYcCW5rMHAmTX7+7gl/sjb5P18r0U7PuZxALo1oMrG5hXaVPLsmjk4ZVvjjt386lopIScw2N3KF8V20H/n7UIEDFlZlSmErfPUVbI7pdhqyQ==
X-Gm-Message-State: AOJu0Ywc32Mee6WJIPhbHQauxvOkXykU4LMDN14tZtJ41ZZ/LtmY9cI0
	zO3OwrVXJQyfOyYsURr8c0F+cmvmlrmqQkx++AmeR6zev5sbTz/IpWDGj2nmUj8=
X-Google-Smtp-Source: AGHT+IHyeSfG7ShilV7TcOWI1bw67bLr5thuITdc64PT5gCyRpNSobuwZPQWecT7wRuzwik+KCUFqw==
X-Received: by 2002:ac2:4d83:0:b0:514:2f24:b0b6 with SMTP id g3-20020ac24d83000000b005142f24b0b6mr154865lfe.67.1711562935224;
        Wed, 27 Mar 2024 11:08:55 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:08:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:43 +0100
Subject: [PATCH v3 05/19] media: venus: pm_helpers: Kill dead code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-5-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562923; l=1555;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eVSp2SaXb6ZPEBSHNnDQtpmgf1YsvfYEdjUHzWm3f+A=;
 b=BHWNIoTztfwsrr7RTZRtaZ/YQ1pFKmqgIum9BEIl4vsZSVPGO2xFlQP/pT4zwOeWHR1Vb+Z3r
 /McnKLl0KVYA7TIGWZo8axiTp/1+e1w90voRNu1NsVTvMWZezJg1Ik0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

A situation like:

if (!foo)
	goto bar;

for (i = 0; i < foo; i++)
	...1...

bar:
	...2...

is totally identical to:

for (i = 0; i < 0; i++) // === if (0)
	...1...

...2...

Get rid of such boilerplate.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ef4b0f0da36f..730c4b593cec 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -878,14 +878,10 @@ static int vcodec_domains_get(struct venus_core *core)
 		.pd_flags = PD_FLAG_NO_DEV_LINK,
 	};
 
-	if (!res->vcodec_pmdomains_num)
-		goto skip_pmdomains;
-
 	ret = dev_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
 	if (ret < 0)
 		return ret;
 
-skip_pmdomains:
 	if (!core->res->opp_pmdomain)
 		return 0;
 
@@ -928,9 +924,6 @@ static int core_resets_reset(struct venus_core *core)
 	unsigned int i;
 	int ret;
 
-	if (!res->resets_num)
-		return 0;
-
 	for (i = 0; i < res->resets_num; i++) {
 		ret = reset_control_assert(core->resets[i]);
 		if (ret)
@@ -953,9 +946,6 @@ static int core_resets_get(struct venus_core *core)
 	unsigned int i;
 	int ret;
 
-	if (!res->resets_num)
-		return 0;
-
 	for (i = 0; i < res->resets_num; i++) {
 		core->resets[i] =
 			devm_reset_control_get_exclusive(dev, res->resets[i]);

-- 
2.44.0


