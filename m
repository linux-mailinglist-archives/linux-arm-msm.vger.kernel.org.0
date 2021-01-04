Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791812E912B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 08:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbhADHdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 02:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbhADHdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 02:33:33 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0842C061798
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 23:32:49 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id a188so3302672pfa.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 23:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iRXPtY20D9orDIjb5tCwjmiIuDnS2goRBPjGMkiKUgk=;
        b=pYf9Tvqk/nYS1dsljbZYs4vnYyryXc1zZ8aFgpievKkuU/vwdqhMSLPp187p4iUzvk
         x97na1Zr5IZqGb1yry5b1l7NH6i0R3i19c2LMJof78NSIQ7AWfPL3L1gxGcKVpgpzzsW
         4LeiX2fUqlrZ4Lz3w8Dvgi/c43rEQRfyiHraEypHkBhucquIxrMWVhKoMbQkiMYxph+J
         cm/G2VFuGAfBI4oP322CJDvK17BbrTSHsAmuYQ8CKg2k9eDvZbTP5bqMJUpiEY7/iJSv
         p3pG+kTNMXRK2Yb9ytNFinssZq3pA2LVDEgeVCk9ox/hswNS46iqvElLD/oJZH9VD7bG
         d23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iRXPtY20D9orDIjb5tCwjmiIuDnS2goRBPjGMkiKUgk=;
        b=DD/N7OLTmzMRjeZBgviawVhSsghAdWFl9oMrTVHV2Vp3wYia2Tqd1WDcZX7+fDYp7y
         RoD7UiOOi0OYms5gCKwKH309zXnVIoEZLd/kq6C7CpveoN3ae53AiALJWWzw7ucrHXhK
         zx8QauyLPab52+RAYSHxNUF7tdyohVO1gmgy9D7xJae84f46FTy56LXonoAE9f6cn/WI
         gcgMh20AtsIs+mTUKrIGgstyroRo3dCD+vxV7nA9zhByNGE+5nZpE2h6K1rY7QBvRF9F
         PfIR60OPm+Y4I0nGPrIZYfOZbrg5rjJcDp83B0K6kKSpcJBM+BNudi4Vu1L0W6byymeb
         oteQ==
X-Gm-Message-State: AOAM532e8TzP83M+OCnoAAtKa0A0+C6sHJWXmu9UGnDAn/wWAb69rFTs
        SCY6JcZi0w+x6IA1dxQJElatJA==
X-Google-Smtp-Source: ABdhPJxg1RuXm4l0IeX5T2nfNwUfb9eKCIJWL14v0Jtf8jWZLkym1C7f5dh7jOgWjIh5IRoQRH0klg==
X-Received: by 2002:aa7:9388:0:b029:19e:648:6480 with SMTP id t8-20020aa793880000b029019e06486480mr39127516pfe.21.1609745569526;
        Sun, 03 Jan 2021 23:32:49 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id e5sm54143912pfc.76.2021.01.03.23.32.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jan 2021 23:32:48 -0800 (PST)
Date:   Mon, 4 Jan 2021 13:02:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, krzk@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, digetx@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, ddavenport@chromium.org,
        jsanka@codeaurora.org, rnayak@codeaurora.org,
        tongtiangen@huawei.com, miaoqinglang@huawei.com,
        khsieh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, groeck@chromium.org, varar@codeaurora.org,
        mka@chromium.org, harigovi@codeaurora.org,
        rikard.falkeborn@gmail.com, natechancellor@gmail.com,
        georgi.djakov@linaro.org, akashast@codeaurora.org,
        parashar@codeaurora.org, dianders@chromium.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 18/31] drm/lima: remove unneeded
 devm_devfreq_remove_device()
Message-ID: <20210104073246.vub5fhfwfdbwxkdx@vireshk-i7>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
 <20210101165507.19486-19-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101165507.19486-19-tiny.windzz@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-01-21, 16:54, Yangtao Li wrote:
> There is no need to manually release devm related resources.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index d5937cf86504..7690c5c69f9f 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -94,11 +94,6 @@ void lima_devfreq_fini(struct lima_device *ldev)
>  		devfreq_cooling_unregister(devfreq->cooling);
>  		devfreq->cooling = NULL;
>  	}
> -
> -	if (devfreq->devfreq) {
> -		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
> -		devfreq->devfreq = NULL;
> -	}
>  }

Why is this part of this patchset ?

-- 
viresh
