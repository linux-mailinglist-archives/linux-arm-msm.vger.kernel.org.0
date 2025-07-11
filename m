Return-Path: <linux-arm-msm+bounces-64511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F30EFB01622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001391CA2626
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6FF21A453;
	Fri, 11 Jul 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAqIpT64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A375D218EBF;
	Fri, 11 Jul 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222595; cv=none; b=InOv7eMRSXMSUPHAhcGXbQeB4hj0rf1fkVppFeGqb3nWZU9Z3oybU0G9R5sKC6z9iVXQRu/xiFgrw24zcuZTsxszdjaJppl2SLp+TegVSkCTPAhT2LPk6+IqLaEQnj0IVCQ93pXYHHlibMjwwgwdubV5eJt9Qy11dhRnUDh3Uig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222595; c=relaxed/simple;
	bh=usCoWtM/BA5Tp7eMWEeP0VimmZV5A8YJgjPE8S5Etqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9x9+MnFAwjlzEfYZxgiqK1fKYa/HtouXhHFlF3aWTqOToWnxpy5TXClYMxVGiCmnViiR+R32/o0lGdPj26jxF9YlNsUnOAhc1e421tL7PF/g015MekkKs/w7Shm9Mle49Q0YTb1VZQXP3CtIj4UZhrYNFHljyqhV/aXNLoWGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAqIpT64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DD7C4CEF5;
	Fri, 11 Jul 2025 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752222595;
	bh=usCoWtM/BA5Tp7eMWEeP0VimmZV5A8YJgjPE8S5Etqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAqIpT64fc1EFOVcy2Heq48ZrGKSDp2OUb+eusISH2kLcWmSs2eJar3dJIENlDJSt
	 ONijokvZJCyZD/kBVbUIyGxebGTWzIIFfUZF9nJi8H1NiVfgkefxUts/PQXhsrgoFR
	 LY1eXF0yfL+d/JPXlpJzS0VKm3alymiQqrYrZCC/lRnTzekACPiQ/+omrk+NVLNx+/
	 oIzexw4gofjx3Pp7MBm2vmufzwgyUv/J2srozCquwNf2kJsll+m6dAD3aa1vCqD0HH
	 /E3bPleeWaorbqOpUZAJksdKqdEhIoBgXelQUvH4dHsDc/GgmnRjPGWHXO+fClm/oV
	 YM89EuCVuzoJw==
Date: Fri, 11 Jul 2025 10:29:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
Message-ID: <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>

On Fri, Jul 11, 2025 at 04:00:11AM +0100, Alexey Klimov wrote:
> +static void pm4125_unbind(struct device *dev)
> +{
> +	struct pm4125_priv *pm4125 = dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	device_link_remove(dev, pm4125->txdev);
> +	device_link_remove(dev, pm4125->rxdev);
> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
> +	component_unbind_all(dev, pm4125);
> +}
> +
> +static const struct component_master_ops pm4125_comp_ops = {
> +	.bind = pm4125_bind,
> +	.unbind = pm4125_unbind,
> +};
> +
> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, struct device *dev,
> +				       struct component_match **matchptr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	pm4125->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
> +	if (!pm4125->rxnode)
> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx-device\n");
> +	component_match_add_release(dev, matchptr, component_release_of, component_compare_of,
> +				    pm4125->rxnode);
> +	of_node_put(pm4125->rxnode);

If you drop it here, then you do not need to keep it in pm4125 in the
first place. But this will point you to the problem - what if
pm4125_bind() is called after you dropped the reference?

> +
> +	pm4125->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
> +	if (!pm4125->txnode)
> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,tx-device\n");
> +	component_match_add_release(dev, matchptr, component_release_of, component_compare_of,
> +				    pm4125->txnode);
> +	of_node_put(pm4125->txnode);

Same problem here.

Best regards,
Krzysztof


