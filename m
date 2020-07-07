Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808A0216D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 14:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGGMxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 08:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGMxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 08:53:16 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332ACC061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 05:53:16 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id v6so29333578iob.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e/YoIMP8c0HJJ+S49WYxsGpiCi+NvL2ww5EeAkEmXVI=;
        b=QFqebrYRDiE5dakUbLufOg818o7Ardt+uJugcI+HpLGySh/41S/8TV1nwhSvhjJHxB
         fTXUp6ton6DMP73OMpTlt1paFI/tftk2v57nIYzrWiXqr/kgOcTawXr0fhF5l/f7cXjt
         0EMSwLaZZMeAml961G+ZnI41KTQleHHP2Zftc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e/YoIMP8c0HJJ+S49WYxsGpiCi+NvL2ww5EeAkEmXVI=;
        b=Sqa3uqyTiW3BH/OQFbUqFMiYLZDvx0nHSBTPOHC6ADxsPSjfYxrx51Ky5HOLAaIjBg
         Eycjx6AI1UjSSBaMGzyCAPBgAmNDxCDXkZFxcRb+iyieblNm70QvgAAPgPPeF6GIgT20
         CnvbUF7fAPaZi8HXGPVSUQNTIkDCdwwGMPibbgMFCGvjJia1NVrjSgTZiJ9TuvbDpI8D
         W/1a2PqsbOquwSl1NtJAPi7IGr9vDmDY9LOV5A8YhUSvjLGtEOI9+tNazZK9BVNg3SzA
         qlHroFNodwdNhQ0EGYpg2N41pWrYg52AqQxcbXaDpG5YbHtKLoqPdjjCuXyYx4SPt65J
         DYGQ==
X-Gm-Message-State: AOAM531qEVYYSLGh4SXWi7d4scD48SbuKtyuoinwPQW14daZmZatjb/K
        42/5pmsczX+8Pw3tY2zR86/iN+kIQq4=
X-Google-Smtp-Source: ABdhPJxsUQKcdRg5Jv12b5okNFFzRWWb2ma4z9+jIJLufTwcrsHw3kIXE6a1zTFCfsEmn9kRU7zT/w==
X-Received: by 2002:a05:6602:158b:: with SMTP id e11mr29897273iow.30.1594126395319;
        Tue, 07 Jul 2020 05:53:15 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id k1sm12625698ilr.35.2020.07.07.05.53.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 05:53:14 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id k23so42929930iom.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 05:53:14 -0700 (PDT)
X-Received: by 2002:a6b:5c07:: with SMTP id z7mr31742004ioh.140.1594126394129;
 Tue, 07 Jul 2020 05:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200702004509.2333554-1-dianders@chromium.org>
 <20200701174506.1.Icfdcee14649fc0a6c38e87477b28523d4e60bab3@changeid> <20200707120812.GA22129@sirena.org.uk>
In-Reply-To: <20200707120812.GA22129@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Jul 2020 05:53:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5RHh_QuZ1tv9V5JtcsrhRONSa_CerYwUFsHhDOhEqdA@mail.gmail.com>
Message-ID: <CAD=FV=U5RHh_QuZ1tv9V5JtcsrhRONSa_CerYwUFsHhDOhEqdA@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi: spi-geni-qcom: Avoid clock setting if not needed
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        ctheegal@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On Tue, Jul 7, 2020 at 5:08 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 01, 2020 at 05:45:07PM -0700, Douglas Anderson wrote:
> > Every SPI transfer could have a different clock rate.  The
> > spi-geni-qcom controller code to deal with this was never very well
> > optimized and has always had a lot of code plus some calls into the
>
> This doesn't apply against current code, please check and resend.

As mentioned in the cover letter, I posted this series against the
Qualcomm tree.  The commit that it is fixing landed there with your
Ack so I was hoping this series could land in the Qualcomm tree with
your Ack as well.  Would that be OK?

-Doug
