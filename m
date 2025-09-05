Return-Path: <linux-arm-msm+bounces-72349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C78B45E98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 675F27B5ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F99613D521;
	Fri,  5 Sep 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdAciHQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B878306B2B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090873; cv=none; b=EH+lkFEr9fCaurlrZ879gK5ivAdtOT0dE+bw9RynBbylYXopLFQ495sreQLib4hRhobxU0yHE5/TkgxV2MJnYCBQkjH4+Lz+B1D6L5OP933W9XaR1VORy1kcb9O/7uwfR+xukHggZGGl1RIH4WepYeCOn0mOeMpNDqfvO3/B1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090873; c=relaxed/simple;
	bh=TkfY89RKRXEALwgB2aNVJLpg692JYnKY4FfUhrmhjUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0Dfb5G+oG8ukb545U7A0rzBsA8ELrgOxGVLTz0Ownxjpbp3bq+1XC5vkjFDvGHnxjWWVd/aDIEpbchlMCoT/ym6LhLhThrowW3Lv0+Q+m1xyOlnSO6izrIpbY1Z1BiyG594VLHKWPgFIGIXojqSSO6uKuomA2xJI2kHe03LX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdAciHQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5859wQci004158
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUdgNg/39urdaUGy5tuNL+v9wjA5hMimn7UR8IzRX/Q=; b=PdAciHQ2LJAlN3lz
	mhfyemdXnUhAmCxtsYv54lZFu/YK+QqDMz9kGCQys1dPqVHD/b2muwcqnzvC4RaO
	nkW0KBEzjPRZ7o8UL/I/qrEQCG4soGkbi6y3GUpCev3WtEY//5mc32yEInyBXeFe
	hcjDPgfoaHE/j92vUC1xCyRznE7QMlR/3VDlzq/dsowpB4D0/Ojf6phUR90hGkSy
	q/1w+aQ0L5hGwBSU4E7SFZEiZq++32A/Ys+XvNs0A+Kzi48Vs11OCKA8+ZTeDHyg
	WV0KqaxhM/YrHWwFqbkZfYeJ/KjBl1/E+b8intGJlkacHB1gEEhBcm6hI/9ENAWx
	47RKIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ev15m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:47:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-718c2590e94so65199206d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090865; x=1757695665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUdgNg/39urdaUGy5tuNL+v9wjA5hMimn7UR8IzRX/Q=;
        b=vsFp89T/rVEpA9i50bLiiWOrO/fUyqVd/Qs6dijSUeIW72tMhF+Evp6VFIBexmcgwf
         WxYd16/1nsk/3J9wwrP+kN9K3aVBDqhv6ZYfeRVac+npYrYPoDdLsqLVDrKHXu6lllcr
         1OJX+nVgjmG56dqkDhm6j3yvTRRqTzWkQwlP/sXuxrUeGc2KU3dJtMuqtlhr4zjcvBh8
         Wxuo5G4djf9SsWZajM0LQ/TnllMGdcTuz+FT2EgV7hQcZYMQclPZMr1LksX93pIeYK/y
         vxhhVyp9WOoEo0J+xyt247VWf/ybdNZdJCx1RtSF5TaDMOp/H/7av25Bb0YEXlUrnZ/h
         V3lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK+0Uds7Si+nqLwNQqZ8K5OHhtGiSzbB9xDuU94w06JG3VKyRZq9kZI5h8xaJlR1WS78I3FLwN/bfLKZtH@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqhyMlRurkUnVnlN5I6fv6YqbdqKItgz3bPvK+L+VW5au8www
	jOmDjOVYQ2I3GvYrOWKrzmWWjj2T3ryZZAr8zbYwJmMtRPlEVVHoSYiWrT50HPDf5FbgG4S6zju
	jLB5PSm4vB7fTHpbt9jzioZv0Az+DqcAkhg2PHgAM5Yi1DoBUxnmgeRaYTvQgcPCqCPLW
