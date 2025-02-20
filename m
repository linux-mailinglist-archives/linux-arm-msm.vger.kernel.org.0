Return-Path: <linux-arm-msm+bounces-48751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB919A3E2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17D47A826B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD9D213248;
	Thu, 20 Feb 2025 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5P7BXnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F8212B0A;
	Thu, 20 Feb 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740073081; cv=none; b=FrjBvWI7+UjkcANo3nma/6KPPsWUuBi29B9s4NUjGvMLeuVphn+oj5Iplu1kew/BttnCIZ1yhyqVmjdEi/Ngq3Shr/e7U8UCpXWLAttAER0KG2NiCXLM1/ikJNCFR6t8626Fo1ihiSSTrNlSSrax6y1lWnu62mew0+S2047HEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740073081; c=relaxed/simple;
	bh=Q6mv3wC12R2i4rVWNsCzc8JGM+sJu0C3ob8GC6M5YIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPwf5oG3eQWXYQihtMA5zKn//EQSGR7GG1x5myKQ5JmTNdhg7mBMQEsJ2wpkxrAAMz5ikYd968pzc0vfEgdZPoDxO3liNPKNwjKawPg5AdTdNF1tAeK+lGGozozU2AgdxUtaZZ4ectxhNdT73MNxv5or6wLTmMrIQoE41BRz+lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5P7BXnj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D851C4CED1;
	Thu, 20 Feb 2025 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740073081;
	bh=Q6mv3wC12R2i4rVWNsCzc8JGM+sJu0C3ob8GC6M5YIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5P7BXnjFl0hwqtUO2HoMhl26OfiT7PBAzOyx0RfsI3waezekRiZswaA1kD+SXpK/
	 lEx7s1IA7wtLxkvpWx/VlrnqEhuS7fuyKiorCB0KZZoTUUks0VuEHnuvM1uKV+r8nb
	 s/didwRe73lUkxCx5mdPxLM8g+4wgMvMkAoMRPAKebaTkcBKD7Y67FrrF2RoC+wiCg
	 e0nhe4niDZZLLFzVsPyMd6BdQKxKgV8hPdtTO9wB7UiTjOPZGWPXD/EDAFEkUf9yts
	 vb7q4z63+9Jc3X0ReAgU5O6qGrEqzAOFn2F9Jifvke9h5QCudgZvnUYOQc6TdFOh6I
	 ELsTxivybBhBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlAV1-000000007lw-3opl;
	Thu, 20 Feb 2025 18:38:12 +0100
Date: Thu, 20 Feb 2025 18:38:11 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z7dog3cWe4BroZdT@hovoldconsulting.com>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>

Hi Srini,

On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:

> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs 
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see Audio quality improvements.
> 
> Any testing would be appreciated.

With this series, the choppy (robotic) capture when using pipewire
appears to be fixed (pulseaudio worked before).

Playback is still choppy (heavily distorted), though, and now it also
appears to be too slow.

I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).

Johan

