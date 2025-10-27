Return-Path: <linux-arm-msm+bounces-78925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5BC0E24B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 073404FD6B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84D2F6171;
	Mon, 27 Oct 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWTMpixT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A252D9493
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572404; cv=none; b=EXDRYsKBtFpGtUB+oCGaHxsPOV81dhoXATSDTH+3mEYbdX8iDxKyr29e1Kuz9ojuY6eLpesZEmOqKWGmvc/yTWD/+MKy5/whaPs3sFi7+D1y9pN1UW9WMI2hrhPN5IPxW7hBYyI0T7VECYaqKAHRl9jNNLzwb9HVJoe4rp0tSrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572404; c=relaxed/simple;
	bh=Pan58HdaZnnEEiGAcmHIdbRZg+I4SnaG0hhYc9UnT+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJ9icqJUR344X0TDai1aaKn20JxaHhY/Uc89SymRdkw5atFJXq7ZlxoW1+2Mfh1DpQyRJLLoK1+t4hAiwlG5Rr5UEA7eNPK7yaBnRfWLqFwmGKcrorD9DZfqCkdmWGViHxfwdQKpNwEzvwUmQuTy+g36U1T3faNYk9mpEchIHxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWTMpixT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBJhvV2546712
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/wh/2HoBaFbH9FEa4gy1Lf/s3pngC27Kp5NLQ8Yhhg=; b=JWTMpixTNuQLjt9M
	gArB6ZUURQWDVPGISvI6dzysGxKrnytIsSsteQ8oJpmU8KIN1vcLCKW8a/8JXGE3
	kcrFwyokSf8KqfcwmDQLxxKlj3MA7FPVt06SqwN4Co/kOUuV7mXM8T8w+BMmooZn
	dFV54ZLlqyBLo5ekywKi/RSnyX6EC0tO6RKR4Ih0NK8c/KxiyAhmZFfAYrF6Pp11
	tQc3AVpVrzOb3uJsSiJh0pfSBLPqgKbNOMA/ABvqJzCrFXPKy7pErWoKVaNYoAuY
	Avl//qcb1NahgluqVg5m90grqk9sQc+s8CIaR3bFXCb8oP2C1zT1T64XNkfDwQir
	Em19uA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2gc2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:39:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33fc9b69218so1063637a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572398; x=1762177198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/wh/2HoBaFbH9FEa4gy1Lf/s3pngC27Kp5NLQ8Yhhg=;
        b=j/tUJCgLawtJ0wQFNUguvcE3qiP3XHw+tlNTodoVojsrPb8l30GoKTcOKH5mtSlc/r
         xqljTa1PLgMiaty3ymQ4hnbZnhHEFzw0dhShhX6JfJ47NM9K7S2e72v5YR2dGYq5FIxt
         h8EajoOiqYdwjzbxvFmzCB3WeU4zg5lOcB08GFnYZ8/YPAfQXNAVwl+JV9PWHqD3YrBY
         UoIqGPEkVdUQRt/uAIbIs8yw72X1aGT6QW64a3dkfdLEr0PJt34e12qEEmVgfEN/ZUrl
         3R4bvab6AS+79/RBVyAJCTjhxahFFuQVENQXHs5oDGrMCyz+1/YFk47d92cFggLw3VWI
         cMTg==
X-Forwarded-Encrypted: i=1; AJvYcCVsdQ/i7FLI7rjQrkZggBLzuwMkcezqt6GMip9xPGC8YFoJyicOAtfP6/+b7ijTpDLX5cPgnWny1gdwYcPk@vger.kernel.org
X-Gm-Message-State: AOJu0YxTypNJmycOSixEb3T98TzkEpSHS3Xtaeouwo1m+fB0LSwycREa
	6MwLFWioqaNRvsQ1RZ4uRBQ7LWtrmEL22LZ9e9wfNwvuXAdNkGfWsD2yAV0Ja4XnVo5bzNLrStH
	+mrjKmp24vYUGNwSYOy5YFQWl9Lzvsn46R/WUppp8BoMGCERXnQeRNysu5nXqXga8v8wR
X-Gm-Gg: ASbGncvnYkySU5ApYeKJ/Lmm66MZhb0/xwcdUX/ENPnxemX65uA2JJYsIFf2D7MQuc0
	p6l/KDtHxSkGR4qB8AZHOrnKz6mEuMjnRFlHoIa0YzXdM+cC7YtH3iyjmJ3BoiIgg7Ws4GTi/Fo
	U9DHAFAF5bPF8ffPx/x9OJr7NIOV13oqHQihvBhOz243JzRfnr3cgJO3kbw198D8JAuOI6lMUsr
	u/rS3ukN9dDVX4R0StK7xNwNYzgR5UyKjOH6MsTudKuycLnWFz4H6mrvuTmxDq0WTv7G/aRB5EF
	e/vBi0A30oGbzs186Yk2M+A0PaXUtfCkCWBn/6glT2L6g4HzxYYws9mn+A8fOSXLNEoUM7DZ6C/
	QhCnKDYC5VHlq2Ag3WDJTO+4cwu1vA/AhFr6OCsmuX9U0DdhevYR3LmEf
