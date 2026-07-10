Return-Path: <linux-arm-msm+bounces-118275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nqKQKIznUGrm8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:37:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6D73AD5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:37:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KRImbWqE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CCHwbI5P;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4C90300C981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA324279E2;
	Fri, 10 Jul 2026 12:34:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD342314A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:34:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686844; cv=none; b=l1EvnVc3wQI0PV43kqSe7xv9/OTwWR/zXxfuWuGqUXH2vEbnOQk6BvWSYN6kmbSdXNfSGXbpYPZGJiCd9qfK8jBzp+DP0CdGIw7Q2V1jvXsAeXrkHvj1PSHWOkEb/SNCRTns0XxpjWBOIBeKwdCR2S9v3aExSLQpdDdAbkRblyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686844; c=relaxed/simple;
	bh=gmNJ4oLCqisfWMQ2xkv1odn445Wq7mkxpGEegNDrq9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFxkkdVROnWg96ER+Cd9vc7sEDATczhRRXH4LQM+hJCBWftdSKaHx94zqKEcmgV5qBBvlV8Jq2zzv255oiAQ20wYP/0SlV1gJBb/u3TJYp5UXVR2HdoAyR5h79kl4YZa44072r7wHr0DD5GU42EXIrBmTWWjb3suJGfe2H9Eegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRImbWqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCHwbI5P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmZcg486437
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=; b=KRImbWqEJCCBH65E
	35JRXVLMJd7Epy4gVzPxnoEBD4tgtOiLjrGgc7VFqdk9yVX01lX7M5Ot3QGEE035
	eUXk4jd4clXRrrsIelZy++ymfQyUK9N5Jzf2Rzom4EeTvDUmSqngsq8SaE8CmNMJ
	9sL9tVcon5H0RoRxLdfl7r+NX/vwoJLpVny3Fwfo+dUlODNuTOea6KmLJ8693BTG
	M+ICDBoRenJ0ziLRec+cJjVOlhKj5nqS6dWp7yYHPHhunZgkBKgkxY06sd5wy/5t
	Rkt1FWf6EPeUMX8O/qiBXNO+4Ao1H+Q8RGar45jy+jpHySEM1ikcgQ5+gxkWa3ZP
	qUBYAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtb0bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe683bb91so2279136d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686839; x=1784291639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=CCHwbI5PQ9zTh+vE+92XlwgSXRby8GA+jmEYEOs6V7cPJ72xQon0KwXgXbXWe0lvPp
         VOGIYIrS0QPDNlyo8koE8R5jrDO20zkVOO8JwOMFUDJxdU8YRGXYNgVsDHGaDUX88jhJ
         5FJNdeXm4+Nd4x668gPmvuUL1Gu+oclvuRlQBo9F2H8q4lDmS5fTFq6+C1xCJOfNAxcY
         xGsspz7jBuulZDCLytxoi5XG8Es2bM1ZQjuiHbMs/A5VIC+P3i/lf4zZi1L6XZsh7VNk
         1CLppcSsYy17McMjgP6h2lgItB3zpSa8Fw5PUV5co/MplyQIlsx+jnJ+Upv/qce9lcGT
         2LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686839; x=1784291639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=IDpL6+6N313xYNuMj2bSI2Jz+HVOwjytvnc03BUUEiztA7JFEA7Det/3bXJ+ZnCa0R
         2tZPiFp5sUtRJceDASVoPbyjK1Hg4TNWUJ/jZqWoHnRcDvUPLCSHSGdGZiLtUjZ4F0cF
         UUHoGkflzBSPWPiFxRehEiK87wVgRO1+cyLDaj2cQcvXjV0XmYceSLCaPQy/5vntKJzV
         C/nQV/u5q4QrzQSrjHUm+eNg3HlAXfWlaStMAD6tNGT5MWis3VVMTq48nKQTj/gyeHJK
         okAHvlM9Zm7T7SwToBUC2zszK0v3u1KRdrSxDV2c3BrKSmEjE+RoWzWlt6ounl0H7OW2
         SDwA==
X-Forwarded-Encrypted: i=1; AHgh+RrhxnHOTrIM/JOG0B0HiUFtrVrNW2a6jNX4bs00KkoN/fegJcfNpp2Zd1+6LMdnriiCrydYQ029WAVY/0ci@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zRpW6kD/SLq+TjaHZL2AxI7JT+WQQ35FmaCGHlNjMRFzNE5g
	MiUnN1wwTevkQHHRlIIqsjzgr2QWpFKFQ/V8HGcP7iBuG//QzhV4AVve394tJSpbhlD/+hQdB4X
	8oB1HyRuPu0J5dCtdf5W/BD/WSvHyBvS0rmkL0jiWfZEE7KnI66kbV5VZQsSDaGb7C1oDchVPVg
	aO
