Return-Path: <linux-arm-msm+bounces-50325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E784A4F984
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 10:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D2C3AD840
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 09:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BC71FECB5;
	Wed,  5 Mar 2025 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTMC3/s7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8B1FCFE6;
	Wed,  5 Mar 2025 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165617; cv=none; b=sloujEyF2Vfu4oEuprHj3zFB4CX4AwMudrZXeYJSNfYEwDuvSzJ4+xHXq7aNpKMLJ3uSnDX+CjAZzCrpHs2fs+DqhIaZHxN0r8bbFEXMfUz6uH7MraQem/BbuBaroVEhWAEflC9ziroqSu+KwXQBvqmk7HmuYCJcrhm/uPw5dRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165617; c=relaxed/simple;
	bh=Sbn9TK639K72VAVzN9kXnXqsIEGOQNk0cMqZU0Tm0aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST8f/ze9dtFxk4YrIex69aIuOCw4F8z7mDx29zL33Oczyb7Jlxy7TF8wBRKeNQLzG3JbXDmTZxwHl7+wZDExN6568pVc1h/Ci+zXAlOBQnOCSa0JX31VhHlol4oaKLrnNebHJKB1eyDRjm0jtSAXStEPCMH2VNSdgZSBIvT6ThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTMC3/s7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF631C4CEE2;
	Wed,  5 Mar 2025 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741165616;
	bh=Sbn9TK639K72VAVzN9kXnXqsIEGOQNk0cMqZU0Tm0aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTMC3/s7RJKlMMj+hvxFdiKLmYIIF3tfNNh8BobtRAxvwiW+fF7dXOEmU6ObAcBBd
	 6GqCLFB2QPDSdltaYNSGWZhVJHFwZcKf4SJkWn+GWGcOflJtgDrj8ZAhkTk/SGhHkF
	 yGoYF+CPcdjXxD/5THcLayVEuMqd4+u48pHY6DLGDfBM7t32PPWJvU34O+HD8JLmwE
	 o68zQlHSZMQhiK7FtcyfSnvlPQ1ylecEEauoQtksIli9vamEek/zztJd7qvTH5aRvj
	 6izjDe+InGts7Vydn363p5WfnQThQIUTqQjGP6QMOf3H7iUwLWzn903JS4kk3PFMJm
	 dypvNEYwJWetQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tpkiK-000000006zm-38b7;
	Wed, 05 Mar 2025 10:06:52 +0100
Date: Wed, 5 Mar 2025 10:06:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z8gULECJ463Ilv2p@hovoldconsulting.com>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
 <5831d9b1-4a05-4a7b-8733-5050588b4e59@linaro.org>
 <Z8c2OVRp8af1K1D1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8c2OVRp8af1K1D1@hovoldconsulting.com>

On Tue, Mar 04, 2025 at 06:19:53PM +0100, Johan Hovold wrote:
> On Tue, Mar 04, 2025 at 05:12:20PM +0000, Srinivas Kandagatla wrote:
> > On 04/03/2025 17:04, Johan Hovold wrote:
> 
> > > Unfortunately, this series still regresses Pulseaudio as capture is now
> > > choppy (e.g. when recording using parecord).
> > > 
> > > During our off-list debugging sessions you suggested reducing the max
> > > capture period size (that this series increases) to 6144 (same as min)
> > > and that fixed the Pulseaudio capture issue. In v3 the, the max period
> > > is again increased to 65536 which appears to break Pulseaudio capture.
> > 
> > I have verified pulseaudio on my side as well, the 64 byte alignment 
> > should have fixed the issue on the pulseaudio side.
> > 
> > Did you pick up the [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct 
> > period and buffer alignment. patch in your tests?
> 
> Yes, I'm running with the full series applied. I tested PA on the X13s
> (and PW on the T14s).

I just tested PA on the T14s and it has the same problem with
choppy recording with this series applied.

As with the (amended) v2, setting the max capture period size to 6144
appears to make the problem go away.

Johan

