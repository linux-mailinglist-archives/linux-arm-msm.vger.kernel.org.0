Return-Path: <linux-arm-msm+bounces-91905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHmBMvl3hGk23AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:59:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E4F18F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 11:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18121301FA5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC69D3A7825;
	Thu,  5 Feb 2026 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxoXoFDL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3CMfu9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469338F23C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 10:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288887; cv=none; b=sBLQPdnlE8CfDIqK0iALND7Pg2zaP7CDqrnry37awINfKC/Ms0dZL2B/3a+GVKTsFLBNsJCav4KG5vGZFqt6PYBM8s7h+CXPTCUqfOL+76sLQnLeYoP98xr7njqqAndIqpvYq7WedMZo7CCpWBJu9OLSplSb10T+pafb6In388U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288887; c=relaxed/simple;
	bh=2KRsW2K21K7m/0+Tf7sX5yo7HGOfP4boT9fNixOR/X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9YsfY2sVDfDpXCMO8BiJmth5SqKp9BY4Jb8Cj1mW7JBlDjtaJjl5a5J3aTiXuDfYBuuUM8dWqTB6r5I5gYaFHK+IHY45X0VdNuq/siDdHhyv/af2ecizSeFf3Lw8mKaoL974fNMWlblqAeHNRgxR6Yks1IZ9Pp+oAOCdxQg3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxoXoFDL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3CMfu9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153drjA2103217
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 10:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lE2XmlO1O7sdYam/muNqs7Mc1rdhurdUAe4z7mZAn0=; b=UxoXoFDLWCx6cW9m
	5yruWhX/zLKZBOEbUTTAt83riCexjriDdp9DbHmEMKNP6PSSvnM92avxi4KBmgMa
	AvZZH66Qd3RE+G6MrViL4bF9LaKJonJaWME+He/AEAEsZykJvCFVH6e/JXIxVw8x
	vANhq+y1+ieHIJloanRLOi/tJI75QLML7P1/nhx+Y2r+u6rmXM2lZ37sikdR4cCt
	02ksqs1fy1S+TEarHQoiSrOdrav5IcdL+BOirzdIeIp8+Yg6xeZE19XMAxFQWZoo
	+1glAJi90J+sZTr2Iw2FVjYQH/gmIFUu7jk+YaL9KXXNnWUxqEp9TsKVtNnoz1J3
	fAAVCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjm11k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 10:54:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so16810785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770288885; x=1770893685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lE2XmlO1O7sdYam/muNqs7Mc1rdhurdUAe4z7mZAn0=;
        b=I3CMfu9zU2RGqp3JisRBk43t21ud93AdNhPK2UwhqrsVQbTSgV2QHJwZkQ/KRYwhBI
         TQ884/R3omF/4mqh6lWpc8jFWEUCEwkB2eaBQG/LUeyJOEEH0nTookQTKZ/0VTxqA7kx
         Vfwd9abNOqpiQks7AiaEXWdEKUD/uTWqsBU1OSQcV/8gyzHwUnViOMK8HrSxSkgaxd2h
         UKOteIYllIMwusxEp4OKXN8RqwNrUw1cG8/SuVXC0Zfdfiq/I0RcqHxe82jnrfYV98NK
         vQp3rppjsJ/h/OyTmMwvNULfp28WJXk0NVVkL5ES4yaRawRzSCjZ7TRo17tgOjtiszA5
         eMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288885; x=1770893685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lE2XmlO1O7sdYam/muNqs7Mc1rdhurdUAe4z7mZAn0=;
        b=hXJT/VMxjtg8wHCL9hOnB9PyarR1k1qPzGGxd+qKz7hRLqzRnfm4iFVJ75KQC/09NN
         rafOD+QfLkV4HPkQ9tWH3YazMRUeSRsJEs0CZyLYNB/QkCO3bYecJc9e5EAQObb4LUsP
         iQMxr5I1UC6htiiaY6i0Q869kQkat5Yav7fZcAnlkVc+CGTM4BkC5/e0CB6QrQ6IuWXo
         GW0odzfRrhzBOEWGIRYPdnjsxDz5j1L/4wgeWBaiYw4+oaFd5KuOHrAKNPm2OdvbASwG
         /3Y+9AOEdDFm/jpyrcPSpEiaFsyG9dxWYW9kOiGpWSVYBAV1JwZghcYXOFjfgVRs89xP
         gnlg==
X-Forwarded-Encrypted: i=1; AJvYcCW9nZd0p5pVg3pWFYRgDQVmrIzRmmfUErpHMfOvVHkYj6dPc2CgRWR4KTQZBAd+4W5tsxDVavsEBNHWZcdQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGr1ONPjSg1YjZrWz9gW8pwOzuWbKXOVobzrPc8jR+Ew7tg2T
	AlLW5FlBvPEenr6CCNCz9tBaMvu2Q8f5NLf6HkW7k7MY7AYf0+BsV72NyHOYnB6CEXWDUAB89oy
	ueB+Z6GmkZc79EGv1upBkEimv9bwxVH6mt3zeKNTn33zD7GMtjokD0kujp0db5N16CBSr
