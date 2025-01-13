Return-Path: <linux-arm-msm+bounces-44865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D39A0B259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52C401650BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05208232392;
	Mon, 13 Jan 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwIzQp7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C0346B5;
	Mon, 13 Jan 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759235; cv=none; b=PRd1fYwPgCCjpiOVQsZ0yhncClrRT5LxtWdwD1/VXcbt43zy09B4DV49Lwoc6A4xGg/DwWMCsStzITm6ERhXt1iTMTe1rST4NfIr58iOr+xN7AVwZdzzQJGsHe5i6etOhSB8qTD/u4hzwg1sKMGhWq6y5KV4ROu9hnk8Hq51Nuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759235; c=relaxed/simple;
	bh=ba+6Bzic80ymbn2zGb9LkgdvSGg7IBi+B5HOhD0RHgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNnt+AatALbTuFb9S7t/dMktYJikbRPNHinECUmfVTz2T0e0aw/4/E5v5GS4YTpCWe1leoewgYarWBRHgC8pDupL2ZbJfqXh4+Iy5VhBb+VAnc1MsXZjXfOB7KIXqp5Z0qMipGqF4icjv9HJJvboXrBg/ogkM2Ii/vYmazCFQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwIzQp7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6522DC4CED6;
	Mon, 13 Jan 2025 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736759235;
	bh=ba+6Bzic80ymbn2zGb9LkgdvSGg7IBi+B5HOhD0RHgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwIzQp7J9tHIhk/zHII29F2G6hu6Xof140j5CFwNIpEFGLa7PBErTvzI/8OkATJF8
	 RPj3rRbPcqcrib5LaJZotmSF8vhe1xSnpTNH8P1CCehjdiJvY+dFcIAEpTzHAm5BED
	 MkUNiVsd1TlvjmGeSAPhy8lWPVW+AtHacekaXHhDLb4SWRFqLUCmWJd3n6kNMLsqAE
	 Y9n9rGy0LHwd33x7+awp/7fFmcaOT8O1X9QjSHadUDUQWH+2R3XWMVa6jDeOyn6Npr
	 gGoHiXRlGeDYuyGQfevVUd001Z8wSD8rX/tJcRuEyeaw0hMs4nMA+aR2Pyninfokp9
	 bipP+SvLsziuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tXGPj-000000000J5-383H;
	Mon, 13 Jan 2025 10:07:15 +0100
Date: Mon, 13 Jan 2025 10:07:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <Z4TXww5rAkMR8OmM@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <Zwj3jDhc9fRoCCn6@linaro.org>
 <87wmf7ahc3.fsf@oltmanns.dev>
 <Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>
 <Z36Gag6XhOrsIXqK@hovoldconsulting.com>
 <87wmf18m8g.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmf18m8g.fsf@oltmanns.dev>

On Sat, Jan 11, 2025 at 03:21:35PM +0100, Frank Oltmanns wrote:
> On 2025-01-08 at 15:06:34 +0100, Johan Hovold <johan@kernel.org> wrote:

> > And today I also hit this on the sc8280xp CRD reference design, so as
> > expected, there is nothing SoC specific about the audio service
> > regression either:
> >
> > [   11.235564] PDR: avs/audio get domain list txn wait failed: -110
> > [   11.241976] PDR: service lookup for avs/audio failed: -110
> >
> > even if it may be masked by random changes in timing.
> >
> > These means it affects also machines like the X13s which already have
> > audio enabled.
> 
> I've blocklisted the in-kernel pd-mapper module for now and have
> switched back to the userspace pd-mapper.
> 
> I don't know if it's helpful or not, but I don't get these error logs
> when using to the in-kernel pd-mapper. It's just that the phone's mic
> only works on approximately every third boot (unless I defer loading the
> module).

Ok, then it sounds like you're hitting a separate bug that is also
triggered by the changed timings with the in-kernel pd-mapper.

Are there any hints in the logs about what goes wrong in your setup? And
the speakers are still working, it's just affecting the mic?

Johan

