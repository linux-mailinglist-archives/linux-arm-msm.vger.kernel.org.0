Return-Path: <linux-arm-msm+bounces-110227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL9nN3RCGWqauAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:38:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 821AD5FEA5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47D2130594EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59C3AFAEB;
	Fri, 29 May 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfc/HQaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn3bsMgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ACE37DEA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040162; cv=none; b=c/1cW9HiP1YrVwNv2AgrFrReR2po8McLRe/Q0B1FeSEnOSzgwkHifVKGadHDZVvFPg21FG6X8PZQizsk0RJIWi/iOwvmhZuUQ8NfXicanIktaTkXoEXzWHMxlPshgVapqIT4VnhV35LDKaNFcRrVlboe37gA83WJi6+Z/nw/IA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040162; c=relaxed/simple;
	bh=UsoWPs7N3ck5RGgeIsP+Un7T577ZXuJXQ/V+C6Km7GE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mfkTdNeOR+7AkUT4yrQvRbQT8CjIueyIfQThm24LkTnUpnme4ymoIa/SmnYZd2sCNXCGmOs6NkbqOxnQu9+cG72CsWv5oiLDOjkhsb3W2aGlbTJjeTjEr9A8efNue1qJQ0TsguFsQIvHRygVkX3Ov8tF8jsYuCf76QdKVc1qFWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfc/HQaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn3bsMgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6BD0X1540317
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=; b=gfc/HQaJE7KeR25V
	LXYhHXnq8EelULjK9elSFkSt/qVo2Z5KZ/VHbe03/Y/vF1lq8HqQMSAHx1FVgJJ2
	F+mFw8cRLa4TUqGos1FyVkFX13LK/PhEGoH1bmnvF7hKHOn1hInp8y/iYGLzJXVM
	ascH2dsPxpdkFmVYAoibepVWOY5TwuuZZlQYhlOCb9U4z7EOIjrpprhATcR351bM
	LgM3cLN4sAI6OCfy2j8AIlwy//bwRmE211/kF6un4uSOmymyEvdGaPFje+6DFya+
	/mNLql+3pwGGp6wUkQnbTQcsMRtrqsNSG+yirb1VNfIJjjLB/XyAIHcoFy64a7Pb
	qMowUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4tw6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso2471286a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040159; x=1780644959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=Xn3bsMgQewfAdq7OfKChk6IBke755sCJwHa8JeRcta8/RLhZWbbU8QW+bpxOXscK0Z
         eEqSSa3FXRAI4G52v/0/uo3a8kU6zFX+mDIx34eWDmRTizTvZ+SHocxvgiH0MXp4BpSq
         fkqWO7l2cW2rsvq7+LIUgXx8ufeu/gu0xx97K0IOurfvinrzphRAV2m5CBCA8yDLLFa+
         xvl8lYoZ9PnysnarGo4dl/6pfj0kmmM8aFkFQXsVknG25KXosPAxJvLDcz+dOu0MT5X+
         IllhY0Sp7zGXQbcpT2u93di7CWZorV2QQkR2AdCWdg4fN2sf+4FZUHOpLAaOGaRx/yDs
         q8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040159; x=1780644959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjB6PlPB2oILIatUOZfylqkQhL9QK5QPQYRgWT0WkVc=;
        b=fmdZalSvyZWnjSlvUkSy1AFrrowx6i1HRzfIESidV4R1Y63CdpwlZvqCswkNMWzs8S
         ZJqeit/K1KcjzY2hDy0z+2/5uY0B7CsdFZEwgkmBqN35NPWnW3B6UinfJ51bE0yxNE2V
         tOVaInRke/wkVQqZcIlgH3RA6T9SGlzSjZlCPJEilTno1n2bpdiiEOGsAg9t8RxfR/GD
         01kMyL/yv0dK5nQv1HtREuCfFdEViQglMjzptl25x1Yh0AkuY7EvTZLzuqU21ExH1Mgp
         HrHP2SRqU03gWZjLaZ07s7JCUXtJSXfKcjgznpDYPM++qo01X1byg9ep+DTWMbeD8NGv
         Imcg==
X-Forwarded-Encrypted: i=1; AFNElJ+2bEbg0dIBS7ymGSW+Xfv3KCP11pNVDbEWt1GDWm+M3AECMsmo3cFbFRjsfQ+WX1/1HRY3N/ZJLH6XXM72@vger.kernel.org
X-Gm-Message-State: AOJu0YwV0f0bZJK6fNud+ODF8XNFq34IQrVk3lQ5/ogy6Hx+Gn2akVL/
	l+VVb+cckac3tJrphiZA6BrR4JjPyTXQwAc/qTakCcdNcxEhFt2BHgGS1NslWR0sg7C7igHyBJf
	UuaZ22B4xeVSF43lj8tz1SCpJLSyUTNvdFniKLj/2TNYU4eSpP0lewbcIbXXgza6q+i88
X-Gm-Gg: Acq92OGZZzBbC1ukTR+v+J3oecg203WLf4SsQYg/iWvie9FckFNK7Zo5h4sCJKtuTir
	u/v598FBYaYzDF1MPXzILgHVNeQsKasIbZ+iyHfFr0n2TNWMIUnKoayCsSX0wxfCD/mrNFLPHlN
	J1K/6eL/JnEdVkyKYwe/c1hq69XzDxAsTQz1uRahs2rABHYD2FbqBHBI059HI9QNW7eFQSY9cG/
	5oqx3bo7fMGTHclzBpMiuWc4+zonDZF+20Gvccpxb8TD2k8b7mPR1XFdwh7nx3x0TPz/7gDH5+T
	WCpJ/c0/jfIlhce3pM7aguRFMNey69C98K88ylYbep6B9qfOH7WbeMLYGLbk3As3OJ3y2rUp/XU
	MKg3NqEy8yovf8iLGTR5HtHLb/372feNSCN1+VLWgK2+kjF9rd2s2tZTWxQimmqeCjxnErslhv3
	l0i6i7R/5fLjSKwJnXcXNLUz/Xw6Q=
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422389a91.10.1780040158861;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3754:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-36bbec8958bmr1422354a91.10.1780040158297;
        Fri, 29 May 2026 00:35:58 -0700 (PDT)
