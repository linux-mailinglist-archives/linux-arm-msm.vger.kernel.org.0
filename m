Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5A8F4F1EDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 00:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344762AbiDDVyP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Apr 2022 17:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386732AbiDDVjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Apr 2022 17:39:17 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED9A38BF5
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Apr 2022 14:30:33 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id h196so8806593qke.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Apr 2022 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IxUdjcC4It/JwdPOTj9qf8Z2Z9qsMxlLajpUd7Bfk/o=;
        b=POnOfkKB5D3FdXZ3FUx89riusD8I3RIEffDsh+KNc9BBUacT82hSW46tJsWf5CUr4Z
         9tCpUVA2vzJ6RNSV/hyhPsGW4fXWyimM+aqGrXtvHqFWENOgXa0eSohh92R0UixG7UKr
         1bjSfBJUFUZn1kS8Ji0hY0DtdpXo4oXUVxihn5JotQ+VNqNImvdCWoCrPC97P5Sn1i66
         EM927H4AOz07RCNVWrzp6LqIsP/DQjPaOUctdkXuIL4EbpcA1zIiGPByFm/qCWWMZg3F
         ImgWoGm+3GVLuS8Nr1Bt8asoBnKLtm3VyUMwZrECsO5hKNb4WDBZrLmIQDDHYNzG+3fS
         VnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IxUdjcC4It/JwdPOTj9qf8Z2Z9qsMxlLajpUd7Bfk/o=;
        b=LgmoUF5F01QRnNLL+A4/gF7m29AC+lUZAsNNbpdnMqSSjaqaBNCJ4hzGxMI98oiSvT
         DEKnpcs8rbZ5m91mcXNNQNZCc1cArYtcw1slJZrlIKVfr5MpLEHE5Uail/vgOFP/isPv
         7yFfd8RV/WjVmpf0FdIlKj1UDiV1pZ47A0w0BjwgrMxep8knkwmsETfDbP7hhNmBlksK
         r+0NAQg2F75Ac9uR9V6TKce845sGCH9d3rHG8V44LEB+SB8mH86Ifx0FgXX4L0LnK461
         s/ty85oNnomd5GATVHQD/6yIQPqgpP6jyP/SmLmQhdKJeJMRbsqf2sm0gjAwMyx9NoGD
         1WTA==
X-Gm-Message-State: AOAM5311pGb6/QLcbKZ3QmsOeAPBblLN5C+7uGBeo85i4iTH9X4u5H7a
        cQGKf8L1dV2OkTmzA7a5vr5jYTUAQqo4qhtVPrgzTw==
X-Google-Smtp-Source: ABdhPJyyRMlOkHW8q1Mhm5p13Qfm1ifyp2XYVK5SyJAhakAFTtHNbQGpzkKzG2wqiZ5LZOfnuNwc68wkA3oO+hVOi0A=
X-Received: by 2002:a05:620a:2453:b0:67d:9539:495c with SMTP id
 h19-20020a05620a245300b0067d9539495cmr215335qkn.30.1649107782604; Mon, 04 Apr
 2022 14:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
 <MW4PR02MB71867220A90FCFED295830D0E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
 <CAD=FV=VK0D_GzYBv+u+o6-ks-UAsw97__0mWsSn9OycX72LJFg@mail.gmail.com> <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71865B8E17F3D194B05013EDE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 5 Apr 2022 00:29:31 +0300
Message-ID: <CAA8EJpqFh7c9ohDbR_0kG5t106-djE7TYfaoAbiT-W4-294jTw@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid differently from dp
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 4 Apr 2022 at 21:21, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> > On Wed, Mar 30, 2022 at 11:02 PM Sankeerth Billakanti (QUIC)
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > > On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
> > > > <quic_sbillaka@quicinc.com> wrote:
> > > > >
> > > > > The panel-edp driver modes needs to be validated differently from
> > > > > DP because the link capabilities are not available for EDP by that time.
> > > > >
> > > > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > >
> > > > This should not be necessary after
> > > >
> > https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
> > > > Could you please check?
> > > >
> > >
> > > The check for DP_MAX_PIXEL_CLK_KHZ is not necessary anymore but we
> > > need to return early for eDP because unlike DP, eDP context will not
> > > have the information about the number of lanes and link clock.
> > >
> > > So, I will modify the patch to return after the DP_MAX_PIXEL_CLK_KHZ
> > check if is_eDP is set.
> >
> > I haven't walked through all the relevant code but something you said above
> > sounds strange. You say that for eDP we don't have info about the number
> > of lanes? We _should_.
> >
> > It's certainly possible to have a panel that supports _either_ 1 or 2 lanes but
> > then only physically connect 1 lane to it. ...or you could have a panel that
> > supports 2 or 4 lanes and you only connect 1 lane.
> > See, for instance, ti_sn_bridge_parse_lanes. There we assume 4 lanes but if
> > a "data-lanes" property is present then we can use that to know that fewer
> > lanes are physically connected.
> >
> > It's also possible to connect more lanes to a panel than it supports.
> > You could connect 2 lanes to it but then it only supports 1. This case needs to
> > be handled as well...
> >
>
> I was referring to the checks we do for DP in dp_bridge_mode_valid. We check if the
> Link bandwidth can support the pixel bandwidth. For an external DP connection, the
> Initial DPCD/EDID read after cable connection will return the sink capabilities like link
> rate, lane count and bpp information that are used to we filter out the unsupported
> modes from the list of modes from EDID.
>
> For eDP case, the dp driver performs the first dpcd read during bridge_enable. The
> dp_bridge_mode_valid function is executed before bridge_enable and hence does
> not have the full link or the sink capabilities information like external DP connection,
> by then.

It sounds to me like we should emulate the HPD event for eDP to be
handled earlier than the get_modes()/prepare() calls are attempted.
However this might open another can of worms.

> So, we need to proceed with the reported mode for eDP.

Well... Even if during the first call to get_modes() the DPCD is not
read, during subsequent calls the driver has necessary information, so
it can proceed with all the checks, can't it?

-- 
With best wishes
Dmitry
