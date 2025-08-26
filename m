Return-Path: <linux-arm-msm+bounces-70891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358FB35F20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 14:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100F11BA079F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7AE28751F;
	Tue, 26 Aug 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUJDouHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32757262E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756211448; cv=none; b=qZsOh54fnNaWcWtHiZSuZdwI3nnGvPorYbxFfOPI3GyKDv/p/9AS8nKrx8FUe979L+zxMmTcM9arNymmntw1wQ03KUsWFHYscmN3pO1LdOMUiCO8ChLCzcYRwtU4WTJN2Yuxju9/+OALPfpYhfHr19R5bOtfo/IHtIScLTQYryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756211448; c=relaxed/simple;
	bh=ma5t6YXeVJpIipfm5/CG8lKCSELEwhRTnwbTvkULl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8CjPa8lIH1W5EUaqunx+/n8rR7c1DOkxPF7JWZBzLhbaLKP5r5drZ3NaiCsbRF3SXXBBTtYVP1ioEazdvonuhKemu8uEsIiGJF5dXPD2kxUOi5s27FOzVr0/1BCu02SsCHpM6k1VFOw8l0GYHPm+1e5Vt5fv8jUcvtGYZ3JWhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUJDouHc; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso5952616a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756211445; x=1756816245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkoS1mgQUsuKKrSkoR2eKBjtP1PvOwI34/oZkFfI/4w=;
        b=eUJDouHc+6pKfunKmb2yl59eCyT5uiPyLf10a8OP59YkRIz5YsPcDq8ijoVD34+UNA
         iOz4HP5YwiVxCVltnDLrUwIPgr++iogxRWNcgGSAaKT6GRtq7t/Q1PcNXtrTS5q3E08A
         pI6qo9UhBpTrZ1NNt3Cks7MLqQuSp+jWa1vx3huxgfp7gasrKP07VuAZbfVII5hqC6OJ
         lzatrkgirbOx9nvF8t7orj8LhKTrq2BylRP5wG9zYNfpRx4sQlCvgE6Wki44PBgb43+s
         8BMfmSYMYPfY8ltThU5/j2rZZBa5HS9A3VeEQAEfU3x6FM4t8xg5aA8jWGb/Md0WiVhV
         3Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756211445; x=1756816245;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkoS1mgQUsuKKrSkoR2eKBjtP1PvOwI34/oZkFfI/4w=;
        b=LjuX9tZIBTpmtY+c34ROcrfva0JDvAv4vMaBoaf1ko7RsT4FQ38kFTXQFi/fqX0RLq
         kDPUwzPTI2f4b3dl/Gs896iIIG4GfWe7Rr6t/6LA72EVeUtKntorLzmapOkteccPzhHg
         fCtztwIqQkjbjp/yA/lPKBTAgpbttp5aYjM6zJzFqnso+8IWcI6jgAbNJ1QYv/Eaml23
         7i64tlgQCYCpLhlO4aSEbkQnx6wG9bsZTeH3dzdxxY+FlMM3POuQv0FciQcr9rQIbNQi
         XLBXXhCMar5+x1WQz88iCw4c8RLG9K2nYCBl2NVSXGNmR3h8Q38EOXcmEODmE53a3xch
         a1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXH9Kfe1UvBMwFenH2RXw3CzxjlUN9Cfygd+a7a7W+D8ZNOJ8Gh+V3sQkAQ5GbVvH1EA84hcXYyLqZx3ZVj@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKkkUmC99D8SJD+4hjjVcl+oi/ZMmiHTjwcB0/ujqhHZWV/Wn
	8PEyUGfNEWb5LkZFGb38Axyc3w83HAlKRlIRtdN8LeAZDOyf8vIWQIFb8ADkR7PzHE0=
X-Gm-Gg: ASbGnctGM6I0ABIBVbBrRsDwpLoSnEqmzKCBq/i2XXWlImtyKHD0G1mtUrF2lBfvaT0
	Yh5k8w0eXsQfZhki9tyQVG51FpTpdWbBQAk+1LKzdmh0eh+2bsH+Lq4GCTYhVaSBCDHAthFRhrn
	FFWiSHyoS4BBdoCMJJCS8JVEARLTb+9wL8P/m+unOpAlXFUGhZ8Zz3klIYWDKB6REnbLQTdFbnD
	fiKOFjCuHXxVjdcqUqwudIzvEsaMG9dK80B+0ONkV7/NSd6WtskmxmVCZT6xbpN7DJlX3qAoMiv
	C3DHYYgVPzkzQMLU6UcO9V5lvua1EM3Ml2mIphRI2zTprErt3K4f8ABp4WYcrwwfPwLWl8Ylfty
	g8+Y3KF4AZxB4LrMTJllxY+LpkGIjWOAC7t7kBPvHbrchzR211uNa9jo+oXM9+0LKNvvf02/Svq
	JEv+GwPsJj4NbFT6eA+er9UvcwZWNEf6irbslezZ4SCA==
X-Google-Smtp-Source: AGHT+IFoNo4sUuPVz97d4PkLZSbI/f1UFt/iMJnmEAyKXCStBHMmMzr2bqFoTjxJ9/MLfPPKQLWMCg==
X-Received: by 2002:a05:6402:40c4:b0:61c:9cd7:e5b3 with SMTP id 4fb4d7f45d1cf-61c9cd7e885mr392714a12.28.1756211444652;
        Tue, 26 Aug 2025 05:30:44 -0700 (PDT)
