Return-Path: <linux-arm-msm+bounces-52643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67831A73287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3007D17A0FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8075E2144D9;
	Thu, 27 Mar 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsitrB2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8C2144D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079672; cv=none; b=QEkCcPXwe9qEwIfwniz3RdzwaX2Z4oOfUxr41geCxR18v/2aRUSI86y4p265GzKvCPjw+OTmdJ7sMUOjk5lBJoa5Ri/S2of36W6NogvQ54BXMnax8ghNpAkPpqhWEBnA5RH0u2Glv2CLw6jsRG0ZXN4trSuPmYaUAwcRd4WoGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079672; c=relaxed/simple;
	bh=tycgOQWwWJbi7HTyc6T2xiJuVmwbFijiHW6hOcGcs3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bp9QptajJRaDtv0QCHr2v3JCdz9kzPKCSml6feGjbrABaqt/lUAR/eF4ZVTgY9eaeWuCcLIyKsVBtOn0auiLife7mag8trvuwqNdRdBPw89FWQ2c17fAZpjSkgHDmoZG2CqwH0UKotz4QU5UK4q4BftUKABXaYVKV8qRbBxzpQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsitrB2t; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1336950f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743079669; x=1743684469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrhZhK2vDq2GLpC5AXkPOJNIZAgprokk9oQOGjga9nQ=;
        b=ZsitrB2tocBSgyIgY9s/XNEs3xztFn5hc40l6x8pkyOsGnJ/lJAZy/g1iQqgHiruQ2
         kVCWUSTCiggSLgmhC+iRvMNZPlp+1xzF4bi9S+a2unAMo/Ls2jWdDOuRpNJ0MCWrVMpP
         +d4OUhCONbVuMKina4HIIp8CqTexa3RRJHv2JA/DuWFCrp88fIIzPs8w+OGRxJXZlvbT
         xAt1yOCd1lmQNQG8vLgP9jfDZtNMNkJbsBKAgaixhxo6iUFSz6266kU2TPnuM8EqRPfr
         GLoyLX75M649yqhe1lnvkSLs+8SK7IETs/mr6g2cx/Hjb6vcgRQP/Ku/mkZGR77lIUel
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079669; x=1743684469;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nrhZhK2vDq2GLpC5AXkPOJNIZAgprokk9oQOGjga9nQ=;
        b=nVpZrtMw02RpZqizGzWWsBQhYHjMsbvIxZqR6B5QEoo6WQFdLDTlI4n6T5gifzvzmG
         1G4My//PjWPo3bbaCCRM0mPgbQSBWZKzskvKfgHF5d6Ml7vkBvzUnn7ftqZ87orilYH+
         0b1YnkvNfDpgftdlaNHoi5fIpGkU/gRblpD9yPUJdib8tS9fveXf+NfkYV5LKbbch42m
         7UT6qB7oD2K/V1WF5GBI5ecP+vxYlE9UqPOBUWKe++I0u6K5u/bzg0Vm2dx7z8jBvebA
         ZtFn1zxjGqnt830cHKLICEWGVYQLsNO9tEcMIA0X/YRRVJDypJdUcqu67BuEmcvDVg/z
         Wxfg==
X-Forwarded-Encrypted: i=1; AJvYcCVaZR2s+rpYYmcT5bJE5IAn2rDY4k27UawHt7BBir8vahC20YIxOpR4IhSo7oQriySSgnUwUAqsqHoDy3Yc@vger.kernel.org
X-Gm-Message-State: AOJu0YwwjQqFwOkRt96mPcOi8Rf/aM0FuOEPUgyxcwdOmpZN1slYN3aI
	Bj8hWG4JgC7/ssdDrHx2oYf001isBWtN8e4W2dBwuG5bKI9NG1JDMrH2Qjzp0fc=
