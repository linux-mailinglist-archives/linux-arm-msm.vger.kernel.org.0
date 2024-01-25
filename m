Return-Path: <linux-arm-msm+bounces-8218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A18B583BDED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 10:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325451F2E45A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925CC1BDE2;
	Thu, 25 Jan 2024 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ll/HaHqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D111BF28
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706176308; cv=none; b=L6V/Gdq0m+cPKuvnxIR9RKGDohDkkKYri0RbdASLkoPXgCdzv4xKGbpP2IPMwOkMkEdskz/8MJMCU1F7e5llZwjM6KYlub1dPksS9oo9Eznhjjt8Ss9AAar0mkvcoPUhtPo7/8FZboxjhYwO9Byd1QrVVrYCiUJsyfJ8SrQvUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706176308; c=relaxed/simple;
	bh=RY3/XYzYXl3owFuOuVGH+KjHicIjDCHgrv4ZIECaYpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vt+Hn9PxfwruLk+y9U9249sVtahJnj2mLU9laXC5gV6ozpGEzjOGUX9FpuxKNiAlo/K65jsFUtivO4LpbXjAoPkziQ7IEMGRNFokLliimAwC7n+Nbpzkhe/bW9TnpjtYYxuOt+UaxIu1axcqNsemW9YeeM6GzDbF0MmGyDeBy4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ll/HaHqP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso300049e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 01:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706176305; x=1706781105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTUPFg4ZPrzSVdq+saqKH9Sm8wMicRr4g/EmH7EYmy8=;
        b=Ll/HaHqPzEmTI2U+fU4kkrYwrjWCfCyzSG+tyKzEheooJAvgHkV/wJBXQ0My+h8dFU
         yqDahRpPoaJiUtuY/9z+NSVw8gNrB7ZIg8PY8K4kXxX9Dcyn0CdGH7f5nwN+nCd5C5YJ
         zYjdQ0J3TJGmlkiZvc9KCO3hR/rboc7Bob5SzgoVl3Dcp8WCc9ONzOIk+sBJLJ45sg3X
         4G3hdk7rxyHjjnHX03BtOlyRNoqOQtuy/i8NfgSR/8nClpJKFlXTZSjjTChTyNEeRk1i
         pj6BzXpvVdtcLV7W8NY5H0lP46kpZzCIg63RjlGQSeEgkScXqQ3SETnDeVCWjMDcVTYh
         y3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176305; x=1706781105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTUPFg4ZPrzSVdq+saqKH9Sm8wMicRr4g/EmH7EYmy8=;
        b=WiTNf5K2NixNG5ilyzGnjVkqCwpqOpwRZlFAHPsHbzwZ7ygKpR7QIKkBJRnckgunYc
         RLAFEEXLu4JDAMAPKPQPUSb8/RLRMDzWOJUZk37aZN4e2QXbLSD/MJ4KnVValxKTe6fJ
         NdD6ociExc3KuC4o8TMXUVHvKUCPkQngZ1tXBeEry/D3E4I3uF2aNJAGpDNxaoskx7DK
         Jca3AhGqpsKI2G2LVKLQghNy9lwmh9zLxJxp3bSBBaBwNCaOLtGJ06UFfBg7RG3pDlp/
         0U6JZY3lXqAP//saT+cXdUyeb86j65Of+gCfcvuKd8Y2YXA+yTw7b8FgQWg2YE5wC/Fw
         3AkA==
X-Gm-Message-State: AOJu0YwjaU8KFe1VSS/8OBJ/p8iqmBMflRpQGpGTDIyOFn7RlNSFmEM3
	RkuZvQHdhTAGGaKWHHbRK73bD1z63ee9lq5SvCRmq2qAa+dFR9bF06Nqu38MVfc=
