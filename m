Return-Path: <linux-arm-msm+bounces-113159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MCRzJSfaL2rAHwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:55:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB3685832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlzXNYWl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kmKg3/zR";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113159-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113159-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 703EC3025F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E037204A;
	Mon, 15 Jun 2026 10:55:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15586371D08
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520903; cv=none; b=s91VINot4IXEvC3n6qMo3qU/gh4kUyIEOFi9vdVHFIdIQGOubo2yPSYkO6GMBIYkB1YiKIoIOwrkTAsifUiD3jgXmDshYru/KcPs6mnIHrMUV3pL9Akg/Vkq/B1zrLQY8j01V1/FiAygDLJgIcUTBKKGh4g29AZI40qq46wjyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520903; c=relaxed/simple;
	bh=aOobQK20yua6U1wDe4oqjNjdHc04iURP9CqK2Qxb0s8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fr6jMp+gfsFtnH4edZHdBycxNLdC7OIYD+ybXqL6Tz+y72b3H4tTiREPYqM4xB1p9ZgSSgAAN/phOEAHXsWvfLxthMXpw84MZRV4S58zc6Ry1zWieF94Xv57gtq5e4bEVmgGAE9JBmtQO3317BLl81TfQ8HbNoi9Cx4XIR64C3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlzXNYWl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmKg3/zR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoYQI2481785
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io1gymftJRX223MXNKXCnss6iPbXrMIBvInvnj4sz+w=; b=IlzXNYWlmbirizL8
	vVPYMvIoUdW72ETny3pXNfGEc7zj6xdkb5DCEkvsrAeAnJJBXJUxh2pe3gemm9XU
	ksRqae1fgMncGsxBILgRbgkUpaluRddEPreM7VrewaZ03/dNKZBCXMORXH0JYYyB
	Bkk910+CDlIYzmuE8aLH/LN6qhNicKTr9LcZHkncyjjmCuWlwjyqnlJYSGWO3WOU
	x8/3yzT9azu3ADyL5DVubnJyO3CiTuExseQy2oebu63uBIs2yVGsMD7mAML7hZcm
	tjeP7qXrntgckCOsm4otD1ZwcicWhKjKJPS3BgpxJ99EU4rALYLQxo7NWG/uOZH2
	ICB/Jw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete980g55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:55:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so2538280a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781520901; x=1782125701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Io1gymftJRX223MXNKXCnss6iPbXrMIBvInvnj4sz+w=;
        b=kmKg3/zRHh8qcNX92rt+XDvicKlN6GnG4doPa/kTzFWfmSwA6ws2Bjp8UTcLaohehs
         D5pjFGtux2p8Re0FyC8AoDnnQv2W7baiMsh2rrZnfWqbyHGpINucSHeGXXCP5X4uxR5v
         7xsEwdN8NZHmChcd91dDYlbGIhGa82/dNbG+u1KuCv06WxQeit8xXSgO7psxpFkZCO4p
         KRR9i5Hbst1McvBerUSQiCAo19b8x/tXgtcKPxKYB0LAfqPhaOrL/DGI9WS+oL5j+ZCH
         j+57/EKJIYW4b82rZO1Nk0JD3ay8upy/KdZRfynxdK0rAaICKz4JNdIIzvKkZV7j0h3U
         vNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520901; x=1782125701;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Io1gymftJRX223MXNKXCnss6iPbXrMIBvInvnj4sz+w=;
        b=rWy43Dgs1dntGqzYjev1jlxrT2/ubak5qLa4HkDsR+6l2Zete2oKxenNKyeVKeswWf
         0ZZGr7FnZ9Nla8PjCVEsq9Sno4FwKv3DiaZteBgmAaq39zbFCzhEaM0cK7ZEt+tpWTJc
         6xJ1HKYu/ab01qVL8p9ojE7Rzw6aWRlV4oRSPQjiovSzelOXVGiX7U+xcNL0KXc/lawv
         ps2ioO6maj7ZLy+NVWw6PyQX+uPlOdxCtJRiJ/eTNT+KXN3s8eAW7MY64sxaniZLabc+
         i0UUMjAWMCgZEBMIfUsTqbfXQ2PUFeMI5HQEXr4kxYNOQndIxi+4izwMos3dW9cQyrCO
         WeMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qJVRprOnNSRAtkFTxuPXQ5b73fMNPAPrRcZro24AvnvUsK3odsjP4/zr7BxnZ4iaDomm1qHTuHHNaeMQm@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1BgWIO80pplfuG5hRQHGPTsj55CI+BkDpmSKC1gl32/6Fr4k
	/jka3RLXdxX5ZP1F/CvaiLtY/jijsL80EZg10pV2CPGjYWKOWr1NC0oc7/XgNWSJDwPXhb86uPb
	1VjDMRei2CwXyE/LKAjLOVoEvvB+Hc+mChkjwx+tFPmnQWA4Vu8MWgspWUzNgwqUh7cuN
X-Gm-Gg: Acq92OFyuHR/8Os02glMVfFFAoDSHrthuVKO8TYIXAyAurokdod26cHFAv7eVy82XK8
	GC5ulA3TAls8UfbfNu+3wl+vkDewyYPQ0BQqoeY0U00zpKLV5JaJ3gIlWz/7JOBxqsxcBLmxM2n
	ZP6Nv6sbuQHrfmog7TnTgafxCQ2tf44/i47ZNpqCi9NoSJbkhxA+f4wrBtlmStYKnVDw/9BRfsm
	TQWxevU4hZFidPDG12+f1OOQdEmU3j8qYDCCB9GQpvHl+/8B/0NWdkWE9qr+jgldarpYXyXZOBa
	K0jKI/JDxMSRQSP9uzThspF8owrY6HRNAvRR30dUTCX0AmQujZJH9rgIHYUFrqahImEqc8Q0K/7
	ZIUnDM2jcdZ2lP8miCYSMZgvqIkbvvkebihruapkXqylwtOZ4dZz/ZoU=
