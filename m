Return-Path: <linux-arm-msm+bounces-83375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11468C88282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF6A3A72FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7801B3126D8;
	Wed, 26 Nov 2025 05:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRP89Zvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHAnGSEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3425347DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135094; cv=none; b=qHBfPHO27BgrkzpNkeYolPAhmafMJuZM6MFjTzPObIbBqrdyeB8K1/akD4b1w5thlbItRzlAe526XpA90h9z0r6Ef/d9DscpuFyx2kYi8XDVdJkj1foptaS/y9ya2NFuAWmWI6pgbwC1m1PbA0S0GVFdg656pSNTibuKRS3Z8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135094; c=relaxed/simple;
	bh=pq08AGFvIrFOBLkqwOno9CpWZWBlKVvaF1cIJeyz39k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TeRANnhWfkTJgwyUc08no6B6Cp7eBOLLg1C+iMge9dvX82vnI9Jypxf1GaKNxFEeSwtmPX1rxwoPV70BPRoYI+lzqZupWQWjsoIKVx52HFgOc5MsA14WUKPgEVQFKPeWIooXM1etOX3iyDQf17u6TRn4T4lEF/PA/ntit9FP/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRP89Zvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHAnGSEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APHAfdB3890204
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=; b=XRP89ZvmLVTV+9ZO
	qujl+jzj/+wtYJa7lAULyRRiIQmNaLSusq/4fgwkQtCG2H+6lM6cI1ST8/GxU6ha
	LOTqO9A0V3bUO+QZ4T8qrteJ7EbmGp7+4oJCfSl4VBRaQzt0gotz5T/BHh8QIKge
	3XSRb4KC/tSGTs93D/vwhnvcOKYWJDBCUhGeWRZlq/Fg0aa035zioebOMEm6s8i+
	P28MeSEecVZ7b141Cl8dHynMEfnsWYYzG681JOb35th9PJfbaRr6REyG0nSICNrf
	2rTltn5QyhoUZo0TYG8kvtQwWD7NJr9/VTeSYIoYNgDxsFrPrN4wvdNiKwQqXbHG
	XhlXSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angme9kxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:31:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297df52c960so159007025ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764135090; x=1764739890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=;
        b=YHAnGSEI3GnwDNM7K/V+0AN98qM0vT5b610KMLLNNg82561tkeF0++dgFfZUBZHTOB
         fDlDn06Y4aGrziJ8m/oz12geGaSiCjtaD2ghBc3+7Qe9ba/A8KLJcE7eB9vtuG4bSp9w
         U7JLv2ofyBmByLiWxvMXuI/XL75ksIPecy3nNCOeo0KRfgGVX5jCXOkdKqV8xMFrtA5R
         4o+D0sNJQhgCJwIoF4FSL2SY0KfEmCf9Cy8HLPR5mjcE0KJSI6hzW6oBvK8FygKRDwmF
         kNskxhoMypCc/H7jqQs98v17C3Iox5NRmOq/uMjWMp9FXRRoNIPQtH5ke3tw5G07gmSJ
         735Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764135090; x=1764739890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz/fYXRZJxgg9b9hF5h78+FliUMrFoNhzYrQ0iWh7Tc=;
        b=a1IzxKhcN4cysRehPTQ3fsM4oNWzg0UHIHEO74WmpIoEN64wOcbNmY9DwEvEjdqQYr
         1pKuMlqaCgP7F86HTBTnw9tR9B5XkETU6bCYcsygfdwyTM6N4RWrbPbtmCAjrvTbjeQ7
         n64F8RISs/cJ7N/64cex+DO+6RjtJi22TeSz0mjlQe2yWqqonZNNS630P9LWRe+fOzfN
         xTX2G1MGurDmozs18SXLjgBDeeYL8R3WUVWXLYNtCMEfd8FoppXhae+qBsy9qdgFoBKZ
         kXW19Ty2NdX4Ngdxl6nRbf7Ehe03Pe+imqGIm1hKCH/onO1GMvVx4tYhNdZhEtaXJFW5
         eOdw==
X-Forwarded-Encrypted: i=1; AJvYcCUhPDFfuzKZFZWGXJgiWdDQSNje3vRQXGOZMgfN3WzDoIGAVxRcw4uOTSHNR9xKdFq4BT1fOKB/T/aD6g/y@vger.kernel.org
X-Gm-Message-State: AOJu0YxHz0rS4elUFyGVAfTCWd3nIMvRyNsr5HQFaVrhmhEmb2XufYGV
	0D8oWBQRLAW4KhJVKElRxfw7s0VVtxk9jc88Uwu1PHMO4++02ydXOoDK5yjuSKq9+TDSWuJvNM4
	nBgxrCf4GOXC18veIcVc7OZOIovDRMsElN7viBS5wExPqGCUNC2hmUTcMZYlXTsVCEvip
