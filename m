Return-Path: <linux-arm-msm+bounces-114819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BRwWG0D2QWqpxAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F46D5DF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AdX/GXzF";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tb0hVFuw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114819-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114819-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F627300D173
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FC6337107;
	Mon, 29 Jun 2026 04:36:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B5FBE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:36:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707774; cv=none; b=OAjXkotiRUiEH7V/yLntmpa1GPJ7Pae6HmT1aZN0ma7sYvEOJkmP4OmsfrGxSw9eB8axukCHdg4WJQMjMdMKvqfb0Czy2Mqhy3b9a1BtkD58jWga9CciGHcYTLQ02y5TBRdB1p/TaZiyVzMKK51BObxBpJzy+/mxWmBWQFkC8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707774; c=relaxed/simple;
	bh=1vWqKd3eNE3bm0tTg9hwNonUHgCRyR2vof7sgLP4Eas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPC5Xp6frhi7IUADD0bgdKS+HVRlLDufJ5l1gQgpn/PPiRwwbSL0mQbfQizyg2LMQnxeYzBS/rqmx7N80EH0f2Rk/3tkoP+PsiT76luSkNk8obo9DFY34be2cX3+p1rcfrAv6829eNd/WXdSo1+jUe9ijiD53cirTZFOG3YD32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdX/GXzF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb0hVFuw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NItm1754415
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=; b=AdX/GXzFyeCNY7t0
	uHxOsSQWp8looAJYrwkon2GPs8JQzGe/qGMaUucy6BKaXsSarjEUkxfMrtstRquF
	0k2XZ5GqVfPm07CpYTRDrBbTyYZR1eOcqdTcNA+HGTaj431LpYSkTBElOezQ1IYX
	+YvXKfKhWtn5QInJDDave3YUBllbry6iycIKDR5O4khKraSZlPKhMLr8oOx6yU0t
	xSbQr37Ko6u0dQG1jajNAVYwcpNCOLuBkI0VR1eup1l1BaWprAtz5vZjHWmTvZgX
	ApAQpnqQxK0GX9EnIvG1UYVcwf0ZWJsl9XobZmxtmyoTV1VQM20OwWhHlkdwPWXw
	ZmeKow==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27334fxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:36:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso4519117c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707771; x=1783312571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=;
        b=Tb0hVFuwNsYGGu3Y7xV4l5YM4U3holfnuPRbeYxu5//Mc2QhBgo5S+mT2JNQiq8RHW
         157Zb00VwG3pPKBGD1zdKmYNQF8eJw2K7uMd4PC/b9CoECI4NAB+YxX1/mFfes3yGd/U
         j17khVLiitO2lCDRzSWK6NHXw5q5b6Mi+eBsxAddLaSALcWbt6cVkNo1Bd8uIYPAaT4l
         lCsSErTRWOrNZz8c01nA/Jv2wzBnYFB8LCWjnn2x0Z2xDktKCALpedmJwEL+kjU98VHe
         C47deP6UHlix5dfw073f3uMmq9MZvdYAGCTUG8Y5HjoL7T5e1zu4KOwp/E680mMcN4Eq
         pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707771; x=1783312571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K013aSi2o1LL4A83paEr1QAp5G9Gn4rQrPWRzJNpvn0=;
        b=I8mZ+SmILhGHcBUhe9GlI9S07fo8eq+PxHi4Sme4oNLPPkjXm6ue7jAM5Io+l1y/MA
         O5vN1xcC7YIN7aMXmy6jMC0di64WRVdn4QpcEe3NUKTeQY1LgE0TpwP6bF6oDE0/HjjF
         e5pImXNVwoV+ANVMbTehs7Sq6fM+qdPQViUw1v6/2FMDYQ/bR3hXIk2klRRmf0z1lhWj
         nsqVk2aOFg9Nmqlv3T8CrCbWdKUwtZ7Y5onJvzyu9ieNKC2BngFfW8JNQARVApNjY9Wq
         yx/e41CWyPsUAmmMnafk6sGjaAGyXXfZ1qE4ApBOd126vK37vTvmNu0f5By2B5TbYZPZ
         WF3g==
X-Forwarded-Encrypted: i=1; AFNElJ+5sDHytFZCOgvDBEvT8mkBy9YsVfAbhbGzhFBGcFXW3aFNUlS+aMzBhEA7XyBFOzhoyDioZGey5UvvvqLn@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6/pLRsODSU5aPbj6ey9u6Gv+GFgQYNyTbjSFF9HzGJ6MCKG7
	4Ed7oTkeRpe5yfgUZ1h2r5BzCUa4nGci4klNi3q2cW/C3uHCu61XurDYafGv9BQiIBksOAaPRP3
	HY6GKlc4dzFHNV4XlfB3vYjhtJh6a2WkTADDnF8S6LFG0uSy+gQuLmXCC+YUwrsUBUWzd
