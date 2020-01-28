Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31EE14C1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 21:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgA1UpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 15:45:24 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34023 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgA1UpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 15:45:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so328775plt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 12:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q5Xif2KZlxqItit3sw6ycecM4cOFBN2t+5fxteCDrK8=;
        b=lvsLAulhE7xtj+a4t9yoxvpe/kvn+YMj8o6UOLOucYmc3eJzopzxqhlatisRJT0HQ8
         87JojLTO6qVJvhgZ8mFygTHptKMCk8Gzt7+FHu72+pmkldWZM8IccdP2PjN1R681lVVX
         +x9FghhVKCTgIuxKgK9GMpQV4p7rZ8mazCWQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q5Xif2KZlxqItit3sw6ycecM4cOFBN2t+5fxteCDrK8=;
        b=XJsZsaV+umVa/0Ot56XxBNeNSXsIKM3TXfscg5IlgZMVfZkWpXToNeilNkf+0HhlOH
         wCv0D/TVfjv6Y4V0/kz+tTCZaesYsfIM7xGjxYx2Ps1ir33RobfmahOxn/QQ2Kg2JCUP
         Rkw/BPyzl9f8rDUDPPXskn0pSaEwD3tzZYHYFaWNl5MG1hCGDXbAr0NNqvGOMY7SmOTf
         djvj6SfnkYvIQIa2v9KaFbJFVzjnxFaG07PON+e2XNeM9lH5Q60OO6ssCEq9GtEDBOY3
         O8N1LH3hSbctcYGaoej3A6mpkf0OO3FPD3Re/Leu7EL9lSQEyapPjZEhwZIkUFwYsIuT
         arkQ==
X-Gm-Message-State: APjAAAV/Yb7XVKMJKzzHPYiPckEj8JK3NH9ZKGnpsRTbqkP58Re0gXGc
        M8op79O/n8K8zR5XQC54Zn3NYw==
X-Google-Smtp-Source: APXvYqwUTBN9TmhGuD1UiwT6ZcOmPkm1axw7mAwi6JPAz2IO8gca1uGK48ZbZszQ8uLcqbmvsakqBQ==
X-Received: by 2002:a17:90a:ba98:: with SMTP id t24mr6937143pjr.12.1580244324192;
        Tue, 28 Jan 2020 12:45:24 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 72sm17034196pfw.7.2020.01.28.12.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 12:45:23 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:45:22 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        ulf.hansson@linaro.org
Subject: Re: [RFC v3 03/10] cpufreq: blacklist SC7180 in cpufreq-dt-platdev
Message-ID: <20200128204522.GG46072@google.com>
References: <20200127200350.24465-1-sibis@codeaurora.org>
 <20200127200350.24465-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200127200350.24465-4-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 01:33:43AM +0530, Sibi Sankar wrote:
> Add SC7180 to cpufreq-dt-platdev blacklist.

nit: you could mention that cpufreq is handled by the
'qcom-cpufreq-hw' driver.

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 5492cf3c9dc18..580abc777d9d8 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -130,6 +130,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "qcom,apq8096", },
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,qcs404", },
> +	{ .compatible = "qcom,sc7180", },
>  	{ .compatible = "qcom,sdm845", },
>  
>  	{ .compatible = "st,stih407", },

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
