Return-Path: <linux-arm-msm+bounces-17503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DE8A5BA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 21:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15DE81C20B1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 19:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FAF15E7E4;
	Mon, 15 Apr 2024 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAeaetk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA915E7E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210440; cv=none; b=Xrmoq7gWc672OYiVOMKIEY3cblDI5EeVzX+S25vGJAUNTjDuIIt6NyVWlFCwlt7jjRo7AhkdB9wtK79MGnMb2CM2jmmktbA9gFlRv6grvY+wbbh+uOxyeGdoKoMNOejP5/6BpGdaHTJgOG81Ld3SCCKm9yH57zJq2/87es9Rtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210440; c=relaxed/simple;
	bh=EFZMygEZ5gxZXFRwxYGXefaLQZcRDsVuFTWNa8wxK5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wiw0BcbGFFgMimEpg8rmE7+iX6jCXbAL2oOPkcNfRw6nJKcgDkGKCYXm20l1fWjn3BA6r8axi/KujSeqlTNR8NoD7qEnhC6GARRFbmpGoy3+TaLn4da/eT8I6pogmzfhPz7yzlQXrB1k2lZlDMTR1VbyrVqOHpUL9QnDVLh4xx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAeaetk4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so4347359e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713210436; x=1713815236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbsGbbIdpP0nYrgFFND/WuAQtLVhF7S4V4B8K1xyJ58=;
        b=ZAeaetk4kqgwvFkNnInhhHjpplyoka8Wr6HuILZdGny+kMAx9sRjU95A8KBIcMtzEn
         SgNS/T17eXPIl3zshB/R6hRyXGozYYqaPdDARqj79AX+bEn5hP9rxAObs3I11wLEhEeB
         fulb2Ej8T1xWGpd2ScP9RFTYHYJJTY8gNbiU+UvzkbAuLa7PY1uaabCrhiijUX6BeegB
         zNIcTLfMduJ9AcLOEur8I9ufdW0oDOst9VMgr5wqLf9A/tyoJXVmcAtFQoZcSOWW480K
         pVnUPeMe56CbpjNwDmZ28ZsapJ+6qpQeIPH4MM15o/PxiAXHEaNMYagSENXiQAfTKMRk
         LPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210436; x=1713815236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbsGbbIdpP0nYrgFFND/WuAQtLVhF7S4V4B8K1xyJ58=;
        b=axMrjjOi5tKRUt7bBK8yW+zXwrCaG/hmwQsHXCnqfVpf1ftpC21cMVWJSd2WPLvD2M
         tOyaEKHebP48ZtCo5NW2SmQkVyTU9ZclnvTpakwevegP4nbjLtX9DY7pHohdr8Mp5qTw
         gbua/Xf1/4hRg8mHPUlIzMCVg0Z3tAj8dg13v17F94d/6DWGDrOTbP9KiCfJu/bpahPC
         bffP/RJgEhe6gU+e7xLjAAREi8Qf2ZJee6w9aS6nVK0n2zn9aQ8jTCRYRlkotw+/giHR
         6TEBNL3rS9gsMMntHgFHfoQCgurqhFfhZI87EN7By5W4YrFCF8NVXHBjeLDKOoUQNUW6
         upeg==
X-Gm-Message-State: AOJu0YzCwLesHjNfafNx7CoKvd7D+Bc0OXb2tBaDYZJonA+cwl60OE6U
	WwCeccDso+fuvhbLzYrZ5xt7BPKiq7mEPQnduwFDjJExvGktGwR1j4w1UjCzscc=
X-Google-Smtp-Source: AGHT+IFvj4dlZTtUkZthyV9lygQW3pdDOk2CpHBOggluFdI+nVVKU2ePFZDk29BmxKjrmYLHQN0VRA==
X-Received: by 2002:ac2:4c52:0:b0:518:93b6:99f8 with SMTP id o18-20020ac24c52000000b0051893b699f8mr6980622lfk.14.1713210436053;
        Mon, 15 Apr 2024 12:47:16 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id bi22-20020a0565120e9600b00518a2206654sm789809lfb.77.2024.04.15.12.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:47:15 -0700 (PDT)
Message-ID: <ea0275bb-5520-41cb-be7e-71c00aa8fabf@linaro.org>
Date: Mon, 15 Apr 2024 21:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] input: pm8xxx-vibrator: refactor to support new
 SPMI vibrator
To: quic_fenglinw@quicinc.com, kernel@quicinc.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com>
 <20240412-pm8xxx-vibrator-new-design-v10-2-0ec0ad133866@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240412-pm8xxx-vibrator-new-design-v10-2-0ec0ad133866@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/24 14:36, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Currently, vibrator control register addresses are hard coded,
> including the base address and offsets, it's not flexible to
> support new SPMI vibrator module which is usually included in
> different PMICs with different base address. Refactor it by using
> the base address defined in devicetree.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

[...]

>   static const struct pm8xxx_regs pm8058_regs = {
> -	.drv_addr = 0x4A,
> +	.drv_offset = 0,
>   	.drv_mask = 0xf8,

Since you're nearby anyway:

GENMASK(7, 3)

>   	.drv_shift = 3,
>   	.drv_en_manual_mask = 0xfc,
>   };
>   
>   static struct pm8xxx_regs pm8916_regs = {
> -	.enable_addr = 0xc046,
> +	.enable_offset = 0x46,
>   	.enable_mask = BIT(7),
> -	.drv_addr = 0xc041,
> -	.drv_mask = 0x1F,
> +	.drv_offset = 0x41,
> +	.drv_mask = 0x1f,

GENMASK(4, 0)

[...]

>   
> +	error = fwnode_property_read_u32(pdev->dev.fwnode, "reg", &reg_base);
> +	if (error < 0) {
> +		dev_err(&pdev->dev, "Failed to read reg address, rc=%d\n", error);
> +		return error;

return dev_err_probe() instead

Konrad

