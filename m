Return-Path: <linux-arm-msm+bounces-72037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B757B4398D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DED5A13EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68BB2FD1B6;
	Thu,  4 Sep 2025 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqTbwK/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088812FB626
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984030; cv=none; b=HRcFE3OQtu98GSdOysDatjBDBaFmN7cy0i4eeAElVuXhqQKFlp7skBHQUFI0D/AEzun3hUVTeCOGnmTp7q0jxyb/YHSKLfwDNrkEbreAwP8b9zWC28YUrGJ4EoBoOVFMtm05mSltTAyvr6A14iZj6UoQS2Kv33sq8Qf5o+dKiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984030; c=relaxed/simple;
	bh=J2pBhxhghXplw0Hqz+kXCsTp6S5XJ7enN55w8p/Thrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r+HcNGXUotJr+Yuot+cJezaDtdpj9C9nZvAbJdUaohMn3NQvt5vctjH3W61P033/jA8PBx3NV6TTRGrgF2giWJDVbDKs7lEOLV3OQHP3FmXy1tlV1LYK9+eRw1Mf9kmc0J1ETyGUuaW5EN8gwS+7RKF2v2JmVN5pEwUDxxn+vA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iqTbwK/I; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0413cda0dbso12752366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756984027; x=1757588827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnJgKrqBWNihEnRqMKFhK2JevtMYzvav+LYzDruEobc=;
        b=iqTbwK/IFy9PCeCPoPgPvJtDvml4LJCsMxpd3mRSH0WwjgjMhi84mxCGdL+Uhk1z9K
         Rk0dF4W9WscfHQ8o8TBtV5bRoayJpUoaHdpV0xTz9t/If6kcP2ORjBda0RMi8VzFfkK6
         RfO/BCsIMU+GOGXOHG5qYqPB8DIKvtyn/EWaugE12KsVciyEEzfhWB1KzM3RXBKQzFTr
         lpQ6t2pbBpKB5NH/f4eh2twU+h4ds0OEiWMyf8xLPe/cvaXsRBFdwdYYwhVxmmmHNfqW
         yWF5lQ+8otqIEuboEpUaOO6vfan2ePAa4cLn+8vqpWZYkRooaftvfP49MpxeYUYXVZp8
         h0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984027; x=1757588827;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnJgKrqBWNihEnRqMKFhK2JevtMYzvav+LYzDruEobc=;
        b=AgjA75IW3MB7xUR42i8aUWqFwKScg/26JLXnckzHR3c31jEGkB6Bkdi9RPcfFnawfM
         BS6uz3DG//S626oJGkqnslirgg8aDb28e2F0udvyyEjUIe9Rco1w6iBdc6X/Vx4eu1ka
         kapZv+1ZVvwfiB7x4/yEzmmNIUzc/MA4duBqpL4jJkwiszDnKjI/yjRrsncQn6k9oA48
         PnyuSOpummGpZ/zgMgxtsq5v784lrQYoEHZXygxuYe8/6gSwoswDDiTosvvO80wRSbv6
         zpQTRsxMeS33v9Sf7793qWWahBK1t+7VMHeEuf5PA+UBm8pozcCBBXvL9gWFIkoWgJn8
         6Asw==
X-Forwarded-Encrypted: i=1; AJvYcCVkaDdr8+Eu9Xm+8VPqSqZ0fCp7gMPwiHR9Bsf6pUa9PS3MuF6BLCqTSFVm6yl4fIXn5/MjjOmMUC/qoGAD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+HZ9jmuhwa6MkqUVPTZvFhDeAtBBPw/tEDi9Qv65b0h76MZn
	YmPBUmyZD9PTBC8/lnmgiySi9ESKeEdG60fgNwqgkFFCatnTb2bbPDlPGMUVFezlOEk=
X-Gm-Gg: ASbGncuRv4jFN+vAM0c18wBaXVgBYNR7syuoDKc2sFovBPwVS3aKO+Ff5RIqcxjAz77
	LBjZaluCQroSbH9ANlPqiiqxwRqefRxbp10Wx0Yx6IxY+3pP3AaoPA4MRVy8cl1bsmDSujl8GLv
	jXEjOAKJSa6VlncDsbS4Ifa7p3M/ncKbPElmF4qwS3ODKmYJNPN5LdNMx0U2b+7I44Md/SBnBDN
	Abvcl6KHeo7ESkL7GvnPp1VAwGoKSBuAL5O9WSqtvPYMmzeMxGu0So0Up8/sWUvOUKkbKG3HWnz
	n0oAeBubYdMDYGhFkwER/SgfE7NQFdZPrDBouPvZLjqQU1Vaoft7H/J5UUdfjBLx53SNtGwU8bN
	4lV6lKlqGJbGGKw5/f9Md0dJlkELyab1R9zeaahUUXjE=
X-Google-Smtp-Source: AGHT+IHDDYnbw6yuFfiawt8DM8tY/uQyhjYDMOq2PATM1vggCKzDOXH7c2xeLilfIc5CkgohDVaFaQ==
X-Received: by 2002:a17:907:60d1:b0:b04:74c4:e203 with SMTP id a640c23a62f3a-b0474c51d62mr188284166b.4.1756984027302;
        Thu, 04 Sep 2025 04:07:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm217638066b.53.2025.09.04.04.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:07:06 -0700 (PDT)
Message-ID: <53c36fcb-0d8d-4a01-8c89-6734379c2b27@linaro.org>
Date: Thu, 4 Sep 2025 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: qcom: audioreach: Add support for VI Sense
 module
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
 <20250904102558.143745-4-krzysztof.kozlowski@linaro.org>
 <79274958-52a0-4041-b4f3-365ee84fb088@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <79274958-52a0-4041-b4f3-365ee84fb088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2025 13:04, Srinivas Kandagatla wrote:
>> +	op_cfg->cfg.num_channels = num_channels;
>> +	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
>> +	op_cfg->cfg.quick_calibration = 1;
> 
> This field is only valid in calibration mode, we can remove it.
> 
Ack

Best regards,
Krzysztof

