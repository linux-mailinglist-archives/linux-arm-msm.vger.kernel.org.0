Return-Path: <linux-arm-msm+bounces-16150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BE895C65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 21:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A4801F21D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 19:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2816615B969;
	Tue,  2 Apr 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBP1gaRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB815B54E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712085843; cv=none; b=hMPNpbB7I8RX+ptW0d6ENwmE/vjg4RR5K8sQcCwg7nEN7ItQHtpHBmIqAR0h8cMus8C583NgbWOA/cgcWZ+lEoSS0sZ+NdqSprhMFRQrPyWar8HYEqRBuQorfBoHUPoOMu4tjfx3LOpiRBSqafNYKHQFK+2+Hj0VzCmVMa2VvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712085843; c=relaxed/simple;
	bh=P4lfJSIm/a7/ENCpKQM7Grq/UyklOWzj2htNKV1x5iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj21bCscHmK50DnCuAT7jJlbl/nF6RT3Fvipcd+Wzy4rzyTmuBT+KSlrpAr/MmdvWMKSw0J3uArQ+boslLouxy7PINy44Po/9ok8b7FD1LuLEdPm0tZiTY9ZvAhSNp8q016S3cKAyOqICU0gTMlFcFArtHtOIz0EzZ5dtfamZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBP1gaRV; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5489558276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712085839; x=1712690639; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MAyxhZkMhNdcgpLgRXSZaiWaWTqSFcs47y/RT6HYcts=;
        b=MBP1gaRVbKTN+N4bfDwSjGylTUF3W5/R01hldCURAF6wGKbKQ+/I+OloQIIGRCAK4/
         8+++zHpByNz7AXfQGaRD8pyh5whAeK7Do33lZlpiZV8xlT/uxszH3+C4j4pS0+KZApPp
         OFVRDR5nnkqiL8kpnD/7/XQGca5APl5JwMRKWGfN5Z89kkWJFi0+m8EkgUAIf5gxlGS0
         kq48uEW+bw54iAeZkq61//nahvQl1kABABboR6ftGOtvYUtP8rxgDHr6qiwhKUpS+pJE
         7uGPJG/KtKVFa6bSvH8hpxMhd0KznVYrDyCXNHqxazqt5KNKVcO3OQBjQ+igtLbEJsW3
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712085839; x=1712690639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAyxhZkMhNdcgpLgRXSZaiWaWTqSFcs47y/RT6HYcts=;
        b=PB2xg3oflCGxzsECCo56/sYzMmdfro3J1TmFYix49ORef1AP+1gKAa3HV9GV6dLddD
         QIvuqjn0F1CtnGoQaZy1E4hb+8XjWO2t4K6td2/sL9sMs3bHfdhIHGKvpadyz+THfAIN
         taoDMZ11QZRjlUyLZMjCeqU5/lOu3jLUQ/uCVSvMOGkunFr8CBwPhug7JPrVQtdvaHPe
         DhmD58bxn8/MRYzyQK4t02xY3sqqlV+F+EtvM24xvom+kPpub6tzJw15tmB/RJTQ0NLZ
         AaB06Tgi+HVXHrzHoXTsfcv+0Oo/qHlIDcC/M3UFN0F4614OZp0H6KF+h1jL+kbX+cpy
         omXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZ/CtPt6qZXBqfEaJuZU1ovof189E8ikfeKQDpn0YKdupAPZISp3/Zsxr/cUWXSSKVsbusYxCobmRpbEfDsLEK/tJsofMhGfRXu4+0g==
X-Gm-Message-State: AOJu0YznT5ssnLAYnERiSjgEuMn+NJ5C7gUa4P+oxRJgro7CgvP8EdxY
	gClQRUmH4QKu/GN8Uzx7gLtmdKPPIUZuLKhAKFeBRlxT8hDyTsEHY02ZyNtpUzDCQas6nUSeBjj
	wcheHp71AImuYlz5xPe2OJobSaF9zVZej3JBYJg==
X-Google-Smtp-Source: AGHT+IFKIQlrUzR3pAK1EBokqKddw9IyUrdsIuy+DVXrWjrRPHpJeV1kHARI2ZBes0kp+Iv9xc2UePgf1bkuKbGcdWM=
X-Received: by 2002:a25:741:0:b0:dd0:129f:16 with SMTP id 62-20020a250741000000b00dd0129f0016mr11007422ybh.11.1712085839219;
 Tue, 02 Apr 2024 12:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com>
 <20240330182817.3272224-8-quic_ajipan@quicinc.com> <CAA8EJprtCbePun+gpwxg5e6o5NaBnunEJrmDrCV+O8BdHEeuYQ@mail.gmail.com>
 <9106b0eb-e15d-f2fa-d681-4017412c4a76@quicinc.com>
In-Reply-To: <9106b0eb-e15d-f2fa-d681-4017412c4a76@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 22:23:48 +0300
Message-ID: <CAA8EJprP4Skq0GxyuzoF7Eu9pF+2Vm2wwbu9m6jBohdSKjLR9g@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 21:26, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
>
>
> On 3/31/2024 7:09 AM, Dmitry Baryshkov wrote:
> > On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
> >>
> >> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
> >>
> >> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/Kconfig        |   9 +
> >>   drivers/clk/qcom/Makefile       |   1 +
> >>   drivers/clk/qcom/gpucc-sm4450.c | 806 ++++++++++++++++++++++++++++++++
> >>   3 files changed, 816 insertions(+)
> >>   create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
> >>
> >
> > [skipped]
> >
> >> +static int gpu_cc_sm4450_probe(struct platform_device *pdev)
> >> +{
> >> +       struct regmap *regmap;
> >> +
> >> +       regmap = qcom_cc_map(pdev, &gpu_cc_sm4450_desc);
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >> +
> >> +       clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> >> +       clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> >> +
> >> +       /* Keep some clocks always enabled */
> >> +       qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> >> +       qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> >> +       qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> >
> > Why? At least other drivers model these three clocks properly.
> >
> These clocks are POR on in SM4450 and required to be kept always enabled
> for GPU functionality hence keep them enabled from probe only.

Please, check how this is handled on the other platforms, please.
Hint: `git grep GPU_CC_DEMET_CLK`

>
> >> +
> >> +       return qcom_cc_really_probe(pdev, &gpu_cc_sm4450_desc, regmap);
> >> +}
> >> +
> >> +static struct platform_driver gpu_cc_sm4450_driver = {
> >> +       .probe = gpu_cc_sm4450_probe,
> >> +       .driver = {
> >> +               .name = "gpucc-sm4450",
> >> +               .of_match_table = gpu_cc_sm4450_match_table,
> >> +       },
> >> +};
> >> +
> >> +module_platform_driver(gpu_cc_sm4450_driver);
> >> +
> >> +MODULE_DESCRIPTION("QTI GPUCC SM4450 Driver");
> >> +MODULE_LICENSE("GPL");
> >> --
> >> 2.25.1
> >>
> >>
> >
> >
>
> --
> Thanks, and Regards
> Ajit



-- 
With best wishes
Dmitry

