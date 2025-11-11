Return-Path: <linux-arm-msm+bounces-81322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582BC4FA73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 20:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16923B079B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 19:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DCA3A5E8F;
	Tue, 11 Nov 2025 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lh2lGBcV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE08E3385B9;
	Tue, 11 Nov 2025 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890992; cv=none; b=AcQ8jx5cMpdo0MwxRn1FI6uRYdzfiU6BsFdB6Cn2mzDDT/ePoqsKLIhGf1QW1kFYcits6z2xTVph3P5scltd4MDY76Sv3q57Har1lbMfxo3d9j7ZNePxl1PIRgXbSt4ILqfBX3DVwVBoHXNm3E4GcoM2WosEQ9ZoiyHu11B3vDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890992; c=relaxed/simple;
	bh=JBRmwot3y2dmJnDCYjDaLSw3pBD+HA8/baatgNi9Gck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpPuIJJbdfP7eP/HAqOmql2IT3b4UCqfmI4VNl7aJPeaRnfz9gPsmY+sNDGydJ5iQTCVP77US/O9q43iYHokxdz7lVyN6n7ENc6iEkL4OntIogXfUDiQOjyWlp8D6QSgBxIfX6VFecp2A//QGETJodBxkKGIGIQMdQOZzrBPXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lh2lGBcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71964C4CEF7;
	Tue, 11 Nov 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762890992;
	bh=JBRmwot3y2dmJnDCYjDaLSw3pBD+HA8/baatgNi9Gck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lh2lGBcV98LMEbj2W7WA7m++0rlgiA06DUcn64mUFiGRBEzSHA3ObbYefpePkEVa3
	 S8lbAw525l6LwWQMzc6J9flBfSOvwVfmcK+qQLDwvVDB7TANEX7b8mMCtH57SzsgvA
	 2UCyzf4tNzx0aFc0u8hk/B0LIXHMsBhhSFVx5PXxT8Hy5vn48EjHPygZU5UzYHMLLA
	 c/mqHqUpxExm7IuhubeYMUYamKgeUy6CsNjpJWgXHe/SDHtxXAJ1nPQAUa/3ZjA+C0
	 1nK8Ftv3qZhnHyQwp/ZKhw8bCMQ/8NmhuZI2HskWyYXRebvker12IjKNfYV9cVAVBN
	 bb1HPxcpvHSMA==
Date: Tue, 11 Nov 2025 14:00:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	"Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back
 resource settings
Message-ID: <7larzpksbafl5wc66s6uhufnm6qtvjtzqb7uqlkakqyhvjfqkq@ryp2qypz5a6i>
References: <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
 <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
 <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
 <ef247fe6-6d9c-4a74-b3f8-a56857332758@oss.qualcomm.com>
 <9a227c15-dc60-4086-8d81-f80e3398a083@oss.qualcomm.com>
 <18e8d5db-e32a-4893-9d1f-5003670cedeb@oss.qualcomm.com>
 <7656e8f6-e281-4f7b-9ff4-1b2722234091@linaro.org>
 <7b68381a-0f7f-43ff-b934-9db5d9b2e69f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b68381a-0f7f-43ff-b934-9db5d9b2e69f@oss.qualcomm.com>

On Mon, Oct 27, 2025 at 04:47:26PM +0100, Konrad Dybcio wrote:
> On 10/27/25 3:38 PM, Neil Armstrong wrote:
> > On 10/27/25 14:29, Konrad Dybcio wrote:
> >> On 10/23/25 11:46 AM, Maulik Shah (mkshah) wrote:
> >>>
> >>>
> >>> On 10/23/2025 2:39 PM, Konrad Dybcio wrote:
> >>>> On 10/23/25 10:57 AM, Maulik Shah (mkshah) wrote:
> >>>>>
> >>>>>
> >>>>> On 10/23/2025 1:47 PM, Konrad Dybcio wrote:
> >>>>>> On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
> >>>>>>>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
> >>>>>>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >>>>>>>>>
> >>>>>>>>> All rpmh_*() APIs so far have supported placing votes for various
> >>>>>>>>> resource settings but the H/W also have option to read resource
> >>>>>>>>> settings.
> >>>>>>>>>
> >>>>>>>>> This change adds a new rpmh_read() API to allow clients
> >>>>>>>>> to read back resource setting from H/W. This will be useful for
> >>>>>>>>> clients like regulators, which currently don't have a way to know
> >>>>>>>>> the settings applied during bootloader stage.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Allow me to express my disappointment over the fact that you sat on this
> >>>>>>>> for 7 years!
> >>>>>>>
> >>>>>>> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
> >>>>>>> Read support was eventually removed from downstream driver too for the same reason.
> >>>>>>> There were early discussions to remove read support from RSC H/W, due to lack of users.
> >>>>>>> Its not realized yet and all SoCs still supports read.
> >>>>>>
> >>>>>> Can we read BCM states from HLOS this way too?
> >>>>>
> >>>>> Yes, Any of ARC/BCM/VRM can be read to get HLOS/DRV2 votes.
> >>>>
> >>>> Wow this is amazing..
> >>>>
> >>>> Do you have code for this already, or should I hack on it?
> >>>
> >>> No, it won't be of much help, as i said above it gets HLOS/DRV2 votes only for a given resource.
> >>> More specifically, the read does not give the aggregated vote result across all the DRVs.
> >>
> >> Hm, perhaps it could still be of *some* use
> >>
> >> But maybe reading back rpmhpd and rpmhcc states would be of more
> >> use!
> > 
> > The interconnect core definitely supports reading back the state at boot.
> 
> Maulik probably isn't impressed with us only being able to provide
> information about HLOS votes, as e.g. ADSP could be voting on the same
> bus in parallel.
> 
> I suppose the very same applies to what I suggested with clk and rpmhpd
> although probably it's less of a problem there
> 

Reading back the state serves the purpose of dealing with smooth
transition from bootloader, which we very much would like to have.

Being able to read the aggregated state is useful for debugging, but
it's a shared state that can change at any point in time, so we should
never act upon such information.

Regards,
Bjorn

> Konrad

