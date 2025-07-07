Return-Path: <linux-arm-msm+bounces-63904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B82AFAF7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A61D1AA3022
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B564828D8E8;
	Mon,  7 Jul 2025 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm45DgSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A3128CF7C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879981; cv=none; b=t/6o97ac+NI6qqecN1SGVlrJ9xbRaatyEbl7KgBZbKAwDbEzffZbyD35VeKbfOo3SA/Lezbfihh9YsJGc8/+bzUVjR+SWlZ+YQYNTYRxefZcI51vN9X5rqoLft6dkiwdBocXRHlYRbUthSPGQ39FVNs5nIdVZXr4D9WZRnVBwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879981; c=relaxed/simple;
	bh=ljuEX21Jibul/BV1/uZPiIOWGalCwwuUymdQtWRaO2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJNjxmM0p/X3580sEZBx1X8W5eJ1g1tzT5GHw++POSF9Sy0f3X0krRmgn8Yx8ZV2ZF67RVocvtH7ciRTXrnuM0L9RCN6U1Dii3ZEfXhxU49syQphlkDLC7gW030RwcDdRcAWLVwertSSvN1RUGMBm7SabYY71EuZ8cEOYQMC/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm45DgSY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NNnKD012489
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=; b=Rm45DgSYnQerxl79
	0X4MW1I5IcYlbWtSLDtYyuPlwVTtgHL5NatR8gmftZ74YKU1wrFJGB/AgbAL73fg
	LH8X8QB1r2y8CU8p2qljLvPqq4VZ8zogAmc1kAKY9I91ZACh5+fEkKJl8uRC5J26
	cRlyaH3JkD+9w9IP/vzsWUX+bUS29tmhF/MCnVzrA8UYkl/+26BQsvINbnipSTdp
	Mf9XBAkKAdRmQq4ChTSekzYsjaEjUFk/dwheyG9tQz1dliewkqm/75ARaQwjo3BK
	pR1+c4mwjwzwSGQ28sWTQKJvMKlwbDu/JU7gDr8BK69j0sLf4/NtvLgkLfY2+kDZ
	GqzQcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qbakj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:19:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9a8841a85so2386671cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879977; x=1752484777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VOMNRIdPe5++kYgsqfJ8vCXc2F2M2dCa0BteZPuPU8=;
        b=IuYAxGxmuxpIfQ4utm6RYzNzJOz/puocdptYfeyy+GS2cFV8WnMa5QsFBUZkt7RZYT
         MmXgXd/xaY7BRKe2Nl6eHObw7aZxO348yCkUNi2Rvgkgn8/QhGFKG97iCNkmyA6k7Anv
         4TsJB2cc9nhHLRbF3SN3hzfsHXDEihyEYLxe8Y6rjJxLeLUiaHThfET1EhQyih59FGqM
         uLYxj5vXeIkm/U+lAZzP+wO8R9hmHz9iF260otBuA4XEKFsWaJ/eW+DtbzwwveFNCyZ9
         OCxyPw+WjLCot7EpRQDZOYsSi3FRBgwWmj7eMNVGa15h9lXzZ5YHNyv0Mfx9lqyCqyEM
         xCIw==
X-Forwarded-Encrypted: i=1; AJvYcCVitYGyHGxNfFk7X4KgtNtn1/+ZdegzRhFs0nkZb1+PXbtO6NirKSOnSGzEeRk9YruurC96EYqO0V+SyJmm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxlo0ishVOmkabzFs70JXy+bejaDpvmcO2SKU7yoLOzc/Q9URb
	P1MlFW/iL3onNdOaA5jfELEhRSN6zpIcyXDJ569pC1UppO5JgzuCOPllT1UwjPx30Ppg22QKAuv
	NsGq3vJfc4ggswdffXwio3sG/OiBIzgIH+13agL3+aP5H2d+1VYXf3pq56w9LPCsSiFgP
