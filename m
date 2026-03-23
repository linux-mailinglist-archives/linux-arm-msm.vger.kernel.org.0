Return-Path: <linux-arm-msm+bounces-99293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ5PDttMwWlbSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:23:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AC2F459D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23EAD306EB32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AC93AEF21;
	Mon, 23 Mar 2026 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEmV+cxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLfOKrdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036123B38BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275127; cv=none; b=XXCQylHiEsPMaCJz9vv8k7PLHi6CvGz1/pultTsJ4YA8e+e3KaKRIcFIUVb2Tu5andndE7Bh2cCIBAxi5L1fCwQdvZTbvLnUpPiK0N+jnl7IrvUF3w8ATTZXCABuzWozW18bhnHsq2Dxq6pTl4+1zGuTQiLxz/3/lZ6TAnqCijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275127; c=relaxed/simple;
	bh=JXPrCrYEtU6t6DJTVUjGrM6sdrRB9i1o4VuzDG5dTtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miomDhyQz5jhNExZw3ZXmurLnLRgJWK6w1OWUDxXqyUAiNMnIbAg37qUJ1ajxwZVqphJ8h7fIMG+tm5X4/WGdDCFt5tJivQ1hqvC2IxmhuiGQwTN9E4zBQVuw3mFoyz6sfp6VsVShRevLBux/1ZYEm36VwwwX6o3Caobu4bTjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEmV+cxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLfOKrdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBLwJj2758752
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=; b=SEmV+cxuCfhKX+Cv
	NEsbHTC29vlgCG/G7JKBW7ZH0VBQcafwUcSnJ/RtAPHX6g4EYdwQM0HXFJ9xIefB
	Dr/Ma1QWXNgGx0RaxbdiXOVG3UUJDeo5EdxGov9JVjsRwdfa5aujS1VKDmiTCeo5
	tUV4VI2gdoTuFPSDNkyDZLcUE2/FdjfZyEqgMWZIrFf/owbzCmLKYmP+e5RCN5kT
	6bQZQMtKG8yd1e41iOinOp6OQQlsrp63CFDQX7dLYl8zAepn95xPKLCbSqYhz7LG
	Ixf0FP65p+m7x+X6PTCEf/AUs3mdF45Rc4b6a1tdUOiu9nVaYFK0EbBQn1JQuJZL
	OE97xw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4gkk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:12:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56c9dc1e280so850308e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275124; x=1774879924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=;
        b=SLfOKrdH5r63xurz5UJfXzYYAXBUBjOaWoYvEOE9dU8Q/ylmuMT5qr+FFB2TKSeFWg
         TAH86bZ8e5+eFjNhnE9ErC5SMhSW/Fplp2+wqtZUEZuLktgxRFyr1lMAFGLDbKgmPCKJ
         aMIFvOe6tc/3xq8Z6njU8MUGyl0lpvDSIkzQ5rZb81lphJuR4B3CY13Gtf/SJPzZYum+
         aXf/dwrTd6uio3njVwS3ggAn6+0DFEMSNPCoCpY7csclCk+vTnhXDZ0ruHPTGj+L9lZm
         +IEGzpiHpV7IbFXmvIaTcI2v+BkRuLyKMIQ3wXatt/v4BzI6/855NURCw0lb9Qt/bxHP
         iUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275124; x=1774879924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3//dudT06+CfcpUc1fDDSk6iswla3WNPtRwdrBzt0U=;
        b=PvJxYZ9puL/i2NLzNg7ObYc7EeIrFTytkb33rKSuzQ2HMpveyy8QcyPU2JeZQB9lE4
         RwMRv9rHlLj7I86rJ/y+THjefoWzHvpgmzuLuEmfRqGWK5Ll6jQbVChcVcdtFCCmtgJ/
         4kftcomGcdrzLtX60j6hwvf1BJ9DDbh/EwKepqryL6ILkULFzBLyyXovLg2RlwgMLZAH
         /I8uGsR4zxrY5A8b0Q0OYK8zlwo9otDFPyDTU2yTp1fdQRlfmHqjrKH3ujUA5y9ML77R
         z4/XMVJbX2hB5RuyeGcsYpZhloYtqGDRdkwNVM17NcJd904UWN+XuvoqeIxBlhXz2BOr
         xBDA==
