Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A32E53A830B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 16:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhFOOk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 10:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhFOOky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 10:40:54 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F7EC0617AF
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 07:38:50 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id d27-20020a4a3c1b0000b029024983ef66dbso3574865ooa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 07:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gML0gNeUY9KZnMu0icpe+Ao14v4Mv0uhd+YE7NtLepk=;
        b=m3B/jCJ4NIK9+VC+M0jt2+0xz8y8z8M7ue7AOVKicMnwJXLOJe+TboMi8SP3Ai03cz
         8J0Ej09umI3lO3xI6c46Lf3vmX9oCXJz4iYlKwTIyCcuoEjLVuKQGPq/L0/KrdxTeSOb
         fcpkQButmCY8qdHOqpd89BV2I26Wg898fMnD3bJLimYnh2GQ9yFNivXeex+/xduBHeRX
         Gj99T1THHkZH2cCnGnmGEcE1Dtl9IDNP9BGtST09RlyuaI6SWxCAq+C/DKyyhQxHN5Oq
         MEjaSbCfkqDD+0CrS4zqSvpEgNLOhRuPgfN4QXygeJYhU+RA+ENoR57QQYGUFqs4OSJ0
         JBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gML0gNeUY9KZnMu0icpe+Ao14v4Mv0uhd+YE7NtLepk=;
        b=Yq0KJJWHXaFZnXRBlggbTl6efdbO1MB6NMNVIportGvOa20TGj+t1tjAE+ri+s+PMl
         oMHDaZPWp+0jOCTU4+VoXTYPUGMvBtm4ACeDdGdgN1sYdlFXCOC8ePyBPZmAZOvaL/8O
         rVLe05m8yKXwCb0ereAV/VG3IDWhM0wufbhXxny1mcxr0X8jRVRr849aZRU0/LO0JPLO
         N9KfncNeBGfXVhU/amnUN3JLr9JJ3vIAAEXAr3LapJOkKqtrx6cW0rllS6Qd001M3Ah+
         B6H7YYMux5elzaqRC5qUFEXfQVpMMEsFrAwhcCYnBW05fabl+6CwFAZo/WCpHtlAelEL
         mX7Q==
X-Gm-Message-State: AOAM530BffIRhbU+lz/DR+Wfdby85eR+KPniS2SC5JeWNPHply1BLg2D
        GmjW3i24Vq6Yw43OyLq6lysvrZRH6rC0kl6dCj6jufy3r+XNtw==
X-Google-Smtp-Source: ABdhPJwwl+jPtnsMwBAGXx43iRP2lffKwywPRf97DhDFHyLh7bJr2kCnaZRGmAPrN54NYfZwIJS7Cbh1a/rf+tzGTxI=
X-Received: by 2002:a4a:e4c1:: with SMTP id w1mr17875364oov.81.1623767929348;
 Tue, 15 Jun 2021 07:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-7-bhupesh.sharma@linaro.org> <20210615111228.GB5149@sirena.org.uk>
In-Reply-To: <20210615111228.GB5149@sirena.org.uk>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 15 Jun 2021 20:08:38 +0530
Message-ID: <CAH=2NtwAsvU9x3pTKdf2e5YAG7N9=uT4EQZ9aPWp26THXntdNw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] regulator: qcom-rpmh: Add new regulator found on
 SA8155p adp board
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

Thanks for your review.

On Tue, 15 Jun 2021 at 16:42, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jun 15, 2021 at 01:15:39PM +0530, Bhupesh Sharma wrote:
>
> > +     {
> > +             .compatible = "qcom,pmm8155au-rpmh-regulators",
> > +             .data = pmm8155au_vreg_data,
> > +     },
>
> This is adding a new compatible so it needs a matching update to the DT
> binding.

Yes, [PATCH v2 01/10] from this series 'dt-bindings: qcom:
rpmh-regulator: Add compatible for SA8155p-adp board pmic', updates
the dt-binding with the new compatible.

Please let me know if I am missing something here.

Thanks,
Bhupesh
