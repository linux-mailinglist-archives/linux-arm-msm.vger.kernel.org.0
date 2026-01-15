Return-Path: <linux-arm-msm+bounces-89243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF5D25D31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26AE63014D8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F553B9619;
	Thu, 15 Jan 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MW5wCJMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jI+v3Hwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82451274B43
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495676; cv=none; b=pILjUKS76/sGGs/8XhUABFQZIve2S3pr8PlMPXykuuN9HztShwPf6PBuMlYNBqtFn9ZDFY8k4XDK7hYCba1E3QqC2LT8DsIgxv7gU2ZTUczRAyt6Ij8X66y0izMK8xzCLYMrrgerHbogaYVK8zc9WxbunloRdDIXOpZDRR8iOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495676; c=relaxed/simple;
	bh=z24WUc0jYCzQOE+TVJ4vo/G5+OolGfVcz8M0wSFZylk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4T+zFmLRxSOnEFCF+uv61aRlL+UlSPhHbRgPqNG77WxSIibIbK77+n2IcIVKAXGT0XEZy2LxQvXYz/ZeT8+rQi5xGiAmyvyfGlDwArIeM4yMzdPIuxHPT/5fAOqttiqYzaNZuPbL0txzuQXZGH/nyYWtwqx5AiFlk4tHdhJNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MW5wCJMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jI+v3Hwe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDYU347760
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIh92U7M/S1GB+0A7xQvN1tSDO8g/vT6x8OLZtOVgs0=; b=MW5wCJMOJlZN8w2R
	/DbX7/BOJp+S+2rUiZS2C1j4kBxqV0Hk+xZ12eIMDFQrmMqES14u1YHkBJOJXOaz
	NEiwauX2Oy084w1/qZE55KBZmVr3eaKdXoL5NpmazZAW8dDpHXpV320eevvbyE6U
	veEYvviyLBR69bsb/OmDLgFUXe52FRM42mxW1KZlmmx269Ger9nFwgcGvOa4CXjK
	sfCV32Z19yJ3zko4e/XNfiduTlzAKadrsRgSw7OQFCGrYgy84crbUVtp/F2lYfSa
	q9mPXy1IwKn/HaTJVlm4j9uqL8ysdPwpCpdkrl7Ox2zvQ69bYcsJvv7gWylXtzZa
	Tp5WpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07s00f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 16:47:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so1508282a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768495674; x=1769100474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pIh92U7M/S1GB+0A7xQvN1tSDO8g/vT6x8OLZtOVgs0=;
        b=jI+v3HweFwhGvR8mySG4IYw5ZJ7qTUwsl/s+c7UYjaduVMfATALqKfusgQBx3ZRvV0
         Fl3TaJrTlgv5VgOURkXaYAUAgpM7pZaBXavRBhhMEWVBu8WHo92cXwlMaSy7EaHW1oQr
         3tPysrYbZEKAa0dQchMZCnU444g+U1DuiPiyBFp6+7gXNHbPI3YKR2h1lYqmcsN6KFkx
         RVTWoTYssunz8fqLfo4EWXjugg5WHQqk/fa510puNccjgulQgqBmeGT9jzenGf1BOQMs
         UtLG00J7aUJNanvtrX0vOYCWcGReJu+Eyv5YTgM0RW/XXDAU1IKI8qO1pS+xeCAyuZ/M
         r+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495674; x=1769100474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIh92U7M/S1GB+0A7xQvN1tSDO8g/vT6x8OLZtOVgs0=;
        b=tzsj+G2gI5O0pgGilOoblvET1JvzEATyJuh/7EUcta8KT8rlb8ybfYcXvPfp1ymo07
         96WL2BxrT1we9fEzxosQK52yDMuw0Vf4dLRpBh10S1QpvUnKJn6xko9eOjSrtH6+otvL
         JujnMsKS2nq+Jsk7OdqZ2LE2n/KOsW82jWBL8ywyGPBisjafCzDJNDPWrd7tBn2+raDA
         m8OrdLEN7YD5uJLTxhNWgtklMKgTP4U86fnFGEPu+IArCRf/Jr9JW/Tl5wbmPRtyOAP6
         5j5mo8I8AWhsPM2tPLVAoEbYUr1J+z3tD8RCOFpxyoeVGgH1VufAo4QQ0xzlATkLEDwk
         YuDw==
X-Forwarded-Encrypted: i=1; AJvYcCX9BX+7dfAcIePqm1LkgsgPowjli6EdNlE7zfGX2ovXos/Vgiuui5YKEIhkexlTDk/Kq43K4yV86IlcAGIs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkf27OlOPuuvnZwv7lMkPnGzkm6c+YSTcrbSEoVbJ7kPZMlNSp
	lyJ8jU5hX5PAri8j6IjES/eyBpVJkGHsBDl2ACYsT8ICaev25XGfBOTOEZMkXIJW+6mTzuYES5I
	YP4kfyni4q8HiYbqE15fFFgjZg0dQSuTX/nhVKnz8GPb1w/RKBPYrCjPbwpQ5+R03ajWS
