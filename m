Return-Path: <linux-arm-msm+bounces-8271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625C83C7A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 17:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B295E2952FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 16:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A5A129A6C;
	Thu, 25 Jan 2024 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DP2Ytr5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8B1292F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706199299; cv=none; b=SkT7SiIeXj6bsqKC2i8LNNohDDxC8tckm+iM6U0QfIa+aJZ60PZv0cIyNf52zwJf6z3Ih96SjkSRYlxB44ukyCsT98UQJLGg2kahZkURfeMVlH2gtE+ljGWsuKbvxA39ZUR1Oj8P1AGPKiAZHD1dO2LbLYEbX4tqRGQolINvozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706199299; c=relaxed/simple;
	bh=phDWEm7E2RCC4IWzHMQu5zDaitdfQlVSfh1cl5FhwkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhPG04ckH+7fXr3VCi8PkVpWnieHVE/aKm4w+32TMOoNvvnUP3oNXg5YY+NhiAgrhFBKQdxjfIm8J+9dXXVzAPWIFG7OA4mpo5X8RZ07SsIij+auwaH3qBuKLppLbpDyk9ElHkYU3kg1yNMz6axD1VMF7VIi6OvRD2pHUBXkUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DP2Ytr5X; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50f1c524010so7882628e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706199295; x=1706804095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0jv+o9A+wYCzDu98VpZP/cBQ9vOtBitYiceIg2K51c=;
        b=DP2Ytr5XDihUTxMv0OSsCQ1olRSyB7aaSkZYpIdNBN/GhOZLGvQXpfUdlqkk/4YH7R
         RGMdof/uSBov6J+ZlD7mINb24sf4OmkUmw4LOCOI3YdCCrU/hq+hxh4otMm4UcVwuukK
         YqiPhdiIlJCanTUFHFpaRj9eWjcl097ULWeJPGrJORQUsv7e4eBNUGl9nhP89XV1ZJx+
         c5J4+BZ8e+noovw8LIvPv5Fi8Nifg+cXQk2hyGURaFN25O8C7ephXfHLjr67ZPVH7nxc
         dhMKcaJe68Ghuo5M/M1fDzfufyOnIY4TZEiWYygfD8PD+1+gzxwX4PWbQSr98leTVVem
         eWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706199295; x=1706804095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0jv+o9A+wYCzDu98VpZP/cBQ9vOtBitYiceIg2K51c=;
        b=f8ucrZmvhEZdA2i5Ew18CLNf2zV7HUMA3rz5k2tQ5bk79fZ9ih+se8opogdHR8OtiT
         Oz3hrkp7u7oLhIaoC7/1u4631ZOX9kTGx15qRVsl/3q2qWEzFxdmHFWxeOf933HxxbTS
         JS1ioeFUbn/AIHzBPium24ltkcsb2ZWGqrZ8vxxzVw0xKsRURQ9gPbCwfx1CKXT3lk5I
         Ccs/gK7aQxoXleLcXR3/xWnuFZWE0UV2mrqoGqhrWRZzUleAN52ZvRD21rLQWdYnZPpY
         BY2d1Zy/1zB8XwLEYMXcRHlS/J/3zwREE/UYKP71g3GM+aEHoWZIQzMeY9Xf5vzGKxgr
         CQ3g==
X-Gm-Message-State: AOJu0YyhaQRm1d9DAxIlzjiz/B/ygFariW0ZTu0LLWW4rz0VokrAuXlg
	gc1GFQOO6+oWAXUwlhVKv18QD68t4omskJjBhO4wHkjsqRZkA8GU5SqPw9DKeKY=
X-Google-Smtp-Source: AGHT+IFZ/h4luzDKQ5Wha8fN0MhJ7rQBNObQhu+xNDCHND/tH2/sOdGz9/MbywzPqywUbLdy3dKWnA==
X-Received: by 2002:a05:6512:2202:b0:50e:7b34:c18a with SMTP id h2-20020a056512220200b0050e7b34c18amr13800lfu.111.1706199295600;
        Thu, 25 Jan 2024 08:14:55 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h22-20020a056512221600b005101ee22b84sm145726lfu.1.2024.01.25.08.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 08:14:55 -0800 (PST)
Message-ID: <a1e4f2aa-0746-4731-bcd2-ae71f5ca713d@linaro.org>
Date: Thu, 25 Jan 2024 17:14:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8550-mtp: correct WCD9385 TX port
 mapping
To: neil.armstrong@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
 <20240124164505.293202-2-krzysztof.kozlowski@linaro.org>
 <d1cde782-c223-4400-a129-18e63a10a415@linaro.org>
 <3f03ebc4-c67a-40cb-8863-d9c800af54fa@linaro.org>
 <8819b406-34a4-48ba-8d69-25cb4cbcf3e1@linaro.org>
 <320eeed2-af8c-4a83-b0d6-301ceb74f532@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <320eeed2-af8c-4a83-b0d6-301ceb74f532@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/25/24 14:02, neil.armstrong@linaro.org wrote:
> On 25/01/2024 11:47, Konrad Dybcio wrote:
>>
>>
>> On 1/25/24 11:43, Krzysztof Kozlowski wrote:
>>> On 25/01/2024 10:59, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 1/24/24 17:45, Krzysztof Kozlowski wrote:
>>>>> WCD9385 audio codec TX port mapping was copied form HDK8450, but in fact
>>>>> it is offset by one.  Correct it to fix recording via analogue
>>>>> microphones.
>>>>>
>>>>> The change is based on QRD8550 and should be correct here as well, but
>>>>> was not tested on MTP8550.
>>>>
>>>> Would this not be codec-and-not-board-specific, anyway?
>>>
>>> Yes, indeed, it should be.
>>
>> Should we move this to the driver and drop the then-uselesss
>> dt property?
> 
> Actually it's codec-and-soc specific, so I'm against dropping this.

Aaaah snap :(

Let's leave it as-is then.

Konrad

