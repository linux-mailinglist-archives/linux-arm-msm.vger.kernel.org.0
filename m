Return-Path: <linux-arm-msm+bounces-28226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33894CCCA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC611F21747
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 08:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA3718FDD2;
	Fri,  9 Aug 2024 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h9MN/UHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E518DF90
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Aug 2024 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193946; cv=none; b=AsuUBDKUUB2Ap87p2Q5oXDWwZmc0XzM+TRDMcm0UqadGpXJ5wM4R+7yKwq4HBQLFuAY2b4M6BvbFtUdltvuZMTmBWcQsG+GW6QfiECB7TABrU7ksNtn3P/edoMsz/2T6FwcRicZYrkKpS41Hiv0KzQi68cZqLgilYTTFq2A8KLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193946; c=relaxed/simple;
	bh=lK2xl6KyTi2s5yaupefvwXgJ9xcHGS6tWSN3gQuPuBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD7ZnLjAPpIdsVpHYctgShpZVQLATqPaZtKxWy1jdWIrcwLYNhdh591mAgU6pMYEP37jbhVjLNUzzNwjx7AZkrgLTEUprsh0kbO0305CP5wr7koxKbp71Z6qoiuk2jBwHaSuNR305get9exDuyYLh8Cd7d+GWAgUhoHFkXleOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h9MN/UHR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a611adso2343068a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2024 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723193942; x=1723798742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y29XsGoEBrWtW+8pv1a0Cy2W/65r6eteamsegCWD7+8=;
        b=h9MN/UHRrl/jVLDrkOl+ITEZxg/jmx54qCMb75o0gC24FGpFJdapuOp2q7RbIpT1Wg
         ZsjjJZ8Eo8dJM/3ggaFhYN9VDXNI1WP4bSQqH3PZHpb5UxOZMgZmkfwjR7Ba7/RbLWuz
         b1GuSiksgZo/zYjuVc0HiCoJC1L+7G/PG4uiXxwiFnRjhopWji7HzxdAh+aGtar4CCnk
         asnReYrMvU0XJC/6idTwJVFjrei1QCDLvo1oZy1/rUNvXmyrB2utkS3FI1y0AzLti0he
         s9kvxkjUsn33KkRB39V231/hw7fdaiR+2kzhYNcTt+h3Otvfk2dfdmaUfmKf2GWXUQzu
         qU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193942; x=1723798742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y29XsGoEBrWtW+8pv1a0Cy2W/65r6eteamsegCWD7+8=;
        b=QLE35ulSN646/A0PI9he8+ujD3I1uTX0y7lgA1DmAwJlM9SYc6x1iq+jVBsxokH4Sb
         IJ9gEXg/w97Hou5XRyB8C/Pb5e9OWwIrlRzwd+QifpoRN3l3RdiGuqy4b02KC7FuFp8v
         Ld2bedKLIMApkYN3a52B4vTyQL42+4DsTdADi4VpL7MM9LmAYrj6UpIfGL7/dR6EUXRN
         ukJBoYGC2xC7cqWgX2K77CkliI7wnD/a7rCjV8uMlgjzdqrXCZ0kHVlDprW6mwF83Ab8
         wgAfLpOd4Z/Spn8a9jq4SEytwwnDoi4yVipZkaSe2LNzAO+FFV95lW1m0saUvKWyhKck
         Xblg==
X-Forwarded-Encrypted: i=1; AJvYcCWskrXcOv1zJMfb3ArLSI9jhI5zNFdlIogfwXufQt3kkshjoV+v3pTksve/TjWwP0h1gsa/XzRMs63VxjKb@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSC4RimvYf1aMcTGkaeZyVgvQxOMPotaXSJ7D/mXHeaFN7OJu
	YtJgETeLHImJb2T0HNsnBTEpeEMWP6FR/NSHp1A9MOPiytqKCfLjxoM2DO8g9sk=
X-Google-Smtp-Source: AGHT+IEm4B7KEbbYZpTWE+SXfvbTwUGi0cG0j9nLMDU4o5bCAdcyXvGo+95gVFv7Ki5MvLUURp67Fg==
X-Received: by 2002:a05:6402:4408:b0:5b8:34a9:7fd8 with SMTP id 4fb4d7f45d1cf-5bd0a643fe9mr674923a12.29.1723193942195;
        Fri, 09 Aug 2024 01:59:02 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf85fbsm1341522a12.16.2024.08.09.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:59:01 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:59:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
Message-ID: <ZrXaVLyorJEM60ID@linaro.org>
References: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>

On 24-08-09 02:22:04, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Remove the erroneus 0x100000 offset to prevent the boards from crashing
> on pin state setting, as well as for the intended state changes to take
> effect.
> 
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-x1e80100.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> index 6cd4d10e6fd6..65ed933f05ce 100644
> --- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> +++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> @@ -1805,10 +1805,10 @@ static const struct msm_pingroup x1e80100_groups[] = {
>  	[235] = PINGROUP(235, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
>  	[236] = PINGROUP(236, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
>  	[237] = PINGROUP(237, _, _, _, _, _, _, _, _, _),
> -	[238] = UFS_RESET(ufs_reset, 0x1f9000),
> -	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1f2000, 14, 6),
> -	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1f2000, 11, 3),
> -	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0x1f2000, 9, 0),
> +	[238] = UFS_RESET(ufs_reset, 0xf9000),
> +	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0xf2000, 14, 6),
> +	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xf2000, 11, 3),
> +	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0xf2000, 9, 0),
>  };
>  
>  static const struct msm_gpio_wakeirq_map x1e80100_pdc_map[] = {
> 
> ---
> base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
> change-id: 20240809-topic-h_sdc-eb6edad718cd
> 
> Best regards,
> -- 
> Konrad Dybcio <quic_kdybcio@quicinc.com>
> 

