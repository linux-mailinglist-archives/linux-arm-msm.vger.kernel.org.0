Return-Path: <linux-arm-msm+bounces-96907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK/gIWQssWkBrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:48:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F082925FA9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 103D33065AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555653BE641;
	Wed, 11 Mar 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3UTebXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cns9pVsc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1563BE629
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218840; cv=none; b=ECrrYOey+PLvWBEi4VPU2aLTNzNLAe3oLosoZczGYtsaezIX9c7ehAcBllcoDjiPdeEHsH80ycHyRSoSGQPjgucDA2xi2Z+zt0Uh29kJ5ifNJYHAQl19zHz5S8bmdOma+w58BIZPfZ53P6Th3y0XYGE8UhypnWUoxOK8mzmDZss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218840; c=relaxed/simple;
	bh=hcEH7/FPLqjV3K4ZgK/CoOp/I8JLlb3dMIQSbxnrHZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6wgmx/a0yhP1od/m/06sclayUI+uAj4rIrG1+QYzQmQIuIzIqerlpKuHdfvmQ0S/+YjhiuHZ85XnjcNWpcM5jrIu5H7r7Z8OM4XFJ/KfpFgQIzjVmtvkDcWNpb/agDcON/KYRmOvk3lu2V8dsCeyGbm6wyD7dnNUfAls+zpU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3UTebXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cns9pVsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2AD3t1573154
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwd4yvsVpSXhc9MQPo9HBTxOWB3Aemqtw+x+9MnnQqk=; b=b3UTebXQcvh/T/+l
	uGtftZbSV0a5DuoCptiizTZ12e/4DcesILSF8P22B5Jpo8L+AD1ZZCXIafGRiObW
	Fa0tQ11EM2OKKMbYmrRqIybRXcKtGkO6vW8/HFOuKkVeOncRDmps66zWGKgv6Z//
	SJGcHcMYWppfAYjSbN9rKbNk7GNvGPS6HyegpNk4pZwRmsE8qKZ9mH5XbZnW/KPl
	C7qlremF6S5hXhoaXhBIOQiFYSC7cHO8mp1qRmgX1V/qZ3jLfgu9kPxvJL43nC9z
	VtFXoDO67gNst110xuDSuKbXtIlKnuXNxLcsMzQwL+jfonkA+Ob8snsoKrPE76Hj
	c0MPAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkaqgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:47:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd90210336so121949485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218829; x=1773823629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwd4yvsVpSXhc9MQPo9HBTxOWB3Aemqtw+x+9MnnQqk=;
        b=Cns9pVscVpidi6+jIIsGO8/HIKqf65yzsnbVpgt8ZnYxLmBvjaixUrBtmOuZkrxn8U
         3XpeHmiCcIrdJh2/MWkcLtOkBbFEtyx/27ZpK9bmlgc34u6AXT67PNl/4Py+PU3Icvp+
         UMEXQzQMuBXeG6Rfll5obDORftzrpb4667aOt8Qn9Eo0Ufd1uDGlOLneFsYM7d8w1xX3
         wnCJ4Pkjc6B1OHoOf9/iHVTZlSlqUxchCqBbx1e2iHJe+ivkuTKfoQTLS+DaCUQyPnz2
         nlsDNyp56GFkBBm/Qe53iP2uEc4Rf3h5ReGy0o0UTUh3LxWv67lkgKG4Z7XJ9vyPEBkm
         XtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218829; x=1773823629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwd4yvsVpSXhc9MQPo9HBTxOWB3Aemqtw+x+9MnnQqk=;
        b=OqQSy9WwjtDJplm5LveBXrsIGo3uFHAMYhlRYTqq/ON7X2UvpEtclR5FJecHXTXZHR
         7f/83nmfy6V4MIBvSdjcGZLPrtYrGLwDHSN10PSKM5NKVpoOZ7MlHGxI+jkC9yqfOrTg
         agIZ/rGDq8HGnEPOWTRHi63jcNUQanI/xQP/K5aRrte5xDvyNo74SQcvNxjzbfFuzFtm
         aKTo7yKS94DC3MJDWtZuQz7kAXOKK8x7enkCURJviVrKVEt2Gi3LvILmufGnqX0I2LCy
         dtK+fQrdToczrxJ60cqlWD0mnZZF+EAR1T/KbYX4o9iwNb+QSUcUTYDTMP5FdKqKn+xT
         K3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCV1fAxlwBahFj+4q3uOANt1B4Lk76FGbmir341NclDNjOQ0lGUql3t2UWTt7n1nTHib1lG5be6tZ68IUMe2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32ciJiD5dgGJ5TrQP18cLQIs8vnNKHbLQVeI9xkoYhmgB3Z9X
	7vq2M7GJpN6GYF5iqWb7NycYhaRrWQpUoAV4nGiuU2t49T6FitD8w0VvgdvlgJXiqi5axq6pyr1
	EBa6H2du9KsF86hhaEGMcje1gmFXz0Pp7A7u7JVDHM2btmD72U4MjQknV5K4fkAVQagQD1mEuRP
	kQ
