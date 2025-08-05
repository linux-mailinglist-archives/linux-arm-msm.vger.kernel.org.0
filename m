Return-Path: <linux-arm-msm+bounces-67790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 186FDB1B4AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 15:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CCD918A5176
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52A3274B5B;
	Tue,  5 Aug 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9AJgxDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BBD2749E5
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399801; cv=none; b=m28VZIQmzEaljzAIWFt5PJi70CbaJm4ojyt6eqvPFD/0bH6T6B0KVnDv3TcqOH247FpKwZkHoS3J7cx9EMom5r1W+MzJ/13OloU6uT8Aj0rtmtOSjA1DNeUaF/g2Q61v/RlT1FbJVyEC6F2uQa51IP1QQTIAPMLZL9hV++QwtWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399801; c=relaxed/simple;
	bh=xwxYSJqAOa2dswhRs3rVOJaTQiy6qaWgv8qoNhn4d4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hX4n4TmYWyAMnZyfllnOZUG+TOqlmjYzUY4seZnQKExBM/UFMHfT5BnKyscxwcO7DIifGYFfORp9J5XprNQRsMQfvb4TNc0y4VFF9RPmYNQrn6hLxSSspm3KQ+ezjJYEKVyDbLQ318Jyfl+SCr5HbcB0eU6HzLKPjGMgVRZUgw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9AJgxDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755v8Wv014583
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 13:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDcLe8zKX/SB4BPYrNHm0fL4uBKyff9MiXQwR+5hmYs=; b=j9AJgxDbOt8KR/kn
	4TnRGrzlbv1hj1bSUBbhlMx4T80D+YTEM1lBw14OaV7tShTMOdUIGKwKkQ9+/moc
	5EVnjH+uSK4C5TDnDDWNtF7BdMSVNIIWSSc3STulfHN4ufMS4tOR1AzphnHin9yZ
	NJ196Xkaq80gc9lkuvK2/lQkmUd+/gEZ6rcmdAX3H4BHbJIFR+kF65t1zTI5TV9e
	eqDlsUdzHxtAwsus2SLCxzvRUoGhbRDzEhDJCw7QnvS2kllNgC3XS+ESqKqiUGt2
	evjtxWfJwWa4UTH9ikQdAWGyUduIh6GdECLfH1DTDqDwxVj2qizjenCZaKT8PIeV
	gZaA3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc8hej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 13:16:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e7f8e1dfd3so43547185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754399798; x=1755004598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDcLe8zKX/SB4BPYrNHm0fL4uBKyff9MiXQwR+5hmYs=;
        b=rgw5Fay6gXQ1HtCGYqGXHT/hQgMxQdb/I08CCOZCKdNK4H2niyQaaNW0Nk1xbQsojI
         i9b61bHTfnKcqz/r91aD85KKp657mx5wvA0E1f+H46Q9HcwMajCSI76dhhs72/dBSMg7
         sjZO3a7jOQNqLBmMDWS7+O5cVvd6hP9SQKTpPOArMNymDqX04xOwlsBKXv5NxNB14H0v
         GGVcr9pmcpIjoLhS/x7un6THFolf3biLmpBDrtBk9ZoM6wyKWD8+lD2oFC81Gj0dZCsl
         EmDrOLC5yl8ibI09P5G7TlJPVQU3wFOGbTfp9xcKclEV+7m/N77gTX8NiHAHpqs7vlFK
         Pf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs/SR5j27VEOLWD5rg6N+aTqaCEgXwyosyn9JDT4HhOQEaws4HveWi1Ev2LW/55f9VBVD+IEHjsRpEPhvi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4UpPdEh6032qp/+z07XAlbBFNzCe8sosRo3R+LZAFuFdGRZ1
	rOXXuX1mxBMkI2QCC9uzoMfE+nss93DrqjqnDikXxiM2ZPEe92G2+RfLvs/9duNZI7sBJFDcKli
	y6rLV05pRK/GkYlRDbeSJRZz6yvn8EMOvQtykkeExjcMfL39iCyFXlMTVuPkK+YxZyUuo