X-Gm-Gg: AfdE7cn79k5fukbJHupH6vSFqsd/T+4/RCnlUbZ1W7J94akdDRmzPGK9WH3lVLu/SaI
	JlfZ5T81/h3jVa2/SMUzV+E5BQdsrUKbedVZUxf3WXQ5Ukg/okg0wlmI+IDGPkUyX8hyYx6vMur
	jiAFdZ/NIQx5nAddRROBDWNr2/qkics2f86k/8qf6ssD+VIvvQtNY5X2H0fH7Br3JaM0U+OOfzL
	vBZYtgx0vEjYzaRwSLZ0hnEzp/smvqWop7IDKO06SJID8aQIACwLDEm3lkBsOAXokL/Hba6V4zq
	xSLp2JHMCxqR4HLqALjLIHUetN5XigFNEwaIKz8KyI5qC/nPcVGKlbKyi8IoISfthUdK+osoiyq
	vceO8Mev16ckm6gphNWUU2Pu9X0wljy5YAh8=
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82841046d6.5.1783686838734;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82840646d6.5.1783686838278;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10705561a12.10.2026.07.10.05.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:33:56 -0700 (PDT)
Message-ID: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50e6b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dFzIMAVjCySLt-5DOyQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: aqI0LzNe1sd-wvhT3aqjvO_hNyILyI-Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX6M+nrB5S7MfX
 4tc5HpyNlZRssthC1SZfjdX2btT2IDwzFT8DvPXHeogVUyPCcYSkZ0FADOV1RAOkbKNmpWMWZqh
 ESLc/VL9KSbI8hureUQmPo8uVwYGGH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfXxlCaQbcx/ptG
 6tbE/qn3Mjz9iUwoFybalLw0iDIx5M1qB5Xm+kx5AOy9u3P8Efzgi+IsRLzbFU2660hTJWONIR/
 nTJqsceVd5y5dKyIFHHPzzhoAmXcssV1zPzI95suOhR5NRJDBdz6QArzh9cYD4c+q07Z/K3DBQS
 4s5Wt4cyojFfTdaGrekUsJ5M96vDSIEuT9OUGJR3PeXrgVtLSYxHJndIyzvm/BgQZWfHdyZMIWu
 kK/V3RA29SOA5jeeLfHbnVr4+w2RuslYKPsrkNYsMGOVYTaJkL2oE7oY7IjQeLB4Voh/Kj/Mpkb
 t/yO+ONEtKSW8jC0P2XNR2J9w/GZ6ABIhyIe+fThcr0nHDIteDBoi8ueWxfdX+SzFkKWxLBGiZi
 KFYcBIQjmwZNnWz/QPBd7v6BTBM3+4bKdBkKQPZpr+x4sn6aGpZ3bLhH1wxnr6dVH29+4S0Bg/5
 q0taDNW+edsSPlX33KA==
X-Proofpoint-ORIG-GUID: aqI0LzNe1sd-wvhT3aqjvO_hNyILyI-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118275-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17F6D73AD5C

On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
>> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
>>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
>>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

>>> Which way of representing device nodes makes it easier to migrate
>>> existing platform to the CSI PHY driver, while keeping compatibility
>>> with old DTs (yeah, ABI, old DTs must continue to work)?
>>
>> Quite frankly, I don't consider the existing (meganode) description
>> any valid, and would vote to rip it the second a replacement is
>> available. But once, not N times.
> 
> Rip without providing backwards compatibility?

Because the existing bindings make ensuring the required performance
state of power domains impossible, yes

> One of the options would be to follow the 'venus/iris' approach: land
> new set of component drivers, which target new platforms and provide
> minimal support for one old platform (maybe via autoapplied DT overlay
> or other similar techniques). Then continue migrating and phasing out
> camss driver for old platforms, while adding support for new blocks in
> the new set of drivers and ripping support from the camss driver after
> some migration time.
> 
>> This is not to blame any of the original implementers, this might
>> have seemed like the right idea for the tiny subsystem on msm8916.
> 
> Maybe...

Interestingly, there's a number more peirpherals inside the 8916
CAMSS too, I suppose some enthusiasts may poke at that one day,
there was quite a sizeable developer base for that SoC at one
point.

$ rg @ arch/arm64/boot/dts/qcom/msm8916-camera.dtsi
15:     qcom,msm-cam@1800000{
19:     qcom,csiphy@1b0ac00 {
41:     qcom,csiphy@1b0b000 {
63:     qcom,csid@1b08000  {
87:     qcom,csid@1b08400 {
111:    qcom,ispif@1b0a000 {
155:    qcom,vfe@1b10000 {
212:    qcom,jpeg@1b1c000 {
232:    qcom,irqrouter@1b00000 {
239:    qcom,cpp@1b04000 {
273:    cci: qcom,cci@1b0c000 {

(there's probably more hidden in magic reg accesses)

Konrad

