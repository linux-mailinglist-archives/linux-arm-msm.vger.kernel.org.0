Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9651525295D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 10:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgHZIl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 04:41:28 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:16638 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgHZIlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 04:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598431280;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MzchAeja0jhJdsQle33hb0rxs0PfxumQcdXnX+NQdaU=;
        b=lDku1tLiDOx+k9RlcEHcgMuVTVWN01vUXwptskb62e3ekrOkmZ326PZQwZ6yTaRVkG
        BbU46f+qh+dYg8MR7qfLcyJpGCmScPPl4GWr63BX4uqAAkX09xPirmILmcrsemub30nZ
        sG7FUaVolt6zvhvvghcCY8uSGoo/Vmt71trw/JoQ4celiba/ETmSBb/YLwGeOh5Z23eq
        yUveRSDSHfCzhlpKKkzqBibYQxejJOsJ0IvzRZefSVlNfMGcEq3oQqlTDrgxLvpto8O0
        KbaTtp/Sdwulu1OIEJclM2rKZTUSv1aiDdNmdf5cInRcwNIRJVqbjUmAUm2De6z5XR0E
        eOMQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7Q8fJkcs
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Aug 2020 10:41:19 +0200 (CEST)
Date:   Wed, 26 Aug 2020 10:41:18 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Message-ID: <20200826084118.GB869@gerhold.net>
References: <20200819091533.2334-1-stephan@gerhold.net>
 <20200819091533.2334-2-stephan@gerhold.net>
 <20200825215253.GA1397515@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825215253.GA1397515@bogus>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 25, 2020 at 03:52:53PM -0600, Rob Herring wrote:
> On Wed, Aug 19, 2020 at 11:15:32AM +0200, Stephan Gerhold wrote:
> > In some cases we need to probe additional audio components that do
> > not appear as part of the DAI links specified in the device tree.
> > Examples for this are auxiliary devices such as analog amplifiers
> > or codecs.
> > 
> > To make them work they need to be added as part of "aux-devs"
> > and connected to some other audio component using the audio routes
> > configurable using "(qcom,)audio-routing".
> > 
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
> >  Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
> >  Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
> >  3 files changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > index 84b28dbe9f15..23998262a0a7 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
> > @@ -34,6 +34,13 @@ Required properties:
> >  			  * DMIC
> >  			  * Ext Spk
> >  
> > +Optional properties:
> > +
> > +- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
> > +			  amplifiers) that do not appear directly within the DAI
> > +			  links. Should be connected to another audio component
> > +			  using "qcom,audio-routing".
> > +
> >  Dai-link subnode properties and subnodes:
> >  
> >  Required dai-link subnodes:
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > index c814e867850f..248df5056fec 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > +++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
> > @@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
> >  	Value type: <stringlist>
> >  	Definition: The user-visible name of this sound card.
> >  
> > +- aux-devs
> > +	Usage: optional
> > +	Value type: <phandles with arguments>
> 
> How do you know how many arguments? It either has to be fixed or needs a 
> #.*cells in the phandles. For the latter, you'd need to come up with a 
> common binding.
> 

Actually the phandle should not have any arguments, seems like I just
copied this from some other entry. Will fix this, thank you!

Stephan