X-Received: by 2002:a05:620a:2909:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8a48825c3b4mr194436085a.4.1761571754629;
        Mon, 27 Oct 2025 06:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsEwa9PZeblZrs6FSKYXdUAU4qmJqpMUY/0ozBx6tLeFeVJzgObhyAchh3D21rn6rwzttaNQ==
X-Received: by 2002:a05:620a:2909:b0:8a4:8825:bc6c with SMTP id af79cd13be357-8a48825c3b4mr194434485a.4.1761571754058;
        Mon, 27 Oct 2025 06:29:14 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d3c29sm20007091fa.37.2025.10.27.06.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:29:12 -0700 (PDT)
Message-ID: <18e8d5db-e32a-4893-9d1f-5003670cedeb@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:29:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
 <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
 <cb361d77-6845-45c9-b418-67649880495e@oss.qualcomm.com>
 <ef247fe6-6d9c-4a74-b3f8-a56857332758@oss.qualcomm.com>
 <9a227c15-dc60-4086-8d81-f80e3398a083@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a227c15-dc60-4086-8d81-f80e3398a083@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pv53WxA6eTcwrVuVcVFraTncjGbHgfiM
X-Proofpoint-GUID: Pv53WxA6eTcwrVuVcVFraTncjGbHgfiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNyBTYWx0ZWRfX4Q3oVaAHrXjS
 +SPFJbd2aqYK/FbJsHQPF8FQ/QN1pRVIH9UBt094lXeq0AyLWC3D2JedWnLYxg5Yq0gmcMKQxb9
 WWyVMaalYbqOwXgqD5hUw/BqTPfouW1p2nt8cbFbRNqcviWEyPwUXG5HcLmmXlxtVVHZtFQQsWT
 DujpfFfJ9/gubfiNf9z4hrWlAXhTp61desmDA//yP1S+Z6d2IbjQlnkvV/5DjuzIA3GWmFmrYg4
 EnuHbvKieIkcB+90qt6WYW6Y8f+d/gIzmpecHpGNQYIK5GUOXjy0kGHdvd+vGkLLWmcnOcnd8Vw
 2jKw94tsJ9t0+pEe9VzAv1EKBreM4Hq5wNeOXsnRj1wrFy8HI3tbywfQf5vyTpmqd6+OBU2/DZx
 VQCEZ7VSyJr5w3l/B7JJfvt+RcgwXA==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ff762e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YAA2XIu200uozTIaui8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270127

On 10/23/25 11:46 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 10/23/2025 2:39 PM, Konrad Dybcio wrote:
>> On 10/23/25 10:57 AM, Maulik Shah (mkshah) wrote:
>>>
>>>
>>> On 10/23/2025 1:47 PM, Konrad Dybcio wrote:
>>>> On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
>>>>>
>>>>>
>>>>> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
>>>>>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>>>>>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>>>>>
>>>>>>> All rpmh_*() APIs so far have supported placing votes for various
>>>>>>> resource settings but the H/W also have option to read resource
>>>>>>> settings.
>>>>>>>
>>>>>>> This change adds a new rpmh_read() API to allow clients
>>>>>>> to read back resource setting from H/W. This will be useful for
>>>>>>> clients like regulators, which currently don't have a way to know
>>>>>>> the settings applied during bootloader stage.
>>>>>>>
>>>>>>
>>>>>> Allow me to express my disappointment over the fact that you sat on this
>>>>>> for 7 years!
>>>>>
>>>>> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
>>>>> Read support was eventually removed from downstream driver too for the same reason.
>>>>> There were early discussions to remove read support from RSC H/W, due to lack of users.
>>>>> Its not realized yet and all SoCs still supports read.
>>>>
>>>> Can we read BCM states from HLOS this way too?
>>>
>>> Yes, Any of ARC/BCM/VRM can be read to get HLOS/DRV2 votes.
>>
>> Wow this is amazing..
>>
>> Do you have code for this already, or should I hack on it?
> 
> No, it won't be of much help, as i said above it gets HLOS/DRV2 votes only for a given resource.
> More specifically, the read does not give the aggregated vote result across all the DRVs.

Hm, perhaps it could still be of *some* use

But maybe reading back rpmhpd and rpmhcc states would be of more
use!

Konrad

