Return-Path: <linux-arm-msm+bounces-69156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D622B25FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163D216B4C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4362E9EB0;
	Thu, 14 Aug 2025 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTexBfin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E92FF662;
	Thu, 14 Aug 2025 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161612; cv=none; b=RdKi5Ai7ASlkM8MSSP0+/gROzTPIyEURhukoslvImnfIsf/I4xJangHZnJF7/aQ3NHhSDH+y842F8Si5/6dEs+riYI0FAO1mpHt4FMrfkz2NeUQmjagn61MZE1OBCD+bKMAZljz/5K825pVDy0ZOzu4RUgHitS7uRkBXdgm7BdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161612; c=relaxed/simple;
	bh=Aw9/H/ssUqLkdP7vItMsLTFaEMFv2jPsQFtcGF+H6p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8JvrEVo3RVP8m9UTn9mMyVFUBMuq6lGSNLQPSarlrOWrQYw0ug0cgLvU/Ltf4xKHOXcUbU9GOUfHsj1xjpd7YxGPFRZniZwMHg2aqIgVt3SP5fJpvFDAkbQs8+87uJEiuT5gqMWx66yIDNxIZrcfoWouTzyhiCyWQ9vjZv43+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTexBfin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF66C4CEED;
	Thu, 14 Aug 2025 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755161611;
	bh=Aw9/H/ssUqLkdP7vItMsLTFaEMFv2jPsQFtcGF+H6p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTexBfinxK9f+PwnOW0OmsxSodRk6v7JTi2bX13TgqPqCmx2xybX4+71ZY3ux45QA
	 aMoaa3Fa8YaZnGE8qEIXBNZAPaoF8hMLLdn/XDPMsOy+n6VDsB0b4qVCaOcHXZLlcL
	 msehxA6XJ7BcwC3VRujuvoKo7wNLpgGW+nwDJQ9ZKOmnEfbIWnZgYX/r75nb7ZBGrW
	 DutDYegRsy9RANXcKlnVD9mfXei2rZPufjgCfz2/sSZ1mX2ye9xsslOB9/0j7i+Aor
	 hdn1eEUj9gH0m6hv4wXjQEQ5q/2/4vWvT7q345fRWzpTCeuLrUrLmRgqo6SwjhwZtw
	 uGRlqHSWbX3eg==
Date: Thu, 14 Aug 2025 10:53:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Message-ID: <20250814-little-lively-beaver-b7907f@kuoka>
References: <20250814-pm4125_audio_codec_v1-v3-0-31a6ea0b368b@linaro.org>
 <20250814-pm4125_audio_codec_v1-v3-1-31a6ea0b368b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814-pm4125_audio_codec_v1-v3-1-31a6ea0b368b@linaro.org>

On Thu, Aug 14, 2025 at 01:14:47AM +0100, Alexey Klimov wrote:
> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
> It has TX and RX soundwire slave devices hence two files are added.
> 
> While at this, also add qcom,pm4125-codec compatible to pattern properties
> in mfd qcom,spmi-pmic schema so the devicetree for this audio block of
> PMIC can be validated properly.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   7 +-
>  .../bindings/sound/qcom,pm4125-codec.yaml          | 134 +++++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
>  3 files changed, 219 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..068f495645f6e849bd98b226c958ad67ba521dd5 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -137,7 +137,12 @@ patternProperties:
>  
>    "^audio-codec@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
> +    oneOf:
> +      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#

That's not the syntax present in display bindings I referred you to.

You want compatible as enum of:
 - qcom,pm8916-wcd-analog-codec
 - qcom,pm4125-codec

> +      - properties:
> +          compatible:
> +            contains:

No need for contains.

And this can be separate patch, because it targets different subsystem
maintainers.

Rest looks fine.

Best regards,
Krzysztof