X-Gm-Gg: ASbGnctY/HpOhpH1goOIu3BJ9JO3Q0d/w/vKcDQT6tpwKI7lZUlk4clKlZeog5h5HY4
	0PLk6P4MSzVgR3KgImn7E5GNWqPEgf6ArGsu3C230rR+bu/fUwBDQpjJcRoxeDFe0zdFgYgRsd7
	g2zRL0p2pjVL2VrCciYauomQKwbwGgDF+hUK9+tcaMOxwTeAO5ArhhbQMMWKWkIF8DycqwMl7nu
	/IL/EtSTezMqkboVZU4wzSG+gtA+ABUOpJGSmYYa9zaGVxXkRzyhk3MvJd+z9ZPDjPnuHMrKmxD
	EdoZtGaCJR7aGEx/jx1avPDWEaootq3oAqsCZYrPs884l6WIXkOm9DQKe1Lum9H750ezmd7ECLu
	DsCF2370l4XbGnxUZ2GZ/jJof88pMTu1/oBnQhrzRtg==
X-Received: by 2002:a17:903:2ac5:b0:295:9871:81dd with SMTP id d9443c01a7336-29b6bedb625mr184590025ad.25.1764135090420;
        Tue, 25 Nov 2025 21:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU5az0gzS/5N/piHae1Dirr78cTP7cS2wFoPm6L+3htwFnXwqyqtvUhe1OT3gow3iDtPhM+A==
X-Received: by 2002:a17:903:2ac5:b0:295:9871:81dd with SMTP id d9443c01a7336-29b6bedb625mr184589775ad.25.1764135089942;
        Tue, 25 Nov 2025 21:31:29 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm187485025ad.14.2025.11.25.21.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 21:31:29 -0800 (PST)
Message-ID: <791d7bb3-a96a-ed5c-a59c-90cbbd712ffa@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:01:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: venus: assign unique bus_info strings for encoder
 and decoder
Content-Language: en-US
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
 <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
 <aSYdUzpqX38xxywI@trex>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <aSYdUzpqX38xxywI@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=692690b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=jy-4xleNOOuNcfXGUj4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0MyBTYWx0ZWRfX01vUMXLAV16e
 I3omuOLjhRRdDW5xQP5C7E65+3NWK/dQbgZwILLyeotaqX2/MZiotxDo8WcneDTHdXtyw7qQa3s
 0nDfcUAxCimJDK8ghTNex1SId1PZaP9Bh/gGy3TzAib81lQAKD3FRm4WcAqqEvUHC2Rxch3r+0H
 ELTBXQUI/mH3EuSYW3P3kDX4fHPq75bWUjQ73U1wx+bOvUPjJHEbG0cFb4Olh/tB4cj6sTT3ZSW
 ZttTwUPgtWPIvE8ezSzkRDQETmO/How7D0jxqtsCNNoaUOGMFr/exbV9aPooedUX/n7142aGPDk
 Sju7d8qrRax1HWADdiKrbpHHbUITG0ZyQLUVQg7+r1MQYzCQF9y3IQa/0FB299V31hwjY/rdTeY
 +7aG5Ecpnpk/PpS1o9cJpYb48bwdMg==
X-Proofpoint-GUID: G3nwcAIUaSd-g65UCJdn-InKTJQqlpbV
X-Proofpoint-ORIG-GUID: G3nwcAIUaSd-g65UCJdn-InKTJQqlpbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260043



On 11/26/2025 2:49 AM, Jorge Ramirez wrote:
> On 25/11/25 18:39:14, Dikshita Agarwal wrote:
>>
>>
>> On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
>>> On 25/11/25 13:59:56, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
>>>>> The Venus encoder and decoder video devices currently report the same
>>>>> bus_info string ("platform:qcom-venus").
>>>>>
>>>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>>>> parent device name. With this change v4l2-ctl will display two separate
>>>>> logical devices
>>>>>
>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>>>>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>>>>>  2 files changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>>>> index 4a6641fdffcf..63f6ae1ff6ac 100644
>>>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>>>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>>>>>  static int
>>>>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>>>  {
>>>>> +	struct venus_inst *inst = to_inst(file);
>>>>> +	struct venus_core *core = inst->core;
>>>>> +
>>>>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>>>>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>>>>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
>>>>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
>>>>> +		 "platform:%s:dec", dev_name(core->dev));
>>>>
>>>> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
>>>> The second call to snprintf() seems to overwrite the value set by
>>>> strscpy(), making the first assignment redundant. Would it be cleaner to
>>>> remove the strscpy() line and rely solely on snprintf()?
>>>
>>> argh, my bad, you are right. will fix.
>>>
>>> perhaps we should just have instead
>>>
>>> decoder:
>>> strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
>>>
>>> encoder:
>>> strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
>>>
>>> I suppose the additional info provided by the dev_name is not really
>>> important to consumers.
>>
>> In-fact, we don't even need to fill the bus_info, received a similar
>> comment on iris [1]
>> [1]:
>> https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/
> 
> 
> Nope, that is wrong. 
> 
> if we dont fill bus_info we will end up with the following again:
> 
> root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
> Qualcomm Venus video encoder (platform:5a00000.video-codec):
> 	 /dev/video0
> 	 /dev/video1  
> 
> instead of something like this:
> 
> root@qrb2210-rb1-core-kit:~# v4l2-ctl --list-devices
> Qualcomm Venus video decoder (platform:qcom-venus_dec):
> 	 /dev/video1
> 
> Qualcomm Venus video encoder (platform:qcom-venus_enc):
> 	 /dev/video0

Got it.

Thanks,
Dikshita

