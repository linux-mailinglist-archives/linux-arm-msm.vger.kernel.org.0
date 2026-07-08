Return-Path: <linux-arm-msm+bounces-117533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWIjDGj9TWokBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:34:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B07722AB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:33:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XTDKM/RO";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tiv98RjT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CDF93002F77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E9D3EFFC4;
	Wed,  8 Jul 2026 07:29:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCED3EFFC3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:29:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495752; cv=none; b=PDdLifYC6OLeDUDMEDItcKpDFefu2ASCr6SV4gUTp1HuxG2JhbY+NpHfCiwjEA2mDrB1i284EaV1RDXPoO+Cs1ENz4U5Syo4zTE/UeDWIS8O8Q9vBuxlIS4dmM4/tdLkXnIFXuAeWwT0ZILSmK+T6JgbVYJrxK4ZQxQiRUAZuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495752; c=relaxed/simple;
	bh=Ugb0YDtHFZrdU/ufa9BpgTebHed1Xy+3F4Qxx+d9MZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HF9txNq7oPPXpdFrfz3Cn8i9Rx4UmG3aUGGXlYdXkfQcni8YTgzaeFH/xow/uIWWqm6LXUaDmJd831kWOEU4ltdHkVy8/Zh7RPf4EP4wy1hWyus+K3OKwzGF5OLVHOJvQs6irRr6JI8v/J1rwlDVGlfse2f2K7OlVmwF3DIIL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTDKM/RO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tiv98RjT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Do71637818
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=; b=XTDKM/ROgQW88A9J
	4ceQC92h/kboQMOd1fmCWfZ8IYSXbZ6/H5KiGZw67SckXZuBdjfdOO4qfryYSD05
	n7d5FYscK0bC86lRG4MltHZvMaKBFeaQ7fCFg/AVfRho56byqzhHPvzf84FkzL1p
	wL2HD3HogKNLn4nT2wlStHldKeBn4DL4ncu+8/lpZCtpMWiVsw8QJybYd1duVr0v
	eu6V+Tu8Ar9q6QqY/JtvU6iEe0ZHhevwLgyHTtH5ArSC/JRkFCrrgyO6XfrYpV8x
	TVoVmqW+8nd1b2I4o0FatWOgO6JgABsjqL94LFSkIPpqNA8HBQwZxz7a4XUAyh3j
	+g4PUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a9d3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so6191685ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783495737; x=1784100537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=;
        b=Tiv98RjT4OW6m8gu6Zuf/LORu2SEB1EWZAnaLIVxK2WDrYnek6oNLPOsZqyeXlK0ZG
         gnWZa7kQLhsTlgVJ+dZm23+cFLgnV+wnJHfvjYRImvXd634m/yFQOHXnZEGzv4yv1dFB
         EFBx3Lad4wYTFdnLcEHNEy9+CbDIA7x3WcdElTED8AhWPnDp/v8lwG4v8ZplN47VXFUh
         syX6UNYDPXeCIF41dKYaLJYCfe45LqhlcjIYAdjvQWTql4pEyXhFNnWr+LKKS14409GY
         h0ncYTkX5x4cWQ2nWnlFpyLeNKLrFc5emK27UMZT+z2ecTNGjnyoXzAvOS6QXBkBnYo6
         ognA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783495737; x=1784100537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvh5gJVY8//gKF0mr/H5qtFP7jMpQbhKSM7yYtQ3njU=;
        b=VwtZMGt7IHCG4OE6AqLwkNn0GGCAf1+L4pbr4/kZyrbLIuhFFFvpG5wzRtgtKN5fRC
         l8sn8OZuZB9WSkzQxSTKT2IM65No7yVz1sGf02hAWHh0NT2W+vgbIIEXjsrkXdmRTokU
         SqmZ/nLkJhLmRIWaKgPe/60Obb0Af+NvTUO1wTqjDYImCxmcxhEQVAecOfys5NBp8Xca
         8NMaR1JKke4hUWXH8o5VJKSGlGPhnLIlm/DacIAtlpgjNe4p9dU5Uq+fePWch/hIMhE5
         Fa9ZDGK5SQNMdZCCcUitj7QRDFmOzUuMo+sD3cL5cTrS/iRO04RIJMrnCrMVrtlAZhN4
         Eeiw==
