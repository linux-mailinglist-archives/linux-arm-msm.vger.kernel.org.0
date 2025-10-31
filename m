Return-Path: <linux-arm-msm+bounces-79946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D49C25E0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 01DD74E3157
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656462E093C;
	Fri, 31 Oct 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/sQ4NRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G377tDWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2F721FF35
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761925411; cv=none; b=sEqrvc4a6fYWpbBnnkFcLIZ2wiBKQVlwIs0gOSJqirauv6zN82dKPe82HBrpqR4UBZJA8eZO/LPdKKVDx9wQePiA8kcGG+v60K2cv9gxj5g9Lsr6EK4GZ95im79soImu4/vM4JPkfG6rSKGmQyi40SNFA+vyGLdFdzD6Wy0ZJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761925411; c=relaxed/simple;
	bh=LU4zbDVx4NbF8EhWTlBBqiKUrpuABwRR04ESl5ewXWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqYSKrIE330l5HzOQn8C1aaCS5v0G5fXGO1rcBf0ipz/LPUdOknwzcfEWDGp+VOdwKpd9+5zNl8mekhbOiiK3JHAvr5qlUkBJ8ghD6PfyDfxVq+okqSOLOP6EU66kgow1ni+V8amrYUCN125MUp1nuwsLqvLjnOaHn+z4z4K308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/sQ4NRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G377tDWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VAhG3I1571236
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=; b=K/sQ4NRYmSLBGIpo
	3uMcLBcwLEFQ+C6z/3XPMKqSqc4mBX+EkV6d/DvRjNvw9iypt1yAya5X/S9KCExX
	jPzBHOepU1TwzF+DbbckBcO9V73oNRbj9XDJtuOXROQKd8Fl9/etunalv3cGpJNr
	+OFlsLm5wX78l8cl4jzocBIYsrm+rmLXlnCy5hDdnHJmvcueAzLIg4OafpdCH+VM
	aVs02kgsr5LzO2nciYm0E2zFE97+GFWF5BUu3KOETNf0hThTTg8Mnsf0GIeOWW8O
	clrm9nyuThytGDYLPTMqS8DgNSL93P1aIRSYAmYnwlWZ78kXLsgkdzWwl/hTPBjd
	y6TdoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc23a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:43:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba930d6ecso61145781cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761925408; x=1762530208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=;
        b=G377tDWtPi87YotKnKHidIhj/yowwqQH0I0fedyFoExeChWQ+mDn5ExfPa7LFE04Kv
         C1QxCMdXcXikduK59YSot9amjFAvaX2QzWhixs2h34h8pXGqiIlKDMQhXFNflryzhfBC
         qbzTxLM0MXs3PT3GDmxNpg5TIhxgB0+y47gqkJab0K9JXZ44U8qm04Wttn1RXCI2CZ5C
         teUUUo55NH/tZM2NqTV8Q+vzP4ZoF2ukrxlEHCib8mPY8bqfIMECCfLHheDPgv5izBd/
         DpVohv1RfD16RGC8mthxpXjujqUmsC7623ZonaOmV188LMxgeG+zH08LbrA/HEpk5HOP
         UN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925408; x=1762530208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=;
        b=qRPZZyP41a/uFH7XxFGx9HvcOVjAHgk5t3i5HTggmLdlsW2eB7myGzQf4/gPe8LRtd
         bmR/jHHOTLJy12cp+/ZKCeojeEtXxzpWC2zs+XRCABAOLuSRS8rwjsj5H2pnaaPWXl7+
         /ssUkpUGRRODiADQWh4wpfRzcK8HkwLNcF5JThxfF077nh1o1SD5pCrynBVyk8fBL+vz
         GY8O6tzXN/8wuGAwEgyVgk3BS9iPoqLy9llrbq12Do9IO3RhULVfzRpP5B5OiM5zuyeS
         RR1QvUI4bxG51/Y0oyUthyOzrUC77DsbXEtsEijsY9DkbQHU8PodvBX1b9bqpkkiw2QY
         OJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVCytzLfaTcbE6LR1TEa711uzylotBUSi29kEVZW8e/niNqTsJa1RExUV0wTa8McrrCG6i7Qrl1TfyHjF0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwAXpMbpRgSb6zWekTZoAhPBr/zcUcEXp4gtqRiA9evk9E/gxyy
	VLEJ9VYwO35TeqGkz+AFFGZ4VJ6ZHe3eeydfoKV/HmsT8th1SNEbTxdRBJE/pp8rzUbxQzbWz5O
	42y0cmkJJLnIn8JmLchAXKtfdvZDWtEuYrZorE+V2swsX4K3UoW9lImCj3vxG6dPYLQZX
