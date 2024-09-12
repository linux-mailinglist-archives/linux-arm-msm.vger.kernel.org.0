Return-Path: <linux-arm-msm+bounces-31600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D74976805
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 13:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC7FFB230E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 11:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7878019F40D;
	Thu, 12 Sep 2024 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2PiO1QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBD418A6A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726141289; cv=none; b=Dp3uiMRtmxujWlxcbNwa36ahP3Td689UcJa++P+ERoe7p8JAg17zj3nmfi23CIzEtLP/1zYDE0p0tsSHUjno9fRZvgLpwDCTY+DPLbNIiQsJkeWXFp7FmUTX/TInKS0GcOeliq4kLXNy7r9+DOtz3EWwegy9UrPqnAnlIVIfADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726141289; c=relaxed/simple;
	bh=Heof43DyvfqRJlRi0bBeyPYxJf13DtSSsWQ+FAooBOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leEXAxNx7A/KheZTcADZBJ7VLf/9S3GJFmUAAPAOI5OVJJczazb8sE1wlWxgmVIUs/SrCEi/LaOYzu19zf/17lompcbNJGK6lo1CdiRSMckkYX/AeDMCa4f3njANiCuqKZMpcD7flzQJxm7zvs2hKjBG3IeaWxetWFPFdLY/v30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2PiO1QY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3c30e663fso994443a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726141286; x=1726746086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzc1SB9FR1O0Hrrsa6BC4Sqb7TXAInj7HgbZ9sPm2/s=;
        b=c2PiO1QYeAB6e+2rWgvYegE4mql9jjepoLT8xkXpkTHe+mqD1bnVT42vtPN3u8cnVf
         iPKmDyY3NdYm9rvL3SyDj/4H/TQB//fteLoXsRxg9YS9s73dVTy2mpTEcuYNpABZpbHn
         jfXyIWmi+MBX5NkuoNro8/cEdw8uAKzeyituls1+ggbnxKFyNyqgPPu42vnKLM97XouD
         pZp0nsG0sGl4hGwb/8qnApcTBsbgb/z00HdaqQf5ew60j3X8PFEWCzIEiEGJ1MRsoDDT
         ZYFERopwb2aj2zuusC9Nw2QZKTKUmog3pkR8CjWMiFdxCh+8Pb4SOwmh6xafEEcKsOBN
         MQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726141286; x=1726746086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzc1SB9FR1O0Hrrsa6BC4Sqb7TXAInj7HgbZ9sPm2/s=;
        b=h/GTrmIiQlFwjXK/Fp4cozq5VWDBjMhFCiG1yuQaZePfjNKxJB+CYXwKXeADO3RRG/
         cx7tc99WpvgrH7RXFA+Vnvc3sfi/bFSGUKicnRmpEnyueCOJl/U+1zRj5Ta/CVa2BOlv
         xFSDHkUCCM09mk6tEDUuQVHe/VkOrwaUaQaYqTrvVEdKxLbZ8m3H4OQBhxYtajRnZ82F
         1XGmrJRHcxmhAT3C+S6/NJWOot+oQTAl9yCulQQ97ytEZ4/8/Pm5t46Co2+dUKFZdexv
         ZKbausaQtYGGH4gNJqmr47113gxYrkqyMTGqxW+WRwGDqmVYbF5QRTMfzbXGOiEyCh6o
         TFEg==
X-Gm-Message-State: AOJu0Yw45drJG/eMw6pwRL2f9VSls8Klz1J51SsQthTwjpZ9bnznHrnY
	u9QWMfZWiOegKAs3Fmw6e0rpsH2i9o1VvnFV/go1ivE27Gu8la/bnFRUuo0W6qcFEz3huILBXk2
	R
X-Google-Smtp-Source: AGHT+IF2wx3/sCQSoXraGqXOBRLBye6JAmeptMCNWTKtJqhL/MIXqZonIUqoAEP5C6ftg/j1PBtCNw==
X-Received: by 2002:a17:907:e6e8:b0:a86:7ddf:2909 with SMTP id a640c23a62f3a-a90294fcf3bmr253511866b.14.1726141285775;
        Thu, 12 Sep 2024 04:41:25 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ce9ed6sm729090166b.165.2024.09.12.04.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 04:41:25 -0700 (PDT)
Message-ID: <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
Date: Thu, 12 Sep 2024 12:41:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/09/2024 09:22, Vladimir Zapolskiy wrote:
>> +
>> +  vdda-phy-supply:
>> +    description:
>> +      Phandle to a regulator supply to PHY core block.
>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>> +
> 
> Here the supplies should be split into ones, which are specific to CSI 
> blocks,
> and I believe they shall be set as optional.

In principle I agree with that, each CSIPHY should have its own vdda-phy 
and vdda-pll regulator specified.

In practice though I don't believe its necessary, below.

> The proposed names are:
> 
> vdda-phy-01-supply
> vdda-pll-01-supply
> vdda-phy-23-supply
> vdda-pll-23-supply
> vdda-phy-46-supply
> vdda-pll-46-supply
> vdda-phy-57-supply
> vdda-pll-57-supply

In principle, you're right, we need to expand the name set here.

> I understand that what I ask is much more clumsy, and it could be seen 
> even as
> unneeded, however it'll be the right set of properties to describe the 
> CAMSS IP
> in this respect
I think the following naming would be better as it matches the 
power-grid naming in the docs.

csiphyX-vdda-phy-supply
csiphyX-vdda-pll-supply

=>

// voltage domain = vdd_a_csi_01_09 = regulator l1e
csiphy0-vdda-phy-supply = <&vreg_l1e_0p9>;

// voltage domain = vdd_a_csi_01_1p2 = regulator l3e
csiphy0-vdda-pll-supply = <&vreg_l3e_1p2>;

//
csiphy1-vdda-phy-supply = <&vreg_l1e_0p9>;
csiphy1-vdda-pll-supply = <&vreg_l3e_1p2>;

Where X indicates the CSIPHY number.

So in fact, in practice we don't need to differentiate these entries.

Checking x1e80100 ...

csiphy0

vdda-phy-supply = <&vreg_l2c_0p9>;
vdda-pll-supply = <&vreg_l1c_1p2>;

This is also the case for csiphy 1/2/4

So, I _don't_ believe this is work we need to do, since its the same 
regulator for each PHY.

---
bod

