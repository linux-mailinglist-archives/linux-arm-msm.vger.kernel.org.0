Return-Path: <linux-arm-msm+bounces-84677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7ECAD349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 440D23061EB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81B4311C30;
	Mon,  8 Dec 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BN/V7dPq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjm6pa9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767431A3178
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765198474; cv=none; b=Chj8mnS3xWwqOZ1sM55sm/xLKVyfNm70hZFPv3v2u8sDy7T/ROOCQ8rfUXFDhCV/k9oLV8O2f+pL1Ulpc4YSx4injTDVQ8tElwM0bIfHFcsBm5KZL45oS9/Azt1XU0ReSnxnS1HOPrcBQvnuOF0hC+s0PjkUK+FVP/uQ0+xMRfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765198474; c=relaxed/simple;
	bh=/Sp5/ezr/jzNevVrEIBiDL1TzMgf9rJ4FcX2YNgjUXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQoJ/FerlBc0cSOTIbeMpGK7ZK2KsXh/XuaWOu8cJ8n6qnuxvg3v3LmbDUKTdBO5MJcMJeo28qtSYA2B8XimPaGBq1CQYZVH7koL0WPKVqMmHC5R4OvFOjzx2jXvsHdv5FvxpZ3bJ/OWgy4CIt0TMAS+W5uvaafYdhgp8rWaWLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BN/V7dPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjm6pa9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88acIC096385
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 12:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DynSpd4KFfYO1sk2F294Gqbq8wFKDDPMSoUlpXNI9s0=; b=BN/V7dPqmQC9jA2l
	IRTU196kIEPTxOZc9KjsiqFibOPwrZAx8CNrO4ucRh8CDCZNPrTcrStK9gP6MQWQ
	q/LUj384d5sSVNXeGIp4AJpfvryvRpF6ObGHzcjcZLGCU5rjeNbi34aOWOaSXrkB
	ChTu7EmLKz6Y9DrBWBeQQisFoE99fCJsmPX8yrdYTe86FSgWJKZfEm/4Oe1u6Lvh
	B/shU+iKu3faxk97qwkg5En1XJeYI/l0wTmYFf+4q9eQpIzZLldggwlpwDqTx4Ol
	RHOQAc/YBkW8B2NYs1AA/DtondkrwadudTB+eIJjfThOqsOqesWNW7dnLIno46st
	YWjCYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafrqnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 12:54:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882416e9d9fso9681946d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 04:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765198470; x=1765803270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DynSpd4KFfYO1sk2F294Gqbq8wFKDDPMSoUlpXNI9s0=;
        b=Hjm6pa9gtd62yrxEQiBzRlitMqilJY5wb06EbGp8w1WuyHaYO3eFgK5hKqCd6kMsx+
         8PhNp3laXErcQRbl6znkODe8tRIFjMXxNfB5tbapGEmGiA5OcFTba33PecGLpI4wBgNA
         ggqDMDyMYp8aNpkvFIR1t4YbQcQGLIm/jT7lUk8h9Mrg2L2f4TuYBto+w9voReGBWqG5
         AN+XFh6hebi25xW+paEonQiL794fLtR+5cpYpM1oHrdrrKvRNJFgzUj/Ed+12nBqCy8F
         bP8tBEMdm+Hn06BFcTt2Surx33feU6FtTo86DJkvreq2lAiPOBaT7SCWkJh3HTSEYYV/
         Yvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765198470; x=1765803270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DynSpd4KFfYO1sk2F294Gqbq8wFKDDPMSoUlpXNI9s0=;
        b=mo1PSKGm5LpkduGR5dgebMIDYIZ/FfhVrBN42B14jPWWjJRHMGm096qHa4HMeNYdwt
         XcANCDJaHH0xyoAHcIS6ldxFmhqul0cQkvESevhLyDRUD/S8a13QnvWczF/BvUkc6aLM
         oT6XbjieCf4pDUU7F1Nh0MpfwOhU9AjYVi1pM8v5QewC+Wj7Ehpz64HtA0V69T6FuSMB
         CaxVYEJcJxS0fLEfVSho2aCwXuzctpBDbbis+zWL5fK5gtKGxcrhjfUDMcDdBg+Di0D5
         OW38hN7LurSQZCbQB1HefUMbUDive30NlGXSPQjtuWDoIqAnXJssRY7ypXaAyXRNBtgt
         gNzA==
X-Gm-Message-State: AOJu0YxnOPnZLoAWDOAkSPewXGtjthCucMORKnWolDjFraJP7h6diLpI
	9rhBwCnAyjV8py/rAWJDhTPLd7ULq850CHFjJ7PqbnzlMMIzXN2WUJlS6naSgjNSc5ihzKJVLhU
	AJyZFoES7PJbFQMA/Gi6K8nmqRq+DSUQOHDsfFEu7AxuYogVzicfZKnR+7mw9KQnqWokU
