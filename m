Return-Path: <linux-arm-msm+bounces-17020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DA89F16E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B442E1F250E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 11:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604A915B0FF;
	Wed, 10 Apr 2024 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGi2OweF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D515B0F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749833; cv=none; b=LD7Kpbg2nu+QGR1Ue5r5kdmTY5/88XeWg2M/995yj8v+ueVX2Mqqx1fsQLLRpW1qaqrMD1dLo0O4F7QIkYOTIetij8eqJpqdTf4W+GcEUy1VBLIR+DRSLp4GvP2jw4IRtCzf9f1oTMS8k/B6B9zq8qM+hJOKsYUpZczYtFfzfks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749833; c=relaxed/simple;
	bh=Bk/2GDxBgBKZaokHcOMTz49eyI+1QVoNozIXUpW4/VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tY715hOK7WodU6WdUZzq8uIF5h7awL5ihqmCP5Yzxby9CuQlaoxKEeLNZ8H4OKMFSZKTamzIHKQbUkN44StHGZLRXoSaNicrFC+J1zWinB7scaai+k1AUJCDwOL5kjd2N88VoaNoq7tjfgVMNfcPac2NQBWsbQmXAcJ4P1miJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGi2OweF; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d094bc2244so70783201fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712749829; x=1713354629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AHVovJjaRrYuJwPpCH1ehDBd4Vwot0WGnmrkIqnd/o=;
        b=lGi2OweF2dH7yt9e+SHcm31mGPkw22hWHWqjb0ZP4vd39Xj1A+ESeos95h81KSt+MD
         MoxiSE7U0Jg7cuabG86qScKHA8Ust52gDji2mM3xeGh8sMYwLXKjQhKzmvF67vm9yAbz
         Zlv98QRCI2scWtJmU85qxvbRinFs3JuahNy9Q72BOtuwoy5VpRF4XjifD+pfAY2gf2Bz
         ebWD8bAbli1P0IQtgHKON6q/ZUVDDSOVPkQZ1MncXVGZCkQhLLOJEBab3/vimT+OTwgc
         jGF3O7uuLsrgBA15HBOWAGik8yCedfIsinmFyFTtSz7qvCmRo5frHRY40xZfNwIQmceC
         RROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749829; x=1713354629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AHVovJjaRrYuJwPpCH1ehDBd4Vwot0WGnmrkIqnd/o=;
        b=m0PpvkxRgRQMVbZoRhBZ6dcNFry+ZMgdp6y7SbEPFuDnmGH7OV4BD64qUyewRCQgFn
         WROaRFjfEL/QRcKF5CqCRP7UGyFm0RvWk8tUcSKp7BxzFhycHdiA12rzrtqEiSoQI/RH
         LFp2WY4BfTLw/WrHw2OSSXatpeReuKGyifOJg+AHcjC6nypX6FQkauOOw/nfi0NRK/Ba
         Aei+cF1Pti+BCb3Reivpo/6Zige5vcZCuhI8YjjSaA0yeiVgcznqlsAZ2s99YVaMKh4V
         jPbn+fJwh/V5M7hrLIXcqq7lb0wtH8MYiqxg/QtDD+Rs8Mp4JDdk1td/X7raIuR8VzvM
         v1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWVqiW0SjgmSlVBvWwkxfdaMcgurBKfDGzHDYIdv1vxvyvggvIt7VfNOUNSz9oHX4chLMlDF6U2bqFzoEWyTZcVZcIlsNA9lhh0QVzEcA==
X-Gm-Message-State: AOJu0Yyvmk0SY+4Q3ID66bQaVH4f03KhRgFpPRbAMOazPZVfoUTiMWlZ
	DpHjBMJ5tp+mQ4Y6QsA2+KDsEOaFKBj02ZBoePHCvk30whv/2RksCjCM5koq6gY=
X-Google-Smtp-Source: AGHT+IEvZt4fpCQvn84d60RRfmCkGOF/8hWNSU6M08yMMsd4ImingIW/9UKEH3GBojO8JqkAxMB5tA==
X-Received: by 2002:a2e:904e:0:b0:2d8:4af7:1235 with SMTP id n14-20020a2e904e000000b002d84af71235mr1342410ljg.44.1712749829600;
        Wed, 10 Apr 2024 04:50:29 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u34-20020a05651c142200b002d86678e0b0sm1741662lje.109.2024.04.10.04.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:50:29 -0700 (PDT)
Message-ID: <dca1e891-cfde-4e95-864e-419934d385e5@linaro.org>
Date: Wed, 10 Apr 2024 13:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] PCI: qcom: Add support for IPQ9574
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20240409190833.3485824-1-mr.nuke.me@gmail.com>
 <20240409190833.3485824-5-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409190833.3485824-5-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/9/24 21:08, Alexandru Gagniuc wrote:
> Add support for the PCIe on IPQ9574. The main difference from ipq6018
> is that the "iface" clock is not necessarry. Add a special case in
> qcom_pcie_get_resources_2_9_0() to handle this.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 14772edcf0d3..10560d6d6336 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1101,15 +1101,19 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>   	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>   	struct dw_pcie *pci = pcie->pci;
>   	struct device *dev = pci->dev;
> -	int ret;
> +	int ret, num_clks = ARRAY_SIZE(res->clks) - 1;
>   
> -	res->clks[0].id = "iface";
> +	res->clks[0].id = "rchng";
>   	res->clks[1].id = "axi_m";
>   	res->clks[2].id = "axi_s";
>   	res->clks[3].id = "axi_bridge";
> -	res->clks[4].id = "rchng";
>   
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +	if (!of_device_is_compatible(dev->of_node, "qcom,pcie-ipq9574")) {
> +		res->clks[4].id = "iface";
> +		num_clks++;

Or use devm_clk_bulk_get_optional and rely on the bindings to sanity-check.

Mani, thoughts?

Konrad

