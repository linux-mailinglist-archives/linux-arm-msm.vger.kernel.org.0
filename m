Return-Path: <linux-arm-msm+bounces-91169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBbUNtNMe2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:04:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B52C6AFDC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06C813002B54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DF938551E;
	Thu, 29 Jan 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hg0gYMoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S793OF0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E237F0EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688270; cv=none; b=uBIug/lLc8uNjtHNnMnbUnTkiVwEXV49zf/tUzz6s/39DeuK6TEzhTccSnPCE0RYhRWiZ9BjualdIHbBsOYm9DU9nIougnPP6bJBXuIyjKjQ5oWSJJq7Opl+VBJXLyfuJJdByIE74Q7+lnd2Kqvsfh65Kpl/E+5zk8U0LNNM9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688270; c=relaxed/simple;
	bh=ohEkPql219VZK8RP+2tL4A6dFsp190JpCnuMrfygOwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inWObxsf9jcAUlnyXHWRBgJM7u1023S3EijPY2wMbtlM0IJYDTLtEu11Sozqc/ctjLYZvXnZLrx6qcuV9WArdWXcD41+bA6oIAjTHSAZqpg3oBabVlcZZ6vAeOPjZB+2qtZpkkPKrmy3wZ12GqNHSDGHzrRYK0MhekxR1GN6jr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hg0gYMoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S793OF0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAQw6T2501984
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=; b=Hg0gYMoPPhsVsPkZ
	5oU+PW9jBKO6uV+5wNus/VGr91lFrTzzZyPj8PTbhOjsMutHEMNk0o9Wt4dZWfQU
	1zO/UYhYCoL+F5CMIIlljgFSvYv67Yr8c2F40TgtFJar9Uhyr1AfsBQ4GI+ilInX
	nIohyAwq2k8ZFrJBTzi9WE966bmCkQ+JLsdYdY+zCoBAWNj8GzI83kZ7vylewVI7
	VgOINDUegI+x/MdN7Rzw1gUZFpaENGHNH2Nsg3o8ZkKeakduG09MXjUi2wLPBaho
	pgzEgFZtDRPDAENmzsudD8yepYl30f0gNJ4hJiHGUyJbvHOADO1dFD6zaklJ5J2R
	pfpgvw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbr8mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:04:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88880bc706cso3313856d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688268; x=1770293068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=;
        b=S793OF0A1UHrLc/a2/yv/97yl00DKbK7IMYWdzJ/AYOhKCPx3tC8aX5+ZNRIdsxQwt
         YTnXiNICCUijxi6h+jqGKtmr3fBR2IYKkZCtD5Y16PTQ7WvsQGtq54xtOLxbDZtn8AS3
         nGO7pNqGtjG78wzym2vMrPuocq54gDbPNKFjrtFRM8ohC8qf+QNqjuHkXrjrKcOJJc0E
         9oDUo/Kj3H0Mt/w2sfI1VmDTlv5sXSEortZ0O5YuIGo4KYiOQkfqZc2vnxIQtI2NOv0G
         X+cYO+u7vRW/V6ItAOdCFFl9pNYhZYISzp7yR4H0FISTGny5dFSb+QQXjqP9GJSEmRQ5
         pQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688268; x=1770293068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL2nkAcLlmCCqZuSLSLfneU0UEPMFxPYDUsIHnqOJto=;
        b=tipT/qra1lU68HNlbL6vyns6ONtbvYesk4CYmxbUB3UrN15BJExu2A/IKWbY/NqwVn
         HstFSypQl/KLbuAyWJliNHuGF+bI8LW/RolJPo+pg7dOHeMCHnp1Ws3t4+6XSRUOF3Ja
         ysF/0U3ggSbjWnAR9RSa4wTKIKnZm34StShePaU7404QJEE8N6hOIIH9oJv/rlbx6Kkr
         EJ2tkimXQeDBidS0ukgTyWy7d9Ic4s87CbCOJfWb6RLxm5JigIavDf5OynShsnj0O9pD
         dJ1AmcmmRlGsdWyCOVFOkW1Npe+Z4/Syoe5ASMEaIk5nPRNr2L5pqy4YMM0+p1ayK3qD
         Vn7w==
X-Forwarded-Encrypted: i=1; AJvYcCURVj8riQ/h+Q17mXii8Vyy9P0DyxBMM5hh+RphICTfF3wPdQ1wLWJPoC1xUHlDDupKBxmC3+QP0xCQn6BR@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjpiD4C0vEDaX0QnuEe/vf1ADGZrhjWvN65qbgOrzqeDMPvfP
	P2iVu2fB1NoYXptdpACDPG6f8ze9VcJgb3LxkfvsbMeFeRIr+7Ny56IcPpXbDnSqFALI508tU8c
	mcCxo6AO+D5Q76SRcjoiQ/4R/PnZZ8wMegW59qrTjSl+JhNsLCsM5Go1wNgwdM499MUzx
