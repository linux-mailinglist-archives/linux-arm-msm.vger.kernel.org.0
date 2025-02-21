Return-Path: <linux-arm-msm+bounces-48848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B1A3F0D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9FF119C73BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16C52080EA;
	Fri, 21 Feb 2025 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmiXNYn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E7204C23
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130935; cv=none; b=HK2CeYCSfRzBvfMeZPwrfhCHMipQupbZIu7fHpsGlFSn7VwCHczOp3eTdMUMYlVFHKOKGbIwpOLvu1SS22qmt5HoITMQpztG0iudkk94TmQArUu0NmR3/h7RBsd+JQ/b74VDGb+7jBmyWcTvFuxBLgs7ZBr52575Lvpg7SH1Uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130935; c=relaxed/simple;
	bh=3d2Q2o3fJiHi3cJPY5LQ4dMhZv4asm/ZCUv1sU8Cby0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9D736ncGvps1G7zXt/UQtGujW9F9fXoZYTZBCDiKM1jMxEiXTv793l8Jk40KM1kmb0MEKHibU+Tg2PHqjISE6yH9GQjGeOCpqWjZEc1YWnKsjwwSXFDixph+mO797TxVkBCxDEqBzQSS2PdOmuYFtZy5tVqO5lzJAqGfuW704Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmiXNYn2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43989226283so12785205e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740130932; x=1740735732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0J1Zwx7ue86k31iPRIPZZnmcI3lqDR1yT4y7QR55Zw=;
        b=nmiXNYn2abBlSDT+VzOFkFi7ImXLd9LMVco/Bw+50r7zsoF2yHY8TqX+FoFGBdPhQd
         Yo2YO96ALOdf1bWyc4B1LumgZ/nWv0s6Bi03BOCBsnalh9GQzncqYFFak9BCNLR6zuKK
         Gc/ItE9O4O6hX/UCwF9WD9SlzeCHZ0JGLSQEeXx+jJqbTwKSDnxnswtxBT5C/eY3BkEf
         f6ckh4SGW+Lh7mp3T1duZi6AYQFP7dYMnDj5NQ2Ed7cc+WGwOmqyGcFeO5jPkhE7Ca+O
         zMBeIWVdVuO7+bKo9yEEr8pcj580qhLknL6x2w9/WuZVEx/sHj9YxlV0FT4j5eMOBlE5
         K65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130932; x=1740735732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0J1Zwx7ue86k31iPRIPZZnmcI3lqDR1yT4y7QR55Zw=;
        b=jd6HaQckPpZCKoEjRe7viw1U1ZSQr5LiNjtNm64QPNoBA9TRRzfDASYe0EnPrehWDk
         1lyHevAikAskTE1My8moJJvTCVaLlfp0heudPPiJOeSqONa8k8I7drX+amHW19+wZglB
         9mnlzJOexZbBWO4RExVC8S/9Tb9geoOiN0hZbUdM0kqLLnm1DtIlqI+nZ8zcz/VxK//T
         Lr6C4A8zdRrvhi5ZcD/a3VkEMmSRFMBMNlcmLmWXxSlI/YgOIYuVMwA23Q9LDvpxUPjR
         Ij4kyX9eOaZdIOf8t7lqgXuAjfAgL6SF+4rCLQR2Up4LcyxsK/GbIIxahykiJZXgRCjF
         RHOg==
X-Forwarded-Encrypted: i=1; AJvYcCVQO1UDoyPXp/aNvNeDuQT5ofIsclp5CPgS20UoqpYRr+alTXPNfJKdWM44oEmcmZ6Zbse/Vj0bqPc2bFFp@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+CLsU5N2vLSHbJwVvHQhd6cUVeSYPdQNV9fZwY/M8XRk02kQ
	eRjdd+hiudO27ER+u0J79PIZ0SlA2yXaQ1EYzt5CKrxkxtNx26IgC0gTodjuEkE=
X-Gm-Gg: ASbGnctJ/3Kbw+GbdTm0UEERa0QsX+/qq/MJwnXzcb2oUNidjR0WNxzv8h92hkLdk+Q
	oNubJYMhdYsnN5VLVFCvNEfIMYZK1YMBNpmI+ix0pgnZuoKgL1rMtkJSUaJIv8m21RT63on7KCZ
	6+S4WZR8F9vV597falCu+ZUbmgbU7y60hPf2DXQjYM+XyN1ZC1JwiDMUP2VEWy7h2eozLGHsm0X
	onsmYj9FLdHJYwqZyHrjJeync7DDWWXUYSYqFGOuREIlTFZ0RxPkOVOujbHyqwk/mtVURbs1aLU
	hjLR3tWXK+VB3a89CLx2ekJSr8Tnct2pzsupEf2H7u+QkoZbji4VUWNUV2h9zNeGwCM=
X-Google-Smtp-Source: AGHT+IFroyABBpOsabWsgrl7KBQzfGBjKB3F9B9Cviyl/eoKnSnufExjTKsMZhY9Cx/IPYZ4EIrCAQ==
X-Received: by 2002:a05:600c:3151:b0:439:a1ef:c242 with SMTP id 5b1f17b1804b1-439ae18fdc1mr24592065e9.0.1740130932194;
        Fri, 21 Feb 2025 01:42:12 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399be79d92sm53108625e9.0.2025.02.21.01.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 01:42:11 -0800 (PST)
Message-ID: <85a51258-7cee-45b3-8760-bfbf943500c7@linaro.org>
Date: Fri, 21 Feb 2025 09:42:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
 <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
 <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
 <r73hnpusatba3hvyckv7jw3dcvffgvoxwawlcvvxhuol5rrrk7@ngo3fiv7va6e>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <r73hnpusatba3hvyckv7jw3dcvffgvoxwawlcvvxhuol5rrrk7@ngo3fiv7va6e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2025 00:10, Dmitry Baryshkov wrote:
>> +static int cam_cc_x1e80100_configure_plls(struct device *dev,
>> +                                         const struct qcom_cc_desc *desc,
>> +                                         struct regmap *regmap)
>> +{
>> +       int ret;
>> +
>> +       ret = devm_pm_runtime_enable(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = pm_runtime_resume_and_get(dev);
>> +       if (ret)
>> +               return ret;
> I think, it's better to add desc->use_rpm. Then these two calls and
> pm_runtime_put() can go to a generic code.
> 
> Or maybe we can enable RPM for all clock controllers?

That second point is pretty interesting - I think at this stage ~ all of 
them do this boilerplate stuff over and over again ..

---
bod

