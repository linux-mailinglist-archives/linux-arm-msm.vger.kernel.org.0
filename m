Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00DE48E0CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiAMXNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbiAMXNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:13:09 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C287BC06161C
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 15:13:08 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id s9so9935869oib.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jan 2022 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sMMqNSDsbwa7yFsyX3bGhmbn1MJoJMBHF2qgWzw9Mzs=;
        b=e9TkMcxTOSS/64wt9ZC2xTerMvvL1hENNYRBuClFXx/siDYX5i1oCQiJADqjzsbrgy
         wVjkMUSfXf3YjWKS9PkxJuOKDKB2J9fObDPBExgWBjIHo442CJ3EVE6gtGn5FtgvA6iU
         bkn2frXC6bFNDtrmo8PI5yibl+vD/9QwcQ1zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sMMqNSDsbwa7yFsyX3bGhmbn1MJoJMBHF2qgWzw9Mzs=;
        b=5FlCuRwUcWNE8ZFnu84xN0k3Xg1owTLN9KhXJpHujXRmgqe+lHTAOi2k9sC2KOTbJf
         2MO9xdVSlp1q/q9/KB98tIwDzfQYQSj/0XYk2ZGr/fR2rRrUbCwZrkzmp0FpKVMRf/n4
         E6pPSp1QvqX+84nXAL3zUQbrZmd22LuuL8PSPvHq93EYndV9kNd127nAcopgZzEnNPrj
         NiW/kcbwn5zydtcfKvz0qvnlmTQxwJx/wa1rxn1z20C3rF8mZuxN/i3o1Z/ATp2JN7wd
         QGYiWbkximJqsmXpSpflOaeNl7Gscu0ezcUiaaDK7EmqgkSEMpDkf2GMYSTBF2lT3VMZ
         KHzw==
X-Gm-Message-State: AOAM53257I+RFZH2FEtEHAZdbnpsEsRCSX5gqFgiKfR60ONR0RlSCHpV
        KoeP4p6mRqUCclBYx6/NzGBWtOYoELzUvvGNrzWo4Q==
X-Google-Smtp-Source: ABdhPJysPzSfwlVyVdWBKUalOT0iR/oa380Ka2xGSIUkYRdu/+jueIFwVtoKPaDzivQWTPr7woGPCTGrXqUbOmHoLlw=
X-Received: by 2002:aca:a953:: with SMTP id s80mr10804519oie.164.1642115588114;
 Thu, 13 Jan 2022 15:13:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Jan 2022 15:13:07 -0800
MIME-Version: 1.0
In-Reply-To: <c190bd82-b6d3-b6a9-3e58-32c8d9d417c1@quicinc.com>
References: <1641926606-1012-1-git-send-email-quic_khsieh@quicinc.com>
 <1641926606-1012-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53hrPYR3ThwxM_+fzyRSB+6W1drFymW5n_RKmg_gf8z-w@mail.gmail.com>
 <84ee17f9-2597-86b6-1517-2358d443f65b@quicinc.com> <CAE-0n5134H0puMicozjdfTY+zXVUZyrebjv7Hto3EWcQAELO4A@mail.gmail.com>
 <338ae657-e8ed-e620-0aa7-4ad05df18ad1@quicinc.com> <CAE-0n51QbJHnOses5sF6xECR0gRZB1Fbi1KqoLG+61ZWH9BtOA@mail.gmail.com>
 <64ad7053-beac-0c28-7d09-ea32a4f7fbad@quicinc.com> <CAE-0n53qxer=shY3LdxzDPFaQb1L65okX9TM0TXYCdD59qau5g@mail.gmail.com>
 <c190bd82-b6d3-b6a9-3e58-32c8d9d417c1@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 13 Jan 2022 15:13:07 -0800
Message-ID: <CAE-0n53htQSQuY8ew4xGzKgOwV=YHcgVg+SNRbL17nyYS3mqoA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-01-13 14:14:27)
>
> On 1/13/2022 1:52 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-13 12:44:16)
> >> On 1/13/2022 11:47 AM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2022-01-13 09:51:42)
> >>>> On 1/12/2022 8:13 PM, Stephen Boyd wrote:
> >>>>>>>> -       if (dp->usbpd->orientation == ORIENTATION_CC2)
> >>>>>>>> -               flip = true;
> >>>>>>>> +       dp_power_init(dp->power, false);
> >>>>>>>> +       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> >>>>>>>> +
> >>>>>>>> +       /*
> >>>>>>>> +        * eDP is the embedded primary display and has its own phy
> >>>>>>>> +        * initialize phy immediately
> >>>>>>> Question still stands why we can't wait for hpd high from the eDP panel.
> >>>>>>> Also, I think "has its own phy" means that it's not part of a combo
> >>>>>>> USB+DP phy? Can you please clarify?
> >> Correct, eDP has its dedicated phy which is not part of combo phy.
> > Why does that mean we can't wait for hpd high from the eDP panel?
>
> Sorry, missed this one.
>
> Yes, it can wait for hpd high.
>
> Since it always presented, I just think it is better to show display
> sooner not later until hdp high.
>
> you like it to wait until hpd high?

Yes. The less special cases the easier it is to read and modify later. I
also worry that someone will decide to connect a DP connector to the eDP
pins and then not always drive HPD high. In that case this code would
need to change so it seems better to follow one flow instead of two.
