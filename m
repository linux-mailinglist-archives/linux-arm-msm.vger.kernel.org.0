Return-Path: <linux-arm-msm+bounces-113388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opjLC0M3MWq0eAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:45:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C2A68EE52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:45:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="nPReZeR/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SGVGqQWB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113388-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113388-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51AB63008D1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE35D436358;
	Tue, 16 Jun 2026 11:44:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD03DB304
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:44:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610297; cv=none; b=qcPASl5FeEMNwUjzJFCGuF2+ESVQXOp7aB3PkEZJS4iIpeXGG6EOC9M9V/K+ifTesghk7DwEACDug8iyHdVByEGZC80jmaQgZtopA0XhYrFgaaV/rQyuCSSdbh+4q/Vg+oYskcIjP0q8pKGQlj61FJ3Cp3jctVypoLK63WcLGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610297; c=relaxed/simple;
	bh=r9n7rSawhFk2n3APa8yaNvcfOl3foSyuI8+jSLMC6Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZ6bbyPVMvbF9liv0o8hwm0gj9SkzQxUWewVbmBOUS14GguflstOhYAuCozgjKcf38/Kb+gFQbEom4Ty9N14NLpYrtcRLFbgm8aymrIlzjjbCZsFKdmtNy9fHzWcRckSyD10y/0pSV210Q8RTRGR/e5amiicEVaju/k2Uu1awzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPReZeR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGVGqQWB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACVj73474760
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=; b=nPReZeR/Nm21IuxS
	g15voOVsgC/IyaqAszZEKiDHXqD+No87PHZpmFoc8OR8e8oQoNpDaeb3ehXTTGXp
	89D/E7PpxBd5sCwOt0nkVWJ/KW0q17ezksDQWn4RD+4zKzLece5a7+JfcQQD2n/n
	wj3xR9XtHrBGnDtmHdfxK+i9owN1/vhQcJy3UuoWWDeHdEKj9WTisa/abkKMAifZ
	+sx6E6/EpbNEmzZRv1AxmaxU5RvxzGXIFPB686PuK7aYbcCynh8IrKIyMwlz1IcD
	oi195vbZ5s03FVpMoKke8HjH7165s2W2ZkrL58Z/eVb34lp6MSvyzdIrzCIn3nL2
	WjdLsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52stx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:44:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a4ca0a4aso46647785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610293; x=1782215093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=;
        b=SGVGqQWB05UhngCSMlEec0Xh7uSeja9/ualtauT5ptnzHFNOVGUYIRxF9DLerS7YqY
         noN6hEcTFxQXXIW7YVPdqCVrg2/CI4dwYX4TmuHaW/b8sYSvhRHl/pqZTxiaDwltyynJ
         nuVWrjtXxCs/6XJQBXsY7ouK5bsECCXSIPEwgBCiyo+39lCw4lSJTwebaLURimtlI7x8
         n95CXc90NF6yeRmdDrUe04JiOxypJDFUXUbMEnm+sRK6Z3Dk7z1Q732XpSeBYNmELme1
         b4UnoanFBxVBBrfk4V9TJ9ru7jnNd0rYHyA4zvKsp2JGREvgNy6up900Ul54xK5uYGgk
         bslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610293; x=1782215093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+dhUIYvMd/ZyhsxJD8pDE5Uwu0gXRWZLv+OMnJz01I=;
        b=GrC9J9Z9EZ6sM9Bx2+368gJZytWBNsYlk7gqwOLyr5lZLyIHtTtNLKw0eoPaajNq0G
         0A2m0ZBHzGrukdSoDoR/FutiCqZnqcHDhfUWmL4jbIHK3StoIHN+hAGs5JvZOXic1QJ/
         UqIQs3xp7OwESI9w4sxqTuIxuAg6Qj8gEMMSslUPdFVp299kXezMWOhkg9dqWC5Zgq8T
         Jmsu3xk+ZwnyHPSg1YwOV6v5urMMFNfZj48nwWbSIM+9pEn+AK27gTF26RPVd9j6LoDF
         n5MKU8yPYx2vXogVM5XjzzDcSk/72a5BS+5+L1L90x+gfOPBD3LQYSFdsaxRt9mcngbU
         QbhA==
