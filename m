Return-Path: <linux-arm-msm+bounces-76173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D29BC0728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 09:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0393BE43A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 07:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2332222B6;
	Tue,  7 Oct 2025 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmW43mNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39E21FF48
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759820532; cv=none; b=Yc9YuDUh1klz5myNqKb5Ip9dW84J79OJSLo3R7lyxN7Xu7gOXgh01+eLeyB2NEMhgK8icXXUz9g7rtNmcqNHnXP+RQs68LcYv5jHaNqy1h03Xa5xQtnADy76YctFEy8k7D1AXwi7vWFPFN28XMR1w2fT3X01TeXJ9KYEtgX6svw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759820532; c=relaxed/simple;
	bh=vjHX1riWhOOmZwQJmkXA5D8R7upafbsuQzOYCWeGziI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hpryWQ4gxrlCS0TdxFCRQ6ABQIn30/HUtcNBv5l9i7sncL6uLbGXobn3qKlLSFoEdLA+7fHO5uAaEqVRuHjgxXbxcHRT3pVUY6ZRm58wf+t6lrwJ+SbZvjFqEVV6paW3CP/JLzAMdjEGTBf7OG6zsCR9jEDCD5k1erjFaznnYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmW43mNV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso5088058f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 00:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759820529; x=1760425329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgpnX908FQuLyIfQeu98K5VyP/tawjmh/goKPz7yARw=;
        b=OmW43mNVdaNhVQYidZWPlwopJl9H5+lz5QMCFG7RP8MzQpVdnxcP/gUhD8auQ+XTBM
         OtagrBdUwSqh8i7gkTG0XhP7BqeFWMwf0IS0tcRdOrmP1LF0M0Vuu80BAnE622AjihBr
         TQULqXEfu0W/ea34fnvM9nhazcidxOIwqyDzcKMKSSLT387onxcqwibKQAtrqbmUgEHU
         kfALU3sIDWLcDkN8UR9AztJyG95lZ/s1QbWc2dqbHwawmT6z4ayG8Qkhfzha0KPo88ca
         VdYu8fcN8NyJDBREzGBqFuDYYmgERXrvlnAPNlulfJj3tvM/TbRBLDEM/C/6MOU9ylzS
         HqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759820529; x=1760425329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zgpnX908FQuLyIfQeu98K5VyP/tawjmh/goKPz7yARw=;
        b=CVKsIiQZj43a1DHhsumMKFc5WO+znvl3iyAk0po0dqIRLdE84eLU79XKB77PNC37Bs
         4pCh9VWWnfB/2eqIovMH8mX27zIYPNtrhC7VwR36v5/aTt6RlaczkoCzVxzs0p/1Otle
         cZJqe4e+/+dOmZv35YflyqXaJB0n/dhJ908W2j5ehOBVYnl4ukQM4nfzBPS9Zlm8gAQO
         qnB9bFCgdz9CqEu/Q0TcBUoR21XhaYmLLgmNYhugPA8kOsYnD0AT9rS/7R6+qvDVpCpy
         x3xU1SO0wg8LE33HDJbzn12Cwj/W1pqNnA5j2kUGbL0EVLX0WdMASJO+lIPMve1/FeoL
         RoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwL7u3GctIl/AFjQyqLcgNm6H3340GL+EOO4WaHYhQO9JkRhrf+rJKg6/yeE9XiPr0xi9cqFcN5UCC1wSl@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1e27ixLLLJeLgFN2Ev6e3owDOgW7A1bjUgpFIptY5+GxXwkI
	5+sgdH8qryGzSJfTqYWF+tTQWDQwPWBjqCLSem6iDUfEdUb2/yt+XbYhTB4BXbshcQg=
