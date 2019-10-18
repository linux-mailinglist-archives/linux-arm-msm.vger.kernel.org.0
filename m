Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16171DBD7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 08:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407208AbfJRGGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 02:06:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33847 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392250AbfJRGGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 02:06:05 -0400
Received: by mail-pl1-f196.google.com with SMTP id k7so2336646pll.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AkfYmQ4O8U9nyTFe9h6GxC4H3eeJ0+Nwd0lHpM483sk=;
        b=yeLsMwtATcgUDkbIWuxXlpKdBXQt/BL/j4xWz7fVqIGu9xF7SDWWEMZe2pc8JNqzLX
         eJCtVxdAJVIpvpmrPA3AbYZp0tzr5grKIjN2DZLe5dtNcsz0E51dOwSKtfhuwUeFYqoo
         HSzmjKEp5USI7dQm7HMT+up9L9+zsqPK1EYeq66CJqlCaznPrHF8KwpLcVK3P5VFCiD7
         h585OJIM/3Tfyl05WxrbtDvfysJ4orlblNIWTh3kO1H4o1v8qZefPlMzyIw/GFkszk9G
         yjYUKIzrVlHNs00QVm7pvU46RpokVMUOA9iynKTkHJFki22hRxg0RL4Q1Pt17b9R9lbu
         YtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AkfYmQ4O8U9nyTFe9h6GxC4H3eeJ0+Nwd0lHpM483sk=;
        b=aCeFLbnKEBJvxoDXV7hv6Qn/Fl/bliNUAIpsvegc3zwNoSLEWQUsY2w6enKxj9yABd
         Drl931n5A3sHnMjOevj61O4pW7mukQWvQcfnkQwASPXG66kEkHBu6ijSIA2Cbe5TfjAO
         zggyMO6FLTxQbx+eg3xOHxcpFACxotQEsdhZDdu0kvqbbXTgup+qHdMAme92iq2sbuD/
         BvGqmeTdmmaryz2NybI0xmrCRbqekSswknXkSgWlNK/mGmIxDCMxfD9o0kTarf/aQM4a
         K9V1L0vk82XU+RC1Tekhi9Pl5nMWi/C0/NWueh5AgqkDlnKhUXRIR5NRHTjewaZ8eBkZ
         7YyQ==
X-Gm-Message-State: APjAAAUGtjZU9xtyrQNM93wJApyZTbeiJWqQCsXn/gyOHrhuTuTNQ71C
        9ZclB2K0wGzp7Pyuer2EFbycyA==
X-Google-Smtp-Source: APXvYqyIeMk/6fgcaKyyWcE1FRzggciXB8Tu1b3UIpQMT8AD6ItcKTlnNIAQezURE45XM2AFqCLWnQ==
X-Received: by 2002:a17:902:b20a:: with SMTP id t10mr8053142plr.277.1571378762778;
        Thu, 17 Oct 2019 23:06:02 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id b16sm7929986pfb.54.2019.10.17.23.06.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 23:06:02 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:36:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, sudeep.holla@arm.com,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        tdas@codeaurora.org, swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] thermal: Initialize thermal subsystem earlier
Message-ID: <20191018060600.oj2qf5tuqu5agfmb@vireshk-i7>
References: <cover.1571314830.git.amit.kucheria@linaro.org>
 <cc2aa18e2e6004ba099e69b41d0d505a4361443c.1571314830.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc2aa18e2e6004ba099e69b41d0d505a4361443c.1571314830.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-10-19, 17:57, Amit Kucheria wrote:
> Now that the thermal framework is built-in, in order to facilitate
> thermal mitigation as early as possible in the boot cycle, move the
> thermal framework initialization to core_initcall.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/thermal_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index d21b754baee2..d8251d723459 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1537,4 +1537,5 @@ static int __init thermal_init(void)
>  	mutex_destroy(&poweroff_lock);
>  	return result;
>  }
> -fs_initcall(thermal_init);
> +

remove the blank line please.

> +core_initcall(thermal_init);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
