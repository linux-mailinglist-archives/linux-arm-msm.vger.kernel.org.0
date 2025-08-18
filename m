Return-Path: <linux-arm-msm+bounces-69557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B0B2A1B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09BF11B263AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616E93203B0;
	Mon, 18 Aug 2025 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIMQIsKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B43203A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520057; cv=none; b=unW8+OZ5yGo4G9qIUCx+HYKzu15unbFnov0AdK1vXAGgrObZgGRW82KKrTLXCY3vIOE+Z7teCi286Oio+SbfiTHyEQSNiDlhULSU/IJkC0Ds3pCFP0P/OLDkAkW629dLW37wTmYlm77t3wRraO4c2nYMzJ+ArAdjVECUhTLRVbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520057; c=relaxed/simple;
	bh=nvR7xcOajIqcXGDD5teNd3zXhGzUeZ4squpuA/i5ois=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4VO5BOBo5R8e939pJ1W63HI5ll9l9sRmPlbEKhDQiyVvJpLi4B/bIHEB9SguA4P8jYirjTkUpzwStIA1kIcNJfWjVo1tvaY/NNhCIcuX33asJqNeCwVfM0gCVtiH6mb8DGPaMUoXDUoPo9BXbRtNStEfLfN5zXti+uFapnEsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIMQIsKp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8UmcE026299
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMPy8yrkDmCb5asvMqXUa+Y8wrsQZ53xq8R+umEMsHo=; b=WIMQIsKpv9GfAm5I
	ev3oeWosKVrnDa/6A03vLd/3mYs37tOJjR5sXHXUhq2MR/IvotYdBIzmOGHIWV1P
	RG2HOLA4QJCxKrCZEeVY0IlYl1Ii+wAIVevPA+u9b8AKHKaraIBDY03+Kn4eCjYg
	dqwh34Qdjb+U0rBywOm6aAnQmzT5v3S2OF81VSIiHthtXgK6xhEZjsGwv4O65sPS
	KUucP+XimOiXo+cYkbGStcdQiSub2Ug4sb0oy8C2Toug9wu3OBhV4Jcag8UXnTJq
	qYA45M/YQak4Dv+c5ga56fRQec/DQ9dAGLG9bMMY5RUIddqxfjjlPrqwKvjaQS6c
	85PxfA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvmey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:27:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a928da763so99343166d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520054; x=1756124854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMPy8yrkDmCb5asvMqXUa+Y8wrsQZ53xq8R+umEMsHo=;
        b=uzQ6ip75akn6G9YW4r68dx7apl4PlpTsjXtxTLVjm5GJ3A68SR1ATSpmlEvvFzrdsO
         AtKHgafbrezP/vCH+YhfLCOblhd/MkGnoVu6f1u9ARxY51Bd6iPeZo7ttZ1KJoB9H3nh
         QxO0tGEf3JgxdzMRg29/TE2LK+oMkjWnByQZq+qHn1OVmujbqYOUB0lqG74q+fPWamhr
         7WPhm3vctUBt9u0Bl+9HaoernPDZylutkbmHXQKysZsdPRxXjxjeD+GhTj9EKv9vlYJS
         +1lBQUZX4y2c2JI0ytI4ctUX04ilHGyQGvudAYwC2UNtYKYW4zMPb4a9yGv/Nbj/KFfj
         G0UA==
X-Forwarded-Encrypted: i=1; AJvYcCULVksVmqJ5kmE4cZIFOvSHoBYI/vqmEdWgxc+QAvz3UmvCxJGVcGfRcnCoriwWmzHTi2MNsO74sJA+kpAW@vger.kernel.org
X-Gm-Message-State: AOJu0YzfD+ry6uhd9pCfRHS2YairXFdVswfeFtz9FLs/LzitHOiezoD3
	JKU6XMSMrfllc9yFIVY+QIv6Qr9p2eQkHJ1P7jKPjIug+g4sLU3a2hvfW/hXoBTC1gA6IVijiuQ
	PYkpN3zldIp49XlE5u8kginvjiT7VsAeqkXA/FKZuF6+577uzWOdGbpA3J/Uzr99xOUdp