X-Gm-Gg: ASbGncuMrOHVVFPIS42sFaLmM6V6djS0uBP5pkhhNHg5S0n1lQqJ6hDJEyxSRp3fFOE
	hpnA9OgFtzPdcQ7XDJaJHNwEl8C+7NEO2rDxlYM+lvnlrqdM8QOwtJFBBBHCtBkCgZTvgsFyE5q
	sfwg0Z40EBl1egRhEmwocn9JxuMfsnw1B/jWI5FV3QKt8bh/OEo5bnNIeLOTnsy2UaneretS13l
	UAihIjsIKq48/BPXeYd/clJJPADxaOMJO6s5wkg2ldvOQZcwe5XdFoGWMjlPM5jT+mhBKgyCOZQ
	VVpThHJrqjAIWpSK8+w5V5818Xz6V3ATu9YDOmy5Cyxu5qEnWSAtctv09N+2ce5nX/UV5sj5Z84
	dZLIKKt0fBGrsNCInL/oZ80nUNhNpyM8grjPSiMeT0LEYFHkQzEfoiR8LtQf3sMU6uuoYWBMXpj
	hDIz1zzV8llCz5ydM7py6L7OQJi5A=
X-Google-Smtp-Source: AGHT+IHhqn1QXvNjlPmsFhGF/W8JYFKIFTND5frHhfPy40hlB4K1wPdDnrDBts14ZYFGsmS35vDOmA==
X-Received: by 2002:a5d:584b:0:b0:3ea:f4a1:f063 with SMTP id ffacd0b85a97d-425671c15f9mr9525255f8f.55.1759820528330;
        Tue, 07 Oct 2025 00:02:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bd88:41d2:33ce:f74a? ([2a01:e0a:3d9:2080:bd88:41d2:33ce:f74a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f027csm24469493f8f.40.2025.10.07.00.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:02:07 -0700 (PDT)
Message-ID: <1eab5200-1292-4d39-bdf8-0c5084cfaab9@linaro.org>
Date: Tue, 7 Oct 2025 09:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 3/6] ASoC: soc: qcom: sc8280xp: add support for I2S
 clocks
To: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-3-184b15a87e0a@linaro.org>
 <6492e444-4196-4900-a741-a74a8c506a6d@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <6492e444-4196-4900-a741-a74a8c506a6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 00:21, Srinivas Kandagatla wrote:
> 
> 
> On 10/6/25 7:37 PM, Neil Armstrong wrote:
>> Add support for getting the I2S clocks used for the MI2S
>> interfaces, and enable/disable the clocks on the PCM
>> startup and shutdown card callbacks.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 104 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 103 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 78e327bc2f07767b1032f09af7f45b947e7eb67a..ad4ee5c6fab8994f18de572842f3dab6f4f5397e 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -4,6 +4,8 @@
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/of_clk.h>
>>   #include <sound/soc.h>
>>   #include <sound/soc-dapm.h>
>>   #include <sound/pcm.h>
>> @@ -15,12 +17,16 @@
>>   #include "common.h"
>>   #include "sdw.h"
>>   
>> +#define I2S_MAX_CLKS	5
>> +
>>   struct sc8280xp_snd_data {
>>   	bool stream_prepared[AFE_PORT_MAX];
>>   	struct snd_soc_card *card;
>>   	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>>   	struct snd_soc_jack jack;
>>   	struct snd_soc_jack dp_jack[8];
>> +	struct clk *i2s_clk[I2S_MAX_CLKS];
>> +	struct clk *i2s_mclk[I2S_MAX_CLKS];
>>   	bool jack_setup;
>>   };
>>   
>> @@ -68,12 +74,66 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>>   }
>>   
>> +static int sc8280xp_snd_i2s_index(struct snd_soc_dai *dai)
>> +{
>> +	switch (dai->id) {
>> +	case PRIMARY_MI2S_RX..PRIMARY_MI2S_TX:
>> +		return 0;
>> +	case  SECONDARY_MI2S_RX.. SECONDARY_MI2S_TX:
>> +		return 1;
>> +	case TERTIARY_MI2S_RX..TERTIARY_MI2S_TX:
>> +		return 2;
>> +	case QUATERNARY_MI2S_RX..QUATERNARY_MI2S_TX:
>> +		return 3;
>> +	case QUINARY_MI2S_RX..QUINARY_MI2S_TX:
>> +		return 4;
>> +	default:
>> +		return -1;
>> +	}
>> +}
>> +
>> +static int sc8280xp_snd_startup(struct snd_pcm_substream *substream)
>> +{
>> +	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>> +	int index;
>> +
>> +	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
>> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>> +		index = sc8280xp_snd_i2s_index(cpu_dai);
> 
> What is the mclk and bitclk rate set here, we can not rely on the
> default rate.

The default rates are set in DT:
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				  <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <1536000>,
+				       <24576000>;

Neil

> --srini
>> +		clk_enable(pdata->i2s_mclk[index]);
>> +		clk_enable(pdata->i2s_clk[index]);
>> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return qcom_snd_sdw_startup(substream);
>> +}
>> +
>>   static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
>>   {
>>   	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>>   	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>   	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>>   	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
>> +	int index;
>> +
>> +	switch (cpu_dai->id) {
>> +	case PRIMARY_MI2S_RX..TERTIARY_MI2S_RX:
>> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
>> +		index = sc8280xp_snd_i2s_index(cpu_dai);
>> +		clk_disable(pdata->i2s_clk[index]);
>> +		clk_disable(pdata->i2s_mclk[index]);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>>   
>>   	pdata->sruntime[cpu_dai->id] = NULL;
>>   	sdw_release_stream(sruntime);
>> @@ -141,7 +201,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
>>   }
>>   
>>   static const struct snd_soc_ops sc8280xp_be_ops = {
>> -	.startup = qcom_snd_sdw_startup,
>> +	.startup = sc8280xp_snd_startup,
>>   	.shutdown = sc8280xp_snd_shutdown,
>>   	.hw_params = sc8280xp_snd_hw_params,
>>   	.hw_free = sc8280xp_snd_hw_free,
>> @@ -162,6 +222,44 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	}
>>   }
>>   
>> +static const char * const i2s_bus_names[I2S_MAX_CLKS] = {
>> +	"primary",
>> +	"secondary",
>> +	"tertiary",
>> +	"quaternary",
>> +	"quinary",
>> +};
>> +
>> +static int sc8280xp_get_i2c_clocks(struct platform_device *pdev,
>> +				   struct sc8280xp_snd_data *data)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int i;
>> +
>> +	if (!device_property_present(dev))
>> +		return 0;
>> +
>> +	for (i = 0; i < I2S_MAX_CLKS; ++i) {
>> +		char name[16];
>> +
>> +		snprintf(name, 16, "%s-mi2s", i2s_bus_names, i);
>> +		data->i2s_clk[i] = devm_clk_get_optional_prepared(dev, name);
>> +		if (IS_ERR(data->i2s_clk[i]))
>> +			return dev_err_probe(dev, PTR_ERR(data->i2s_clk[i]),
>> +					     "unable to get %s clock\n",
>> +					     name);
>> +
>> +		snprintf(name, 16, "%s-mclk", i2s_bus_names, i);
>> +		data->i2s_mclk[i] = devm_clk_get_optional_prepared(dev, name);
>> +		if (IS_ERR(data->i2s_mclk[i]))
>> +			return dev_err_probe(dev, PTR_ERR(data->i2s_mclk[i]),
>> +					     "unable to get %s clock\n",
>> +					     name);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int sc8280xp_platform_probe(struct platform_device *pdev)
>>   {
>>   	struct snd_soc_card *card;
>> @@ -185,6 +283,10 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = sc8280xp_get_i2c_clocks(pdev, data);
>> +	if (ret)
>> +		return ret;
>> +
>>   	card->driver_name = of_device_get_match_data(dev);
>>   	sc8280xp_add_be_ops(card);
>>   	return devm_snd_soc_register_card(dev, card);
>>
> 


