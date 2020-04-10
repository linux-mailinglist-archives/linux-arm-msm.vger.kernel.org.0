Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D631A3DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 03:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDJB3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 21:29:12 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34841 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgDJB3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 21:29:11 -0400
Received: by mail-pf1-f196.google.com with SMTP id a13so411492pfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2020 18:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nN8xwvqZ4ahN4tlReVAi/RVQy676gCX473FCAHCL3fg=;
        b=UBP9+WYQjNxRjKr+51/Qa6T9+gHFoX0+gwGNYylPV15IvRDx7YYOcGu72q8lRcX4/w
         xDO0AL5qEJ0F4u12luB9Dgw+Pqjy+GZ4j2nH82BvrQWCf2zxOGvIwrpDOOVnVhHFiF35
         YUhufF6/ix5n/gDXtC1mUIoY3W8AsD1E6isd90H0G/UhCy0zN/ywbRCrn1WVMOdO2N06
         GNIwK3pF8yr1Sru7lb63vBbRaArbOV+hJUeXYhEhjjvEBvsfBt/wIpuz9Ar5s78ASgzy
         mijTJv5KdZSIJJqrNX1Z9YS6uAnp79zjei+j04oM+fTQx2rlZWO9l/HZ0pEwHVrv7Hjl
         wLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nN8xwvqZ4ahN4tlReVAi/RVQy676gCX473FCAHCL3fg=;
        b=uj79v96pbVAf0MEbJh6HnHNMj5UX4VgCMXE7zQXPvlNTaoUWkRB9k4OQuEJXzltfat
         R6jMSgEtOyj5LatfcyqkjkmpahIvLgZ91B2mhe1caAwkztFYc8CGFD30VbgovC79sDDu
         Oo+atEldifLEuPGJfzIFTpw4XDNKyGhWExAZH1lwyT+rHUkPo0oke9XKFPQkwPiwCScI
         JmLs2J0d1j0FdFd5cd1TuExpHD6LViQ/hHhE2inpFBD5nMQo1OyYwMQ8PU8KsOpudQZ6
         Ezs8tqs8bgmspuBKpQBo0ApBQawMbB8oHlmrDWO7XaG9aRbuhmkAe8y8JQM0XtsJ3SOc
         0dYg==
X-Gm-Message-State: AGi0PuYm2is6WaznBll+8uTdpahoZR7q084S8Y+kCmAplM5VVZgxg6P5
        cl0CJ3MGZaJ6fmSUdazY8tLjSQ==
X-Google-Smtp-Source: APiQypL3buBWpQzlgFFQmY0P9M+5wVLAzIqpm2p8VIUbBN27OoqhVsPZTiuNQoUe8y6dFl1x74NTEg==
X-Received: by 2002:a63:e749:: with SMTP id j9mr2140127pgk.319.1586482150941;
        Thu, 09 Apr 2020 18:29:10 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e187sm329384pfe.143.2020.04.09.18.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 18:29:10 -0700 (PDT)
Date:   Thu, 9 Apr 2020 18:29:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_rpm: remove defined but not used
 'pm8921_ftsmps'
Message-ID: <20200410012919.GW20625@builder.lan>
References: <20200409114026.38383-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200409114026.38383-1-yanaijie@huawei.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Apr 04:40 PDT 2020, Jason Yan wrote:

> Fix the following gcc warning:
> 
> drivers/regulator/qcom_rpm-regulator.c:607:34: warning: ‘pm8921_ftsmps’
> defined but not used [-Wunused-const-variable=]
>  static const struct qcom_rpm_reg pm8921_ftsmps = {
>                                   ^~~~~~~~~~~~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom_rpm-regulator.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
> index 7fc97f23fcf4..1ee8ec686ed3 100644
> --- a/drivers/regulator/qcom_rpm-regulator.c
> +++ b/drivers/regulator/qcom_rpm-regulator.c
> @@ -604,16 +604,6 @@ static const struct qcom_rpm_reg pm8921_smps = {
>  	.supports_force_mode_bypass = false,
>  };
>  
> -static const struct qcom_rpm_reg pm8921_ftsmps = {
> -	.desc.linear_ranges = ftsmps_ranges,
> -	.desc.n_linear_ranges = ARRAY_SIZE(ftsmps_ranges),
> -	.desc.n_voltages = 101,
> -	.desc.ops = &uV_ops,
> -	.parts = &rpm8960_smps_parts,
> -	.supports_force_mode_auto = true,
> -	.supports_force_mode_bypass = false,
> -};
> -
>  static const struct qcom_rpm_reg pm8921_ncp = {
>  	.desc.linear_ranges = ncp_ranges,
>  	.desc.n_linear_ranges = ARRAY_SIZE(ncp_ranges),
> -- 
> 2.17.2
> 
