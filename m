Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B18814BE01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 17:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgA1QrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 11:47:10 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38660 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgA1QrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 11:47:09 -0500
Received: by mail-qk1-f193.google.com with SMTP id k6so13992529qki.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZPnlKwuM4FAz94w/wTgs9ztHjlDWDu7abUtUf/0TNY=;
        b=g7Y1ZJ7xc9te/oiwLwAst1C/S6DT7qk70e9sQ2tkGD45oeiloTH8UFUxEbsmy5S9D+
         OUmrTYVC+RIsMWaP1pzTEPyHTVHVnHbUzZRtKqx3sNMLD9+6cBnlq+kVYdboPhlxpYRP
         fxVqUgqfYh30gHjir50S8jj9dVmigWcAkKgf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZPnlKwuM4FAz94w/wTgs9ztHjlDWDu7abUtUf/0TNY=;
        b=Ks3rW9GT754z3ivX1LO9DnAguD1POv3Ccff6W024fHPKOK9cBIAedxJZmtT14SCPvq
         /whpnkwtru+GKBab87+H4HbfnS6ijOJ9m5804tXVFlxfnYX9TzQRuSYazvTV/QvZY5og
         lTHU8e4XwU8FSK0lvYn2ZQlyUNFXKjshosseTrKrSxkzUAXMg5dh79TPQ66WxrpAYCqo
         iqCb2eDdb085EuRLXbUxtPsphuJKOPVXSwCmKQszz2KPnD8oxcCqhJ0k7u+kCIIuRfHB
         NSINjkjlQICklMQPv/PG9QfhB1qgJaJFFI+inI26G2m9hYUz8S7fPh7QBlP18lORSeoi
         ICmg==
X-Gm-Message-State: APjAAAWjS8ybM/8KBUWZyKTB6LmPbivpfKBzfoBxuV4DtZUHzg3yLTli
        cIOlmPBzTQyiofj9ADX9e2HrQtvbC/Q=
X-Google-Smtp-Source: APXvYqydN5UIWNh7lZfjKjm2ZUKocQZ4Wsg2WyUrfXgs71wTQXNGvwxiw/ey2ZjQy3dcL/3KkwhkJQ==
X-Received: by 2002:a05:620a:2182:: with SMTP id g2mr22834590qka.123.1580230028621;
        Tue, 28 Jan 2020 08:47:08 -0800 (PST)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id o17sm12645848qtq.93.2020.01.28.08.47.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 08:47:08 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id n8so6542011qvg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:47:08 -0800 (PST)
X-Received: by 2002:a67:fa1a:: with SMTP id i26mr1696397vsq.169.1580229618200;
 Tue, 28 Jan 2020 08:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid>
 <eeef68f4-127e-6d28-4a79-c1464a10c7db@codeaurora.org>
In-Reply-To: <eeef68f4-127e-6d28-4a79-c1464a10c7db@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Jan 2020 08:40:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtkX0XFSKvzvGBBjoqRwWfJowJrowkp74vfXawgt3aKw@mail.gmail.com>
Message-ID: <CAD=FV=WtkX0XFSKvzvGBBjoqRwWfJowJrowkp74vfXawgt3aKw@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: sc7180: Add clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:58 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Doug,
>
> Thanks for the patch.
>
> On 1/25/2020 4:12 AM, Douglas Anderson wrote:
> > From: Taniya Das <tdas@codeaurora.org>
> >
> > Add the display, video & graphics clock controller nodes supported on
> > SC7180.
> >
> > NOTE: the dispcc needs input clocks from various PHYs that aren't in
> > the device tree yet.  For now we'll leave these stubbed out with <0>,
> > which is apparently the magic way to do this.  These clocks aren't
> > really "optional" and this stubbing out method is apparently the best
> > way to handle it.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Added includes
> > - Changed various parent names to match bindings / driver
> >
> >   arch/arm64/boot/dts/qcom/sc7180.dtsi | 41 ++++++++++++++++++++++++++++
> >   1 file changed, 41 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 8011c5fe2a31..ee3b4bade66b 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -5,7 +5,9 @@
> >    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> >   #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> > +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
>
> My bad, but we are still missing the videocc header. I could send across
> the new patch.

Good point, thanks for noticing!  I won't spin with this right away as
we continue to discuss the driver / bindings patches.  If it turns out
that the rest of the series doesn't need to be spun I will be content
if Bjorn / Andy wants to make that fix when applying the patch, or I'm
happy to send a new patch.

-Doug