X-Gm-Gg: AfdE7cnkQ2rQ1oSuYbn9p6VQkoMLikwp61fD6o4jALDfsvtT47mCFNVd/W07Q4+XU/q
	BPXgD5+ZKd2sL/6aVchq0WIQ25PCs/qXtAuOEY6Zm0/yH5s04jnRBOsKB25pJf4GLsjpjDg89Vy
	KzJxYRZKykcduvVG+VR56hCGuofDC0uh/wavxSr59lZS0f4zFmSgovJjCGDGuYPvJlACpxGtwy/
	He3kRqX7ZDkPfuTQKNVeS8F18ZF/ZMnmJ6c3TsGS1pxaB0N7aOuoDcAMbXPh0F1vLh+zNU7qjYP
	JAP/ri3IcCxHMUcuCV0/rgfEnrrLJLb5rWkLiGMn74cVHLScQAuDbz+xfRIazjqA3aIsxvoEQs9
	eHNGhpLYXQ8DUpkvkAvuTi/aAbXNCfPjB2Ou0MZ0+KBQYoW8HsQ==
X-Received: by 2002:a05:7022:3d09:b0:138:1130:5fd3 with SMTP id a92af1059eb24-139dba2e948mr11141259c88.10.1782707770794;
        Sun, 28 Jun 2026 21:36:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3d09:b0:138:1130:5fd3 with SMTP id a92af1059eb24-139dba2e948mr11141241c88.10.1782707770268;
        Sun, 28 Jun 2026 21:36:10 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm51499458c88.12.2026.06.28.21.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:36:09 -0700 (PDT)
Message-ID: <91ce4536-b2c9-4ad1-8ac4-d7abad76ac3f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:06:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] soundwire: qcom: add support for EE-aware register
 layout
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <adc18723-a194-4e0b-81ff-6c90ec9bda9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a41f63b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=khzunKVQOklLbZjlMdUA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: RuFzLsRhHah3fwzLUS8b7Rdo_D4LSr-2
X-Proofpoint-ORIG-GUID: RuFzLsRhHah3fwzLUS8b7Rdo_D4LSr-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX2SMXTmtpJqVa
 HQUTHhmRy4UhADo9iar0+Bcyw5kL8ijA3vqizbKKZMazNcwzyopCmEJOGn4rAKDhhpgRDPXsW1c
 VWAbbbLgLQxCQAOnSdV2SH515GoL+BpW8RoMMORrdie4ve6sc4aVjKpotej7wA7/ll7+N5iuMJa
 9vwtSqY8rww3WPJF0jTHgXZhFewpzRe3ens5m3jg9aAtUWKFusc0tx7sMEvaguWXO8oEtDn0OHN
 df9aWCMUkzEChZbpGgQy8zkrjKWpDwwZzLaz8efZ0jSgGl434y81Q0ok14/zobhhS1ElACXxdYA
 7EoPS/jeq5+XiCTOAT+6J4jGYO/BM7/sydnKnYVvbitSnNotlArfUJV8qAIGaIHbbQIBEnjdRSE
 mWrr3gsxY+H+hxeEjH2oj7YKCBbKJubsetyG/lpCxMQpnMaBwE1WJuT4S7gR8W1sRVzHD8KGlWl
 jZGLLD1mkOI9vTIWtNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX3BBKKTtEgBQb
 0y0qrPAvtc0MPcWZiExpyzdo1J/tC/vPGX3czY2VtYYXMOTYRnEOx91xraPAWyprLh5fePuN60b
 H8LIlzqKBcejFiZhu+H27BVeFB9uFFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114819-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE9F46D5DF5



On 6/9/2026 1:47 PM, Konrad Dybcio wrote:
> On 6/8/26 7:53 PM, Mohammad Rafi Shaik wrote:
>> This series adds support for execution environment (EE) aware register
>> layouts in the Qualcomm SoundWire master controller driver.
>>
>> On SoundWire v2.0+ hardware, some controllers bank the interrupt, FIFO, and
>> status registers in EE-specific windows separated by a stride of 0x1000.
>> Typically, the driver assumes EE1, but platforms like Shikra have the
>> controller routed on EE0.
> 
> Do these EEs have any names associated with them, that would help
> explain why the change is needed?
> 

will add more description what this EE value and why we need this.

Thanks,
Rafi.

> Konrad


