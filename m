Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17AEE4F8592
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 19:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345938AbiDGRJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 13:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239814AbiDGRJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 13:09:55 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C231331341
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 10:07:54 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i27so12191437ejd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m2s4PG1XXBPY+xZ/g2KKtsmSmzO1vbLqhx1OJRbwqHk=;
        b=VFenbI8vl9C3SVgHSCx12w6Hk5Qy6qGRxJMtZkd2lfhRJFgJjv3Do/knpuu+OWtSMY
         5b2c+eLOqhqoJks1M7BXl4sXkKZN5YZgLU58Vm7j8JcNmrZlNpaJ8SjKyiX/GO4QvbYC
         sZXP/gmxVZ1n4Wq7vE1X70J6/KrrTVlQB0LFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2s4PG1XXBPY+xZ/g2KKtsmSmzO1vbLqhx1OJRbwqHk=;
        b=6j6MbA8QqpcgtQkBQi1n6sNIY0zudNwWMdpnpzXuaAAS4R3BjU9xIzrOebaZ9MfpD6
         g62b9Lel8X2hCAOKzkffGPPEAgSlTVhizO0qCdbGVxmJ8y5GUXRVLpZfQf1IAg7MuZ08
         dW410diXSnbIo3bgBcNEc5QCKaHjwfteRzY1oXbYx91GiglMvboogEP6QRsJ73b/+Q1q
         YDIIx8BCjotk4ixwRQQdJDhY2P5Gn0fBuuETvp4aIy8XqsJnjtQHQ16f/rBtFMmQzoYk
         J6Vj/JF6BADQuTvxlLNDwlCAXGgKiydvmLgKfb91qbqzNJQKZS0ocKhtvFY8nefJdzmH
         FlyQ==
X-Gm-Message-State: AOAM533pXKEXW3RSYmW1X6DcYX0Gi2LG9YqEKiYKuyOkOnINSy3IrNc7
        bXWNRGVQIH4qrZr+EF1FoDGpTtfghPmaWw==
X-Google-Smtp-Source: ABdhPJx4wXLz5fIDZumX5xToNrLZTC7H4+3RzLtD5tM+F0jqEb+GpSHovmzkIF1g2euviNlEFjisoA==
X-Received: by 2002:a17:907:2d8d:b0:6df:a06c:7c55 with SMTP id gt13-20020a1709072d8d00b006dfa06c7c55mr14469262ejc.325.1649351273094;
        Thu, 07 Apr 2022 10:07:53 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090679c300b006cf9ce53354sm7798799ejo.190.2022.04.07.10.07.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 10:07:52 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id p189so3979482wmp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 10:07:50 -0700 (PDT)
X-Received: by 2002:a05:600c:4e10:b0:38e:6a6a:c06a with SMTP id
 b16-20020a05600c4e1000b0038e6a6ac06amr13253896wmq.15.1649351270179; Thu, 07
 Apr 2022 10:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org> <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
 <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
 <CAD=FV=U5-sTDLYdkeJWLAOG-0wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com>
 <CAA8EJppgfYgQjG8A4LsR-1wmBj3Ku3eO8cKfAYhxjWXL7e3eHg@mail.gmail.com>
 <CAD=FV=V=a1CnT8fqTJR40WoS3BaDQ3xZ=HnHVHqZh=MEmVUZBA@mail.gmail.com>
 <3e5fa57f-d636-879a-b98f-77323d07c156@linaro.org> <CAD=FV=Uibu-kZyix7K4_WVc-+C8xpzTqU4WFy7O=6sukMZrX5g@mail.gmail.com>
 <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186245772DAC3E04FA8D1C0E1E69@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Apr 2022 10:07:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
Message-ID: <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 7, 2022 at 7:19 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Dmitry and Doug,
>
> > Hi,
> >
> > On Tue, Apr 5, 2022 at 10:36 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 05/04/2022 20:02, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Tue, Apr 5, 2022 at 5:54 AM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > >>> 3. For DP and eDP HPD means something a little different.
> > > >>> Essentially there are two concepts: a) is a display physically
> > > >>> connected and b) is the display powered up and ready. For DP, the
> > > >>> two are really tied together. From the kernel's point of view you
> > > >>> never "power down" a DP display and you can't detect that it's
> > > >>> physically connected until it's ready. Said another way, on you
> > > >>> tie "is a display there" to the HPD line and the moment a display
> > > >>> is there it's ready for you to do AUX transfers. For eDP, in the
> > > >>> lowest power state of a display it _won't_ assert its "HPD"
> > > >>> signal. However, it's still physically present. For eDP you simply
> > > >>> have to _assume_ it's present without any actual proof since you
> > > >>> can't get proof until you power it up. Thus for eDP, you report
> > > >>> that the display is there as soon as we're asked. We can't _talk_
> > > >>> to the display yet, though. So in get_modes() we need to be able
> > > >>> to power the display on enough to talk over the AUX channel to it.
> > > >>> As part of this, we wait for the signal named "HPD" which really means
> > "panel finished powering on" in this context.
> > > >>>
> > > >>> NOTE: for aux transfer, we don't have the _display_ pipe and
> > > >>> clocks running. We only have enough stuff running to do the AUX
> > transfer.
> > > >>> We're not clocking out pixels. We haven't fully powered on the
> > > >>> display. The AUX transfer is designed to be something that can be
> > > >>> done early _before_ you turn on the display.
> > > >>>
> > > >>>
> > > >>> OK, so basically that was a longwinded way of saying: yes, we
> > > >>> could avoid the AUX transfer in probe, but we can't wait all the
> > > >>> way to enable. We have to be able to transfer in get_modes(). If
> > > >>> you think that's helpful I think it'd be a pretty easy patch to
> > > >>> write even if it would look a tad bit awkward IMO. Let me know if
> > > >>> you want me to post it up.
> > > >>
> > > >> I think it would be a good idea. At least it will allow us to
> > > >> judge, which is the more correct way.
> > > >
> > > > I'm still happy to prototype this, but the more I think about it the
> > > > more it feels like a workaround for the Qualcomm driver. The eDP
> > > > panel driver is actually given a pointer to the AUX bus at probe
> > > > time. It's really weird to say that we can't do a transfer on it
> > > > yet... As you said, this is a little sideband bus. It should be able
> > > > to be used without all the full blown infra of the rest of the driver.
> > >
> > > Yes, I have that feeling too. However I also have a feeling that just
> > > powering up the PHY before the bus probe is ... a hack. There are no
> > > obvious stopgaps for the driver not to power it down later.
> >
> > This is why I think we need to move to Runtime PM to manage this. Basically:
> >
> > 1. When an AUX transfer happens, you grab a PM runtime reference that
> > _that_ powers up the PHY.
> >
> > 2. At the end of the AUX transfer function, you do a "put_autosuspend".
> >
> > Then it becomes not a hack, right?
> >
> >
>
> pm runtime ops needs to be implemented for both eDP and DP. This change
> take good amount of planning and code changes as it affects DP also.
>
> Because this patch series consist of basic eDP changes for SC7280 bootup,
> shall we take this pm_runtime implementation in subsequent patch series?

Dmitry is the real decision maker here, but in my opinion it would be
OK to get something landed first that worked OK and wasn't taking us
too far in the wrong direction and then we could get a follow up patch
to move to pm_runtime.
