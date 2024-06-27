Return-Path: <linux-arm-msm+bounces-24476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B991A8FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1173BB25A74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50715195FD5;
	Thu, 27 Jun 2024 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FGAyuebm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297672139A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497813; cv=none; b=fmgxfefcMQ4CPiN9dGpwVgw9sToBPKlt8q2d1/h+khj3V0WWEDSlHY5CvWqikCmrQK37nR/fBz1rDd5JrcNXHjr7Z9kC5YuSrr4GFxJmow67f5Ferbb/1y8uAlB+q+04C/3dpAWBXTQH4a6T8Cq0ksmeZ5R3Pwn/EMLBkiPf2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497813; c=relaxed/simple;
	bh=qjjnbU57weIOYRcdjrrR1/fPgGNkIoUxYPRp6csKbtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1mquWK0QfICM/UH5mCtg5fhkDkoVCmksbxGfjt9K0/CTjlKJDXZO1PSRJCaItAXgLyiCx5mveyk7IdsjaUlPUoqRd570hiuIIlDSiSX2Dsvv8y9xz+KVxHN++91e0WjJh5Iyzy8ZixMfRzyhQ7sqIBhb3gjEzMe512qj+nVgIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FGAyuebm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso23266545e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719497808; x=1720102608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bQN8tnejwKxuy1Mi/VKMT43leXAM0xGiW7kNCg1WSM8=;
        b=FGAyuebmK6OxezICd8dtGdwwLUsACdp0WB8kJSq1U4YBqtJI6lRUtxnILRpi2bt6w8
         bpV5j4DEiYoaGh8gemgEf4Xn5S9anwiY1Zyvi1JxT5Z9WMxcu3PZqTGCJhvMz2GpGjDC
         hRB8JtscvC8FNqJkmKME/M3Vvbwpxcb9Ojzu4aNECYHV//dIECR1sKbY8dQuNortlKv1
         k/Rlb+fqW9kwB9XHOVMmvZ5/VpcPJHszcW9PKiz064rY9dxWZwFExvcZzWvfbEr95R0o
         IUD5C8MIX+eVvpiG9/1Tr7dJMih6avrWfGC+qL+7UdRWhychXrNuglBKw/1ro70MldV6
         +R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719497808; x=1720102608;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQN8tnejwKxuy1Mi/VKMT43leXAM0xGiW7kNCg1WSM8=;
        b=rKJ3QwnQbVm8ozAxbtjeR2QSmF9FkpPu1KBMXZ9yxHnBjdQYl6hTh1eQf5H0yiDv8W
         LtXaix8MzBGh7siIMBgZHNGuIP+MtxBdlT3elntjVJIdpds8v9dJvFoUW/zVC38gR9Yl
         I7MdTNaLKtQr0apaY7QHfJ+Jgm93AnTc6fuFeydJdoQ2cVt7J6ofLI4w29asH6cjMqsb
         gJkRDgYuDcHzj41DJovUrjNQ6cQQQ+VgW7vJS6vssL0T8LvBKO/29jksoSyj17MgjIPr
         EyzHBy+f4TYr7GQTefAwgjDBBC/vuODj2AzsL1YNC9wPKREOXkZSmuPHE0SEsGVWzI51
         dZfg==
X-Forwarded-Encrypted: i=1; AJvYcCX8ZoRZxQkhDVLRh1dAUSBWnD3e0yENRTcqFEw5mq9VNdS2woBgdMqh00hvRXdXOotyGYcTU6gstKZu2tbA/YbFUFu3dXCWqmfFfPkHOQ==
X-Gm-Message-State: AOJu0Yzh+2YoyU9DFRZm+Kl35+stj/VV3Acf2i9PJXAwmoODeIx9pTqV
	z2AVJzK8hyvUW5pSSUZ89UoMxC7husAXnDpz4AsTcLG1mz9Zgrbqd5rQXWbr+1M=
X-Google-Smtp-Source: AGHT+IGv+4f+Ls4/ogYwKPteFfzmEmpruAxyo6CqPDudS5M7Gnd/zWsJ4x+0REH30ueT4cqQy7fO8A==
X-Received: by 2002:a5d:5f8e:0:b0:366:ebf5:c6d0 with SMTP id ffacd0b85a97d-366ebf5c753mr14912437f8f.47.1719497808404;
        Thu, 27 Jun 2024 07:16:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674d992187sm1685051f8f.38.2024.06.27.07.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:16:47 -0700 (PDT)
Message-ID: <3b897a1a-bd5d-4e6b-8289-a9c6b280f193@linaro.org>
Date: Thu, 27 Jun 2024 16:16:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
 <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 15:38, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
>> Add support to parse static master port map information from device tree.
>> This is required for correct port mapping between soundwire device and
>> master ports.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>> index a9767ef0e39d..72ff71bfb827 100644
>> --- a/sound/soc/codecs/wsa884x.c
>> +++ b/sound/soc/codecs/wsa884x.c
>> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>>  	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>>  	wsa884x->sconfig.type = SDW_STREAM_PDM;
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

That would be an ABI break.

Best regards,
Krzysztof


