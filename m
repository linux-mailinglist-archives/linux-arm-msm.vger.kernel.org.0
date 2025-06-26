Return-Path: <linux-arm-msm+bounces-62613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F8AE9A5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5510A3B842D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F74D218AB4;
	Thu, 26 Jun 2025 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALxxWE+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D818035;
	Thu, 26 Jun 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930972; cv=none; b=O16fOA5Gn9tXfjWTbq1w33+Yfbi6pl8kwBG/ThjddR77nyNL/UohUrJZnWH0v+vAgqmXAKVE9QrGtMmTsJAN2tKBIVo+mTsPyd/xVG30Ueg8Qonf+Imj5dC+htGXaKuIcCp29ny7V/t83e8Agma6MpxSAuoB8eaI92Ape8xAUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930972; c=relaxed/simple;
	bh=yxr8jkkGpgSkf59PSayEt3iCwdXnKO9NB8pyouoEjO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUMqYqorh/UnVNyGrq9dj+XszysQsy6F5+SOpqE6cut0lfZqIt49W/vePwlJLPvhLk3hCoUKK8Rr+9xQ9RZtTiAWdWJSWiXFqcbjhKB5XYfNDJ+WWA0AtPLE0jM2aRowhMHvicNwBuhHb1z09nhDpr1G8OD5sAcnWt0czmBvp94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALxxWE+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8EDC4CEF4;
	Thu, 26 Jun 2025 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750930971;
	bh=yxr8jkkGpgSkf59PSayEt3iCwdXnKO9NB8pyouoEjO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALxxWE+OyyAEN793dNZxPXlaxUD8qWsejSbr9+ou0JUjszr/243/supU2Py/r+KNY
	 i1Svuh2TpEGu9EWb6C3+PqB8AR1UCIkEthUTs+mh5mfBA1LAY7qoYdQwbTlLLfJO6o
	 0kL/STpOX0HcoLJxGj9Mfy4MqCK+2hqycG9v+n6DX88CZ8xVsRzdREzsA7B2W6P8tT
	 WCFLUvn4Ppk/vOJuKzzwhXfKftv4YDHEwDCi6YbhGF875zelOtMU9MopfJZl8gYwiH
	 XS58g8spscSzHdcb38yyfP4JMvW5XSJvEZA1EySh378JR2RhZFditbRHz1yaRXOwxt
	 upQDK3bt5Yt5g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUj86-000000007Kg-2oNt;
	Thu, 26 Jun 2025 11:42:51 +0200
Date: Thu, 26 Jun 2025 11:42:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>

On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
> On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> > On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:

> > > Also not sure how useful it is to only be able to read variables,
> > > including for the RTC where you'll end up with an RTC that's always
> > > slightly off due to drift (even if you can set it when booting into
> > > Windows or possibly from the UEFI setup).
> > > 
> > > Don't you have any SDAM blocks in the PMICs that you can use instead for
> > > a proper functioning RTC on these machines?
> 
> I'd rather not poke into an SDAM, especially since we don't have docs
> which SDAM blocks are used and which are not.

You're with Qualcomm now so you should be able to dig up this
information like we did for the X13s (even if I'm quite aware that it
may still be easier said than done).

> I think the slightly drifted RTC is still much better than ending up
> with an RTC value which is significantly off, because it was set via the
> file modification time.

I measured drift of 1 second every 3.5 h on the X13s, so having an
almost correct time with massive drift that cannot be corrected for may
not necessarily be better.

> Anyway, let me pick up some more patches in the next revision, maybe it
> would be more obvious why I'd like to get R/O support.

I'll try to take a look.

Johan

