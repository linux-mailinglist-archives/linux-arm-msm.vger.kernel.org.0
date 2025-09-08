Return-Path: <linux-arm-msm+bounces-72620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807CB4962C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 632CF171E8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE0A310764;
	Mon,  8 Sep 2025 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFkVSiPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7830E0DC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757350288; cv=none; b=Dtm0iULOTRXUXIW3/OnHaL+goGTAEhbayoWNX7i+G1u6PPN1KEJMjC2yjPdMpEZXD7f7COaPMHrfm4prAm12lpZdBxGiBz+J/kqO6upyBK3f1B6hN0+i36zGpwlxoPKeqI2QCqdiMgwpjYQROjIwX4eY6lqXbfodrLI/uX1aqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757350288; c=relaxed/simple;
	bh=jXCaVxgwA+wpwrNJLOU+dIp0qXgCheh9pPboijAc+CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXc83RAEvKNUMBVzezGOZW4ufOOeHUsHbcPNldS1JAiNHwzsgaIr6691QX/2fmIIqUVZ0CcR+3/UqP8IKNPjfb/VCRNwc+eHrxRfyR7ngOleibZN6H++JNozXSZMz8SKoL1BFfAdiy3WKyghujy36jXNkYJoE3OqGoCXoZNd8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFkVSiPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GCTDQ007791
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/+zeaYd116Dx15iEiK9NuMeAKSenvu/yLAwNz8B5ro=; b=FFkVSiPlnxM8h3/b
	rEEV/CO6t6tA2zW3Qil+GtG5629F+DtJu/Yde8JrJxvi6rESeWwM5mjRwvaI7E7E
	Wjae2gvABnRVJCgi6Cn/Dr2C2d3gC3EFkOzfFDwvWbT0bVIF0dViFaW3zdOvaOvC
	TgqS0EAplQFnKS+JzaVZTl7A2MSO3O7NIjtn5BR+u2yP3AU5WZJCbK196H3X1vsw
	Gk/gxaNZAptvm7HCLlaUTOV44xggH/+jni8ZWTQg3cUsYgwi6+MpRujQrN5KclDx
	ZmthR6/qaU5pKTURdNwbQXhPQA2X5qoFqG9dn/mxgkWPDUQ7Pwk6LrPjU+KTS+ns
	3cT3Jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8dbxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:51:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329745d6960so4714553a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757350284; x=1757955084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/+zeaYd116Dx15iEiK9NuMeAKSenvu/yLAwNz8B5ro=;
        b=lI/AqlyexZ2DAY1mkOLf/UbzJxddO5NZlUDSQT1vKN5iMm2lJC3oWQfJFbelkOy/gc
         2bk4krYXivn2NRIAbKaBCUnfXRDqd4wtg4rO+GUCrCqExLcZ2W9gi+9rN8KUL3o+Upo8
         ZOP5PpetattU1Yc3u0oIsl73WPq3P/eKa0k8jSqzUf33OBy4C74jRrdWgnNChqFtq1Yy
         MJb99OR4zkY7z8Ye7iCYJz4K69SX96fG9Dhu2GLYOD0x5cQ4NqT65YNJ9u+Kbfy5QU3S
         exRMWNwDF+ksOJAf4QY2Kc/nqu0EcqwKOVM0wtdB/OpvYsiaGEB9xujgMrLoURsQp6Yq
         WqsA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ZuwQZMKStpI8J7BmOrKpXpX3KIYSL/s7I2czRrBEuy8mhkYfLXmzECdptOdNW656Gb0WylwQvB2ciYQJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xEMiLvYbP3xIhU4dhjzutC5451BSeZEa9mdcSTk5q+i3Z724
	ejw5zFTGj2fXYwWdD/KjEIfMsGnN6hAHnX6NhGbRD7XLis6fjxcbQqDKMSycvlNKi274DX8XGQa
	OHfzdbW5O7ZAAF+M+V8bSs59BrrsQXG6MYkHY5iONaDvBNx1a4WteApZHdY3uS3fzwqmt
X-Gm-Gg: ASbGncvfTQ6QR8QLwsd8hGNQYvdUSKCj5X647uFmNbWDB4xM+PdbiHJDB2JpCqroJQz
	abFHRnk1navLLu/6d2v777z2HfitNYDOPi5h9G/FaufDNA/Fm9xIFHdnu2t7yoZoozRwtzgCsiQ
	fPBpfjWerKz9UjXn8RTicL3OErBuUSFhvzAPMjhPZJ5KBCau0kZ/lhtMDO8mVsO5LZyl3ekZOrW
	QlYNksA8RPoeTuo8ydztVnm8sNcFsbfiwuDz9RM+ah35A+1i1cIvN3guWkYCbOWh37Jzz0ILBkg
	wLiFtrrpVuPODe6S7nwS639kv/u7N/kTqmY/vxWvvzqVVqYqpd0qJurWSDJ+3A==
X-Received: by 2002:a17:90b:4ac9:b0:32c:923d:b832 with SMTP id 98e67ed59e1d1-32d43f60885mr12205935a91.23.1757350284383;
        Mon, 08 Sep 2025 09:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTXxdRyvNWH6SrIRGKc106RSjdLehTELZS2revNCY8iV1PAXoSzB7fP1pZgGc2alNIfxrIw==