X-Google-Smtp-Source: AGHT+IHgLf0y3T2aSAw/8Rd6AEWP7U+nisGUAfd6mVfQ410OHvexB/I4j6zZok9prPeL9Mw/33M7lg==
X-Received: by 2002:a05:6512:34cd:b0:510:1b77:62d8 with SMTP id w13-20020a05651234cd00b005101b7762d8mr361538lfr.23.1706176304681;
        Thu, 25 Jan 2024 01:51:44 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w12-20020ac2598c000000b0051007e2a2e7sm713457lfn.231.2024.01.25.01.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:51:44 -0800 (PST)
Message-ID: <aa2d61d5-ada1-485a-aed8-7cd360adf744@linaro.org>
Date: Thu, 25 Jan 2024 10:51:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] phy: qcom: qmp-pcie: Update PCIe PHY settings for
 SM8550
Content-Language: en-US
To: neil.armstrong@linaro.org, Qiang Yu <quic_qianyu@quicinc.com>,
 agross@kernel.org, andersson@kernel.org, vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_mrana@quicinc.com
References: <1703742157-69840-1-git-send-email-quic_qianyu@quicinc.com>
 <e6b8befb-82e8-4803-929c-32e86d1e825a@linaro.org>
 <0a3f486d-0135-454e-9da6-b888e516a39e@quicinc.com>
 <aa445a92-e640-4f1d-969c-20cafefcf44e@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <aa445a92-e640-4f1d-969c-20cafefcf44e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/25/24 08:53, neil.armstrong@linaro.org wrote:
> On 25/01/2024 03:59, Qiang Yu wrote:
>>
>> On 1/24/2024 4:58 PM, neil.armstrong@linaro.org wrote:
>>> On 28/12/2023 06:42, Qiang Yu wrote:
>>>> Align PCIe0/PCIe1 PHY settings with SM8550 latest PCIe PHY Hardware
>>>> Programming Guide.
>>>>
>>>> Can Guo (1):
>>>>    phy: qcom: qmp-pcie: Update PCIe1 PHY settings for SM8550
>>>>
>>>> Qiang Yu (1):
>>>>    phy: qcom: qmp-pcie: Update PCIe0 PHY settings for SM8550
>>>>
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c             | 20 ++++++++++++++------
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h      |  2 ++
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h   |  2 ++
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h        |  1 +
>>>>   .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h   |  2 ++
>>>>   5 files changed, 21 insertions(+), 6 deletions(-)
>>>>
>>>
>>> - On SM8550-HDK:
>>> # lspci
>>> 0000:00:00.0 PCI bridge: Qualcomm Device 0113
>>> 0000:01:00.0 Network controller: Qualcomm Device 1107 (rev 01)
>>> 0001:00:00.0 PCI bridge: Qualcomm Device 0113
>>> 0001:01:00.0 Non-Volatile memory controller: Phison Electronics Corporation E12 NVMe Controller (rev 01)
>>>
>>>
>>> # lspci -nvv
>>> 0000:00:00.0 0604: 17cb:0113 (prog-if 00 [Normal decode])
>>>         LnkCap:    Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
>>>         LnkSta:    Speed 5GT/s, Width x2
>>> 0001:00:00.0 0604: 17cb:0113 (prog-if 00 [Normal decode])
>>>         LnkCap:    Port #0, Speed 16GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
>>>         LnkSta:    Speed 8GT/s, Width x2
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
>>>
>>> - On SM8550-QRD:
>>> # lspci
>>> 00:00.0 PCI bridge: Qualcomm Device 0113
>>> 01:00.0 Network controller: Qualcomm Device 1107 (rev 01)
>>>
>>> # lspci -nvv
>>>         LnkCap:    Port #0, Speed 8GT/s, Width x2, ASPM L0s L1, Exit Latency L0s <4us, L1 <8us
>>>         LnkSta:    Speed 5GT/s, Width x2
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>>>
>>> Thanks,
>>> Neil
>>
>> Hi Neil,
>>
>> Thanks for testing this patch. I verified on aim300, did not see speed downgrade. Let me have a try on HDK8550.
> 
> I haven't seen speed downgrade either on the HDK8550

I'm guessing the 5 GT/s link goes to the Wi-Fi chip, which may
be negotiating a lower PCIe gen in order to save power.

Konrad

