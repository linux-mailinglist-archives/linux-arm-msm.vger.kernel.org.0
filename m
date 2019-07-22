Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE3701B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 15:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbfGVNt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 09:49:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729765AbfGVNt4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 09:49:56 -0400
Received: from localhost (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1025A217D6;
        Mon, 22 Jul 2019 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563803395;
        bh=kiCmXCKvby1H1WJP4xaxHNNI/5PaIgIgvlk9OyS/mRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=db5S+CmxK6X8ougjI8sXCVeQ2k5sbXR+6KMQNeoiP5yF61935v/k4Crme7oZlJld6
         8JmfnxD9lPLjG71DTMC5dYMcNqBmIEL+UxTdk0EOlUsydrUAi75jS9quRfJsBPkI7C
         KAHTmpJkU55YVkjc0wejF6Qe5bPHZa2MS8iFNdM8=
Date:   Mon, 22 Jul 2019 19:18:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
Message-ID: <20190722134843.GR12733@vkoul-mobl.Dlink>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-5-vkoul@kernel.org>
 <a100cb6e-78d0-8fde-131a-2b10f9f0819d@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a100cb6e-78d0-8fde-131a-2b10f9f0819d@free.fr>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-19, 15:18, Marc Gonzalez wrote:
> On 22/07/2019 14:34, Vinod Koul wrote:
> 
> > Unit name is supposed to be a number, using a macro with hex value is
> > not recommended, so add the value in unit name.
> > 
> > arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading "0x"
> > arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading 0s
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > index 051a52df80f9..d76c8377c224 100644
> > --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> > @@ -78,7 +78,7 @@
> >  			#size-cells = <0>;
> >  			#io-channel-cells = <1>;
> >  
> > -			adc-chan@ADC5_DIE_TEMP {
> > +			adc-chan@6{
> 
> You dropped the space before the {

Oops, will fix it up, thanks for pointing!

-- 
~Vinod
