Return-Path: <linux-arm-msm+bounces-26925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8C93A897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 23:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20FAB28196E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 21:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5991143733;
	Tue, 23 Jul 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os21XhD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174013DDDB;
	Tue, 23 Jul 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721769390; cv=none; b=lgF4aOdxPO2a2WeJXUqOEkfEttBTO/0E5bOhU+wXfGemuNMLaPtPDJxgwIRRIfbUnLwallMASg+iyCwBGSHoP088FfgqNr9hED/G1NiD8SepVswWCgC8276kB/99siM6ggVrsGk3NtW55oVg8ujzkOpHzHnRLPsXxsflOj8WKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721769390; c=relaxed/simple;
	bh=E0QRWyEOg+q3RsGsACmKO7O/WolLMK2r0fCiHo8RaxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/ss8TKGFQZGPtUQ2s0Dh3kpV8UT1MSLL23O6LQPF4ZJkGRBdF7QMZHSjcdnuXEs2IKWWdnNIuDHIgn+DbLfqSLe8gboZhWWyAd9oQca6QYC2un++DqxQ+Q0DDePeek7My8n/1lOkJSw0ct+U2P87159aRbk65cV63rKP8UlBds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os21XhD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0F1C4AF0A;
	Tue, 23 Jul 2024 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721769389;
	bh=E0QRWyEOg+q3RsGsACmKO7O/WolLMK2r0fCiHo8RaxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os21XhD2dJ1OEzOS2D14CZNvSdA6qglHT9HSK8JRS5uAvkT7+2kAMTCZ1cnIUsYWa
	 iOPNccsEMVNRrPWcI/qxPSoHcJEKBiU4IIrLXJUFPuc3If2iof+Uyn6RaIa06GyjPj
	 qzm4M3YxuOByow+vkQQtnqCDIH17r1f6uoPdrjnc9NjsFyEZlv7vuWBUKf/sYEJiTQ
	 IqbR4N3AIMFjnuHcl+kw7fqiwxjHUE/6xORrVqdBTR9l4nBH43vpxQZ8fLqiCVug9k
	 5ZG2qzGPZczzikV4SHmbwyb8yo5ffH7OcIi5g14QVCySgwZwEJW/p1N7eKCxbOLaQ5
	 URMe9Vn/9iEuQ==
Date: Tue, 23 Jul 2024 16:16:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-sound@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,apq8016-sbc-sndcard: move to
 separate binding
Message-ID: <172176938796.1119753.6821794654577391825.robh@kernel.org>
References: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723083300.35605-1-krzysztof.kozlowski@linaro.org>


On Tue, 23 Jul 2024 10:33:00 +0200, Krzysztof Kozlowski wrote:
> The APQ8016 SBC and MSM8916 QDSP6 sound cards are a bit different from
> others: they have additional IO muxing address space and pin control.
> Move them to separate schema, so the original qcom,sm8250.yaml will be
> easier to manage.  New schema is going to grow for other platforms
> having more of IO muxing address spaces.
> 
> Cc: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../sound/qcom,apq8016-sbc-sndcard.yaml       | 205 ++++++++++++++++++
>  .../bindings/sound/qcom,sm8250.yaml           | 137 ------------
>  2 files changed, 205 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


