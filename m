Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B5F45624E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 19:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbhKRS3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 13:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhKRS3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 13:29:18 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77ADC06173E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 10:26:17 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id m24so5974949pls.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=28eshNjNO/qxhONwqlc26zChfwY3CikV/8tFwgmOtR0=;
        b=Oek9boK3Bv3JYZp2UyX5KMXFCE+9KCcnJIf8eIBBYosgxl8iEKPWR0ubjC3UgDvpz3
         kFQj1rIbFzgbyetJ+D2lmSEXgSQrd7G8fde1hP+1CIrq0S2X3MG/ijKRIUUUPmHIet/q
         CdWVKayeGpNOhWyRJh4z5KH6RJ+ql/OsPL6Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=28eshNjNO/qxhONwqlc26zChfwY3CikV/8tFwgmOtR0=;
        b=Lp8uFRMyCGZ6PBZwb7usQH9OzVTHkpl0ltiNwHIUCEqAs0SFi/9T+JKRpVLGWDVwUc
         ssBjfLsG+5NBBUgrwqmSO3M6Hq06g42hBGax2qv8jdTAe5f2lNBqjpERQZEjJHpU5x+7
         4wmkOhCVLsfZ7zFKKfpZmQKQCNd72WUoBiK29eGVFOAp2zLpCbiSmcSyJVXW7njeTIb7
         cwDBPibejwdi6Yxe2+C1/xCYR4nQVBCo/WGgsKjpOBYbZ6Al0R64ef6bVl9y+rDoYXLf
         0YWySW2JAA3x8r6H0i/GO/xm+dowqPe0FcN/KMFCv1ntQ2rztl7E7b2X4/ylSZV+HrL2
         BA0A==
X-Gm-Message-State: AOAM533ZT7Lq715Pa58DY91xQWKfzye/UcTO93msM22FwpcPFKECR7u2
        XUjkH39cnyIWstGXThDC9pPm/A==
X-Google-Smtp-Source: ABdhPJxvq7TUug8fknfOWltBhQxa5BXskabfCjfusbTfBkJyfkoVs+Q2jr8FjBJ+VnBXkyORpITOrA==
X-Received: by 2002:a17:90a:e005:: with SMTP id u5mr12560743pjy.17.1637259977228;
        Thu, 18 Nov 2021 10:26:17 -0800 (PST)
Received: from localhost ([2620:15c:202:201:8ceb:c68a:21af:bebe])
        by smtp.gmail.com with UTF8SMTPSA id h186sm302596pfg.59.2021.11.18.10.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:26:16 -0800 (PST)
