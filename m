Return-Path: <linux-arm-msm+bounces-119146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kTJKKNgcV2oUFgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:38:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844E75AB6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:38:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kNbG5je2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="T/ZxXnZD";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 941EF30071F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8083B4EBF;
	Wed, 15 Jul 2026 05:38:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34860283FCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093909; cv=none; b=sXBtcBuUThrjrbDnxyD1apPv4aqIsFd3j7rA9i+034xnh80pdjsAWsd1ZNaeTE+0c4991SJ1sbqTXmtv2rSbfzawtsRtj+896wGTcIgTQ5tZ+DwxCZCHvxmxMXaUrc4mit8tEEtzU3Oo1cVq7ZKsOzfaaka111MxYw15LvN15PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093909; c=relaxed/simple;
	bh=i3/b9t7IlZg8KXkmOMXMHUx3N5cuv2mcPJfMFSHaElk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liiHnjyxkr7gadaV6kml/GfJewN89ILDHhQU0BsPmNASOeWyJt9ANQVIXsMGvdBqRHMtRlIKcNmKu6hsgKVPzlGyNpBRFwItdBLnJWf0kDaP2iYK21/mhsX/YNO0b1YLLKsanwIwDHnUY2hWTi0/NTXIHOOvpPhC2d9wJYBcNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNbG5je2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/ZxXnZD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lBnl2269700
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=; b=kNbG5je2M9021Jl7
	805Y52gTi9m3iLyQOHaYYyqnSv4+iz+DcJDIFouVe9/fY7ZC1W+0T7cgyQ9BlaSi
	w1w7KqrfwIZIjCYH4aBnEWz3s/C+RX0qgNObDhwaO3jMPz1fMvGvTspPnnwvNiQx
	0IWxiLI3kXyasDYXu044+A6SWzbNgd9g75gb0c9vZg8tcbA3yg739R0gqJV1rtQw
	35l1hXy7JwlTG14rWRgqu/7e2RlOaEUMZS8PmSpgmzfKvMqPkuySLWTkSmJAEuMd
	kTKWnGS3Y5iJnmrAIvh1+q+DPPpy4YU7BKqTnV1qIjnc6Xm9GiSS4bROKgUS3yXx
	V5Z6MA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mj2a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso12157574a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784093906; x=1784698706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=T/ZxXnZD1rDMSp5e/ZyR0i6l5QvExSC2zdF0LXWopcymQfyikdrHSjf8fl8ZYDFNYr
         /Ld1apErwix0AOkAHegcZZnpZNyyynMyNJv6ZUsb2PpBmL1/ewKlbSMGM4VcjuHvsPTt
         xrOmer+IEIwA25MESVoQL0Q1U4cQfQalBo9OqhZyaEJ2JCTtN/qDs1MntLwo9bwCRxHd
         I+iffsfmIqh7OmmOxhI5/uBC7rdK6jTY7kn/c2kbcLeU+xlKeP6m8sx13d4DdQltmFBj
         8c8K9u/oDeXWfqyyErWCuroe4Zd9hlEqSgJjC2ylF4HCVAOTuUC8XDP3Z/6hqt5v7bT8
         AkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093906; x=1784698706;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=sb7/yTIpOwYEnS5s5BvAzKwjhcshj0AROaUJTY1f2ZDAW5/7ySyjj0Snd1sqGFXX/c
         Al89r7s+Lp5epNS7V89Z9X+82VBM2q2p3h/uS8Vc7OCwKcRiCPqup78Fdwdra0+abVgb
         XoEGLjQcopZrV4YWEMxdzgWNG4lijbIsEjRGOzBaq0cys6OhyvGjpxzZi+/T2xUYsOV3
         Ynd0wETS3V0jAEnUgrxgHvseCuTXEGLAvh8EXXNyV2L3btGzRLREBhH9KS6QVjQnPGe0
         YEoyjp3mgmdMvW2uJ31idi5uw8ynY3QV1Pz3J6O9tc7Vv8qR2iDpo5GTM3XEktZK3xRK
         Rurg==
X-Forwarded-Encrypted: i=1; AHgh+Rpjtbj3KJWzJfLllcykGctFpH5bpYfgFz+pMzmaaVnwurBA7JWoSgi7u9jwYM2Xzk+TuXR9vSELJvtc3KI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5n7+5ASkiBEbzQK3jd5pnm8uyFRSjcG/KYsX71t1RxX9ImDp
	M7p+cv8Y/+6D+fq8muKXlBUji3PhV7Un8wM/bVpYUzcc9lrEcdVsT99mxFD7C56U4BoUYtrt8NL
	mL+d5Q5urYLoxEN3DLYymJWsdmvRB05R1R/ijwQi1XclUPwRvDEzME8VCO3wcTtpxiK8c