X-Forwarded-Encrypted: i=1; AFNElJ+LESRqk70xk8+D+atQctaqZTx8uGOuG+5VJCIUV8fQNpg+yXn854I/UMpVYLIti7r+0LkX/SBz9WHe5Zza@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDqzbsvn6HAQdEcC2BIir+2f9rFxV1xcXLTtvgp8busnfRZqm
	AQYFPT3biAsNFY+MuCUvx40XQdlY7hIIU46qO6mS0QkUfwDhZwKXhJ06T/xeXDfi9j6DCV1Rb4F
	iH7o1Y8MLbyydk8EuNTO3yDIYxNLWnl5cf3XL9wJ2ghXFzJPJDsmA573UUYYA0IsFl/2z
X-Gm-Gg: Acq92OGd9vgtcJyCEYhn01Qrv3Vp2jYIWG/fP9ivzSwiZfJugrQNLMlX7zdYdm6zlIv
	BWttTxaE1Aca3rh7zqdbM5eRXUhaAsxwbuJfSebXFdAhFKNWUmlnAXS2ldsA4iYui6UagGLReVU
	/T/+cwv3iRj/Rtcxis1goGxEsMhAxtQIa9KOABzAsYjOADYebARlVnWDoYF4omfocvm3WlWb6Q5
	kCFv6tlD5kcYRmvwtcbVhYzi65a8dncsp1bZwVrDji6980MgethaML2aTL64XtVMbTXDuq805OZ
	dtCEx07RZNSqHkh5Js5jZHnN4pkcQRmczNYITirctLLQqZRU6Z3zQAdOfEfRu43xyz+5F21cKCC
	F1Sy/LQiLAhgn1X8X9aiv4Epa5BS7bOk1fDCdEn74CKEB1w==
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1637960285a.0.1781610293034;
        Tue, 16 Jun 2026 04:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1637958585a.0.1781610292515;
        Tue, 16 Jun 2026 04:44:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6d8c2sm611669866b.38.2026.06.16.04.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:44:51 -0700 (PDT)
Message-ID: <3972248c-acfc-4b31-8c99-69bfdba34b8c@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
 <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
 <9aad8e45-b0a5-4c59-8793-8c0747d8fafa@oss.qualcomm.com>
 <uc2l2mbobmik5workhcbtry5spe2gyamx2x4yj4rjly4t3dbrh@n34fo74rctnk>
 <6fb112ae-5919-4c8f-a915-4538d14284da@oss.qualcomm.com>
 <iws2snsi3yfddich3rqqurhwt6mvi2boushkog5t5gvo2ahwmp@l2m6ays2kicf>
 <72b140a7-e95e-491d-8bae-f98a593bdbfb@oss.qualcomm.com>
 <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zzs4wgr37wfptzqwgttxdubqnyudyh3am2r6i7b56kd3lwuo2e@bjcyelaxtlq3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX3lZQ7MeI2z4S
 +G2w8x5y+AXeiIB/STIM9BhrbVbuSfdimW1pSLWPt6ERjLxKNU/jnsiJV6JUzWTFy+nszhE/Rmg
 kVCrhxXvzsI9lWyxaGNQpekSQgnN4hM=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a313735 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zUi1tAqb9gt6XWnjdEwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX1AUZvbcQOrbd
 lqDvy80taNJ2U9wpQR4xjPZ0VMtpdYm2jv/Vt0kIT5pP98aZ7b6TqrOHSZNojv1maRNr4P1Lp/T
 MLzH7dmsr5VgFS9F+Us0O4A6rXu4gn+qBx8BzjmtViRpC+zLVo1V5/1qlVbrSz401OwDGSnakv0
 xSAde9fpTMOmgF4DFKdZ6samZBZWK73wHMTY2rITcRkNXk/qn+BkA6LJV2ilNG5bCXFgqC+75H6
 gdIVre51oB5pFkFUK38CW1az80kl91Irzr3xbqI7bAO+jJErvy77+PrTLpoAdfRIWS6h0+MKDRw
 MH5YCCPMJ3EMJKqLUxFWFcyQhQb/vmF5TIrp1RmXTfYWpS8Tf+Bprpg3YshXDTZOAz/uhl1mTxX
 QbMbEi2o3eE8AD/KLjJ4pqgxLjOW5ooyT4A1zK2HKmIU9rkdG/gWaWqifX89YLmdpVyoAA+fhrl
 6RvWz7TFHl3LvZaNCFw==
