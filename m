Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8B120ACEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 09:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgFZHVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 03:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgFZHVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 03:21:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE85C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:21:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j4so3956576plk.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0MD9lPb5mGlG3soWmhT7eiQxROVlHBT3okU1QJYnMCs=;
        b=Bnp/ismjOz5W7LjN2ztzC4hNLH07S4HRscuZFPzxt0kZvFL6DKJSlecZytOWa7Ha/2
         fN98FlzFjGOVCrIq4k6Jxzru+fY93TbxYZ8yo56hd4Z/hIcHdvqfTprC3Xa3tcT8P6ph
         pxw8dfLWHDTr9dRIf96Pned5ZzJmOXUYVKjdJ/p2oznlyOFEZWFmWdYhtvgql1va2np2
         L/Q53G7V5UlgVWP8YbMg5aQWiWkr+nsv86VDO5We3R2br/o6VtlvvV1gswUYma8hX6cf
         +gT066iJKfj7RWFyGAcJaBL/ZU1Hj25cPgwQySBmpUblotEVhvGXCweBBc3wAPOHXpRj
         0K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0MD9lPb5mGlG3soWmhT7eiQxROVlHBT3okU1QJYnMCs=;
        b=U6ty/H8wq+qtqxhJX6GqeN/dWbTA6Qs8NMYxahdQHR0qF8x74St+f6iDsyFaaHR7cs
         fB+QFPA43NNYwS07goOVNDaLgaZ4+87Xul+bOfXF1Tml+EkJurUkGft0HfwgERdqVWVm
         vQe1H8tyYkFl349U55Exnik4vGsCsPCiky147WRdfkFR5VgLEe5zBbFZYcpNpL/8gUVJ
         0HEKZHTnMJ/au+EcDql8kk1LKloDUYm2ikfmcxC4H67wXBTYr/EbdvGHYGIGmJdHZ4SY
         Mwl8uHUhNe8ulH0Bhe2zorUwLqPh8SnNpotRKzO97F8sb8t3LS96/EwEvRvcsdS0MbAR
         WnfQ==
X-Gm-Message-State: AOAM532LRrubNhRFfqa12vgk+ird28hFLFMG16bAjLnFqxaEn/OQbdVL
        eRW/dYleZfWncGdrhO/aRmqAyQ==
X-Google-Smtp-Source: ABdhPJw+YtkgF2HAG31eDIVfqlcxmKDYIrISalYQszei4SLLbbPh66hYKFX4xZmztMUnYEAJ9hzEiQ==
X-Received: by 2002:a17:90b:1c12:: with SMTP id oc18mr816259pjb.160.1593156103998;
        Fri, 26 Jun 2020 00:21:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cu9sm10326271pjb.28.2020.06.26.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:21:43 -0700 (PDT)
Date:   Fri, 26 Jun 2020 00:19:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 9/9] regulator: qcom_smd-regulator: Remove unused 'struct
 regulator_desc pmi8994_boost'
Message-ID: <20200626071905.GD388985@builder.lan>
References: <20200626065738.93412-1-lee.jones@linaro.org>
 <20200626065738.93412-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626065738.93412-10-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Jun 23:57 PDT 2020, Lee Jones wrote:

> This was an upstreaming error.  Remove it as it's not to be used.
> 
> Fixes the following W=1 kernel build warning:
> 
>  drivers/regulator/qcom_smd-regulator.c:477:36: warning: ‘pmi8994_boost’ defined but not used [-Wunused-const-variable=]
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
>  drivers/regulator/qcom_smd-regulator.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
> index 53a64d856926f..4c0a469d8a115 100644
> --- a/drivers/regulator/qcom_smd-regulator.c
> +++ b/drivers/regulator/qcom_smd-regulator.c
> @@ -474,15 +474,6 @@ static const struct regulator_desc pmi8994_bby = {
>  	.ops = &rpm_bob_ops,
>  };
>  
> -static const struct regulator_desc pmi8994_boost = {
> -	.linear_ranges = (struct linear_range[]) {
> -		REGULATOR_LINEAR_RANGE(4000000, 0, 30, 50000),
> -	},
> -	.n_linear_ranges = 1,
> -	.n_voltages = 31,
> -	.ops = &rpm_smps_ldo_ops,
> -};
> -
>  static const struct regulator_desc pm8998_ftsmps = {
>  	.linear_ranges = (struct linear_range[]) {
>  		REGULATOR_LINEAR_RANGE(320000, 0, 258, 4000),
> -- 
> 2.25.1
> 
