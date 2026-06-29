Return-Path: <linux-arm-msm+bounces-114838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C4XbFp0CQmoyygkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:29:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF75B6D607F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:29:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vu4yylak;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jj8Y3ENT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD8D2301224C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75534382F05;
	Mon, 29 Jun 2026 05:28:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFD38238F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710936; cv=none; b=e+jnyFWe4Ko/o8xc2E5Y1XklKPU117cijX32CzeHrRfWFxZFbA7o+v5rhCmtBxfh/cIuijTk3oFlDkGY0kbUw43XZFcRIBAWYIrhqt0a+wIKiXPlok7xob7REKbffAyTH1kB3FOxzqQS7SDjy+fI+7s7mi1PQ78ovQVkxNTQ58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710936; c=relaxed/simple;
	bh=i/ns2A9bAE0EmLPTO/wzo67pfSla/PTMykDg6NWWMV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrNApu8rOZ7S5hUniBhgiVy8/zXrnzSk9vMFS0GBRnWZfu47KZgfdkzmpbNBFVCTgQOdjbjCNPEMUq2Q6nfbaMcQANJW2mTXvR5NvspBXSI2Sip0ZkOHAzi+u5VCWrO6OcY0id8Bo5gUehzq5XTPKHbSg4eFI5hlkbPTWbXO2/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4yylak; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jj8Y3ENT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NwSt1778405
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=; b=Vu4yylakj4YLfU+W
	4cIpQpNvDoqCWpnmBGyUF9qgWxRzFIWLueIn4Cc/D9fpzHH1Y+0e3QCTN6RK0Yjq
	zEgCa2qCE8VYa399s6DrV1fATh7Xx9dmCUcWd4mwTpTp6ZbtJeOh7EzHOzSFsQ2U
	GhYCdbZ7ZaAVewEGSmbPNXcKEOktK7Jz3KMs8c++40zY2wu1a/fDTiXfx1cPcLeo
	ycMR5rkwvixzwVm3MpA+hZ9EWgN2Jbla/KrqE6OtYHkaTUKC8ajsad9cSQa0Xx5o
	zcswG0arSadBZGC3Vq7Jf4zSLSFL0Qn9Yuf7wGnj7vooGya93dzNY5hNQE7rjXJn
	XwbAmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8mpnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8952346bb9so1751839a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710931; x=1783315731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=Jj8Y3ENTXKHCsofnFFjdRcnbLnBEng60wy9GS1OZqqXj6xLn6vdi78EoN8+RWIwOnp
         pRU/+qqbBWjnKO2rTn+EIr8eofqsliqNR/0SffeAdojVlwvt6GSvKP2oirpLKv81vAoV
         obF2NjKZTO13CnP6/TWm94FWkUMcee9m8Pbrv5iWbpI6zWZrOIk+J83uaUV5iRSVsMFY
         3MuP2lGHDanOdvme7mdF6F50vnYXjFUE8y1Axv+oxV63dMrLDGDiI7rLT9lpbJGsqo6b
         kQp22xX6KKchWwBOhySHOIenZ7IoOqefsn6B+cbu3cFhIPD6biKq6y/BpV18m+/LHH+I
         ck9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710931; x=1783315731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYdUEeJcaNzG8VXD+Xvkckg03RgLqhj0sXz+olIF58k=;
        b=RVtJrrQE0QK+C+RgP0b6ZT/yFDXJ5v/x68zk2L0i2pwRczP/JoWTdITSEzEzhygyXM
         bfvx+KkoUjfqDM0ecyUnm+q1vno5l99KXbADW5Yq6TIkFEn8WQdiFmz1pm2mHqO5T+aC
         br7sCzZb/+svBNZ6B6YcS7+rYX0hciTD1Vy3Gt7xf6Tgxuozme99rGTRfd1FJ3gY7JA/
         Sny+Lev9vBfjLC5TZV59ibcIfrFPlgvJenR1H0jS9eDyM/7/mNbUDiFRfNIwPuNbRqhZ
         4lNrWNYkAVBvjTtdDyNS4be6yoRVoa3xsWTWdIKd6pbvprVNYApkfJwAEm1vpa7Aj/yb
         irqA==
