Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E261352D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 00:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFDWs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 18:48:29 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37792 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFDWs2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 18:48:28 -0400
Received: by mail-vs1-f66.google.com with SMTP id o5so14610203vsq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yOTYAZZHsN9vSJiFSddF1i+Vhk1s4jxk8U4YBT4J2E=;
        b=XY6grJDuWRpc6A4FNnTuk9YNCNdoSL2AaPa7Rn61s/Bmwv5EE0r0C4ldNxVpvdOjbQ
         Q0fiuZrX5aZi+ehYt9wyEZr3Oj6r+Klx0ItoVVEcCOBtyUUmCikY42wI0XiIHnrijKCy
         rzT8yT7yngP1vnlP0YeRUr5tNjjNKFluG5jds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yOTYAZZHsN9vSJiFSddF1i+Vhk1s4jxk8U4YBT4J2E=;
        b=LWWcjRC8kfNPeq5P6q7rkdxdBx8mhSPsf3ENq3rQAeOxzkdDuP2nPxmYK4fXI84mdy
         GXtqDSWfkbKjXtShUCeTykmY9GH8pFDEU6BYTjlYTDV7QSdoR+B3N1CqXN9ywsFE0uPp
         L04cEu4sDDDnE703aL7qGxIIZEjPqoAwtNdfS2BhKvhvBEAQI9tD4KBDCr5c1TrNEdwe
         ikjYINb45+7WiM6oF/l5aec85JfonE7/RDgkqxXzdTHNGyR0nm8DJx33rbb7gWJZoOG7
         fG7zMOXhixaB5OVOssXXYjBJXelxm3oI5F2jf2Z79exAbHZ/p294BkUWsy7EWggyAIaz
         fl7w==
X-Gm-Message-State: APjAAAXAXDY2QKXADKmKS7ioK3bDXrj3s1W08PVAcs9J9YQeG8ZXJ6Nh
        aLbT3vfq3s28luRSCaZSVOJXKtkI0oc=
X-Google-Smtp-Source: APXvYqyooCgosDaiez3MDchKqcWqCPpnVQKKA1nxeazWpssnUr2WKlYs1cOFgNljKYISAjgfEJe6Tg==
X-Received: by 2002:a67:1447:: with SMTP id 68mr17995860vsu.170.1559688507448;
        Tue, 04 Jun 2019 15:48:27 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 66sm2571520vko.27.2019.06.04.15.48.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 15:48:26 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id w44so8436605uad.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 15:48:26 -0700 (PDT)
X-Received: by 2002:ab0:4a97:: with SMTP id s23mr4142251uae.19.1559688506041;
 Tue, 04 Jun 2019 15:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190604222939.195471-1-swboyd@chromium.org> <20190604223700.GE4814@minitux>
In-Reply-To: <20190604223700.GE4814@minitux>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Jun 2019 15:48:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W08iWhbM_aDjhrz0Rm5O-Gbn6DVFNcWK5X6AB2W9YiLw@mail.gmail.com>
Message-ID: <CAD=FV=W08iWhbM_aDjhrz0Rm5O-Gbn6DVFNcWK5X6AB2W9YiLw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Add iommus property to qup1
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 4, 2019 at 3:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 04 Jun 15:29 PDT 2019, Stephen Boyd wrote:
>
> > The SMMU that sits in front of the QUP needs to be programmed properly
> > so that the i2c geni driver can allocate DMA descriptors. Failure to do
> > this leads to faults when using devices such as an i2c touchscreen where
> > the transaction is larger than 32 bytes and we use a DMA buffer.
> >
>
> I'm pretty sure I've run into this problem, but before we marked the
> smmu bypass_disable and as such didn't get the fault, thanks.
>
> >  arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> >  arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> >
> > Add the right SID and mask so this works.
> >
> > Cc: Sibi Sankar <sibis@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index fcb93300ca62..2e57e861e17c 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -900,6 +900,7 @@
> >                       #address-cells = <2>;
> >                       #size-cells = <2>;
> >                       ranges;
> > +                     iommus = <&apps_smmu 0x6c0 0x3>;
>
> According to the docs this stream belongs to TZ, the HLOS stream should
> be 0x6c3.

Since you've already got the docs in front of you, how about looking
up the value for qup0 so we can fix both of 'em?

-Doug
