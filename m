Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C0764D261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 23:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiLNW3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 17:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbiLNW3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 17:29:40 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D65DB5A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 14:29:38 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id d20so24742725edn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 14:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
        b=QS+/BUVNsbN6h+tQwIBW7N0LXW4/Jg584fdK+n867YoxGH2EVT3pvpOv0U+9ZxfOF/
         rC+A8JiiEJr2R7MGbILNYNFTad0rr0C8KD/sy/c1V8PbqBkKH32/xb29IPq+heVzZkXp
         klpRQ11wYfFmdLXqkEepJLbDXUndJHe8njFAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bSdi2nTZFfN0KO3twl810Uns3X1CbpenS2xYlJiGPM=;
        b=oCIuFH01dYURHpVWTHWkEiQgxGXeabc9KTOcp5/65K+ykNLpburgOxrHyjpe9m9RKe
         L/ihyw0RQsfTYriqj43JTSg8L3ND4iTgrEV1Q3CQDSqdieZTQZTm8KlxlRIqcU3Hsg0T
         YCF7V1VA9+GYCBFAWjDZq/3sxB22abQm3WYLhd7Sq36a4efIfBjmhdvR1AH37cPeE6eI
         I+d4aLTlBwuDIqAGGeQAe0IM5grVTQJPakbzeew30bRdjKg2bMpnf9kXyL1xzfYAfqBS
         M/4lArAYVw8OFEWZIJq0ERMZV6P4nlilFL4KaaoBSRZHMqHxYRZkIinfLOhVaEmxKOH7
         ZAbQ==
X-Gm-Message-State: ANoB5pmbPgbGO1OS+Evp06FL4vfO8PA5rRITHQ/O+4MQK1G2kDZLaQJf
        WZQx/egYzGTWGQWcneETGaKHaZktJUmtqzY4s8o=
X-Google-Smtp-Source: AA0mqf6+dtM+l3srjsQDtww4TQW5EpB1ot2V04JNN2Le2MK+FbtfjmwMh2kXZ0bQNFX1ZMWBp4APyw==
X-Received: by 2002:a05:6402:655:b0:46a:8e28:5541 with SMTP id u21-20020a056402065500b0046a8e285541mr20854157edx.42.1671056976803;
        Wed, 14 Dec 2022 14:29:36 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7db0b000000b004702caff4f6sm2586878eds.73.2022.12.14.14.29.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 14:29:35 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so554313wmh.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 14:29:35 -0800 (PST)
X-Received: by 2002:a05:600c:2d91:b0:3d0:69f4:d3d0 with SMTP id
 i17-20020a05600c2d9100b003d069f4d3d0mr191822wmg.93.1671056974914; Wed, 14 Dec
 2022 14:29:34 -0800 (PST)
MIME-Version: 1.0
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Dec 2022 14:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
Message-ID: <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq
 is not for aux transfer
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There are 3 possible interrupt sources are handled by DP controller,
> HPDstatus, Controller state changes and Aux read/write transaction.
> At every irq, DP controller have to check isr status of every interrupt
> sources and service the interrupt if its isr status bits shows interrupts
> are pending. There is potential race condition may happen at current aux
> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> even irq is not for aux read or write transaction. This may cause aux read
> transaction return premature if host aux data read is in the middle of
> waiting for sink to complete transferring data to host while irq happen.
> This will cause host's receiving buffer contains unexpected data. This
> patch fixes this problem by checking aux isr and return immediately at
> aux isr handler if there are no any isr status bits set.
>
> Follows are the signature at kernel logs when problem happen,
> EDID has corrupt header
> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93..8f8b12a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>
>         isr = dp_catalog_aux_get_irq(aux->catalog);
>
> +       /*
> +        * if this irq is not for aux transfer,
> +        * then return immediately
> +        */

Why do you need 4 lines for a comment that fits on one line?

> +       if (!isr)
> +               return;

I can confirm that this works for me. I could reproduce the EDID
problems in the past and I can't after this patch. ...so I could give
a:

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm not an expert on this part of the code, so feel free to ignore my
other comments if everyone else thinks this patch is fine as-is, but
to me something here feels a little fragile. It feels a little weird
that we'll "complete" for _any_ interrupt that comes through now
rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
to specifically identify interrupts that caused the end of the
transfer. I guess that idea is that every possible interrupt we get
causes the end of the transfer?

-Doug