X-Gm-Gg: AZuq6aKlHEWXBlad5cG1xrKo/FbqEP3gD0Ux9TmKxZFb2Oa1Bhfq3UIzJZquxCjGpIy
	6FGSR8914idADSNFmh9AFS7wLJ2Q1knBNi3uYqGWCYMPXJNyMmLklK4vVHHIGLkUvQgPx55/cop
	tbg7cnyQSuLQQugHl+eGxheOSUGLlVyTGXuCACIxdeHo/KlYpbp1IwVGvvJYiSiQgHmvdUrMVXV
	8gewks6N9/MEF6pqFMLvBuIeUJTk4sM3SP6bqU6LAhfygv9cCGaGH0f9bCQHlM66CvGxF3jOGRC
	UAmp9D8ZecVyu4aRxoE0C83UnHcbzxoxEu7nzanrTOKW4HnXmr9LNv8Qm3k1Q7vtBUTPj8cZGKI
	Uw73cCgt1G60mpjOVQnFa6ukaOUBQxcBz83BdnN1NmhqfzlOLkq1TptPS7P6NuW9Mcqk=
X-Received: by 2002:a05:620a:40d1:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8ca33182f99mr481625685a.9.1770288885462;
        Thu, 05 Feb 2026 02:54:45 -0800 (PST)
X-Received: by 2002:a05:620a:40d1:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8ca33182f99mr481624685a.9.1770288884921;
        Thu, 05 Feb 2026 02:54:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00446a9sm213851566b.58.2026.02.05.02.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 02:54:44 -0800 (PST)
Message-ID: <70d4adda-7381-4e0c-be22-9a84e30ec6af@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 11:54:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
 <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
 <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=698476f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=nXk0WryME7awO7fg_v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UEVfiaCXMF25zxcmF4agtaUNsnA9_AIK
X-Proofpoint-ORIG-GUID: UEVfiaCXMF25zxcmF4agtaUNsnA9_AIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4MCBTYWx0ZWRfX9EdOCzpvPLPz
 Y6pZemVb5J+33qoGxQrDpLFUsZk4+TAw/a08z8kaGdL6t8bT2fHBPlGfcr5qdSU6DmD1x0Erb9o
 mIu3HzsnBD2R01oDQkTkcTeFMon/z2LZYWNlyyFqqYPdPArOz8OS/wH69wPV558m/Iqud4Si+hI
 XHA4+gZmBIBnd5i/uXieCxgZxfx3edVZotstox/AMM3oauiyUWuje/7oXdfdKdV5TJzd1FgHfcv
 hbolPUlI1u3WCO/xihDKk7UkJ9srLbyjwCkCInHn6G4600PpFOPrNngaAphehZd/HNdFWS0p+Ud
 lma9Yxje7FLXDxKqqB4cJwSxD5d5DufvOk1VMUP7M8lztlcOJb/+Fg3By1VLgvS71ZRFdh5obpj
 WeMcxSMSf+0UjPmqYfEhoI+FPav772SegT0qX4Qv5a3mHNS0roeoTLp5PyVV8qgJVAja8FXGw+w
 PuuwscdkYW0XLJGQ8EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D5E4F18F5
X-Rspamd-Action: no action

