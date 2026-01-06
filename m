Return-Path: <linux-arm-msm+bounces-87733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0DDCFA93E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89F24308B7D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 19:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AEF3570A7;
	Tue,  6 Jan 2026 18:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8aLLcf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xm/VlNCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4A345CAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722674; cv=none; b=CoNN+bL6g5wNChQzj7D79wbAvbmEmahDlDfMdYH4aSxVi7RGfCd6h3cjnJSG8bt5wrqvsr0ZV1Pqd7r7wrkZVtRJe087Q0gXqCacLFTgZ6R1QK2bnqTjaA/YtqAgu8+wcV35LmAXxB1PxIKqUDrcSJYi7wPQA460BXdy8FhYE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722674; c=relaxed/simple;
	bh=7Xx+IDm74UfQJab0hVpqGn/x5xl+7KB5LM6pqt9Pfgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/MmMvyyEmglILSUDlQw8kKjDCXTLYusT+kaQzUec3+DYsNcuMX+4qW0MvLgzkucmJar0+2jA7f53cwKp2jNBdODIfzzy1dEJJqT/92sUgcH4AhPRvDI8hSAZ92ogGO11503kzx7D6h1BZ0D0ukjWX5j/NpEePBGmKAxte6ka4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8aLLcf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xm/VlNCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GivTs959530
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=; b=L8aLLcf7fy9Fv06l
	cgN8+xPqbPeMO53insFnNUq6Vwv7Fi6XjsY35BRtTewuqq9l/WKlI3qeAoMNUTag
	jjV+fSrMZfpwEZ7MFkVYSfTewkZ8aLv/Z5mRhO6fODpGjyoqCTB6tWo674CI9mBi
	pYCi15RPnZZm8oIcRinJbzbU9p9FIcFhSq5yZe1tVHoFNWZc5KZBFaEpXKD6pHrV
	EjQZrdKlUu5P5wDbsYHHBqJXEsQSHGSxFvQuLZ0NpuDGSdhFd5LPSIZY0UVXuU2i
	aJm7TUICnuMrUQlJLCqwB4gouHFyseKGem8t+KY/nruCs3JY5zSgj+2WSa+k5zn1
	0mvt9Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66er81f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:04:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae26a77b76so478772eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722671; x=1768327471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=;
        b=Xm/VlNCQcY09lgkrV/5xVNESEIi9yAoougtow+Wcysv6TW6KVheUfba3dDUqT7CZpH
         3sx3WW7FEJwyYHyMnPqNmwvsYNIUXdpth4k8kkaZcz1hhCn9dFphJyvmlmCF0jq8GIKs
         YZOda6549BaSxjAxUca7uX/soYEKm2gp64vTbi2MoZ3wqlkgHQQe1J44Hsf8IhIiuddN
         AL9j2ZyHkrKgIBpgUYuGjXL2LX6TOH7ZjhwD/0TfbJ5CHgq74IRQCBQCOMFLRkPBgZvZ
         uqHDGK99zwR81UaMar+EO6EP/I0zwxh0ChqXDcrZLLIhY4mVOEXnd0bkvhun8eOQuUy4
         Ujjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722671; x=1768327471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=;
        b=qjn3VMwWO9F5w/DecA7fJp5swAvFaKsGPjIAqJ6WyWmVJoPg+aB461YuagjVonczIk
         J6pusVbl8sQwzU8kRvQWt0P9YHsnl4ExmI6/U3WEvJlM5mk0DzibMnPTuFPDDxJ0kW3l
         WbetUsDz1Z/zfceZrTGjPHY9abIZvptOQ5ZPucGgAsaBCcSjQSTOD7uM480hNjPpR+Rv
         OPJR3dOiGUj1QcScX6LS4LT1XOmBavuOXUk96EktguWTtvW9aRlqmqjHaBLdc7cZGmxy
         c1cwzVkuCdC8GIwhqN8KtiG7CxX/0sy4kDX6p4+3/AVk7TP9VHgH4abdk7GdR/Ys0HpM
         TD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCNe0pQ3OiulPo25f0JGe/G+3ajHYWW3y1rOwcnXH3Rn8/vbZypy9i//+zeWDufiZNZa+dE1DetzzUsyDG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BOAxP7P0RpSS7wLbEGQxEGv2Rp4w2+plrR2FPu1oscaaZVXt
	qsJ58Fkvl18uHS2n/fRdLdTIGr/HPx5PbEGPy1ZonibgbppBwxT5DXB6wewSZewI5HgJHWEYajZ
	kTaK9OXa38GApVlVkzdqpWQglbZEvN7ZagwHQHAOw+ikYik61Lzhzu8HvDzpWDUCvPntR
