Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E6D42973C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 21:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbhJKTIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 15:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhJKTIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 15:08:15 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12F0C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 12:06:14 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so22865953otb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yf4CeW+wH984HS5Ka13YQi4A879LcUBUUcdg0qwEiAo=;
        b=mSIIN4f+BXxQNY4IVrfdqVpvEcrAH+BMCeMjn7uJgYuuVdMcAETwavJ192agV/fCxU
         IMnf3PIh8FlolcBsZgD0n2XcXQ/IhsPTu+4qovHCoLeHoXg+rJRLtktDofdXN3X5Gy37
         5EjwA3PM2CQf8Lg8AaU6W7X/eTsyrHtw1quJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yf4CeW+wH984HS5Ka13YQi4A879LcUBUUcdg0qwEiAo=;
        b=lcmGriyynj0Xy3cTmp445gogx0eNeq4wAvNz9Y9xNHDS+3KjRe3gEOZIujOsLFMs+Z
         CBtsW/FEZdZZ7u/mgIZjmPV51dIicARu9qmMtn0dyQrZFbPEBUNuOavrCqZfh31y6BGL
         MlT3tyYOjBhNBKpAB8jSrqhZgZ6TM2u4Yz7U/2FxESQEw/0ZeG1bLyH8XG8HVomSfjMd
         Xc1ub1eTnw44uTEL2FdbSrUKWCxNPlgJVymuZFAyMS37z35Zwyc9sk4jPY+I7De0DEhi
         m/PlRvY41X+fR1EWjAEeDhwJF2TL7F3Ry5pzuApETQp27f+whVQmMdtWYjgoRPQ+m1CL
         4MqQ==
X-Gm-Message-State: AOAM530MHPY5eaXeSPJ0ni1rh6W0mEZM2UcjyU36YQje92UFjBAXAqZi
        McmKlyrLkywS+aT4kKe+LiY+DJxNizq+a/RctMAJEB78xao=
X-Google-Smtp-Source: ABdhPJy70Dj2Rm2Sv6XAazg9V+ROgR6yqGNx4ZFoMMv2RtS+wp4MKMlPLLcjX39R7qjcD/fC53BLM0XdGsQqFUdHfr8=
X-Received: by 2002:a05:6830:2317:: with SMTP id u23mr8216947ote.126.1633979174085;
 Mon, 11 Oct 2021 12:06:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Oct 2021 12:06:13 -0700
MIME-Version: 1.0
In-Reply-To: <20211011184022.GA18698@hu-gurus-sd.qualcomm.com>
References: <20211011092054.GA6793@kili> <20211011184022.GA18698@hu-gurus-sd.qualcomm.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 11 Oct 2021 12:06:13 -0700
Message-ID: <CAE-0n51tW3jwAPHaoDTMM89ADcPQuWb4UyjCSbkRXHF3wPe4og@mail.gmail.com>
Subject: Re: [bug report] firmware: qcom_scm: Make __qcom_scm_is_call_available()
 return bool
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Guru Das Srinagesh (2021-10-11 11:40:22)
> On Mon, Oct 11, 2021 at 12:20:54PM +0300, Dan Carpenter wrote:
> > Hello Stephen Boyd,
> >
> > The patch 9d11af8b06a8: "firmware: qcom_scm: Make
> > __qcom_scm_is_call_available() return bool" from Feb 23, 2021, leads
> > to the following Smatch static checker warning:
> >
> >       drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
> >       warn: signedness bug returning '(-22)'
> >
> > drivers/firmware/qcom_scm.c
> >     232 static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
> >     233                                          u32 cmd_id)
> >     234 {
> >     235         int ret;
> >     236         struct qcom_scm_desc desc = {
> >     237                 .svc = QCOM_SCM_SVC_INFO,
> >     238                 .cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
> >     239                 .owner = ARM_SMCCC_OWNER_SIP,
> >     240         };
> >     241         struct qcom_scm_res res;
> >     242
> >     243         desc.arginfo = QCOM_SCM_ARGS(1);
> >     244         switch (__get_convention()) {
> >     245         case SMC_CONVENTION_ARM_32:
> >     246         case SMC_CONVENTION_ARM_64:
> >     247                 desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
> >     248                                 (ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
> >     249                 break;
> >     250         case SMC_CONVENTION_LEGACY:
> >     251                 desc.args[0] = SCM_LEGACY_FNID(svc_id, cmd_id);
> >     252                 break;
> >     253         default:
> >     254                 pr_err("Unknown SMC convention being used\n");
> > --> 255                 return -EINVAL;
> >
> > Presumably this should be "return false;"?
> >
> >     256         }
> >     257
> >     258         ret = qcom_scm_call(dev, &desc, &res);
> >     259
> >     260         return ret ? false : !!res.result[0];
> >     261 }
> >
> > regards,
> > dan carpenter
>
> Hi Dan, Stephen,
>
> Please find the fix below:
>
>
> From 8bbdb1517c3f58b6b29d0915424b9b0e03752e14 Mon Sep 17 00:00:00 2001
> From: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Date: Mon, 11 Oct 2021 11:18:06 -0700
> Subject: [PATCH] firmware: qcom_scm: Fix error retval in
>  __qcom_scm_is_call_available()
>
> Since __qcom_scm_is_call_available() returns bool, have it return false
> instead of -EINVAL if an invalid SMC convention is detected.
>
> This fixes the Smatch static checker warning:
>
>         drivers/firmware/qcom_scm.c:255 __qcom_scm_is_call_available()
>         warn: signedness bug returning '(-22)'
>
> Fixes: 9d11af8b06a8 ("firmware: qcom_scm: Make __qcom_scm_is_call_available() return bool")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---

Resend as a proper patch?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