X-Gm-Gg: AY/fxX7c6XLl1jVDNWVQhH4eC9TZYlEPClm4Ob356VVCYDkyKk/+u5I7x+2WblbK8mq
	TEkgRzqnsj1dCJGJ259RQsE4KVmjS16/SbLDgY3ni33Mz0RhBo58fxSrJY4V1YrXUGDpdNwndzJ
	Yr0AN4u8FC/GuIPNUWI4i3AtL0d6Z5v23JSRXiF4QNNfFjleN1CfZBPzO4WysE1fSsWsglubMdi
	Fq5dZJrJzCIoOGF4V+WAdTUa2gnWMKzSC3z8oFs6cyV9sjKUCyw1g25nzdOqS912Xy+ITiAYNTY
	V9SNi3cE2KkXyAlsw/EgyAiKt0sbmx4GLCTK8XAaosYSSFkIYoNJ/vZMuoUQ/n132ikRsf2pdbe
	tESiFpNX4es5V45PQaAgHv746UoI8hUWTu9mD
X-Received: by 2002:a17:90b:2752:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-35272ce8101mr69637a91.18.1768495674089;
        Thu, 15 Jan 2026 08:47:54 -0800 (PST)
X-Received: by 2002:a17:90b:2752:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-35272ce8101mr69597a91.18.1768495673590;
        Thu, 15 Jan 2026 08:47:53 -0800 (PST)
Received: from [192.168.0.195] ([49.204.29.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35267809f4esm2478056a91.9.2026.01.15.08.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 08:47:53 -0800 (PST)
Message-ID: <c3330f11-a6af-4734-a927-1aa468c774fa@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 22:17:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: defconfig: Enable Kaanapali clock
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-10-a6cc9e45de93@oss.qualcomm.com>
 <mq52brcwos2tzuvwkqsjkii6ldukmpxhauvs4jrgmmwnivn3ex@ar6j7fprdf6k>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <mq52brcwos2tzuvwkqsjkii6ldukmpxhauvs4jrgmmwnivn3ex@ar6j7fprdf6k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cbYRZ8KuJfjsn3aAhbW0LqfwVwgAtRrm
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=69691a3a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sDpHl6b8cZmcZdfeLADyyQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6D_Clf746HxYCvX74c8A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cbYRZ8KuJfjsn3aAhbW0LqfwVwgAtRrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyOCBTYWx0ZWRfX26+l1f5kwAWd
 IOliP798hqD4TPmxmxM6ud8zJS0seoclFnpH/ZOt5wKIOm1WwVYTrIEIWeiJaIiaKKGNff7U7Bu
 jaXom00E8PW56TozG+iDa0gAYXLEvXuPV3N70mHWvzx8f6C4xWqcLDaURpE8kSqQZGgqhXiINiH
 PT8UPsC3wT3slcWleAbV6jemk/62WQucrihvuG2lq+SQfUFww7m5Kya8sFlJaI9aZiY18dXjXcD
 M5ZsQFlOvgbSHruqO/jah0ptXjRgDdt5IZIMk7e6czcN6YKgn5C/TkzbCZTRnZoKZvIKiFD5p6m
 cKk9AmeEALLupFV8RS6lndgu7A0GnpkPp51TMefl7FFfBp3zyppYFBykAQEhTVQgk1Jxlc9Ff1s
 W6EWLToTHS37tg1AcppPZ7ZxLSdDPbBUGqbPKLNJEVzT+rSm6Dws5ycvJ4bbeT247yUmxXMlJWW
 38Q/Aor8zNoNsu7m3jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150128



On 1/15/2026 12:50 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 14, 2026 at 10:49:12PM -0800, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> Enable the Kaanapali display, video, camera and gpu clock controller
>> for their respective functionalities on the Qualcomm Kaanapali platform.
> 
> On which board?

Will update the board details in the next patch.

>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index c43dcadabec4..84e9d5785de6 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1452,8 +1452,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
>>  CONFIG_COMMON_CLK_MT8192_VDECSYS=y
>>  CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>>  CONFIG_COMMON_CLK_QCOM=y
>> +CONFIG_CLK_KAANAPALI_CAMCC=m
>> +CONFIG_CLK_KAANAPALI_DISPCC=m
>>  CONFIG_CLK_KAANAPALI_GCC=y
>> +CONFIG_CLK_KAANAPALI_GPUCC=m
>>  CONFIG_CLK_KAANAPALI_TCSRCC=m
>> +CONFIG_CLK_KAANAPALI_VIDEOCC=m
>>  CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das


