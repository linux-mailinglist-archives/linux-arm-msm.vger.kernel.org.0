Return-Path: <linux-arm-msm+bounces-78826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D3C0B522
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175003AE6F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F0C246BA4;
	Sun, 26 Oct 2025 22:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtXQqWaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F71D90DF;
	Sun, 26 Oct 2025 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516532; cv=none; b=iKkM60ZI01UKRqvWNI+lIi/qUHyPj/oCiwvp1Zvu4w8MBG4UfqjcXqwPsdsPLefZinW/hNqelW2094cG7mLNFdlNY8DvMF4l2WRFQ14rR4oriG32aCca9Zt9PKkvfnjzljQlrYZtPAImEf537o8PLJJOC0kwnpbqNTtUY2Hyx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516532; c=relaxed/simple;
	bh=fn4oj68D497iz81cigKaDwQEThcbsKJegLo2/Pz6azg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1smQIX0UQ3wSdi41M/MyDXcxk69NrBaXLvloVmxJTFOtXskT0FhCpMjA+7eoUmGzOe3uerkc0qt4ydGvqSSBb/mq2prbhTO4Zxt20R/E9xuoWArcBFxOUuPM+xrNawc8IDiQNm4kizdPXp1JFH0gownFXDpF0metxvWzBI6hG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtXQqWaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDD9C4CEF7;
	Sun, 26 Oct 2025 22:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516530;
	bh=fn4oj68D497iz81cigKaDwQEThcbsKJegLo2/Pz6azg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtXQqWaYL0d4rIc8JITJBw4GN2e4v9XyjsAlD7tkMLLyjp5ORu7ohZMBdHyZSzjXK
	 WewjgtLwA6pzh9FDgWME4tcJ+bt94o4Ydm15D2hxP6942KFhFAEbHizyzTmcqNszj7
	 pj0xbqLpiF0t4UWR4VJ7JHkGMtI8m4BSKrpvUt4WWBZHHjxUzstdR75IygAf0CIzpr
	 Qwjpm3yPi6SEUlrjFAI2SgSZma8z50NCQlOwfQ8hS7Fehgll32qKtIp1jOShRW5jkx
	 s3bW/PTZnRN+wBIVojxoZuZw3uIMyyB5yIhWK0Zl8i6iGZHl4toF8khYkiLTTK3V4W
	 2cFBYHz9yrRpg==
Date: Sun, 26 Oct 2025 17:08:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,sm8250: add QRB2210
 soundcard
Message-ID: <176151652614.3024086.8105515420763759094.robh@kernel.org>
References: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
 <20251022-qrb2210-qcm2290-sndcard-v2-1-32e9e269a825@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-qrb2210-qcm2290-sndcard-v2-1-32e9e269a825@linaro.org>


On Wed, 22 Oct 2025 04:58:49 +0100, Alexey Klimov wrote:
> Add soundcard compatible for QRB2210 (QCM2290) SoCs, where the older
> non-audioreach audio architecture is implemented.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


