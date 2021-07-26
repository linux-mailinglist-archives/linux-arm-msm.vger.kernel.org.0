Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A59D3D525C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 06:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhGZDn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jul 2021 23:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhGZDn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jul 2021 23:43:57 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885B2C061757
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jul 2021 21:24:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so17888143pja.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jul 2021 21:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=78PJxn/L/No3mfXtKzF9xhDAGmfzmXdV4fCFIzVMd9s=;
        b=tqsyhbkrTWMeQGkonawVFcZt6NSFfrnDG6N5Tf++zKo3L9t0EeN8mo6y4vHgxqOXQT
         95JvJZ8vVgEehltZmXqq0VslqAZcAdh66WmmY4jw/DtjkwcCFGvqXa/soPaSbGzB2w/J
         /SkMzFSgG4jnw67x2mXjIcWIwuJAwDdj0mKqchVFVLl6bYeavQtFn6jrogGVm4cVc8RB
         lwUnjTenjaFfqJRM8S7gshbiXa+WeGMSUnC6EpkY3FH+vdqdmqAqNoweDcBq+U0wospm
         ld43Ftm4zAOIzsAfOQRdtE9eq+69il6xIkX34AYphY6kzlQn/sDXYjoTpU8e36FXHg8e
         KBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=78PJxn/L/No3mfXtKzF9xhDAGmfzmXdV4fCFIzVMd9s=;
        b=kKRA1UjddFCZgvyONiP2ma677eqTB4cIiH27TQHg7dxhRUlscufyjJht1lmU66sHrc
         o6nCGDE2anKjlGROLFAfFUUJJjTud63tgy9EsA1M3wu6/gCaJ1TVSIhtmaSvJaFeivUY
         nKwaRbYyHnrXyt/IAgOWb4EenSFnM/CrfM1un26M/mU90d1ijAH0hqLdi8MC+sddSILy
         jqW2G0heqCFHDEEou5+Jx1yHs/8rX6kdihZneyKIWEJ/4paZDjUs9Z5rzvJ0j+OeVB8J
         yIwiiTvHievCD85XlsugWqzL0Hy55O/kfXvIYJgL3RptPh1r7KyMZUcrmIW+ublhmYFv
         NGmQ==
X-Gm-Message-State: AOAM531crTBWFsaY0yIyrTujCiiuksimhiwPp5dR5gyzSnUH45In4rEY
        DmQhE1d6/l18j10bbnJ0Q4Lg3g==
X-Google-Smtp-Source: ABdhPJyG6IGj4mrsCVLKPobTp1wpDXQChxmvXE++0EtMdAbNN9tYtV933i2cNjnOqhkGLd1zLcjGdw==
X-Received: by 2002:a05:6a00:cc1:b029:32b:8465:9b59 with SMTP id b1-20020a056a000cc1b029032b84659b59mr16076877pfv.66.1627273465000;
        Sun, 25 Jul 2021 21:24:25 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id s5sm11668787pfk.114.2021.07.25.21.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 21:24:23 -0700 (PDT)
Date:   Mon, 26 Jul 2021 09:54:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: blacklist Qualcomm sc8180x in cpufreq-dt-platdev
Message-ID: <20210726042421.ak3eau7lhx6pfeg4@vireshk-i7>
References: <20210725030214.3942250-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725030214.3942250-1-bjorn.andersson@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-07-21, 20:02, Bjorn Andersson wrote:
> The Qualcomm SC8180x platform uses the qcom-cpufreq-hw driver, so
> it in the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)

Applied. Thanks.

-- 
viresh
