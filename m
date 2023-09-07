Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E062797E2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 23:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjIGV5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 17:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjIGV5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 17:57:39 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAB11BC5
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 14:57:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so23467011fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 14:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694123854; x=1694728654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jwvl3f1dyM/ZwqDQJcr1BuQmvzMJTBmDU+AvdLd8dGM=;
        b=PD/zk3vPF3og62kgrbVydDXG2XDIx1bE2265XmVn33CnmOLGjP2q3ehAb8WW5Kmv2t
         Q4fZJyVYXwJkFOZpY2SMCVrrbHTMfx32UJCGetZtEirRMM8UcdWinrXzPsBJRS/mz521
         J5gMCn+yGgGzXBsHPrLf7T+8ELksow4wWnDyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694123854; x=1694728654;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwvl3f1dyM/ZwqDQJcr1BuQmvzMJTBmDU+AvdLd8dGM=;
        b=nPVjbM4vqcb9/ei0icARTzxSsCR/THbEBymIvDUcxsRzHXhggrnYYKBkeCl3aPs7Wu
         oiNmM9n9TxnqYb/0Vc6vWpv2mErPbeVEXewJpIk+t5SfP1q5lXZohr0+yaodML8PWvDl
         MG2j31QRBWjDtiBGt8okYYba48+VRjU+gxbZv9i7kzwBY8S0FSbVYWiE8A/5vP2Gs+DV
         cgncm4wC2lA3IUEWThDjieib4y3nltcKxKev6vSvK9WWElMml7F+eP5kSyynEU6dPVvf
         7YoBNVciFvKXmC6i7Fj2RM3GcRaJ9k5QNOvzl+RO4c5Miy5lgrv/r+T/O2KMHNUu34nk
         amng==
X-Gm-Message-State: AOJu0YyQFolMuXcSkY6rUq/k0++TRbE7RzLYXibzFiP1fUEsFDGr/hzS
        XWNzLo1d5ouiGPWFlk4mkHS5JSOnd6iPmOatpvCy8A==
X-Google-Smtp-Source: AGHT+IGVSSijOPnlfNzQCrbEnJgfe4rGMSL8CGoZtaBOJk5rkFQD9fHQL9VYUx5D2OjlyhMtzOcbJflmFOcVz9tYUIQ=
X-Received: by 2002:ac2:5e8a:0:b0:500:9f03:9157 with SMTP id
 b10-20020ac25e8a000000b005009f039157mr433183lfq.65.1694123853885; Thu, 07 Sep
 2023 14:57:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:57:33 -0700
MIME-Version: 1.0
In-Reply-To: <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com> <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 14:57:33 -0700
Message-ID: <CAE-0n52F-fwjiwmeO9wZE_kKKpo+DDnuL-nCxX4f2rODrdTzRg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-07 14:48:54)
> On 08/09/2023 00:34, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> index 97ba41593820..1cb54f26f5aa 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
> >>                  }
> >>          }
> >>
> >> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
> >> +                                        dp_panel->downstream_ports);
> >> +       if (rc)
> >> +               return rc;
> >
> > I haven't been able to test it yet, but I think with an apple dongle
> > we'll never populate the 'downstream_ports' member if the HDMI cable is
> > not connected when this runs. That's because this function bails out
> > early before trying to read the downstream ports when there isn't a
> > sink. Perhaps we need to read it again when an hpd_irq comes in, or we
> > need to read it before bailing out from here?
>
> I don't have an Apple dongle here. But I'll run a check with first
> connecting the dongle and plugging the HDMI afterwards.
>
> However my expectation based on my previous tests is that we only get
> here when the actual display is connected.
>

We get here when HPD is high. With an apple dongle, hpd is high when
just the dongle is plugged in. That calls dp_display_process_hpd_high()
which calls dp_panel_read_sink_caps(), but that returns with an error
(-ENOTCONN) and then we wait for something to change. When the HDMI
cable is plugged in (i.e. an actual display) we get an irq_hpd. That
causes dp_irq_hpd_handle() to call dp_display_usbpd_attention_cb() which
calls dp_link_process_request() that sees 'sink_request &
DS_PORT_STATUS_CHANGED' and thus calls
dp_display_handle_port_ststus_changed() (that has a typo right?) which
hits the else condition and calls dp_display_process_hpd_high().

So yes? We will eventually call dp_panel_read_sink_caps() again, and
this time not bail out early. It's probably fine.
