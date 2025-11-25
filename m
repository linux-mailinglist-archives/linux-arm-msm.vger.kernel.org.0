Return-Path: <linux-arm-msm+bounces-83250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01307C8520A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3AD03B1B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F929321F42;
	Tue, 25 Nov 2025 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhwrwdnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jR0WUDwa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAAB320CC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076163; cv=none; b=S+iaVTb4t5tW9JarDKRTfUr4hlmsRk0TU+xl1zY9CFGs7ssX0mWznq7U4FaFxNTSGZ7KGSYdgHHtd5FORu4vlhsS9yUBmyTjbtUGoajVHjPZZ3e6++C5cxRJvxkVZ9zFRbyC0iTbjpuwoO0jLOF1AUBX2jDGOAqtieM/6zkLKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076163; c=relaxed/simple;
	bh=E+cx4YIlZDTE5ranL+JGZLoHRziPh06lGjk3sOE5rIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfL+2I5vwIrFk3/15rWSu7ncVkeauLSsi4ez7ajLjkf8pbEF/xX+2IkScws59V8TKzqit+dN7OTYGnmvc3WW7LCOyTuYHO1g6CWalLfhjJZD0wYM+xucBg8qh3EaoyLn/cGG+HvcScps2wGlDnlHFY+NcwO0qXZU+IB8pPMNJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhwrwdnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jR0WUDwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP92r8n2655354
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=; b=UhwrwdnXpKZJ7Y6V
	bCvytmpFwxctRpBFfqV7Qz3f888WfGB5Pv1/GyhgMa80BHqnkVOY8YHg0WxEZkQV
	X0l5wOB1XmfCoV6RaKAO1RLLK3oTTZWnl8XpCqpWcWZ5XYKDa7ilxxsGa2FkTgsi
	zX+UzSJlwexEJbsMj4Y0ucSDoOSrdm+DgszXL8Ja38zT2qQrNPZlz0auW3TdcsxN
	amszbPzb/MBpPeOgFl4zjX92APHWizIFef3oWRUAm/jPUXd8UIzy8vtdnFnkBVPk
	XEduQCRQZRR+NZS6S0HH3K6bKPZhDebA2qJMuCm4Pel4MJHG6mZHJSrMrhtCuAob
	ScPkTA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxrref-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:09:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so17245380b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764076160; x=1764680960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=;
        b=jR0WUDwa/MX6fOCj7QoWCS58D+/h/iwGadvZ7UIZGLLeEjFK9Qz+hMC+cOnY9RDjyU
         BBW7I6+TUbVDkilv7RWBPq4M9akLzKUEtIw3aDqhwJ/uMMKvYZAwu5Z4DXGHcXKztgPH
         kj/82vu5ZaaxQ3apsQuG+YbRrT+ctv6M6OtRHsAx4ZjaJQQJ0Y3aYd91TQ6nYPKIA6yL
         qa4c4ufofy3f724nsAveksmuuYEsMQdFy++D2YxU6MGRnoWX5bOpiLxDqI+ef3pbKwX2
         UBpVcVBXxLusyRx2nZLawe4BtHOsQ6LONPqw+Joq+OOsW0p6PQVkQ7HnxnJ7QszBcVfe
         Y0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076160; x=1764680960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYGxtqapSZXIZO2DUW75eRhcur6TpqVwVTgyc7wCOus=;
        b=k/d+WiSiIAGpAssdG1ln6rgjQI5f3ha+G3ygnrHhGM0qbDqJ9bGAgXYszIlv5bI4Wj
         sR7VCb58p4NXlRwlSZ9fR4NiraZOy4zPWb/VyhbcHjxxd99k7j+367e6B1Oam/SYxU3/
         GYUdaOySqieutvO4CiLQzkoavKG0r0TpKCA9MKEoTEWV1Xu4HLJW3CNwtGgtsWk/hoLd
         +fCdut1suaZ9AGBSaZ81PNVn2FKGt9T85x6wvjcDMvm+Y1mvpMwnV5ErHQz050ZRcOyv
         2FL/wNU21B4PepDrNVQUufJDc/46oxBY5y0ZaOLy9mOg+x/nuPcU5tCex0gLw5gOUwKY
         k1NA==
X-Forwarded-Encrypted: i=1; AJvYcCVElURNs3gqQSksh7BUGD9Dh4xrRkRLTuB5SYFNqiDfEAd9b5x1/Jnu8rwGIYt0mkS3+mgcvRaOLTe4BCFz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3zuV/7MHU/VsHFyo1mofB/7x1/sn7+DWwWawJtr+YvHyUmPy
	4a1AGeEX7cuvpVkGRkhdyHPFXO8/DZiW7a2ZiecT80qS6QGjIGEV9MiOaGxBFAv+HPFTkRJwlo4
	Qg5fLAwRI6d56kewYtBXsqeEFBqSCWMsxe0wwp17MIYNgM1LM4QG8q28d+rcJQnQnILbo
