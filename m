Return-Path: <linux-arm-msm+bounces-52300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CFCA6D771
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 10:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED05316F81D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713B725DAEF;
	Mon, 24 Mar 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g20bVKp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016E25D8ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808699; cv=none; b=BtUfWYx23PfXfSSgNEViinlDWANsQGWIiu+frr7NP2SpJ0uIzTyeLPS8OP9XlixJ0IkDP8OzMexPVc0Eqy6p9qFgueI8QkTj2PbK6LKMQZ2Tdg4vkah8I376SAUmHr9Oo4WVs9MpUA8AKfqp3Qeac17V/uJLiol4Vpo9GPOCy14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808699; c=relaxed/simple;
	bh=90jmh23c8RVKqEXMFx69946NB/TEnNJmko57MWPSbTQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KkyYz/T3S6ggrhon40BwykAlD8agYTBfrxnVWtcmcANSlfhljmgzMmNEfVTgxwKx9MgXcnnc+9ONA6VQvrORra5rgTYKdsj1xxMDVgnJecIlH+rIogD9pOociV1FhDkP3udsnKQgv2XYMeDXzynKIHsMNFjGMbYnCnFh0XULlS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g20bVKp+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-399744f74e9so2434289f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742808694; x=1743413494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdB9oocdn4EqS1s91Sc4Yv79gAOsQK5rmcyHpJyIQbU=;
        b=g20bVKp+krwBGJ+rIqVzh4pf0zoBh+IojQjjki3/1KRhaUEI3sF/cQhdx4j+o+5yR0
         zb3qDCzf4MNAO73sbppVKmKnjrUBhmMjVepbT724Jqvn4jZVNuISWMEgbiQYJT0RpScr
         5tvV8VHxDJHns6FzBnmNODlyX0zZfQyRyrVATtBWNWYzgYzWuGEl8aoPjfhGweY12Uhf
         3OlTKp5SXtmFTh90gDTG3U4kNTensKWo4izN8HL2OXk5GsZtgYBhRDI5nwqGpklxrxIg
         zu3Qg6Ln184j000IBcgZ5wnviVo4an2DNMGzNk+O12N5CNmbsuI4QgWJIjCX4sOpEjLK
         qhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808694; x=1743413494;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AdB9oocdn4EqS1s91Sc4Yv79gAOsQK5rmcyHpJyIQbU=;
        b=RtUfFF/QoQGa6TrLyTTgYPi1+YqcM6mVBaT80VxenfMQjrLSFTAIy7jcdQ5yS8GcKf
         qyrR+uTDE46B2SIMQ0X0ZR0w041lBAtyg2Wj2+rX/W8JbFxneMqZ7vBWC/1kKAaKyCnC
         2FOJkO6PjiS8mhonLSm5jxGPsVM2oEKv27uxZtuhFOsLd+1diAe2GRh+lj8O4S3MajbB
         91Y/Wb0Zi1DAwcb+pMkvF6jiAyv49UXcEwfKOmBTNcRhRbwGqFhCpcLrzJwk4PEhbLkc
         WjJXYA1cGop8Irsf4cp4JOybJvLCy+v2czolezwjta5sD2MaRMrgMqLoV8KIqGTuH1oG
         S8ug==
X-Forwarded-Encrypted: i=1; AJvYcCWAQPwhSTo/YP27STCnnSFjdd2fqCd7TVgghuyqa5CEDfL01n31EYWk47t13411qk0IZ+WoD4ecd8B84QnR@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVEuyNoD5wkaFkF4zQOF+z+cNEcBv0cs8t1trD3a3Asd5JcUt
	E9FNCWzwQFZFtqf8V90Khqw3dunogmVGUEgyMuRzNpoLfYkyOEw6nUKjPyejpIw=
