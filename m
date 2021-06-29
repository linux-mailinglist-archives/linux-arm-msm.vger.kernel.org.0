Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49D73B7233
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 14:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233686AbhF2MjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 08:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbhF2MjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 08:39:00 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 174B3C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 05:36:33 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w127so26068081oig.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCLpZ1HYuarbIGacNU/sVNi0akwwy7eXNvTxtyM/3Oo=;
        b=maGFBsAqXdB0zqYJn4S3dJGcMJb7uNPasmDuCKU/qUc40oz8XYr7bdUNZnVacqNaTj
         481QlQcOnoRAJBXAq5G4ntmnRRwOq5BO+ksLogTRnUfbgVqLgopqxEcWxJLEXM0da/da
         ZLWhD0jlxVsX4B1LgXBrN29bW9LWVroAQIQfEnzluSbRbjhGpCXF5sj0WczJ+A1q5/ml
         /tNcJ2OcIipXBjRoSr3dltlK/pawv0Bhmnn8v4nzq/VcJnbbBhIRjzCrZ58SvuqC0qQf
         6Bg1d8sDdlAvw8WSDSH7QkS0HNfoMlMr1Gl4MaSC80ZjQeNkPrNbSdxU6fLz+GUcJoN8
         tLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCLpZ1HYuarbIGacNU/sVNi0akwwy7eXNvTxtyM/3Oo=;
        b=GcIVQsFDCw+ixDXIc1WDDA4BZDmVB7bLgmVDtpYmxNJ30pnaS1BIJ8NM8mxdnI68rI
         9jKiYsXG9p5gVy2YPFEQeXGF/FzhfrjJABQxa7OYNOhucHTOd6dlUrEoltilfELU7bas
         ke+EVTBk6PZyX2puL3GOvUD+W81mjYxgKsa6hpXa32yCDy9awr0PZIVYcfhTl32sXrKg
         KnzeCICEoPwKwfCrlLUoSw+Tfq8XhUyO+U9WMobOAKJnASBDMKyHi1M1VhWpJpeMSOQE
         VzYQuOYhLwh0OkTiVgPKWUE3AHbgW1KE5UjUtVwbh10/9KLw0KRiv6wvwzz0HgiN8IUl
         cglA==
X-Gm-Message-State: AOAM530v8LUdpz2SBsJI3oENtYI/lxK2AxGUVzjfBvri37Ow+bVbeSQ9
        j1Z9ji6wx11mQdQEpqZVDAayzOqu+dye7yNADfGOvg==
X-Google-Smtp-Source: ABdhPJxl6fNlHSaf8fyTm3HNXZiSwl/vos1GPpSChDac6jGEfWWFct6Ci8jrzDdb2F1YHTub+Gd1ykFTOoRtuHaDAnk=
X-Received: by 2002:a05:6808:148:: with SMTP id h8mr14919843oie.12.1624970192497;
 Tue, 29 Jun 2021 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-2-bhupesh.sharma@linaro.org> <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
 <CAH=2Ntwef4SpAF+zAxkNvy2pjBfuQZONpUgJavMKfGuV-2uzow@mail.gmail.com>
In-Reply-To: <CAH=2Ntwef4SpAF+zAxkNvy2pjBfuQZONpUgJavMKfGuV-2uzow@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 29 Jun 2021 18:06:21 +0530
Message-ID: <CAH=2Ntz5Z52R5mS8d_7MdnaUJnK19xrSG2WEiXzR1MXg1WJPzg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: Arrange
 compatibles alphabetically
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Linus,

On Sat, 26 Jun 2021 at 23:59, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Hi Linus,
>
> On Sat, 26 Jun 2021 at 05:21, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Jun 17, 2021 at 7:34 AM Bhupesh Sharma
> > <bhupesh.sharma@linaro.org> wrote:
> >
> > > Arrange the compatibles inside qcom-pmic gpio device tree
> > > bindings alphabetically.
> > >
> > > While at it, also make some minor cosmetic changes to allow
> > > future compatible addition to the bindings simpler.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> >
> > These patches do not apply on the current devel branch in the pin control
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
> >
> > Please rebase and resend!
>
> Sure, Let me rebase and resend the pinctrl patchset.

v4 (rebased on pinctrl/devel) has been sent out and can be viewed here: [1]

[1]. https://lore.kernel.org/linux-gpio/20210629123407.82561-1-bhupesh.sharma@linaro.org/T/#m6595060a61e29d956b1a8ddc7a7a684f1f3b7641

Thanks,
Bhupesh
