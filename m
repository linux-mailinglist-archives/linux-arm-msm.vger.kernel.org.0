Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AB932349B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 01:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhBXAYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 19:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhBWXuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:18 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BA2C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 15:46:33 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id o22so2362866pjs.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 15:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=52s7FW08R7DpqhS4R5cEv7/zvsq+dgo8h5Fd0aF2pR4=;
        b=SOUsRUyNfCjLX/Q4pA1+0lP4JflTe6dcOb0/7AhlReHCaUxrxANZ+YbVB/cy4oDCGt
         amdIA8YxvMkGNL2U8ylru3OhtG333qORhuM3XdlIEJZMSZeY4q+yCkhPhmZUIiELsghZ
         VaBVdMbRY5p45sGmBBoetRr149PlqnlZSb2Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=52s7FW08R7DpqhS4R5cEv7/zvsq+dgo8h5Fd0aF2pR4=;
        b=ME3dmgtraGVg9kdW4llDUWTShFvsICJFztr6Edx7Qv5maq+3397CDntBWNM3NT1JtC
         NNBaiXJjvIX0aIdOjyijA2g38ERMe/3hShq5eIdGyOAi+fhvAEWFWYOSM8V4NLt2JFND
         s9HzyAfp/CPj89Qug1BZHHf//iEXJPuHAqxqgAHWFzliOuWlaUOG0P4ffZDiq5V4QKif
         E0AGsAGTy/4OX+3tn4fYl9F+FUttkNMU9imfy6o4PMyavzxZz4p6xrmWxDlc7svGzi5w
         3GVYkESTg3Uxcitr9nz+5SHSpPGyKyNDVBN2P5vk/6Y9d8hHFLm+CP7F0IOLaH8pCnF7
         Vfaw==
X-Gm-Message-State: AOAM532I8LuYSySiByi20j1QDznThqCyEwJRGGvT1Kp/ABttb3BbvPyR
        Ug0XJqTjuINXUb/O/43zh99nb23Iw/B2jA==
X-Google-Smtp-Source: ABdhPJwqv7dZS2tb3vob9nDjWJkwsqCWe2hGTUusox+ePNkpJW3EK2UT88TbZP6C/wn00N72RXygew==
X-Received: by 2002:a17:90a:c698:: with SMTP id n24mr1187456pjt.81.1614123993073;
        Tue, 23 Feb 2021 15:46:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id f2sm309168pfk.63.2021.02.23.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:46:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7fd9642-7dcb-42bc-18e9-6fd86d8f5be8@codeaurora.org>
References: <20210223214539.1336155-1-swboyd@chromium.org> <20210223214539.1336155-4-swboyd@chromium.org> <c7fd9642-7dcb-42bc-18e9-6fd86d8f5be8@codeaurora.org>
Subject: Re: [PATCH 3/6] firmware: qcom_scm: Workaround lack of "is available" call on SC7180
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Date:   Tue, 23 Feb 2021 15:46:30 -0800
Message-ID: <161412399088.1254594.11162340495979939098@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2021-02-23 15:38:38)
> On 2/23/2021 2:45 PM, Stephen Boyd wrote:
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index 21e07a464bd9..9ac84b5d6ce0 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -144,6 +145,18 @@ static enum qcom_scm_convention __get_convention(v=
oid)
> >       if (!ret && res.result[0] =3D=3D 1)
> >               goto found;
> >  =20
> > +     /*
> > +      * Some SC7180 firmwares didn't implement the
> > +      * QCOM_SCM_INFO_IS_CALL_AVAIL call, so we fallback to forcing AR=
M_64
> > +      * calling conventions on these firmwares. Luckily we don't make =
any
> > +      * early calls into the firmware on these SoCs so the device poin=
ter
> > +      * will be valid here to check if the compatible matches.
> > +      */
> > +     if (of_device_is_compatible(__scm ? __scm->dev->of_node : NULL, "=
qcom,scm-sc7180")) {
> > +             forced =3D true;
> > +             goto found;
> > +     }
>=20
> All SC7180 targets run DT?  None have ACPI?
>=20

Yes, as far as I know all sc7180 boards are using DT. If they aren't,
then presumably they implemented this QCOM_SCM_INFO_IS_CALL_AVAIL call
so this check is still fine.
