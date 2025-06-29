Return-Path: <linux-arm-msm+bounces-62973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B0AECDF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C53647A5B79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4669422DFBA;
	Sun, 29 Jun 2025 14:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbIxGnhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1C2222D1
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751207782; cv=none; b=kZuAB9rtAoRsRkMFK/YSN6zp3vhNu4W5oJuIbT8oKhY61pHPrS8w58x5FD8l2VuIeZN/OXe5lpGxYm8s9grQm12zzahze/c/j7yDVEPe+gPQAa4A4ELfePosegmyl9XrG4PxIixUVdozJbGy16YlwP+UYp9pXxSr9U+5vA4FvVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751207782; c=relaxed/simple;
	bh=0xdXT3jkbQopuTex6YsVK/Tcunz4MGZYkzMVvbF+kZ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hCOljMUm0VuOc8fHANmbg7V0bHpjb3OU+ukK1LupeWVIhqAqum4KtAJOE7iaTSgGIW3vLmWHZxCDx0Fb5eFAOw2eBthpKaEIWvRx/PaMklvPbldx57rcpqXjtsNlhxr5Y4r/zrB9csGSUGxLTERmJusZVeiwu9ghuPv8QfoBAoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbIxGnhO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so2313427f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751207778; x=1751812578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+z7SRvODNDhYfqBYH5cKF7fnL9B4dDoXgSqd8d9Fk8=;
        b=FbIxGnhOISf7EEqp8SNf6TBezvfUM0rvA95KJloTQkL+TcR+s4J9oG8D0wfopGTc6G
         SKdi9aitA/0uaP617gedyiS8Af7qWkerVJxYYZHhY3ukzAXuQ9z7Qv5iVVShxbi/oqjx
         HREhai7Ok929TQddZQqAi7Eh6tShUzKFkm99YjkEoxxD6I61nYm9YQAvgL0Xs09OBI7/
         LY5C0LH7S0phWfHsiOM3HAWv8Vhz7A1BBB5PEW/2WVoyo7tz64ypuuN5t21pz8twfnF+
         TuO3RrOswwujykOuoJeDBXfMd1bKSheEjN9THkN8lxuWWvxvqtuHBrngCuvraOCeKJFR
         DLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751207778; x=1751812578;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+z7SRvODNDhYfqBYH5cKF7fnL9B4dDoXgSqd8d9Fk8=;
        b=NQrH+t1pbvVmcTmmWv+3hFBXcZb4lFhsE9ktuF2nXuhBRCMT1dpB1Ajx4CnKkW79IJ
         L0Xt+PZGCOi0NFYVlQoUv/Bb4OlRebte9P95tnVVa7xZO/Q9u8L5Y1D5MDWbQ2tY1u3X
         93nhLHgpXpkZFpJL+0/on7N5Bh96O2WBAWvUKsAAbD0AXhVVbh7zEPMEHLztR+PXiEU6
         +7huNx8n+VVptiRCfcJ9bcAxp73plWpeAUcpOfocm4B7eUVe2hwjnnnHZBIxeA4Oz4FB
         aE/mfqo8fS8Ua4SnlmUfsWKfZ9/LRFZk7zQP7Zuob+vKeb94mvx/P0zWRJi4362lt4WI
         4uuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBXPvWcAqIxWCJi/Zo0JwkBRhlXyWDZHC3KGMhvnKNvytdHP+TLWdkPWU71STmYTBz6uQuOVifRZz+YhyB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3cuzc7nVCmTMS996s+mSmJf/0dalwQ4Qv66pXoS82rZO5Rso
	Ckb+mbLxlaloyqes8tY4RXvHLMXeAgiOMdqDG8w+GbIcJMUOAYPRYoqaJEPx/49+E9g=