X-Gm-Gg: ASbGncs2usD+y160yX3eDpCdzGMW7/EhFAaEtozDjIS3MYq+b7kzle/6124AzBYKWeS
	XFPAkL1EnHKHeFh5scwA6PZ0Pid5VzyAn99e+8kLSKxFd16mXMy6j6jUZKk5IhTX9ej+HCSt9RY
	38Vf710v3D7S/XIoIdVyysNjqPZzrdbnjO5mVIEaAg/ULDN9qGTsdiRQ6AZHh06X4/TwMYz9bth
	j6TihII4WF/wVC+hviWx3ni5pmdZKGpppPullJ2zdh6Wv9OZc14UwOLIywq0ot8EG4Lz7o1b2CS
	fU02jVvfnkb1qDXDidrKUFDJaku1ZPajiw++n8JxmVVAny/qz6pnDDgDY1vYv/E7+mNpmi3EdSy
	dTc0=
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003781cf.9.1751879977082;
        Mon, 07 Jul 2025 02:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8zQl/VV82jUJ16IKGzuIQK2MD0Ay6nJSmgRfvnHnWiCJMb9E44wM/hVre6rQPyF4QKYG6bg==
X-Received: by 2002:a05:622a:a90b:b0:472:4c8:64c6 with SMTP id d75a77b69052e-4a9a01330c0mr49003631cf.9.1751879976627;
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1418sm663547866b.183.2025.07.07.02.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:19:36 -0700 (PDT)
Message-ID: <30cf5c9f-6c9c-4cae-adec-81fa090a3eb5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 11:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
 <ded874b1-715d-a7a7-fd0d-3b98fd5fd029@quicinc.com> <aGuOzdCu5UmKDF94@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aGuOzdCu5UmKDF94@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX+9KjDuKrGwzK
 pjylZAzXjium0O5QIqtrbGKAF5mU8azsgmhcrVIqW4g/nTaFgvFM2FVN+GxfmPBaE25W/znZEZo
 wXFMQDqjEe3J5ydSD3gcB5fFnHo6CnrXZghD/ECiW3SZMplnj7sh2rw1dEfzjFKmYa57x4A084Y
 xYtj+2zBXRA9t9MUm1RbjNqwUZENGaOSQX7BZ0k2jJhF/OlLqS1/Fnp+343teU5d4aJlwdOxRIH
 RrL0RTbtwzBX4xtPq4mww4rZXi97xAY35KFVeInJgVFrBHyAJ9pWxwnuAUU0wJNyKCJk+r0UdFs
 c5rqV4CPb63wK4FTZtcBC/5+Clqs2JFnQoiSiyi4JpvEuCO/w7Q09lANOOYWO0PSXx/NCODHwvB
 Mg41FRRW0mQJcVrg/T6InJOQ3ePbkMO6u45ZTSmY0qpNRAudEJrHfMfc2ERdyAhQC0Jr7838
X-Proofpoint-GUID: rzFl30KkmPryC7cuQdIuRYDi0mIBARsv
X-Proofpoint-ORIG-GUID: rzFl30KkmPryC7cuQdIuRYDi0mIBARsv
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686b912a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8
 a=iOyF40SCRJJOIr8PYD4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070053

On 7/7/25 11:09 AM, Jorge Ramirez wrote:
> On 27/06/25 18:46:10, Dikshita Agarwal wrote:
>>
>>
>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>> Add a qcm2290 compatible binding to the venus core.
>>>
>>> Video encoding support is not exposed until the relevant hardware
>>> capabilities are enabled.
>>>
>>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 736ef53d988d..f1f211ca1ce2 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
>>>  	.enc_nodename = "video-encoder",
>>>  };
>>>  
>>> +static const struct freq_tbl qcm2290_freq_table[] = {
>>> +	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
>>> +	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
>>> +};
>>> +
>> fix this corner.
> 
> ok, will wait for Vikash to confirm the other ones.

Actually you can get rid of it now, I think:

https://git.linuxtv.org/media.git/commit/?id=b179234b5e59013f8772da17b273f463f9720bdd

Konrad