X-Gm-Gg: ASbGncvYzxtgb8IPT1BMsGbQhCvW/MnNlrw6XAdVKMYxJzALKISSwpdhZmofZ8Oc+9L
	FzKggr69oEED/ZhPoMh79UvjVjQczBuErAi736j92F/NM7riuQ3y2Y18hKxTJyuVlAPRvU1Z9Eg
	wDkboLi5ydtKmRuQbJwNpyADHszk6K5QdTWc5bQVNUyTSyVE0RWhZliHmpQTK1PcIzM4xe+G1Mg
	zX2pmdUqn6FmTSWZyYCwnXzTOT36U4MuYEM1YVhb9fdXijItG56u77avxBfGAyupwFUFNbOtgB/
	kID/Kozb4dnm6wbHK7PmLP45cKuF/IjAR80GHchzu68bERg5ob9bdhhWLAi7g0y6KrE=
X-Received: by 2002:a05:6214:226d:b0:709:e54b:2633 with SMTP id 6a1803df08f44-70ba7cc55d1mr157153356d6.50.1755520053621;
        Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU7b2CpB2bLhXFIhOwMNDjmxVMc3MEJKn8wBDlF5tVrAmW41yFTSrE4nmNJj6aGmyyhUfOg==
X-Received: by 2002:a05:6214:226d:b0:709:e54b:2633 with SMTP id 6a1803df08f44-70ba7cc55d1mr157153026d6.50.1755520053055;
        Mon, 18 Aug 2025 05:27:33 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6be103sm180437045e9.2.2025.08.18.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:27:32 -0700 (PDT)
Message-ID: <7e26efeb-d499-4f58-b42c-dd37c2f680a8@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:27:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250818122240.1223535-5-srinivas.kandagatla@oss.qualcomm.com>
 <6e0d3bbc-bc30-4ae0-8258-8dd19f7f29d4@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6e0d3bbc-bc30-4ae0-8258-8dd19f7f29d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dHFjpiY5XsmOXJ0AnehJl3keCKM8SgwL
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a31c37 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GFBRK3qK-iERJEzU3l4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX2zamD+rE0tcm
 Alf77GwrvC87q8InTtMHVTLpZV4xlvI8loU4EZ/3DtJGXofhJdjG4CnbYR+dv2DUv3+6kHc6anr
 CowlOXnXVxpSFWuBgNUFAe2SJVfL/+CVY+C1AL3ty3In8ELv2dGoF0W/6TI3YrNKMvI7RnmmCLv
 R4BhnXOs01TmzKYd/7z+HMsev4J059UxJLk4YLpVHHR2FX7KqFaeq/XkfNDxDM1Jdb6GIyG/ApA
 UZzQL0Ak9JAjHMaztt9f2z62xb2t5taRvGyIL1N2Iii/hfL0hzuQ6dKbPbUcNERtaR1HJa5tr4u
 3oaUJcrLqJDerTRK5tec5IAHob/VQEMUj49dwEQ8ReINJ7pnfvWif3zGY0/PPDtdQL2foWVJcTG
 yahApfsr
X-Proofpoint-ORIG-GUID: dHFjpiY5XsmOXJ0AnehJl3keCKM8SgwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

On 8/18/25 1:25 PM, Krzysztof Kozlowski wrote:
> On 18/08/2025 14:22, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Fix spelling mistakes in I2S_INTF_TYPE defines.
>>
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 617bda051cf8..512886042224 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -27,6 +27,7 @@ struct q6apm_graph;
>>  #define MODULE_ID_DATA_LOGGING		0x0700101A
>>  #define MODULE_ID_AAC_DEC		0x0700101F
>>  #define MODULE_ID_FLAC_DEC		0x0700102F
>> +#define MODULE_ID_SMECNS_V2		0x07001031
> 
> 
> I think two patches got inter-mixed.
Ouch... that is true

--srini

> 
> Best regards,
> Krzysztof