X-Gm-Gg: ASbGncuy04rjOolMb/P7k1fzewZr8yfHO3vcOUn8RNpaTiD6Uba+7GXstXnhN0uZ2QC
	MNS/++XubmD0k+aV2K6OlrxCunBMCegy1+MRmhlK3NXA+jkR2OpdIXsROt4Qai7W5rAI+WgSt/X
	9iWyK/DVhGS+vJn9pErgEcHn4M2DItnDo+pH81v4R5IN1ohQbnJpCMeEnZRhcCZk7QYOiNQv2yI
	SJAANnnn7DmDHLvqGjqjIFxakYrpBJea9+HrftlunADPcp1NW6cbYTWuYsk5G6km/LkMPRpyUTj
	DcHDqdrdyYt8jXD63EOtMsCfGhk2Fp3X6hQI15FA2yaPv74NuIPL79ZWpl5IGaBXzfJnxWdJOAO
	256qFAlFGTlvOS9k34FNUio67hBrGidXv2TRhHg==
X-Google-Smtp-Source: AGHT+IGzkuu9QIhht5yKkfO6ZABYOX72k1x7NScLoULY/v5PtADOn5CdMwya5q4nBdbkWZ4RPjkoHA==
X-Received: by 2002:a5d:4d11:0:b0:3a5:51a3:3a2 with SMTP id ffacd0b85a97d-3a90038ac3dmr7895542f8f.45.1751207778471;
        Sun, 29 Jun 2025 07:36:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm7787506f8f.88.2025.06.29.07.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:36:17 -0700 (PDT)
Message-ID: <84e00f99-ee62-4097-a8d9-315d424222cf@linaro.org>
Date: Sun, 29 Jun 2025 15:36:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Avoid unnecessary RUP command
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250422081436.6535-1-loic.poulain@oss.qualcomm.com>
 <9vnGmNQZ0vBCvWzpeOLQAV3d76Ifgpvy1tlqz3owtoERKCky3asUtT2AuNcTouQYmruK3sVVSotm7aQZtmzkpw==@protonmail.internalid>
 <e81d6d27-908c-45b2-a3b5-fbf743f9aaba@linaro.org>
Content-Language: en-US
In-Reply-To: <e81d6d27-908c-45b2-a3b5-fbf743f9aaba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 12:42, Bryan O'Donoghue wrote:
> On 22/04/2025 09:14, Loic Poulain wrote:
>> Today, we submit a RUP command (reg_update) after queuing a new frame
>> buffer using vfe_wm_update. However, vfe_wm_update writes the buffer
>> address to a FIFO register which does not require a subsequent RUP
>> command, as this register is not double-buffered like other config
>> or control shadow registers.
>>
>> This results in the capture process generating twice the expected number
>> of interrupts, with one RUP done and one BUF done interrupt for each frame.
>>
>> We can relax the interrupt pressure and VFE load by removing this extra
>> RUP command, which is only necessary when initializing or reconfiguring
>> the VFE.
>>
>> Note: this has only been tested with vfe-340/qcm2290, the assumption is
>> that the other VFEs behave similarly.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss-vfe.c | 5 ++---
>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index c575c9767492..32de1d104fe7 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -481,7 +481,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   output->buf[index]->addr[0],
>>    				   line);
>> -		ops->reg_update(vfe, line->id);
>>    	} else {
>>    		output->gen2.active_num--;
>>    	}
>> @@ -546,9 +545,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>    		output->gen2.active_num++;
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   output->buf[i]->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>>    	}
>>
>> +	ops->reg_update(vfe, line->id);
>> +
>>    	spin_unlock_irqrestore(&vfe->output_lock, flags);
>>
>>    	return 0;
>> @@ -582,7 +582,6 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>>    		output->buf[output->gen2.active_num++] = buf;
>>    		ops->vfe_wm_update(vfe, output->wm_idx[0],
>>    				   buf->addr[0], line);
>> -		ops->reg_update(vfe, line->id);
>>    	} else {
>>    		vfe_buf_add_pending(output, buf);
>>    	}
> 
> This looks good.
> 
> Obviously needs a lot of testing to validate across various other
> platforms to validate.
> 
> ---
> bod
> 

This works fine in sm8250/rb5 however it breaks x1e and I'd guess 8550 
too where the change was originally developed.

Dropped for 6.17, I'm not sure this change can be made valid across the 
range of targets we have.

---
bod