Date:   Thu, 18 Nov 2021 10:26:16 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org
Subject: Re: [PATCH 1/2] soc: qcom: rpmhpd: Rename rpmhpd struct names
Message-ID: <YZaayLSMa8ivu40Z@google.com>
References: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 10:56:21AM +0530, Rajendra Nayak wrote:
> The rpmhpd structs were named with a SoC-name prefix, but then
> they got reused across multiple SoC families making things confusing.
> Rename all the struct names to remove SoC-name prefixes.
> No other functional change as part of this patch.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmhpd.c | 255 +++++++++++++++++++++++-----------------------
>  1 file changed, 128 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 1118345..c71481d 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -63,73 +63,102 @@ struct rpmhpd_desc {
>  
>  static DEFINE_MUTEX(rpmhpd_lock);
>  
> -/* SDM845 RPMH powerdomains */
> +/* RPMH powerdomains */
>  
> -static struct rpmhpd sdm845_ebi = {
> +static struct rpmhpd ebi = {
>  	.pd = { .name = "ebi", },
>  	.res_name = "ebi.lvl",
>  };
>  
> -static struct rpmhpd sdm845_lmx = {
> +static struct rpmhpd lmx = {
>  	.pd = { .name = "lmx", },
>  	.res_name = "lmx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_lcx = {
> +static struct rpmhpd lcx = {
>  	.pd = { .name = "lcx", },
>  	.res_name = "lcx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_gfx = {
> +static struct rpmhpd gfx = {
>  	.pd = { .name = "gfx", },
>  	.res_name = "gfx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_mss = {
> +static struct rpmhpd mss = {
>  	.pd = { .name = "mss", },
>  	.res_name = "mss.lvl",
>  };
>  
> -static struct rpmhpd sdm845_mx_ao;
> -static struct rpmhpd sdm845_mx = {
> +static struct rpmhpd mx_ao;
> +static struct rpmhpd mx = {
>  	.pd = { .name = "mx", },
> -	.peer = &sdm845_mx_ao,
> +	.peer = &mx_ao,
>  	.res_name = "mx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_mx_ao = {
> +static struct rpmhpd mx_ao = {
>  	.pd = { .name = "mx_ao", },
>  	.active_only = true,
> -	.peer = &sdm845_mx,
> +	.peer = &mx,
>  	.res_name = "mx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_cx_ao;
> -static struct rpmhpd sdm845_cx = {
> +static struct rpmhpd cx_ao;
> +static struct rpmhpd cx = {
>  	.pd = { .name = "cx", },
> -	.peer = &sdm845_cx_ao,
> -	.parent = &sdm845_mx.pd,
> +	.peer = &cx_ao,
> +	.parent = &mx.pd,
>  	.res_name = "cx.lvl",
>  };
>  
> -static struct rpmhpd sdm845_cx_ao = {
> +static struct rpmhpd cx_ao = {
>  	.pd = { .name = "cx_ao", },
>  	.active_only = true,
> -	.peer = &sdm845_cx,
> -	.parent = &sdm845_mx_ao.pd,
> +	.peer = &cx,
> +	.parent = &mx_ao.pd,
>  	.res_name = "cx.lvl",
>  };
>  
> +static struct rpmhpd mmcx_ao;
> +static struct rpmhpd mmcx = {
> +	.pd = { .name = "mmcx", },
> +	.peer = &mmcx_ao,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd mmcx_ao = {
> +	.pd = { .name = "mmcx_ao", },
> +	.active_only = true,
> +	.peer = &mmcx,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd mxc_ao;
> +static struct rpmhpd mxc = {
> +	.pd = { .name = "mxc", },
> +	.peer = &mxc_ao,
> +	.res_name = "mxc.lvl",
> +};
> +
> +static struct rpmhpd mxc_ao = {
> +	.pd = { .name = "mxc_ao", },
> +	.active_only = true,
> +	.peer = &mxc,
> +	.res_name = "mxc.lvl",
> +};
> +
> +/* SDM845 RPMH powerdomains */
>  static struct rpmhpd *sdm845_rpmhpds[] = {
> -	[SDM845_EBI] = &sdm845_ebi,
> -	[SDM845_MX] = &sdm845_mx,
> -	[SDM845_MX_AO] = &sdm845_mx_ao,
> -	[SDM845_CX] = &sdm845_cx,
> -	[SDM845_CX_AO] = &sdm845_cx_ao,
> -	[SDM845_LMX] = &sdm845_lmx,
> -	[SDM845_LCX] = &sdm845_lcx,
> -	[SDM845_GFX] = &sdm845_gfx,
> -	[SDM845_MSS] = &sdm845_mss,
> +	[SDM845_EBI] = &ebi,
> +	[SDM845_MX] = &mx,
> +	[SDM845_MX_AO] = &mx_ao,
> +	[SDM845_CX] = &cx,
> +	[SDM845_CX_AO] = &cx_ao,
> +	[SDM845_LMX] = &lmx,
> +	[SDM845_LCX] = &lcx,
> +	[SDM845_GFX] = &gfx,
> +	[SDM845_MSS] = &mss,
>  };

nit: some PD lists are ordered alphabetically, others aren't, since you are
already changing them you could use alphabetical order for all of them.

Just a nit though, the change generally looks good to me, so:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
