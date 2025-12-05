Return-Path: <linux-arm-msm+bounces-84456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D47DCA7818
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9106C313C1E1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244991E1C02;
	Fri,  5 Dec 2025 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLiHqHen";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYleLIDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF96326D55
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936201; cv=none; b=NVWt/WgrTh7kedSm6uHoSxp7QudZvKI0yUkYAxXaqvTdYuuNy+KOS5Zhow0jN4H0smLKyV1RsAIawmrlnQ1Tec62Y7HxGAAy6V7YtJYEa90OJ4+yedzVrOEUDkkhrGymAJOtAlBYsVxsWhK0YSPr3ZCJelcSrKunKeYdENFPSLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936201; c=relaxed/simple;
	bh=v9h+kkuk56zMsB4Du/PwkY7JPFHXv/drmxI+Nn0ItY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrQKenF7ErGU/2R8qrsyUUAQHSMebzHdDHdycICB030XAbq01j0taORKmbuhzj4DEZSDY4OJNmo/Va3Patr1huzwMw2AqD6haVdlmIyrr50ldw6i6jGFch1hm9MvLfz6Ob/v+tRckkU+/ikdKboKGWyVpoeKNKy5vbNjUN5w7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLiHqHen; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYleLIDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B597iVb2896539
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=; b=HLiHqHen3PiMkldG
	650qsThVHMEsBaLSxlhAqqxkXk9hyckjX3twAM+eVhqgQPo+buHuUVkViDY4U5M3
	x4mjcu+QuAVSXxAJEZGIFzlwFJ9A3urUPBK89UyW0aOYcdMl2LXBtqoutVl/xLX3
	2YMDjUDdmcQPNNiezzjWfbzFc8+/40uzOfO++SQdqu+doThtkmzU/kdxoJnMC0UF
	3/sti3IUArB9nsozpPc3e39+uHwWfGA/UzaDY2yoFuetG2l6+MhdxTpYJVEupz49
	qI1eJlXHXr9ppj2MGZucS7ebu3RbhBoMRClYC0uTfHBrOs2tcBYCmDWZFh4qRH/I
	K2knPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj1wd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:03:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so6262121cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764936195; x=1765540995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
        b=ZYleLIDG4nAxGsMeG6j4nUxbKEPAFpcQqY1HtzYYUxjIqM6mkVZpkCLCCqBBVoB6g3
         nWoZ3ab7dwO94sYhKvrqHAbetitDUy7yOkK7JB1RySZetRtd3+OOxKxEoH1hiYCmJe9E
         q8p2udcbu6/9fm18C3cuYO0BAxOz+qSpA/FySTBl7CrtOIw5LCjKDayh+e1DvYK/sWwn
         hvT0xzLAY7zSa+aM8HaADx2259aR7Vj5wLUbkbYUd8xFE7/nkqTnJ03Fibr9sbqZH1uc
         BdZDQI2CVgJ8++f15fhXYIeK0rQz621rQoyT4+bbC7mZRGRAmrWNzKywyHMHFqmZdf5X
         VNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764936195; x=1765540995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ibRns9NpT7LfaypmozZ00h9uMW/vCu+51UfOTwa4xw=;
        b=P9VCRHVOaq18isXUM+aL8+GtKlGQx8/JGBKsrn9srFBkVLsbNjq5l4ctL1r4sXGeIl
         cUE9JUwf1eZv5vL3C1VAGQlRzz/tWZoIdYonwx2dzTxJUkGLd24XRXlgmR+q7Hd1jiXy
         ZS8ayPbGpRrfcSKiKeNatozToJI580FI57eDerlukl5D2wDRln6B7ZULg/dLDNyGLUgC
         PcgxWcHZxpHldo01qDHGqCDtm1UFKaiIYYUWNJpsjxjRvH4xwDQq037LOLVJHYqCrkdT
         PZuKGCGG1rIAgeE9L0Csw002INFk/8Bfit6XyU0iOdEWI5fqP1z3c5RiBIxXzJzYGaXf
         81sg==
X-Forwarded-Encrypted: i=1; AJvYcCXE7tgEUDHWagDbtA2R/CmyeaK5pofAXs+IzYrG2aUtG02Ob+LQkXAO58Fp0awD8zth/xoX3gx+r+0PZ+Pk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrt1fuylkQp0VxPpWFkOsYFmZ0feu3v0ei/DRq+x3n2C0KH7sq
	ep2cZeLEOMMHJrgXXvh3o5MSjnfgHR2UyAgAt1/XDbPiykp8D0/qeXHfJQ4hTWsKQZ/i2hlAgIr
	tj7hNaLwQ3ZHSsYDUJuE8vsXuNVkCXMs1pCgvi8tn8tkHyp8LITM8alptJ4WAwWAhv2/L