X-Gm-Gg: ASbGnctencwa5ORIdVgYuwiTC5ZVTA/7Lw5UD5jpCAd3hVgiNHvrUQhbCzqODNGwDgu
	b6go/vHlxkQIWBIiWs/XwRNHwV7ju+0gTYhHhp4Gry0DDXFvlCfsmgCgiEh4E9xy5fyKsDV3ss4
	ZibZf7gHRnO7tuUV83PG2qyq/+O4nIljIRcneBUA6tSd2LVOhM0SX2jItCkUQNUVxg3ouicPVy+
	a54VT0T1sP2H/JDV8xHd4kXJTZBG7tmMJ2A86hOWr3sGZUyuLtoXNjmVm2Y8dwoPF55wRcQbS2M
	PVBNtbvcNC9E3uuMshzkTkYvs2lHuSBQGzC/0ouh/VcYAJteDVVPxD/q+fdpHGuJlYng6ZEQ9Lj
	Aw9b9bwPqJGYM89kFQm8sjrIu37W9M0pVbf7id/cpEznKaZmq/1Eh8qfdGMS0cQ==
X-Received: by 2002:a05:622a:153:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4ed30d923e3mr43230951cf.5.1761925407744;
        Fri, 31 Oct 2025 08:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQAWd1J7oWtcMPX3rnVkF6XNlyYFAMR5sObmDNnVQ/IctF28iJZltsP22Ps9WEpLaV+65wUw==
X-Received: by 2002:a05:622a:153:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4ed30d923e3mr43230481cf.5.1761925407236;
        Fri, 31 Oct 2025 08:43:27 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb45easm4478091fa.16.2025.10.31.08.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 08:43:25 -0700 (PDT)
Message-ID: <e758dc56-a5eb-4c4a-9ab0-74e9b9b86c7c@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
 <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
 <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0MSBTYWx0ZWRfX6E/NaXlHMeHY
 Jetq9n+na3x2OTGshY0mfcJMCSe0/CBB6OGeVHsy6W1AeOkFY2r2393Xtu88ZxPQ+fQRu3LbmCi
 ovB/LWfu6JElgEvE8nlFKL+YhytMYFhL2dEH7CEROhVZAMhskpMu6lbdV4WEFpyCh0C6yeQQyw5
 XxI2WA5rCzb547jT0G7rvPkeNSzt4o2+r6PBZYodai88mlaqgIBgP4mheMfpxIAahG9/HJAZUfq
 WThg4uwRA3YbtI3hD0aYAQkWtyDM4JOo8cVHGpZBHEzNPoPD/3RFp6ZvKMIAOfYMTcZr226bscJ
 kWwaYsX7LI9f8+f6MKIUUcKTf6vTpat/G1nVirogJOOTl2EKbvDy6EXm3kRTibCc3LaqbfK63/t
 4V45LCJfsSynheuCHW08J4IbHAssOg==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=6904d920 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Gjd6gEmqAeAVqTANhbgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: yGlho3pmz-W6DML_cC_6Q3wtOjytBS1O
X-Proofpoint-GUID: yGlho3pmz-W6DML_cC_6Q3wtOjytBS1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310141

On 31/10/2025 04:21, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 07:57:46PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
>>> On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
>>>>> On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
>>>>>> On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
>>>>>>> On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>>>>>>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
>>>>>>>>>   1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> index d6a37d7e0cc6..7eda16e0c1f9 100644
>>>>>>>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>>>>>>>>>   	if (ret < 0)
>>>>>>>>>   		return ret;
>>>>>>>>>   
>>>>>>>>> +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
>>>>>>>>> +				    1650000, 1950000);
>>>>>>>>
>>>>>>>> This should be done in the DT. Limit the voltage per the user.
>>>>>>> Two reason:
>>>>>>> 1.
>>>>>>> I see https://patchwork.freedesktop.org/patch/354612/
>>>>>>>
>>>>>>> panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
>>>>>>> so I do the same work.
>>>>>>
>>>>>> Please look for the majority rather than the exceptions. Out of all
>>>>>> panel drivers only two set the voltage directly.
>>>>>>
>>>>>>>
>>>>>>> 2.     Kaanapali vddio regulator:
>>>>>>>
>>>>>>> 		vreg_l12b_1p8: ldo12 {
>>>>>>> 			regulator-name = "vreg_l12b_1p8";
>>>>>>> 			regulator-min-microvolt = <1200000>;
>>>>>>> 			regulator-max-microvolt = <1800000>;
>>>>>>>
>>>>>>> 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
>>>>>>> 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
>>>>>>
>>>>>> DT has to list the voltage values that work for the devices on that
>>>>>> particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
>>>>> get it. I check downstream DT,
>>>>>    dosnstream DT:
>>>>>     regulator-min-microvolt = <1800000>;
>>>>>     regulator-max-microvolt = <1800000>;
>>>>>
>>>>>    I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
>>>>
>>>> What does panel's datasheet say?
>>>
>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>> VDDI=1.65V~1.95V.
>>>
>>> So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?
>>
>> If the panel declares minimum voltage to 1.65 V, why are you declaring
>> 1.64 V as the mimimal voltage for the rail?
> 
> Corrcet here:
> 
> DT ldo12 will be  1.65 - 1.8V

Yep.

> 
> Thanks,
> Yuanjie
> 
>   
>>>
>>> if you think it is ture, I will fix it in next patch.
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

