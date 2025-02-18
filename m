Return-Path: <linux-arm-msm+bounces-48331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F11A396A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 917557A210E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 09:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92741DD886;
	Tue, 18 Feb 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guX+IQym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF320CCE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869921; cv=none; b=jBGyUqB4TsR4+2tC7y5GWiyxWDuIQUsF3gge06WYZDOCrnc+eS5Zg8qVVzZDrX5eU3zgcQbrUk2ufbjljcsvdI1Z9ftQj3lRSCQ7YPXkcX3IhWlx7w5f+/rltL5Fgx1BaNWal1N0ksuHo3uMHFgkhOQXL2RRrrOSjlDtiKdbLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869921; c=relaxed/simple;
	bh=UzhNznqgAAuIcZzZPrJUtoMO3STF21152UGRG8HaC/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nuf3NQNgM119NrszvHh1x4IoaCBlUvTt99oVxBReCBZx7ni0IAt45k+dQCDWPXNIHcICTppLQ1ARyYRj7NOpHoV53rDpAgQ6L/CK0b2N52Lbaxor6LAHW9HdFV0yj8qBC016najGAzOdk03jTyGre2kDGV6Y9oOfzH3RYwPIepc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guX+IQym; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e07897bf66so713021a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 01:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739869918; x=1740474718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3uXTrr03eTBp4TQInaTHeB1lyJsdQisBIQEzz1BspM=;
        b=guX+IQymz6uDTHw8M8yrP85wM1puEgjhC8F5+CFOiJb4WQwjgb4GEfCIBQL8xUQknw
         kcpgvAYBypq9pd/p/7U/ZLY81HzUezgMuab/FCggH//Km/kKDB9ynoslCRKfam/ga/Gz
         4sER1E62Q8Kz6cBLghd1uAw2RGRFfom5TF3sLNy74OrZOqy//3mk3IIT+hwDk7uDq1o9
         0spohzSseEG2AUoUPL9Z2EyzE6gxADlDndIEQTKgGFEFpdXUUHotqdtfMAV8CPqtqBtI
         5Ca+T5xJRC1gtzS2Tz4Wv93xFIG1MTtH41hGf0jJbstEEWPVtgkOm9gbPwstjfZnJwBD
         ooJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869918; x=1740474718;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3uXTrr03eTBp4TQInaTHeB1lyJsdQisBIQEzz1BspM=;
        b=sBIEtfSr5BHqUVEvmwn0BeufzKxmWmqshJkmBgSRVFJiXM/EJ5tdTnefE0CqaZDhrw
         xcTwqKom1I7OIaZSoEL7KY28O41vCTEUUyX73+nMWccrwi1i1efRHm299E75SBfaSV5u
         QjejPaB+hMGoRYd2o+U9LR1tgAO/G9ip6o20g7gUge0rX6DcNtGvO5V25Th7tzBVnCce
         R0GyomZLayBDCbh+9zOCbKAYbIYFX0k+zUjVE2E2XBb3RqOK2xIJ4uXpib4QKphrcHxL
         arvZCbAfWj54sGvL8B95gSbm7DGgJnjZO7gapx+y0Scidzdn35qo14ERjM0wyjnGHuCx
         KuwA==
X-Gm-Message-State: AOJu0Ywi8rOYWyyEJstsYyHwj5D490FJ3/CKnpTFnVx1LhviAVceOjxx
	5vzDrPrJ1tmJ7plT3srVLerXY7ZpWhDleY9NxTdvxGYVWUsuOEaFZ4LKUliPv44=
X-Gm-Gg: ASbGncvsb/8mIPZb7qai+kFjcpADrUZP+H+RoIoz+mTvt4fCvBN/xnr7Pl2ngAdFPQe
	xF5aoyqh260qJtDTRUyNFI2719IQ2gLAqdkBiYCtCmeNmiHlP7JmLRMpslJzYGJejXqm1JocgAB
	0s+sy/TFDVYwMx80U0Wj2u/1OAhY7xudft1sVjA4HYS0aTkhyGl+T0Edj6GNObII8+eAbmK3/Sh
	1z6BdsQVTo3lppnXD/Gdp1Ema1577iiSmxql1w02uW+c5wyJpRoLd9iU4JKylHsCpJUWgd6d4D9
	uoYnlUo34AI+IcPPuQv6rOw=
X-Google-Smtp-Source: AGHT+IElObB+wPJH8ll7VWsYIuWeUZ3GQukv025YddeShYC2NXJtKepo4lLlRZ3MwK7mM+8bMe+zXw==
X-Received: by 2002:a05:6402:5246:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5e036055eb7mr13524262a12.6.1739869918369;
        Tue, 18 Feb 2025 01:11:58 -0800 (PST)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e076048c05sm924724a12.35.2025.02.18.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 01:11:58 -0800 (PST)
Message-ID: <e925a6d7-aa71-43cf-ab84-bed65b78cbe3@linaro.org>
Date: Tue, 18 Feb 2025 11:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, linux-kernel@vger.kernel.org, johannes@sipsolutions.net,
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, tony.luck@intel.com,
 gpiccoli@igalia.com, pmladek@suse.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, quic_mojha@quicinc.com,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
 <Z7RELnyWRLietj9b@infradead.org>
 <20250218-175733-neomutt-senozhatsky@chromium.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250218-175733-neomutt-senozhatsky@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/18/25 10:58, Sergey Senozhatsky wrote:
> On (25/02/18 00:26), Christoph Hellwig wrote:
>> On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
>>> log_buf_addr_get() and log_buf_len_get() can be reused in another module,
>>> export the symbols.
>>
>> Err, no way.
> 
> Yeah I think we've been there before [1]
> 
> [1] https://lore.kernel.org/all/20230905081902.321778-1-hch@lst.de/

Okay... in the line of the purpose of this patch series, I would like to
be able to have the dmesg ready to be retrieved out of the kernel in
case the kernel becomes unusable (due to various reasons as described in
the cover letter). However to know exactly 'where' is the buffer stored
I would need some way to point to it.
Do you have any other suggestion on how to do this ? Using the
kmsg_dump() API works only if the kernel/CPU can run code.

Thanks for looking into the patches,
Eugen