X-Gm-Gg: AY/fxX4mamlSRaxvp+OFy3z5onOpO8oGxFJFYwh5CPjOKR/LhWrqKu7n0fO/3gpAKiG
	uQQwEg+GJJtv0qGzGeJZOQfmkI5e+1MQGF32etFD2eYTiCvwJlUmvXwXUdb/wuRDhNKmntgs2/8
	SHldxXxQPseJSgyaxpNCSWMz26lrdFLfmO3qzNi1YCLdN4NSkn414eaX5itut8DpydAds2S3s9H
	UhjNWIADJN5+PGY6NBZtFDIIOaXfAQbgzMSmP46wmopqATzfYzFCjm5tgFtCp1ayDqFXdPRHW10
	Wva3DFps0kNUZPeoaj41Y50zRHrMvuHHFeuhW3luCaRkxb2X85IlZj36afSy4G0gc+jN52JKx2f
	0iMacNPjmrfWCNZi5j5CB5kWd7L0L+2hRKsf0NPA18ACn
X-Received: by 2002:a05:7301:1a04:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b16f9293fcmr2664477eec.36.1767722670405;
        Tue, 06 Jan 2026 10:04:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsg6oBHLPeBiWqo2V9wrHF2AafFO/aPeVSn8WYZodXTtdnJzkxJvkIxgi7Yhd/Olvi/BswGg==
X-Received: by 2002:a05:7301:1a04:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b16f9293fcmr2664449eec.36.1767722669798;
        Tue, 06 Jan 2026 10:04:29 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm4044156eec.25.2026.01.06.10.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:04:29 -0800 (PST)
Message-ID: <0a9bfef7-0d9c-4567-a430-81bae7b13aba@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:04:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
 <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
 <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NiBTYWx0ZWRfX9y1JSgtgkvZL
 BRlIF2LoW4pokv6hkCSRO+vs/qqN/bSq8ob0K+ibxGPN8fN7O8QUBLt7g3Qw5oNrLEn3rjvyc+Y
 JQwc5Zg5j15rUmk4cjtEsGvGYbOssUKjfBeiGlk1ajQaqi86lwaOwyFfUnzLdxt6pWGA+vWWf+B
 y0oSWIWKazpg7xFF1v8axQa4vp59IpTrjCdEWNLd2TEqEx4lNm+tOeqLiieWTReuZ/0zq0oILzK
 YPiQZF64VB/0tuh8Ysyhh8eMTDTomD5SYOqdoT4ejSpkUexlX5+E4AhwB0e7GvvYcd/bLQZRVmr
 uxpkfrCXjmwO4gLjK9y+0UyZgpt3RNQehETtHvkBz339xTMaC3qRZ3jT79BZhBcQZPwM5ad2xot
 AamlGFTy0x5aIvpY/r8gp/IY9mg5XgjJk5Z+zxljjx9f4fbyaAmmkBwE14+R3Xzy7lCypWtgyoi
 muYeuyjdfH+58at8u/Q==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d4eaf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4ttYkhS-lo2g2XGx6woA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: l5RCfkzT2ENitUGhNS5ZqafaeCSxxUp4
X-Proofpoint-GUID: l5RCfkzT2ENitUGhNS5ZqafaeCSxxUp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060156


On 12/3/2025 5:31 PM, Vladimir Zapolskiy wrote:
> On 11/27/25 10:10, Krzysztof Kozlowski wrote:
>> On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
>>> Add the compatible string "qcom,sm8750-camss" to support the Camera
>>
>> s/to support the/for the/
>>
>> Bindings do not support hardware.
>>
>>> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>>
>>> The SM8750 platform provides:
>>> - 3 x VFE, 5 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 6 x CSIPHY
>>> - 2 x ICP
>>> - 1 x IPE
>>> - 2 x JPEG DMA & Downscaler
>>> - 2 x JPEG Encoder
>>> - 1 x OFE
>>> - 5 x RT CDM
>>> - 3 x TPG
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 
>>> +++++++++++++++++++++
>>>   1 file changed, 664 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml 
>>> b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
>
> <snip>
>
>>> +
>>> +  vdd-csiphy0-0p88-supply:
>>
>> 88->8, so: vdd-csiphy0-0p8-supply:
>
> I would make a minor correction here, it'd be rather 0p9.
Sure, thanks.
>
>> Same in other places. This is how it is called for every binding.
>>
>>> +    description:
>>> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
>>> +
>>> +  vdd-csiphy0-1p2-supply:
>>> +    description:
>>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>>> +
>>> +  vdd-csiphy1-0p88-supply:
>>> +    description:
>>> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.
>

