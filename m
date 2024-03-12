Return-Path: <linux-arm-msm+bounces-13880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB9878BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3BE22818D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 00:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A7EAD58;
	Tue, 12 Mar 2024 00:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jH+2Iac9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C2AD35
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 00:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710201844; cv=none; b=NcxIHfxzJ5yhkQb3GgqIA8T4av+mjBSdxAeqOZqiyqbtZUvdbdhXIyqAH9g0LGr1WklC36xywyQyyI8NC0vfc94MJpEk0bRCo18nnsnz7Yz/CmwaaRERUVZgoxfMyBOiZ7i+b/GR402xEMMlNEAJnh4TGfMG25bc3XpMxb2w+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710201844; c=relaxed/simple;
	bh=GtWzUpROLy03of4DzRBU4Zj6eH43yIsxZ63cj2+uvk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHg1L2x7Fv0IFLXD9lwJkDTRNRpu7WnVTch8ysK0eVnEltH3BSwl/J5W8syjr3EVhS4aU0OLWPtiVpwTSocNeAGfTFVlncaUjTm4qZBt3SIcKpwDuWzcUkiHMH6Jn9sHlZ4v9D78UF8BPwhAhuP61fGyWb2dPkPCtThEyvYB0/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jH+2Iac9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5135486cfccso4565689e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 17:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710201841; x=1710806641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQpqFFicQ5YfomKVXzegGQYmkOjou4tROZ8z6s/Q/bE=;
        b=jH+2Iac9k/rDZ+xgG4jZbQpeTCnJDJB4jJsSVdVz5AeAtzD6pzaGz4cz9IXSrPwrpM
         pU7opKFPH0m5gFm8LebMbVLf/Vtl1jYIWASRUFNlydkzDLry3I+va7l2K1z2NlO49RvX
         rZEI6N8UmxWrO/4CIZ6smHIU1jDpFvI7jPJ1MIl1/c8B6+8k2UYVp9prAMY3Gt6hXQnF
         2TRBiv7uuedsyTAoH9ZaY4Djf/Wf9cyZ5DAkqdGEKwlhLr5Z7dbVNS0I+gVyV96Nuybc
         nyYzHqKmnZxy/blq3zeknbaOtSY0nUB992Ka0mTmk5UY2pSU6FsYaL2T22qe9mltJ/Fq
         yHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710201841; x=1710806641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQpqFFicQ5YfomKVXzegGQYmkOjou4tROZ8z6s/Q/bE=;
        b=ammWUzqvkOzla3uzjDF6TCl3DeQNjPKRBE56EzcOAXJiz5uXE403t90CVS5ogSJ7md
         gwh8KYd0hRSw1v1PdXAE0i7Zl126wIcI5x2xDwShEd2ODRnR24W8HE6qr+QYIPH7Gw0u
         1HiDciTUjIm3WTsqeXaWuv31l2pi7kQnd3iQFDggh4iT4PPTVc3rYd73oeC9NIfKWZa+
         VGZ6fUrx5p4J0pdhhgDLp/C8ic9K6861Alw8X6E3vPCMv2WzxZPoiQBz/RVymPc9uorC
         OMu9TtaIDZ/yq72Uwn/7dt5n7kU7tFZzP+rkcpmymwxASOh/Jla35u1zH95QgBM+9NK/
         8lKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaV+A1JdgqfRwwt7F0x8ePmhtXsRv1dWx70binXB6wCpJU0o2KV27gF5PQ44WnjHbkbM3yj9NsKGMfLb5OSckoLjBw+TsuhS1EJaL3Ig==
X-Gm-Message-State: AOJu0Yzc7cl8SvrGQuheuZae9DpWHj1QyXmUUVoDv77l8xNfT+mBIPgB
	jumC3HuIGGl0ywC9rM4A6iXTU39mes2FAF/7SNTI9kjrnFd4cpjsqcnruT5OMEs=
X-Google-Smtp-Source: AGHT+IH6yRmOXext+BOdsK7e8To7SfioRgtqDEWmkaxrfNU+TvvgE17KOn0grChRMEn/Uu4NSlYjhQ==
X-Received: by 2002:a19:ca17:0:b0:513:3fa6:efe3 with SMTP id a23-20020a19ca17000000b005133fa6efe3mr5254639lfg.8.1710201841082;
        Mon, 11 Mar 2024 17:04:01 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n16-20020ac24910000000b00512ebe62693sm1300360lfi.255.2024.03.11.17.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:04:00 -0700 (PDT)
Message-ID: <e787706d-b5ef-40bd-9fa8-fed784a9d7b7@linaro.org>
Date: Tue, 12 Mar 2024 01:04:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qdu1000-idp: enable USB nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amrit Anand <quic_amrianan@quicinc.com>
References: <20240311120859.18489-1-quic_kbajaj@quicinc.com>
 <20240311120859.18489-3-quic_kbajaj@quicinc.com>
 <CAA8EJpqMWBWAEUCiJXm0x7zjZYbP8SkRDgu+w+goYjB=8JBN0A@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqMWBWAEUCiJXm0x7zjZYbP8SkRDgu+w+goYjB=8JBN0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 13:14, Dmitry Baryshkov wrote:
> On Mon, 11 Mar 2024 at 14:10, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>>
>> Enable both USB controllers and associated hsphy and qmp phy nodes
>> on QDU1000 IDP.
>>
>> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
>> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> index 89b84fb0f70a..126bc71afd90 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> @@ -500,3 +500,27 @@ &tlmm {
>>   &uart7 {
>>          status = "okay";
>>   };
>> +
>> +&usb_1 {
>> +       status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +       dr_mode = "peripheral";
> 
> Are these ports really peripheral-only?
> 
>> +       maximum-speed = "high-speed";

More importantly, are these ports really HS-only?

Konrad

