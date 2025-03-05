Return-Path: <linux-arm-msm+bounces-50326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8370A4F9C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 10:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3222F18867F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88B72040B0;
	Wed,  5 Mar 2025 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcM1q5ZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F91F416F;
	Wed,  5 Mar 2025 09:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166476; cv=none; b=B0zzPQAoOHdmdEm9VLD8PEwcbOmpATnKhXGwuXXXUlCal1x8kg8q9OaxxtaKgE0EOLb0yCsV/zVVtfDt3tr/pEb6tuw/RiXHAbZeLjwJS9haGix3urhbK48/1XfhudOxuYrSsGGHe2LE2RVqOaJMnlJZU1ZIRA0qSVS6y1QJpjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166476; c=relaxed/simple;
	bh=Z6IPlzuZvYc5ZzGlOAloXZI2q2aupm/MR9VZ6w8t95U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCPXtexMfQXTffL+Btg1QnP2NyHhPfrH3UWieKT6J7QOBl9PJ/+gaNs/8TpJhw64T7Lh6kAVQAjZnprJNpzje0wU+6mKUoeW5tUXlKQO3gr496qL78qUEXv4dwS9AJBWEKyx5UCYnYgxG16NWVWrwO2pEang/UZcot1WMfpyFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcM1q5ZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CFAC4CEE2;
	Wed,  5 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741166476;
	bh=Z6IPlzuZvYc5ZzGlOAloXZI2q2aupm/MR9VZ6w8t95U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcM1q5ZIRIS/y8SzL8qPpKqUEsscViSYT2kUY1axHPISobn7Np7NEV1NxcCao219a
	 QDpzw9aKboSRHUszIb9LnKK+1YAf4VZW2XRxwbipMr8lTUG72FAxbyUFN/rq9gpwfn
	 V/DC1WGmcuPs+vtw2dYg0Ig3UNk+fr3n1b5PKOKSygOwV6090vpKRBkNcInNueK2sp
	 jOn5nJdTTh5RyEBblzrm5CfcQv6Z8ryQ52kg1fHKXVb6/T4gM7d86xHPhTQj4cmZ4M
	 nizrj7mk0axD567kCTzFJ1owY37tQ+0CAcmBMUBDbHZU7yw9DTW3KvkdgXR4I2n4Nx
	 PvDwGvrNhY2EA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tpkwB-000000007Hd-2js2;
	Wed, 05 Mar 2025 10:21:12 +0100
Date: Wed, 5 Mar 2025 10:21:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z8gXh4CrVJPznNvC@hovoldconsulting.com>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
 <5831d9b1-4a05-4a7b-8733-5050588b4e59@linaro.org>
 <Z8c2OVRp8af1K1D1@hovoldconsulting.com>
 <Z8gULECJ463Ilv2p@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8gULECJ463Ilv2p@hovoldconsulting.com>

On Wed, Mar 05, 2025 at 10:06:52AM +0100, Johan Hovold wrote:
> On Tue, Mar 04, 2025 at 06:19:53PM +0100, Johan Hovold wrote:
> > On Tue, Mar 04, 2025 at 05:12:20PM +0000, Srinivas Kandagatla wrote:
> > > On 04/03/2025 17:04, Johan Hovold wrote:
> > 
> > > > Unfortunately, this series still regresses Pulseaudio as capture is now
> > > > choppy (e.g. when recording using parecord).
> > > > 
> > > > During our off-list debugging sessions you suggested reducing the max
> > > > capture period size (that this series increases) to 6144 (same as min)
> > > > and that fixed the Pulseaudio capture issue. In v3 the, the max period
> > > > is again increased to 65536 which appears to break Pulseaudio capture.
> > > 
> > > I have verified pulseaudio on my side as well, the 64 byte alignment 
> > > should have fixed the issue on the pulseaudio side.
> > > 
> > > Did you pick up the [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct 
> > > period and buffer alignment. patch in your tests?
> > 
> > Yes, I'm running with the full series applied. I tested PA on the X13s
> > (and PW on the T14s).
> 
> I just tested PA on the T14s and it has the same problem with
> choppy recording with this series applied.
> 
> As with the (amended) v2, setting the max capture period size to 6144
> appears to make the problem go away.

Actually, there may still be some distortion also with the max period
size capped at 6144 with PA (there's a hint of it breaking up as with
the non-modified v3). At least the PW recording sounded cleaner, even if
I guess there could be other causes for this.
 
Johan