X-Proofpoint-ORIG-GUID: F0AdqFXR-gK9Xa6OO3IJ5fjoj9YgxhYb
X-Proofpoint-GUID: F0AdqFXR-gK9Xa6OO3IJ5fjoj9YgxhYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113388-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:usb4-upstream@oss.qualcomm.com,m:rthoorpu@qti.qualcomm.com,m:westeri@kernel.org,m:sven@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31C2A68EE52

On 5/28/26 10:00 AM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 02:05:14PM +0200, Konrad Dybcio wrote:
>> On 5/20/26 5:06 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 19, 2026 at 10:12:06AM +0200, Konrad Dybcio wrote:
>>>> On 5/18/26 5:38 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 18, 2026 at 04:15:16PM +0200, Konrad Dybcio wrote:
>>>>>> On 5/18/26 3:57 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>>>>>>>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>>>>>>>> and DP signal processing capabilities. In that architecture, USB3 and
>>>>>>>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>>>>>>>> The DP part is roughly the same as on the instances without USB4.
>>>>>>>>
>>>>>>>> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
>>>>>>>> Only one USB protocol (and flavor of pipe clock) can be active at a
>>>>>>>> given moment (not to be confused with USB3 not being able to be
>>>>>>>> tunneled as USB4 packets - that of course remains possible).
>>>>>>>> The DP PLL is still used for clocking tunneled DP links. It may be
>>>>>>>> turned off to save power when no tunnels are active, but that's left as
>>>>>>>> a TODO item for now.
>>>>>>>>
>>>>>>>> Due to the nature of USB4, the Type-C handling happens entirely inside
>>>>>>>> the Host Router, and as such the QMPPHY's mux_set() function is
>>>>>>>> nullified for the period when USB4 PHY remains active. This is strictly
>>>>>>>> necessary, as the Host Router driver is going to excercise manual
>>>>>>>> control over the USB4 PHY's power state, which is needed by the suspend
>>>>>>>> and resume flows. Failure to control that synchronously with other
>>>>>>>> parts of the code results in a SoC crash by unlocked access.
>>>>>>>>
>>>>>>>> Because of that, a new struct phy is spawned to expose the USB4 mode,
>>>>>>>> along with a .set_mode callback to allow toggling between USB4 and TBT3
>>>>>>>> submodes.
>>>>>>>>
>>>>>>>> Thunderbolt 3, having a number of differences vs USB4, requires a
>>>>>>>> couple specific overrides, pertaining to electrical characteristics,
>>>>>>>> which are easily accommodated for.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>>>>>>>>  1 file changed, 322 insertions(+), 70 deletions(-)
>>>>>>>>
>>>>>>>
>>>>>>> Overall it looks good. The major question (after looking at TODOs), do
>>>>>>> we need a separate submode for USB+DP / TBT+DP?
>>>>>>
>>>>>> The problem space is as follows:
>>>>>>
>>>>>> After a TBT (collectively TBT3+ and USB4) link has been established and
>>>>>> we have a link partner, we may (based on the HW capabilities and user
>>>>>> config, such as kernel params but not only) start or stop a DP tunnel at
>>>>>> runtime. On Qualcomm hardware, the PHY is kept in USB4 mode and its DP
>>>>>> AUX lines are not used (instead, the encapsulated DP AUX packets are r/w
>>>>>> entirely within the USB4 subsystem via a pair of FIFOs that Linux sees
>>>>>> as a separate DP AUX host)
>>>>>
>>>>> So far so good. But I still don't grok if having a DP-over-USB4 is a
>>>>> separate submode or not. I.e. I see code (and TODOs) to detect and
>>>>> handle DP going on and off. Would it be better if we specify that
>>>>> explicitly?
>>>>
>>>> I really don't want to end up in a situation like we have with:
>>>>
>>>> $ rg _USB include/linux/phy/phy.h
>>>> 29:     PHY_MODE_USB_HOST,
>>>> 30:     PHY_MODE_USB_HOST_LS,
>>>> 31:     PHY_MODE_USB_HOST_FS,
>>>> 32:     PHY_MODE_USB_HOST_HS,
>>>> 33:     PHY_MODE_USB_HOST_SS,
>>>> 34:     PHY_MODE_USB_DEVICE,
>>>> 35:     PHY_MODE_USB_DEVICE_LS,
>>>> 36:     PHY_MODE_USB_DEVICE_FS,
>>>> 37:     PHY_MODE_USB_DEVICE_HS,
>>>> 38:     PHY_MODE_USB_DEVICE_SS,
>>>> 39:     PHY_MODE_USB_OTG,
>>>>
>>>>>> Then, on hamoa/glymur specifically, any of the 3 USB4-capable DP hosts
>>>>>> can be muxed to either of the 2 DPIN ports on any of the 3 USB4 routers
>>>>>> (and each of these routers is hardwired to one of the PHYs).
>>>>>>
>>>>>> To underline, we have 3 DP producers and 6 consumers. If there's e.g. a
>>>>>> super high-res display at one of the physical ports, or a long
>>>>>> daisy-chain, we may need to use 2 DPTXes to service 1 receptacle. Then,
>>>>>> we would only need one of the PHYs (associated with the router that's
>>>>>> wired to that port) to provide a DP clock.
>>>>>>
>>>>>> This, along with the normal (logical or physical) present/absent status
>>>>>> can change at runtime. My plan is to use phy_set_opts(dp_tunelling=true)
>>>>>> or something along those lines to toggle that bit as necessary
>>>>>
>>>>> I don't see phy_set_opts(). So maybe a submode then...
>>>>
>>>> Sorry, I misremembered the name. The function is phy_configure(), and it
>>>> takes a union phy_configure_opts, hence the confusion
>>>
>>> So, phy_configure() will be called for the DP PHY to set the DP opts,
>>> but how do you plan to determine if DP is on or not? Or do you plan to
>>> add phy_tbt_configure_opts ?
>>>
>>> Another obvious option would be to set the flag if DP PHY is being tuned
>>> on / off. I don't know if that fulfills your needs.
>>
>> Either this or tbt_configure_opts. We still have the muxing question to
>> chew through.
>>
>> The bottom line is that all AUX traffic happens between the "AUX adapters"
>> within USB4SS, talking over thunderbolt to other AUX adapters on the LTTPRs
>> and the far-end device (and anything inbetween in a chained topology) meaning
>> we only need to engage the DP host itself (and therefore the PHY) after we've
>> already performed the capability negotiations
> 
> I hope you mean USB link capabilities. DP host still needs to ping LTTPRs
> and read all the DP properties on its own. I don't think we want to leak
> that to the other layers.

I must crush your hopes.

There's some preliminary TBT-layer setup (handled by the tbt driver in
Linux), followed by the expected DPCD (and alike) r/w accesses, which on
our hw must happen through the DP adapters housed inside USB4SS (again,
because the DPTX's auxbus is NOPed out). Think of it as just another
i2c_aux provider.

Konrad

