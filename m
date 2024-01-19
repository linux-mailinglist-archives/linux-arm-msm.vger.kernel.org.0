Return-Path: <linux-arm-msm+bounces-7606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6908327B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 11:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E9421C22897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 10:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085084C3C0;
	Fri, 19 Jan 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9UQcM5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35337140
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705660454; cv=none; b=ljQjFy1rdwhfofJwFUfc2VQqWka6boBC7M//cE3kAaEiG5L4heEDK6vUIuJAnhx9pJVRpQXeHP3RyG2lNLYhUJqiAFasx2XM0QyNhgMvAQF6HpcivMN8Z/7RY54zhdAEDrElRT4Gg5D/LLEzZh3qqRuRmaG8Vxzcr8Zsk5h931E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705660454; c=relaxed/simple;
	bh=xkh88fGvGvPfaWCVh70ljDF3Xel7SX0Cgirz2NCHweE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmzQmyK/oAaInmGpRLEN52MnYAM73030d57f/ays8B7U0BeuDyucwYSxy2wmTahLJG5R10MJ/URFFAGB2kqfvZqYnRrg/8p48udo/zGFDea7ZQEd0RkY1W1d/ceDUSVwZzxXe264w+3pTJslgU4a4RozEbj6ZkUyU5uMzhO1mco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9UQcM5L; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ea045f29eso1557685e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705660451; x=1706265251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFU6ipV6i6idjmO2hpL19HOJRROF4V//fLPJs2JBqFc=;
        b=P9UQcM5LXqNmuJuTgNo+nAc5R9p4TxIQgbf+Kn844OZhWKwobPJkZjwS8FHS7cCUoH
         Ur/Pmgi25PCNrMsoWW9mbQ2C8x+Ab1+ttpI3HoQo3O9HFxDBq5bGnjPweaQAr7ugI8Bm
         62E0j/Ea2Hli/j2yA7csN2XiAKkE9rUZtt5/ho96T5N2H101F4qz8FtdSGO9jKPvm+Ny
         tHA0USLE2RztX5E48RNWfSU9e9xsBrUvgvqSLyk72HMmjzp6R0f1bC9LNdwd3DGO0gad
         PHmVMDJIUBtgat646LCJYKNOJ0/zUspCr+tJEftxGoQZb7t7AzwCxo+uGMs/4NGfDxH8
         FfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705660451; x=1706265251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFU6ipV6i6idjmO2hpL19HOJRROF4V//fLPJs2JBqFc=;
        b=iFuvjsFdoDdz//xoxpcz6WD4UtSw8+pnJw63gl7W26yDCRoupi8bl+j+xY26YjR/fC
         J7jqXNBdedUxkyGKvvjiyx+zDXl+Zs1HSAbJp5//IPxzgKzZem1sEdZd3a2j4RIf5XzY
         37i2vRbZxtmd92N01WctGPqyaIgi2SoExTlJhvyGhXv2y65/wmkXU/IzOw80TKoFvHKy
         ONK1+5rkmcnSzMvnnAKawulm2vPWYcE25MnhpTMcg78UWXz/UCfWKBbD3Os9VU0rKsor
         zI4EHC0Vw+OaXO/yUnVzPD5plTy9wr/FSqCe2mJ3L19ZzMi0Fwm4BmvaRlAljQG9THYM
         72MQ==
X-Gm-Message-State: AOJu0YyL6P2KT4e6/Z1vgxuRps1u83GptxFMUru31hCnPrT5fEaRx7l8
	cA/M90N2Rw2bXBU5jRYhwES5y7tNy3i46sLJC/pMdrSrfG3ugOU61XNSuzPNrZw=
X-Google-Smtp-Source: AGHT+IGZ0CTGJIECUzLTA2BlMhExIYkjG+9NsgYdS6yHSHvB99AMGhFEC7viGrACMMX7r+tYRvxm1g==
X-Received: by 2002:a05:600c:300b:b0:40e:4ab2:cd75 with SMTP id j11-20020a05600c300b00b0040e4ab2cd75mr1188226wmh.74.1705660450675;
        Fri, 19 Jan 2024 02:34:10 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c1d8900b0040e95632357sm3894610wms.26.2024.01.19.02.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 02:34:10 -0800 (PST)
Message-ID: <82e4796a-8983-4045-8ca2-71aa9af7a120@linaro.org>
Date: Fri, 19 Jan 2024 10:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: rpmh-rsc: Enhance check for VREG in-flight
 request
Content-Language: en-US
To: Maulik Shah <quic_mkshah@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_eberman@quicinc.com, quic_collinsd@quicinc.com, quic_lsrao@quicinc.com
References: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240119-rpmh-rsc-fixes-v2-1-e42c0a9e36f0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/01/2024 08:26, Maulik Shah wrote:
> Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte aligned
> addresses associated with it. These control voltage, enable state, mode,
> and in legacy targets, voltage headroom. The current in-flight request
> checking logic looks for exact address matches. Requests for different
> addresses of the same RPMh resource as thus not detected as in-flight.

This commit log implies you are fixing a bug.

Can you do some inspection of the git commit log and figure out where to 
backport this change to ?

Your change would apply to 40482e4f73640d but a quick pass on the logic 
in check_for_req_inflight() shows its probably _applicable_ to 
658628e7ef78e8

>   /*
>    * Here's a high level overview of how all the registers in RPMH work
>    * together:
> @@ -557,7 +568,15 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   		for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
>   			addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], i, j);
>   			for (k = 0; k < msg->num_cmds; k++) {
> -				if (addr == msg->cmds[k].addr)
> +				/*
> +				 * Each RPMh VREG accelerator resource has 3 or 4 contiguous 4-byte
> +				 * aligned addresses associated with it. Ignore the offset to check
> +				 * for in-flight VREG requests.
> +				 */
> +				if (ACCL_TYPE(msg->cmds[k].addr) == HW_ACCL_VREG &&
> +				    VREG_ADDR(msg->cmds[k].addr) == VREG_ADDR(addr))
> +					return -EBUSY;
> +				else if (addr == msg->cmds[k].addr)

Consider removing the /* comment */ if it helps to apply the change 
earlier than 658628e7ef78e8.

---
bod

