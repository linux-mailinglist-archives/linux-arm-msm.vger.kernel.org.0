Return-Path: <linux-arm-msm+bounces-107720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIUZOn29BmqMnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:30:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79B54A005
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6D6F301E6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 06:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994E037F8CE;
	Fri, 15 May 2026 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bT6q8Eat";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQF/F6xJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299637F8B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826616; cv=none; b=eBoQDmBkoTvtV1UUOLM+XnbHBv8vGyFRKB22tZSyf8BYX1yEGEDhOI+EQvKZV2KP5N1+3C6xPtpS/Zju4xwM1B+2yBOxKsQzxm2nZKa+hc9Wk7e7jwnbpZeUSrHtnBCJBaaa76KjBwc19uxU53AHvCsUuMdE/9l5gJII0fAaWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826616; c=relaxed/simple;
	bh=4OhkOUm1uinge3W9lUySjqDtHM82URbONjbpN6SzBlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LinfshIsy7B1gyH+Rm5jxvA3KEcCRsOz8bWZjTAcWcOBvmb8EBf5Y07g43bLGYry/SulwARg73yjJjeSB6sR80l6+6LEnVaJs+7tZg9th3ME3gtOBQ8l0Gmj8F4N/W2M4TgsA7ZDVfMx5GLrS2fcRKZvK1iqKdcsa0yff+tq5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bT6q8Eat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQF/F6xJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Q3WN3197600
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=; b=bT6q8EatEKwk6vxA
	WJJBCA6dFpa1H690UBjIpDA4OpSfUpE3jcYK63S6pyQd2qKOLCQDORLgOL0NscT4
	e4i3k2XLTLIqQ5wJaJiiu0kazftGdhggq3SlOKaqR/37IIvnd4cxdW/xRpw80FOe
	MEhiU0QZfAv8jT9CZlGiDlwUTxHVqweqxgx5zimpeh75gjlBnvYd1ubKGXsArYIX
	TTFnTiDDlw0bHhgQTmtJcZ4VPADHx/HYPI0h45BOrrRIFpqlejRqplejXeiNzqlG
	aGYmYK4x+nQFrduTKmrpvwt+vPcg9qzTBUGfi8t4fg9tuRVj4IKTEB0AJjqhTA5y
	G0AR9A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1q9wag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:30:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b46c014a26so189408766d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 23:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778826613; x=1779431413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=MQF/F6xJEYCtlYvsmTFzdaFCOIX5JLulPTuy9HFv0X85L3D5n6KlpvIrWJ6Q2DosEr
         aX64tq3fxAtz/K2T4rtn7/q6aJ/1cuhk4/1s6DrQqXZ8GoU0WXRYO5jfg+2AYmuJlnbE
         9POgI/+bfWEnvbPeFW+lFDWSFi6gC+NQkWfqcSkl3XLyTgI/v8IR+KEEhj5zWwGqf1g6
         KcvPV5bUcF6wqLoQErUdJar/teDL552Yi3qT8lpXrdX8gRlibGbhE8qBGvpFiDsYWdeq
         Qp4RmdTADjorRlhsSp6wUKl61wO25VovhUZzkhXoOzPaH1bWlNd9NUckZADTZrZT2KCc
         +61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826613; x=1779431413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb7U1c0ZK+6x5WATBstJlJ/LiC1OoHYdzdqkvWGt0dM=;
        b=ZvbAkKM92Wb6UvRpObK6RA7iG5xiE9TaB6WUkR8MYX6zFLBvBduyewUGf3k3w8dS2n
         XlUg1f/Rb9/1gn0VwZKyPfoNpEA96oFlLaLpbtsja5KXoDREtoSOUj8MC+vbX/HL6XMu
         WNhEnKdlkX1EI9QRblQubmPBN1LNiKlgiW6RhGmA1mw2bKA6I4E5nQEtCVM5BEKa/WKQ
         RCo7RP9J8SJulYvU/fkM1nt70Fqgn7A3ZM9WGbLs1GR7lsJ9uWt30DiVG+Hp/4BvCF8V
         AWLYYzQhEJKCDtt0NDMPlBTyIK9pEWWenKpe8QENNbF+wbngqbsrZYoxl+BJbU825sp6
         06og==
X-Forwarded-Encrypted: i=1; AFNElJ/QvfyV3nPyQ1D0ZKJmNQgRXoxhG98dcprJKGdhsm4+Th80WcPT2lcv2TqQgiTpCbyim1qUary+DYWaWr+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkr6Wy2j7O6lDVCyX/VJBVbBIzpcTLzbK/cQbaI0BJXV5BFouE
	j3GQyybk6dnCKR0CI3lug2Sd8VJk0K2JOiDYQoBwzsUdttv9ODgAoSINpXjt6FoBlMbmqwR4j0H
	lqMalAb4NhAt6Ysz/4Nsek2tUoa+i4BOxxxEe5ZbMVczKcMh97amWGj1DscvvSKHko5C9Yx4Qzj
	PK