X-Gm-Gg: ASbGncsNcWI7/WJn0RCYTu7ctFeqkOZR9YxhQDj2gde3AGkCCCVu0xHuoZuQreIJh6g
	1RU9ZYZRDr7kB4+QsLhdWP4/zGKxMFr3da+tKJtwxX3ozBX1lRDRjQxjviU38LQLKpCqAi6q+7K
	QpnVYk5p4Z8qRHmFrrZ1fIGCCFaQN0c1G5HMTdgQBvknOYHVZv4Qw2lp8rw0EjxZbHSQnwEFpnM
	FXFjxUyqtguTMjH1Us4myMANZQSO9JUckZMrx/1RxHsMMl8b9L/mKaaamcmXiRMTGYh/XwZ0/Fv
	OIA6Rzd7gpRETFfF3Sins9l3ZBjEXaCXsb0sK1GzydhEVU1hHEG1EppJmsQrFClKaOqiSTuj74O
	2xY1TYkv54FfP9XKw1jfNQzIgORKiiAe4bwe3bfXkrg==
X-Received: by 2002:a05:6a00:181c:b0:7ad:c017:171e with SMTP id d2e1a72fcca58-7ca877f7d1fmr3282334b3a.2.1764076159693;
        Tue, 25 Nov 2025 05:09:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvd7ZftKwTZuop1VYd2YmbO9mLAwUD0VSNo05pm4Qka3y82OC6qyVCz4qTVUK3FYLPrVVtpQ==
X-Received: by 2002:a05:6a00:181c:b0:7ad:c017:171e with SMTP id d2e1a72fcca58-7ca877f7d1fmr3282298b3a.2.1764076159157;
        Tue, 25 Nov 2025 05:09:19 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7d2sm17704749b3a.40.2025.11.25.05.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 05:09:18 -0800 (PST)
Message-ID: <35d86818-8b50-1c0e-40a0-5f80c4b24a32@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 18:39:14 +0530
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
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121184306.218169-1-jorge.ramirez@oss.qualcomm.com>
 <e409f318-cd50-5a7d-7f46-a928ea544597@oss.qualcomm.com>
 <aSWmeZHmeUWs1NwY@trex>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <aSWmeZHmeUWs1NwY@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwOCBTYWx0ZWRfX23H3fbxZf7cG
 WhTf2z6oKn8Lb/A87STXPnCHr2uAyTdMWifwY3CUR086s0p1hpngs6Fc4AmCjZGctfR1yRNKlBw
 JXkUSUg1mGUmOtc16SQlDl4Oc7MlYtDj8a3eTkmgMP8cYvMo6Cp8aL2d9MiCc7BV0WeWvUJpq66
 /UjaWpGCzkr/vfW2QyrI3RQkHrq3Wn5nm9zwc7dFxiZkD/TXZSTxJeWcavlFPYE7J8FliX850qO
 Lpe1VNX/3JNd/GlafrDBt7arPXIOC8bVdm+X5X0pyoU7ukQdVheN0pmm1IavXvfaOs5Yq+Kzqz1
 zI+lzbDUfy2/cVOcXc3S/DpWSaPWdvvF9/z3H35NC57LP2Ad3ikE0Cz3mJ0kw/CxEEk2pcL+80i
 oaicxKNyGp+1PJdPrK347zMvt4yDfw==
X-Proofpoint-GUID: 9VmJJNge8c-JVMYAt0GG4mJqrxvDC08d
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=6925aa80 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=EUspDBNiAAAA:8
 a=N3h5R79uZq5wuEpuAqEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9VmJJNge8c-JVMYAt0GG4mJqrxvDC08d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250108



On 11/25/2025 6:22 PM, Jorge Ramirez wrote:
> On 25/11/25 13:59:56, Dikshita Agarwal wrote:
>>
>>
>> On 11/22/2025 12:13 AM, Jorge Ramirez-Ortiz wrote:
>>> The Venus encoder and decoder video devices currently report the same
>>> bus_info string ("platform:qcom-venus").
>>>
>>> Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
>>> parent device name. With this change v4l2-ctl will display two separate
>>> logical devices
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/vdec.c | 5 +++++
>>>  drivers/media/platform/qcom/venus/venc.c | 5 +++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>> index 4a6641fdffcf..63f6ae1ff6ac 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -433,9 +433,14 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>>>  static int
>>>  vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>  {
>>> +	struct venus_inst *inst = to_inst(file);
>>> +	struct venus_core *core = inst->core;
>>> +
>>>  	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
>>>  	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
>>>  	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
>>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
>>> +		 "platform:%s:dec", dev_name(core->dev));
>>
>> Is there a reason to keep both strscpy() and snprintf() for cap->bus_info?
>> The second call to snprintf() seems to overwrite the value set by
>> strscpy(), making the first assignment redundant. Would it be cleaner to
>> remove the strscpy() line and rely solely on snprintf()?
> 
> argh, my bad, you are right. will fix.
> 
> perhaps we should just have instead
> 
> decoder:
> strscpy(cap->bus_info,"platform:qcom-venus-dec", sizeof(cap->bus_info));
> 
> encoder:
> strscpy(cap->bus_info, "platform:qcom-venus-enc",sizeof(cap->bus_info)); on the encoder
> 
> I suppose the additional info provided by the dev_name is not really
> important to consumers.

In-fact, we don't even need to fill the bus_info, received a similar
comment on iris [1]
[1]:
https://lore.kernel.org/linux-media/c4350128-a05c-47af-a7e7-2810171cd311@xs4all.nl/


Thanks,
Dikshita
> 
> ?
> 

