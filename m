Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5063092D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 10:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhA3JEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 04:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbhA3E5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 23:57:08 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8C5C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 18:00:07 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id e19so7347499pfh.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jan 2021 18:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=83BGZrgiNBtf2HpHYA3huRBYyscfozlNKzPdwrXaPyM=;
        b=Tb2s6Ek8oTj0J/p1phYDamGzIXjcF/3+Xnpz5Mkz78Z+7sSZ7QHKCVWxkc/UL5N8Yw
         NK8jlUCQJojL9or/+XvI7qRKDIj6T7ArW2Q40/NKacIoQKYspHXBq2GBhXNTlotge0ma
         fLLnX8xSuTuy0lywtth7yzH6tDJPJM4M89ix0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=83BGZrgiNBtf2HpHYA3huRBYyscfozlNKzPdwrXaPyM=;
        b=Aa+2l1Yex6V82JkqPrVjBCiUdX+VLE9Axbc3fMmZ0eU6EH3XpKcovNXk+9HGR/GbXC
         YvHPzwd+mpiTDuC5R3qnqm/tp3mk+zXDlDxx+IKPHUuqO2/k2YU83vxn/y64q0b8FfYx
         CSQmoRouvnw9arzdjMJwIcIpUtyvDI69d3mOXlx7OualHAlLIyy77o3NDWZgRZQa2jY6
         VFn5ev23qNsZYBKXjUW+Qu6/EgV04ThiSUVN7eJVRJAdJcfN++a8r8xDhxzffVpZgMs1
         9WnFD39pVlnDs47lqSvSbBTj0GKXAlQidqPY2YfZqt4wJ/J3bpMERzNaoCeWurkAyuXI
         keSg==
X-Gm-Message-State: AOAM533JfonDN2ImHkwvpkWTeAKLL2xpXvjoM1IvpStFre6s+FXYMWMk
        2/Kn/T6EMIPkESv/vHgeKLxh9A==
X-Google-Smtp-Source: ABdhPJzzRHJTltKDkyuuKbIHmJ6PmrxJocGWpBLCqvqhabxzHF6lx6ptLhoy0flFHE7TzqAxPpylZg==
X-Received: by 2002:a05:6a00:148a:b029:1ae:6d20:fbb3 with SMTP id v10-20020a056a00148ab02901ae6d20fbb3mr6722703pfu.55.1611972007047;
        Fri, 29 Jan 2021 18:00:07 -0800 (PST)
Received: from benl-m5lvdt.local ([2600:1700:87d0:94f:65bd:6864:3edc:1e8f])
        by smtp.gmail.com with ESMTPSA id f13sm11033259pjj.1.2021.01.29.18.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 18:00:06 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, sean@poorly.run
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        zhengbin <zhengbin13@huawei.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Anibal Limon <anibal.limon@linaro.org>
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
 <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
From:   Benjamin Li <benl@squareup.com>
Message-ID: <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
Date:   Fri, 29 Jan 2021 18:00:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/30/20 6:55 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> On 07/10/2020 03:10, benl-kernelpatches@squareup.com wrote:
>> From: Benjamin Li <benl@squareup.com>
>>
>> Take advantage of previously-added support for persisting PLL
>> registers across DSI PHY disable/enable cycles (see 328e1a6
>> 'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
>> support persisting across the very first DSI PHY enable at
>> boot.
> 
> Interesting enough, this breaks exactly on 8016. On DB410c with latest bootloader and w/o splash screen this patch causes boot freeze. Without this patch the board would successfully boot with display routed to HDMI.

Hi Dimtry,

Thanks for your fix for the DB410c breakage ("drm/msm/dsi: do not
try reading 28nm vco rate if it's not enabled") that this patch
causes.

I re-tested my patch on top of qcom/linux for-next (3e6a8ce094759)
which now has your fix, on a DB410c with HDMI display and no splash
(which seems to be the default using the Linaro SD card image's LK),
and indeed it is fixed.

I assume you already also did the same & are okay with this going in.
Appreciate the testing!

Ben

> 
>> The bootloader may have left the PLL registers in a non-default
>> state. For example, for dsi_pll_28nm.c on 8x16/8x39, the byte
>> clock mux's power-on reset configuration is to bypass DIV1, but
>> depending on bandwidth requirements[1] the bootloader may have
>> set the DIV1 path.
>>
>> When the byte clock mux is registered with the generic clock
>> framework at probe time, the framework reads & caches the value
>> of the mux bit field (the initial clock parent). After PHY enable,
>> when clk_set_rate is called on the byte clock, the framework
>> assumes there is no need to reparent, and doesn't re-write the
>> mux bit field. But PHY enable resets PLL registers, so the mux
>> bit field actually silently reverted to the DIV1 bypass path.
>> This causes the byte clock to be off by a factor of e.g. 2 for
>> our tested WXGA panel.
>>
>> The above issue manifests as the display not working and a
>> constant stream of FIFO/LP0 contention errors.
>>
>> [1] The specific requirement for triggering the DIV1 path (and
>> thus this issue) on 28nm is a panel with pixel clock <116.7MHz
>> (one-third the minimum VCO setting). FHD/1080p (~145MHz) is fine,
>> WXGA/1280x800 (~75MHz) is not.
>>
>> Signed-off-by: Benjamin Li <benl@squareup.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> index 009f5b843dd1..139b4a5aaf86 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>> @@ -621,6 +621,22 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>>           phy->pll = NULL;
>>       }
>>   +    /*
>> +     * As explained in msm_dsi_phy_enable, resetting the DSI PHY (as done
>> +     * in dsi_mgr_phy_enable) silently changes its PLL registers to power-on
>> +     * defaults, but the generic clock framework manages and caches several
>> +     * of the PLL registers. It initializes these caches at registration
>> +     * time via register read.
>> +     *
>> +     * As a result, we need to save DSI PLL registers once at probe in order
>> +     * for the first call to msm_dsi_phy_enable to successfully bring PLL
>> +     * registers back in line with what the generic clock framework expects.
>> +     *
>> +     * Subsequent PLL restores during msm_dsi_phy_enable will always be
>> +     * paired with PLL saves in msm_dsi_phy_disable.
>> +     */
>> +    msm_dsi_pll_save_state(phy->pll);
>> +
>>       dsi_phy_disable_resource(phy);
>>         platform_set_drvdata(pdev, phy);
>>
> 
> 
