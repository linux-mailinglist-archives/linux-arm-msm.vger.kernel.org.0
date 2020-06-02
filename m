Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEAB1EBB17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 13:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgFBL5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 07:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgFBL5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 07:57:31 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5114C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 04:57:31 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i74so659013oib.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bnys2wOoEU1x/ikV5ijTNA/FpnweJ1oEqvvB7NUEA+A=;
        b=k+9cCuBX+07ki3h/U1eTOzlr6ODNPkXXcMKP6TfZD7xxmJxeBWW3n9KjD5Mg1xqfxl
         CqMnaNTwFk4x77rZ3i4IpXbcT3Lz0kMvuu5YL/MJ1IvMjZQqxUnWCDc5VhRoQRm9ETn/
         t9/MEFpNnEXCG0JRS0g0z25GDiOozWbkOTdxfYjCG5iAvZFoaBtC80XqC3qwp1Egq7Bj
         oXW7ASgx69H0zp0YNjuLPGrC0UFqf2u/Qphzr8zuZBi1hTWXjrU0MRk7pWYFRAyoxyV5
         MibIXAuxNYlXoDbaxIpKNnSPdw1PNSBNbD7I8rhM/2vJb17fdDmqsTVVpccOou9NM1ZX
         5zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bnys2wOoEU1x/ikV5ijTNA/FpnweJ1oEqvvB7NUEA+A=;
        b=gEAFUz3jgoFz1cBnfDX3VqNgYIMPwvfD7RSunX7SghYmvX8Qro/f3o1bPKmdhHiJL5
         gO4EO1oU/MLsvhah2FVROTkMIIO06bV+aSu+WvtXb9ABwAxcG/wIdbv0RoOCGfYRBnC8
         K3uL5irpDbvrnTbg+6nf3+LgkoQsO8Ua9Y565pzmuZi1wTDgXdhVCZ6CFRbcrmXk5uk6
         26rFzZmTapZ4ojmb9OXok4ZWxbD07sekNwCmZYfOdnlwMf8gmiK79pRKBtvU6dVMwsuG
         GzS63pORcqDDOnRuxZnJiW7M+BJh0caPiRa/V6ibhNALi6uyUK94zSGUwxaLbqjtHjY2
         uybA==
X-Gm-Message-State: AOAM530hLJs2kmopK4xEK9OymDGslCFrB+bFziOZDIZQycTY+AL8PaR+
        doyHRMw4EQP8l0WNUvzjwoQ052bVFRp9LA/qWBlMjw==
X-Google-Smtp-Source: ABdhPJyF04o7i6kEvgUR2RRqw2rFPSQaTPQrgt/KTJQMMVnh2YChB0XvplTmPPHzK36jN1aEaoBMWgCgPKD1BB58jkU=
X-Received: by 2002:aca:50cf:: with SMTP id e198mr2811324oib.76.1591099050929;
 Tue, 02 Jun 2020 04:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-2-sumit.semwal@linaro.org> <20200602112415.GD5684@sirena.org.uk>
In-Reply-To: <20200602112415.GD5684@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 2 Jun 2020 17:27:19 +0530
Message-ID: <CAO_48GHdhafjgLH1-3upZPXhNjKSt_bPAnPpjA+nhR2wrLbcZw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] regulator: Allow regulators to verify enabled
 during enable()
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

Thanks for the review!

On Tue, 2 Jun 2020 at 16:54, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jun 02, 2020 at 03:39:20PM +0530, Sumit Semwal wrote:
>
> > +
> > +             if (time_remaining <= 0) {
> > +                     rdev_err(rdev, "Enabled check failed.\n");
> > +                     return -ETIMEDOUT;
>
> s/failed/timed out/
Ack
>
> > + * @poll_enabled_time: Maximum time (in uS) to poll if the regulator is
> > + *                          actually enabled, after enable() call
> > + *
>
> This comment needs updating to reflect the new implementation.
Yes, I will update.

Best,
Sumit.
