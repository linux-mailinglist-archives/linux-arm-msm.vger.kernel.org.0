Return-Path: <linux-arm-msm+bounces-26325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1609325DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76284282E65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17627198A29;
	Tue, 16 Jul 2024 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eX8KDIqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD4198857
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721130015; cv=none; b=Z6lcKmXZqYOzmSOtw5UNGffRqn6+plaqZ4hVEMbjzQtErv+fnsNXpnI5c7DHNbNLQOK2bceSwQxzEmiLyp45jGXDSctwxiOVdXHveOEH1x4KLUFanGYKBGaUACVmi29xDAUFd+6QmWIYFabuOhV7rmTGkHC0auuaD4KXN9gVodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721130015; c=relaxed/simple;
	bh=IBZgoReNaHXUcuRQgPtMcqDYue6zAjXJSkCXCFB1OjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZsqS5+AiulcunxltGEfNsdLz3OiP+vRPIm9pASwJj+OZMGpYP2iYdBO7/zQGTPwh+mNY9942j8mNFPZR0ds2H/T1LSq/IZqCARSiSgt5V183hSfGHqHeJvMeADyvKsGh+d9aKJyGS/qs/Wia4aONHnsaZlVQnHBstpDDLnt6Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX8KDIqH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52eafec1e84so7449874e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721130010; x=1721734810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6xEuYpVtXnG3aS4nIpX/q6zWD8h3Xaat6dOgx90q54=;
        b=eX8KDIqHUP/R8H4lrknqTj1ZtSavQp2d1vh0+kxnvCjZvmn73f3EyuNN2xsCjNk7XB
         ZO2Amp3S12ytkAJU3tUp/lxGhYnEeI5lOA0+BgMNunZ6mecPav7Be2njn1n/aTRLjpFZ
         rGXmqHIcRD8BQWcPZfwmZE4upmeIS7TYanF5CA+wRUCho9VYS1EArfQ6sQOoEsrEHqJl
         x25TtMl5EwLtw9bsk3oX+Qp4m8RlR7GQzRVON7CalObHiBvgYfKvIDY5Pxp+jZ5dQgtF
         yfwcify5xMZH0cnpFAP+9PqPg0Y8PnrL1iPOjDucyTVGcM7F7CLbgQDhaH2Do/RNbfOQ
         zA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721130010; x=1721734810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6xEuYpVtXnG3aS4nIpX/q6zWD8h3Xaat6dOgx90q54=;
        b=XlYe18wIweqo6uR63AYLnt/e2KhVmMYY8WWJvKvzRszG9VFq9OIx/R9WG3K9bQVEtj
         ov99bTfMWu/vMhXSDp0XJzhtYKz3ctLgk2rvX1JQWCAbXM+e6i02nKvX/qIFx40Yngtm
         Ue8dYqSOc3c92efMtjOwAdGoHG1z2g7/D+wlXp2S0Lg9nYqzxxPZHGGsPpaFyllVXUOx
         DiPp9VUKEo0Bb2gKlX+kEOVJkoUHFkkPfeovNEbuXm2cjn8++wMLs8eRFNFQGPP1glUT
         /0eXsmKtW974gU7Ct7xdfTTeJrhwwH18PD0h8YOqVprWnpTUMR8OMww05fOxvCsvXH81
         +1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV0F5DoJ9SBaxZZj+gU3NIYtDXnmqYb1U95vHLo76ZaVHccMs1KKrbK+HelOLs6s5IBzTFn0pf+b7nNuyJVBanYqFdGezc8BXMz82QfQA==
X-Gm-Message-State: AOJu0YxJ7O969lNyD/3SQus2Nez6lXMKb2Wv21cwqwSHGSa/eAumdXHk
	PTINM1MlTeFIx44HGXdcZnVf8UdDLUrtoK+sVDNzS7I9lAKeTWXBd08RBQ2Vl2M=
X-Google-Smtp-Source: AGHT+IGNeELJAWlQzNylXKeMqsQ5zbqL+PcjSDrqgMkM2cimJQ9/3Fz7a/4zQML6t+WKg3RknFfDcA==
X-Received: by 2002:a05:6512:131a:b0:52c:e184:3dd6 with SMTP id 2adb3069b0e04-52edeecea1cmr1398248e87.0.1721130010100;
        Tue, 16 Jul 2024 04:40:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2531fbdsm1140499e87.195.2024.07.16.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 04:40:09 -0700 (PDT)
Date: Tue, 16 Jul 2024 14:40:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8650: Park RCG's clk source
 at XO during disable
Message-ID: <xzyphnxzkul77qrnxvxayzvschlwkhzun5jwom4pxeqsoxzbpj@k4o5cnitwc7z>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-1-5bfd56c899da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716-topic-sm8650-upstream-fix-dispcc-v3-1-5bfd56c899da@linaro.org>

On Tue, Jul 16, 2024 at 11:05:21AM GMT, Neil Armstrong wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> It also changes dptx1_aux_clk_src to use the correct ops instead of
> clk_dp_ops.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index c9d2751f5cb8..80fe25afccf7 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_ops,

Should this also be clk_rcg2_shared_ops ?

>  	},
>  };
>  
> @@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> @@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

