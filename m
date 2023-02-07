Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B51368D367
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjBGKAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjBGKAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:00:10 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AECE392A2
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 01:59:07 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u10so7563102wmj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V8cafR5heNSgUWmDd2vLZXXkss4BeQe0FGvhOiDp+Ks=;
        b=Wg9nsLmtRkNb7qtmH3BTcAvf9hsh/NXzrh9HajBihYvZjKVrlT8iygwl7VKcPfGtSz
         hUiATbX/22LwTt3mL3Y0XFKA72EvdU9wvhX2NWtuEIW1JjSq44ZWu3abjrTjn/EHR9eV
         bK60gy6/yHErbhsWcITV5GEZa7s99Tbh2QSpT1leQ28RGX0wkkT9E0jgFwXupbwl2Scw
         MAysXHh4sf+Q6PxCdNDjxr7qFHiIO3/noknpBy7po1CMNvT9k7P87AwBfiXu62o1jXCv
         LdhX21Fr1Na5zis9IUAHMpRgpF/FV4yTLauQHzU2aJDQ3sYt82tiUD+iuz3PvD/aOuL9
         KwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8cafR5heNSgUWmDd2vLZXXkss4BeQe0FGvhOiDp+Ks=;
        b=pQV1ixDa1+pv73qag3rzr+Id+IrMqi2JrqeYY0O3NDbuAZHRsfsLenc577h2LxnZQY
         TEBisXQvUbJP0+i/DzfigNSHZJOf1j75JUd30nP2RsP8h4vbsUYwMdhir+yl479rT8KK
         7RPS9fbJy03ItUkvB/HRL6FTlY00PkW/4NRgYvc9q77wWT3IDN++0n7Vwn+SHjVsnrSd
         noGpWZa7ZqvMAP+cbkcLI235ZwITi5sorphao+ZO2v4zYFvJN4IQp5BW2Uy7yG1WPzdO
         ExfMMyGyt1ZHXcmWMgCDXomrIthFw0PmDGKTAEGLeDHcKeDkMZhGXHYioOS13XSeYyMF
         CITg==
X-Gm-Message-State: AO0yUKWJYBJyKWpKeY9Y7gfU8zQCYsP6BsS22/1vYILHzaviZz/pAMlN
        xfnxvzvPC3siHNh4AYIRbM085g==
X-Google-Smtp-Source: AK7set+Vkzb2ncsHO4W72nnLnadejmihXcegTjCA60uAkgwinOlVGFJnnk6RDfzbo5U9f9Nzr4EG8Q==
X-Received: by 2002:a05:600c:43c4:b0:3dd:1b76:347f with SMTP id f4-20020a05600c43c400b003dd1b76347fmr2504804wmn.18.1675763946130;
        Tue, 07 Feb 2023 01:59:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3? ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5002000000b002c3be6ae0b1sm10802739wrt.65.2023.02.07.01.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:59:05 -0800 (PST)
Message-ID: <4bf0e5a2-23b6-1964-b30f-a5cb57f35e68@linaro.org>
Date:   Tue, 7 Feb 2023 10:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
 <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
 <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAMuHMdUbgvT5i4XiJxgKSiRSmFFXO_mMEbgHBgcJDwUPxEYRRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Geert,

On 07/02/2023 10:40, Geert Uytterhoeven wrote:
> Hi Dmitry,
> 
> On Tue, Jan 10, 2023 at 5:37 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On 10/01/2023 08:57, Laurentiu Palcu wrote:
>>> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>>>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>>>> It looks like there are some issues with this patchset... :/ I just
>>>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>>>> detection already enabled" warning is back for i.MX DCSS.
>>>>
>>>> Could you please provide a backtrace?
>>>
>>> Sure, see below:
>>
>> I wondered, why didn't I see this on msm, my main target nowadays. The
>> msm driver is calling msm_kms_helper_poll_init() after initializing
>> fbdev, so all previous kms_helper_poll_enable() calls return early.
>>
>> I think I have the fix ready. Let me test it locally before posting.
> 
> Is this fix available?
> Do you have a lore link?

The fix at [1] has been applied on 2023-01-26

[1] https://lore.kernel.org/all/20230124104548.3234554-1-dmitry.baryshkov@linaro.org/

> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