X-Gm-Gg: ASbGnctmQ7kCqnppwA36paejnrHeMFv0K+mxudzTNSSN48qdi5+aBCn4r7ZMW9ciSpq
	aV4d7ncS4iKsTQZSGaPz1f5gbWi8YEeJwMI4K7GqI14MvZHdu1oa/uk6yu5eptAEdt0AQssUXiD
	DPjiYjJ69RD5cEv4YhzXFt/vc9xg+yQY0MedElzfZHRwDKab99wWCsARmqbusVzRA4YGgX17RD/
	+ep/PgsUyRNGvk1Q3+FOrP/4BH5luQvNG0KJt/YJfi8Y9J6pAP0XgZJnSGzmJU+tCRLkpxW2mHB
	nLPV1/ombpr79VLnmooCV1Y2SSSaBYpQnDoSeAJX4bRsn6RrAGowrPUx0h2LaUl63MeaMHOt58O
	4K3vjs+TXS2IW7gdj
X-Google-Smtp-Source: AGHT+IGWXRS4st8oEz+RLMUHxOe45IpuyGIqv5uTKOMT1b8e0ep8y3VBa8Huy2yXCe6Dz9XT41VaRw==
X-Received: by 2002:a05:6000:1788:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3997f900d5fmr11612140f8f.9.1742808693965;
        Mon, 24 Mar 2025 02:31:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eef37sm10210605f8f.85.2025.03.24.02.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 02:31:33 -0700 (PDT)