X-Received: by 2002:a17:90b:48cd:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-37a0497dc45mr14457457a91.24.1781520900646;
        Mon, 15 Jun 2026 03:55:00 -0700 (PDT)
X-Received: by 2002:a17:90b:48cd:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-37a0497dc45mr14457432a91.24.1781520900191;
        Mon, 15 Jun 2026 03:55:00 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a212ab3d0sm12470200a91.16.2026.06.15.03.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:54:59 -0700 (PDT)
Message-ID: <4d8d8c44-6611-4333-9906-580b70235a51@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:24:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] soc: qcom: geni-se: Keep pinctrl active for
 multi-owner controllers
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        Frank.Li@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260423145705.545552-1-mukesh.savaliya@oss.qualcomm.com>
 <20260423145705.545552-4-mukesh.savaliya@oss.qualcomm.com>
 <ag_HGVQjIQuMoKO6@baldur>
 <9a0a2ba2-4f1b-425d-979b-fe59192bb2cd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9a0a2ba2-4f1b-425d-979b-fe59192bb2cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a2fda05 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LqfbpYqSe3J_4supPSgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -XglUyB4dEme3ShQ9VHKt11gC6QqmS2n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExNSBTYWx0ZWRfXxpTAUrTT5N8k
 Z8AiDQ86owYErJv7/3ngRexS4ssNVkCSXqHX76NwOz3wSUAo8VYXk6YqYQVCPHXY19Uv968pDBa
 2NQMSQnvyZohHSJKMjw9C39iYAiPUXY=
X-Proofpoint-ORIG-GUID: -XglUyB4dEme3ShQ9VHKt11gC6QqmS2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExNSBTYWx0ZWRfX4wJNV9OuTK/+
 qH788RBWBHLbm3M8yXEmIxqXwy8O10N7aDKEdswZTBFLSVDNYA21UUXb299mexAXJRMBkRsETI6
 41tjGYNIzQYiwt7KLd+sQrEpdO8Zmi0VOX8Gr7/uXDAicO6qzB1MK5NOMgVf4AibHDOdlmiT1V4
 pysoEPyQGHSCRSzy5qFFi6kIOvKf4m0GSGbJa4UBZq/4j7nsPXTcoqeZOocEUpcDbfXDWCH1tgb
 +Dt/cCwwtzAMQJGyKFzO7F9yOmmFyCZD7tDrfYt8R4ytP9SIifjIMS5l1jmFay//qElUV0Ic26B
 Ez2DFZwwOEpPm/xiUJB3QjUepmEpu3TFaTcDcFNAumh7Qs/EoIS02++Von3Zlu3vnW1iY+Fvn0a
 BnYdUic1sEtYyR37TTnpGwkobcpN7tHSJvkK5axlBU5i2QpgSgSTi7o8SMxzZSvkyHOR7g/8jSB
 x+9cnvvOUsiQxPvHsjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-113159-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linmq006@gmail.com,m:quic_jseerapu@quicinc.com,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09BB3685832

Hi Bjorn,  Please help next with the approach, accordingly i shall 
update next patch.


On 5/25/2026 12:46 PM, Mukesh Savaliya wrote:
> Hi Bjorn, Thanks for the detailed review.
> 
> On 5/22/2026 8:36 AM, Bjorn Andersson wrote:
>> On Thu, Apr 23, 2026 at 08:25:50PM +0530, Mukesh Kumar Savaliya wrote:
>>> On platforms where a GENI Serial Engine is shared with another system
>>> processor, selecting the "sleep" pinctrl state can disrupt ongoing
>>> transfers initiated by the other processor.
>>>
>>
>> Isn't it strange that the DeviceTree will define a sleep state for the
>> OS to select, but when this other property is set the OS should never
>> select this state?
>>
> 
> The intent here is that for multi-owner configurations the
> “sleep” pinctrl state is not safe to use, since the pins may
> still be actively driven by another execution environment.
> Selecting the sleep state in such cases can disrupt transfers
> initiated by the other owner.
> 
> You're right that this constraint is currently not described
> in the binding, which makes the behavior non-obvious.
> 
> shall i update the DT binding to clarify that when
> "qcom,qup-multi-owner" is present ? The OS must not transition
> the pins to the "sleep" state, as the hardware is shared and
> may be active outside of Linux control.
> 
> Alternatively, we can also consider relaxing the requirement
> to define a sleep state for such nodes if that aligns better
> with DT expectations.
> 
>>> Teach geni_se_resources_off() to skip selecting the pinctrl sleep state
>>> when the Serial Engine is marked as shared, while still allowing the
>>> rest of the resource shutdown sequence to proceed.
>>>
>>> This is required for multi-owner configurations (described via 
>>> DeviceTree
>>> with qcom,qup-multi-owner on the protocol controller node).
>>>
>>
>> The requirement as such is reasonable, but you don't define in the
>> binding that when this property is set, the sleep state must not be
>> selected by the OS...
>>
> 
> Please let me know if you prefer second approach over the first, i shall 
> update accordingly.
> 
>> Regards,
>> Bjorn
>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> ---
> [...]
> 


