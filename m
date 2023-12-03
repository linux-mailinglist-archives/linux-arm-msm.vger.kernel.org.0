Return-Path: <linux-arm-msm+bounces-3111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DAD80228C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7481C208C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AE328FC;
	Sun,  3 Dec 2023 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="SPC77Gh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C207F2;
	Sun,  3 Dec 2023 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701599894; bh=gfTmLjG+RDZIzwKoJm7kepCtpzSofJnZrPO/EdJCflY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SPC77Gh4dVLSLqgmBDzjfjEiCH0YAYA72E5Uqz01zs41j1FGhhKKokrq96cyY4lji
	 23C9vqjw9wUbaYKrvtMzXhLF2Q69T5gboN8coWA9Flf4LDIL8ueqoJbDpjiVyvavU2
	 +FSNkHc+iqOBM29PPUEG3J38MXZaMDG5i1s9EqWc=
From: Luca Weiss <luca@z3ntu.xyz>
To: Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/2] arm64: dts: qcom: msm8953: Set initial address for memory
Date: Sun, 03 Dec 2023 11:38:13 +0100
Message-ID: <2575326.iZASKD2KPV@z3ntu.xyz>
In-Reply-To: <t6ckvr7bcpoc3z4cam7bilp67nn6qyvrmnqch6tlkwug7n2neq@32f5mso75fvu>
References:
 <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
 <20231125-msm8953-misc-fixes-v2-1-df86655841d9@z3ntu.xyz>
 <t6ckvr7bcpoc3z4cam7bilp67nn6qyvrmnqch6tlkwug7n2neq@32f5mso75fvu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sonntag, 3. Dezember 2023 05:20:23 CET Bjorn Andersson wrote:
> On Sat, Nov 25, 2023 at 01:19:27PM +0100, Luca Weiss wrote:
> > The dtbs_check really doesn't like having memory without reg set.
> > 
> > The base address depends on the amount of RAM you have:
> >   <= 2.00 GiB RAM: 0x80000000
> >   
> >    = 3.00 GiB RAM: 0x40000000
> >    = 3.75 GiB RAM: 0x10000000
> >  
> >  (more does not fit into the 32-bit physical address space)
> > 
> > So, let's pick one of the values, 0x10000000 which is used on devices
> > with 3.75 GiB RAM. Since the bootloader will update it to what's present
> > on the device it doesn't matter too much.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  arch/arm64/boot/dts/qcom/msm8953.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> > b/arch/arm64/boot/dts/qcom/msm8953.dtsi index e7de7632669a..a3ba24ca599b
> > 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> > @@ -174,10 +174,10 @@ scm: scm {
> > 
> >  		};
> >  	
> >  	};
> > 
> > -	memory {
> 
> Wouldn't it be sufficient to add @0 here, to please dtbs_check?

The checker itself also seems to be okay with memory@0 and no other change,
but there's this warning with W=1

arch/arm64/boot/dts/qcom/msm8953.dtsi:177.11-181.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /soc@0)

So probably we should still try to put it at a reasonable address like
0x10000000?

Regards
Luca

> 
> Regards,
> Bjorn
> 
> > +	memory@10000000 {
> > 
> >  		device_type = "memory";
> >  		/* We expect the bootloader to fill in the reg */
> > 
> > -		reg = <0 0 0 0>;
> > +		reg = <0 0x10000000 0 0>;
> > 
> >  	};
> >  	
> >  	pmu {





