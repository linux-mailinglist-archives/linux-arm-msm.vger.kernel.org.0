Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837401CA807
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 12:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgEHKPA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Fri, 8 May 2020 06:15:00 -0400
Received: from relay-2.mailobj.net ([213.182.54.5]:57668 "EHLO
        relay-2.mailobj.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgEHKPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 06:15:00 -0400
X-Greylist: delayed 513 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 May 2020 06:14:59 EDT
Received: from v-1.localdomain (v-1.in.mailobj.net [192.168.90.191])
        by relay-2.mailobj.net (Postfix) with SMTP id 9444E1260;
        Fri,  8 May 2020 12:06:24 +0200 (CEST)
Received: by ip-25.net-c.com [213.182.54.25] with ESMTP
        Fri,  8 May 2020 12:06:54 +0200 (CEST)
X-EA-Auth: JUxpYiSKTpkM9V+rU9V0BU8epqnXhebRD8yjIF7jR1pZKnJA2GA5WdqvQBqCGcWMtdmrVddBC9U8ArbU/gIAaADoMi9lxTmxhCg4+3N3sF0=
Message-ID: <f9413ee5ca2fb0d85015f8b5988cbc61418e50f0.camel@mailoo.org>
Subject: Re: [PATCH v3 0/2] Add Qualcomm MSM8939 GCC binding and driver
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Konrad Dybcio <konradybcio@gmail.com>
Date:   Fri, 08 May 2020 12:06:23 +0200
In-Reply-To: <90cda746-2caa-cb79-9304-17a97886f1fc@linaro.org>
References: <20200423103406.481289-1-bryan.odonoghue@linaro.org>
         <e9d181a9-938c-a69b-8325-2aabeefd0934@nexus-software.ie>
         <90cda746-2caa-cb79-9304-17a97886f1fc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le jeudi 07 mai 2020 à 17:06 +0100, Bryan O'Donoghue a écrit :
> On 07/05/2020 16:57, Bryan O'Donoghue wrote:
> > On 23/04/2020 11:34, Bryan O'Donoghue wrote:
> > > V3:
> > > This update removes the old clock name arrays which I forgot to prune in
> > > the previous V2.
> > > 
> > > git diff bod/clk-next+msm8939 bod/clk-next+msm8939-v2.1
> > 
> > I should have mentioned.
> > 
> > If you want to test this you'll need to do the following to your 
> > msm8939.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi 
> > b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > index 996425a70014..2d54ad7f99b6 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> > @@ -673,6 +673,10 @@ gcc: clock-controller@1800000 {
> >                          reg = <0x1800000 0x80000>;
> > +                       clock-names = "xo",
> > +                                     "sleep_clk";
> > +                       clocks = <&xo_board>,
> > +                                <&sleep_clk>;
> >                  };
> > 
> > "xo" and "sleep_clk" names can be resolved.
> > 
> > ---
> > bod
> 
> and this...
> 
> clocks {
>      xo_board: xo_board {
>          compatible = "fixed-clock";
>          #clock-cells = <0>;
>          clock-frequency = <19200000>;
>      };
> 
>      sleep_clk: sleep_clk {
>          compatible = "fixed-clock";
>          #clock-cells = <0>;
>          clock-frequency = <32768>;
>      };
> };
> 

Thank you, works for me over v5.7-rc2 with an Alcatel Idol 3 (5.5").

Tested-by: Vincent Knecht <vincent.knecht@mailoo.org>