X-Gm-Gg: AZuq6aLH4espw8XoQmCOCV/J4XzplXOmuFHoLWj4HL6EUzitD/eLhvoCRJEvSX5PByR
	+upRzE1XERU0DvUS7ceXCIo+CPW5wjEzo1f5XzpoNetmNi72dv9EY+SHB/KPlrJOMPgeHquTO1S
	UEx0ItBbajVIt2qcO9EKtH0FhbmceO8daY2uD0rs4AmMOw3T3/56jNRGdxXFN0g2LoV6Wh7Docm
	9pMKJHcY8w64jgIcw/dmA8jovym5/Gs6Y1iHop/yIeSRsuIxdmyOYPQoafPs8c9OiI9U4p3UZ1d
	MPjwcXXEb/IWaMrTOxIgYUEmPqRO5c9fyE9H5vfp9mkRpZqxinhuPErCohAePfFdCskSuGLPw+n
	D9o2fboqPJiAgECqyiUGA1JgDksToPliTafUbDiKOD4XnhjEsJPDDmNQmSv7W5UTdWAw=
X-Received: by 2002:a05:6214:484a:b0:894:9d32:6160 with SMTP id 6a1803df08f44-894d7698176mr45530606d6.0.1769688267690;
        Thu, 29 Jan 2026 04:04:27 -0800 (PST)
X-Received: by 2002:a05:6214:484a:b0:894:9d32:6160 with SMTP id 6a1803df08f44-894d7698176mr45530206d6.0.1769688267159;
        Thu, 29 Jan 2026 04:04:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d0asm2858193a12.18.2026.01.29.04.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 04:04:26 -0800 (PST)
Message-ID: <6244680d-f6c3-4aba-8e12-61093e51f76c@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 13:04:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
 <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -ARQy-MJ-zfkPzBjknGi2BnK_bepwFkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MSBTYWx0ZWRfX9beBQt9SVyIq
 OH3K8h9lrq36VLOq/clwt1XcWugAWxEfBxGwFN7zgjbRO07q2XV0lSNWHi8RISTTsGjHhR8eWWh
 EhCm/nSk1IPobPCQ7ETSY905Yyp2K3/wgKpZwfrqUM/VH4aV6V5AVISl13yo1yupfpwafTNuWZ5
 1D6EqpYZaQPdHERHMsPqZj9EPpRFN+enHQeRckxaYzIPilBJCb/MykbCPmd0YV1Ga5IwpKn5W3v
 CMdoyg8O2H9u0mwsIXzfU121TWXewntCuTwEtav/cTVFXtdxBVjX/jBy5K0+SJLm9VUBCn+oWF0
 uWYODo32MMcuvmc2ZzuO2k6PalyUOAZD1SHfU8ra9yrWPjMk5vIAYY74XnU3Px1FzLc1WCVxBin
 PzjcZFTQvijhHNfp/YEgjKJcVWTKYtYKmm0pxwYvb0kkipOjop6D/POEP/WV1qHqSZD0FRQeG25
 Uq+8KE2vInKO6M9HZvg==
X-Proofpoint-ORIG-GUID: -ARQy-MJ-zfkPzBjknGi2BnK_bepwFkY
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b4ccc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3FHYLhF6MVEL7NXZVLYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91169-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B52C6AFDC4
X-Rspamd-Action: no action

On 1/29/26 12:12 PM, Abel Vesa wrote:
> On 26-01-29 11:45:59, Konrad Dybcio wrote:
>> On 1/29/26 11:41 AM, Abel Vesa wrote:
>>> On 26-01-29 11:34:07, Konrad Dybcio wrote:
>>>> On 1/28/26 6:22 PM, Abel Vesa wrote:
>>>>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
>>>>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
>>>>>>>
>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>>> +
>>>>>>> +  gpio-line-names:
>>>>>>> +    maxItems: 185
>>>>>>
>>>>>> 186, your first GPIO is 0 and last is 185.
>>>>>
>>>>> Actually it is 0 through 184. The 185 is ufs reset.
>>>>
>>>> The UFS reset also happens to be a GPIO..
>>>
>>> So the gpio-line-names should include the ufs reset,
>>> but the pattern not.
>>
>> Why not?
> 
> ufs reset cannot be configured as gpio, so why would it be part of the
> pattern?

It's certainly registered as a GPIO, as all users of UFSHC refer to it

> For the same reason, it cannot be part of the gpio-line-names either.

Since it's registered as a GPIO, why not?

Konrad

