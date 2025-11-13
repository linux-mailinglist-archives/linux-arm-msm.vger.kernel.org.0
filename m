Return-Path: <linux-arm-msm+bounces-81687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A4C59557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6E43A1329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39A3590CE;
	Thu, 13 Nov 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd6klbLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7421357736;
	Thu, 13 Nov 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056635; cv=none; b=e2eDoI+q/s9hb4qi9fItvdKxnerPt/h2PmKBlUci3FiDQEo+ejRwu9GoDpSETayYGzCjQWKMy1bB0ZAli9U4RA/1ZVyg54ZRYMH6zf7n33/lXzkpu0oNk1jWac7QrooSaI/Dq1TFWwTrp/T16TqxU4Rc0CzzMWWneKzAzImcyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056635; c=relaxed/simple;
	bh=LKHZZvO2jHql3ksMJdLc/BWAsCltAd1QdFx3MtO4FOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEQednLIl7/HCeqzKLIGBSNFtaGx53Hz2eeuY3rBAK49BERyvHmIMcJQrfO5/I7YqIgogaAXzQEU5P6cOqwE7fTRiysnD2Uq/slVzhnh9Ejw3IJE8nsWLnMD8fvtqKsc/rbtxbIRleyorq9eF31U2sd8mLW/XO9MTtFuJlDHonQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd6klbLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550D7C19421;
	Thu, 13 Nov 2025 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763056635;
	bh=LKHZZvO2jHql3ksMJdLc/BWAsCltAd1QdFx3MtO4FOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nd6klbLcMqvMpiOb4KGbXZMnu1ps+D0i98PFnP2oFedbhFgeV7xyDjteXNJy/9dO2
	 whKX3d5CZHgBM4uQMUueH1mEORo7wGI1j86yhUsvaB+MxXMWIXxRUhsN2TacuZ8Hxy
	 rqo6qtCaAecZUXio3Ytt6oxn2qPuxbz7UQjjqbs29gechjlatv8+3Oj1uXJU+A5Ypr
	 K2CF6gB0zefc2PXYWO56ysq+4cCy9U8FhQbnPYyK0I63aL5g1FLPpZ3wAVMyL9X6So
	 yy5qwjzL0sES6JI/1cZjFmQrHKQ4XkxhuJ5bWyEtkqlAdwM6TmzPJ5Jzj3U6EJx3ua
	 iI7ZgHmoeZeiQ==
Date: Thu, 13 Nov 2025 12:01:37 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Kaanapali
Message-ID: <zi6jlw35clxwxtlshhjazbotv2wkfrbv3kkzgb76igirycxzak@3nujn2mvhjbh>
References: <20250924-knp-mfd-v1-1-6c8a98760e95@oss.qualcomm.com>
 <b623c7f6-f28f-49ba-b6f6-25084117a6b3@oss.qualcomm.com>
 <l4mb5pi7kz7uuq6o3eueoxl2ngt2sdd6dv3kyudw6i54co5v5h@w6ya2nuas322>
 <ad00835e-bc20-4f97-aba6-e1b4f5e97191@oss.qualcomm.com>
 <f2q7a7r7quq6pplcn3kklwrhdc6hxa5zvc7osygshtyurwyvi4@t5iyragt7irh>
 <b5ecf5e7-4dc4-41ac-9b56-7c52afacb950@oss.qualcomm.com>
 <01de9616-825b-4fbb-83cf-e0bf91e8cf39@oss.qualcomm.com>
 <81174278-c3c4-4dc6-856e-b58aa2cb6fea@oss.qualcomm.com>
 <br3fmilhh7fihv4atnf4olvy4w66z4p7sh4ypicuc3766ky6tb@pppfdynfhfz7>
 <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf706156-1413-42cb-a463-803063c347fc@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 06:03:33PM +0800, Aiqun(Maria) Yu wrote:
> On 11/12/2025 12:05 AM, Bjorn Andersson wrote:
> > On Tue, Nov 11, 2025 at 08:27:17PM +0800, Aiqun(Maria) Yu wrote:
> >> On 11/7/2025 12:24 AM, Konrad Dybcio wrote:
> >>> On 11/6/25 11:16 AM, Aiqun(Maria) Yu wrote:
> >>>> On 11/6/2025 5:06 AM, Bjorn Andersson wrote:
> >>>>> On Tue, Nov 04, 2025 at 01:35:01PM +0800, Jingyi Wang wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/4/2025 12:02 PM, Bjorn Andersson wrote:
> >>>>>>> On Tue, Nov 04, 2025 at 11:34:25AM +0800, Aiqun(Maria) Yu wrote:
> >>>>>>>> On 9/25/2025 7:23 AM, Jingyi Wang wrote:
> >>>>>>>>> Document the qcom,tcsr-kaanapali compatible, tcsr will provide various
> >>>>>>>>> control and status functions for their peripherals.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>>>>>>> ---
> >>>>>>>>>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> >>>>>>>>>  1 file changed, 1 insertion(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> index 14ae3f00ef7e..ae55b0a70766 100644
> >>>>>>>>> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> >>>>>>>>> @@ -48,6 +48,7 @@ properties:
> >>>>>>>>>            - qcom,tcsr-ipq8064
> >>>>>>>>>            - qcom,tcsr-ipq8074
> >>>>>>>>>            - qcom,tcsr-ipq9574
> >>>>>>>>> +          - qcom,tcsr-kaanapali
> >>>>>>>>
> >>>>>>>> It looks good to me. Glymur didn't have this functionality verified yet.
> >>>>>>>
> >>>>>>> You spelled Reviewed-by: Aiqun Yu <..> wrong.
> >>>>>>>
> >>>>>>>> Remind for review.
> >>>>>>>
> >>>>>>> No need for that, reviewers will review when they have time.
> >>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>> Hi Bjorn,
> >>>>>>
> >>>>>>>
> >>>>>>> But that said, most modern additions to this binding follow the common
> >>>>>>> format of qcom,<soc>-<block>.
> >>>>>>>
> >>>>>>> So I would prefer this to be qcom,kaanapali-tcsr.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Bjorn
> >>>>>>>
> >>>>>>
> >>>>>> qcom,tcsr-kaanapali is used to distinguish with binding for GCC:
> >>>>>> https://lore.kernel.org/all/20251030-gcc_kaanapali-v2-v2-2-a774a587af6f@oss.qualcomm.com/
> >>>>>>
> >>>>>
> >>>>> So, qcom,kaanapali-tcsr is the clock controller region of TCSR and
> >>>>> qcom,tcsr-kaanapali is the non-clock controller region of TCSR?
> >>>>>
> >>>>> Sorry for not understanding that earlier, but this doesn't work for me.
> >>>>>
> >>>>> It's a bit of a lie that TCSR_MUTEX is a separate node in devicetree,
> >>>>> but it's always an nice chunk of 256K in the beginning (or end in some
> >>>>> cases?) of TCSR. But for the rest, there should be a single tcsr node in
> >>>>> DeviceTree and that one node should be a syscon and a clock controller.
> >>>>
> >>>> I've been dive deeply on this tcsr block. And actually the tcsr clock
> >>>> controller part is a very small trunk size(0x1c) of the tcsr block. And
> >>>> this block have contain other multiple purposed sys registers. So maybe
> >>>> we can have a more discussion on how to have device tree node describe
> >>>> this situation? It is not straight forward that to have a non-tcsrcc
> >>>> related area being described in tcsrcc.
> >>>>
> >>>> What about option 1 (tcsr_mutex + tcsr_dload_syscon + tcsrcc):>> tcsr_mutex: hwlock@1f40000 {
> >>>> 	compatible = "qcom,tcsr-mutex";
> >>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> >>>> 	#hwlock-cells = <1>;
> >>>> };
> >>>>
> >>>> tcsr_dload: syscon@1fc0000 {
> >>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> >>>> 	reg = <0x0 0x1fc0000 0x0 0x30000>;
> >>>> };
> >>>>
> >>>> tcsrcc: clock-controller@1fd5044 {
> >>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> >>
> >> Remove "syscon" here. Not need for tcsrcc fallback to "syscon".
> >>
> >>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> >>>> ...
> >>>> };
> >>>>
> >>>> What about option 2 (tcsr whole block + tcsr_mutex  + tcsrcc):
> >>>>
> >>>> tcsr: syscon@1f40000 {
> >>>> 	compatible = "qcom,tcsr-kaanapali", "syscon";
> >>>> 	reg = <0x0 0x1f40000 0x0 0xC0000>; //align with the whole hardware
> >>>> block design.
> >>>> };
> >>>>
> >>>> tcsr_mutex: hwlock@1f40000 {
> >>>> 	compatible = "qcom,tcsr-mutex";
> >>>> 	reg = <0x0 0x01f40000 0x0 0x20000>;
> >>>> 	#hwlock-cells = <1>;
> >>>> };
> >>>>
> >>>> tcsrcc: clock-controller@1fd5044 {
> >>>> 	compatible = "qcom,kaanapali-tcsr", "syscon";
> >>
> >> Same here, don't need to have "syscon" here.
> >>
> >>>> 	reg = <0x0 0x01fd5044 0x0 0x1c>;
> >>>> ...
> >>>> };
> >>>
> >>> Is there anything wrong with what we have done for x1e80100?
> >>> ______________________
> >>> |             |       |
> >>> | TCSR_MUTEX  | mutex |
> >>> |_____________|_______|
> >>> |	      |       |
> >>> | RANDOM_REGS |       |
> >>> |_____________|       |
> >>> |	      |       |
> >>> | TCSR_CLKS   | tcsr  |
> >>> |_____________|       |
> >>> |	      |       |
> >>> | RANDOM_REGS |       |
> >>> |_____________|_______|
> >>>
> >>
> >> Second you! We can firstly have a option selected for kaanapali, and
> >> then other platform can be followed or fixed afterwards.
> >>
> >> Here suggest to have option 2 which is remove "syscon" from tcsr clocks,
> >> and only add the whole "syscon" to "tcsr" whole block.
> >>
> > 
> > I think you misunderstood Konrad, or perhaps I misunderstand you.
> 
> Maybe let Konrad help to explain more here. I thought the chart below is
> very clearly indicate the tcsr_clks is only part of the tcsr block.
> 