X-Gm-Gg: ASbGncutXxXBpuL9uGf2KfMNoNs0xkRpNyZctQ59RBXkxzHzho2IXdnx1bgt+qD6rGu
	HHlS74m9aX1zjbL0/6rkCnzeV6fOJn4sOWi+3arQyK3z7FYSHiabhtavoXz+p7//9TfIF9Y+NAp
	HWnFKGJwFWr0nzfJiQsX9j2wVB3A6Ou/hbxCgoKKEoB8KRsUxC+iq5XSf98cbRAYnAZzqcTnBjZ
	Vu3HPiHhT1I+WbvFV54k/sEJRiIKA7m/jOlDPX4UsWa2URNu1Pc6UYyI4xJOFHpFWLXVMqu2IWj
	nJJpZnTHHr6m+2JR9eATn9QKbToGY2dntVwxf59OZG+0lXgD1fD6NjTYLv5G8bYbZTawW84q93I
	XJc6Z1rS8tMsHQevxDZ/ylivU0r4aLHo/Yw/WqcHB3M41PMF8ty3TUIO4OgvDUR7Lkw==
X-Received: by 2002:a05:622a:1105:b0:4f0:2b7e:c5c3 with SMTP id d75a77b69052e-4f03fc876a7mr89445621cf.0.1765198470544;
        Mon, 08 Dec 2025 04:54:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0gW5HREx87/vjahlRMbtYsg+iw5KQvZGmCzt+n533CjTg5/76ejBvrrzJ+IipzoGePsVXmA==
X-Received: by 2002:a05:622a:1105:b0:4f0:2b7e:c5c3 with SMTP id d75a77b69052e-4f03fc876a7mr89445281cf.0.1765198470018;
        Mon, 08 Dec 2025 04:54:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2edf72asm10759405a12.11.2025.12.08.04.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 04:54:29 -0800 (PST)
Message-ID: <65efffcc-195d-41c9-953c-e3f6c0b0ed5d@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:54:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add
 squelch detect param update
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-3-krishna.kurapati@oss.qualcomm.com>
 <755b7579-757f-4ced-b3c4-39c20e6b25a7@oss.qualcomm.com>
 <b772d61e-ba75-4f45-946d-211a0bb755d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b772d61e-ba75-4f45-946d-211a0bb755d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=6936ca87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=805bfMFN-6O86olI7_EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MfSI1HzUentl7Njig3zOG0XfoiCcgJCG
X-Proofpoint-GUID: MfSI1HzUentl7Njig3zOG0XfoiCcgJCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDEwOSBTYWx0ZWRfX9mWOXp88Hx99
 fUcwnCos8ULKQ+mFb4qFlH+BeZp89600/L/RfJHcHEEpYuuQVaCf1zji41HVYUomlZIjg/ieMeF
 oa4cL86w5b6ZKOXkq/iYPwX846ECQtc+X1zk8cMNFUJA/UXGe17Ug/9P5TcvmSE0FUI2EsQmzB3
 NwDgVKp3gn8XHgCXUPhQ10aeFEMCcswvjr7k5knDC1/+SZJK2CRvdr3lgS7OBwRfOJO8BKfVXRQ
 66WIBr/NsAVZ7OXMvmYIXLg9i5JO1l4V2KKA2MQZeAJliLGaBHEbDQwGVOtbDJVxFbrvCQcZ6po
 0uty8cX5Teje+r2/4JQqXNOxaTnojvb93wtbXqfyCtkVyuk/3eeEkdJgyDZrsost/jMyCG5RPzN
 iahFh0mOHRSTxioB3WctF9P7NK+b5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080109

On 12/6/25 5:12 PM, Krishna Kurapati wrote:
> 
> 
> On 12/5/2025 7:01 PM, Konrad Dybcio wrote:
>> On 12/4/25 5:46 AM, Krishna Kurapati wrote:
>>> Add support for overriding Squelch Detect parameter.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 22 +++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>>> index 651a12b59bc8..a75b37d4e16d 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
>>> @@ -37,6 +37,17 @@
>>>   #define EUSB2_TUNE_EUSB_EQU        0x5A
>>>   #define EUSB2_TUNE_EUSB_HS_COMP_CUR    0x5B
>>>   +static const int squelch_detector[] = {
>>> +    [0] = -6000,
>>> +    [1] = -5000,
>>> +    [2] = -4000,
>>> +    [3] = -3000,
>>> +    [4] = -2000,
>>> +    [5] = -1000,
>>> +    [6] = 0,
>>> +    [7] = 1000,
>>> +};
>>
>> I forgot to ask, do these values apply to all of the supported repeaters?
>>
> 
> I checked smb2360/pmih010x_eusb2_repeater and pm8550b repeaters (SM8{5/6/7}50/ Kaanapali/ Hamoa). For all of them, the above table is same.

Thanks

Konrad

