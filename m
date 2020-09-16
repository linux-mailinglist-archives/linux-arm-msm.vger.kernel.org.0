Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9130626BE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 09:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPHw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 03:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgIPHwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 03:52:53 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F3BC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:52:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c8so5309670edv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YMMc40rRDox9zDpUt8zWYJEoAPFeZbvaKdWP2jjUs7U=;
        b=omSLfTKCdijD1zIfa5lE5cwXoJnzkrwdJtm6aHP0LEx04lxYzikzgwoqmzGhH5ews9
         owUFw3hYHvOj6ykias8qGojCVHjpGCA5FyQYC+oGNp7JjhnhxjdYqvAU/g8qm6eeNDdm
         WsrXuTTDVFnKHsOxu4xjkARcgvVcziGEU3gha+80ZNvrOw+eb9pMK42g3x2lsyH4mF2o
         bzWPta64FgYVwebSdX8+JBnbVFj1xje/VT+O6eNrYT01XK3nUjCSPMLcOiHp5WcMQruX
         ZeM6ruDmquUMssSNr8zv1hhFBM/UDnWJEe69g9XMi46te+pP3kPN2B5sWn9ZtQE3+FeE
         wUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=YMMc40rRDox9zDpUt8zWYJEoAPFeZbvaKdWP2jjUs7U=;
        b=m/WgsChanGAI6AOSrhYYpeQW46bhMO4w0bsZzb8AY6j8F4hugzbrqTBI4b2WyNjyLw
         kE6jgknhAZ4/IZFlSh/K5ddDBwGoQJ8hO3+kq+abSTVk5EqULG5wd3SezvYRGRERszyl
         urMN3Inugc8aNUrTZJSJ2BiqoJh3sCT6glclXKfOVNx290t+ypF8jCHoIfz9kHB2AMg3
         xMyp1GfjVo90OsU5G68aTvROMkBjO7pEjkdu8izDQkexLkS4WcJ+mpGQZp8RNNxUNmMl
         ZGuBl95zbl13WnpkGTnzPCYCNlvKtDeT1b0HDyFxu4AhEvC/Xbsp0ynGFGzIdJPFeayY
         uocw==
X-Gm-Message-State: AOAM531wF3QIXEqNmH+spVQuCD1fikM/ieL1DpVV7Tu5WucV759ciPXj
        fuObpAuHVerVYdgr1E+YTTX9oeCM8X5glLZ5KjWgpA==
X-Google-Smtp-Source: ABdhPJxKPjAgwVYaYZaWZ0+gacFV4GyHXzLcsKXbNqCtZAJLWj20D+MoZWjSVNIR0HP97s0e6v247FGLkDX1163EhkI=
X-Received: by 2002:aa7:ca46:: with SMTP id j6mr25926244edt.155.1600242771009;
 Wed, 16 Sep 2020 00:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200916074924.20637-1-jun.nie@linaro.org>
In-Reply-To: <20200916074924.20637-1-jun.nie@linaro.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Wed, 16 Sep 2020 15:52:40 +0800
Message-ID: <CABymUCOPG79sYcSPQ7JkTMSM3jG38Q0fCAJnOrn47QgMoqZsqQ@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: rpmpd: Add MSM8939 power-domains
To:     phan@gerhold.net, Shawn Guo <shawn.guo@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2020=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=
=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=883:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Add the shared modemcx/cx/mx power-domains found on MSM8939.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 27 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        | 10 +++++++
>  3 files changed, 38 insertions(+)
>

Fix max state and alphabetically order per comments from Stephan, vs
the version 1 patch.

Jun
