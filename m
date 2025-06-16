Return-Path: <linux-arm-msm+bounces-61495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58478ADB915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 20:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E3D03A839E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AAE28982F;
	Mon, 16 Jun 2025 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="bGOrSVhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F7288C9B;
	Mon, 16 Jun 2025 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099787; cv=none; b=YKhy4NF+tqAPf4uDUjLJde5PM3usUZbwGvFfTqLzonoQdS7shwgq5ImI6K0bqd8s7miyw3vBJ0JbMCHPOuTDFGsUUr0bOs2hKM2p/avagq3XDy7XQmMBw6b+llozHjnw3IRzElbQP9XprHZXuiRoWM9C2aY81MJuErUSzvkeMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099787; c=relaxed/simple;
	bh=OMwpx2UzF1222p82UqqWw/zlTrQ89HflkXcd7N8UDnI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MphJzwWBfT3I6NOnTpJoiKpmqQjdf8X4rK5VqOFK0SvRnRUqOKCdHCIRsIr5iq8XtIhOeXja3pqm/nJgRinvmfH17u28vxKsfxceRElrrikVahAj3vgEfUdggOK6B4IFxraRZlw7g5kMpI0ObmsVWQeJLwfuMmZHbtzWPH+R4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=bGOrSVhv; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OMwpx2UzF1222p82UqqWw/zlTrQ89HflkXcd7N8UDnI=; b=bGOrSVhveR0ZZLDXU8QBM6Ke1M
	cOUX9kGt5d7GGPJbJwAKrt88NEwvKA6a3aK0mX00TAJFHofxfFWQm7ZPjkHjpQJYHctBhy+U1oP5J
	rFMGZg6XTSNR6HGlM2hBaEHOlTdyaFWNyjvpRijbYsvfxzLMKKc0Fe/LGcjDtDYjsm9BVtKD5vwU0
	fuMgrX3WPOzrBCqLNslgMjxhN8qfqaihClbY4W8azUTXFgJKVrBmsebrkY4olpspeQiJs4yHfCZxu
	MZccTUnwrFrKO0V8+HUEmuVT3Q/Nohpueovsfy55X7RIs0hqGFqbzwiyn8JSU9N6dyVyoGwVK7rn4
	gkQLRh2A==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1uREY9-000G55-1B;
	Mon, 16 Jun 2025 20:27:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1uREY8-0005mb-2X;
	Mon, 16 Jun 2025 20:27:16 +0200
Message-ID: <a16e6aec51c5bc8dbbf82ccc56c65fa093b8b4b1.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson	
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Marijn Suijten	
 <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 20:27:15 +0200
In-Reply-To: <90be390b-d69f-4862-8f24-b692f41f9bf5@oss.qualcomm.com>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
	 <90be390b-d69f-4862-8f24-b692f41f9bf5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.7/27670/Mon Jun 16 10:37:08 2025)

Am Montag, dem 16.06.2025 um 13:46 +0200 schrieb Konrad Dybcio:
> On 6/15/25 10:35 PM, Andr=C3=A9 Apitzsch via B4 Relay wrote:
> > This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360)
> > released
> > in 2016.
> >=20
> > Add a device tree with initial support for:
> >=20
> > - GPIO keys
> > - NFC
> > - SDHCI
> > - Status LED
> > - Touchscreen
> >=20
> > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > ---
> > Changes in v2:
> > - Add Fixes and R-b tag
> > - Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
> > - Remove comments from rmi4 nodes
> > - Don't touch tz-app memory region. Currently, the bigger size
> > seems
> > =C2=A0 not necessary.
>=20
> You may want to run the kernel memtest, which accesses all non-
> reserved regions. If the device doesn't kaboom, we're likely gtg
>=20
> To do so, enable CONFIG_MEMTEST and boot with "memtest=3D1" in cmdline,
> boot may take noticeably longer than usual.
>=20
> Konrad

Hi Konrad,

thanks for the hint. The memtest runs without problems.

Best regards,
Andr=C3=A9

