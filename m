Return-Path: <linux-arm-msm+bounces-13695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E78762A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 12:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3FB51F25111
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 11:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C8D5E067;
	Fri,  8 Mar 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M54ZAGHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B05E060
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709895575; cv=none; b=nMqeeihQJdkSNFLeWTJYDKMF72Xybl3DltAbPua+iPFcUGIT2RkKrP+hRiB5ppKKKIRZtIa59H5swYbWQ7BqaVxIGb5Cpe6K7GD+CRUe9CtELbbglq2avYHqsgNpAd5OtyeX71R5ur6ACqQ3oXcGuKzzFAYp0d55eDZTqPNDs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709895575; c=relaxed/simple;
	bh=gemIrESpguSYN6OepWccmGb17BJE1nCs+Iub7NEFhbc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C3XZV58XcSHIY72m7PlWMlPeqA9hcxemRrPIvDQZGMcl2NAqgkfqIswcIdktXGlBqpIBObT3cXZisbixr3rrqs+8dvUie3RA7IZ+cee/vuSImWIoalxmnwo/AxKRGHSRfcbvxqMNL2Cta2ZH7hSn4khYLWuvmTNQ1j7TaDQs2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M54ZAGHC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33e17fc5aceso1744745f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709895572; x=1710500372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPNyNWRZu1nwETUpCWarY8zMeCye3qN0o1wbR3I/W7Y=;
        b=M54ZAGHCTytt6+aonD6RL4Zu/GKuOKRvbOMEUcnUYi2QmVbKVp/ASFkcL9W27b67FI
         GRp0nzlaLmfTu5FUQu6LTOoSmS0ds4v7+tsFTO93YUzKm21q/1Ov8CELsjc9OUkC1EHB
         HQz4L5doJGiUWvgUC03D8NJi+d3eeFL2eFxS/axLi6X1/+Q43THRuZwXtz+j29yNFb3s
         0ME0KQoAJBG+Odj8ilL97RUxec4S+RN6CXF6vwczjLnaGHoNOR9cDCR3bL4Z8l9Du3a5
         pAruBzf/T+aJLiYXNqzDHJ2GXeJ0c9gltvki72dkqyZXqLs6LV3VPvcD/ObEwMzXkJ4a
         uRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709895572; x=1710500372;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPNyNWRZu1nwETUpCWarY8zMeCye3qN0o1wbR3I/W7Y=;
        b=qPnhMfco+YWefqzZGOWhD6mcJxrtu24VjXg5o1cNC/HcxkpTHQhnNZIvNWuwYouakS
         ISa7AOujNLRJsuaN0gn82rJgwn5fbgz/qaHnC0AdrlXH4svEPgDkqheRzL+UKjYzXJop
         Sp/YuGoK9rfQRIBzzPvZ333BSH0ljtqpzwfxxM3pOVWflxFQZHpZu4hyHePEAKSgJtmY
         9rv+RnyFyXIdGAcAGNVkKtlJSRTq76h/x79W+Ayr+e/7w6PsuxFVNbdseVauNAHCoDS7
         5U3FiQUQXopkiv9GavNITheP2Jn3CtAq8cTjNgdrwbBz8TDx9iUL/mvo5c+nTf9CXU6q
         VIvg==
X-Forwarded-Encrypted: i=1; AJvYcCW3oqYPJ24ezdcr2Z888sZZkz0DFNYVKoOp62zY2nf0lRsETOOo973UNji3AaEFUBYTC8M5zNT9/AONOIqrKqu0cYU5XVkGqq4RGi2KWg==
X-Gm-Message-State: AOJu0Yxd1gXZCjeE7IlSGBezcUI3lb23zWAHrrjdxItqDCLl/7dsIghr
	zvtuvsAtzAMOVSX7x43uieY+B4/kZHWDgE9mWLZBTT8hzX+78UIgW/8FXy4g27c=
X-Google-Smtp-Source: AGHT+IHZeGISz5BBijJBfDZAHNoLpL5CAxwaU/Dl6mZ/DmniaLPju1ROj/aubPlQlzA2BTZg6QiD8w==
X-Received: by 2002:a5d:5010:0:b0:33e:6612:dfaf with SMTP id e16-20020a5d5010000000b0033e6612dfafmr3687501wrt.1.1709895571857;
        Fri, 08 Mar 2024 02:59:31 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id by1-20020a056000098100b0033e22341942sm20086822wrb.78.2024.03.08.02.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 02:59:31 -0800 (PST)
Message-ID: <35a7ad40-aaf4-476e-8582-b83bac284881@linaro.org>
Date: Fri, 8 Mar 2024 10:59:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com>
 <20240229-camcc-support-sm8150-v1-4-8c28c6c87990@quicinc.com>
 <18567989-fb60-49ae-92e6-94e1bc2fa1c7@linaro.org>
 <83fd1995-a06e-b76a-d91b-de1c1a6ab0ea@quicinc.com>
 <4817a5b0-5407-4437-b94a-fc8a1bfcd25d@linaro.org>
 <e2627a99-307f-1e10-abfd-ce688cc2ec03@quicinc.com>
 <d893e8f8-66a7-4460-9468-0f3a359cece7@linaro.org>
In-Reply-To: <d893e8f8-66a7-4460-9468-0f3a359cece7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2024 10:58, Bryan O'Donoghue wrote:
> On 08/03/2024 10:46, Satya Priya Kakitapalli (Temp) wrote:
>>>
>>> Not if you mark it critical
>>>
>>
>> Marking the clock as critical keeps the associated power domain 
>> always-on which impacts power. For this reason we are not using 
>> CLK_IS_CRITICAL and instead making them always on from probe.
> 
> How does the clock do anything _useful_ if the power-domain gets 
> switched off ?
> 
> ---
> bod

i.e. the clock can't be running "always-on" if it has no power..

---
bod