Message-ID: <d084e50e-8b2b-4820-a5e7-25ec440d128e@linaro.org>
Date: Mon, 24 Mar 2025 10:31:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC] ufs: delegate the interrupt service routine to a
 threaded irq handler
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>
 <31b46812-72d5-4f9d-b55d-16a6e10afe7d@acm.org>
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
In-Reply-To: <31b46812-72d5-4f9d-b55d-16a6e10afe7d@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/03/2025 17:20, Bart Van Assche wrote:
> On 3/21/25 9:08 AM, Neil Armstrong wrote:
>> On systems with a large number request slots and unavailable MCQ,
>> the current design of the interrupt handler can delay handling of
>> other subsystems interrupts causing display artifacts, GPU stalls
>> or system firmware requests timeouts.
>>
>> Since the interrupt routine can take quite some time, it's
>> preferable to move it to a threaded handler and leave the
>> hard interrupt handler save the status and disable the irq
>> until processing is finished in the thread.
>>
>> This fixes all encountered issued when running FIO tests
>> on the Qualcomm SM8650 platform.
>>
>> Example of errors reported on a loaded system:
>>   [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
>>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
>>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
>>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
>>   Error sending AMC RPMH requests (-110)
>>
>> Reported bandwidth is not affected on various tests.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/ufs/core/ufshcd.c | 43 ++++++++++++++++++++++++++++++++++++-------
>>   include/ufs/ufshcd.h      |  2 ++
>>   2 files changed, 38 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 0534390c2a35d0671156d79a4b1981a257d2fbfa..0fa3cb48ce0e39439afb0f6d334b835d9e496387 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -6974,7 +6974,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>>   }
>>   /**
>> - * ufshcd_intr - Main interrupt service routine
>> + * ufshcd_intr - Threaded interrupt service routine
>>    * @irq: irq number
>>    * @__hba: pointer to adapter instance
>>    *
>> @@ -6982,7 +6982,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>>    *  IRQ_HANDLED - If interrupt is valid
>>    *  IRQ_NONE    - If invalid interrupt
>>    */
>> -static irqreturn_t ufshcd_intr(int irq, void *__hba)
>> +static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>>   {
>>       u32 intr_status, enabled_intr_status = 0;
>>       irqreturn_t retval = IRQ_NONE;
>> @@ -6990,8 +6990,6 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>>       int retries = hba->nutrs;
>>       intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
>> -    hba->ufs_stats.last_intr_status = intr_status;
>> -    hba->ufs_stats.last_intr_ts = local_clock();
>>       /*
>>        * There could be max of hba->nutrs reqs in flight and in worst case
>> @@ -7000,8 +6998,7 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>>        * again in a loop until we process all of the reqs before returning.
>>        */
>>       while (intr_status && retries--) {
>> -        enabled_intr_status =
>> -            intr_status & ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>> +        enabled_intr_status = intr_status & hba->intr_en;
>>           ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
>>           if (enabled_intr_status)
>>               retval |= ufshcd_sl_intr(hba, enabled_intr_status);
>> @@ -7020,9 +7017,40 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>>           ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
>>       }
>> +    ufshcd_writel(hba, hba->intr_en, REG_INTERRUPT_ENABLE);
>> +
>>       return retval;
>>   }
>> +/**
>> + * ufshcd_intr - Main interrupt service routine
>> + * @irq: irq number
>> + * @__hba: pointer to adapter instance
>> + *
>> + * Return:
>> + *  IRQ_WAKE_THREAD - If interrupt is valid
>> + *  IRQ_NONE        - If invalid interrupt
>> + */
>> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
>> +{
>> +    u32 intr_status, enabled_intr_status = 0;
>> +    irqreturn_t retval = IRQ_NONE;
>> +    struct ufs_hba *hba = __hba;
>> +    int retries = hba->nutrs;
>> +
>> +    intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
>> +    hba->ufs_stats.last_intr_status = intr_status;
>> +    hba->ufs_stats.last_intr_ts = local_clock();
>> +
>> +    if (unlikely(!intr_status))
>> +        return IRQ_NONE;
>> +
>> +    hba->intr_en = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>> +    ufshcd_writel(hba, 0, REG_INTERRUPT_ENABLE);
>> +
>> +    return IRQ_WAKE_THREAD;
>> +}
>> +
>>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
>>   {
>>       int err = 0;
>> @@ -10581,7 +10609,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>>       ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>>       /* IRQ registration */
>> -    err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
>> +    err = devm_request_threaded_irq(dev, irq, ufshcd_intr, ufshcd_threaded_intr,
>> +                    IRQF_SHARED, UFSHCD, hba);
>>       if (err) {
>>           dev_err(hba->dev, "request irq failed\n");
>>           goto out_disable;
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index e3909cc691b2a854a270279901edacaa5c5120d6..03a7216b89fd63c297479422d1213e497ce85d8e 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -893,6 +893,7 @@ enum ufshcd_mcq_opr {
>>    * @ufshcd_state: UFSHCD state
>>    * @eh_flags: Error handling flags
>>    * @intr_mask: Interrupt Mask Bits
>> + * @intr_en: Saved Interrupt Enable Bits
>>    * @ee_ctrl_mask: Exception event control mask
>>    * @ee_drv_mask: Exception event mask for driver
>>    * @ee_usr_mask: Exception event mask for user (set via debugfs)
>> @@ -1040,6 +1041,7 @@ struct ufs_hba {
>>       enum ufshcd_state ufshcd_state;
>>       u32 eh_flags;
>>       u32 intr_mask;
>> +    u32 intr_en;
>>       u16 ee_ctrl_mask;
>>       u16 ee_drv_mask;
>>       u16 ee_usr_mask;
> 
> I don't like this patch because:
> - It reduces performance (IOPS) for systems on which MCQ is supported
>    and enabled. Please only use threaded interrupts if MCQ is not used.

OK I guess in the MCQ case only some interrupts should be handled
in the primary handler then, because in PREEMPT_RT it will be forced
to be fully threaded, but it's another subject.

> - It introduces race conditions on the REG_INTERRUPT_ENABLE register.
>    There are plenty of ufshcd_(enable|disable)_intr() calls in the UFS
>    driver. Please remove all code that modifies REG_INTERRUPT_ENABLE
>    from this patch.

Ack, I'll switch to use the default irq_default_primary_handler() and
stop touching the REG_INTERRUPT_ENABLE register.

> - Instead of retaining hba->ufs_stats.last_intr_status and
>    hba->ufs_stats.last_intr_ts, please remove both members and also
>    the debug code that reports the values of these member variables.
>    Please also remove hba->intr_en.

Hmm ok so no need for the IRQ debug code anymore ? I guess this should
be in a separate cleanup patch.

Thanks,
Neil

> 
> Thanks,
> 
> Bart.