X-Gm-Gg: ASbGncv/pGS+z12LYYEl4d5qfz8S9+xul3MsHt9NMMMAbjPm1DulsH5Ug/q2UMBA40q
	ARPDOaR9NFsIjVCQnMX4bgbfDC8AZQ/GiBeuWqtbX+BzMuSYobIuI+x/vjCqb9QEPA1HMzZO+tk
	YU6qrebnL44B1wcaGhPg38GUpZ1gFvttVUWxMzw/rDzwSum8YbMj56bQ5JwkK90QQWEHGlyRgIT
	1GZtdiHoexdt36LgubUg9cfa9iLMgkTS9f4L5mWeY++WZja7svf++OA7zge+A4gmK/iMtM3DTle
	9dlRSoBljK76sHMpWH8TWvT/9A8gXiXz2yF2x9F/GOIbVnTinjpEBDf9R4VUyC/GJRycJ8IJFHz
	0RkUlwvNEiH/XTwcGYWy0Ig==
X-Google-Smtp-Source: AGHT+IH7vTkD1EpvQ1pnTdIXyT11ZQroNe1bXfZ6Z2W1J3NovHK5NVozVnLU1L6ojpmVJC3grA6ZVw==
X-Received: by 2002:a05:6000:23c9:b0:390:f9e0:f0d0 with SMTP id ffacd0b85a97d-39c099b5d7dmr97829f8f.6.1743079668789;
        Thu, 27 Mar 2025 05:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm19380815f8f.29.2025.03.27.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:47:48 -0700 (PDT)
Message-ID: <5be7a006-054d-4275-9c83-2687461028ef@linaro.org>
Date: Thu, 27 Mar 2025 13:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 2/2] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
 <20250326-topic-ufs-use-threaded-irq-v2-2-7b3e8a5037e6@linaro.org>
 <4a5efc8e-ec61-40c8-9b36-59e185b0fdd5@acm.org>
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
In-Reply-To: <4a5efc8e-ec61-40c8-9b36-59e185b0fdd5@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/03/2025 12:56, Bart Van Assche wrote:
> On 3/26/25 4:36 AM, Neil Armstrong wrote:
>  > When MCQ & Interrupt Aggregation are supported, the interrupt
>  > are directly handled in the "hard" interrupt routine to
>  > keep IOPs high since queues handling is done in separate
>  > per-queue interrupt routines.
> 
> The above explanation suggests that I/O completions are handled by the
> modified interrupt handler. This is not necessarily the case. With MCQ,
> I/O completions are either handled by dedicated interrupts or by the
> legacy interrupt handler.

Will update the sentence with that

> 
>> Reported bandwidth is not affected on various tests.
> 
> This kind of patch can only affect command completion latency but not
> the bandwidth, isn't it?

Yes, but on a fully loaded system, it will enhance bandwidth
but with a greater latency, but without eating irq handling time
for other routines.

> 
>> +/**
>> + * ufshcd_intr - Main interrupt service routine
>> + * @irq: irq number
>> + * @__hba: pointer to adapter instance
>> + *
>> + * Return:
>> + *  IRQ_HANDLED     - If interrupt is valid
>> + *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
>> + *  IRQ_NONE        - If invalid interrupt
>> + */
>> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
>> +{
>> +    struct ufs_hba *hba = __hba;
>> +
>> +    /*
>> +     * Move interrupt handling to thread when MCQ is not supported
>> +     * or when Interrupt Aggregation is not supported, leading to
>> +     * potentially longer interrupt handling.
>> +     */
>> +    if (!is_mcq_supported(hba) || !ufshcd_is_intr_aggr_allowed(hba))
>> +        return IRQ_WAKE_THREAD;
>> +
>> +    /* Directly handle interrupts since MCQ handlers does the hard job */
>> +    return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
>> +                   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
>> +}
> 
> Where has ufshcd_is_intr_aggr_allowed() been defined? I can't find this
> function.

It's in include/ufs/ufshcd.h

> 
> For the MCQ case, this patch removes the loop from around
> ufshcd_sl_intr() without explaining in the patch description why this change has been made. Please explain all changes in the patch
> description.

Ack will update explaining this change.

Thanks,
Neil

> 
> Thanks,
> 
> Bart.


