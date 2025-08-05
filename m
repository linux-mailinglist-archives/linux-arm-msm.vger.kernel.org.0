Return-Path: <linux-arm-msm+bounces-67804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26745B1B92A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA61B3A6EFF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B29528980A;
	Tue,  5 Aug 2025 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il1NIPb2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB6C33997;
	Tue,  5 Aug 2025 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414380; cv=none; b=hKV+FwaVOn8ahPmnL8E912OC8+lMUkaJFrntc4b6trDfwoaYomx1N2Dd/EbIF6Cvozo2hUqMsyvV/Od2ATqJDniXg8diu6XD3x0CpCMY+kvShfKcHLUZf7YJea0Ne87EsAX+y2pc5lKILEeizzqV6Wqs9zd/NKbuPuUaMS5cgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414380; c=relaxed/simple;
	bh=G9jzao0XvDdFJG6QNvUtZEcvSs3c12S9EwM5DKhJV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyULWxUA+K9dcUNQmHNRGMSSB8a3NeGnzV78MQBih1hdnD2xGCM+0xir/GeZsoNUrbxEzO18QMBhTIHnpDKZgoJt41UYuyw/zVKtzOw2emiH7t1OdyoWhDrC4cu4KPNZLi0wEEkJY7bF3URniMBhiQqLNmU5sZTANyCHBW/NroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il1NIPb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79715C4CEF0;
	Tue,  5 Aug 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414377;
	bh=G9jzao0XvDdFJG6QNvUtZEcvSs3c12S9EwM5DKhJV/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=il1NIPb2c7kmBaU81lnxHO58DzIWyMrch4T0qnN4QvbQPZT8Lp8AAj7Tb77KRxuFb
	 GlXDr4sp8eP0AiNVtNy1dg8D9V4zQjdZy3KOA8ORUMMyYoRnB9ge2NrDQpVXaJYv1K
	 KOK3VyXOqgr7isMHDk6h+MhqKgcB6Ult3SpZ9bei9YuDCOlv2l9d/7g5RYX7nuK5hA
	 2Re/BcZf67IaAdp+LGojmUofxZxXX2bFB4Ygtt7kcvKD7R1WIxfV2uORmyiAFMyaZP
	 bRHMUQzd9uKgUhaMGcjQKKPeaQnNIwVhMQTsX/kegz6KobKpp4kE18GgdC9YiW4H2m
	 +Jf3TN2mv9+dg==
Date: Tue, 5 Aug 2025 22:49:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, agross@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Message-ID: <jeds52vrpznjgwjssy3dpyhpstqqy5ut6ag73p7tshapgxkdss@2ayh4mt2n4id>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
 <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
 <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
 <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>

On Tue, Aug 05, 2025 at 07:06:29PM GMT, Konrad Dybcio wrote:
> On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> > On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
> >> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> >>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
> >>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> >>>>>
> >>>>>
> >>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> >>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
> >>>>>>>> support automotive use cases that require limiting the maximum Tx/Rx HS
> >>>>>>>> gear and rate due to hardware constraints.
> >>>>>>>
> >>>>>>> What hardware constraints? This needs to be clearly documented.
> >>>>>>>
> >>>>>>
> >>>>>> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
> >>>>>> but keep on responding to other comments. This won't help you to get this series
> >>>>>> merged in any form.
> >>>>>>
> >>>>>> Please address *all* review comments before posting next iteration.
> >>>>>
> >>>>> Hi Mani,
> >>>>>
> >>>>> Apologies for the delay in responding. 
> >>>>> I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 
> >>>>>
> >>>>> To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.
> >>>>>
> >>>>
> >>>> That's vague and does not justify the property. You need to document
> >>>> instead hardware capabilities or characteristic. Or explain why they
> >>>> cannot. With such form I will object to your next patch.
> >>>>
> >>>
> >>> I had an offline chat with Ram and got clarified on what these properties are.
> >>> The problem here is not with the SoC, but with the board design. On some Qcom
> >>> customer designs, both the UFS controller in the SoC and the UFS device are
> >>> capable of operating at higher gears (say G5). But due to board constraints like
> >>> poor thermal dissipation, routing loss, the board cannot efficiently operate at
> >>> the higher speeds.
> >>>
> >>> So the customers wanted a way to limit the gear speed (say G3) and rate
> >>> (say Mode-A) on the specific board DTS.
> >>
> >> I'm not necessarily saying no, but have you explored sysfs for this?
> >>
> >> I suppose it may be too late (if the driver would e.g. init the UFS
> >> at max gear/rate at probe time, it could cause havoc as it tries to
> >> load the userland)..
> >>
> > 
> > If the driver tries to run with unsupported max gear speed/mode, it will just
> > crash with the error spit.
> 
> OK
> 
> just a couple related nits that I won't bother splitting into separate
> emails
> 
> rate (mode? I'm seeing both names) should probably have dt-bindings defines
> while gear doesn't have to since they're called G<number> anyway,

Yeah.

> with the
> bindings description strongly discouraging use, unless absolutely necessary
> (e.g. in the situation we have right there)
> 

There is no need to discourate its usage. But the description has to be clear in
such a way that the users should understand its purpose.

> I'd also assume the code should be moved into the ufs-common code, rather
> than making it ufs-qcom specific
> 

Both the dt-binding properties and relevant code should be moved to common
parts.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

