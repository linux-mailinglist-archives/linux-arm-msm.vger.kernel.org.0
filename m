Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55003E890B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 05:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhHKD6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 23:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhHKD6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 23:58:14 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD1AC0613D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 20:57:51 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id w14so1321897pjh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 20:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VZDnzigX3SjnNXSD0ePWkP9LgJSp4fG8kgmss+VG9ns=;
        b=L+R0++YNmnfCTMKhjKqOcKL4r/U7m81vQz3IrrH9KLDy//XrRshbenoNZmZvx+VIlg
         Mq8Qc1IS2nkv1owuCTwuT/xVfJPoRLA9MwiztzGevawbNsG1jIpq1dWtcDKZEA6nFakz
         6jW0uebiyXkhFAsTrvf8b28PT/Jm8ziY8l5R1B3utIIDLeuPh0i7j5b6WfYy1UU5wn2m
         AV6QkLUi3fj0zsNyzUivEkcm0Yp5HUaCv1pluWDmaAcHjoAPdT3MzdvrvLTgKh69M+GY
         5PXaWt5ahBrp/AkNB6otUyLPKOr2S9C60dve5Nwty8fLYrClkI8I/nytnDHs+c6xXBNR
         d86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VZDnzigX3SjnNXSD0ePWkP9LgJSp4fG8kgmss+VG9ns=;
        b=CaDv9AxzVMUhsThJfmL1VflN/GSYO6E76nZVAY8kpqXDcYY8GNraOWNKrR4iU0eXmw
         zx43GXbrl90BadGD6nHltWkAQNpN6jUtPxkNI44AO2Q34a+hq+0AVz+DKZa6iAKCoElh
         3bZxeAu0es8Z3lXifU2OQBtJIuF4wGkr9keReTf6YDeY9HdbhoVyuD9ce7Zdk6LtDugL
         juuKFF57vaGt+J/BjsueHZeaSNWWYCkCWX8y+g7QEOQeBlirBhbJIzed3MuXu3t7mOH3
         8xcmjcQJEBFwn1VvNc/YMSkCszp/rN9lF2UHw1Gnc/PYTWOcD3CO3p+2c28vbY+f6QVW
         bm9A==
X-Gm-Message-State: AOAM533URN3127EaErSEIcmG0Yj/sZphROqzsXqPoLtMMCM0n8yuz00w
        GG+yRozj+7UZcKriZBmGTLZfdQ==
X-Google-Smtp-Source: ABdhPJx/pJbsP0m97XQVCkEHJBz1/qpfTU3xLCXt7Z7OMeaFjN14Huy9YQ+gFbHc8StZrL0P+eTQrA==
X-Received: by 2002:a17:90a:d702:: with SMTP id y2mr13633559pju.127.1628654270782;
        Tue, 10 Aug 2021 20:57:50 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id fv2sm4492265pjb.53.2021.08.10.20.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 20:57:50 -0700 (PDT)
Date:   Wed, 11 Aug 2021 09:27:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v1] cpufreq: qcom-hw: Set dvfs_possible_from_any_cpu
 cpufreq driver flag
Message-ID: <20210811035745.j6jbufrd2pdrnqdp@vireshk-i7>
References: <1628645918-12890-1-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628645918-12890-1-git-send-email-tdas@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-21, 07:08, Taniya Das wrote:
> As remote cpufreq updates are supported on QCOM platforms, set
> dvfs_possible_from_any_cpu cpufreq driver flag.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index f86859b..20455aa 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -161,6 +161,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
>  		return ret;
>  	} else {
>  		policy->fast_switch_possible = true;
> +		policy->dvfs_possible_from_any_cpu = true;
>  		icc_scaling_enabled = false;
>  	}

Why don't you set it always ?

> 
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.

-- 
viresh
