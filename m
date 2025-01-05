Return-Path: <linux-arm-msm+bounces-43949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0137A01CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 00:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324DD3A058A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2025 23:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702BE1D47A2;
	Sun,  5 Jan 2025 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZARwvtBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871701ACEC4
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jan 2025 23:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736121526; cv=none; b=GE/pmnApDbh5t2y+aSYUiE1UGkHWD2vbfDvsCSB/HOcWkizi0E0S9pz6db0CwnLq07+v55uzKWZE6zYLBeVgZDLLiMIQaIwRQPc5fax/7WQnxvQKQ1qHr9iWDpx0nitdIge9VK/Z1JvJh5P+cqR5Ns/NVvqNqyc4ADbeZWx99J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736121526; c=relaxed/simple;
	bh=/oB79DLaXODS/gy0IycdhaP00aBIZCZoIFqlOL0QNUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwaXxW86NZtkSZGFC2My2+b3SUOL+jsxE6C+cyZWAEvDhvi4VDZKYY1gRbFUaGC2+zSVp5x8zHKJkjd5gEyXAQEF0I8Yp+GYyffYTHsSe3Dlk0/N6/jjZ/RYuf6SNtGwJUMj84pgHl/14lee6tFkPWV/Rp+9b4h8qGCiBrIqUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZARwvtBM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361815b96cso91644225e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 15:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736121523; x=1736726323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbNsBvpoFk/1ISttIYoBxKkguUBs6TizEP3xjLgdI3c=;
        b=ZARwvtBMc9l9LUR3QyT8VfX+NWVX3LiEsgxZljjLUdImEa5brnRuIBhSu2deTwe7gD
         Muhs0bG+DkDkE+MygREuGoDMYsl8iDYxSfjP6pCPe64vuovD/k/OnbbDRHEgLLWt3vUZ
         1KjXFZf7Y2gM3IU/e64iGd+bhtpWbmRJmFib2xTGUdLLl1eoIqOZmcJF1cXFdXcj2WVN
         1uHd9fVtnDweF0AkImXCJeTL/Aye2dS2nZZe+nenFJiLhXouHQAjV7QBavBla5hcsQZH
         BlAYSRK6d4ppjAJ9OrNEQAO1IH9wDS5BYW5n+O9YXFn9Lof1E+6PVR71U5FBM2KClWIb
         EFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736121523; x=1736726323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbNsBvpoFk/1ISttIYoBxKkguUBs6TizEP3xjLgdI3c=;
        b=YZofvP7p8cmevYU9psbBWGkvzfVyP1aqePO797WwT1q/CxxeKCTg/26UfhDOHUfkJi
         qDcA3S8zagXNNGAstpR4VkDyKt5vBifLFDdBlmCQcZmdr2EBQMk2zMoIyhm+0jwulAfp
         +8d9dKVpgcqBVVZCh8bX6Qu+C8Pu6JSFbg0n5AJtBHiwDhHr+5xQhJZu+0K8chhoONzn
         vWLDDzzQphhVk6uB45PiR6xYk6jU6Cw4trOn4gSbdTAXGgqkI7jR0ioA3GDHt1hINNrl
         12xxS5t0FmqDcoSv+2ODyM6Y79HMThr37MtCt2H2dMCuL9coYlQWl8fKKFs0VW6qDgiR
         r3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnEbe7S9xZnyR7Zy3x93JJn/ey5gMFXmqPzZEw+WWcNGz64KlbTCJqH5jkYIKatf9LsqtdB7bxoq5LMEeK@vger.kernel.org
X-Gm-Message-State: AOJu0YweVMG9ZGCDyh3X5Ulf3yKQbfSJ6zW1F7mfR4NjC/gwQ7M7imzh
	UBjUYtqIZpSioOlPYeTL6W4a1CefwBiEVP48PnyIub3C7A9lYE0R2J3RqJYFbIo=
X-Gm-Gg: ASbGncu++ZRnat+EYuVpOM4tLgW5LRTK+M2VnoxNuUjW9a6ku+MdZwdaHoQLNueTia8
	KpLmKdzfBMCj49adyGWDv62KAPzdONSbopyQpxYnCuy5MQzajLlCFiIvzA/nwAXcbSFsdNmWqjX
	O5JnB3TTdSJkpwuJd0knGr2oczgE49RZh8vJ82Ai8Drf5DaSBvcUIkHJd912PzZUZQlAaHpBytX
	YHFkWowYpuOi9L2WZpea8nwanFAIeqKPFbQR9Q9g1TAV2P/LqBr7Is5uyXU27HiR4l50A==
X-Google-Smtp-Source: AGHT+IG6j9C9E/4LQM/2K35FNp7NLqsvOtrbIvhYHwapMRYFDdicWc8WyEtxiJGPCxEYcdYg4mD91g==
X-Received: by 2002:a5d:59ac:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-38a221fb47amr46144030f8f.22.1736121522802;
        Sun, 05 Jan 2025 15:58:42 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833280sm46693179f8f.40.2025.01.05.15.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 15:58:41 -0800 (PST)
Message-ID: <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
Date: Sun, 5 Jan 2025 23:58:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: fix OOB read issue due to double read
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2025 05:41, Vedang Nagar wrote:
> During message queue read, the address is being read twice
> from the shared memory. The first read is validated against
> the size of the packet, however the second read is not
> being validated.

A brief scan of this code doesn't really show the base case you assert here.

Could you be a bit more explicit.

  Therefore, it's possible for firmware to
> modify the value to a bigger invalid value which can lead
> to OOB read access issue while reading the packet.
> Added fix to reupdate the size of the packet which was
> read for the first time.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b91c2483670a2b11f4fd43f3206404..64cc9e916f53e5a9c82b1ff25c4475d622ebc321 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

I'm not entirely following your reasoning here.

Here's how the code looks after your change:

if (new_rd_idx < qsize) {
	memcpy(pkt, rd_ptr, dwords << 2);
} else {
	size_t len;
	
	new_rd_idx -= qsize;
	len = (dwords - new_rd_idx) << 2;
	memcpy(pkt, rd_ptr, len);
	memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

Which of the above memcpy() operations is subject to a pointer that 
firmware can influence exactly ?

Is this a real problem you've seen if so please add a backtrace to this 
commit log.

>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

If this is a fix it requires a Fixes: tag.

Please add.

Still finding the reasoning you are outlining here not obvious.

---
bod