Yes, the TCSR clocks are controlled in the TCSR block, but there's no
"TCSR clocks"-IP-block in the memory map, it's just some registers in
the TCSR block.

And technically TCSR_MUTEX isn't a block of its own either, but so far
it's always been a clearly defined region of TCSR, either in the
beginning or end. (Might even be a separate block in the register map on
some older target, iirc)

> > 
> > This is what we have for Hamoa:
> > 
> > tcsr_mutex: hwlock@1f40000 {
> >         compatible = "qcom,tcsr-mutex";
> >         reg = <0 0x01f40000 0 0x20000>;
> >         #hwlock-cells = <1>;
> > };
> > 
> > tcsr: clock-controller@1fc0000 {
> 
> 
> It is not a clock-controller start from 0x1fc0000.
> 

Compare with GCC, the DeviceTree isn't saying "address X is a clock,
address Y is a reset, address Z is a GDSC...".

The DeviceTree says "at address A we have the Kaanapali GCC IP block",
and we can refer to it from other nodes as a clock controller, a
reset-controller, and a power-domain provider.


Same here, the DeviceTree should say that at 0x01fc0000 there is a
Kaanapali TCSR block, which is a "syscon", a clock controller and a
reset controller.

We don't know which operating system (or other implementation - e.g.
U-boot) will consume this information, and we don't know what frameworks
or driver model is implemented, so we need to describe things without
thinking of a particular driver model.

Regards,
Bjorn