X-Gm-Gg: ATEYQzywlFEDOwP4PSL2Qn9ZkAsZyc0u+fxWmN676eFr3o2pFJKeZg3w/AW494X9TcI
	dkWdErdBxGsJt1coUKJJhCypEMbU1J7Plj0rVHXOmFcUjgXG+LYUUQe8IdksujZzzd5tl3x6HOz
	Iy/oJBOPnRTGJHnvIKsRJODNRvo5Lif2YiUHbfc9xnp+A+AjIwzkhr6DWKNipwX8LBlhbUFTfXN
	HyUsaFBDZR/NbTby5RF3vVGtDdd+GvrcXKjO1QGFKetHBZn/x1bRArSXhdPmxP+iWySQwlsxjtp
	XIelw3mv4J+aX6KY/UR+nIWIiu6VjPfB5Dl3l/6p1V5GrYUFwCRpPM2crbHplMvlOKDXmLEPR4c
	LqqJP2q9qmKxOrGTO/1TkuMOQI8r46gZBzSPlGDDM551SeV22XAujogHtqvhOfvwhGFGpbmjR0A
	JFU+g=
X-Received: by 2002:a05:620a:4692:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cda197c759mr170693985a.2.1773218828739;
        Wed, 11 Mar 2026 01:47:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cda197c759mr170691585a.2.1773218828125;
        Wed, 11 Mar 2026 01:47:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631532dba5sm369904a12.31.2026.03.11.01.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:47:06 -0700 (PDT)
Message-ID: <71ec1014-e357-4368-9ed7-37083ead9989@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 09:47:04 +0100
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
 <593afb89-031d-4376-8ea7-024b645c62cb@oss.qualcomm.com>
 <CALHNRZ-FjMiS7ADWmBeY2gAQhswi15Uc1qCM6xP5FDeSbgD9_Q@mail.gmail.com>
 <b2c3c56d-5b30-4201-bd16-924bf674c9d7@oss.qualcomm.com>
 <CALHNRZ-Uc9HEHc_8wJ3SAKxHX+cE0Gu7_BeakvF5muCmS9wmhg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-Uc9HEHc_8wJ3SAKxHX+cE0Gu7_BeakvF5muCmS9wmhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IdvCPb77iB7rd1_pRPYbdzPN17QQuJe5
X-Proofpoint-ORIG-GUID: IdvCPb77iB7rd1_pRPYbdzPN17QQuJe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX6KgXyj9R754e
 nx5RBkrk3JYY5C2Gope8nkvHX/9oPsW60qFoq24MCf38+7zUjr+cOdgOKRIXWL5vgNpWQEY2SdC
 aq4NluHN0Qv5xIzZtgQdV07+iwfn+mEhp6qsqhyzRDmGlTzEeyi5hkEMtQEMDgJco60vEKvbVqc
 NUazPCgkOYjVVGMHbEYsCMy2/s3YCQ923kAuzOHkJJxnL9B3mMxgiZSSE2c2JgGQb2iQOzE6Y7W
 jWYIkFIxdLpjtjg5A/GWnkGvDly26HK7rJN5vzGfFdiLre5zJm4REnaqCZcaMm7wjF5b+Po23U5
 60OpN3dbFuE2bt6/t9M7Yf0z/Wyw1RZtsMgyY7zAUqDIPMX0RmeK9yLeQxv7ztg+CqJbr9s2WZd
 uIuhKlyrFxvMOB7znJV22qreBJPc4UeEweVea7XoFP2Myin7yxgqD2RHf15Zbzy+tUzGWS3kCSe
 gSsAssLZ87Nq/TmNz5A==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b12c0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=OkYMj3z1k7ht9Xl6HqYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
