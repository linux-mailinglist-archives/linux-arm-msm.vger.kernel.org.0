Return-Path: <linux-arm-msm+bounces-60782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2AAD3786
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB379E07AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C3D2949FA;
	Tue, 10 Jun 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+oaCdpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8E2951C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559553; cv=none; b=CYwTjpzC1h6xQtP2iBThfrFyRv3o/oMiwM47PkBlTC5b6T2QobYpwrW/CjdqSXkV452RZCNAwBRJBNX9pp3Wfa9c+t4kBJ5ZKjxtTZbiMQVFAijYxBQSpXbMFVMeisG19SAM25Opsg3ydJSyiWcxp2c8CMo1/MLFRTvN0HVHzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559553; c=relaxed/simple;
	bh=ECwOYI5b2VaA7h0aRDFK8MLU8vsXKHpJZ5sCzn6LJmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJWl6G/cAQ2vxC2ocs2TVnwBzsY8VSgV2Fh56qT5oryDIJebpFM87e39K0cTWgrMBTcZUYMGzphoYoRaAiNWSaoJ1+v6cRTblcxVPMhndQOKueqAX19o6jpXrO3aqFsP6rozvThVn6+JBhS6hxeMq37sqSRNf7qT1wmGz615mNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+oaCdpV; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32a607e7130so2481871fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559548; x=1750164348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqL5XJg3suH9NDZDnjmeajU5avldpvnV7zhk3Tu6UWI=;
        b=f+oaCdpVe/nybhYtBNi9ZZmKu2jVUN+T+gwgtgyHGxJAxcXGuRFGj2pyCOyyrEG9qB
         p5sRe6YJwjhEqMudHfpe1QLOeXdiB34qp/Ln1wjwyOfYghlC0pAFqJLZ8YKlKQu5/n3k
         oNA90HgPrnEbnCy07H7kw4KrXqCsskCL0+YdfXc6zzD84CcsHFQmbFgeC5uTIqESzTZp
         /Zx10HtTWymBLap06vloJ5+HnQssNAXu0cbVlO/F47VJj5nVdM3IPeT3/JRA1++x8VEn
         WrHwftbDEpBGeWZNzPhPxLAErIhDslanRk06/J1ClDRA/tbo9sicr2EwCWNaTAKsx0HJ
         UsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559548; x=1750164348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqL5XJg3suH9NDZDnjmeajU5avldpvnV7zhk3Tu6UWI=;
        b=J7Q5OlgWx5as8Nqq6wxJq0y2OKfhUBeXFq2gCIdSl9tEcyd5BwcHCs22eRAD/fzYF5
         KcLyQ8uhbIKc3WmqrGV4ApKVOUc0KeQS894VDQhKfxi9Id1gJh6n3e1yZggTBeO6WfJF
         Qc8x7XqtFSn9aaedDlsUA63AkLS1EnrqWA1GW8VAhBZPPyns4k5pQjKABx9noDLb9dgC
         ThI9Ii5IuQAvOy6OMHguiDAnvL8HX50Q6EQokNwMrx0X19UfU5UPZAvxFSHD3cRraKLT
         nzeYkf7+PvDSZ9wg+mM25CBEoy73huzM5/5JLSwKzOe1imCafB0LmQLekc/VM4ip7gew
         Zhnw==
X-Forwarded-Encrypted: i=1; AJvYcCWQThxPaf8fbZ4mgprYSF+LZdvSWI0twuGdHVmFtjlS0vtXU3iQAZIgeFF0+f0Pjdmsym4bL/w1G96sVM5J@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3oTxdLSYtkCLHYKmWysqhA4obT3OUOydFl6pZIdDPLIB3g61m
	i5NtzW7Db4VMD0jLC+hYwPAxQtNyFyeQVRqLxUTWYrgY5sRrf0aK7OBL4TKRxz4Jyls=
X-Gm-Gg: ASbGnctBcfTm55sYtQt30UGfhqgxw+kDFENcFH+Sho3R/USMHZi7RpUvmSudl54EyBr
	RmI7F6egkcxaHRBNk6ouuYeDFq1k/OBQ2iPTTBzLuJIisrTe9llpK/3MWbvUU9I98sYHCuXBIZJ
	khU6bNyV1hLdn676Od31t5V+y4y2D3lNvMf0bXOsrFvNUiQWoGXzGsMfOXZr3gLY7T1NA6hRUqB
	qrViIE1XlPS3wRK5xSOX8hoXcycCRHOvYZ5HnP/BTgBhYu7GYU7CdtWLxXL/ccHwF3U+grhMIP+
	Ot3ePkjTxA903IDDVt6C7FHUjz/lCAsxmprAmbT7PB2xc+9iYZMDw6XXXkF0tdYIGPaWkFko3GM
	qVgR2fUr9hp7oZ62rtc6cfircZj0LUDzBklXGkAJQ
X-Google-Smtp-Source: AGHT+IHC9YB6oACnOWDNzo0PuZcLT6T2Ygjbu5Xg/VoumKply1Dlzi216VGH9WxR8L+CkelN5PDO1A==
X-Received: by 2002:a05:651c:221f:b0:32a:8ac3:93fc with SMTP id 38308e7fff4ca-32ae3243c47mr13618631fa.4.1749559547806;
        Tue, 10 Jun 2025 05:45:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cb82sm15393731fa.16.2025.06.10.05.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:45:47 -0700 (PDT)
Message-ID: <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
Date: Tue, 10 Jun 2025 15:45:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 14:14, Bryan O'Donoghue wrote:
> On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
>> Sort the entries of interconnect and interconnect-names lists in
>> alphabetical order.
>>
>> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
>>
>>    .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index c101e42f22ac..7d4e6ef57bf8 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -100,8 +100,8 @@ properties:
>>        items:
>>          - const: ahb
>>          - const: hf_mnoc
>> -      - const: sf_mnoc
>>          - const: sf_icp_mnoc
>> +      - const: sf_mnoc
>>    
>>      iommus:
>>        maxItems: 8
>> @@ -321,15 +321,15 @@ examples:
>>                                 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>                                <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>>                                 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> -                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> -                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>                                <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>>                                 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>    
>>                interconnect-names = "ahb",
>>                                     "hf_mnoc",
>> -                                 "sf_mnoc",
>> -                                 "sf_icp_mnoc";
>> +                                 "sf_icp_mnoc",
>> +                                 "sf_mnoc";
>>    
>>                iommus = <&apps_smmu 0x800 0x60>,
>>                         <&apps_smmu 0x860 0x60>,
> 
> How is this a Fixes: ?

I call it the fix to the dt-bindings documentation, then what is this
change, if it's not a fix?..

Anyway, if there is a strong disagreement about if it's a fix or not,
the Fixes tag can be dropped from the change, since it's so secondary.

--
Best wishes,
Vladimir

