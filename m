Return-Path: <linux-arm-msm+bounces-52067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD3A6A2AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 10:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03B84460A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 09:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C010222586;
	Thu, 20 Mar 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXeUXtPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5748C222560;
	Thu, 20 Mar 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742463089; cv=none; b=FoygxjMugPCSY/9E/WTv7Rq7w3WyRM59q7JcUwdcmgzegRY6orzHqDU0aQDEcvKFqRPsbx4uz7Hto91VPvI29c5/jA1nimPdyssG/XhzTtzfEtiZIKDEP8L02YVjulM0gEqikO297nThIK1U7liFXCfebNRXCEkUuqBd/w3W7JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742463089; c=relaxed/simple;
	bh=l9eem7WJGYypfrHFJiimr1YXth3+uzyUvblKHYU1JeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3zmHsa//l6z+1/+1pjQuoX2Cz0exkSHTe7lcwuyc2JKPvJ6Jp382M2nPeLIepOSdQC4C1TiuokRU8Vmp+9/cKolMXDYSkFXLj4R8ZPs2N1jKhhcZJphv0AZCAHbUhrVRCRTP1W9FO1vtMbV5hIAYiHwjZ/Qv6YxQKlvf32G8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXeUXtPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77A8C4CEDD;
	Thu, 20 Mar 2025 09:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742463088;
	bh=l9eem7WJGYypfrHFJiimr1YXth3+uzyUvblKHYU1JeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXeUXtPE6JVonW5rDIhp1JZVyg4q+rxLeJkeWKwRxe0N3QetCZ+WNlsU8VVZ8ZI8W
	 JPjdtUfgOMSEMgRmrl/8igSZ1rNl197VPSAbTgmMY2u51EqM76RE2GSzRQKDLS22eH
	 7gsBzF9uVsFRCtO7D1Xq7jvZO39EM6EDqmNjUyt4q3cxN43kEsXtoj60QVHZ972kDH
	 Du5T1LPvNDr8gN4CzWteepf6bxtlxKCCwvoQMKAHzlSEnkeG9FLDtLColrpatXMzhg
	 oPRV6+B9ZGqU3r4XeHCdL4S6/OLQtIt3W3ORZAg5ziDaYiIH7uLWZ0FO0iR+Qq8ixX
	 Uo6tSWhp9yQFQ==
Date: Thu, 20 Mar 2025 10:31:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz, 
	tiwai@suse.com, dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	johan+linaro@kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: wcd93xx: add bindings for audio
 switch controlling hp
Message-ID: <20250320-feathered-super-walrus-8eeef8@krzk-bin>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
 <20250319091637.4505-2-srinivas.kandagatla@linaro.org>
 <4ie22uuz5tpg77jto3c3hec6lhonr44hrjda7jk655axlaxvba@u3atd4gcyghn>
 <660115f1-d1fb-4fd7-a453-e8c177be9eed@linaro.org>
 <51dd7cb2-0c22-4043-b3a1-fa8410903cbd@sirena.org.uk>
 <938cb09f-3fb1-4daf-802d-2d95222f30db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <938cb09f-3fb1-4daf-802d-2d95222f30db@linaro.org>

On Wed, Mar 19, 2025 at 06:00:51PM +0000, Srinivas Kandagatla wrote:
> 
> 
> On 19/03/2025 16:03, Mark Brown wrote:
> > On Wed, Mar 19, 2025 at 03:59:23PM +0000, Srinivas Kandagatla wrote:
> > > On 19/03/2025 10:01, Dmitry Baryshkov wrote:
> > 
> > > > Is this regulator supplying the codec or some external component? In the
> > > > latter case it's likely that it should not be a part of WCD bindings.
> > 
> > > This is regulator powering a mux that is driven by gpio which is part of
> > > codec binding. So I would assume this will fall into the codec.
> > 
> > > Where would we fit this if not part of codec?
> > 
> > > Unless we mark this regulator as always on.
> > 
> > I would expect that the mux would appear in the DT and consume both the
> > GPIO and the regulator.
> Yes, its doable, so we would endup with a mux driver consuming regulator and
> gpio and move the gpio handling in codec to move to use mux control.
> 
> Let met try that and see how it looks like.

Looking at schematics this is clearly not a supply of a codec, but as
Dmitry said, separate switch. Actually two switches.

Best regards,
Krzysztof


