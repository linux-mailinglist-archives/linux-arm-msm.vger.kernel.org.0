Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF089523FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 23:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbiEKVtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 17:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiEKVtR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 17:49:17 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F128FD4F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 14:49:16 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l19so4249404ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZLsSwVJ7/0eQhR94YBz6G+qqp6bNc50S/dzWaRQyt3A=;
        b=e/HPXFEeGdsK4+ymwkavgo0Icnli0KvbQIsDpaqxlHgMKfxaM8vXp8uGAWm7cQSJkB
         yjbPHrcLXQ05Z8QdZqRU37CazkYe9RecDF50OfKygf27CTw7k2hk5RpFBlZm4zy8gsvT
         fb97CMxcYuUuxpxRfKqNtXwoSWw+bZ6dadgl9Cpl0/S0SEAkwj2oF9WSXwYMBqus710w
         kbi3ybPZryDPFdveMylgdMRRpXlVZ0qfuWu1P6CszYZfcJfP7dGNwp1vubp0PVMGXATm
         lQG16YmuutkiK0AKKz1k1oWTXTJKqGvNw2dlU162591N9aTygDDr8PCJc86SYOgkN3q6
         TfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZLsSwVJ7/0eQhR94YBz6G+qqp6bNc50S/dzWaRQyt3A=;
        b=Domim5PiLjOMf5AjSj8e6xWH7k+7e5GG40UI3e5Gr/zxNx1P64KhSiKyTgC6//qnrH
         TVNJtAHLli1WjMP6UtE8drcdZox8x5ZFK7wwTVJrwY9EQBP8x9IrTi9/xkwzXoboVRWC
         Guw7kCzKgIsQyN4pti/1g/vsXRSNJO7M6qcmcUi/yyHeG6/Hmp/XwmUbXTeXPq7lFjiC
         uo7Mn/Oj5afp3ZfB143Zc7UFUv6OaW0awFqRt75HW4iSxYekUuDtRC3yNTJ29oQM67Ld
         AnOSq10T8FfJ6HvLIgx7HMgUqEJSGnRlRZRNW6zNz1GSkMLzdMP3X3hE1z6FzGRqtd+9
         2JHQ==
X-Gm-Message-State: AOAM531UzOlupGfoBimBp+TgaHfP7XVEff5cKNmsDbIKAX9FyooemPix
        wmPvZ38cE/ZpvuDQ9C7Z1BxXNw==
X-Google-Smtp-Source: ABdhPJxToHSVvEhIcaNpEobHnTNq6doJZVGBZWIPDrAWyFUqYhI8RC+bCZUrWToROZ0PSsfOoVj5Qg==
X-Received: by 2002:a2e:bb81:0:b0:250:c7c5:d4de with SMTP id y1-20020a2ebb81000000b00250c7c5d4demr10912269lje.518.1652305754419;
        Wed, 11 May 2022 14:49:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020a2e95c9000000b0024f3d1daea7sm549701ljh.47.2022.05.11.14.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 14:49:14 -0700 (PDT)
Message-ID: <15f9df0b-3228-af8f-f123-b5d10eb1bacb@linaro.org>
Date:   Thu, 12 May 2022 00:49:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
Content-Language: en-GB
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
 <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=V7RyVJKis9e3aoouQyhUppyAhVs9oN9=miKeZcV0t6_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2022 23:06, Doug Anderson wrote:
> Hi,
> 
> On Tue, Dec 7, 2021 at 2:29 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> The DSI subsystem does not fully fall into the pre-enable/enable system
>> of callbacks, since typically DSI device bridge drivers expect to be
>> able to communicate with DSI devices at the pre-enable() callback. The
>> reason is that for some DSI hosts enabling the video stream would
>> prevent other drivers from sending DSI commands. For example see the
>> panel-bridge driver, which does drm_panel_prepare() from the
>> pre_enable() callback (which would be called before our pre_enable()
>> callback, resulting in panel preparation failures as the link is not yet
>> ready).
>>
>> Therewere several attempts to solve this issue, but currently the best
>> approach is to power up the DSI link from the mode_set() callback,
>> allowing next bridge/panel to use DSI transfers in the pre_enable()
>> time. Follow this approach.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
>>   1 file changed, 31 insertions(+), 12 deletions(-)
> 
> I happened to be testing today on one of the sc7180-trogdor variants
> that has a parade-ps8640 bridge chip in it and ran into problems. A
> bisect pointed to this patch and, sure enough, reverting it fixes me
> again.
> 
> The Chromebook in question is able to power the screen on at bootup
> but things don't work so well in other cases. Specifically, if I leave
> the Chromebook idle then it will turn the screen off (but in this
> case, not enter S3). Hitting a key should wake the screen up, but it
> doesn't.
> 
> None of the error prints in dsi_mgr_bridge_power_on() are hitting when
> it fails and I even added extra error prints. It's not hitting any of
> the early returns.
> 
> I did a little bit more debugging and it appears that nothing funny is
> going on. It's just the ordering difference that matters. With the
> patch reverted, I see this and it all works:
> 
> boot:
> [    9.653801] DOUG: dsi_mgr_bridge_mode_set
> [    9.658687] DOUG: ps8640_pre_enable
> [    9.664194] DOUG: dsi_mgr_bridge_pre_enable
> 
> screen turns off:
> [   82.130038] DOUG: dsi_mgr_bridge_post_disable
> [   82.166817] DOUG: ps8640_post_disable
> 
> screen turns on:
> [   92.611846] DOUG: dsi_mgr_bridge_mode_set
> [   92.617875] DOUG: ps8640_pre_enable
> [   92.920237] DOUG: dsi_mgr_bridge_pre_enable
> 
> Without the patch reverted, I see this and it fails:
> 
> boot:
> [   10.817810] DOUG: dsi_mgr_bridge_mode_set
> [   10.822128] DOUG: dsi_mgr_bridge_power_on
> [   10.852131] DOUG: ps8640_pre_enable
> [   10.857942] DOUG: dsi_mgr_bridge_pre_enable
> 
> screen turns off:
> [   34.819953] DOUG: dsi_mgr_bridge_post_disable
> [   34.883777] DOUG: ps8640_post_disable
> 
> screen should turn on, but doesn't:
> [   46.193589] DOUG: dsi_mgr_bridge_mode_set
> [   46.197951] DOUG: dsi_mgr_bridge_power_on
> [   46.248438] DOUG: ps8640_pre_enable
> [   46.541700] DOUG: dsi_mgr_bridge_pre_enable
> 
> Unfortunately, ps8640 is a pretty big black box. The Linux kernel
> driver does almost nothing at all and the parade bridge chip has a
> bunch of magic firmware on it. Though I don't know for sure, I assume
> that this magic firmware simply can't handle the fact that the MIPI
> side is already setup / running when the bridge is powered on.
> 
> Rather than this patch, maybe you can jump on Dave Stevenson's patch
> series [1] which I believe would solve this problem in a more dynamic
> way? Would you accept a revert of ${SUBJECT} patch to fix my problem?

I'm fine with the revert, but it will depend on [1]. Otherwise other 
MIPI DSI bridges are broken (see the discussion at [2]).

> [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

[2] 
https://lore.kernel.org/all/CAPY8ntBrhYAmsraDqJGuTrSL6VjGXBAMVoN7xweV7E4qZv+v3Q@mail.gmail.com/


-- 
With best wishes
Dmitry
