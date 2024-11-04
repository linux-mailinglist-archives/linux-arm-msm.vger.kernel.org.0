Return-Path: <linux-arm-msm+bounces-36965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129B69BB94C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 16:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AEDF1C2039D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5DE13D246;
	Mon,  4 Nov 2024 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iegfnr5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0470816;
	Mon,  4 Nov 2024 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735154; cv=none; b=tfYzfbjupk6Ty1Ia2cssOKYmc7egb29VrusQoQ3m7IZD+WmYuY1kQDDdpnTaXExDiP9RvmCcdjQUF1X4agknnMCXQiryiOiK2tocB4YLscyEbHRAK7KI4wiQ4ukYEzIGeLYVauW2yCHmfGh/qurFInHOYtL4PYKgV60KWp2Y7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735154; c=relaxed/simple;
	bh=hpKGIEgf5TYQkLq+8qx78PTEEBg3/Hh7MOPIKh9I5Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHa6qYxl5oZUqEDZNh4BgZhEMXz3avj2MYk+nbew11TkowRuF7mtHMSXlpNZyfDHwFQfmw07aa7u46NRsLxcLhDLXbWHCPx5vj9s7/2zc/9q4vIET44615UupV8t1kOFRy8IGt69KCtUTd0469VYfi6Vhw9HArvpgesk8ZOi02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iegfnr5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3961FC4CECE;
	Mon,  4 Nov 2024 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735153;
	bh=hpKGIEgf5TYQkLq+8qx78PTEEBg3/Hh7MOPIKh9I5Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iegfnr5cZub0L3skSUElMYZzy5tB8OwYtAybd7HzajHs0h9qJVMoWVo7JCSnOK53C
	 ClEPj0tL0bueu10SkrFhZpHuv08S14bC1qYGQTQSoPSCe4gsYFZVX+Kqi6XmKI03Xu
	 wDiXVgndccOx98bWBqeoDFYeFdNsaWiB1RBOia1u6u6IgKgC792l4MqZI2S5JCmfkN
	 +wkMT83dURWvAPc/VJy9QM8lM2Jdb7ULXHQnLcgxQcBmYifNHrzfrX/M4NOeHDSdWu
	 VWIRVaM9VG6c5PZErrazcaEfo/daisimy7f8iEfn3m//xpRi1wgAq20628hw9ivzof
	 b6SqUItJLsq2g==
Date: Mon, 4 Nov 2024 09:45:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound card
Message-ID: <173073515085.215062.12387546442080685714.robh@kernel.org>
References: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>


On Fri, 01 Nov 2024 17:51:58 +0100, Krzysztof Kozlowski wrote:
> Add bindings for SM8750 sound card, compatible with older SM8450
> variant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


