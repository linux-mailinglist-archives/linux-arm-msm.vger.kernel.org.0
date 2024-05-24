Return-Path: <linux-arm-msm+bounces-20419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4B8CE948
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86DF1C20A4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DEC381B9;
	Fri, 24 May 2024 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="e3bheGnR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73827364A9;
	Fri, 24 May 2024 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716573330; cv=none; b=oUBQecgFzIxfYTZTn4sfzvSZDLARbn1DMYX6RLjoPeolyUyv4c3PHKMartMWC18akeBBH521Od9ulJ5YhdDn+8lDAMf78/RrmELJ1Cokk6gbJ5hgDUf3Ug2rYbYXwtotnprSq40FAuNfFNaKGfefe4ifNCCXH6dKVkzxHvsJG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716573330; c=relaxed/simple;
	bh=NE3+asARG+T0s+9Kmlx2qtu/4uK3J6MB1QLPal+bElU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfdUOBh3xCt3ZTsW2Ydp5qoK8GrycEmNh/qrF1eJSftPhEBwHsUgKCpTdJXJGrLFi3LXiheS41MuzI3odRZUaPQmQ52hzJBI0WdIFNP9u9u1aizjX2nwaN3z7f1EezCYpEf1s0WgtBuuvoWrztAiupQGhdGUDqTwoqwITvYRbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=e3bheGnR; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1716573320; bh=NE3+asARG+T0s+9Kmlx2qtu/4uK3J6MB1QLPal+bElU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e3bheGnRdMoLMHBHDKhHLoteVK3Xh7+4NP0w86XYuAGLDLLBw8H46SyfBulhucqB5
	 BgUGEQDgh9nkQcyITUdUOb+wfWaoEeIopVp5qPCFzLJXjwx7tOaekJHv8Q+/p0hGiT
	 6/N02nnwkrdP9GXWmOnDFITmKg7aq7UfcWY4aJvo=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject:
 Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes
 instead of qcom,ipc
Date: Fri, 24 May 2024 19:55:19 +0200
Message-ID: <4881282.LvFx2qVVIh@g550jk>
In-Reply-To: <e4579702-089e-48cb-bf06-f8e4fb618050@kernel.org>
References:
 <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz> <5099926.GXAFRqVoOG@g550jk>
 <e4579702-089e-48cb-bf06-f8e4fb618050@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Donnerstag, 23. Mai 2024 08:19:11 MESZ Krzysztof Kozlowski wrote:
> On 23/05/2024 08:16, Luca Weiss wrote:
> > On Donnerstag, 23. Mai 2024 08:02:13 MESZ Krzysztof Kozlowski wrote:
> >> On 22/05/2024 19:34, Luca Weiss wrote:
> >>> On Mittwoch, 22. Mai 2024 08:49:43 MESZ Krzysztof Kozlowski wrote:
> >>>> On 21/05/2024 22:35, Luca Weiss wrote:
> >>>>> On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
> >>>>>> On 20/05/2024 17:11, Luca Weiss wrote:
> >>>>>>> Hi Krzysztof
> >>>>>>>
> >>>>>>> Ack, sounds good.
> >>>>>>>
> >>>>>>> Maybe also from you, any opinion between these two binding styles?
> >>>>>>>
> >>>>>>> So first using index of mboxes for the numbering, where for the known
> >>>>>>> usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
> >>>>>>>
> >>>>>>> The second variant is using mbox-names to get the correct channel-mbox
> >>>>>>> mapping.
> >>>>>>>
> >>>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
> >>>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
> >>>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
> >>>>>>> +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
> >>>>>>>
> >>>>>>> vs.
> >>>>>>>
> >>>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
> >>>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
> >>>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
> >>>>>>> +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
> >>>>>>> +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
> >>>>>>
> >>>>>> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
> >>>>>> in first case?
> >>>>>
> >>>>> Actually not, ipc-0 would be permissible by the driver, used for the 0th host
> >>>>>
> >>>>> e.g. from:
> >>>>>
> >>>>> 	/* Iterate over all hosts to check whom wants a kick */
> >>>>> 	for (host = 0; host < smsm->num_hosts; host++) {
> >>>>> 		hostp = &smsm->hosts[host];
> >>>>>
> >>>>> Even though no mailbox is specified in any upstream dts for this 0th host I
> >>>>> didn't want the bindings to restrict that, that's why in the first example
> >>>>> there's an empty element (<0>) for the 0th smsm host
> >>>>>
> >>>>>> Anyway, the question is if you need to know that some
> >>>>>> mailbox is missing. But then it is weird to name them "ipc-1" etc.
> >>>>>
> >>>>> In either case we'd just query the mbox (either by name or index) and then
> >>>>> see if it's there? Not quite sure I understand the sentence..
> >>>>> Pretty sure either binding would work the same way.
> >>>>
> >>>> The question is: does the driver care only about having some mailboxes
> >>>> or the driver cares about each specific mailbox? IOW, is skipping ipc-0
> >>>> important for the driver?
> >>>
> >>> There's nothing special from driver side about any mailbox. Some SoCs have
> >>> a mailbox for e.g. hosts 1&2&3, some have only 1&3, and apq8064 even has
> >>> 1&2&3&4.
> >>>
> >>> And if the driver doesn't find a mailbox for a host, it just ignores it
> >>> but then of course it can't 'ring' the mailbox for that host when necessary.
> >>>
> >>> Not sure how much more I can add here, to be fair I barely understand what
> >>> this driver is doing myself apart from the obvious.
> >>
> >> From what you said, it looks like it is enough to just list mailboxes,
> >> e.g. for ipc-1, ipc-2 and ipc-4 (so no ipc-0 and ipc-3):
> > 
> > No, for sure we need also the possibility to list ipc-3.
> 
> ? You can list it, what's the problem>

Maybe we're talking past each other...

You asked why this wouldn't work:

  e.g. for ipc-1, ipc-2 and ipc-4 (so no ipc-0 and ipc-3):
  mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;

How would we know that the 3rd mailbox (&apcs 19) is for the 4th host
(previous ipc-4)?

1. If we use mboxes with indexes we'd need to have <0> values for
"smsm hosts" where we don't have a mailbox for - this is at least
for the 2nd smsm host (qcom,ipc-2) for a bunch of SoCs.

2. If we use mboxes with mbox-names then we could skip that since we
can directly specify which "smsm host" a given mailbox is for.

My only question really is whether 1. or 2. is a better idea.

Is this clearer now or still not?


> 
> > 
> > And my point is that I'm not sure if any platform will ever need ipc-0, but
> > the code to use that if it ever exists is there - the driver always
> > tries getting an mbox (currently just syscon of course) for every host
> > from 0 to n.
> > 
> > These are the current (non-mbox-API) mboxes provided to smsm:
> > 
> > $ git grep qcom,ipc- arch/
> > arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-1 = <&l2cc 8 4>;
> > arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-2 = <&l2cc 8 14>;
> > arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-3 = <&l2cc 8 23>;
> > arch/arm/boot/dts/qcom/qcom-apq8064.dtsi:               qcom,ipc-4 = <&sps_sic_non_secure 0x4094 0>;
> > arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-1 = <&apcs 8 13>;
> > arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-2 = <&apcs 8 9>;
> > arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:               qcom,ipc-3 = <&apcs 8 19>;
> > arch/arm64/boot/dts/qcom/msm8916.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> > arch/arm64/boot/dts/qcom/msm8916.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> > arch/arm64/boot/dts/qcom/msm8939.dtsi:          qcom,ipc-1 = <&apcs1_mbox 8 13>;
> > arch/arm64/boot/dts/qcom/msm8939.dtsi:          qcom,ipc-3 = <&apcs1_mbox 8 19>;
> > arch/arm64/boot/dts/qcom/msm8953.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> > arch/arm64/boot/dts/qcom/msm8953.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> > arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-1 = <&apcs 8 13>;
> > arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-2 = <&apcs 8 9>;
> > arch/arm64/boot/dts/qcom/msm8976.dtsi:          qcom,ipc-3 = <&apcs 8 19>;
> > 
> >>
> >> mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
> 
> So which case is not covered?
> 
> Best regards,
> Krzysztof
> 
> 





