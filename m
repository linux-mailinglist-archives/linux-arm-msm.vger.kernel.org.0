Return-Path: <linux-arm-msm+bounces-39501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F89DBD71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 23:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDAC8164BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 22:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DE21C3041;
	Thu, 28 Nov 2024 22:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ko3nAyOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3061C1C2439
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832063; cv=none; b=lAMNihKoAECqPYjPBZq2q/FCXmqSmvgs4Gq00ZEQm+TXx9pTNkykwbdr6dW06JUEuwsbgpRo9eQHO3wUp9WCqDnToPhe5M3mdFOfjha9oYEGOnJCbalm+0iZu6N5+45XyZ1i/CI7rnGAHqVlYHDCMCi8tR2DqZJN6pV4TwG+MeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832063; c=relaxed/simple;
	bh=T+B6uY2PCmsr5JVdleJdruuzSZy1XAQH0ge6L90EYiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBF48RTW17rSSfklPy8Y/K+uyqviKauspW4TCcvk+XAnxSWIJMLlciicp2Uhy79sQkx+78X96E1l7bQl0eIzpjStazsYy77DTojzGxf/53Gq3FZv4/Ug7HtQz+LKB7V0PhqruWNV32OhLryRtLaRYz1G21bKi4neH1ZqUDDsJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ko3nAyOX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a10588f3so7961735e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 14:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732832059; x=1733436859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0Rj4yaKZcalBf4ESSHlGCvsOhLHa8EIvVLhVHMQcPg=;
        b=Ko3nAyOXVjVzR7uJsVG0VOeY25P/9yehPV3i+SCO6MO4TOs1jtZG6RNOE3LXoHB1Rb
         xW9E0RX8JJU/nr8WyrjfaP9kbR27RyBWsYqxcoaNxljCHN2zQJZgsjcafnt1Y+Cj9PfK
         AUl+D8uOSqFBf2sTej2IWCL3w29q1nqCVSFRUwxF+v3wLBxyLBho1gXVA7zFWtVPRowd
         owAzqGkyeEe7pRl3W0b6bLcpb9R+FOCH6z5e6bVJ/4aLZ+iRXyEokrqCXHOs4VNCPyEv
         /xVBowwIVmnWVpDfgTn4o9xhtVBG7Td7+oFfuUu3rDBLrJqSmxH08gffg7qglWLAkWkl
         g7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732832059; x=1733436859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0Rj4yaKZcalBf4ESSHlGCvsOhLHa8EIvVLhVHMQcPg=;
        b=YonQkXfU9NL+y01uG1uPEKEGZ+DK6hpIweLYKWYVuOY6izFbmxb6T1XU0XKgHfT2sx
         sMNVMejaw4ZVQvqyWpzLpGXwbRUGt4gwR/S1GnYFrltTpR1xywAyPcRaoA0uLmBdQBcm
         pFICDo6xRBrIYgYGJ8QRRj6B4IaylVeEdKnq72nWCOjgNWEZjQDsQw8YFlo8bi2aIZbF
         KGzB03yqD/hIqvBw/eYBmSGc1pTplgpaGqcSNaFs5rrmGy8IlJJt37r+PR9bd+5iafjG
         6BgkXj8VfVvVFna6ki3lDVp0gF4VNupNtxoHFCCwlYQ3qiDekItEoQX7t7utsqV2Heu0
         9K0g==
X-Forwarded-Encrypted: i=1; AJvYcCWEzGfJ8DJIn2glftIVOKNxQthrVUVN9OfpB/4Aswoc0jl7v2z4eeenjH1tQIM1L3os6xdylpVwhEDK0k8r@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkbWApcSI6qzZDTDB2RVWE08m+AM9FYTPZNTnsxMx9tTntRhS
	qA1tdqfJDaLftDgPdtQtM25AKUlkRQNMALRZ27ye8M6ZuXByD0FjH/mWR3Ca/p8=
X-Gm-Gg: ASbGncsrnEzRqnYyEAZ9WkyFlzKwDUtoqKgvNLACiKjLd5it007RDH3b91Kkh2SCclV
	VUOyIX5mzF40QA120mj9dj95cBeTjB0cRQuNWd/CA9ml6BjkB0B0kaMjdhErTvHfCqKbRGCbk2i
	Zb2OCPmMtgxOC7EK99q+DRNxSKPl1wNVLg544CMvdvARJ/sUT+l3RNVIlzdOr83AQfRuzO5ECA5
	NsGi7mguf6SswGk0Eo1Vkl87NsJphN2s6QlVZdmr6Hob5RDSvd2UzJCg8ALaAg=
X-Google-Smtp-Source: AGHT+IGnT9xFBXQMj7QQ/kDQaVFpEopOT+eRP/0MhIxrqJS/I60adGLIkx9okGz4Lo8nrGR6ze66lQ==
X-Received: by 2002:a05:600c:b8b:b0:434:9e17:18e5 with SMTP id 5b1f17b1804b1-434a9d4f7famr92200835e9.0.1732832059495;
        Thu, 28 Nov 2024 14:14:19 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dc169d79sm762757f8f.92.2024.11.28.14.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 14:14:19 -0800 (PST)
Message-ID: <95ec73c9-da38-4888-9e00-4458b5a7661c@linaro.org>
Date: Thu, 28 Nov 2024 22:14:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
 <7d344377-f1cf-400e-a9c4-442123dcf4ab@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7d344377-f1cf-400e-a9c4-442123dcf4ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2024 20:02, Konrad Dybcio wrote:
> On 27.11.2024 2:34 AM, Bryan O'Donoghue wrote:
>> Add resource structure data and probe() logic to support static
>> declarations of encoder and decoder.
>>
>> Right now we rely on video encoder/decoder selection happening in the dtb
>> but, this goes against the remit of device tree which is supposed to
>> describe hardware, not select functional logic in Linux drivers.
>>
>> Provide two strings in the venus resource structure enc_nodename and
>> dec_nodename.
>>
>> When set the venus driver will create an OF entry in-memory consistent
>> with:
>>
>> dec_nodename {
>>      compat = "video-decoder";
>> };
>>
>> and/or
>>
>> enc_nodename {
>>      compat = "video-encoder";
>> };
>>
>> This will allow us to reuse the existing driver scheme of relying on compat
>> names maintaining compatibility with old dtb files.
>>
>> dec_nodename can be "video-decoder" or "video0"
>> enc_nodename can be "video-encoder" or "video1"
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> 
> Bryan,
> 
> I'm still not sure if keeping the logic behind this makes sense at all.
> 
> Could we not just call platform_device_register_data() with a static
> configuration of 1 core being enc and the other dec?

That's another way to do this. One reason I wrote this series to 
continue to rely on the existing compat= method though is it stuck in my 
mind that we have some dependency ordering logic in at the moment.

For example:

commit 08b1cf474b7f72750adebe0f0a35f8e9a3eb75f6
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Feb 5 19:11:49 2021 +0100

And the other reason is the prototype platform_device_register_* looks 
like more surgery and ultimately more validation / potential for bugs.

Since this driver is supposed to be moving to maintenance mode, I didn't 
want to do a more major rewrite of the probe() and remove() paths.

---
bod

