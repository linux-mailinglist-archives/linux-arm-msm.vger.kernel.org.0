Return-Path: <linux-arm-msm+bounces-59606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2BAC5AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511CD17CBA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC1D28A3E4;
	Tue, 27 May 2025 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PV57t7U+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8828A1ED;
	Tue, 27 May 2025 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374369; cv=none; b=LEHpS5vgo0+NRxlmTeyjP0tdzQZOvX57EZkpI3rgHuO1gZqR60l034VfoTKQfa0psZFdwtQ4GeSDyQxNKtkkxZXF4e6NmfIxYCwhAwo4UHOOz5cbYEaEE3Z1QigoIpMqMvyN5uSUfioDXbKHajCC92rnfL/wraLg6iHNugbVaH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374369; c=relaxed/simple;
	bh=5jz4HFaUMvpIkhkCjh0oU+CBO8bypKOzGpHT/HpHhoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk7AYT11E3QFsmvdjbuJFQ/IIuiRCYobBCEbnSU85gXA5IysmUh3Nnb0QRTkeePU/IesCtZicstbBWwltBvUSTfQHvynyIIkXfNGPYDC+qzz4RMidL1TGRXa+FEVfNU5WP/lRbwXlaaJVWs2rKgLbusJ0ER7ZUrvzk/B3Vttw38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PV57t7U+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EBCC4CEE9;
	Tue, 27 May 2025 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374369;
	bh=5jz4HFaUMvpIkhkCjh0oU+CBO8bypKOzGpHT/HpHhoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PV57t7U+5CGrTcva5S6HTedYOFKznlWYtkGsTc4qa7ZcBk8SAuskmxP3Xjwvj0CH0
	 45aATBYY83i6IMqMFy4tVkHt3VhkzQddxZmtakcoDuXfvn3XeKXJh+zLqtb1Oh4VE5
	 bV6v5beKlZnja6Cvc96cwoJrJEy/8pEHz6AFhcWRGEyToCRoIaE3q95zTSra0LFCBe
	 yyWvF8aW5IuFpnZ7FO/pRC9Aa1Ab4SW4w86+Mav9J9hpLBIuNIQBpbALZ1V40TPJ1p
	 9q0KtuD8zHAdS4719DLTrrB1+tbth3+qW1+zyXj2pz2Mm59fZZIzQhVxImKI6UYFae
	 J9gyjd0UTAq8w==
Date: Tue, 27 May 2025 14:32:47 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Message-ID: <20250527193247.GA1074247-robh@kernel.org>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-fp5-dp-sound-v4-1-4098e918a29e@fairphone.com>

On Wed, May 07, 2025 at 10:01:37AM +0200, Luca Weiss wrote:
> Document the bindings for the sound card on Fairphone 5 which uses the
> older non-audioreach audio architecture.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Once again, QCom .dts changes merged without bindings...

I've applied it.

Rob

