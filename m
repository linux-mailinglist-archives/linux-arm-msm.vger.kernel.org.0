Return-Path: <linux-arm-msm+bounces-52245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91EA6C590
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 23:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191BC17E70A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 22:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E978231A2D;
	Fri, 21 Mar 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X///vmfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54B22FE03;
	Fri, 21 Mar 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742594406; cv=none; b=uWuJmF4qsrRzNS0G3QLPn1WxJdqUvCfHO6vpTrCfi1UVBePXqwE5W3gWJKtxvOfAP3jIzAk1stmBNEEMFa5DTaYkUf8G5qgzF3H0uc4V9jM5JO+x+6xn/YzPe8xsPtd68AQK5rklwEOP4MGNrgGDWhTg0e8DGcsxo+8ZDwC3bJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742594406; c=relaxed/simple;
	bh=JFD2MZsXj+aE6gSgjWrhHDFiihwRjQmGqNNGlhhc6Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJbcOGvWpNLephiLdGzf0/5r4d8VU1wizZjJKlIGx/xR+oKv+uWfiXdPw7AIfagb+9TBTcZSAUV3DSZPW6f1VrEdigFYFpXtbFgDs9q0ltjVwmPd1SDP68D0PHQuBLNyFFBIsZtTavesnqv/Q4/8wOq4zYm5kfcRgR+CSL6NrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X///vmfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6811C4CEE3;
	Fri, 21 Mar 2025 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742594406;
	bh=JFD2MZsXj+aE6gSgjWrhHDFiihwRjQmGqNNGlhhc6Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X///vmfpPsJi5Bju0kW+Pm2Y+tfzgyQYRn14YkA9uhbTv3DQGai7FajNb4+RPRFrl
	 dBaPr1cWq2AHNVTBh42TL375/bfKzb4jEd3OvlMV72hc1Re7iUZygJReFAYYZo+MSY
	 ioAow3hVcTLHHylkryyH+anQU9Yyw3VpT8QM1gYIWfJf6irKcYCM8PcZ45kA6XdT23
	 8tntUY/sw5ufT2Lhts170vbA3qDySTrF07A+Bahj/bXPNf4bkNy/40OzZlCMZyig8J
	 Nmq+rjU09N8EgA6LJAfQ/8RP7UgmKh9v+3WOAloqIxMhRurDyyIv+RSbIuzgfmqlsP
	 fY5GJBNuKNG8Q==
Date: Fri, 21 Mar 2025 17:00:05 -0500
From: Rob Herring <robh@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: dt-bindings: wcd93xx: add bindings for
 audio mux controlling hp
Message-ID: <20250321220005.GA4185430-robh@kernel.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320115633.4248-4-srinivas.kandagatla@linaro.org>

On Thu, Mar 20, 2025 at 11:56:31AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
> 
> Move to using mux-controls so that both the gpio and regulators can be
> driven correctly, rather than adding regulator handing in the codec.
> 
> This patch adds required bindings to add such mux controls.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> index 10531350c336..e7aa00a9c59a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> @@ -23,8 +23,13 @@ properties:
>        - qcom,wcd9380-codec
>        - qcom,wcd9385-codec
>  
> +  mux-controls:
> +    description: A reference to the audio mux switch for
> +      switching CTIA/OMTP Headset types

maxItems: 1

> +
>    us-euro-gpios:
> -    description: GPIO spec for swapping gnd and mic segments
> +    description: GPIO spec for swapping gnd and mic segments.
> +      This property is considered obsolete, recommended to use mux-controls.
>      maxItems: 1
>  
>  required:
> -- 
> 2.39.5
> 

