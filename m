Return-Path: <linux-arm-msm+bounces-9489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8512846A72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C721D1C21259
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 08:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33F342073;
	Fri,  2 Feb 2024 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhjaHTTr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186C47F47
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706861610; cv=none; b=J2dz7s2HAdw4UnE5ezd/0JZgnftm7FIfUdg71j6c7jeUjBXsLrcVpjlT+2Hknfn8p/LYUdjpVAbqg8TRM8rt8e3SgNV/4WCqhwjeX1DqmZFIc6/hDK86upGz620Hcwmq7v2UXCAEx9vA6PGVC9WD7kb21VlwgTbFWFvXr8Ca0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706861610; c=relaxed/simple;
	bh=KSqyD8wFxqc0yy9pvP/WpF5qy+7BoasQAlz83MIgEFM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aIZZY9XthZFrg9NgOCjMNehu3Fs5oaAqS7K5adAg8ieqqHplxk1qcP1WaRN51yXw8YswvCpPD3+e4Wem/io+nQ5bGvmIzgYCsiBY64DKnQ/ycXfFnE921r8LyfHlYPqbKNMJT0Ezf8eYSUkqcLBb5z3+ubWmDpffYgHoHfGz/Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhjaHTTr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51124d43943so2861421e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 00:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706861607; x=1707466407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ggsCfwMJnBPvg51wpVBNnYRzEbc6WGF98qXbqSsoo8=;
        b=vhjaHTTrRv55XOLOwhJ9ehANIc8/geNwHoPaqGGStTFUBTd+KSjEZjQt1FKZePPm6h
         w9ZWFXc1tuu9YBXOrrN+Fu6uvce3sl/XcmaAm9oHfBEQP+HIvgkro/sPKFON/vCrWBYI
         ydaJqTqJn0G/ccQ6gMIJfh8OlvXoqOiX3H2xY54CbRBoVD+2IfvTlJsYFQ9eSticAmoz
         1LUOWWrkiEW0+/WKElOVV2AiZlaSVkvukvZcqFKSx940LZmbjw3oYwOgor4oqGI8cZfA
         p+22F49PV46lE9JeNOVxijWi/FDWnbxQ5AReHZ6l/qTYdUMkkrH5qbESiq0Qqbup2u3C
         KgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706861607; x=1707466407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ggsCfwMJnBPvg51wpVBNnYRzEbc6WGF98qXbqSsoo8=;
        b=NyqHFda/xEEJ/5+c7jcFQe7gN2imyB/k0iskLwB7xR8CDFynHvLjcy4+7U2TbYxLHk
         d1wgf6OwSFhnwe/7LEewXRfkURyLNZXCmrcRMW3ncCFcBezsM5JWu7oPBL873H4oD1O1
         70O4GKYq5BCme6cBQvlYvVbn9mNR888vNq/nuh3K/l7l+lET/uQvZ2LWcyf5fsR2zATZ
         5N3bRcivgcGMYlnC218eXD6bCYVOOmhzJS45xgz8Pjp+nmidIu3arEdpZe1gzxdOYXEo
         bCj9/2vuK0+V1auQ7UUzg26/0XVvt+xPHiaG/rzArYfccgOXltSPcsTrQO7iXOG25hHM
         7rnA==
X-Gm-Message-State: AOJu0YwhT/qwL8vuP/2kgKEkAQ7IoApRz/MqWyFAPWJBnWQpTxNqfiL5
	xot0DsB3XZqyL3VNj7FCyZ9PotfpjY2cZz445O5xP7ReUIHsr1pb0t1KG3Y/LDQ=
X-Google-Smtp-Source: AGHT+IEJZvr5kBd7N/uLExR+nlfQRTw3XzobmgpihI7SxYGEJ7N7Rzp7gcee9AvFMvm88xVUmJnjvQ==
X-Received: by 2002:a19:6554:0:b0:511:33a4:f9ed with SMTP id c20-20020a196554000000b0051133a4f9edmr730537lfj.66.1706861606951;
        Fri, 02 Feb 2024 00:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXmVd6YvaDYmQQ8oB5BhpZPgJvR2HoqkJuxrJAYY99jZ/su1ySz622Zvp3FmKkqKAx6WylUJJUYzhQeb7/31o/noVHuwxRMhkuniEHNbRCaRE+Xz6bKV/6nVhyJsS2eYDPYuQA4h/ZgHmiMGDCn1qZN4kSH2D3ZgmEqGFQ0qOqlw47a/vOWmyUyvI+/a0bmZWW+4yXQc9ir/Q+R9WQXN3cmS1kgcvQKsYugN+fNqcgH21auvOUh9pLzj3zKwbUKGla0IJA99pVQxShv9UJmjsniID3rVJ6iFxjJKNDPrEm/J+BzhrftdE1yERov1hrzyBaR0TcOaVNvVrLLKCMjVF6wX9nNaw==
Received: from ?IPV6:2a01:e0a:982:cbb0:560a:f70f:7627:2c48? ([2a01:e0a:982:cbb0:560a:f70f:7627:2c48])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c228d00b0040fb0c90da6sm6547641wmf.14.2024.02.02.00.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 00:13:26 -0800 (PST)
Message-ID: <a0034c34-4af7-4733-93f7-f82f665f36f3@linaro.org>
Date: Fri, 2 Feb 2024 09:13:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2024 20:20, Konrad Dybcio wrote:
> On 29.01.2024 12:10, Abel Vesa wrote:
>> Add the compatible and the driver data for X1E80100.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 10f2d0bb86be..2a6000e457bc 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>>   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>>   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>>   	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
>> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> 
> I swear I'm not delaying everything related to x1 on purpose..
> 
> But..
> 
> Would a "qcom,pcie-v1.9.0" generic match string be a good idea?

Yes as fallback, this is why I used qcom,pcie-sm8550 as fallback for SM8650.

> 
> Konrad
> 


