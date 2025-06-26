Return-Path: <linux-arm-msm+bounces-62654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47226AE9FF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C81189F525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6CF2E719B;
	Thu, 26 Jun 2025 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev7ClxtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393528FFEE;
	Thu, 26 Jun 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946849; cv=none; b=S1d6DdRa+mDCwkGqK9W3N1kokNxKkBmKKNcPlafMNLAdzSw4ArVICEi/C4q6bCqgPNgj1N/H4f3MdOkq26xvUaxDePGKtUMWygYkKsI0S92+tutZYunJnE8RP4Rs0NHi6DKQBc/Z0hwagqwS06hpjWUKZA2LfTJD82LEK66HN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946849; c=relaxed/simple;
	bh=vugaHxaDRymq5bGUndV2NZe9c92WDn2WbR2/fd0HKo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUsOaLz1vytqtCfVJdK7LnfUS4WDFinYCe/IRhjNRX07bzlx4kTvnSRb792ba4cpootsk1CqikRGTcZ2fTM9xIwtr3ckZB3x2eclVzXIfNpvkN44wgqGeSWuBPUXlmTwCzoyF/CPX3dIdjTtr0dUsHfxCftsgDuqx7azAxOOE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev7ClxtP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54761C4CEEB;
	Thu, 26 Jun 2025 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750946849;
	bh=vugaHxaDRymq5bGUndV2NZe9c92WDn2WbR2/fd0HKo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ev7ClxtPUxDc9ERIfEOIyw12j3/zH5Q1JaydKwalSzMY6sdqNBrcHZZ2Qfa6pUBll
	 HvNxhoe8Cbcl0HRyIoj82k+8C/jdA1V7uXtW/DcYPBKWhZ5TKm6R+rsUXhZDwtOHQa
	 QusVKn2JFySU43L1KYD5rwBPDx2H4KNrSY/jT5Wtc1Det3FUOzsbvW1y5+XiQJFejO
	 /ual5H8nQw+vlXYTITxHkDRxtWxGZOeDTv1fJVkl9U+rN9psAwdbv/633mFUHn32EK
	 WkrXHWONaqRVkOy/3NeAm/GXle2Frs9ByI4zDlKhHuOwllNppr+RN9NVH7A1+KcUKc
	 /YQT2UVGow8uA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUnGD-000000003ap-3QXW;
	Thu, 26 Jun 2025 16:07:29 +0200
Date: Thu, 26 Jun 2025 16:07:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aF1UIcrNC5PULiqg@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
 <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
 <aF1Hhs0JAS747SVi@hovoldconsulting.com>
 <cae5bfbe-9537-4b9d-b026-170063054b35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cae5bfbe-9537-4b9d-b026-170063054b35@oss.qualcomm.com>

On Thu, Jun 26, 2025 at 03:49:32PM +0200, Konrad Dybcio wrote:
> On 6/26/25 3:13 PM, Johan Hovold wrote:
> > On Thu, Jun 26, 2025 at 02:15:26PM +0300, Dmitry Baryshkov wrote:
> >> On Thu, Jun 26, 2025 at 11:42:50AM +0200, Johan Hovold wrote:
> >>> On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
> >>>> On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> >>>>> On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> >>>
> >>>>>> Also not sure how useful it is to only be able to read variables,
> >>>>>> including for the RTC where you'll end up with an RTC that's always
> >>>>>> slightly off due to drift (even if you can set it when booting into
> >>>>>> Windows or possibly from the UEFI setup).
> >>>>>>
> >>>>>> Don't you have any SDAM blocks in the PMICs that you can use instead for
> >>>>>> a proper functioning RTC on these machines?
> >>>>
> >>>> I'd rather not poke into an SDAM, especially since we don't have docs
> >>>> which SDAM blocks are used and which are not.
> >>>
> >>> You're with Qualcomm now so you should be able to dig up this
> >>> information like we did for the X13s (even if I'm quite aware that it
> >>> may still be easier said than done).
> >>
> >> I'd rather try to find information on how to update UEFI vars on the
> >> storage.
> > 
> > You can do both, especially if it turns out you won't be able to have
> > persistent variables on these machines.
> 
> The danger here is that we only know what Qualcomm uses these cells
> for, not necessarily what the vendors with a similar idea could
> have come up with.

Hmm. Good point.

But at least the address we used on sc8280xp appears to be cleared on
hard reset (holding down the power button) so it can't be used for
anything that useful it seems.

> This is especially important since (unfortunately without going into
> detail), you *really* don't want to mess up some existing values in
> there.

Yeah, I wouldn't pick a random address without getting an ack from
Qualcomm first.

Johan