X-Forwarded-Encrypted: i=1; AHgh+RqTAsz70i5ZMpRwLQCahyJV7fItjxTaqllIaMDXS/mzZJTZdIIoUA741EPZVo0xZCY0Jc4kW955rEImn3Ue@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhh25HHwnQ4ftegVK2FURs/57nlzU073N8HwvypY+p6FzCGeYS
	zX1YUrfZWgnoRZF9YJQR6K+BQ8rbDUdwuv2IiHc2rjtRB63ET2Gl+Z3rgVPt4PKp46AFsw9eDHO
	NJNDNTVJSoXGVW9HYuoSlGNNqDi1T7rb26ujyjJx7TlKo2F8d2zRWeFwXWejsoGOXMi7y
X-Gm-Gg: AfdE7ckjUmGynI+Ia3Ev87iM+X8FyGdGl/WEKl9PGjjX1P0drOuYoNoIrCXjCDT/VX7
	tftSU6Wos8DacFrm8WaK7XqcwRM1llmm1XAf7OPKgdYNvROhevB7ahhfymleNWMD0QX/2E/uBvg
	ykGhw5vRhMsHd3wmH2UfbNxvuLJa2JA2C1ZB+zeCxL/7ZqlFQMTvT4uvBkdz0tew5CE1yXRtZd0
	OEvtZzKYNAAk5W7dOiM3MRdg/TzbT5G5VMbMAoA0HPxE5kkzaHtJE5OJZfcPYgJ+XNSflGxCwUF
	zb2X+CQhC224UUoveot4d50OIbkO100Lmxm3SXY0LUHUXQoIF36UNkti+fUi8brXgY8fOQN2OWm
	JNpPp8InD7n/nQC4gI5Kl7BR8WUW4lbV4eAl0rVOrQjCvufSlrA==
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665505b3a.6.1782710930892;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:14ca:b0:82f:38df:681c with SMTP id d2e1a72fcca58-845b39a28demr15665489b3a.6.1782710930457;
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc5ffsm10886817b3a.9.2026.06.28.22.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:28:50 -0700 (PDT)
Message-ID: <6761522a-5de3-4b4c-aa2a-90985031677f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:58:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-6-mohammad.rafi.shaik@oss.qualcomm.com>
 <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <979bff6c-86c8-4192-bb38-4e43e57e8834@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX2SUXHUBhBOtV
 01c1icVS7Z3flHDB/S7KxzAWlKOLhtDRGAmUb2+npDWrEd/psNUBQz1MplSl7IklBjSQYiBbuyh
 4mBkyDoGEpyzaUDk81eGgKyyeNNMLGU=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a420293 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=dV9RIOcyXjINfkMfKl8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: UlsBhWaVUwdCq3zaTZrN3K_LdocD4RAV
X-Proofpoint-ORIG-GUID: UlsBhWaVUwdCq3zaTZrN3K_LdocD4RAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX5zg+Mdw24GzL
 Lm9s/0i7mwwkk7sliWAvjdQzBnD8R+OeStm8Wwz6kBooBOSVHSNr4tOeKveaCbGbYGvGQQ7Pbcl
 dJlZk3JqNxpcBAkIqgtzRHua5mt5uby6WoDXbUTtAA+SScuooMvwvOjMEnLkVvKYkiJAvnDZ79v
 L2yGN30nq0LcEnR3RqczY+UhHbU3G+SevuUC3xnLrnzhR0V5/EgoazVh1kDDisK6nopg5BgLusd
 QNQV1jPmDH7WgYQL7dajSyld0kyaDuiPxXkN4dtQodI8auvcDvbsM/4P7OLryRWNglOY+XXCjNn
 i+dvXcfK6/4vs43x7xNoWspMmI2qUJXVQIs1JVNhvhbmg87Q3FGquVTK0YtBI8TwC0GWD4jaFjP
 NF8LLWxLIvh8ObNxivJnKp9SKojiJGXKG/AtWdJJPQvIiIKwSLo5bltm1Mw4ubphl3v/dJ+SmqL
 kc/knlJtQJNMn75pD8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF75B6D607F



On 6/22/2026 7:16 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> +
>>   	wcn3988-pmu {
>>   		compatible = "qcom,wcn3988-pmu";
>>   
>> @@ -60,6 +129,79 @@ vreg_pmu_ch1: ldo4 {
>>   	};
>>   };
>>   
>> +&gpr {
>> +	status = "disabled";
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +
>> +	wsa885x_i2c: speaker@c {
>> +		compatible = "qcom,wsa885x-i2c";
> 
> This was EXPLICITLY NAKED as in disagreed.
> 
> When you receive a NAK for a binding, you cannot send a DTS six days
> later having that wrong compatible.
> 

Sorry about this. I will wait until the compatible is agreed upon in the 
driver patchset.

Thanks & Regards,
Rafi.
> 
> Best regards,
> Krzysztof