X-Gm-Gg: ASbGncvu8j1SLmVA+ze8PlUQGZacJ7Ed++KP3viQVWNHrYoTZ9PI1zT1gTRLp6T7cgv
	0WvFjNEkPYqn3Q6miDG9wuHc/myXItr1as02rRZag3qFA5rt/kurfu7EPFOfihkwYe7gF61lmCp
	jts/BFmHHud4YZU1ZTS8jEloBx1hEjt1QAhlUxrwbYyJXr3bM5qAS6Sd4QbyJlWokfr0r5u5lD2
	82B4Do5dkfT4GK5v4TTZ3bDK5IS8k7vlwGYb5kMOu+KUWwDMDt2GFOn+8MJQzkrhwxHCM5tFtrJ
	zbAipv1LznlsJtGcFu3Gk8pW5VzJCoWhUwhKFmaTG20UaqpKBVwUqVXZkZXDJlENP/I=
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr43965596d6.9.1757090864940;
        Fri, 05 Sep 2025 09:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ8+8+MxEUmtiGkpVpKbOO3CIojnpVHP4pNFKV12I5SozNXXmspK50f6RKTZrWEioefG8OdQ==
X-Received: by 2002:ad4:5fc5:0:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-72bbf3fb0b1mr43965196d6.9.1757090864286;
        Fri, 05 Sep 2025 09:47:44 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d66b013b7dsm20987137f8f.28.2025.09.05.09.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 09:47:43 -0700 (PDT)
Message-ID: <08afe342-e108-4f0c-9903-fb4df4eb860e@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 17:47:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] ASoC: codecs: wcd937x: set the comp soundwire
 port correctly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
        Stable@vger.kernel.org
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-2-srinivas.kandagatla@oss.qualcomm.com>
 <as3wxoths3rgy2qpbqwyys6zydhjo3lbueu7ibrwbinxt3sffw@wyprroihsjs7>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <as3wxoths3rgy2qpbqwyys6zydhjo3lbueu7ibrwbinxt3sffw@wyprroihsjs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w-zsTgPdagLwiKv0LTK_XKZul2zMfT-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX4rkbQTMfKuIK
 E1qdqcsFAWtSHzGXWACYA+EkdsFhQJS3VwbHIJUivit3oe/9uPONsYVA0x7ts3bk7EaKVQfSBHe
 X5A1mdcDmnW4EuxIl5lTwDzXYwrrDRSKcdkDRr9l5PTXkVg0iVT5ZkwC3Zl/5zdUPu1+fEAJWGm
 rPc1+iwhWV/KmX1c7OumqzvhzBTCslNRp7pBY7r/kqxelDN5m9EotXXf7g9DoV1b5yITYZ/W/uc
 bdJgFRkISAEYXqQaCZPiqUkAwbDF/g/ZmEoTQ6sTnp6TcKAuOJxxIklriPhm6JeePg1PeTWhQGB
 OtJ2eMby+aDBtNLjWH/1qzWI4Eti3L5MiCCdFkDPk0sE7GCDgP0B1TvzRsf0jiM1KeYCVJJweMA
 8EW3sZbx
X-Proofpoint-ORIG-GUID: w-zsTgPdagLwiKv0LTK_XKZul2zMfT-D
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68bb1432 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OWw5mONqTAKyzQI3keYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On 9/5/25 5:14 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 05, 2025 at 04:44:19PM +0100, Srinivas Kandagatla wrote:
>> For some reason we endup with setting soundwire port for
>> HPHL_COMP and HPHR_COMP as zero, this can potentially result
>> in a memory corruption due to accessing and setting -1 th element of
>> port_map array.
> 
> Nit: if passing 0 here might result in a memory corrution, then
> corresponding code should be fixed to warn loudly and ignore that 0.

Agreed, This is something that should be fixed at source am on it.

--srini

> 
>>
>> Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
>> Cc: <Stable@vger.kernel.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/codecs/wcd937x.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
>> index 3b0a8cc314e0..de2dff3c56d3 100644
>> --- a/sound/soc/codecs/wcd937x.c
>> +++ b/sound/soc/codecs/wcd937x.c
>> @@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
>>  	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
>>  		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
>>  
>> -	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
>> +	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
>>  		       wcd937x_get_compander, wcd937x_set_compander),
>> -	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
>> +	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
>>  		       wcd937x_get_compander, wcd937x_set_compander),
>>  
>>  	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),
>> -- 
>> 2.50.0
>>
> 


