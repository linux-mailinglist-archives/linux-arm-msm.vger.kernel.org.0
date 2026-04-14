Return-Path: <linux-arm-msm+bounces-103156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3EnvK9Ba3mk0CQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:18:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFE3FBA27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0041A3016CAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76053E92A1;
	Tue, 14 Apr 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afOQLkzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFP6L38+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C363E6398
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179400; cv=none; b=DbDRp3Pn2jm0a97kNtIJO0cn2fDmFVVTN4DsMkGImfFnzGUXQOqBMkppI4bljw4GKAVi+EqGU2LN4gcvze1eppZuIE0HGLcnFZbkIVhfSE2wvU0RXjFInb3rFWaSnVXFPZhJ9UI2hirTLuzM5RQrM/FLJr3AEBuL346fsp8bgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179400; c=relaxed/simple;
	bh=QthrlpRVWSsd0+06nhrQQBDv/w4e9HEzAJhHLln58nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re4PhorVQku9W+o2fU31ZjFAv333YCsLRBwZ40/cMSZTVjrG7DSdzfMD3Qh6xWG6cAz/7Z9VbZI3qMt2jWqBYYbkqrAoKtwd5MOT8slNJggtfEV9GZRhXoIncfiedlnV1pIhqPw2jU49CsiSubUIFBcjHFKIitDmqwb/IdkghbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afOQLkzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFP6L38+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC75fI3157820
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=; b=afOQLkzcTGWSNRme
	ai6D7YmGiEJD9qQgtkp8ABtlW2vYNLYCn9qgEBa43wlFunWdqdIWs3zzbSXW+TRf
	82qtOcZcJRSpWISDTIsBETnVXUg8AzH4H6WpCKSJb3dv1BlBhWzHaW9WY/L1Czjv
	FXRZAlWxqvfwLveCzWQFtc/4ONC1HfgG9SD/Ff38dIKWmEMOMGeEPcU9k+t8HPsy
	A7/NSBqdjL+52zIfAU4ZzqjiTVCLald8JQMuTpzvCs1WGozBtEBMuuFJy5iz3ny+
	eV24H4wlIswCRT5zHl7q+6Fv94H8eYQJYCZ5vDL3C2Yqkr0O4N2cTa94cdJkMJWZ
	l+X8/g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb838-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:09:58 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4726bca0bcdso988625b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179397; x=1776784197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=;
        b=jFP6L38+EDWWxWqFKLz72kKELxpTb76oudEzwwcL/MK0Fhcoq3dE/sguvNeq6lWopz
         AzNuAntIThLqmiyv8xwdmQa4Kuwv/4rbrMATcFb5ykpjIHPcEUGsIw1LnaomyGk31KtT
         9pYuQ9UgMTAv9FVk2DM30YxLSGhcM8N+TBNFIdCrnYT1JhmmdJhgBAT/NKjx1+Pve6CA
         DClJCFJCNzFikJAViX+51rkwcRpPnfISrbM7i7ca0bObgFEkRbimA+QmDIz1kMvrvLkd
         XIwJpeJkIf+TBSFOaBtdUMFI5vqpGhm5n5ZBj5sJs7h1BDEcrhldgfGFA5G2QAnOk8ch
         dQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179397; x=1776784197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I3Ra4jc7Ybsas9Sg4CpJirZh6oaKtL8wZlkqRTGAoc=;
        b=HT6+QlzekTSZ7ZAM0nHng76UALJyuIU4h+h8adpYDA1wLAcGVO/3W6WMnWeh0nhRYf
         AaXdbcjIR+RJZ3vMl3MePr48NQmAYf6snPcjmYXQycNeuzI1cwfqamXouuMwvKrQ678g
         xwTYYDUc8vWYF/sGpgiCbjgJvgv/J1zDviKGOAcAX3tLxHUhrBYq92RGXbs0V7GuLMPE
         Cfn+gr16pE3GPBLraATxudG9+EBfwicDv9AdXbYh+zv4jBPKSGdysJLWdjZtgFQfZtiD
         uCjiqAQuprFytEUWZpS4LtKzDMOqqtVbeYtUZpBW8eL9hyIQ3ZFevL1tTxUraxzkfYY6
         lAyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kAE9I5CzKGEXVndP1kA1R9ev3cj8EBCnSGH95bb1rzERfofThrTVnZ0G24GpIlfTmuaX8agWoOGqz2MHM@vger.kernel.org
X-Gm-Message-State: AOJu0YzYN7tXjp6w6LreND6F+XaZB4MHFqM8jUONNEE0Fpy3qp9yjOZf
	ptysgSfM0I4a+zyhZLkoYYe7/fHXbOVlDU/0LwWzTyZ31HjsH96p2bt/wtFYMRoNde2Hd3//Sh1
	VoJc5TpiQ+w/2ZUFetljpBCcaKi9FcSdv+I9Ozf/cx2a+TAIv8bPl1LF1ocnCRnJC1VXg
