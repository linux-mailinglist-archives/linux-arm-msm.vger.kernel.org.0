Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0373850ECAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 01:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238324AbiDYXgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 19:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbiDYXgc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 19:36:32 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C407306F
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 16:33:19 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-e93ff05b23so4634572fac.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 16:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=BiCOs3gLjiOAwIAp7AJ5OD2/e7XtuGh1MBbAIwEj15Y=;
        b=ElQR9Sw+Qymka0nPJNuX3Ny1rn1qkPev18zhEBP8/icaIdsOysIXljPV0n1CgptDSI
         nWIZ7eP8UkiqrEigL4mnVaAexS/QUdDmCBYuJmMgVvXNIvCPeVssFHcBI5Gicsxlmivw
         rpqvoKBkmlJOXC3MWMVdAvfz5hTjk8zYYe894=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=BiCOs3gLjiOAwIAp7AJ5OD2/e7XtuGh1MBbAIwEj15Y=;
        b=cGyeeUTPULEqJuaBE4jmEmYK6YKXJVTlefWmklMjHOeOt7Cud9Ru8q7wasu/3/2Ilr
         xPJGHo8aKVXNFY5WwPTDpET9TxDTwpxBCspuFKahBaQF/kW79CxndDvJIyrWHqk2KnGp
         sUPoBEsWEiP9O+elJ2fyXF05EEdOurC6F6oAjTCxZIn1QVNfu81+ogAZRP4quEmMyvtg
         QNqsFrxyfciYMy/Qf39QacY+4tJs72/jY8q3BgZz8wk/YIaXbf1sFCgxjMdoQJJhPOhu
         bGawZHmJCjOmh2sk9dtY8xlTKa54/WrWCJnw7+x4CIgUbCYrjjHaWEpvsnOjEqDKS+Aa
         j/6Q==
X-Gm-Message-State: AOAM530FvF40APtswE/ASP385TBdr65KvUI6mIw9BJ8FJBkwgCLd8aa+
        raEurhXB8xJ1O4ug6ofgeMAu8K8hIIWBEhF3BhR7jg==
X-Google-Smtp-Source: ABdhPJz5QRpij1OTJrd33jJo87JwgGliBZdqGnwSv/niXH4/HLbIjRN2bAyX14+q9jLXEZDhimpHybXic6SohyGT/Q4=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr6599533oad.193.1650929598871; Mon, 25
 Apr 2022 16:33:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 16:33:18 -0700
MIME-Version: 1.0
In-Reply-To: <07f1e701-f921-b06a-7492-63810a937322@quicinc.com>
References: <1649970223-9522-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51rp73v6tod98TX3Y_q8TuOppJVdm9Te_9kSNyqyFuoog@mail.gmail.com> <07f1e701-f921-b06a-7492-63810a937322@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 16:33:18 -0700
Message-ID: <CAE-0n53=PCDWh--tYOrpEFJG1sVh7V_G5+d0dEhenXsbKFyWxA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: tear down main link at unplug handle immediately
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-25 15:29:30)
>
> On 4/20/2022 3:38 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-04-14 14:03:43)
> >
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm=
/dp/dp_display.c
> >> index 01453db..f5bd8f5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -615,24 +598,21 @@ static int dp_hpd_unplug_handle(struct dp_displa=
y_private *dp, u32 data)
> >>                  if (dp->link->sink_count =3D=3D 0) {
> >>                          dp_display_host_phy_exit(dp);
> >>                  }
> >> +               dp_display_notify_disconnect(&dp->pdev->dev);
> >>                  mutex_unlock(&dp->event_mutex);
> >>                  return 0;
> >> -       }
> >> -
> >> -       if (state =3D=3D ST_DISCONNECT_PENDING) {
> >> +       } else if (state =3D=3D ST_DISCONNECT_PENDING) {
> >>                  mutex_unlock(&dp->event_mutex);
> >>                  return 0;
> >> -       }
> >> -
> >> -       if (state =3D=3D ST_CONNECT_PENDING) {
> >> -               /* wait until CONNECTED */
> >> -               dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 1); /* delay =
=3D 1 */
> >> +       } else if (state =3D=3D ST_CONNECT_PENDING) {
> > I take it that ST_CONNECT_PENDING is sort of like "userspace hasn't
> > handled the uevent yet and modeset hasn't been called but the link is
> > setup and now we want to tear it down". The state name may want to be
> > changed to something else.
> yes, how about change to=C2=A0 ST_MAINLINK_READY?

Sure.

> >> @@ -1529,8 +1480,11 @@ int msm_dp_display_enable(struct msm_dp *dp, st=
ruct drm_encoder *encoder)
> >>
> >>          mutex_lock(&dp_display->event_mutex);
> >>
> >> -       /* stop sentinel checking */
> >> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
> >> +       state =3D dp_display->hpd_state;
> >> +       if (state !=3D ST_DISPLAY_OFF && state !=3D ST_CONNECT_PENDING=
) {
> > Is this to guard against userspace doing an atomic commit when the
> > display isn't connected? Is that even possible?
>
> No, it used to guard follow scenario in timing order,
>
> 1) plugin had been handled and mainlink is ready,
>
> 2)=C2=A0 userspace hasn't handled the uevent yet and modeset hasn't been =
called
>
> 3) unplugged happen, mainlink be teared down
>
> 4) user space start to response to uevent=C2=A0 and try to enable display=
.
> (it too late since mainlink had been teared down)
>

Ok. Thanks for clarifying.
