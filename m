Return-Path: <linux-arm-msm+bounces-72299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F9B459F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E534E1885BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A1235E4D2;
	Fri,  5 Sep 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gp3Jo45O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3B35CED1
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757080801; cv=none; b=l/QM4xvavGh7CsTELiCzFTwkjD5Z7AINaCNtcF77JYH/z8wpPxdPNR60EtLlx4Oq6gxVWms2OTXwurq4BdBepWcf6edJKrcuBnT2A7aqOqELfYumW8XbDm5DH+m5WweG40qTaqn3tihCh7VvkoOsdysLDRLCPfWR1No3EC+jVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757080801; c=relaxed/simple;
	bh=Nxs4jNv/0ib3sf+j4qyuTZlmnL6qwSijbxCkWrKUZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lz5lISe+sFkw1HupI+nr10DKO3f7MBw7vTONK5ZLi4Lr99KvklS52jTmq7hXJo9G46MlF9pkGBR0hRGWhdPom/qaoWcYBQlYxYyDt/9J8jp3n5zYFO7Z8tEalV9eMfH/C72Qjy1d5gbmQLsbaw1XbTRS3ceEGdbxymn6KJNI9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gp3Jo45O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857admu012043
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 13:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea05wx5yo8UuvtRp2vDxehHvL08xPw5lw2wd8l1MqSI=; b=Gp3Jo45Og9cQPZc8
	mNUvOZ8QlKcHamZT/P6ndQ1Aivt4WQ0l1FPQHQr0sZtMJW8VTlzpJ8gQEAcU6Qse
	DfZbI9wtsVB5MGbe9OA2xA5EMp2raLJlOdmQU/6qxwuhIPJJkebzR2SP4NOy89Gb
	fP28CDKE/197QdBmHbgNHUXju95thY3rbrwZZtJfQt01y2xkx8QfKHHdhToviT7p
	54GrW9k+1UCtuj9cLuDN5JsOtHxwmbudokWo+RKgI5P27hVDmeCv2zM1aebZjPkJ
	3Ss9jbW0bIeit2QZ4OHKO37tiTXKrGF1ABmDuhoe5CQbskfEHnF9Bwr0hkU1UV4q
	kTNnTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj7ncu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 13:59:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72048b6e864so21647996d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757080798; x=1757685598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea05wx5yo8UuvtRp2vDxehHvL08xPw5lw2wd8l1MqSI=;
        b=Hf9kgynDGkCvoL33SFqunO8OUSsOxacI4gJMKNRZfh0drJ/yalE+9PeemHjMnSd0Eq
         mNz50tJAUTHrOxK7EDOEzXw/xyZ+xbaXYqsjOGFZonE1YSWAsvZNrkB3dl9Wb+6/4K9d
         9qDkowTdt52hnnj2jBD8zoPqE4i09U3gFgRhaA5AN0UyuA5RymThGjYhoqW29tEa66B/
         gCH17e/VZ7uRWIvop56Bgeb/Xp+yB3WTDatmmHY58a0MMJqUi4qodOazQE1nhxGFoyWy
         Q4cpdGcu2+lD1HdbipzTzqnU1vuCKjzq/NOdjxUNDG9eDwkie/b/iku9jUbLWb+x/yfS
         OanA==
X-Forwarded-Encrypted: i=1; AJvYcCVEO9nnOL0JG25EIfqWgHbkmLcyuz5CNIk9S3BcJ8Sa4IWDLCpHmwQs4WXFkJU2ijij0firIU6W7/4gVEFB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzon+4qCVMV+A8GGtvre5vMc6o2qenkFfMaMajxC50yEL7Aglsq
	4Q3+qhnPJR4wxioK8XPuVf6pmkNJ3ANoxM75crvzzSETJnCM/zq8WAFwDfxFUwuUbPfg8iR/NQ8
	t9BbHfbBU0uWYKLlNJhVt2Xk8EzEecsj2DaSjpFPEIiNhWyLBc6fsydtvR5kDeUnEDR1h
X-Gm-Gg: ASbGncsfk4LQ83a5EKV304ncY4OCZ//+v/7jwkbDI/2pQEFHYUdXZEUOFH8i5+Hjwm9
	0YY9YGcL4xi5NgK+ODQ2kJBaFYals9KMmW4E2ZwFv1ZMZvqph48EAWADivPNiRksHhVXRo40yVM
	gaNW4FeQiqJ1lCEc5TBCblnN6RzcwsP77he76yRy1DgbcCYufeVfIEFrv/Yn7K+DBp37IGn/++/
	DSnstRqxxp29M5xnIT3D0eMs9YXdgfXZoeX8lj/OfPGssA5fIgMwMUgU7l0kiopGEqzu0m1mkGE
	TTeEJCatgLa3sUD2cgFSpCglCe2okLMb645T9pkUwQdO1LrAlyI/bBg1NidK7gBVcFE=