On 2/5/26 9:01 AM, Aaron Kling wrote:
> On Thu, Jan 29, 2026 at 8:35 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>
>> On Thu, Jan 29, 2026 at 5:11 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
>>>> On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
>>>>> <neil.armstrong@linaro.org> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>>>>> for Android, using mainline kernel drivers. I have come across some
>>>>>>> missing functionality and failures that I would like to inquire about.
>>>>>>>
>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>>>>> and go to the bootloader menu. This appears to be an issue in the
>>>>>>> baseline abl code, affecting all devices of that generation. Would it
>>>>>>> be allowable to merge a change adding those changes to the sm8550
>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>>>>>
>>>>>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>>>>>> for boot they should be documented and added for sure.
>>>>>>
>>>>>>>
>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>>>>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>>>>>> and that seems to work okay. But no measuring of bandwidth was done,
>>>>>>> so the numbers are likely not entirely correct. Is there any plan to
>>>>>>> generate correct tables for sm8550?
>>>>>>
>>>>>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>>>>>> is fine but since the values were calculated from downstream DT tables,
>>>>>> the same should be done for sm8550.
>>>>>>
>>>>>>>
>>>>>>> * As part of a series to support the original Odin 2, a patch to
>>>>>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>>>>>> and this was never merged. If this change is valid, which per that
>>>>>>> discussion it appears to be, can it be resubmitted by itself and
>>>>>>> merged?
>>>>>>
>>>>>> I missed this patch, please re-submit, I also need to update the ones
>>>>>> for SM8650.
>>>>>>
>>>>>>>
>>>>>>> * Per the mainline kernel device trees and audio topology provide by
>>>>>>> the oem, these devices use primary i2s for the speakers path. There
>>>>>>> was a commit adding clock support for that as part of an hdmi series
>>>>>>> [2], but that seems to have stalled. Is this going to be picked back
>>>>>>> up?
>>>>>>
>>>>>> No, I do not plan to do this work, it required adding callbacks in the
>>>>>> code to handle the clocks like done for the pre-audioreach firmwares.
>>>>>>
>>>>>>>
>>>>>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>>>>>> online, such as for the sm8550 qrd, that logs the same way my device
>>>>>>> does. I traced the issue to the check for wrapped key support [3]. On
>>>>>>> my devices, the derive call is supported, but the other three calls
>>>>>>> are not. I was pointed at the downstream headers for sm8550 support
>>>>>>> and only derive is listed there, the other three don't appear to be
>>>>>>> used in the downstream driver. Is this expected? And if so, will this
>>>>>>> case be added to the mainline drivers?
>>>>>>
>>>>>> Does hwkm work with you remove the last 3 calls ?
>>>>>>
>>>>>>>
>>>>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>>>>> causing stack traces, but the gpu does work. I tried to do some
>>>>>>> research into this, but quickly got lost in the weeds and I have no
>>>>>>> idea where to even look.
>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>>>>
>>>>>> This may be related with the display handoff from ABL, did you add the
>>>>>> plat region to the reserved memories ?
>>>>>>
>>>>>>>
>>>>>>> * Sometimes when starting rendering, a bandwidth submission times out,
>>>>>>> then the driver immediately complains that said id was left on the
>>>>>>> queue. I have tried increasing the timeout, but the same sequence
>>>>>>> still happens. Timeout happens, immediately followed by a matching
>>>>>>> unexpected response. Implying that this isn't actually a delay /
>>>>>>> timeout issue.
>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
>>>>>>
>>>>>> Weird the timeout was extended for this very purpose
>>>>>>
>>>>>>>
>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
>>>>>>> unsure if this is a kernel problem or userspace, so I'm submitting
>>>>>>> here first. If the consensus is that it's a userspace issue, I'll
>>>>>>> submit it to mesa.
>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
>>>>>>> (com.futuremark.dmandroid.application)
>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
>>>>>>> [ 1860.258133] rptr:     36
>>>>>>> [ 1860.258134] rb wptr:  36
>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
>>>>>>> [ 1860.258138] rptr:     0
>>>>>>> [ 1860.258138] rb wptr:  0
>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
>>>>>>> [ 1860.258140] rptr:     1752
>>>>>>> [ 1860.258140] rb wptr:  2319
>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
>>>>>>> [ 1860.258141] rptr:     0
>>>>>>> [ 1860.258142] rb wptr:  0
>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG2: 41562
>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG4: 3736059565
>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG5: 3736059565
>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG6: 3736059565
>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>> CP_SCRATCH_REG7: 3736059565
>>>>>>
>>>>>> @rob do you have any idea how to solve this crash on a740 ?
>>>>>
>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
>>>>> something is unhappy about gpu pm.  I'd focus on that first, since
>>>>> that is almost certainly the cause of the later issues.  If things
>>>>> _sorta_ work (rendering UI, etc) you could try removing all but the
>>>>> lowest gpu OPP as an experiment.  Could be that power related problems
>>>>> surface when the GPU ramps up to higher OPPs.
>>>>
>>>> Things work amazingly well compared to what I was expecting. Using
>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
>>>> in the benchmarks that do run, compared to the stock Android. And
>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
>>>> gives about 89% compared to stock, but there are graphical glitches in
>>>> some of the benchmarks.
>>>>
>>>> I set gpu max_freq via devfreq to the minimum available frequency and
>>>> ran the failing benchmark again. It completed once, but failed with a
>>>> similar stack trace on the second run. And per sysfs, the gpu did stay
>>>> at that minimum. Of note, that causes the benchmark to fail, but
>>>> rendering does recover and the unit is still usable afterwards.
>>>
>>> In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
>>> table. Can we add those (from downstream dt) and try again?
>>
>> I don't know what I'm looking for in the downstream dt. But if such a
>> change gets pushed to lkml, I can grab that and verify.
> 
> I took at look at the downstream dt and took a guess at importing the
> acd values. I'm not sure if the gpu here is the baseline kalama or
> kalama v2. I guessed the former. There were a couple values missing
> however, that I had to extrapolate based on other frequencies. This
> however changed nothing about my test results. Still getting crashes.

FYI if there's a chip and chip-v2, then the former was a prototype
revision. Try the values present in the runtime DT of the original
software, i.e.

cat /sys/firmware/fdt > my.dtb
dtc -I dtb my.dtb -O dts > my.dts

Konrad