X-Gm-Message-State: AOJu0YzNnCJCrvUCXab7am/HRV+043O3YFtqnpvCzsTjvtXGSUELpyAd
	ANGs6dubvtKvu1CLcPuC+y0LPC9ObHH9ayyJI7SFseMmqNGJPqU6/Iu05ULlJ7f8MCXvil4vsOM
	vWkTmYeG/ppthE1SNyVbxnw6u+brS1eINcWedIaMxFrtl3+denSsLYWMtnGttrle6ReIy
X-Gm-Gg: AfdE7cmxmrI8VJ999wHSAEkFIwdxoMdg6uchGnkK3rvi8hfwFMaNVEyflwvSAkNXArE
	78gujaYXS0p5apyYvKHWi2o6AvAlLbL5sKQ65efMbt6C4AYUc8QhTyIZt1j2+giWLj65k+Mz9y+
	8E19RUVrCFj1rmYgnAqOjKyxQmm3f3ANCSyDy40+YnRcWTuZUJN7/ytIQ+syyKdWBSvXUZ84wK3
	/rQKFSBF0RHMzCl8HP/aTHuAOKdUvdh64LpgENumVgcKAcpe3I9qfvaVO7RiuFOYyLtk9fa5L40
	y5MNe67tBmcV24K9vOcTXxfPYockA7vZ08zf5fEoJ7bMx3vu4OMIVXNHaku56KlH0h5IpRJAjwO
	o/MCNwiWX/1e3rKx2QeyFxp6LNX0O3nEZYUJwozP+wNqP
X-Received: by 2002:a17:902:e950:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2ccea384155mr14778735ad.4.1783495737350;
        Wed, 08 Jul 2026 00:28:57 -0700 (PDT)
X-Received: by 2002:a17:902:e950:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2ccea384155mr14778405ad.4.1783495736875;
        Wed, 08 Jul 2026 00:28:56 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm23834915ad.0.2026.07.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:28:56 -0700 (PDT)
Message-ID: <55298d53-9609-44fb-bf02-1d2e8ee03635@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 12:58:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX2WaeetrzMa5T
 SLPU49vrbRbm3dVacaLkkTl35amcuDlT1+sjQ+RN75pDlvdfSd18AafONEIg7QU7r8UN6XkSMwu
 zcBI5rjhCzByXC0YXCP3a9hD1yrVQ4DqeC7vEywk9RS0/Vj7ahEBjM2phtSTwktsa107aYTTHWj
 6brs77IBAtwJe02Zorwcj8dZVrV4oAKrOg+FbliwBBMTSAP9rlJkC6abTfeMBcHMLWTfb/AtYLl
 0veroCUn2SQH0+rUW1h+q3o4owHbHJHMgNISqBOfrPKpKbwd2t5dZEmewDRfjQvkueTU1fBBzZ3
 Fj2NIZwEDlhv4yo+iHuN16IC3Iw0NvucqTMqYFHhLW6+Ln6ty2B920SQrd4k4NfjjwXf25LH7FR
 RApHVgqWVdjdqe4BwjjqfkEKCzqECwbX67rI1S5WpGQ143bzD14RLPiRtN/CLo+9GKWjLnm89jK
 onC/MqssdpxOPQwGrjA==
X-Proofpoint-ORIG-GUID: exJjYoqMypQlzNw5ybGOifHbEWAHOXMT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX5FlepCLxI8uL
 smqiKVPt4xXH8ycex43woYi/qCi4ymY+Yy11hSm/kvdVznM0UV/8DNFA9A6ksyyNHEK77XCJqFx
 lohL3nmK+Bd0cU+Q4NLYTBvlNOv6Z98=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4dfc3a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vY-R0Ho-sSes-qxfqNcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: exJjYoqMypQlzNw5ybGOifHbEWAHOXMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jyothi.seerapu@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21B07722AB0



On 7/8/2026 12:35 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>



