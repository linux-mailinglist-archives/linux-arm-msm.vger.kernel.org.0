Return-Path: <linux-arm-msm+bounces-71217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68673B3B398
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2462B179409
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 06:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09425D1EE;
	Fri, 29 Aug 2025 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H70S8V7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9A025783D
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756449935; cv=none; b=BvpNr/mZ+wzrr48VnDBp8VBcC76JodOYDrZRpOMucR2eLJ+KmXDXF4Ljv1dO9I9IU+iEMUj0fw1/Tg/WbCYnczgoIwIDuVP5Su0khOZsO27DU61paQRqw9SZc5dgvklYX2V3sCYOkcvlha4BZJLVpsouVJCXqL4NikSNWzG+fLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756449935; c=relaxed/simple;
	bh=+Nbhht8OttmuwtvhGh2bKsz4qLFRFOJciViOoAl+BGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fLy38DoIC4JFdfv7uqwBI842UNYaCa00awxooqqYl+dhmyHDMWtm9qaqoK/1qAcm1KZes+/3quHVqeDERhW51QYVicnOy14PxpkEzyUb8rDTqYYa0ggmrQaQk5vtm65MMMyaCqww9Ns8MywC9tg/+TG6k79Xb/ahVhNxjbVEvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H70S8V7r; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6188b72d690so304227a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756449932; x=1757054732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCHzGqkgYmIfqgWjVZZUJtVWZa1LO5nYjlu+Fkm0M9Q=;
        b=H70S8V7rK3PNmAGkh/sEbq2OTiHMM2rjJ0wbyj5wGLLEPy8iTkLwVaYGQ/oHi46VrN
         koIwm1Xs3X1RaLmD1z6CEvHZZI6S24waV4ie2Z6iw2pghBZMzVvOMuU7Dv2NP0WAhNQF
         x2zwZT4/8yvEuZ1NMokn+ysoTVNaozRhwzzsv7k7v15OGg/gNI7L1S+Ze+Fzmzc9disD
         jdp9yFl5SQfoBosoxCxXAbbLPLD0OqZ7a/aUQTYD2DlFIv5hr7kTkqAJkX0NU4mNglj4
         UbLR0qkjPSsl6hdFOT4o8GK3FYj8skiZpYHhxdal/LfyaxFxTUnJQrUVbiwbDU+72s8Z
         9HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756449932; x=1757054732;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCHzGqkgYmIfqgWjVZZUJtVWZa1LO5nYjlu+Fkm0M9Q=;
        b=K2DBlwmri0B11wcFrVGNXSdK7D+EhxN3VEob88oYzORB+WnlJXHl71YWKrre4y0Mhc
         fuuKCpinrpPChbBbpx9F4JhvzNZ011gRa704y1g8MJuU0pYmME9hOz5v+wbRQG7ftUZe
         mBzhIopQ5dAtTHzvf85gaEBjf0aOiick7qvziG4K0nHSTRrFvXoNyPXCI/p+Q726vPDx
         G1XsFHXcbS/irfAk9zzB2ZslGKNj0ZFIqUCtDxAvRM610bm/l/wa5OWIh/IWrv61fwae
         JZ4usjwFJ3Ce6pVLzW6G6AyZrp41tTaRlUGF4iB+9W4XVGTztlp0PbN8dxxkdPt70oVf
         QCNw==
X-Forwarded-Encrypted: i=1; AJvYcCUYB8Sb8vRPg+HDPfO0hXl8EaR00nGbcT5gGELEbeTdMSM6/vgdQmJJokQ2vdWYHKW4I0mz+zYRhTprUJM9@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcnGaLjYTi5iS0YM64y6v81uerNqlDWmmGp2AbgD5PGB7xqYN
	T4yXZjovduWrWL15NEFRMKSJByp+tCIeukzYKpKsxRu3TwMCCc7IL9HfhRrp8Ig3mZ0=
X-Gm-Gg: ASbGncvt9opZFHFpkmY61FXKFA1Q/n0QmkvgfLt3a5NrzvuNC5kSOr6XURcD5dZ7dzs
	7/WLEhqJ5bw/ZkYhRqchzyvlHAks75VsZGB1x0ooZkoRuCB1m1e69pKQsYmZ/I5gLJEfTtqC/eT
	owzSC06XRWmz98p6u/30Nbnp0C04xGdo5ZrPlm3UfFzrKeEMnGasHNNOq1Cb6MIVzoQVRUN+50r
	Ju6b2tI7uVm9bL9EKg3H4vLtCcC/XwwyC7yFv0mMRukjp8CyHnUuW4bP7KphSgOjMpD4s4ojscF
	Nt7wuooOeLYoLMRHwhvELw1T8Zd3CLUHbGjjZcQsdMD9uaSSH1E+HqkwYDVp44lVMoEXHQr/7DW
	UIjfP5IfKl3Xq+rRzSnOk4qso9T87rqEZBdHjgwa3BbQWKM8n90rNVQ==
X-Google-Smtp-Source: AGHT+IF+oDYGTRu3XEA/GuUdAGOMifZUefmmktxV2vhd7IP4r9v2Eq985abdUQBQIcwC5jqgiouUFA==
X-Received: by 2002:a05:6402:5203:b0:61c:484c:a533 with SMTP id 4fb4d7f45d1cf-61d0d2a91ecmr115449a12.1.1756449932192;
        Thu, 28 Aug 2025 23:45:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c77f9sm1174034a12.8.2025.08.28.23.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 23:45:31 -0700 (PDT)
Message-ID: <c103da1f-b4ef-4f2f-8648-dda636094bde@linaro.org>
Date: Fri, 29 Aug 2025 08:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
 <20250821141625.131990-4-krzysztof.kozlowski@linaro.org>
 <6a4a601b-937e-441f-80a7-3f733fc86445@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6a4a601b-937e-441f-80a7-3f733fc86445@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2025 12:55, Srinivas Kandagatla wrote:
>> +
>> +	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	op_cfg = p;
>> +	param_data = &op_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
>> +	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	op_cfg->cfg.num_channels = num_channels;
>> +	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
>> +	op_cfg->cfg.quick_calibration = 1;
>> +	/*
>> +	 * op_cfg->cfg.r0_t0_selection should be set only for normal mode, keep
>> +	 * as 0 for calibration
> 
> How do we move from calibration to a normal mode?

The same as in previous patch - this should be normal mode.

Best regards,
Krzysztof

