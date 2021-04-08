Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93BD3578B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 02:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDHAMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 20:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhDHAMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 20:12:20 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D615BC061761
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 17:12:09 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q10so90957pgj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=8D8XPaeKV95AOIsyqrG+mdWfzRj4cAHDWOaASJt1zGs=;
        b=j8MKc3Ye8ykdNgICWke14Eow75lnPz8CIGBLwfuCCDNAPOo3QXW6qXxQWDIej5zrxj
         O5IhvceaIVGevBUYFe2XxJSC+PAjLnuLgayHghAo/eHwgh17HNXB1PnM+1fdHj/K/U/B
         eFLO+CcFZ/nQrB/Y4z8GJ6bwsgpiYLpDVgIDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=8D8XPaeKV95AOIsyqrG+mdWfzRj4cAHDWOaASJt1zGs=;
        b=ie8VQk1hLAGy6xIJSYBbD3VzFEgHNm4xNU6aF463OwZjCcq9BbJ5D5nCTfz63zoQBR
         8PXNwxG4stBm71NZt3C25z81ydB/+y/osDNvnjV1YkPakm89SXXm6jZCFqPM6MY7HPI4
         g7slBsDQr9n3IJOCU6C3Lay5zPy2kKv0QvAnm5Frysc1j8BILVmexC97fgr99LOxbcWg
         Ugq56xBQCifa2HYZukAvhTSL8W0TiuM6tkiCo2u4/+Bd27Vj6L4+neeNOUMDvWf343hM
         Wt0eGpnW3VrOianH0Ee3K3A7kF+q2IGY+8Qd9YGtFfUdHJeWgy+h8njJK0Y2QGIvu/RU
         LeQA==
X-Gm-Message-State: AOAM533qO9il6vQIl0MgT0xMk6q4R+7V7JajnKkVpyfoXrDQUNC8NxsA
        WO4wScbO598y+frLjfFdxlT/gA==
X-Google-Smtp-Source: ABdhPJwAUn7FrW1GX1I48MVJmCa8zhddbH7Hg8ce/tqoANhiRraj9xfQj0WuF4bhoMT3IzKriAN3Mg==
X-Received: by 2002:a65:5b06:: with SMTP id y6mr5542633pgq.58.1617840729223;
        Wed, 07 Apr 2021 17:12:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
        by smtp.gmail.com with ESMTPSA id n7sm6283577pjk.23.2021.04.07.17.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 17:12:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YGsHkoNEaIvCRdpx@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org> <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org> <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com> <YGbvXFrMg6X7q3qL@gerhold.net> <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com> <YGsHkoNEaIvCRdpx@gerhold.net>
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Date:   Wed, 07 Apr 2021 17:12:06 -0700
Message-ID: <161784072681.3790633.7665111601750934002@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-04-05 05:50:26)
> On Fri, Apr 02, 2021 at 10:21:58AM -0700, Stephen Boyd wrote:
> >=20
> > Ah right, the whole secure world running in 32-bit mode thing. Is
> > msm8916 the only SoC that's using that? Or are there more? If only
> > msm8916 is affected then we could use a combination of CONFIG_ARM64 and
> > the compatible string to differentiate and then if more SoCs use 32-bit
> > secure world then we could have a new compatible string like qcom,scm-32
> > that tells us this fact. Maybe this was all discussed before and I
> > missed it. Either way, I'm trying to get rid of this boot call so that
> > we don't have to bounce to the firmware an extra time to figure out
> > something we can figure out from the kernel arch and scm compatible
> > string.
>=20
> At least MSM8994 also uses SMC32 from what I heard. Overall it's
> probably quite hard to get that right now since all boards were tested
> with the dynamic detection so far. I suppose you could do the opposite,
> add an optional qcom,scm-64 to skip the detection step and force SMC64.

Isn't SMC64 going to be the overall majority going forward? Legacy
convention is for sure limited to CONFIG_ARM so I'll send another
follow-up patch to add a warning if we find legacy on CONFIG_ARM64.
SMC32 is hopefully no longer being produced given that it was introduced
at the time that the bootloader team wasn't supporting PSCI and didn't
want to support it. So we're making all new boards/SoCs/firmwares do
this calling convention probing to figure out something they already
know?

Maybe we should probe the calling convention on msm8994/msm8916 and
otherwise assume SMC64 on CONFIG_ARM64 kernels. I'd expect the exception
list to be smaller that way.

>=20
> Also note that this could even be firmware-specific, not necessarily
> SoC-specific. There are some ancient MSM8916 firmwares that have legacy
> instead of SMC32. I could also imagine that there is also some SoC where
> there are different firmware versions with SMC32 or SMC64.

Sure but in theory the firmware would update the DT to indicate what
sort of firmware is there.

>=20
> Plus, IMO the overhead for this detection is negligible. At least it
> ensures that we always use the right calling convention. The PSCI code
> probably does much more firmware calls to figure out all supported
> features.
>=20

Heh, it tried to ensure we use the right calling convention but broke
things in the process, because the way of detecting the convention isn't
always there. I wouldn't be surprised if this comes up again for other
boards that use TF-A.