X-Gm-Gg: ASbGncteI/+re1fx66fghm/d702JzHjkeXFISe+kImVKMhMYiwAkukWgSC9HL5uk2Qk
	RY0zOFp0tt7h6gARv3kU4dRgPM3Wh9gOfrcUavzRRU8DMr0mWZ7aTDUVFTCDtbgqyqyCiArM0aw
	6SPiCbnkEQqJbBtdXaj2kYv+upkJBlABOZZjwz1BFi/FCX31wZsTNJiRk7Sik0cTr8LVHxpARG5
	zBBAqUoTOX3xCyHBuQbzsmF7DanppYddHTohsCGqYFdPaU+2wDg+JwPbH+/Kk8aoNkqshw8gdVw
	EKuPQfiO58dntFMQhiBchwtsvpRVSLRXyoKT0l4XzsWkmIRkz2rryJGJzUA7m39iUEMweqw+emS
	xRmvjlPyDCHQ2npOgaQch/JcxsJEioi1kbms4Qqox/kjBoTMO6Ag=
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr100919621cf.11.1764936195070;
        Fri, 05 Dec 2025 04:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDtA69UwRIJoySS2OMMEYNqbCpINvG3hPdksp1reab8w5GlGFxHYYfb5cJEmOse38qlA5hXQ==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr100918911cf.11.1764936194568;
        Fri, 05 Dec 2025 04:03:14 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975dc1sm345503666b.32.2025.12.05.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 04:03:13 -0800 (PST)
Message-ID: <551b45ae-0980-4bd5-bb83-2fac6d7e2ce7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 13:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
 <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
 <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03buEzs9UyDaDpamyAXwM8vrkp2P_N67Wqt3oRjhdc-sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932ca03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QGPp5zjhHj0ErSlcMgEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: LTieep7qlx172Z_wadeFLpCrDVWRc9XX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NiBTYWx0ZWRfX7GX+gkTRWXbW
 RY4ZOorJ13ny5fhwG60tNgtJBT4cCijJfrCfdA3GeJkzKgaS1h6igwFTQcgCp8kNUzYqLV3EPMe
 mDiifwaj+vruzx0WtxuRk3jOtgmfbDRMH1bW6wcDs4w7K/p/8+ac1WepULhXl+Q/UTszPEqLB0i
 dkibIyySVy/wbPlE+gLF759Oo48HBHLBpAGOCWngglLVh0ZAv+ExPTHo2LutqSXAJ8hkSVjV3HA
 zLAA620nHhvC3FmqkY8crRuA8xwizNmDF7+mWWdxDovGbOPdJqwoCOPhItb4JdVuMt5WC6xK3sn
 ndbfork5WMdiE6W95pRtECvau8YCDLe2IyUCEKYbB5Le8m5IgmAjOGU9d68H896Uhfo2C1jrEZx
 iaLWdAwH51VcRTx9IM0flkJ0MrXtnA==
X-Proofpoint-GUID: LTieep7qlx172Z_wadeFLpCrDVWRc9XX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050086

On 12/4/25 3:34 PM, Rob Clark wrote:
> On Thu, Dec 4, 2025 at 5:30 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 12/4/25 2:10 PM, Akhil P Oommen wrote:
>>> On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>> Some GPUs like A612 doesn't use a named register range resource. This
>>>>> is because the reg-name property is discouraged when there is just a
>>>>> single resource.
>>>>>
>>>>> To address this, retrieve the 'gmu' register range by its index. It is
>>>>> always guaranteed to be at index 0.
>>>>>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> index 5903cd891b49..9662201cd2e9 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>>>     return 0;
>>>>>  }
>>>>>
>>>>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>>>>> -           const char *name, resource_size_t *start)
>>>>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
>>>>
>>>> Can we drop this and just use devm_platform_get_and_ioremap_resource()?
>>>
>>> This API seems to lock the io region and fails with -EBUSY if the region
>>> is already in use. I am worried it may regress other chipsets. So, I
>>> dropped this idea at the last moment.
>>
>> Is there any specific platform where this would be an issue?
> 
> IIRC we've had this problem before and ended up reverting a similar
> change, due to gpucc and gpu overlap

Argh, sm8350.dtsi for example seems to be affected..

Hopefully one day we can fix that..

Konrad

