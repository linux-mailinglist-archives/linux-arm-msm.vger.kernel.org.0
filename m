Return-Path: <linux-arm-msm+bounces-48199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F039DA38189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38C3171720
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F58217654;
	Mon, 17 Feb 2025 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="J1QVopyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99892135C7;
	Mon, 17 Feb 2025 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791164; cv=none; b=VHl/vf18TTVDY05NujNE7MpJ1PPIOQcDzKOQHmMlY8xhI0KQJWzAy366c2yqnu3cVQKZ/5+P5U0H2OuZaNPcEt4jB4QFemxJCKmkvSlXpM1lrCCK1dQhZFSARPl6bi6FMKPJBjQVTs2x44PJ7ZK0ut07vvF4JmIADFhuqRO2oqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791164; c=relaxed/simple;
	bh=YCHgqCGPyppIzTg8nYy6++VTAaw11B/uWwIDShJFLcU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iyq+tSDgww6QnIdbzwqLp4aW+Ms8+fLPsG0A+UBrEue4zqlNEdraLFM5M1W7kjfeliqfMRYuXFrinhwJtT2mKiDDt/ujYlPyY37YS8f+87mTFTWsP2Fs/lO2ZEx16IrCJWmNxMxRwG7b9CN6nyvYwxTNWcRCVWSWHsU6pZzzRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=J1QVopyq; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YCHgqCGPyppIzTg8nYy6++VTAaw11B/uWwIDShJFLcU=;
	t=1739791162; x=1741000762; b=J1QVopyqAyWY8X0HUgGEKwTCxD7tIY/nbXFZd0tCzE1P8f8
	+nnuz+CuvT1izlxZRo5y5RdT7B2Z/ZQ3IORWXwHiqFkSePfQOpJqvZfzfb+PozU+3V2luov0HHLsk
	gjqw0EarF11PUU8GXty4EgnO3zlFPXXe24+lQTGyCPmpgVnLe6zT+BzvE8M4hKCearBocVBjmxouD
	G+YaBn8GrjTEVTX51LC08yePg5N0RGE7O8zwGmuibuJqkLG85HgSxHH11zxYbRBW0SRh+znMjFwsw
	DVFCLG6metpKwQ8QcWDGh72FojoyH7+PhjUijHhzN8U1GCt4KzfgbRjwsTQn+cZw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjz9g-00000000IgW-1rh8;
	Mon, 17 Feb 2025 12:19:16 +0100
Message-ID: <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 12:19:15 +0100
In-Reply-To: <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
	 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
	 <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-02-17 at 12:44 +0200, Eugen Hristev wrote:
>=20
> At this moment going through devcoredump is not something that impacts
> the idea of the implementation.

Yeah. I don't think it _should_ go through it at all.

> The whole reason of going through it (because things work without it as
> well), is to see whether this has any kind of impact or not, and if
> there is any kind of fit/reason of going through it.

So it's just a trial balloon?

> Devcoredump is involved because the whole core registration is similar
> to a core area that devcoredump could use.

Yeah but ...=20

> For example, would it be interesting to have a handler going through all
> devices, and have the dump areas already registered ?
> Meaning, when there is a request to generate a core dump, one could
> directly dump this area instead of calling back the driver, and provide
> that to the userspace instead of the driver calling the dev_coredumpv by
> its own.

I'll be blunt ... so you _really_ haven't understood devcoredump then?

It's really not doing this. It's not meant to do this... It's intended
to dump data from inside the device when the device crashes.

Please remove devcoredump involvement from this series.

johannes

