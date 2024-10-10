Return-Path: <linux-arm-msm+bounces-33858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCC9986D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50FE52870D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B551CB331;
	Thu, 10 Oct 2024 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yH1xqL5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A71CB317
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564968; cv=none; b=AsPJt2EnuIuSIDiOFyEaS36LNZaRiUUUJ4eaU2rBOAqj+gBaiJYJLAMiu74try2FrtzekHhcS8HcSh1sLpKJV37frsTkNb9Umux8q8fucdndpY1Hosin/Hpokuwrns5z3ze85C5an80zjon5qZmtFyVOOzQq/xklsAM6Biij3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564968; c=relaxed/simple;
	bh=tOHp6AWjbTv4yI6UVldQljr7MbFCmo+VO/FEqnev4UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FunFgi55/uw0RGAK9+GY3Gs2YdTRfYrffhUh5QA5gMoQGYjRiRdDnKKRWC2KEa07Y6gMIQ3Ln0AXPYcQ4UJ6onq8sKXGVS8yKFonN/ieZXQluzLQgum9nXtoqMVArn/UG5oNXqcOQPID1Jnehxs+UOPr/+VRQZ6xJjdkogw/7yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yH1xqL5r; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facaa16826so8117511fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564964; x=1729169764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNnUCyPTi+G8LZCplzDQqmQsNRTnEL4ih2dYIBtqKZc=;
        b=yH1xqL5rxnPIgaJqM/g3sgRVZ0LaPfNjTcxgx/j0ECRgU0bjbLGRiXwDOD4iT8GOyb
         uSTwRs/JtW+V+aLN2p1YKSTIh0mWlfu9Hi3vbaA497frPC0518fi4LscmYRfKwSpFFiR
         X4cmrbrAFZKOrVZL5UfaWYVKdWUAwtXVFNsxmwW1hd3SbnuVpoXbkhCEud1UFSGpNxoz
         IDi3p13fC1BqSmASSyI4nf2BnMcq8ynxktPw1MnXz2z6+S5Lo/6SFTfPgXgyy+hOcN7g
         hPykDLuhu4koeHCeTFnCKKT+S6BS/V2klokan7SRrsYaH2j1SO9ghB0gT+Io0Omxr+8J
         53sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564964; x=1729169764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNnUCyPTi+G8LZCplzDQqmQsNRTnEL4ih2dYIBtqKZc=;
        b=nDB+uJA5BreMBBqt4vlQzV3EIbI1gDQA205z5E/9hy3gmyFagMPUZAVAuWpKoxWqx8
         fkKGj0UUNrkuLvkbvA+Tj9/QNS/g9HNQ1cNjyuZfdi5LE2WX+uFo8LTz2G5NIMcWZXq0
         AulIjHuZ2AexDp06Z/C3sRdeSmGTqkgcUIdLUW+G5UQckbu0gVVE4jUMT2IsM9IcfGLl
         3h2gqCDX/1zp5GOCOPE5Hk8jKYujcNkll+B3ybzYB6B6CZ1ES+R6rFypMcn5oBrLQXKM
         bjIGLDs0S6DS5kg8GfAjqFc6cLR3RUFBNkePl+FyZk1NMSNl25IyQHIf1mF0oTFn6Wv6
         N2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVOnDBQ0Pb0P1ynjMzn2nOtXz4eMQN7o/S9SncRw4sVM3LmNhxhbvZGvCQLmy8LTf3U5N8zzaJmOgN4IkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAUJZMfqwcX0juGUy/pGOl1J2jNaNnQEo/Tq2AGyasQiXV2DoG
	KJWBlVev4kNHDO5VR+IakVA/PuQ1R2aCVXaLfX/yK0b6MTQsaji5m28Jb7wKdUM=
X-Google-Smtp-Source: AGHT+IE3OVGS1otAXhVnWrTDRmy9pILODy/3R4ocjn+v7nJ3EHEAHwBirvcqYOXxLoGkanEri2+Jaw==
X-Received: by 2002:a05:651c:505:b0:2fa:c519:6e66 with SMTP id 38308e7fff4ca-2fb187d1e4dmr33465261fa.40.1728564963861;
        Thu, 10 Oct 2024 05:56:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245b16cbsm1902981fa.62.2024.10.10.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:56:02 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:56:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, quic_tengfan@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
Message-ID: <yh5qzohy42r226a4e7yupimfdl6xccpntuffot7dnhrftagtae@4ruw5vmcknfq>
References: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
 <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>

On Wed, Oct 09, 2024 at 03:13:34PM GMT, Jingyi Wang wrote:
> Add support for QCS8300 TLMM configuration and control via the
> pinctrl framework.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    7 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1246 ++++++++++++++++++++++++++++++++
>  3 files changed, 1254 insertions(+)
> 

[...]

> +	[125] = PINGROUP(125, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
> +	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[133] = UFS_RESET(ufs_reset, 0x92000),
> +	[134] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x89000, 15, 0),
> +	[135] = SDC_QDSD_PINGROUP(sdc1_clk, 0x89000, 13, 6),
> +	[136] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x89000, 11, 3),
> +	[137] = SDC_QDSD_PINGROUP(sdc1_data, 0x89000, 9, 0),
> +};
> +

[...]

> +
> +static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
> +	.pins = qcs8300_pins,
> +	.npins = ARRAY_SIZE(qcs8300_pins),
> +	.functions = qcs8300_functions,
> +	.nfunctions = ARRAY_SIZE(qcs8300_functions),
> +	.groups = qcs8300_groups,
> +	.ngroups = ARRAY_SIZE(qcs8300_groups),
> +	.ngpios = 134,

I believe this should be 133.

> +	.wakeirq_map = qcs8300_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
> +	.egpio_func = 11,
> +};
> +

-- 
With best wishes
Dmitry

