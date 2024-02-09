Return-Path: <linux-arm-msm+bounces-10423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA184FFF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 23:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 975D41F287C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89CA376F8;
	Fri,  9 Feb 2024 22:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kUIfnedJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B136AFD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 22:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707517790; cv=none; b=Y0pmc8wfSG82Is5lA5ul6aGBdd6jOoO7En92psuuujugbRg4P3dA1akQsZvCsDxaZLnZpSiVd3pAc51aQ0y1fBK5ki2yajxARJikxlR5Qqvy8qdA2cbTpKAVub05n+eXZtT74qHfO/tiUmBUZLPDxgRerbcrjNyaqPjyfSkppZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707517790; c=relaxed/simple;
	bh=77AKM9Ve+6q+d+ow2obpxujzP6SeZwAB2QDIA/PZYgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3JhyHKlBoE4fN2CpaOIFDdGzn073WtVP+/wg8HXqr7towEJSpwh2unOORw9EG/Ixm8o28+lP/N22HXVcXtm/l30AOKtEdMy99ViFJyhKQrsAVbI4btMNZkPd43ETRmwvJ3GJROY2SuX7Xa6gHhxKzRD5jUNwZ2LFnSef7KUSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kUIfnedJ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3916c1f9b0so200203166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 14:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707517787; x=1708122587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JICOCW+Q2q6QuaF3FQE3t3jJk+O9ohF8KRQA2IMpOs=;
        b=kUIfnedJfL7SjGIJacKEgqHRoTo4/8Ivcx4AQYHHbpLYYvbEuMOPHYSbjRZIPhHqMP
         ZhRuOIwYiBSf1/mnloYvjXtIbrAq0Lm2HopsimjLsXMHCMYfEMtgW0apjaOpkp0nePPJ
         tM3XxWmohmhD9RbRVnikclCfiybny4LYcsHeyjufZSXL9bviI00ZygASrcGgKPqXPbr/
         357foNU+l3Kh/52tfLg0wkWcs+cn3mfYg4kFOhsPErGRozecEHD6pdSKI4s+gFMCT2qO
         Ntc4zS/2veSbzxc1B4/nsk06bEKsgFCv2IRNYcMB+IMsu564GgLiNVmA7khBAozuVyN8
         EhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707517787; x=1708122587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JICOCW+Q2q6QuaF3FQE3t3jJk+O9ohF8KRQA2IMpOs=;
        b=hodrXUHyKy4WAGRtjhHrKcSHYPinjg5AUHVpnxdNjj+VDaivfcFQr0CuKSCzGnONgX
         QNXJHC02vNCvBgwCr6T8st2idG220at3auopCA51HYlc/gllZh5wpLHe660L/omic+GW
         MRGFLUElhMbor7yz3WAUamL6LlWHKUBHM3NvnhitJVVOfeY7nYwwONXxh5J3cVDAXC1F
         s8Cc4BKQRO4GoF/AK939Ft9zFOxIcnRNKYojPZew/eTGxLDdPa4wo9uU4oIAPJN9rxQQ
         9JP/PEy7wF1Tgd1xhbgxNT497QdX4wQg4lgfy2J/ePQp3Vw+Cpep9He1+SsWv0nPflJj
         NxFw==
X-Gm-Message-State: AOJu0YzEuZ+ShTvU58d7WKOH7mUaRq+Yz/QbmHmDj2znh85dK27vDcTY
	U/wdIGArePFCQHML/27UzCLoqXDv1LDcrj0f5xWfhXzLjmOcelTkacl2tb4rkHU=
X-Google-Smtp-Source: AGHT+IEP3zZ0SZ2ILJwXqkdidbCgESUIFxkcRp9BLimNKzo3X8WO4sZfW0ArSmzFX0mkyHKGgGKUbQ==
X-Received: by 2002:a17:906:24d8:b0:a3b:d98b:a3ed with SMTP id f24-20020a17090624d800b00a3bd98ba3edmr259745ejb.23.1707517787106;
        Fri, 09 Feb 2024 14:29:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPZQWbUEY1HdXSDOcglxm5bsts8DdVWXWeJ/YonjauOvr+7vpQoyWSZt2t/KKA+1XlRsAyUQAdsFcwhXBImt4g3Rb1zS4fzF+cAh1UiIv51hnXEHLw7dfSJMnJvlUmgKYfQPhi75OmfXKGxLH5j17RvAKITtpDRNJzWgg2dstBaetzg/BZOZvS55W4aQIlSDZUGhXV2hZci+hmCROeaWsVqBWZvayor74bNfVPzXNpoUE+3/bNpLKQykw9UZEgKKMW10d4m1hC6A3b/SB9VcVZg+d2fgswC5E+LmbU7dQUxZhUg7KC1o+IVLlSxxLjBYX8GPDwUc1h0BBA63+PcySS7p+Jo+itfsmpDE1TedydgP5DKCywOxxSZbBEHvUYBP7o7sQjZt1lPfUAn9LMl7Ha6Wuv04aZlhgGv47bV4lJbZnRpNK4NVeKgmm+wXayRLLZpzjOS+Ssjrrb6kCcAl+OJTJ+o+D6LXPvZ4SRi3+AE9O3hqogjHeeHy/CwHJ1y/bOpYvB0Bcf8+CD+GWNxy/Tz7SuoNpyFJRmJXqolIQM0SjH52GQQNQzgqH4a/wNWP1PoQXEKziQ4LqPcQHjjyZLZHVtan5Y7I3wNTYS681tDA==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id hw13-20020a170907a0cd00b00a3820ec721csm1167406ejc.8.2024.02.09.14.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:29:46 -0800 (PST)
Message-ID: <abb8d55e-20b6-4253-9308-019f19d5efb3@linaro.org>
Date: Fri, 9 Feb 2024 23:29:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: msm8996: set GCC_UFS_ICE_CORE_CLK
 freq directly
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
 <20240209-msm8996-fix-ufs-v1-6-107b52e57420@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240209-msm8996-fix-ufs-v1-6-107b52e57420@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.02.2024 22:50, Dmitry Baryshkov wrote:
> Instead of setting the frequency of the interim UFS_ICE_CORE_CLK_SRC
> clokc, set the freency of the leaf GCC_UFS_ICE_CORE_CLK clock directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Why on earth is the _SRC clock described?

Konrad

