Return-Path: <linux-arm-msm+bounces-67215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC01B16C3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49E01770E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 06:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132F828D8C1;
	Thu, 31 Jul 2025 06:56:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1B1C32;
	Thu, 31 Jul 2025 06:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753944962; cv=none; b=SRDoi8cUD8Gm3WV5R09FYSwXwE5OzbND5IT9F3BKGJe/jPacCKilWtBphYCHZ1nw5ttq3EtXZWdZCnByzFa5TG3n1a1MoSM/0NhAC2+VzA9EGPxisP1wfNnvaj4wbqaE/glPRPFLWTYKNujDpS7sJhHMUFa5YVxJnGVJijjTXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753944962; c=relaxed/simple;
	bh=NdRCdPyCDT7+3Beh4tRgSMC8U8W49V6nKu2amsff9P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv2sJIcsyBguIYrZZk2DQ0UnF0UnWXLPfawyYiDFGV5hO/6YuhgR4hvOYWvZ7K5eLOAxSRKM/rwANjcgJ84G/gmiRB43eo8A3kmie+BCE+ryPVp7j/937OfiQeK12D7y4L51iObm8sifuWVEfYsZUpZW7I7bMrZjSjY0sYbaExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7B5C4CEEF;
	Thu, 31 Jul 2025 06:56:00 +0000 (UTC)
Date: Thu, 31 Jul 2025 08:55:58 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH 0/2] dt-bindings: ufs: qcom: Split SC7280 and similar
 into separate file
Message-ID: <20250731-agile-sepia-raccoon-c40caa@kuoka>
References: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
 <df8b3c85-d572-4cee-863b-35fe6a5ed9ff@quicinc.com>
 <6ebe7084-bb00-4fac-b64d-e08e188f3005@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ebe7084-bb00-4fac-b64d-e08e188f3005@kernel.org>

On Wed, Jul 30, 2025 at 04:25:06PM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2025 15:53, Nitin Rawat wrote:
> > 
> > 
> > On 7/30/2025 6:05 PM, Krzysztof Kozlowski wrote:
> >> The binding for Qualcomm SoC UFS controllers grew and it will grow
> >> further.  It already includes several conditionals, partially for
> >> difference in handling encryption block (ICE, either as phandle or as IO
> >> address space) but it will further grow for MCQ.
> >>
> >> See also: lore.kernel.org/r/20250730082229.23475-1-quic_rdwivedi@quicinc.com
> >>
> >> The question is whether SM8650 and SM8750 should have their own schemas,
> >> but based on bindings above I think all devices here have MCQ?
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > 
> > Hi Krzysztof,
> > 
> > If I understand correctly, you're splitting the YAML files based on MCQ 
> > (Multi-Circular Queue) support:
> 
> Not entirely, I don't know which devices support MCQ. I split based on
> common parts in the binding.

I found the docs, so I'll send v2 with MCQ also separated.

Best regards,
Krzysztof


