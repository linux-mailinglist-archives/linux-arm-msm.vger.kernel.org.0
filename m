Return-Path: <linux-arm-msm+bounces-63048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C7AED6FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F9F1897B4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 08:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B48221286;
	Mon, 30 Jun 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1wbi9pO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210F17C220;
	Mon, 30 Jun 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271683; cv=none; b=flF9Fhk6qGGJedAKwr0Me6pyfZDixbbDaEvwD1xSW/+4YmkB14ZJVrUtlUgYg5KNseyg+Bc/0VCwzWGRdAIrwXWMb7rb4c5ew7/gqKEFvXorgPUkhBclQNhqDokaf4kd307mwJuTIA6btwdJzjGn4U61cUMhrFDo4iHQJbeQtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271683; c=relaxed/simple;
	bh=A5KG76MjVqQz4FQ5pKlatgGt40T2Lao+QWmOmHaiFAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FggsAYSpamCCa8YlyiJV3EWa1c73RDiyoSwVQYYmWfvNQQgePMUI/famcYg7wys4A5sTxzDnN52EMFS78WMEK/oOTowY/kmEjWpfK99o2r9pwoQlYYDoBi3nVRDuGe+bCgTs5zmUje/duIwsP1QDu+HWtbCx+pZN0hA+qlcw2ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1wbi9pO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADD8C4CEE3;
	Mon, 30 Jun 2025 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751271683;
	bh=A5KG76MjVqQz4FQ5pKlatgGt40T2Lao+QWmOmHaiFAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1wbi9pO9A+MYQ9kNQkKAxOjCi/B89Bc1Fb1ilE6hwaXkh3dwmfZ3oFiZxIeUWbON
	 gf52/2T6gAeg2pDHbsNglkbvmew1uex2kismgr7xFbTPee3WHP+42PfnTYNZw7ArT/
	 MS/nas+5orQH0B5ogMi3IZstz/FDl/+XcAYmmCFmLUsc/5O35S1YXnxGaWS1gleQkb
	 qp6WSacH36DrqgzNse7AIQ/4b3hi0ix970fCN6L0DznRy7n5Z4/+kHc/Hrq0oBs6UZ
	 qIuRJKfHaI0/4XAsXpNMsGDWd+13hECI5F4r73CcdnwQcw3mqHSoVF+F0PYlHRp1Zm
	 qFyx6/R4cH/vw==
Message-ID: <d24b2a88-fda7-4a8a-bb5b-73d8a928ff89@kernel.org>
Date: Mon, 30 Jun 2025 10:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
 <wcmalvywoginosy5pp7wskgdzjbwbydividmk4dtwguoltiobf@muw5lzkvgu5c>
 <DAYBDV1I7HH0.1GG9U3LI5NQ97@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DAYBDV1I7HH0.1GG9U3LI5NQ97@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/06/2025 18:41, Alexey Klimov wrote:
> 
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            audio-codec@f000 {
>>> +                compatible = "qcom,pm4125-codec";
>>> +                reg = <0xf000>;
>>> +                vdd-io-supply = <&pm4125_l15>;
>>> +                vdd-cp-supply = <&pm4125_s4>;
>>> +                vdd-pa-vpos-supply = <&pm4125_s4>;
>>> +                vdd-mic-bias-supply = <&pm4125_l22>;
>>> +                qcom,micbias1-microvolt = <1800000>;
>>> +                qcom,micbias2-microvolt = <1800000>;
>>> +                qcom,micbias3-microvolt = <1800000>;
>>> +                qcom,rx-device = <&pm4125_rx>;
>>> +                qcom,tx-device = <&pm4125_tx>;
>>> +                #sound-dai-cells = <1>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    /* ... */
>>> +
>>> +    soundwire@a610000 {
>>
>> Drop this and next one.
> 
> The audio-codec node supposed to have qcom,{rx,tx}-device properties.
> If I'll drop it then the example doesn't compile well unless I am missing
> something?

What did you drop and what did I ask to drop?

> 
> For example when I removed soundwire tx node completely and dropped
> qcom,tx-device then:

I did not ask to drop qcom,tx-device.

...

> 
>>> +  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
>>> +  It has RX and TX Soundwire slave devices. This bindings is for the
>>> +  slave devices.
>>
>> Last sentence is redundant and makes no sense. Codec has only slave
>> devices, so how this can be anything else than for slave devices?
> 
> This came from other similar files that describe bindings for child codec nodes
> of soundwire nodes. For example from qcom,wcd937x-sdw.yaml.
> Should this be rephrased to "This bindings is for the soundwire slave devices." ?

You just pasted the same, so I don't get how you want to rephrase into
the same sentence.

> 
Best regards,
Krzysztof

