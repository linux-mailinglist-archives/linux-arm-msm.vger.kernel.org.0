Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1433F620D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 17:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbhHXPxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 11:53:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:20915 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238487AbhHXPxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 11:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629820163;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Z/5zWNp0e+XXevjZGGIjoXisq5NlaUH+55xKsFFvgjA=;
    b=qMfJSybJDcqmJaJ0zJVIfFYndAkBTZ4r9p8IVFbjdd5mdaAVMz4DMDeu53/zqOg6B+
    D4EZxZxkpZo9dNwmcxqR0UFQCulMfP2WmK4eaHCtXGI+3ytCOt8fUxgj2XAfIXedTDFJ
    GKjBwJozxuJEsvAppKmpqkkhB71MzXMv8n61CO09kAJsvlMoqWFmTZd+TXY4VcRYSVCV
    3JQrqIYS1XhqA7dGkelaPt1T7Bu9DzVsLbFFqcmZ8Qa1L/UvzpLNWcjODJP3EyBWTQs8
    29L+kNjpHTG49GBoEdkLzc+ZGmjF2DsF3wwPJ2KEmxqpsGY1AVowIA7i6/AFTMCS9qTj
    jgiA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8puK1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id L01e9cx7OFnMmOL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 24 Aug 2021 17:49:22 +0200 (CEST)
Date:   Tue, 24 Aug 2021 17:49:18 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        An?bal Lim?n <anibal.limon@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: db410c: Update firmware-name for wcnss
 and mpss
Message-ID: <YSUU/r9OdK5OtNNn@gerhold.net>
References: <20200108055735.660475-1-bjorn.andersson@linaro.org>
 <20210217223406.1422005-1-anibal.limon@linaro.org>
 <CAA8EJpqXyQCFGgTRk+dqxD6TdJycLeGx4EQ0OBov5_3hVogM1g@mail.gmail.com>
 <YSUGLFx2QST9vgIU@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSUGLFx2QST9vgIU@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 24, 2021 at 07:46:04AM -0700, Bjorn Andersson wrote:
> On Tue 24 Aug 05:39 PDT 2021, Dmitry Baryshkov wrote:
> 
> > On Thu, 18 Feb 2021 at 01:38, Aníbal Limón <anibal.limon@linaro.org> wrote:
> > >
> > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > Enable the mpss remoteproc node and specify the firmware-name for this
> > > and the wcnss remoteproc on the Dragonboard 410c.
> > >
> > > Link: https://lore.kernel.org/r/20200108055735.660475-1-bjorn.andersson@linaro.org
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > [rebased and moved to use pronto label]
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > Tested-by: Aníbal Limón <anibal.limon@linaro.org>
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> 
> Thanks Dmitry, not sure why this hasn't been merged yet.
> 

This patch keeps getting stuck for some reason.
It was sent several times already but always forgotten. :)

> Taking a further look at this I noticed that we never pushed the
> firmware to linux-firmware either, which I think was because we where
> uncertain of the directory structure at the time - a discussion which
> has been settled since.
> 
> > > ---
> > >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > index 3c7f97539390..8f1ada75d3ed 100644
> > > --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> > > @@ -301,6 +301,11 @@ &lpass {
> > >         status = "okay";
> > >  };
> > >
> > > +&mpss {
> > > +       status = "okay";
> > > +       firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mdt";
> 
> But if we're pushing things to linux-firmware, does anyone object
> against following the existing style and squashing the mdt+bNN files
> into .mbn (and thereby making this modem.mbn and below wcnss.mbn)?
> 

You made this change in some version already :)
https://lore.kernel.org/linux-arm-msm/20210312003318.3273536-6-bjorn.andersson@linaro.org/

I think there was no real objection back then but more confusion about
how to get the squashed .mbn variant. Having it in linux-firmware would
certainly make it a lot easier overall if you can make that happen. :)

The latest version of this patch that I am aware of is the following one:
https://lore.kernel.org/linux-arm-msm/20210531224453.783218-1-bjorn.andersson@linaro.org/

As I wrote there it's mainly stuck on getting the related wcn36xx patch [1]
merged. Can you resend that one maybe?

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20210312003318.3273536-3-bjorn.andersson@linaro.org/
