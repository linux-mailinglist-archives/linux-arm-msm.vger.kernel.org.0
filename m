Return-Path: <linux-arm-msm+bounces-9991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E984BD40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0218D28DFCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68C81CD2D;
	Tue,  6 Feb 2024 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uEzQL6Jt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216E51C6A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245044; cv=none; b=MnpB55aFpvfq53jEg/Oh0lyduP1kaBuS4uyYtN37FnHr0bL1xq9epOwGrUxxZyaua7KkM+1OIkOiQOYJWaosa+2d+1W2DUpCxx6/S0Zq6Ck7wc/dzZt2pdoL2LMPFQRVFI9CyQTlJe+B4O3rapbn62daMx/jjSVdB8a0/jIty74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245044; c=relaxed/simple;
	bh=5OdGYFu9CqmWBKnDDTkTc56GjeP6hdEjM7fvhmV7Ho4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCJ3Wv8oS0/gDXBs8d/3cWe6YXau11ld9sUQpun6deRj9D1E9kQLR23L87L7U48DZ4soDRYuETxt53gyNf0IS+3vhLvWW+FphPsVaWRmaXBCP9t6+6w09kKntY6/PzxANw/RwvjESddVYicyl9MeRh7/6y+tGdXVWQqeEJL7nmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uEzQL6Jt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a370328e8b8so590596266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245041; x=1707849841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkL4G+TELyncGb5qKRgsxW2VVdhetXIx83/bDt+aWkA=;
        b=uEzQL6Jt1cTfrVVEqnXQrgrqs2HQYkPZdfIxbytoGDAJ7P6tfmPn47JU+HRmIbGkWU
         Lgz8H2YFWBmSSwdmzqvX3EitJyBy/QA8m+SMo8Mp85De7EUBt4USC9NsXgAgNzltrYOe
         6dqMv1TDDR8RhVp2Q3fo0fVRMQWTuA4hxlMDb5ajPGiLy8jAaxMwhk0phAA+02ZBHiVa
         GW682EOm8BL7Al0mhpMFqmgaFQv+YF+wC32mxwfwX+MV1VaDPJc/ZCrAETK+XyZmD2ld
         N4rFYrIZp1yLOFIuyprmn4uRGogHtO/9/nY6a4ZCYBdGka4kNjeGJwYfysbhwnuQaWU6
         GAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245041; x=1707849841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkL4G+TELyncGb5qKRgsxW2VVdhetXIx83/bDt+aWkA=;
        b=MqaMsgLH+3MMNMt+/qVo4zumJ0YoXm8L0ymDmfJvoKdVbPcav7VjBjbiXFwjUrE7u5
         DpbmiotgphmoUEdBF4FqatGlAnLfeiwJyfpqZU3mpZThgGQZ4UCt1/f0KmgEiEylN9MD
         mVwC15DFq1+bQW8GbeWvkL2MeSirrDD7rYOu9nITXWI6TGNro3UhiNSCvlkBQq8BcI2X
         bOM/RNk6ChaMzPnD9w5OmZ+MeudpsHss7CJLNvPpfQ1J4GHVKcJGVD1U/sDGUS67lCSg
         A2cdp7L5/QASs3izxPH6I/q7VwHSJDLEEo6rpMM0vdsxVfBv+EBT1SsauhtIAqapYuwG
         rjig==
X-Gm-Message-State: AOJu0Ywv9cTvj7rMakkPAkWjm2PcvxukiRw7/jJybZ7Euv2LwVWztC9s
	i9QuNIT7jEctQp3vLD3QV0Ha0KMcpmmIi6RiB71EuxN5H+wssXhtOc4mRfM8kso=
X-Google-Smtp-Source: AGHT+IF3+6x9EWDEi80vngu+NibETsGvkeFscD0yLYQOCHiOeAUseU4Oo/47I7n4+OlsWWQjyXGLbA==
X-Received: by 2002:a17:906:260c:b0:a36:7dd8:637f with SMTP id h12-20020a170906260c00b00a367dd8637fmr2390327ejc.23.1707245041489;
        Tue, 06 Feb 2024 10:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVHE4S4/aDVtRTbyfhFkZrFGTxPiH0/3Cjowf/HMxaokpAR8BkydBzS2e7PmWOW0eE8NIo9k6ePMIELH5UTRvvCn1RIOrU/lHSCm7xNYt5eDZC9HZ6Wb03xGxwewDlyhOZZA9jXXBB8z3R1FM5ojOMpmkJ4ZX+fy45tmvLaHs4yUIBqt8XagTu9hTeEdv2LI1Uhfy6XtHQ7wMkBnAln/mr6nlsatp3hiXsUzyFsYYc/PF201XGGn61wMuIAu8rtH30T/pH5k9/Tbww57cLX5Iq66eqb2Eac3yd9BD0Biph8FLZrhowyUeIPT+dRHBW4Gw30lXj4GNagq5k24OqqpCJx268M+cXItePwhgsDWvYWyqRqSx4lW/hQ9C16zoFzMykzFUQlF25iFyLpGWE8J5Bn6Rr88Sn5IzqmoNB6lS3TBzIROHoEg5AJvfKXjWNZ1BIW6RlEF105
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:44:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:48 +0100
Subject: [PATCH v2 15/18] clk: qcom: videocc-sm8250: Set delay for Venus
 CLK resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-15-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1301;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5OdGYFu9CqmWBKnDDTkTc56GjeP6hdEjM7fvhmV7Ho4=;
 b=jmYLm7iAFHYpGT/g1wACgWml5VM9+ceT2qb4R/8XEbKDni90cfTj+edzFhXM0MppSiBX/UxOn
 GALbHV3xLYDCAOFytpUnj8oPG5IG+FFf3p7rtoJ0UzEsY/M+Ypzvf1w
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value was obtained by referencing the msm-4.14/19 driver, which uses a
single value for all platforms [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/blob/LA.UM.9.15.c26/msm/vidc/hfi_common.c?ref_type=heads#L3662-3663
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index ad46c4014a40..51b9816ec458 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -323,10 +323,10 @@ static struct clk_regmap *video_cc_sm8250_clocks[] = {
 static const struct qcom_reset_map video_cc_sm8250_resets[] = {
 	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
 	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
 	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
 };
 

-- 
2.43.0


