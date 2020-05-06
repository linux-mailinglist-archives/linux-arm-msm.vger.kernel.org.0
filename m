Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C401C7063
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 14:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgEFMdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 08:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728230AbgEFMdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 08:33:39 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52930C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 05:33:39 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id c24so396416uap.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5LNx4Wc9blb1DcjzxZXPgf6VvynZVdtQoFzUO9GFyIU=;
        b=dnZSNxq1MOfwWV0DhZOLqcqt5nxyCmi4COsd0q26YX3TCkmySGYtXy59TFkZq8AH/K
         wcdaW1tBtUcMu3PXDx6RsBcFR00an0NohK1GPXZvgEBTZo9DI8WsJjGdCiy0nZJkrTeD
         iVAIhNIn+F0MPoweEIqgCzAc+YQMQTIrhbnx5bA9KszYoiAGlk82oi+Ta5v0zDWt8bUy
         JbWYhy+gVijpoQq67H+I8EHAfBtWefsV/ZVbIWwfhYx2nx86GyTw0/undVAg2jmcWaNt
         ISTc+UiC9QUKysGEziueI7iF5clLy6TORDdjAOz7UT5ctDkGxsLJ4zEysaV+JwWSEpOT
         UHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LNx4Wc9blb1DcjzxZXPgf6VvynZVdtQoFzUO9GFyIU=;
        b=eVrofuDbHip6bSCE2kLekyvIjLyWf/gtUptLdkANzzkKZyd1uedbkC1U9dZuELRbEQ
         a5LtZ23ugp/xdT/X1gu0uNQnRXZPiKnaTuYkiKle5KZvJfpjX72vr4ccKcDzmbawNwIp
         BsFgovmq/XVKSPJsffOaQdq8VjmmXHrGJJ3D1KARJ8aFvhdLBbZyCfJ+qPjYeKUtclwf
         OOYjfu8lAwzUu6oSniFocs0PBXPPv6Vj7WloRryYWfhBFexvUi3GzlhNPfD1Ck4KC3hN
         URwAZ6kKLaDbBZsgghM30OVigBr/CCWncVGXD6f0sVCkCfGQqwUDm2jPWmg2c/NkK6vP
         aMBA==
X-Gm-Message-State: AGi0PuaCQOGCRiTmH5UUHosutETBViNuBYcUN0AIKyZi6WjfFcl7G02W
        /J4OHe43RMVVK/tG0kzAyCuEBoFCM9T1bsdzdqDL4Q==
X-Google-Smtp-Source: APiQypI09QQY7Pn50itTbgG6lqDrpWNXbn4waFW53TrzYJUfodEl+IMQQpGvewcqt9v/JY+0wZRt8Sl+/XXSTXHRwfg=
X-Received: by 2002:ab0:624b:: with SMTP id p11mr6455651uao.94.1588768418419;
 Wed, 06 May 2020 05:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200504202243.5476-1-sibis@codeaurora.org> <20200504202243.5476-4-sibis@codeaurora.org>
In-Reply-To: <20200504202243.5476-4-sibis@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Wed, 6 May 2020 18:03:04 +0530
Message-ID: <CAHLCerNg5QoQ4RSx_ZY-ExpW1CPgCzpScqwohNijo1=2OwU-oA@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] cpufreq: blacklist SC7180 in cpufreq-dt-platdev
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Nishanth Menon <nm@ti.com>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 5, 2020 at 1:54 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add SC7180 to cpufreq-dt-platdev blacklist since the actual scaling is
> handled by the 'qcom-cpufreq-hw' driver.
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>
> v4:
>  * Updated commit message [Matthias]
>  * Picked up R-b from Matthias
>
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 6ed68bc906f8d..15410b15015f4 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -131,6 +131,7 @@ static const struct of_device_id blacklist[] __initconst = {
>         { .compatible = "qcom,apq8096", },
>         { .compatible = "qcom,msm8996", },
>         { .compatible = "qcom,qcs404", },
> +       { .compatible = "qcom,sc7180", },
>         { .compatible = "qcom,sdm845", },
>
>         { .compatible = "st,stih407", },
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
