Return-Path: <linux-arm-msm+bounces-20252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC78CC59D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 19:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F23C1F22E5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 17:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E001422D5;
	Wed, 22 May 2024 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="NdyuhZ7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05E1422C8;
	Wed, 22 May 2024 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399269; cv=none; b=uCUzI2myW+4lv9g4dkuJUIQnXfrPMDggHRN74G8JQ6/lK5JmmZoGuY5l7VHwm+JpUmy24eLT4dFfKuvu2WF5Cz/Cc14z6ksYn7YeBiueupU40OokMWaKyQHpPUkBjtXvEDkQsnV1dMGPv4OOi4uV/KFRRict26LELjqja50i3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399269; c=relaxed/simple;
	bh=sgZi3p6+Ujbhbh0wnjkTq4Cg1SkQ5TFVSBkMVQkT6zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ELYKcZr6sak/2iyObwQg5X8kxBMmXrpiJPhZvcktOSkNwKpXBJdTX1iVVHrTBTnrnW6npseX4JbXCDrUJT2HLQFT1Kc04CSrX97L7R+CH9H+sIHP3h+FvlE94vFwXY05u/NQk1kcb7ajjKPSKWMzDVZ8zRBmvWcr1p84lQ105aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=NdyuhZ7m; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1716399265; bh=sgZi3p6+Ujbhbh0wnjkTq4Cg1SkQ5TFVSBkMVQkT6zU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NdyuhZ7mpvBDPjLBkFhlcA25t2Mstyfkw79p+Yv3moIbz0CZc0b3Yky5RX4tVrvbL
	 3T3Vcfy2sv4AD+AZajnD2L8wdsyyBIhYySgpTrxoegyx/u7+Ii/PmpEi7KDr9e9/r0
	 80cJD9EX5NFLg6bQ83DUhqQF7Uy3G36odVnU3b20=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes
 instead of qcom,ipc
Date: Wed, 22 May 2024 19:34:23 +0200
Message-ID: <6253429.lOV4Wx5bFT@g550jk>
In-Reply-To: <12896bf6-412c-40af-9ad5-f9391ff81f63@kernel.org>
References:
 <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz> <5780452.DvuYhMxLoT@g550jk>
 <12896bf6-412c-40af-9ad5-f9391ff81f63@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Mittwoch, 22. Mai 2024 08:49:43 MESZ Krzysztof Kozlowski wrote:
> On 21/05/2024 22:35, Luca Weiss wrote:
> > On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
> >> On 20/05/2024 17:11, Luca Weiss wrote:
> >>> Hi Krzysztof
> >>>
> >>> Ack, sounds good.
> >>>
> >>> Maybe also from you, any opinion between these two binding styles?
> >>>
> >>> So first using index of mboxes for the numbering, where for the known
> >>> usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
> >>>
> >>> The second variant is using mbox-names to get the correct channel-mbox
> >>> mapping.
> >>>
> >>> -               qcom,ipc-1 = <&apcs 8 13>;
> >>> -               qcom,ipc-2 = <&apcs 8 9>;
> >>> -               qcom,ipc-3 = <&apcs 8 19>;
> >>> +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
> >>>
> >>> vs.
> >>>
> >>> -               qcom,ipc-1 = <&apcs 8 13>;
> >>> -               qcom,ipc-2 = <&apcs 8 9>;
> >>> -               qcom,ipc-3 = <&apcs 8 19>;
> >>> +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
> >>> +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
> >>
> >> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
> >> in first case?
> > 
> > Actually not, ipc-0 would be permissible by the driver, used for the 0th host
> > 
> > e.g. from:
> > 
> > 	/* Iterate over all hosts to check whom wants a kick */
> > 	for (host = 0; host < smsm->num_hosts; host++) {
> > 		hostp = &smsm->hosts[host];
> > 
> > Even though no mailbox is specified in any upstream dts for this 0th host I
> > didn't want the bindings to restrict that, that's why in the first example
> > there's an empty element (<0>) for the 0th smsm host
> > 
> >> Anyway, the question is if you need to know that some
> >> mailbox is missing. But then it is weird to name them "ipc-1" etc.
> > 
> > In either case we'd just query the mbox (either by name or index) and then
> > see if it's there? Not quite sure I understand the sentence..
> > Pretty sure either binding would work the same way.
> 
> The question is: does the driver care only about having some mailboxes
> or the driver cares about each specific mailbox? IOW, is skipping ipc-0
> important for the driver?

There's nothing special from driver side about any mailbox. Some SoCs have
a mailbox for e.g. hosts 1&2&3, some have only 1&3, and apq8064 even has
1&2&3&4.

And if the driver doesn't find a mailbox for a host, it just ignores it
but then of course it can't 'ring' the mailbox for that host when necessary.

Not sure how much more I can add here, to be fair I barely understand what
this driver is doing myself apart from the obvious.

Regards
Luca

> 
> 
> Best regards,
> Krzysztof
> 
> 





