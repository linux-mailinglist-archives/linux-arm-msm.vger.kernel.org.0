Return-Path: <linux-arm-msm+bounces-24720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED391CCE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6061C20FCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44F04D8B7;
	Sat, 29 Jun 2024 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjnjQtUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E229CFB
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666206; cv=none; b=TN3Gj4Pgkr8+AlThndhfCrWJgJg/EEwlgCBAD6a2Fs4yd3F5INVKHPHudjFqwPfRnQns2oTtKX8nBNNXOHLTNYXnXYgJiyu2Ye330nThf5MqK8bFd/4UNp+rwrS4i0Ra5Sp2iiSXlUiY0WEZWnwNQhbVd/+IOQUiJE6RC1CR1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666206; c=relaxed/simple;
	bh=+dukUqqO7cIErap+h/ymTCUcq+zEUjZtEffudb1in58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeHwEKZglyj4B+DVW93IrzqEwRyG0p7fN2FpPxyuGwdWO6fpcRZn71zGRBpjtu+tjbSRHOePbZS9xYI5+jDadhNdIhiE9KKUCVobd7/Ti07RxSOwLduyM8BuVS10hL9MkqB5zlPZ6itndSW+kznf2cOfSIxIzmh8Dnm+TIBgvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjnjQtUZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e7d2278d8so2150108e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666203; x=1720271003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcFnKL/ViQqZRLkBUtcYy5DNPj56xFfRsRoffNy4BM0=;
        b=GjnjQtUZpPzFoIkUINBn8x/RFxUUXPek0B3KxeADJcZxt5TIHRlTV2BMdUUChblQ8c
         HWdvLrKQ0NhnFTvriNXwlfYwoeQeZ3dWQtQvcWcPqYCEMi/hxlTYpSKFbZpGj0f7OSin
         Ustqe6y3/RVP3zB2eSwrHm1c4YGum4Ou0oIv1IR4VZtjT6RSUf/2u9RJM0047qf6bI/s
         tLk4Ek5hWrIoy1+Z/lTGOvU+ZkkhT4Yih1+l0Bp/kJnIoCz0riBIYvh+/+FhCi5j5DZc
         j2uPM3vHmhKxUQEcBaTltGiVhQNT//PLmnSUgLxvX91y5PiIJJoSbKCIUAeXJtZaAJeZ
         D94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666203; x=1720271003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcFnKL/ViQqZRLkBUtcYy5DNPj56xFfRsRoffNy4BM0=;
        b=xFPWiHFgCJo6rKfP7eGoHOk7yCvUPdDyWEBN4ayh5+ILps/C+AxbM9W2XAOGlLNgej
         IF2lGAjSEu2EoHSDNpy7DGONCJ67FKlAOzelud9+O35f4kbsN/IOrlrLEX81+Xh1QW1w
         RNxLayvV+7ojsuDs8d8xIiXpsrEuY9NNddtuqUWdTsvtjI6lPpyfVm+3RBmVokU1mjb+
         ZBtP9ImCv8BTLHa7dpvRoG0ekNdYpnR/6YYXZfejZf92DQvy/B5MJbwWQYN7X+4N3e4N
         RLU8HkJkKZ9+xh+i60LABnPuLqZ3mxsMCrSIIDfLxp3gda16/EVe+MKqp6nJMSo8xQJH
         CNlw==
X-Forwarded-Encrypted: i=1; AJvYcCV5BpeFjh4l/dznmd4/u396r2wiHIrfJyJCAMOpbTxVzyZD1Xmv4Mz0cFv3u3Xw4q0UXmEc4OabeF4V4A29m/kV180oZ0ds5rCtIZjFug==
X-Gm-Message-State: AOJu0Yz6DnVC7BJ60C6uq86dLC8ZIwRpOB4BWyghusNR2yb5cZkagqV3
	TESrrUdSb/IR5w+EkM7WtWPG4Nhhf/QwU2oYVVvyb1uXYbC9+zB0RmG5/LzWGvhBHYRqcgTmbyt
	R
X-Google-Smtp-Source: AGHT+IEK1INTGjBjGmb3jwaEpotqKfPa2KCAiFV23CqI8Zcnh6V+H+84uY63hTBaHkeMGrOEwwZfsw==
X-Received: by 2002:a05:6512:31cc:b0:52d:3ada:4b6b with SMTP id 2adb3069b0e04-52e8264b5c8mr990021e87.1.1719666202369;
        Sat, 29 Jun 2024 06:03:22 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf6336csm162734266b.70.2024.06.29.06.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:03:21 -0700 (PDT)
Message-ID: <ee324f78-4789-4873-b8e5-e2ae7b42a5b2@linaro.org>
Date: Sat, 29 Jun 2024 15:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] soc: qcom: smp2p: Use devname for interrupt
 descriptions
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, quic_bjorande@quicinc.com,
 andersson@kernel.org, quic_clew@quicinc.com, mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org, quic_deesin@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 12:48 PM, Sudeepgoud Patil wrote:
> From: Chris Lew <quic_clew@quicinc.com>
> 
> When using /proc/interrupts to collect statistics on smp2p interrupt
> counts, it is hard to distinguish the different instances of smp2p from
> each other. For example to debug a processor boot issue, the ready and
> handover interrupts are checked for sanity to ensure the firmware
> reached a specific initialization stage.
> 
> Remove "smp2p" string from the irq request so that the irq will default
> to the device name. Add an .irq_print_chip() callback to print the irq
> chip name as the device name. These two changes allow for a unique name
> to be used in /proc/interrupts as shown below.
> 
> / # cat /proc/interrupts | grep smp2p
>  18:  ...      ipcc 196610 Edge      smp2p-adsp
>  20:  ...      ipcc 131074 Edge      smp2p-modem
> 170:  ...  smp2p-modem   1 Edge      q6v5 ready
> 178:  ...  smp2p-adsp   1 Edge      q6v5 ready
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>  drivers/soc/qcom/smp2p.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index a21241cbeec7..696c2a8387d0 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
> +#include <linux/seq_file.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> @@ -353,11 +354,19 @@ static int smp2p_set_irq_type(struct irq_data *irqd, unsigned int type)
>  	return 0;
>  }
>  
> +static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
> +{
> +	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
> +
> +	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));

Not sure if the number is necessary but as you wish

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

