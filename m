Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C142CE076
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 22:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgLCVSA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 16:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCVSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 16:18:00 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C745C061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 13:17:14 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id w18so2066622vsk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 13:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGoE8xubVEgNLoB/pENK1O+pppyzMnVzHXcTRFU/KCc=;
        b=chE+k1Qcf+xrh+adSDGV7aBESLQtsxS8VaxO+3F3wy6/fQERIPW1WnfMaIVPhx66TK
         Tp2ORtvkN5wXVBhwFIpcN/vmUaA8MkgdnQsRJDX/aoIO6UIEUkEuMo8fA3PCVy7sWc9h
         dcMP3U1bhclTx00l5t8IG6Zloa0qvLiXU1mw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGoE8xubVEgNLoB/pENK1O+pppyzMnVzHXcTRFU/KCc=;
        b=EJQF6jKaUadsSOoEeHe0hQs5fZJiw3SIDXGCbm6wNQTyymd4s7EN/cvWNDQDM0YvkU
         ZE3I/xIz6xyDVhvFcf29YC5lTcZclgY1RPukLbpTcE53blDlH0OjlO19nYdHx0OOwJJz
         7kpwKhojWc6g2/ElY+XzGYtE/YauIM4Rmnnl7Q+jkVLBYQM/4SUdgE9oJZeMzGUFV2SH
         5o23dGK5Nx8nAOznRaLSfMkEBqh0Gfo0g+ki2K/RmX1SF+NATbp6g7Kzj8ZqNXtcddPs
         Kwj+7pA+sVLsbU2uBzq1du1mkhzRuoQ5bzyUOhSwQ1F5LqiHLESx+IsQJoOGf3cw1BXz
         wZMw==
X-Gm-Message-State: AOAM533E6Jw3jEFv8NCMZYtPKJoowziRPI4TQcHD5oaEvdP53/tvm+VE
        EiIY5GBvKriOEeFQvnDj4WAs50J8SB2e2g==
X-Google-Smtp-Source: ABdhPJyAZaIZevzz/4Z7fXvAkX+QT1gEfroaRqAVexKZEyv1KN60gAH4WB+tqPn5sarK6nNBDiI1wA==
X-Received: by 2002:a67:ef03:: with SMTP id j3mr828957vsr.26.1607030233041;
        Thu, 03 Dec 2020 13:17:13 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id p82sm102717vkd.46.2020.12.03.13.17.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 13:17:12 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id b23so2066315vsp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 13:17:12 -0800 (PST)
X-Received: by 2002:a67:70c6:: with SMTP id l189mr1318354vsc.34.1607030231837;
 Thu, 03 Dec 2020 13:17:11 -0800 (PST)
MIME-Version: 1.0
References: <1606211610-15168-1-git-send-email-mkshah@codeaurora.org> <CAD=FV=Xk_1=eCvqLPPnYLrQWf1zVy+iEHs=DWEubb6n5ub3Wxw@mail.gmail.com>
In-Reply-To: <CAD=FV=Xk_1=eCvqLPPnYLrQWf1zVy+iEHs=DWEubb6n5ub3Wxw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Dec 2020 13:17:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XafiNR+vZc2nM6JzhU7xPm9v3eeeR5SMhBM3k3mmsZDQ@mail.gmail.com>
Message-ID: <CAD=FV=XafiNR+vZc2nM6JzhU7xPm9v3eeeR5SMhBM3k3mmsZDQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: qcom: rpmh-rsc: Do not read back the register
 write on trigger
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 3, 2020 at 1:15 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Nov 24, 2020 at 1:53 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >
> > From: Lina Iyer <ilina@codeaurora.org>
> >
> > When triggering a TCS to send its contents, reading back the trigger
> > value may return an incorrect value. That is because, writing the
> > trigger may raise an interrupt which could be handled immediately and
> > the trigger value could be reset in the interrupt handler.
> >
> > A write_tcs_reg_sync() would read back the value that is written and try
> > to match it to the value written to ensure that the value is written,
> > but if that value is different, we may see false error for same.
> >
> > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > ---
> >  drivers/soc/qcom/rpmh-rsc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Fixes: 658628e7ef78 ("drivers: qcom: rpmh-rsc: add RPMH controller for
> QCOM SoCs")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Ugh, brain-fart.  Not Signed-off-by, but:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
