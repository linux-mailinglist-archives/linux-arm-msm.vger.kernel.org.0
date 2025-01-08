Return-Path: <linux-arm-msm+bounces-44398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73DA05E00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 15:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A0B1882F17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6873F13BADF;
	Wed,  8 Jan 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9oY2mKn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4E335BA;
	Wed,  8 Jan 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345195; cv=none; b=uHoN8mWYJ+dQYlXrA2Y4x1Xrg3bn9E/z2KdAMG+Xn1LjosgACdtn18Qt5vGrUFnQMxoS/+9ym/tAGoMsUBhXJQcTWtYFqd45V5ed7ijU+6BojG/Q/ILUfqk4e5NkjkKT4WqmJFno46lFDLCb/WOyZqGhY5jmvb2ahHR7ksUkptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345195; c=relaxed/simple;
	bh=/bSSok/L1u3GkPDCyoTVot0lx7NpmTj6KZbxWz+MHEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onjHeTi8paGgDCp8ZTYimZ/wQYWPEVW21Dz+lT5vjSGhWj9FxJd3CEl4YZ2RlUND2ejV89n6KUb8HkgdihoSIXOmMcIKBNAZvYhvE9DDidViRVQiN1JBd9/TdwccPWyD2QcJFHeJ0R+VODUk2gYsvpXNh91uCdSkiE5FBlOyUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9oY2mKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB53C4CED3;
	Wed,  8 Jan 2025 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736345194;
	bh=/bSSok/L1u3GkPDCyoTVot0lx7NpmTj6KZbxWz+MHEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9oY2mKnZ0yyu4trMUOd36WJ1SbzDYXqfD7T5LRGRmVPUO8lSVyVYDUuDotMGWv3S
	 +lpkickgIpAuVk8xp/TRxCq/rD29INGpkmo2KZPdSgvUkZAAzcvvxlQeobd8LSO9w1
	 4cIV/FLJ6J0of0wBW1+BNmI2kzVLdwZ11pe0LfKfkEy7Un1gQQ98blaxkSX3Sykvu9
	 lvhOmltrYs29nzv9uEM1KT7zkJo1Tr/8W1IO58KBI40bjGEbuP1F9WZaDoGugpPJHI
	 XwLJYkUUfSe7v9Y7dChWPzb1EcbIHFYWYqUPULce58nkcQkyq7OLpVojBMPGCnBRQm
	 oava1y/+/HfwQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVWhe-000000005Ia-2oyd;
	Wed, 08 Jan 2025 15:06:34 +0100
Date: Wed, 8 Jan 2025 15:06:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <Z36Gag6XhOrsIXqK@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <Zwj3jDhc9fRoCCn6@linaro.org>
 <87wmf7ahc3.fsf@oltmanns.dev>
 <Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>

On Tue, Jan 07, 2025 at 11:02:24AM +0100, Johan Hovold wrote:
> On Mon, Jan 06, 2025 at 08:10:52PM +0100, Frank Oltmanns wrote:

> > Thank you so much for this idea. I'm currently using this workaround on
> > my sdm845 device (where the in-kernel pd-mapper is breaking the
> > out-of-tree call audio functionality).
> 
> Thanks for letting us know that the audio issue affects sdm845 as well
> (I don't seem to hit it on sc8280xp and the X13s).

And today I also hit this on the sc8280xp CRD reference design, so as
expected, there is nothing SoC specific about the audio service
regression either:

[   11.235564] PDR: avs/audio get domain list txn wait failed: -110
[   11.241976] PDR: service lookup for avs/audio failed: -110

even if it may be masked by random changes in timing.

These means it affects also machines like the X13s which already have
audio enabled.

> > Is there any work going on on making the timing of the in-kernel
> > pd-mapper more reliable?
> 
> The ECANCELLED regression has now been fixed, but the audio issue
> remains to be addressed (I think Bjorn has done some preliminary
> investigation).

Hopefully Bjorn or Chris have some plan on how to address the audio
regression.

Johan

