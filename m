Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 477356747D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 01:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjATAHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 19:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjATAHd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 19:07:33 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3909346082
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 16:07:31 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hw16so9962767ejc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 16:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2V8Ln6e8tegMHSBR/J0K1l0Tuvgg5sXARNbUfWI/C08=;
        b=GaQqhxxDs2Yu9TEHYHaW7FaEC5qe3eqdZRboUv1cZObr8UKmpxXD8WDx1MuCfpM1Oi
         ZTgaKuAIwehs6ElVZnISD0lbgkwrjgP00OZm+aMLCHOeMX2yWo71LLQsA3XSLoJ1H3Lg
         Nl9H7LVKRJTqrrmefk4OPeU2PyHuKn31+yjWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V8Ln6e8tegMHSBR/J0K1l0Tuvgg5sXARNbUfWI/C08=;
        b=sUl1Asa7pxRnx7hKv6MEfI2McDsD7MBGnbTpxLM8lgjkN6YIGeyhXEf97A4HjBouPC
         Ij7JNSaxCJ2azazlph7j0PMfM9TEfdeKKBfy7nVlLWOk4/w+wJjU0kJgLVLZRvhjSP8U
         4H9nJxShtVif2Jqeixf+a7NkUUVGKQflwnp51l6TAGOc/pza3cIVpFJ5+aBKBMfsey4C
         ChJhW8qnndqJiAWmSP7yQmbRdzDNmlNaC5l4dxftM5xQfI57kfvsO+4oEJnfkdgLKoQu
         79dwE3qOorPXAhxR6t05TvO4X/+wXmjFcwbtaTye/OsBTppClauMV39MRXIWyu4gagRf
         018g==
X-Gm-Message-State: AFqh2kq6cfY5PUkWOJqsYnj+G+ySI+mPXv+oCqbW8DKEtM9I7Eb7FnEw
        L4fXoa7pyIC5FqT0OQQFdiYf674poZ3fyIk2iCE=
X-Google-Smtp-Source: AMrXdXtn1APen6YwPsLDL1fRTS21zYCc4f73OBpZn2AJEA+K1LhV1oSJ9QemAXAz9zR7SjDPmP/eGw==
X-Received: by 2002:a17:906:5414:b0:861:b4c5:63ba with SMTP id q20-20020a170906541400b00861b4c563bamr11484465ejo.41.1674173249601;
        Thu, 19 Jan 2023 16:07:29 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00877696c015asm2221437ejb.134.2023.01.19.16.07.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 16:07:28 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id l8so2852874wms.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 16:07:27 -0800 (PST)
X-Received: by 2002:a05:600c:180f:b0:3db:d4b:f019 with SMTP id
 n15-20020a05600c180f00b003db0d4bf019mr461234wmp.170.1674173247519; Thu, 19
 Jan 2023 16:07:27 -0800 (PST)
MIME-Version: 1.0
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
 <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=VeBBFTZBjZNhMUBO1uTNKBwcgZM6ehnw3BGmervE7jXA@mail.gmail.com> <CAE-0n50JB211OhA7pqj6U3rfBeeS0ofzY_moE77REmY2awo7bA@mail.gmail.com>
In-Reply-To: <CAE-0n50JB211OhA7pqj6U3rfBeeS0ofzY_moE77REmY2awo7bA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 19 Jan 2023 16:07:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W92EO9+XnRCuBCAePQmH8+CgGQf5ETEtHcRFDkNGhJ0A@mail.gmail.com>
Message-ID: <CAD=FV=W92EO9+XnRCuBCAePQmH8+CgGQf5ETEtHcRFDkNGhJ0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, daniel@ffwll.ch,
        airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
        andersson@kernel.org, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jan 18, 2023 at 2:34 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2023-01-18 10:29:59)