X-Rspamd-Queue-Id: F082925FA9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96907-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 10:53 PM, Aaron Kling wrote:
> On Tue, Mar 10, 2026 at 4:33 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 2/5/2026 11:10 PM, Aaron Kling wrote:
>>> On Thu, Feb 5, 2026 at 7:29 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> On 2/5/2026 1:31 PM, Aaron Kling wrote:
>>>>> On Thu, Jan 29, 2026 at 8:35 PM Aaron Kling <webgeek1234@gmail.com> wrote:
>>>>>>
>>>>>> On Thu, Jan 29, 2026 at 5:11 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> On 1/28/2026 11:24 PM, Aaron Kling wrote:
>>>>>>>> On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
>>>>>>>>> <neil.armstrong@linaro.org> wrote:
>>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 1/27/26 23:48, Aaron Kling wrote:
>>>>>>>>>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>>>>>>>>>>> for Android, using mainline kernel drivers. I have come across some
>>>>>>>>>>> missing functionality and failures that I would like to inquire about.
>>>>>>>>>>>
>>>>>>>>>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
>>>>>>>>>>> mainline. Using changes described in the gunyah watchdog thread [0], a
>>>>>>>>>>> dtbo loads and the devices boot as expected. If any of the changes in
>>>>>>>>>>> that post don't exist in the base dtb, abl will fail to load the dtbo
>>>>>>>>>>> and go to the bootloader menu. This appears to be an issue in the
>>>>>>>>>>> baseline abl code, affecting all devices of that generation. Would it
>>>>>>>>>>> be allowable to merge a change adding those changes to the sm8550
>>>>>>>>>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
>>>>>>>>>>
>>>>>>>>>> Any addition to the DT must be documented in dt-bindings, so if it's needed
>>>>>>>>>> for boot they should be documented and added for sure.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
>>>>>>>>>>> have locally copied the commits from sm8650 and adapted for sm8550,
>>>>>>>>>>> and that seems to work okay. But no measuring of bandwidth was done,
>>>>>>>>>>> so the numbers are likely not entirely correct. Is there any plan to
>>>>>>>>>>> generate correct tables for sm8550?
>>>>>>>>>>
>>>>>>>>>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
>>>>>>>>>> is fine but since the values were calculated from downstream DT tables,
>>>>>>>>>> the same should be done for sm8550.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * As part of a series to support the original Odin 2, a patch to
>>>>>>>>>>> update sm8550 EAS values was submitted [1]. But that series stalled
>>>>>>>>>>> and this was never merged. If this change is valid, which per that
>>>>>>>>>>> discussion it appears to be, can it be resubmitted by itself and
>>>>>>>>>>> merged?
>>>>>>>>>>
>>>>>>>>>> I missed this patch, please re-submit, I also need to update the ones
>>>>>>>>>> for SM8650.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * Per the mainline kernel device trees and audio topology provide by
>>>>>>>>>>> the oem, these devices use primary i2s for the speakers path. There
>>>>>>>>>>> was a commit adding clock support for that as part of an hdmi series
>>>>>>>>>>> [2], but that seems to have stalled. Is this going to be picked back
>>>>>>>>>>> up?
>>>>>>>>>>
>>>>>>>>>> No, I do not plan to do this work, it required adding callbacks in the
>>>>>>>>>> code to handle the clocks like done for the pre-audioreach firmwares.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * Inline crypto fails to detect hwkm support. And I see other logs
>>>>>>>>>>> online, such as for the sm8550 qrd, that logs the same way my device
>>>>>>>>>>> does. I traced the issue to the check for wrapped key support [3]. On
>>>>>>>>>>> my devices, the derive call is supported, but the other three calls
>>>>>>>>>>> are not. I was pointed at the downstream headers for sm8550 support
>>>>>>>>>>> and only derive is listed there, the other three don't appear to be
>>>>>>>>>>> used in the downstream driver. Is this expected? And if so, will this
>>>>>>>>>>> case be added to the mainline drivers?
>>>>>>>>>>
>>>>>>>>>> Does hwkm work with you remove the last 3 calls ?
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * Some gpu related clocks complain about being stuck off during boot,
>>>>>>>>>>> causing stack traces, but the gpu does work. I tried to do some
>>>>>>>>>>> research into this, but quickly got lost in the weeds and I have no
>>>>>>>>>>> idea where to even look.
>>>>>>>>>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>>>>>>>>>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>>>>>>>>>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>>>>>>>>>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
>>>>>>>>>>
>>>>>>>>>> This may be related with the display handoff from ABL, did you add the
>>>>>>>>>> plat region to the reserved memories ?
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * Sometimes when starting rendering, a bandwidth submission times out,
>>>>>>>>>>> then the driver immediately complains that said id was left on the
>>>>>>>>>>> queue. I have tried increasing the timeout, but the same sequence
>>>>>>>>>>> still happens. Timeout happens, immediately followed by a matching
>>>>>>>>>>> unexpected response. Implying that this isn't actually a delay /
>>>>>>>>>>> timeout issue.
>>>>>>>>>>> [ 1848.517020] platform 3d6a000.gmu:
>>>>>>>>>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
>>>>>>>>>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
>>>>>>>>>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
>>>>>>>>>>> *ERROR* Unexpected message id 1015 on the response queue
>>>>>>>>>>
>>>>>>>>>> Weird the timeout was extended for this very purpose
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
>>>>>>>>>>> unsure if this is a kernel problem or userspace, so I'm submitting
>>>>>>>>>>> here first. If the consensus is that it's a userspace issue, I'll
>>>>>>>>>>> submit it to mesa.
>>>>>>>>>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
>>>>>>>>>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
>>>>>>>>>>> 00000001512E9000/003d ib2 00000001512E7000/0000
>>>>>>>>>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>>>>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
>>>>>>>>>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
>>>>>>>>>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
>>>>>>>>>>> (com.futuremark.dmandroid.application)
>>>>>>>>>>> [ 1860.258126] revision: 0 (67.5.10.1)
>>>>>>>>>>> [ 1860.258132] rb 0: fence:    2884/2884
>>>>>>>>>>> [ 1860.258133] rptr:     36
>>>>>>>>>>> [ 1860.258134] rb wptr:  36
>>>>>>>>>>> [ 1860.258135] rb 1: fence:    -256/-256
>>>>>>>>>>> [ 1860.258138] rptr:     0
>>>>>>>>>>> [ 1860.258138] rb wptr:  0
>>>>>>>>>>> [ 1860.258139] rb 2: fence:    41563/41569
>>>>>>>>>>> [ 1860.258140] rptr:     1752
>>>>>>>>>>> [ 1860.258140] rb wptr:  2319
>>>>>>>>>>> [ 1860.258141] rb 3: fence:    -256/-256
>>>>>>>>>>> [ 1860.258141] rptr:     0
>>>>>>>>>>> [ 1860.258142] rb wptr:  0
>>>>>>>>>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
>>>>>>>>>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
>>>>>>>>>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>>>> CP_SCRATCH_REG2: 41562
>>>>>>>>>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
>>>>>>>>>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>>>> CP_SCRATCH_REG4: 3736059565
>>>>>>>>>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>>>> CP_SCRATCH_REG5: 3736059565
>>>>>>>>>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>>>> CP_SCRATCH_REG6: 3736059565
>>>>>>>>>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
>>>>>>>>>>> CP_SCRATCH_REG7: 3736059565
>>>>>>>>>>
>>>>>>>>>> @rob do you have any idea how to solve this crash on a740 ?
>>>>>>>>>
>>>>>>>>> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
>>>>>>>>> something is unhappy about gpu pm.  I'd focus on that first, since
>>>>>>>>> that is almost certainly the cause of the later issues.  If things
>>>>>>>>> _sorta_ work (rendering UI, etc) you could try removing all but the
>>>>>>>>> lowest gpu OPP as an experiment.  Could be that power related problems
>>>>>>>>> surface when the GPU ramps up to higher OPPs.
>>>>>>>>
>>>>>>>> Things work amazingly well compared to what I was expecting. Using
>>>>>>>> mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
>>>>>>>> in the benchmarks that do run, compared to the stock Android. And
>>>>>>>> rendering is correct everywhere that I've seen so far. Mesa 25.3.3
>>>>>>>> gives about 89% compared to stock, but there are graphical glitches in
>>>>>>>> some of the benchmarks.
>>>>>>>>
>>>>>>>> I set gpu max_freq via devfreq to the minimum available frequency and
>>>>>>>> ran the failing benchmark again. It completed once, but failed with a
>>>>>>>> similar stack trace on the second run. And per sysfs, the gpu did stay
>>>>>>>> at that minimum. Of note, that causes the benchmark to fail, but
>>>>>>>> rendering does recover and the unit is still usable afterwards.
>>>>>>>
>>>>>>> In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
>>>>>>> table. Can we add those (from downstream dt) and try again?
>>>>>>
>>>>>> I don't know what I'm looking for in the downstream dt. But if such a
>>>>>> change gets pushed to lkml, I can grab that and verify.
>>>>>
>>>>> I took at look at the downstream dt and took a guess at importing the
>>>>> acd values. I'm not sure if the gpu here is the baseline kalama or
>>>>> kalama v2. I guessed the former. There were a couple values missing
>>>>> however, that I had to extrapolate based on other frequencies. This
>>>>> however changed nothing about my test results. Still getting crashes.
>>>>
>>>> Please use the values from kalama v2 dtsi. And if the acd property is
>>>> missing in any OPP node, that is a hint to the the driver+gmu-fw that
>>>> ACD should be kept disabled for that freq corner. So, please follow the
>>>> same.
>>>
>>> Alright, I updated the change using values from the downstream v2
>>> dtsi. Still getting the same results. Since it's needed regardless,
>>> would you like me to submit the ACD patch?
>>
>> Sorry for the super delayed response.
>>
>> Please go ahead and post the patch.
> 
> I sent it here [0].
> 
>>>
>>>> ACD configurations are required to meet the hw specifications. We can't
>>>> predict how the hw fails in case of a spec violation. I don't know if
>>>> this issue is ACD related, but we should ensure that all power related
>>>> configurations are accurate first.
>>>>
>>>> Also, could you please try the latest firmwares (sqe and gmu) from here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom?id=30979b116b5c5857b72c4332db8db0ff1ca2dc08
>>>
>>> These are what I'm already using.
>>>
>>>>>
>>>>> From my perspective, this part does not appear to be a PM or frequency
>>>>> related issue. Some of the 3dmark benchmarks I have never seen crash.
>>>>> Like Wild Life Extreme. I can run the stress variant of that and it
>>>>> beats the unit for 20 minutes at full clocks with a screaming fan and>
>>>> that runs perfectly stable. Solar Bay Extreme also runs completely
>>>>> stable in all of its glorious 3 fps. The two problems are the standard
>>>>> non-extreme Solar Bay and Steel Nomad Light. Both of these
>>>>> intermittently crash with similar traces to what I posted before.
>>>>> There doesn't seem to be consistency in the faults, sometimes it will
>>>>> be almost immediately after starting the benchmark, other times it
>>>>> will get 90% through and then fail. But they virtually always fail to
>>>>> complete. For another point of data, I have never seen GravityMark
>>>>> cause a fault either.
>>>>
>>>> The peak current draw can vary between benchmarks. So we can't rule out
>>>> power issues. And are you able to reproduce the same issue on another
>>>> device?
>>>
>>> The only relevant devices I have are two of the AYN qcs8550 devices, a
>>> Thor and an Odin 2 Mini. The issue happens on both, yes. But I don't
>>> have anything like a phone or devkit with sm8550.
>>
>> I will post a few fixes in the next few days. At least, with that there
>> should be a coredump generated for hfi errors. Please share that.
> 
> I posted an issue on the mesa tracker here [1] and attached some
> devcoredumps to one of my replies. I can add more when the new patches
> are available.
> 
>> iirc, you are using upstream drivers with downstream kernel (ACK?). Any
>> chance you can try pure upstream kernel?
> 
> Yes, that is correct. My current setup is ACK 6.18.13. I unfortunately
> do not have a pure Linux setup. If I had uart access on these devices,
> I could use the minimal busybox setup like I do for tegra, but I do
> not have such access here. As far as I can tell, no closed case debug
> setup is available either. Google does have a mainline tracking branch
> which I could use to get closer to -next for verification, but it's
> still not unmodified upstream.

FWIW you can run AOSP on pure upstream, perhaps not with all the features,
but you can. Try copying the config from ACK and give it a spin

Konrad

