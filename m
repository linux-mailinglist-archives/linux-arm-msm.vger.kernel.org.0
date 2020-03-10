Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCAAE180AFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 22:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbgCJV5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 17:57:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45267 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgCJV5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 17:57:51 -0400
Received: by mail-pl1-f195.google.com with SMTP id b22so54073pls.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qYdxwwwpYm23LuoOol66JOS31vLZfpo3MXiCkbyPzr8=;
        b=U+DI/gmeBVvE0NZblYAgaOZPjifrN5fk+p5gpLgDTyfGPTvgXLQ9vkTEgIGJXF4uJL
         Fd952FkPe2/jNEyATMsvJrqqJ6kZ+XFOunzZ92lTnwRcgI7Pa8CXnOyw7Qb8CEESpM7G
         WfgtTQ5XY2rs03J4e6y3h1z8ES9S3LYFcA/sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qYdxwwwpYm23LuoOol66JOS31vLZfpo3MXiCkbyPzr8=;
        b=taysJ9z0Rkxdq6b6Jme7Z+NdK5h6LoEWJRGLoENiWFmQg8avhoerBFY9WteEX4vWgK
         SdrBt4XyBGXDeXZA6PQL+oNuxtroGHZov2F9b9+hvd4VoYEF6CjvX//hN8uiDcmo0Dzs
         bt9ZQv+P00wkcsrdtQ76eWrUnlXxcjKaAGEMhijsskGsziAYZEZ6TY71mZXZq9t138AE
         lc7ebzHhfvv9HXNSpkcr9oVSLTHYMicNqJVVGc+krd3R7G1RGn+47vpPBg+zmoamuRPe
         F7hvXQlb4jTZydDgH0VsSdvhmoDsrycPv1kAbJ2Fqg/oJju5gMPot6RYUGD7Ge984GlS
         L8Jw==
X-Gm-Message-State: ANhLgQ2z7p5i+OhcGWmv3OTX+3MsZP3/MoXRF9vfbXlq4kePws7i/ejX
        k7gP3+yyuGWBhozj/+cPjLf8VA==
X-Google-Smtp-Source: ADFU+vuBaEaTeYfHN/Q5va1wjqReuMLDH16k2pXg+pd13QFSJEnP/TcDz8IkAB3cuekA2ZHVICXqlg==
X-Received: by 2002:a17:90a:8c0f:: with SMTP id a15mr58797pjo.156.1583877468981;
        Tue, 10 Mar 2020 14:57:48 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id mr7sm3122253pjb.12.2020.03.10.14.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 14:57:48 -0700 (PDT)
Date:   Tue, 10 Mar 2020 14:57:46 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, swboyd@chromium.org
Subject: Re: [PATCH V4 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
Message-ID: <20200310215746.GZ24720@google.com>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org>
 <1581932212-19469-4-git-send-email-akashast@codeaurora.org>
 <20200218190731.GC15781@google.com>
 <ec5de895-3e86-811e-7ffc-fb98e115f850@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ec5de895-3e86-811e-7ffc-fb98e115f850@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Akash,

The patch that implements the binding landed in tty/tty-next:

9fa3c4b1fa379 tty: serial: qcom_geni_serial: Fix GPIO swapping with workaround

The binding needs a re-spin to match the implementation.

Thanks

Matthias

On Wed, Feb 19, 2020 at 06:51:35PM +0530, Akash Asthana wrote:
> Hi Matthias,
> 
> On 2/19/2020 12:37 AM, Matthias Kaehlcke wrote:
> > Hi Akash,
> > 
> > I didn't see a patch that implements the binding, did you post it?
> 
> We haven't posted any update on patch@
> https://patchwork.kernel.org/cover/11313817/
> 
> [tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register]. We
> will spin it ASAP.
> 
> > 
> > 
> > On Mon, Feb 17, 2020 at 03:06:52PM +0530, Akash Asthana wrote:
> > > Add documentation to support RX/TX/CTS/RTS pin swap in HW.
> > > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > >   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> > > index 11530df..7e4b9af 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
> > > @@ -165,6 +165,15 @@ patternProperties:
> > >             - description: UART core irq
> > >             - description: Wakeup irq (RX GPIO)
> > > +      rx-tx-swap:
> > > +        description: RX and TX pins are swap.
> > s/swap/swapped/
> Ok
> > 
> > > +
> > > +      cts-rts-swap:
> > > +        description: CTS and RTS pins are swap.
> > s/swap/swapped/
> Ok
> > 
> > > +
> > > +      rx-tx-cts-rts-swap:
> > > +        description: RX-TX and CTS-RTS both pairs are swap.
> > I don't think this option adds much value, if both pairs are swapped
> > the above two properties can be set.
> 
> Yeah ok, It is possible to derive value for rx-tx-cts-rts if above 2
> properties are set.
> 
> > 
> > > +
> > >       required:
> > >         - compatible
> > >         - interrupts
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
> 
> Thanks for reviewing,
> 
> 
> Regards,
> 
> Akash
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
