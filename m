Return-Path: <linux-arm-msm+bounces-62574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07977AE93B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 03:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1D3188E19C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 01:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E1C1885AB;
	Thu, 26 Jun 2025 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SivDk4eE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9F1494A9;
	Thu, 26 Jun 2025 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901461; cv=none; b=WEolbF0tB3NcPcYOpKEj3VT3S7MQpiYxU5rho9uQrzjvxPlS31xJc7gK+5mrxKK4WAgdNQj9KBnoAOoUi+ab2mVEHhKJUbn8TMsMkpBkcaVuJ8e6Dq4nzNrxOYIiwU7kT2YvgrZzbDucKnVtSGsBLd5QlwMC8+QJr8J/Rl/e8mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901461; c=relaxed/simple;
	bh=NDQSvvYRBsU/VaEDIahaF/xTnl/9PAVZzq2BKXAfSIg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qHKPqnb2w8rIZJs6BvUvy+0uttmPXs8fy9gKH+gXBJThl7uTsIeXRO2uDV/3BU2VOYUYpeOB3av1Q2LUf9seaEFx9trZu6PbwHmZpsAgazEWExjxDenSt7IqMWEbmmqaZF4xWAoGVQVOEo+bTwYmgTeCOF0lBfVErrummydumZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SivDk4eE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1FDC4CEEA;
	Thu, 26 Jun 2025 01:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750901460;
	bh=NDQSvvYRBsU/VaEDIahaF/xTnl/9PAVZzq2BKXAfSIg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SivDk4eEahk+3uEn9qZu4Lj3gOWkBciKl+eY2uRIHXGkeIesJy6yt++2AEUv4+hSJ
	 zBGwa2cvsub4fD/Su3NH4zOutLvOAgQ4HJn7S5737zqA2pyXShnQKVVubF399nOZXm
	 oAbG0EG48Ln5tBCa67ZkLwncye5B4+i43dEF9YyanWOlnwW1kOxvZFYeuRztzcwhV6
	 6nuNz/aD9Po7ZlrQmPMsK0sTc2rLdqXmslEN/tIj0YvHFoBFIrn73pQECwTFmKV4gy
	 LQIj3PELy2klUosGiVKHkmcimV0Bz1RsKs4VY6MiEzKuauVBceB3UeXaaG96Tx40dg
	 MLmKDbPwkXfiw==
Date: Wed, 25 Jun 2025 20:30:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, linux-sound@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
Message-Id: <175090145961.2702141.17071553013552846812.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec


On Thu, 26 Jun 2025 00:50:29 +0100, Alexey Klimov wrote:
> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
> It has TX and RX soundwire slave devices hence two files
> are added.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,pm4125-codec.yaml          | 147 +++++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
>  2 files changed, 233 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.example.dtb: pmic@0 (qcom,pm8916): audio-codec@f000: 'qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'vdd-cp-supply', 'vdd-io-supply', 'vdd-mic-bias-supply', 'vdd-pa-vpos-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.example.dtb: pmic@0 (qcom,pm8916): audio-codec@f000:compatible:0: 'qcom,pm8916-wcd-analog-codec' was expected
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


