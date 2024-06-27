Return-Path: <linux-arm-msm+bounces-24482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3C91A945
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CEA11F23ACB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79A7197A61;
	Thu, 27 Jun 2024 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCqzf9+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4E195FEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498864; cv=none; b=MizATKkpg/7KZ2kC+Nimi8Xg55WoHFoIou0NAAONBuIW72bCiVJ/+nytR18NW/g8D4z/eEFWVPAaSgmi4jZxIPMWkMd7XP51FWokM2a0h6ElAA51/46o1tl0BLH/c/H2qYnvADbdyAX6uK3pu3slurSDl4y6+c67grhvpt/k4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498864; c=relaxed/simple;
	bh=ghjiOzeJJ4xUTV3c9CgXH0R3rvayw7UkOWVIgVtMIPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbpj8gxZHgjxx/OZf3FJ7Fq8odGh7D6x+i+Ye0WbqesdK8nWY3Ml9TD9TEZvV3aRhxPsEDwYmoQ9OYLCrx+p9tPH/wsaPf5nOL4b7Q0ei7oOWQ2hJnJ2jFfY34/b2NgS7vCv2goz04l2tqR4kIxd1OL+90qGUt49CV62o9y7j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCqzf9+j; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so89944651fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719498861; x=1720103661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6WlQhzaEQCr3M9aJ4AKzbvoi4K+rnc7BXOCfJ1sz2M=;
        b=qCqzf9+jKzTMyF4T3D6ci7AKsVRpvaFCJ1RQIwt4OmtiDbuSuRubfcjMs0r0yis6DW
         avF0QM0RZi6slwZIC1/sPc+FCp8ASoBAmwYSmSgGdOQKAnH0AKmxq7E4UkgAKAw74QE1
         YU4dHY9jFs4kNGDQeuzcVqVuoebTs/JoDlZh4SOkExDuqjCisvomSJqInAvN4nyhmOQb
         AYY5GbEb5LzvVonacr0AnPDGTT941QSenS252c4Dt5/fla9AqKETUu/G4RUxTcTNzxb4
         F7ydsbLPq/+BdhGFJkCqSQicFfoPOkyxmqfwUmsPx2SFx1AeF6rTXR4zAsCnAQg3qZSZ
         oMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498861; x=1720103661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6WlQhzaEQCr3M9aJ4AKzbvoi4K+rnc7BXOCfJ1sz2M=;
        b=pfvHPXUCctRxmtXqMikeMFthfR+kRkpXSJeKE+DTRadnaa4oBlFkJo3HZrjCOP6B7f
         /BrTmKbsRBRubaDKFSFbrb/cZ54PEuaY3i6Ltoy/MX/4b2m/6VBhA6mB8z3omA5aJaFj
         lXOThokpSIPI4ao0jyhxpDmBciw3pNeWOFSLEtFIUUgWg7IgSVSCkVpCs/rKPmm5UEoL
         hl5C9xVe4/e/eLRvnUXxxxDmQ6zjMRXAHJtskLKIDkNAQ6rR1DCUboYZqajToStpKARF
         oKWWqA4YSmqOW6Vf6ZwZoQfHW0MRbonSS6K1mwFyHrfPxlzzjnDxXbJ6IVHeyheFhvUX
         inFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaTUmg2TjTmqfiNGuYGJKi1N9jAF/kBT91OBXFOcsUeHAzmR7twAy4DUTZauZkjbUp1+GTBXh8a91VthS6R9PVZCeVwzgZDt0GpILn8Q==
X-Gm-Message-State: AOJu0Yw/klr7A1SzqZ/kftV+EtOSXcXzYZ1n/keVBIYaN5WIIQGVhPJL
	oK23uHvFpDPWInjKdEwyJETX5/0e0dAZpJSjMuAZ7cixBkZ/leSaRfInck3lnoI=
X-Google-Smtp-Source: AGHT+IFxKe4Cm33uzN1eEWdat5RzDVQ5k0Z6h4cYZ9qjbu7vikAxnG0ORLLkLC8mWQsd1fnj31WW1g==
X-Received: by 2002:a2e:7a0a:0:b0:2ec:5277:e5b3 with SMTP id 38308e7fff4ca-2ec5b38840dmr90808491fa.36.1719498861291;
        Thu, 27 Jun 2024 07:34:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-425692761a1sm3161575e9.10.2024.06.27.07.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:34:20 -0700 (PDT)
Message-ID: <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
Date: Thu, 27 Jun 2024 15:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
 <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2024 14:38, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
>> Add support to parse static master port map information from device tree.
>> This is required for correct port mapping between soundwire device and
>> master ports.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/wsa884x.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>> index a9767ef0e39d..72ff71bfb827 100644
>> --- a/sound/soc/codecs/wsa884x.c
>> +++ b/sound/soc/codecs/wsa884x.c
>> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>>   	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>>   	wsa884x->sconfig.type = SDW_STREAM_PDM;
>>   
>> +	/**
>> +	 * Port map index starts with 0, however the data port for this codec
>> +	 * are from index 1
>> +	 */
>> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
>> +					WSA884X_MAX_SWR_PORTS))
>> +		dev_info(dev, "Static Port mapping not specified\n");
> 
> Same comment. Either dev_warn (if it's something to warn about) or
> dev_info.
> 
> Or, as your commit message mentions that it is required, it should be an
> error if the port mapping is not specified.

This is an optional property for older SoCs which have 1:1 port map 
between device and master.


--srini
> 
>> +
>>   	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
>>
>> -- 
>> 2.25.1
>>
> 