X-Forwarded-Encrypted: i=1; AJvYcCUZRpwWSS6fMxudl66DHNG+rlUFYJB/Z2k5yA4pDPQKAvpNorH9UXwiYtUjIpmmzktnCdmrzhESuZ7PrtLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92xnZgdDZ3emSG8o/by1ctZdj6ifk9rX3vnjd2cMVfu30q7SE
	w9lr2JZ0Vj2rsTgn4OJiC/r4XBaMlJ3TU5jcz9kzVB3qsxmZBISN0xhzWbMbwVImK7Xov4smkVZ
	XWayESonfEarwLjCxxjfknu4v+VfOFEsV56dWH7o7tjUp7tRt0RyALBUaPR9e66VefSaZ
X-Gm-Gg: ATEYQzyEK1qYP1YtQNuBry2rQ7aoBfpS1ciSfuUpje+/mVANNIki70XSfWLh8hXKiKR
	PCFw0FwRqrCP29i3YO++s4nZYpiDZAj4CnyF5S5yUJA9ZNaJhxdzOhkjDvsNhDMKxpoamQrsmOn
	7TtYhXH1ng7uA74pauYx/qDSQxBqb7ARZJCub/xT2FkoL1DtYZDUwlpOdKXAi03/NZqPT75hd/4
	ztNAcEH0xSu1qBIfNp4BAa9x/mNbtVcX4UBP6PIXMLDMK606TxpES/FKXr1YRBcedAKaHkcQoR2
	4atofqvk0Lc+bBMBQZ7AH305ITtPngin7lZkEdsC7DZ+Wtkv7MNvn29WDcASrieYKRNyegoYggN
	24EyO8Wi/LhgOLcbKTGNwF3ZPCddc+TGDgIDsfvixi31GL3QNrfhkShNAdLQnS9W+7GPhPxag+z
	B3Sik=
X-Received: by 2002:a05:6102:5cd:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-602aea9bf0bmr2055930137.1.1774275124411;
        Mon, 23 Mar 2026 07:12:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5cd:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-602aea9bf0bmr2055906137.1.1774275123819;
        Mon, 23 Mar 2026 07:12:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de3d7sm506512466b.36.2026.03.23.07.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:12:03 -0700 (PDT)
Message-ID: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:12:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GkuyRiICegd9hR1zFTMYMdILKSlXi1Gt
X-Proofpoint-ORIG-GUID: GkuyRiICegd9hR1zFTMYMdILKSlXi1Gt
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c14a35 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-Kv4HryMW5DkCN7ewZcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX2f4G2RA0aMMv
 SgM2ClpGlEVECyW87IEcNhZKeRGxSdL05ccKg6zwIqQ8i197W1D5K5Sio7uqP0CffcP3m1j1W7l
 AoleUj1vYukcl/vjftIjS1REc1dbThbiR56U5RVXeHOfpWfn0qJ4E0SPdLugUfcDKTfnW88FuVN
 +0jrHL5+F0r16QYadM4UNaXtbCvh+GFCJfd1DIYegRc4CIAqJrX9KLd/g9TqB79N51luYr2otCi
 hP2ruDscSGQssBmJbXm4PSEYgU8X8rDqoXu1zLFPFMImTuWL1WVxoocnGw8+RwSmIOd8nr65FY+
 YDVR5ukkObWyO1DMrHaiBES+jb9bOn162Lsu9DNo5RzT9ZIYnAZ+GKkOC1PlHxi58NC7jeilSWr
 BmgM6kbFmnx+xeq/jcrcdnTZXyzJg7M+UIfjEaKPyCpA2MEYFt3YJ5XtkgbMq3Kw2v4rV/US+tn
 7tkcdPFowDZSEg3HzVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99293-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 670AC2F459D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 3:09 PM, Jie Gan wrote:
> 
> 
> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>
>>>
>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>
>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>> ---
>>>>>>> Changes in V2:
>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>
>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>
>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>
>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>> maybe something else?
>>>
>>> We need a specific debug clock inside the GPU block. The debug clock only
>>> can be enabled while GPU is online.
>>
>> What happens once GPU has been delivered, but for some reason is
>> inactive and we try to use this CTI device?
> 
> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.

+Akhil for awareness, this is probably a solved problem downstream, but
I suppose this may be non-trivial with IFPC at play

Konrad