X-Gm-Gg: AfdE7ckLSrp1nU/hUhLXatgOwS5nAkRbAdu6RFm14br8Z1UHfjFsKRmFlyEM24rsa54
	5CHQLM558dx9sCcWNg96jz3GjJ03pb3IruQ08aaEij8yj7z8PwHcaiBT4odIVPFpQ13pnnJ2l/H
	ubsBpe2ol/e/rjpyO/uE+MKEmxl4/6P75x5Odf33Q7lKjyUJqIL3dpsqNo96myjhqjdJH+QQMra
	tzNNS5TnfuIek0TsCq9beg00ADI1g2RNCtWgjsWlxkhmvbVB2GnxNSir7SkSHv/SQhPlstyUXRN
	Inl2Ppg7jNuUj3juF83kdWChEaXBvewX7wqkoI80gAowAZR2AuXNpdg8nSVFXeerdwIA0WWhrVy
	kpDTFwbV0n9HP61Mv+9u0uLX7PnwXtG5q1k1t7f/91E54Wkc1aaL35h3X8WeoTjq5IHzwMvRCUG
	eImIQ=
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302056b3a.20.1784093906517;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302034b3a.20.1784093906014;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dadefsm2420750b3a.45.2026.07.14.22.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:38:25 -0700 (PDT)
Message-ID: <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:08:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <albAccNnsI12AIUo@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfXz2EBSpQIm2zx
 eg0L6Uh2a9VtluCKUPx+UX+BK1o0o4WcmfgPlZ4CQavsN326pdLqRgCc+HcBWuyznbrClNdr6Yb
 fwj9WaZRkQ/6oXMLIdS45PE3BxDq0epz7WcqI+RsQzp+G/y+K6zSP1zOQ77WLLl9aNqWQKpPKFy
 gu/WdHkr06AM4NE8ICSDpxKJwnkCogS7bOsnW0DwMmWFQmo90/3HQhck+np0PuurzpxZ6huVFjY
 FoGys/isha0wmlnKn0xviF3pFk6uhzH3t2d/gizkBimo1TZEa0/IBvW4azfMjasTW6jRk5mGWDB
 bKr5NKaNspwfETmP94uqgWOWWMT3u2o7V/SNWTtZRklVTmpbB3nuitaWzaKaJf5BvEtqtumkZMU
 ZqKUzTnauisC0bh73CUA6K3j/bATWacXBtCGaJCYSCLXeBLEdM6i6crbC16vxVRfQXutLBfWDt/
 rHujACmNmE5Fp2fKTTg==
X-Proofpoint-ORIG-GUID: jR21QiATBgqiBCG_LN1Vab8IyBjC1vEr
X-Proofpoint-GUID: jR21QiATBgqiBCG_LN1Vab8IyBjC1vEr
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a571cd3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=jzwohxEhcxs_Eh9CruUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfXxPsuensaECA3
 4rUS7gb94S6rVbS+zx9mzNCPTQdZvhT5pFP7iSdRUEwiaXYjU+n8nuCYjxT7RLuiFdb69rJZtZ/
 GhcogADY+mysRwB/F7rU0lu/ekNsOsQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119146-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Thinh.Nguyen@synopsys.com,m:peter.chen@oss.qualcomm.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3844E75AB6A



On 7/15/2026 4:53 AM, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
>> On 26-07-13 23:41:14, Thinh Nguyen wrote:
>>> On Mon, Jul 13, 2026, Peter Chen wrote:
>>>> On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
>>>>>>> And Dmitry already said this at v3.
>>>>>>
>>>>>> And I've already responded to his comment in v3:
>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$
>>>>>
>>>>> It does not change the fact that type of phy is implied by compatible,
>>>>> thus you do not get a new property.
>>>>>
>>>>>
>>>>
>>>> For USB2 PHY, it has property "phy_type" already, it could extend support
>>>> list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
>>>> or re-use dwc3->hsphy_mode depends on where it needs to use.
>>>>
>>>> diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
>>>> index 1ab134f45d67..5cbf17d493ad 100644
>>>> --- a/drivers/usb/phy/of.c
>>>> +++ b/drivers/usb/phy/of.c
>>>> @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
>>>>   	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
>>>>   	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
>>>>   	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
>>>> +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
>>>>   };
>>>>
>>>>
>>>
>>> eusb2 uses utmi, so it doesn't fit here as a separate mode.
>>>
>>
>> Hi Thinh
>>
>> Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
>> Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
>> Features.
>>
>>
>>> To go this route properly, we'd need to introduce a new phy type
>>> attribute in the phy framework, which will be a bigger change that may
>>> impact more than this driver.
>>>
>>
>> It is not at generic PHY framework, it is just for USB PHY dedicated.
>>
>> I do not see big changes, it only needs to change above files and related
>> dt-binding files, and other users may leverage it if the controller
>> has special sequence or settings for eUSB2.
>>
> 
> The usbphy_modes describes the interface between the controller and the
> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
> and every other driver that uses usbphy_modes to handle the new mode
> correctly.

Hi Thinh,

I don't think any existing drivers need to be modified after adding 
this. If anyone wants to use the newly added enum for any eusb2 specific 
purpose, they can do so in a diff change/patch I guess.

Regards,
Krishna,