Received: from [172.31.14.217] (static-243-216-117-93.thenetworkfactory.nl. [93.117.216.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3172ef02sm7148078a12.39.2025.08.26.05.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 05:30:44 -0700 (PDT)
Message-ID: <d828855f-1371-4a0d-a636-b04de47376a7@linaro.org>
Date: Tue, 26 Aug 2025 14:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, psodagud@quicinc.com, djaggi@quicinc.com,
 quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_arandive@quicinc.com, quic_cchiluve@quicinc.com,
 quic_shazhuss@quicinc.com, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 neil.armstrong@linaro.org, srini@kernel.org
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
 <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
 <dcad137d-8ac9-4a0b-9b64-de799536fd32@kernel.org>
 <DCC8WLEKNS8W.9GAJHQGYPZIY@linaro.org>
 <8689a8b4-75cb-4f01-ad6c-0a8367851257@kernel.org>
 <DCC9B5C7SSU2.GRI1UY0VUDHF@linaro.org>
 <890ede8a-c049-4332-8f62-5dce2fa0f77b@kernel.org>
 <5ae730f4-5337-49f8-8bec-8605a2495f37@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <5ae730f4-5337-49f8-8bec-8605a2495f37@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/08/2025 11:29, Praveen Talari wrote:
> Hi Alexey/Krzysztof,
> 
> 
> On 8/26/2025 3:36 PM, Krzysztof Kozlowski wrote:
>> On 26/08/2025 11:37, Alexey Klimov wrote:
>>> On Tue Aug 26, 2025 at 10:21 AM BST, Krzysztof Kozlowski wrote:
>>>> On 26/08/2025 11:18, Alexey Klimov wrote:
>>>>>>> May i know what is testcase which you are running on target?
>>>>>>
>>>>>> Boot the board?
>>>>>>
>>>>>>> what is target?
>>>>>>
>>>>>> It is written in original report. Did you even read it?
>>>>>>
>>>>>>> Which usecase is this issue occurring in?
>>>>>>
>>>>>> Boot?
>>>>>
>>>>> FWIW, what said above by Krzysztof is correct, there is no usecase, 
>>>>> just booting the board.
>>>>>
>>>> 12 days and nothing improved, right? if this was not dropped now,
>>>> Alexey, can you send a revert? Author clearly approches stability 
>>>> with a
>>>> very relaxed way and is just happy that patch was thrown over the wall
>>>> and job is done.
>>>>
>>>>
>>>> If you do not want to send revert, let me know, I will do it.
>>>
>>> I am okay with sending revert, just trying to see if there is any 
>>> interest
>>> in fixing this.
>>
>> Any interest should have happened after 1 day of reporting linux-next
>> breakage. It has been like what? 12 days?
>>
>> That's typical throw the patch over the wall. Revert.
> 
> Really sorry for the delay.
> 
> I forgot to mention earlier that I’ve been actively investigating this
> issue across different platform SoCs. I was able to reproduce the
> problem on the SC7280.
> 
> Here’s a summary of the observed behavior:
> 
> The issue appears to originate from the qcom_geni_serial driver during
> device runtime resume. It results in a blocked IRQ thread, which in turn
> causes system instability.
> 
> The call trace suggests a deadlock scenario where the IRQ
> thread—responsible for handling wake-up events—becomes unresponsive
> while interacting with the pinctrl subsystem.
> 
> Specifically, the msm_pinmux_set_mux function attempts to invoke
> disable_irq, which is problematic when called from an IRQ thread context.
> Since the IRQ itself is a wake-up source, this leads to contention or a
> self-deadlock situation.
> 
> I have verified below diff and about to post it
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/ 
> qcom_geni_serial.c
> index c9c52c52a98d..cb3b4febd8c2 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1848,16 +1848,36 @@ static int __maybe_unused 
> qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>          struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>          struct uart_port *uport = &port->uport;
> +       int ret;
> +
> +       ret = geni_serial_resources_off(uport);
> +       if(ret) {
> +               if (device_may_wakeup(dev))
> +                       disable_irq_wake(port->wakeup_irq);
> +       }
> 
> -       return geni_serial_resources_off(uport);
> +       if (device_may_wakeup(dev))
> +               enable_irq_wake(port->wakeup_irq);
> +
> +       return ret;
>   }
> 
>   static int __maybe_unused qcom_geni_serial_runtime_resume(struct 
> device *dev)
>   {
>          struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>          struct uart_port *uport = &port->uport;
> +       int ret;
> +
> +       if (device_may_wakeup(dev))
> +               disable_irq_wake(port->wakeup_irq);
> 
> -       return geni_serial_resources_on(uport);
> +       ret = geni_serial_resources_on(uport);
> +       if(ret) {
> +               if (device_may_wakeup(dev))
> +                       enable_irq_wake(port->wakeup_irq);
> +       }
> +
> +       return ret;
>   }
> 
> Thanks,
> Praveen Talari
> 
>> Best regards,
>> Krzysztof

Don't forget to include a Fixes: tag for this change.

---
bod