X-Gm-Gg: ASbGnctAhxhjjBVw7OaANPUrnoXRQtJ1MDHgGb7EBzVHAfPuHIEvxhOuxSIQe+27tKJ
	VoGWowkWiCWSswuXCioWjKNLCz1zPWvrzo/XE/TMEiNvX5bhoqYDL1ARzKIriGvP2vVHopzbdGX
	DqFdz/U67bd8kfEuTL8ZFIxuayE7tmAh2Cf1K/EhLs87WpweHP4DQieD1Td/pVYQ6m89LjTTqZg
	g3oQaA1xJMwWOnIFZVHHoBXerAf54paM8HQAbS9zR0UuMv2ujv14lb9bCEbnOIvm67Ct9dHGExX
	bF4y/t9hShLR5ZDcJSHrFIBd4xqizZyMYauJT11VXsE4HykwkLj0RJSGVnupcWulrKQsJTwL5B0
	p+NyJfiagJy9IAqWlBw==
X-Received: by 2002:a05:620a:3910:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e69637b772mr1033215385a.13.1754399797696;
        Tue, 05 Aug 2025 06:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2hUPem8LiGES/LWflDOyfSDfPc6bjk/5uUNypoybLkeo6W/T1Jtee8ToW21iWhAqLFav1wQ==
X-Received: by 2002:a05:620a:3910:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e69637b772mr1033210685a.13.1754399797084;
        Tue, 05 Aug 2025 06:16:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2d554sm8310553a12.27.2025.08.05.06.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 06:16:36 -0700 (PDT)
Message-ID: <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 15:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RUCRSnOYkRsAlpvS6pMf6QDE4_e5mT91
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68920437 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=n5nAzIlM4DwaeDdO57oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RUCRSnOYkRsAlpvS6pMf6QDE4_e5mT91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5NiBTYWx0ZWRfXzj2eZkthTcVA
 SJZcuXtOyGyU+wDz+TfTja2SkyeExAs3H3+khTxtRBue3T9o4YG9LE3gpQP44uJQxR2t6g+AiB7
 ia0XK3jcxwy+BrUbS/6x3E271E0qw+6chWJbp91NrnnoHaM9nlRflUZm+fw2H44i3zWJUYHHwoN
 f9UxP7qCA2Bt/qGP00OpqPznXi5Blq0Hz4Y5iXKVBqD0HMwXW6smnEd6oOBotNpxOtHQSCJTX+Z
 L0+0d2ArdKxb2Wwvj0i3Gb/JLi5KIOtKRgAeivBVrDHZOFBX5SDc7iT9aBUm9AvOy8qLgwgy4mj
 a+oo6Sv21RrnGYGHoIHRjShLPZz3ETfHqD3BkPwte4hP5I9f0+SE5bhpou2PD5ZVRE6R9tBXCvJ
 KGyssEeLCmA+FKYfJ/Gd7DCeayQ/YSfTwz9psAFonF8SwZDRfvqijDZMAy0dsgj0eSzksqxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050096

On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
>>>
>>>
>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
>>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
>>>>>> support automotive use cases that require limiting the maximum Tx/Rx HS
>>>>>> gear and rate due to hardware constraints.
>>>>>
>>>>> What hardware constraints? This needs to be clearly documented.
>>>>>
>>>>
>>>> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
>>>> but keep on responding to other comments. This won't help you to get this series
>>>> merged in any form.
>>>>
>>>> Please address *all* review comments before posting next iteration.
>>>
>>> Hi Mani,
>>>
>>> Apologies for the delay in responding. 
>>> I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 
>>>
>>> To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.
>>>
>>
>> That's vague and does not justify the property. You need to document
>> instead hardware capabilities or characteristic. Or explain why they
>> cannot. With such form I will object to your next patch.
>>
> 
> I had an offline chat with Ram and got clarified on what these properties are.
> The problem here is not with the SoC, but with the board design. On some Qcom
> customer designs, both the UFS controller in the SoC and the UFS device are
> capable of operating at higher gears (say G5). But due to board constraints like
> poor thermal dissipation, routing loss, the board cannot efficiently operate at
> the higher speeds.
> 
> So the customers wanted a way to limit the gear speed (say G3) and rate
> (say Mode-A) on the specific board DTS.

I'm not necessarily saying no, but have you explored sysfs for this?

I suppose it may be too late (if the driver would e.g. init the UFS
at max gear/rate at probe time, it could cause havoc as it tries to
load the userland)..

Konrad