X-Gm-Gg: AeBDieu3u89uk7YNMr8zx5+MDJ9kx8NWicOsNi5DTML+u9Eci/mA544jhY7Z764LEcg
	uBaSF6Y1UqP/iU1GZ2NfsLBSyCog0eU1tDXfuT2rCJHpSUffOynmmV2jEfOhX1mb0uNq9cfrkzm
	1jybsKiBzCNfPrkUDGSAnTYa9awffupsD5uPCHWIXkO2WBvYiOpcrm8yKhBxxPooTOTF1vQh/Bl
	6cXyM8AnPi6N+ITlTNroDJF6M4BZxri+5e9ruFCRPvCfEX7bGPITy4QKqKA7Ly7KDbyjDQB9jDJ
	v3SYcBDv4QHl/kNzA3wn9sNY0LPwRKzLQeM/o2k+W1zpdbI6Xiy5XQoPSbd4gKYtfaqOKzSvD5T
	/v80juSrYHGo6nClAG7Q9WwjF2ZzF0oLjgi4H8ARlyFeE+5DDW/MtnEwbJZp7FPpHMc0A6y8NJB
	748V/2Ttt4K0FM2Q==
X-Received: by 2002:a05:6808:178b:b0:46c:e542:cc16 with SMTP id 5614622812f47-478994928c2mr5359384b6e.0.1776179397590;
        Tue, 14 Apr 2026 08:09:57 -0700 (PDT)
X-Received: by 2002:a05:6808:178b:b0:46c:e542:cc16 with SMTP id 5614622812f47-478994928c2mr5359365b6e.0.1776179397084;
        Tue, 14 Apr 2026 08:09:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c52b3sm424730566b.30.2026.04.14.08.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 08:09:56 -0700 (PDT)
Message-ID: <3267eb10-2fd2-44f4-976e-aeb4f5014085@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 17:09:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
 <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
 <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MiBTYWx0ZWRfX2dOroI7sGsoJ
 KFHwHFo8PAZdUeQw+04/x5HRIOgEKI7LRraq83xdVvv675CLQrUFhKghuzyhvdnSyp+9o/I3UBm
 j7RGyDnAAq+W7hWm3ocW0X6eERE9bFd0qlntFNHxaWsj58E0oQKXAOJIuw3PRN9Lwb2Cve938Ug
 mSew+EA20YaVyOxSu2UILUu9eF6NBAwVCXTjlDp9qvvWHJKILCYFx2SfnTxap8wBRJxye/RADbB
 lx9R5qq8jeGIUsoPTmxZafGcSUuoEeHYL/4qvtGn0WkOifyF7EZb7ItWs1KpQezH3tRu2A27+tU
 8kL6OjJKpiLIJc54iYPMwei0SJlU+jmKTQAq5cicwd7o6vtQunt7/wumiflm8pkZfj8YqiAmprn
 Yb6kzJTgIiX3//YAzeG55cJEL+h6uxBabzaOjZJNXF6YDHaF/P5rvILvgjPcrmPRJyAxcF8CN34
 y1aT5NgP2dHrtbS50Aw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de58c6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SXzkmgPmAAAA:8 a=EUspDBNiAAAA:8 a=swH9GFkNOy5Cv5XthtYA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-ORIG-GUID: BfLHCRVEpVN-wGAbN9bhE_-U8b9jNe5F
X-Proofpoint-GUID: BfLHCRVEpVN-wGAbN9bhE_-U8b9jNe5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140142
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103156-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BEFE3FBA27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 6:05 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 04:06:53PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
>>>
>>> On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
>>>>> Particular laptop comes with two sets of sensors:
>>>>> 1. Motherboard: accelerometer
>>>>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>>>>>    sensor
>>>>>
>>>>> Define both i2c busses (bitbanged), sensors and respective rotation
>>>>> matrices.
>>>>
>>>> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
>>>> poking at the same bus as the DSP is, concurrently.
>>>
>>> Indeed, Val already pointed out that there is hexagonrpcd to access
>>> sensors behind Sensor Core from DSP. I found corresponding .json sensor
>>> files in Windows for all x3 sensors, but could not make it work yet.
>>>
>>> Without these additional things in userspace it does not cause any
>>> conflicts: I've been using this for a week now, no i2c communication
>>> issues and device orientation information is present.
>>>
>>> The question is then if we want to keep this series which ignores DSP
>>> capabilities with the advantage that it will work for everyone with
>>> the new kernel vs doing it 'correct' way over DSP which requires
>>> additional json (and binary blobs?) and userpsace configuration,
>>> meaning that most users will never have these sensors?
>>
>> I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
>> there's any action on that point.
>>
>> Going through the DSP allows you to keep aggregating the data at close
>> to no power cost (""low power island""), notably without waking up the
>> CPUs if there's no other work. That, plus I'm somewhat skeptical about
>> going behind its back, since it may be that a firmware update or some
>> other trigger makes it start trying to communicate with them.
> 
> The sensors story would require DSP libraries matching the firmware,
> sensors descriptions and several still-closed-source libraries to work.
> There is an open-source libssc project, but I don't know if anybody has
> tested it on this platform (and it will still require DSP libs to
> function).
> 
>>
>> But I'm not 100% against this either
> 
> I guess it is a necessary evil until we get libssc to work on it.

Aleksandrs, if you're interested in trying that one out:

https://codeberg.org/DylanVanAssche/libssc.git

Konrad

