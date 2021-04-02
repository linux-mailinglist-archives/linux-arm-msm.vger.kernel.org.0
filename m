Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DE6352E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 19:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbhDBRWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 13:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234821AbhDBRWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 13:22:02 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AABC061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 10:22:01 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id k8so3938368pgf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SJQZRGQfDVHISSI0cWafHWjPGoBoA9z2oZ6ofvMIC2Q=;
        b=ocV94QmEb8WHve6vi9dD9HSzUXWedb0p0T2GPCqbwTSgd7Qb0ffDTiqjEPcSR0sr/W
         YqD+TyzLa9fRDDs7rmCriV7RrlbuP4pRE3lz4Cj75RjiBC9AJUOGSDD+os3kzOGY6M1G
         K0dKzB1NDHh9KagaDm6XpqQngu4jfy6KpHzj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SJQZRGQfDVHISSI0cWafHWjPGoBoA9z2oZ6ofvMIC2Q=;
        b=OcrDFyXHww8hJJ8wAXke1kOw9EDJHwHI7DIhAKqV7yuT81jxYA9p+DqucHoieaGktQ
         tOmWYfRyzCCCvnmm5PH1d/YZO57wYV/0Xoff53cg3ivxnGngqEQGjT3amnFvKLqo/mE2
         FdDTXfX+VqFs1YvW9m0dcJvp7xzPXKgReLW8o2ZjjnJq0hal17PPI5cVIoMMnyzopNbr
         C70peJIH7IY40a4Xo3GJ/L0Tv+G8tYIVzYB1X1NcNW29VnEcCgf7gxmCRIjjGZ63jtn9
         gwwsBxEb4CfQNoN/KxppdAqYP/tQ7rOEZ0fiekPTEOAe4+W2Di4+3uyVAv4FLj06wpMv
         xegA==
X-Gm-Message-State: AOAM5300Ia0yVzY1TZiyOfXcvE3T2y03tGIYLGoUED90p7w08QteTrG1
        qVjTiEBTJWxtb2R91OLFSjWaCQ==
X-Google-Smtp-Source: ABdhPJycQ6o/WXNDqjnSReUssRoY2znK34XTff4rI9DvMf3gFUNdlCSyK1rU0QuaC1TBx0jHE7r0BQ==
X-Received: by 2002:a63:5c07:: with SMTP id q7mr12755567pgb.52.1617384120737;
        Fri, 02 Apr 2021 10:22:00 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:c090:e09d:927a:b4a8])
        by smtp.gmail.com with ESMTPSA id bj15sm8519131pjb.9.2021.04.02.10.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:22:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YGbvXFrMg6X7q3qL@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org> <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org> <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com> <YGbvXFrMg6X7q3qL@gerhold.net>
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
Date:   Fri, 02 Apr 2021 10:21:58 -0700
Message-ID: <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-04-02 03:18:04)
> On Thu, Apr 01, 2021 at 11:58:48PM -0700, Stephen Boyd wrote:
> > Quoting Elliot Berman (2021-04-01 18:12:14)
> > >=20
> > > It might be a good idea to wrap these lines from qcom_scm_call with #=
if=20
> > > IS_ENABLED(CONFIG_ARM), and the corresponding ones in qcom_scm_call_a=
tomic:
> > >=20
> > >    case SMC_CONVENTION_LEGACY:
> > >        return scm_legacy_call(dev, desc, res);
> > >=20
> > > If something is wrong with loaded firmware and LEGACY convention is=20
> > > incorrectly selected, you would get a better hint about the problem: =

> > > "Unknown current SCM calling convention." You would still get the hin=
t=20
> > > earlier from __get_convention, but that may not be obvious to someone=
=20
> > > unfamiliar with the SCM driver.
> > >=20
> > > I'll defer to your/Bjorn's preference:
> > >=20
> > > Acked-by: Elliot Berman <eberman@codeaurora.org>
> > >=20
> > > with or without modifying qcom_scm_call{_atomic}.
> > >=20
> >=20
> > Maybe it would be better to catch that problem at the source and force
> > arm64 calling convention to be safe? I'm thinking of this patch, but it
> > could be even more fine tuned and probably the sc7180 check could be
> > removed in the process if the rest of this email makes sense.
> >=20
> > If I understand correctly CONFIG_ARM64=3Dy should never use legacy
> > convention (and never the 32-bit one either?), so we can figure that out
> > pretty easily and just force it to use 64-bit if the architecture is
> > arm64. If only the 64-bit convention is supported on arm64 then we
> > really don't even need to call into the firmware to figure it out on
> > arm64. We can do this convention detection stuff on arm32 (CONFIG_ARM)
> > and always assume 64-bit convention on CONFIG_ARM64. Is that right?
> >=20
>=20
> No, the detection is also needed on ARM64. On ARM32 there can be either
> legacy or SMC32, but on ARM64 there can be either SMC32 or SMC64.
> You cannot use SMC64 on 32-bit, but you can use SMC32 on ARM64 just
> fine. SMC32 is used on MSM8916 for example.
>=20

Ah right, the whole secure world running in 32-bit mode thing. Is
msm8916 the only SoC that's using that? Or are there more? If only
msm8916 is affected then we could use a combination of CONFIG_ARM64 and
the compatible string to differentiate and then if more SoCs use 32-bit
secure world then we could have a new compatible string like qcom,scm-32
that tells us this fact. Maybe this was all discussed before and I
missed it. Either way, I'm trying to get rid of this boot call so that
we don't have to bounce to the firmware an extra time to figure out
something we can figure out from the kernel arch and scm compatible
string.
