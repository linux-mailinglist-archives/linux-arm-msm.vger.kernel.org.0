Return-Path: <linux-arm-msm+bounces-55875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884DA9EACC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93883AA577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FDC1FFC45;
	Mon, 28 Apr 2025 08:31:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BE149C7B;
	Mon, 28 Apr 2025 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829069; cv=none; b=sw0N6UlEjIXI931QOlxigmYnKLssYrBLjcTiXbphhsV5mKMzc0iuJEqqpg2tiltZsf3WGpdFeAv75eXiCgysZEcaEhUNv7G14xBIVZKVI2sy/sTY9nn8+2dvQQVnAOXqU4zVFZVWPLyNeuCQck5iy8D2jmAw6CEw+YEA8c7dnME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829069; c=relaxed/simple;
	bh=VU29eTm0Z6mnwXT2zqfxSiDNfA5A30dMv0wEVt/g5S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwoLeq/knCjKmTehM0ZDau3ZMHrf4hY5SgWD6XvSCSuwhWyneyRV6hmRxmyWcnlXGKHuVFfLG9LxOeBERk4/QSWa9tdeioZ+SqW56/xj6yvApx6XRICMgALUGoBNakROPSDAA2qTac1l9e3dZ6n74Q7cgBVeyI9Ugkz6NR56RpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D674C4CEEC;
	Mon, 28 Apr 2025 08:31:08 +0000 (UTC)
Date: Mon, 28 Apr 2025 10:31:06 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/6] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Message-ID: <20250428-tungsten-skunk-of-domination-6eee9b@kuoka>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>

On Fri, Apr 25, 2025 at 12:44:53PM GMT, Luca Weiss wrote:
> Document the bindings for the sound card on Fairphone 4 which uses the
> older non-audioreach audio architecture.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


