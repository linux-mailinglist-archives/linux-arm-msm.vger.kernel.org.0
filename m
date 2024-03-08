Return-Path: <linux-arm-msm+bounces-13694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F3876287
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 11:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4C02819F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 10:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1545455C18;
	Fri,  8 Mar 2024 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L34vsXe5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A5455781
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709895526; cv=none; b=XdUV6BjyIfPqmBFvkhLYZRGxw6/L9eOsxfvfKPf983RVEaBRBD/p6DyClyIiTKUvDXXDVSUtwZ2rba6D3/YNBLPnsAbhGMQR2I+l4WiBoyivonvESJRdiDIDJSDXCIS/Ew+nfjO1BQ468SnypvV1HyvRQzw0x1KHO/PmXUa5nGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709895526; c=relaxed/simple;
	bh=NsBAMVV3UGnfxcnXbaurwKVQRZzPsLLq7CIVcfF+8yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ/rVGqD9eXnUN31E3urlGWeeyuTOJSEiXumz1QwhayaOr1VrHA7Y+Tl/NBfmgs8EbpwEr0cGYT4+xn1JoD2lcIK3xfM3CNLzFEuQUuUpgCt2fc1RCVQbAPzYLZgvX02ZMzqdfr2JUIv6gkMfJtcsc1rlTvUyIpMucd0k45qQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L34vsXe5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412f62ee005so14527575e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709895522; x=1710500322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PcnQrF5xYcn5uA2BgCDjMiJSTjBuh0mLxYEyK2hOjDE=;
        b=L34vsXe57OqqeHORbzp5GddKLk6UxjEWM0Cj5Uoq4ALouvlcEJpc3FWVFXmWbDpWuC
         XAkon/fFo0dB0SwnSLZ6DWmU0wXEjiP6nke3RQjQKQGR+rd7MIYEBrRur/nUHAldq1ix
         c1a8iQebCARs8Aux2Mqzk5cXjzRsannsxKgsZNvT8P8pwSUZutQNPTXRYQ5oluAmOeMH
         rup4DKsHYDb4FOa/UyvZHD0MM1XTbUF4poyHdcdwGqrXk+eOf8NeUEXlf08g7o9tdZn/
         brel2RgjU3KIhm0cUBMrrKqnV6pSVycVt6YjXabQK3WQxYt4Vruh0Mm+CLS+wE72x7/v
         tk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709895522; x=1710500322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcnQrF5xYcn5uA2BgCDjMiJSTjBuh0mLxYEyK2hOjDE=;
        b=vPTuCBMlqXIl0BxR81sciCe8MduzJx3DgHZ4QkoKDKRV8lODQw5u7ZioK765yCyqQL
         Wf40T7u2Xh+bd1ds/sVJKJhsFgpKFWr+IjCOnyESuP2j03e8Ok1k3JbfwdjkIFnXyajc
         3+AJkX0C+zbWtCDPjdacOpuDSIkcxVzdzN+Iuq9lZCQwV+PQfd6GEPGNpekZIaDWcwA2
         KGgfgBy9oXZqxvjEujUbY+ytAPVdXxtX/BWeWTFC+kfv0qoIqWMY94yJXtLo/Tu9koDV
         fLwGViBPVlkkaNEEHtJjNeHYszqb2Nm94mQzOxGsY+KREtwNQwJ+tejG4oUDcdEHopU4
         wfuw==
X-Forwarded-Encrypted: i=1; AJvYcCXcY0QfGt9f8n7RfEnVTD7J5lyeSCWa74WC7Y7NdmnOpfZzNRoq0AhPCNELNgtPzQtg9rqkrysWYV0ogmuUIv9xnQEoxxpzJZGD/NGtuQ==
X-Gm-Message-State: AOJu0YxbOZn3VxxsYQ1FEeoYGNtdHwofbCk1hCukYK9lVkVVEMVohpIP
	1fYAzMoWtVk24rvlKJ0GFl4cuPaKf6hNPM+GWfnlkX2eACK9kLG4H4B1vl1k/Mg=
X-Google-Smtp-Source: AGHT+IEr6crvsduU8MOWRTpH+ToY9A8BjBd9O1NFZkqJKiiergiii2dZaxn6uXWzWJFLFdMhtokrsQ==
X-Received: by 2002:a05:600c:4689:b0:412:ca58:81ce with SMTP id p9-20020a05600c468900b00412ca5881cemr16061693wmo.13.1709895522479;
        Fri, 08 Mar 2024 02:58:42 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id by1-20020a056000098100b0033e22341942sm20086822wrb.78.2024.03.08.02.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 02:58:42 -0800 (PST)
Message-ID: <d893e8f8-66a7-4460-9468-0f3a359cece7@linaro.org>
Date: Fri, 8 Mar 2024 10:58:41 +0000
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e2627a99-307f-1e10-abfd-ce688cc2ec03@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2024 10:46, Satya Priya Kakitapalli (Temp) wrote:
>>
>> Not if you mark it critical
>>
> 
> Marking the clock as critical keeps the associated power domain 
> always-on which impacts power. For this reason we are not using 
> CLK_IS_CRITICAL and instead making them always on from probe.

How does the clock do anything _useful_ if the power-domain gets 
switched off ?

---
bod

