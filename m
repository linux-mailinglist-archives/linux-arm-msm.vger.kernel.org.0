Return-Path: <linux-arm-msm+bounces-50250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7098A4E99B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 838BA7A2C79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CD927F4C0;
	Tue,  4 Mar 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCZnBc/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4FB27EC81;
	Tue,  4 Mar 2025 17:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108798; cv=none; b=ntyn6R8QO7Xzx15+yuRUignbAeDSHyo60q1pUz7+4S+HeAAiuoyHEeG4FuY+CbPhjQHfcmM+3mw41mFSqEofvHAQk07HuFZyMxddflkXPuv++rVqHx1HUrviNuL30gy2S7LRXZCdn74HQoc+plazcVbOr2554n1BY1iOAXGbhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108798; c=relaxed/simple;
	bh=4reLKpViA4wm5wh0RFRhmgSV33Q6idDDEcow760hZmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcTUwZe6TYKMsnmJ9Yxs+497dqnIE8fqam64FuJouZW0mM0DA6SkcVKgh1hWFFktiPO3I/DL+6MuQkXlTApSjYlSERL7mLnnquTgo1//JkA+VJatc49flQ4YwGoy6vW0Qt88mCBcaHL/NVydziPj/EGtd0KgIqC/BD++0Ex2LNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCZnBc/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E35DC4CEE9;
	Tue,  4 Mar 2025 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741108798;
	bh=4reLKpViA4wm5wh0RFRhmgSV33Q6idDDEcow760hZmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCZnBc/eaQKchq4p15B8mjOXiRjUrgid/NMLxJ7MPuxn/86p16SKpiOx/0vvdD9A1
	 PrAWXwvbl3z06l9S+V3yuB0lwDem8FgS3bsCZfBprYb8fNRXfDolGUTbtXK73szasH
	 4J4pbiatMRGTBOdYKcT57U8SV4876KOm9U+e/B0rUfOSS3+142Kjwf9ZMpjtIF/a9Z
	 LFY49wlbTrcZxgQKNfvKZ3CtrQyyUXwbXuMc5JkXvr6IZlZWcnz7aPPRJLSKFQP8pE
	 gRyhVEyI2g3B+N/Hdc8aZSBArvxQSP2LIq2XoHQo00e2Q9+2cl9LQ1DuRy/4tN4eSI
	 cx/7CJOn/rJKw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tpVvt-000000007yW-1Ajg;
	Tue, 04 Mar 2025 18:19:54 +0100
Date: Tue, 4 Mar 2025 18:19:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z8c2OVRp8af1K1D1@hovoldconsulting.com>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
 <5831d9b1-4a05-4a7b-8733-5050588b4e59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5831d9b1-4a05-4a7b-8733-5050588b4e59@linaro.org>

On Tue, Mar 04, 2025 at 05:12:20PM +0000, Srinivas Kandagatla wrote:
> On 04/03/2025 17:04, Johan Hovold wrote:

> > Unfortunately, this series still regresses Pulseaudio as capture is now
> > choppy (e.g. when recording using parecord).
> 
> > 
> > During our off-list debugging sessions you suggested reducing the max
> > capture period size (that this series increases) to 6144 (same as min)
> > and that fixed the Pulseaudio capture issue. In v3 the, the max period
> > is again increased to 65536 which appears to break Pulseaudio capture.
> 
> I have verified pulseaudio on my side as well, the 64 byte alignment 
> should have fixed the issue on the pulseaudio side.
> 
> Did you pick up the [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct 
> period and buffer alignment. patch in your tests?

Yes, I'm running with the full series applied. I tested PA on the X13s
(and PW on the T14s).

Johan