X-Received: by 2002:a05:6214:769:b0:72c:cc04:c3b3 with SMTP id 6a1803df08f44-72ccc04c482mr24151106d6.0.1757080797874;
        Fri, 05 Sep 2025 06:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccFczVmu2K/MQDGzAtfbcJwtC1knDM1QHNcoZ7QIDaLyWrv6egTKR2btgO1NsqyhBqXTIQg==
X-Received: by 2002:a05:6214:769:b0:72c:cc04:c3b3 with SMTP id 6a1803df08f44-72ccc04c482mr24150546d6.0.1757080797193;
        Fri, 05 Sep 2025 06:59:57 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm31898228f8f.27.2025.09.05.06.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 06:59:56 -0700 (PDT)
Message-ID: <a3785cf4-750d-44ef-afaa-7d398e00652f@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-3-srinivas.kandagatla@oss.qualcomm.com>
 <kmm4e5bg7uehmlsgrfhzo4agr6ga6d5gxtpxq5sg4t3wql5p6m@llwyz4kzsj7y>
 <f6a631bb-d17d-4eba-adfc-4db08540f5a0@oss.qualcomm.com>
 <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6igcrtfra6h75v5g3wucokxw3ncj3k66ui3jnhfpdf2lmxc3tm@3hzihrpgjaz3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXzWS6nAKCQQ6E
 Kx4G1WLX6uqwUraImcGmloDC6Pmq6dUVy/4jejeaNISVrWzszNcOJZAhXAIzCPw9yvnqrsAiCL3
 JYveuc0Sb0PkyRfyXaBL53FEJ7L+BR/gbO6hLXEmhidI1P8tWS2UKgMD7OJTvCCBjpzqeWpEh6V
 mSiQV8Y49edLBead1WpA38aVu2N3tIwh8rrS8addHrVPi/ctBaIOvY/agly0T3fn37zzTx8aUb/
 6a9OCqOR/dYfrexIzf9knl4aaI8VUDtTNCiQeEGK/0FDuBH10HC+0tg1Wt+g1ou0a0nO9OTkd5N
 Z/fqgNoCyN7k6YTXRnuepjENJON2j5ZJMNKOkl0k+CqcFglQ10e1x/a0hajtUfHzXiZcjJQWRf9
 dBGEvDhC
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68baecdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=9GHC5Obp58ijhVwBxQMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Aw_LXaIIbBhBvaj83D5eGvvi2d7Ipbi4
X-Proofpoint-ORIG-GUID: Aw_LXaIIbBhBvaj83D5eGvvi2d7Ipbi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117

On 9/5/25 2:50 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 08:03:49AM +0100, Srinivas Kandagatla wrote:
>> Sorry for some reason I did not notice this email!.
>>
>> On 8/22/25 12:18 PM, Dmitry Baryshkov wrote:
>>>> + */
>>>> +
>>>> +#ifndef __WCD_COMMON_H__
>>>> +#define __WCD_COMMON_H___
>>>> +
>>>> +#define WCD_MIN_MICBIAS_MV	1000
>>>> +#define WCD_DEF_MICBIAS_MV	1800
>>>> +#define WCD_MAX_MICBIAS_MV	2850
>>> These do not belong to a public header.
>>
>>
>> All the wcd codecs have same MICBIAS circuitry, this is the internal
>> micbias circuit we are talking about here.
>>
>> Actual micbias value comes from device tree, but these are min/max
>> ranges that are supported by all WCD codecs.
>>
>> Why do you think it should not be part of common header?
> 
> Because they are not used by any of the users of the header.
> 
Got it, if the ask it to move it to c file.. that is fine with me.

--srini
>>
>> --srini
>>>
>>>> +#define WCD_MAX_MICBIAS		4
>>>> +
>>>> +struct wcd_common {
>>>> +	struct device *dev;
>>>> +	int max_bias;
>>>> +	u32 micb_mv[WCD_MAX_MICBIAS];
>>>> +	u32 micb_vout[WCD_MAX_MICBIAS];
>>>> +};
>>>> +
>>>> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
>>>> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
>>>> +
>>>> +#endif /* __WCD_COMMON_H___  */
>>
> 