> > Hi,
> >
> > On Tue, Dec 27, 2022 at 6:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > > +
> > >         if (isr & DP_INTR_AUX_ERROR) {
> > >                 aux->aux_error_num = DP_AUX_ERR_PHY;
> > >                 dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> > > +               ret = IRQ_HANDLED;
> > >         }
> >
> > The end result of the above is a weird mix of "if" and "else if" for
> > no apparent reason. All except one of them just updates the exact same
> > variable so doing more than one is mostly useless. If you made it
> > consistently with "else" then the whole thing could be much easier,
> > like this (untested):
>
> Totally agreed. I even asked that when I posted the RFC[1]!
>
> "Can we also simplify the aux handlers to be a big pile of
> if-else-if conditions that don't overwrite the 'aux_error_num'? That
> would simplify the patch below."
>
> > > @@ -425,17 +464,15 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> > >
> > >         /* no interrupts pending, return immediately */
> > >         if (!isr)
> > > -               return;
> > > +               return IRQ_NONE;
> > >
> > >         if (!aux->cmd_busy)
> > > -               return;
> > > +               return IRQ_NONE;
> > >
> > >         if (aux->native)
> > > -               dp_aux_native_handler(aux, isr);
> > > +               return dp_aux_native_handler(aux, isr);
> > >         else
> > > -               dp_aux_i2c_handler(aux, isr);
> > > -
> > > -       complete(&aux->comp);
> > > +               return dp_aux_i2c_handler(aux, isr);
> >
> > Personally, I wouldn't have done it this way. I guess that means I
> > disagree with Stephen. I'm not dead-set against this way and it's fine
> > if you want to continue with it. If I were doing it, though, then I
> > would always return IRQ_HANDLED IF dp_catalog_aux_get_irq() returned
> > anything non-zero. Why? Officially if dp_catalog_aux_get_irq() returns
> > something non-zero then you know for sure that there was an interrupt
> > for this device and officially you have "handled" it by acking it,
> > since dp_catalog_aux_get_irq() acks all the bits that it returns. That
> > means that even if dp_aux_native_handler() or dp_aux_i2c_handler()
> > didn't do anything with the interrupt you at least know that it was
> > for us (so if the IRQ is shared we properly report back to the IRQ
> > subsystem) and that it won't keep firing over and over (because we
> > acked it).
>
> I'm primarily concerned with irq storms taking down the system. Can that
> happen here? If not, then returning IRQ_NONE is not really useful. The
> overall IRQ for DP looks to be level, because the driver requests the
> IRQ that way. The aux interrupt status bits look to be edge style
> interrupts though, because the driver acks them in the handler. I guess
> that means the edges come in and latch into the interrupt status
> register so the driver has to ack all of them to drop the IRQ level for
> the overall DP interrupt? If the driver only acked the bits it looked at
> instead of all interrupt bits in the register, then the level would
> never go down for the IRQ if an unhandled interrupt bit was present like
> 'DP_INTR_PLL_UNLOCKED'. That would mean we would hit spurious IRQ
> handling very quickly if that interrupt bit was ever seen.
>
> But the driver is acking all interrupts, so probably trying to work
> IRQ_NONE into this code is not very useful? The only thing it would
> catch is DP_INTR_PLL_UNLOCKED being set over and over again, which seems
> unlikely. Of course, why is this driver unmasking interrupt bits it
> doesn't care about? That may be leading to useless interrupt handling in
> this driver if some interrupt bit is unmasked but never looked at. Can
> that be fixed in another patch?
>
> >
> > NOTE: I still like having the complete() call in
> > dp_aux_native_handler() and dp_aux_i2c_handler() and, to me, that part
> > of this patch is worthwhile. That makes it more obvious that the code
> > is truly expecting that complete to be called for all error cases as
> > well as transfer finished.
> >
>
> I think it may be required. We don't want to allow DP_INTR_PLL_UNLOCKED
> to complete() the transfer.

OK, I've tried to code up what I think is the right solution. I'd
appreciate review and testing.

https://lore.kernel.org/r/20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid

-Doug