X-Gm-Gg: Acq92OH1jb5MTibE55uAeERy3fWVFgoppPiF3/oV7gwGU6bNpMIeqemuLCrTjKwlM1V
	yQT4/yz1sBSpngn9rW+ssEjQHJvyNJqpd3piGGg+sSudEdkqbYaxdrwTLiwHQ2l2aVutGE1iR+M
	LvfvfTuTVB1/gSMWgiFvNiaRsl9GJsDZ8JCaD8x9ay6o6W8ClHo6kZPprphNjhLR3DGlxE/4J+x
	LCfPgzHteIzXiMkWmFvYFxM/KB0df+a6YJkCF8NnkTdJaRXYZA+3tuX/uGKb6GqxPhUA6Mz8NrS
	uS797FmUPZkl7/Xm2OS64rzGSXrdv0uO3CZsShUM9z9vdFoBGi6rbSJrIJlWB6sYrhn0M0SzS2+
	xVDpukSCPpH0UUXt87YxbDyxN0jv4WFyuzOy1M5Ua44GgRxVnvIpFYJRwqZbl+qv42s6lmUmc7I
	dcDEp+59qA
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977776d6.9.1778826613186;
        Thu, 14 May 2026 23:30:13 -0700 (PDT)
X-Received: by 2002:a0c:f109:0:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ca0f5c456amr36977306d6.9.1778826612525;
        Thu, 14 May 2026 23:30:12 -0700 (PDT)
Received: from [10.111.160.50] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908f0d92esm43711496d6.19.2026.05.14.23.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:30:11 -0700 (PDT)
Message-ID: <7d34bc76-fe49-4d8c-8ac9-f563c2c35fe1@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:30:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
 <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
 <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260514-carmine-magpie-of-imagination-5dddfc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d577WSVToChvXAfjc37L_6YVsU1tLLGZ
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06bd76 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CMSjfWuysNDtZblWgkUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA2MiBTYWx0ZWRfX0Prjo0UydxRk
 5eeScx2fKg2Ki0EUsZ53Rp7OYFrdhM32NgDKsOHkg1cmFTPXXMMSk3mH7TDc2N4UKFx795VIPrP
 E+js6pf1stypy2fPZwIa10s7K4I6HJD1U2oCKBnu0NGSmw7mFpS3iyjfqSx2WS7GcKliryi9vrP
 tc9+pMSr7O9vb2OlASsWnZHDYOnaF4X/ReBZiV9PQPg1D6mgEpnmyeK4f7hywdsK+lzsWwxL7zD
 phtARWaaHTCR0scpQ24kwxk3D7Lr53dmunAEDC/anXqGH3O/9uIHatUaKIL46p48LvjR/4/pL8b
 sXorqB2Jvgd3ChJJaoX4MKA/j3IXtWlhq2NKLHMbbmx1kzx5F1Aflq/2k6k+2clqeVty6khb1kL
 iaj93qo7r3EsUnDf3hmB1hfKIKFfxVYHXoiu2R8Ndijo4xaHGlp0VPvgngJLBEiQgXmRj/i88eE
 NGqfYtbCfWtEWyEMQdQ==
X-Proofpoint-ORIG-GUID: d577WSVToChvXAfjc37L_6YVsU1tLLGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150062
X-Rspamd-Queue-Id: 4A79B54A005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107720-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/14/2026 8:19 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 04:59:34PM +0800, Wenmeng Liu wrote:
>> Add bindings for the Camera Subsystem for X1P42100.
>>
>> The X1P42100 platform provides:
>> - 2 x CSIPHY
>> - 3 x TPG
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 1 x IFE
>> - 2 x IFE Lite
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> I do not see you responded to previous comments and FIRST one was not
> implemented, so I am ignoring the rest. Not going to review this.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Apologies for not clearly addressing your previous comments — that’s on me.

Regarding the first concern about dependencies: in v1 the series was 
indeed based on the csiphy rework, which pulled in a large set of 
dependencies from Bryan’s changes. In v2 I intentionally moved back to 
the existing (pre-rework) csiphy code to reduce the dependency 
footprint. As a result, the remaining dependencies are now limited to:
1) Clock changes (expected to be merged soon)
2) TPG support (planned to appear in linux-next shortly)
3) hamoa DTS

For the csiphy-related concerns you raised earlier, those should no 
longer apply with this approach since the series is no longer based on 
the reworked csiphy code.

Thanks a lot for your time and feedback.

Best regards,
Wenmeng

