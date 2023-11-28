Return-Path: <linux-arm-msm+bounces-2248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E37FB705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13D0DB214E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5D94E1CA;
	Tue, 28 Nov 2023 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaHRUk0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FAD1841;
	Tue, 28 Nov 2023 10:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A7C433C7;
	Tue, 28 Nov 2023 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701166840;
	bh=RWQ4oqqgHJ3ICm2hpPKNYpjBIge+3p/xB+tOFDs5NMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaHRUk0ehNhq8VY3cH77WL9LJEMIls02t0rLxqblsykoX2aLe0T7ldvP5f2UEmXQP
	 LF0pjMGXvE8keZeRAIFmeGYuPLqK7ahQuamy1SbIQ0C5GK6eO4aNl3GQzazN0nDcse
	 WCRfqTndclieY7vIq57jBdizycgeQsGPmGN+m7Byqhbpq4JocPN5cH/LfttH+NOn9B
	 px9IHT9/1bIkKrJ/0rySpY1D8SYfH5JV+QKe3BPQQel4PXODhMGhQ0AEV2bWPY94IH
	 BisfxqYWGRMAPmjDbQcUXQHsBoUwerbC1mmQ4/TmB5KC/HASaYFhbEWBKRPq7S0gZP
	 zhSVeYPBRGVTQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r7vDI-0005YI-2G;
	Tue, 28 Nov 2023 11:21:08 +0100
Date: Tue, 28 Nov 2023 11:21:08 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
 <ZWCpGdJRexnk98IN@hovoldconsulting.com>
 <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>

On Fri, Nov 24, 2023 at 11:09:04PM +0530, Krishna Kurapati PSSNV wrote:
> >> Yes. From whatever targets I was able to find, only one of them didn't
> >> have the power_event irq. Rest all of them had. I will recheck that
> >> particular one again.
> > 
> > Please do. The driver polls the corresponding status register on all
> > platforms currently, and perhaps this interrupt can one day be used to
> > get rid of the polling.
> >   
> 
> Ok, I just rechecked and case is, I am not able to get my hands on the 
> doc. I can't say for sure that the target is missing the pwr_event 
> interrupt. I say we can safely add the target assuming pwr_event is 
> present for ipq9574. Every target so far even on downstream has this IRQ 
> present in hw.

Ok, good.

> >>> Now if the HS interrupt is truly unusable, I guess we can consider
> >>> dropping it throughout and the above becomes just three permutations
> >>> instead, which can even be expressed along the lines of:
> >>
> >> Infact, I wanted to do this but since you mentioned before that if HW
> >> has it, we must describe it, I kept it in. But since this functionality
> >> is confirmed to be mutually exclusive of qusb2/{dp/dm}, I am aligned to
> >> skip it in bindings and drop it in DT.
> > 
> > As I mentioned elsewhere, it depends on whether it can be used at all.
> > Not simply whether there is some other mechanism that can be used in its
> > stead. Such a decision should be left up to the implementation.
> > 
> > That's why I said "truly unusable" above. It's still not clear to me
> > whether that is the case or not.
> 
> I looked at the code of  4.4, 4.14/ 4.19/ 5.4/ 5.10/ 5.15/ 6.1 and none 
> of them implement the hs_phy_irq.

But again, that is completely irrelevant. As I've said numerous times
now, this is about what the hardware is capable of, not which
functionality a particular OS chooses to use.
 
> My opinion would be to keep the power_event irq as mandatory and not to 
> include the hs_phy_irq.

Ok, but you still need to explain why dropping hs_phy_irq is correct.

Until there's a clear answer to that, it seems we need to include it.

Johan

