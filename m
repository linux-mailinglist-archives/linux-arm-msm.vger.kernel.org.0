Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D84A4F9768
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbiDHN6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbiDHN6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:58:31 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719C9A995A
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:56:26 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k23so17537739ejd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/riFro2rp+YPV2RL0ntlJGrQPbAV1ror6e1xkPF4jY4=;
        b=ZrcPXCjlLr2kJMAefVdXyBTcZWLIPlH9iR7KIzIcEQRej1QTBRcAVJ0B52So659Hz8
         sQPp83HIEj6X3u0Kh2adyZBV+5MDBkMI6LcExWMQYmBZQjfNIfKbpOnOFsU6FlJjmvHA
         jef0xNy9msqv5DJ4aLWu4OAK7OMd+XLDtRzKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/riFro2rp+YPV2RL0ntlJGrQPbAV1ror6e1xkPF4jY4=;
        b=WOwoLhtwDhuhKQM5Pk3Odb7q6a36CUPbcvRkhssgZZoS2oRDb1Jx/7KXcAW+sAFHrG
         7Qe1NmBKkYD7OcX3FmJEU8uDe5vtYPjEUbgFF9qt7+rY8F5DZikAF1Q0YEd8AfYEebkN
         31807lOrm4vUkW3c+EMx9HdyTbbuabAwKAZR3zlTXiJLSemCbHq21W5q5q2SuocZhlmr
         ZRXJf9EMXUXzJIjl8+hu3ZOfPH/eHVATCSjH5mA2rmgp64qbCd5I+AqSsZslexNVWyqG
         q+5bP/kyPiS7gFTb38WxilPSd+Bdl3AuI4GqY4Tp8iWakq31cvMS69/SkfzuQIlyBr1L
         bt/A==
X-Gm-Message-State: AOAM533msW8EFAn5WTIoPVoOFdetS5PcWMRPLL+bacnNaXOXEiS1re5a
        3NVm9ipPxcNVEfe5EXZPS5umH33+I/IPGfxtWqs=
X-Google-Smtp-Source: ABdhPJzkG7eAIc2G9BGO2sHZ1e9o/9LlZruWlVWYyDZcUOQ58yvjVTSPyiI0bZm7QoISlScyB3lwkw==
X-Received: by 2002:a17:906:6a81:b0:6da:d7e5:4fa with SMTP id p1-20020a1709066a8100b006dad7e504famr18952468ejr.223.1649426184746;
        Fri, 08 Apr 2022 06:56:24 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v8-20020a50d848000000b0041cb912717asm8427487edj.91.2022.04.08.06.56.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 06:56:23 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id r13so12958052wrr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 06:56:22 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr7029583wrb.513.1649426182365; Fri, 08
 Apr 2022 06:56:22 -0700 (PDT)
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
 <CAD=FV=Wk3U7_bVdiCPp8iQ4bcCA_Botemu4pwHeRtgBa3Xk6KQ@mail.gmail.com>
 <c4f086ce-c56f-f7c9-4092-7f2432330d50@quicinc.com> <CAA8EJprdV64jOexEF-XqbkwsNDWBNRRndOAas-QqMHaL=zp9rw@mail.gmail.com>
 <CAD=FV=XdRKWFQnJx9AKYmB2p26sXmhjqxLzz+LYyCt7rg+zF6w@mail.gmail.com> <CAA8EJprvSy1PuYCXMr-TxBF1XwcAZaErSmzH2Tw5-NAovxHY7A@mail.gmail.com>
In-Reply-To: <CAA8EJprvSy1PuYCXMr-TxBF1XwcAZaErSmzH2Tw5-NAovxHY7A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Apr 2022 06:56:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XS8h8GwL11CmJou31hTbf=mS77-j1y66uY+2YuGAUpzQ@mail.gmail.com>
Message-ID: <CAD=FV=XS8h8GwL11CmJou31hTbf=mS77-j1y66uY+2YuGAUpzQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sean Paul <sean@poorly.run>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 8, 2022 at 5:13 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 8 Apr 2022 at 03:28, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Apr 7, 2022 at 4:36 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > The ps8640 driver looks 'working by coincidence'. It calls
> > > dp_aux_populate, then immediately after the function returns it checks
> > > for the panel. If panel-edp is built as a module, the probe might fail
> > > easily.
> > > The anx7625 driver has the same kind of issue. The DP AUX bus is
> > > populated from the probe() and after some additional work the panel is
> > > being checked.
> > > This design is fragile and from my quick glance it can break (or be
> > > broken) too easy. It reminds me of our drm msm 'probe' loops
> > > preventing the device to boot completely if the dsi bridge/panel could
> > > not be probed in time.
> >
> > I did spend some time thinking about this, at least for ps8640. I
> > believe that as long as the panel's probe isn't asynchronous.
>
> By panel probe (as a probe of any device) is potentially asynchronous.
> As in your example, the PWM might not be present, the regulator probe
> might have been delayed, the panel-edp might be built as a module,
> which is not present for some reason.

Well, in those cases it's not exactly asynchronous, or at least not in
the way I was thinking about. Either it will work now, or we should
try again later when more drivers have probed. The case I was worried
about was:

1. We call devm_of_dp_aux_populate_ep_devices()

2. devm_of_dp_aux_populate_ep_devices() kicks off a probe to the panel
in the background

3. devm_of_dp_aux_populate_ep_devices() returns to us without waiting
for the panel's probe to finish.

I think that's possible if the panel driver sets PROBE_PREFER_ASYNCHRONOUS.

I was less worried about the resources missing since I thought that
would be handled by the normal probe deferral case. IIRC the "infinite
loop" that we used to end up with MSM's probe was because something
about the way the MSM DRM driver worked would cause the deferral
mechanisms to retry instantly each time we deferred. I don't remember
exactly what triggered it, but I don't _think_ that's true for ps8640?


> > Basically if the panel isn't ready then ps8640 should return and we'll
> > retry later. I do remember the probe loops that we used to have with
> > msm and I don't _think_ this would trigger it.
>
> I don't have proof here. But as I wrote, this thing might break at some point.
>
> > That being said, if we need to separate out the AUX bus into a
> > sub-device like we did in sn65dsi86 we certainly could.
>
> Ideally we should separate the "bridge" subdevice, like it was done in
> sn65dsi86.
> So that the aux host probes, registers the EP device, then the bridge
> device can not be probed (and thus the drm_bridge is not created)
> until the next  bridge becomes available.

You're definitely right, that's best. I was hesitant to force the
issue during review of the ps8640 because it adds a bunch of
complexity and didn't _seem_ to be needed. Maybe it makes sense to
just code it up, though...

-Doug