Received: from [10.249.20.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc1c71392sm682063a91.1.2026.05.29.00.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 00:35:57 -0700 (PDT)
Message-ID: <5b0c416f-c973-4033-b617-2b1f4660f0bd@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] media: iris: add support for purwa platform
To: bod@kernel.org
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
 <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <178001119238.19934.12836659245627484817.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QKXLE_9_YbNFPXMicAVLv_0FY7cvSgAC
X-Proofpoint-GUID: QKXLE_9_YbNFPXMicAVLv_0FY7cvSgAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX/dtRiwD6lQoX
 aNFSlEZ4e8LUodg1j6tXgx7B9irYBEEdad2o5Pv1DNwR+5U954HZ9sAT9FBNO0jdjMgSFs+vanp
 O81pCeyWcLhaVF1apUFtM8jzGnovbDaPDofqn7MIgXn9SYZhRmx52KM78puPTR9oyFx3+ZrTqYG
 w9Dey7+aVjkZhcnck61ykWYJxYWHaiyhoG5MXnrPn2jNq6ay2gc1fRzBIzuNUSAuTEpnKDvAKo0
 knbMS3y/P4eEWOah6BGC47mfxH4NHr/ifkaKH9hk/DvWPoZM8muhZWnWkeT17MHNupJxIR4Xd3L
 ScISqvK4O3kUVdBOCRrvEcUUHyLXja8DPYN6HRuemJ/Cmo0kUgtaDNPCiEAmvilJOlgLzUCS/v4
 SIXpyyygh9W3HmD16mzAACKqcS7NGzzJb/aePtj0/5iCckdmv0zjYqeob9p5rSYthsL9EJKnk2s
 Gbzcc2qIw4URdq9FWJw==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a1941e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a87e1LDsL6KBLIImkoAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110227-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 821AD5FEA5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/5/29 7:33, bod@kernel.org wrote:
> On 2026-05-14 18:09 +0800, Wangao Wang wrote:
>> This series enables the Iris video codec on purwa, allowing purwa to
>> use hardware‑accelerated video encoding and decoding.
>>
>> The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
>> except that it requires one additional clock and uses a different OPP
>> table.
>>
>> Therefore, purwa can reuse the Iris node from hamoa, but the clocks
>> and OPP table need to be redefined.
>>
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
>> Dependencies:
>> https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
> 
> The engines canne take much more of this Captain !
> 
> Doesn't apply.
> 
> deckard@inspiron14p-linux:~/Development/linux-worktrees/b4/bod-media-committers-next-plaform-qcom (*)
>> b4 shazam 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com                                                                                                              next-smoketest [367fd4d05a088] (!) untracked
> Looking up 20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 6 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 83 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✗ [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✗ BADSIG: DKIM/qualcomm.com
>    ✗ [PATCH v7 2/5] media: iris: Add hardware power on/off ops for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 3/5] media: iris: Add platform data for X1P42100
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and operating points
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
>    ✗ [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
>      ✗ No key: ed25519/wangao.wang@oss.qualcomm.com
>      ✗ BADSIG: DKIM/oss.qualcomm.com
>      ✓ Signed: DKIM/qualcomm.com (From: wangao.wang@oss.qualcomm.com)
> ---
> Total patches: 5
> ---
>   Deps: looking for dependencies matching 7 patch-ids
> Grabbing search results from lore.kernel.org
>   Deps: Applying prerequisite patch: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock controller
>   Deps: Applying prerequisite patch: [PATCH 2/8] dt-bindings: clock: qcom: Add X1P42100 camera clock controller
>   Deps: Applying prerequisite patch: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video clock controller
>   Deps: Applying prerequisite patch: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
>   Deps: Applying prerequisite patch: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera clock controller
>   Deps: Applying prerequisite patch: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>   Deps: Applying prerequisite patch: [PATCH 8/8] arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: clock: qcom: Add X1P42100 video clock controller
> Applying: dt-bindings: clock: qcom: Add X1P42100 camera clock controller
> Applying: clk: qcom: videocc-x1p42100: Add support for video clock controller
> Applying: clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
> Applying: clk: qcom: camcc-x1p42100: Add support for camera clock controller
> Applying: arm64: dts: qcom: x1e80100: Add CAMCC block definition
> Applying: arm64: defconfig: Enable VIDEOCC and CAMCC drivers on Qualcomm X1P42100
> Applying: dt-bindings: media: qcom,sm8550-iris: Add X1P42100 compatible
> Applying: media: iris: Add hardware power on/off ops for X1P42100
> Patch failed at 0009 media: iris: Add hardware power on/off ops for X1P42100
> error: patch failed: drivers/media/platform/qcom/iris/iris_vpu_common.c:292
> error: drivers/media/platform/qcom/iris/iris_vpu_common.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> (venv)
> 

I've updated to v8, rebased onto venus-iris-next, but this will conflict 
with commit 95a337f92f0a602d4f935315bfbc8bf07f475e65 in the latest 
inux-next, whereas v7 won't.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=95a337f92f0a602d4f935315bfbc8bf07f475e65

-- 
Best Regards,
Wangao


