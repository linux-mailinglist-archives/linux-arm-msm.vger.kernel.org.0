Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72EB473114E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 09:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244920AbjFOHu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 03:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245243AbjFOHte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 03:49:34 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFF7C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 00:49:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1a86cdec6so22830721fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 00:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686815369; x=1689407369;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNKCE55T6mCVWh0FRxlA50uEkLG4q1p0SmHMNDIDUZg=;
        b=toCxsgNt9AI6vRpcwhHSwe4vgnbjIV/b3WQI4G66Iv0I9yOOseXmOtv2qvqIJwIWnM
         t1Q9sjUqneFtprgj7aafn2irnSoCCB0/LEY5hgS8bvcXBIWHhnPsr6NS2udg9sx97iqe
         JqzOYSqDpdomMB5gSHxoQAFBHrar6453rbnREFIj+tLQv0y6ZOMlvIWnuGovGDgBdwyC
         msmW2SBNpk2LEta/esXY91d4/Lpe2uD+amr9dP1qaHB0UqSkMAB2eoFlR0J1GYJAh3da
         u0ISL1ggJAbpOQwT4KGZyWq++jb5noaIB/INvGgFxZee0NndlDFqnkZ7TpCYmgS6436S
         +sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686815369; x=1689407369;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QNKCE55T6mCVWh0FRxlA50uEkLG4q1p0SmHMNDIDUZg=;
        b=Ys+Qpd+BSEt0qRXkVKijhtuzfFNw89CsXedwkHHwiAOGL2fx2VEewjnyZKnIfzTbum
         6AM7Tbj9APcUEMsnsantE/N8xUzaLDoV+j7rJDjszXfGLXXHhdrnJPFPuGiNK6lWJUAt
         IPbimKOV7TSRSPaO4uYnuHZE6AEf6l44uDQOZkJNcyLOwjPasKZcxfBWxgPomHWL1Yo3
         ZQ8WKIeUP3DOLRvis1sTZZKujx64M+pRz1KLofsC/yKFp/mxnztBTbCvevJRdokkPLxW
         po6O0r8LyrjUKQv7aZUwJgKgfEcxncZ1qIcBqeETMXwh1W9QEvgMRgBXoo0FjoiHV0E3
         rWVw==
X-Gm-Message-State: AC+VfDxEsibGSWe3h28M8KZx4qqIAemDWEPEdaLEQNAgk8vZrs+FCsuj
        er4DJ/64fjM9jbN/aA8j5zZ2fw==
X-Google-Smtp-Source: ACHHUZ5ZMREpLufLNiD+ZfTU5cEP6//hr16tWKbMuH22rsMYZ59spNvayYRGJjaWbMCuckPUGDrJ2g==
X-Received: by 2002:a19:8c49:0:b0:4f6:2495:31ef with SMTP id i9-20020a198c49000000b004f6249531efmr8226145lfj.22.1686815368684;
        Thu, 15 Jun 2023 00:49:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745? ([2a01:e0a:982:cbb0:f60a:f5e3:7ae:6745])
        by smtp.gmail.com with ESMTPSA id g9-20020a7bc4c9000000b003f7f249e7dfsm19908075wmk.4.2023.06.15.00.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 00:49:28 -0700 (PDT)
Message-ID: <4f78b601-6e6e-2274-3174-87c62d7cfcd5@linaro.org>
Date:   Thu, 15 Jun 2023 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joel Selvaraj <jo@jsfamily.in>
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org>
 <ZIjayn8nVy-ejThH@gerhold.net>
 <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Organization: Linaro Developer Services
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to
 disable
In-Reply-To: <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2023 22:58, Linus Walleij wrote:
> On Tue, Jun 13, 2023 at 11:08 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> 
>> I'm still quite confused about what exactly is supposed to be in
>> (un)prepare and what in enable/disable. I've seen some related
>> discussion every now and then but it's still quite inconsistent across
>> different panel drivers... Can someone clarify this?
> 
> It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05d503
> that added the callbacks:
> 
> Author: Ajay Kumar <ajaykumar.rs@samsung.com>
> Date:   Fri Jul 18 02:13:48 2014 +0530
> 
>      drm/panel: add .prepare() and .unprepare() functions
> 
>      Panels often require an initialization sequence that consists of three
>      steps: a) powering up the panel, b) starting transmission of video data
>      and c) enabling the panel (e.g. turn on backlight). This is usually
>      necessary to avoid visual glitches at the beginning of video data
>      transmission.
> 
>      Similarly, the shutdown sequence is typically done in three steps as
>      well: a) disable the panel (e.g. turn off backlight), b) cease video
>      data transmission and c) power down the panel.
> 
>      Currently drivers can only implement .enable() and .disable() functions,
>      which is not enough to implement the above sequences. This commit adds a
>      second pair of functions, .prepare() and .unprepare() to allow more
>      fine-grained control over when the above steps are performed.
> 
>      Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>      [treding: rewrite changelog, add kerneldoc]
>      Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> My interpretation is that .enable/.disable is for enabling/disabling
> backlight and well, make things show up on the display, and that
> happens quickly.
> 
> prepare/unprepare is for everything else setting up/tearing down
> the data transmission pipeline.
> 
> In the clock subsystem the enable/disable could be called in fastpath
> and prepare/unprepare only from slowpath so e.g an IRQ handler
> can gate a simple gated clock. This semantic seems to have nothing
> to do with the display semantic. :/

It had to do, .prepare is called when the DSI link is at LP11 state
before it has switched to the VIDEO mode, and .unprepare is the
reverse when VIDEO mode has been disabled and before the DSI link
is totally disabled.

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L938

then

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L855

but Doug has started changing this starting with MSM DSI driver, leading to
current panel drivers not working anymore with the current DSI init mode
and requires setting pre_enable_prev_first for only some DSI hosts
who switched out of set_mode().

The DSI init model doesn't fit at all with the atomic bridge model and
some DSI controllers doesn't support the same features like the allwinner
DSI controller not support sending LP commands when in HS video mode
for example.

Neil

> 
> Yours,
> Linus Walleij

