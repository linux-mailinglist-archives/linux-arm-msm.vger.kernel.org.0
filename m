Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082B85E031
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 10:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfGCIub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 04:50:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37533 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfGCIub (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 04:50:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so909257pfa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2019 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p7Mwi+H6HZIn3w7nyOMbXeZ9EymSOeovkKyUhkxyEYU=;
        b=ndWouWyT9VteUojTYfkNpzV/u5gtKQXODryjvDKT6HTffruCiKrqt6NAvfH/0+pOCb
         Bdg7dNQ03xUoGzy7iIz+ZBNDEh/Kx0l5OSpGAg8OCaWlXmRHjH2rrR6m9Zg5MIah7vVJ
         PS3OVqn2u9uUNC66jAm3wVVEVwSmfJ+EPRXmLqnEhocIpzVLwA0xFuN1Zlc/jtlF9Chd
         QLyflkrFf5ORh3Oe+NCRsf/QFL4iXTaBYGf9zTKAMjD8O5wCGW8o+yJ3+GWq2j6Sx39z
         RkVApV9Kr6tkTQTwrHYS/gPdqtZlsWC5Sl2euJi51vz9iuBDmkN47uDi0sg7X1bKdOud
         rKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p7Mwi+H6HZIn3w7nyOMbXeZ9EymSOeovkKyUhkxyEYU=;
        b=UJwnXvlQILjaEKFW6UTPTaQCyK1gzBDU3ezplAjtCgjz2H3N804s1fymbES1WgqHUq
         4SUkmLZkUfINGHDlf6J9844oakGdGyHw4KTy/F7PnmYkeK1kX66OB7AGdDSD80VIc24Q
         SDBDGaqaD8GPo5v9vKnqQ0RQ8raZKTCP2QPStzT0Oc13Z4u1M+ea2uUGhDxJxCKxwrkS
         Y/mis3+tU6Ey2JhPUYNyGbUHXW/EdMGYBz38lWPzHUEY+QtErPelZVaWoOZY262kgY9Z
         1oX16OJ6GGVkQosnI10WR7SWlb/ENLi4fahZbLqrUfg5tXOoLEmVaBhgihmAwVLmqaCt
         aogA==
X-Gm-Message-State: APjAAAXLGvVVYZMf4SNb60NSst3ddj++UrEhms2OJAXSFztW8bCo2qPx
        8ABdQPP/xinT12NBQ6Fvq/oyoA==
X-Google-Smtp-Source: APXvYqwYw863+ZtXrlxlXbcbTj6csoTEgcmVyvsmlZ80hBDLYlJ/AwMgdsKvnrUhj272v5BwPP/rwg==
X-Received: by 2002:a65:4087:: with SMTP id t7mr12236199pgp.10.1562143830510;
        Wed, 03 Jul 2019 01:50:30 -0700 (PDT)
Received: from localhost ([122.172.21.205])
        by smtp.gmail.com with ESMTPSA id i7sm1434195pjk.24.2019.07.03.01.50.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:50:29 -0700 (PDT)
Date:   Wed, 3 Jul 2019 14:20:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     vireshk@kernel.org, sboyd@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] opp: Manage empty OPP tables with clk handle
Message-ID: <20190703085026.xe3hwxqah76b7np3@vireshk-i7>
References: <20190702043643.1746-1-rnayak@codeaurora.org>
 <20190702043643.1746-2-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702043643.1746-2-rnayak@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-07-19, 10:06, Rajendra Nayak wrote:
> With OPP core now supporting DVFS for IO devices, we have instances of
> IO devices (same IP block) with require an OPP on some platforms/SoCs

                             which

> while just needing to scale the clock on some others.

Blank line here.

> In order to avoid conditional code in every driver, (to check for 

                                                    remove ,

> availability of OPPs and then deciding to do either dev_pm_opp_set_rate()
> or clk_set_rate()) add support to manage empty OPP tables with a clk handle.

Blank line here.

> This makes dev_pm_opp_set_rate() equivalent of a clk_set_rate() for devices
> with just a clk and no OPPs specified.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/opp/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index ae033bb1e5b7..fa7d4d6d37b3 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -801,6 +801,11 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
>  		goto put_opp_table;
>  	}
>  

Explain the rationale behind this code here in a comment.

> +	if (!_get_opp_count(opp_table)) {
> +		ret = _generic_set_opp_clk_only(dev, clk, freq);
> +		goto put_opp_table;
> +	}
> +
>  	temp_freq = old_freq;
>  	old_opp = _find_freq_ceil(opp_table, &temp_freq);
>  	if (IS_ERR(old_opp)) {

Also, rebase over the OPP branch please:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

or pm/linux-next

-- 
viresh