X-Received: by 2002:a17:90b:4ac9:b0:32c:923d:b832 with SMTP id 98e67ed59e1d1-32d43f60885mr12205893a91.23.1757350283756;
        Mon, 08 Sep 2025 09:51:23 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b94a3fa06sm5216758a91.9.2025.09.08.09.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:51:23 -0700 (PDT)
Message-ID: <e4d3e195-8d62-48bc-902d-b42fdbe9a3bd@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:21:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
 <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
 <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
 <dad0a37f-38b7-48b4-983d-fba265bc66f1@oss.qualcomm.com>
 <f00dffa0-11d2-4e88-9770-c34682f770ff@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f00dffa0-11d2-4e88-9770-c34682f770ff@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9qVZBRCDbdY9
 cA/GHu3gOgL8SrMxn6pDdpf5JvXgdJnwBS+2tPEBaOqwGaovcCfPyZxOaAtwhdr29y15j6Kd6gL
 bFVmGZF1fjJqnLgk4aM6blJxZss4TcDm+lo1exCFEZ6Be+hG6iClCCQrCPqoCwpXfTTi/7xnlW3
 HSZ3oq8BROGq2a96H71MGnb5p9AF2qTQXFdFFuyYH8tbn6S5zK17MMw3+jNTBn0+9dGIpHXksD2
 0zSPHShoWRCRdoo5ZFmREpqSit6zO8AHj1Kv0POQOHZixppXkBRepMrhVket0Aef//VU5AWuiSs
 +MzMeu40hrsjJw0IIpXxnuaXm7CW4lh492KlgqKxTL6llNtcPv+TbWpMvdq+/xt6lVZbvcvsN15
 8kWmkRo1
X-Proofpoint-ORIG-GUID: ufTeXuH3PAN43MrXs4YyJG5ZP9oZ-Ovr
X-Proofpoint-GUID: ufTeXuH3PAN43MrXs4YyJG5ZP9oZ-Ovr
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68bf098d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=tOSjwr6CXn1eiJSsW0AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/8/2025 10:03 PM, Neil Armstrong wrote:
> On 08/09/2025 18:29, Akhil P Oommen wrote:
>> On 9/8/2025 9:52 PM, Konrad Dybcio wrote:
>>> On 8/18/25 9:17 AM, Akhil P Oommen wrote:
>>>> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>>>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR
>>>>>>>>>>>> Bandwidth
>>>>>>>>>>>> along
>>>>>>>>>>>> the Frequency and Power Domain level, but by default we
>>>>>>>>>>>> leave the
>>>>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>>>>
>>>>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>>>>> parameters
>>>>>>>>>>>> in the GPU info struct to allow the GMU to vote for the
>>>>>>>>>>>> bandwidth.
>>>>>>>>>>>>
>>>>>>>>>>>> Reviewed-by: Dmitry Baryshkov
>>>>>>>>>>>> <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>> Changes in v2:
>>>>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-
>>>>>>>>>>>> x1e80100-
>>>>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>>>>> ---
>>>>>>>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>>>>    1 file changed, 11 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/
>>>>>>>>>>>> drivers/
>>>>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> index
>>>>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info
>>>>>>>>>>>> a7xx_gpus[] = {
>>>>>>>>>>>>                .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>>>>                .gmu_chipid = 0x7050001,
>>>>>>>>>>>>                .gmu_cgc_mode = 0x00020202,
>>>>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>>>>> +                {
>>>>>>>>>>>> +                    .name = "ACV",
>>>>>>>>>>>> +                    .fixed = true,
>>>>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>>>>
>>>>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>>
>>>>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>>>>
>>>>>>> You are right that BIT(2) is GPU specific, but that support was
>>>>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2),
>>>>>>> so lets
>>>>>>> use that in Linux too.
>>>>>>>
>>>>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>>>>> configurations.
>>>>>>
>>>>>> Eh, then let's get the docs fixed if you don't trust them because
>>>>>> we can't
>>>>>> work like that..
>>>>>>
>>>>>> FWIW this is information from per-platform RPMh cmd-db data
>>>>>
>>>>> If it comes from cmd-db, then we should be requesting it from the
>>>>> cmd-db
>>>>> driver rather than hardcoding it here.
>>>
>>> No, what I meant is that there is a piece of configuration that reflects
>>> what goes into cmd-db as its compiled and that's where I found that
>>> information
>>>
>>>>
>>>> Not really. This should be under the control of GPU driver.
>>>> BIT(3) is correct for X1E.
>>>
>>> BIT(3) is for APPS, see the interconnect driver which also uses it.
>>> This will create conflicts and may cause unvotes when some other
>>> driver requests perf_mode through the ICC API, but the GPU is sitting
>>> idle.
> 
> Yeah gpu will vote via it's own bcm drv interface and they will be
> agregated in the rpmh.
> 
> It's basically the whole point of this gpu bandwidth voting via gmu.
> 
>>
>> No. GPU vote goes via a different DRV. So it is independent. Anyway, I
>> checked this further earlier. X1E platform doesn't implement any
>> perfmode vote. So both BIT(3) and BIT(2) are no-op and are ignored by
>> AOSS. ICC driver's vote too should be no-op on X1E.
> 
> So I can drop the ACV bcm or it's a compat for other SoCs ?

Lets leave it as it is just to keep it consistent. There is no harm.

-Akhil
 >
> Neil
> 
>>
>> -Akhil.
>>
>>>
>>> Konrad
>>
> 
L


