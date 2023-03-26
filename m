Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743E86C9860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 00:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjCZWCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 18:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjCZWCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 18:02:41 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E334C59FB
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:02:39 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id z83so8241628ybb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679868159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GIc/+PDO2htV2jMp3KoF29hKZ12iZrid4FdCljLl48k=;
        b=afaLl3Ha4GhPKcKshef+64lLZtACUvVS/1jAuXiJO7hdtSCrNjJ83E8oq5/9midSG1
         1fZuC5nCf/LPJoMTg1uQtioaulMia4KDC7k1qRAwPHNsW7ehCS+UcuEC+VTTrVfJTJ0A
         gA+/YGB2UnIjcaAMzIm7zjFqilwua3AeEOWAiZPEgU1k3I3+7xfpqxiF+a7YV5fNSqXE
         0jVitL1jMy/PkvR+OtowmcyL9F4gw4vNVBuOnI7LpDXbCIKwKeYtTFemF0YihbK5JwFm
         V7s87ESYtCcbmaadxyYcysQmkVdQBI/iPK6Qj+KeCaASiGYQMb5CANXTHbXwHLhEK1q3
         kvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679868159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIc/+PDO2htV2jMp3KoF29hKZ12iZrid4FdCljLl48k=;
        b=MpD385+jEJec9wtRIk+tzsLla1xMMNmARF8/lh89ACvG7uqicYCso1ED/bqlPubQNt
         m2hPI/aIsqwGa41YcSUQyVwv59an2T8QqEXRGSJDKAglbrONp68YEVwE348omavI2k3R
         Y+aB5a+adwxi/PY+nKGOfML4MbEUO+/7kHqIh3mZiHOthICCbpq6+O4ZueMe3WpPV1vi
         cFSDkZWS7GLsoruKGsG/ZUDskCnQjVsAFpBph4dd4wg/fR6lbg8r/hO0zbg4eXEaKR94
         DZ0e+ZvtiFOIY7cB1CrbrO4cjH4mhZ+5SuwuuxjWW5Zex5h6bEbcRxSlP4xoSCXOHug4
         t1eg==
X-Gm-Message-State: AAQBX9ffJwsf7trlsw5VrznDBtDDCp17p5LqUXeiWSq1ViUuDzMpE/ja
        KmuSMli/mjVSEG/vEbkHVMz/eZNyQz2Eo/wj9/wYXA==
X-Google-Smtp-Source: AKy350Z2Qzm+5ANjsAThGZFty6IX7daVX2aW0EYjjTkzMa2fQoYReQIT8/fAf0fwdMIK93UKhsOoGxAujOSwHFJvSEg=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr6141431ybu.9.1679868159111; Sun, 26 Mar
 2023 15:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com> <20230326162723.3lo6pnsfdwzsvbhj@ripper>
In-Reply-To: <20230326162723.3lo6pnsfdwzsvbhj@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Mar 2023 01:02:28 +0300
Message-ID: <CAA8EJpp+gX+6zniMioBfXC95VF2qVTPidQB36zyrohhrGerK8g@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR support
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Mar 2023 at 19:24, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Mar 02, 2023 at 10:03:17PM +0530, Vinod Polimera wrote:
> > For the PSR to kick in, self_refresh_aware has to be set.
> > Initialize it based on the PSR support for the eDP interface.
> >
>
> When I boot my sc8280xp devices (CRD and X13s) to console with this
> patch included I get a login prompt, and then there are no more screen
> updates.
>
> Switching virtual terminal (ctrl+alt+fN) causes the screen to redraw.
>
> Blindly login in and launching Wayland works and from then on screen
> updates works as expected.
>
> Switching from Wayland to another virtual terminal causes the problem to
> re-appear, no updates after the initial refresh, switching back go the
> Wayland-terminal crashed the machine.
>
>
>
> Reverting this single patch resolves both the issue with the console
> updating as exected and flipping between the virtual terminal with
> Wayland and the others no longer crashes my machine.

I hope Vinod Polimera can assist in solving the issue. In the worst
case we will have to revert this commit, shortcutting the PSR until it
is properly debugged.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_drm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 029e08c..785d766 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -117,6 +117,8 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> >       if (WARN_ON(!conn_state))
> >               return -ENODEV;
> >
> > +     conn_state->self_refresh_aware = dp->psr_supported;
> > +
> >       if (!conn_state->crtc || !crtc_state)
> >               return 0;
> >
> > --
> > 2.7.4
> >



-- 
With best wishes
Dmitry
