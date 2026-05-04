Return-Path: <linux-arm-msm+bounces-105810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OA/EWj0+Gk73gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:32:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D07634C346D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 561573064668
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875FF3D330C;
	Mon,  4 May 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJ9UwSxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFG82jFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30E3EF667
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922784; cv=none; b=XT60fcgBwHuBqm3kfcgs7/UtQIJBVsdRC3XUhFK9Z2Ky5t5YRm1o96RBd3uiOBO+vVrnpyr9p1gGa52ypSlggmPNJbWwD7Hcrg3mxsEOwoD/s2HzTBVWhkwbMKpiqg/LLMas7HiOgHBkGiuV2CUPUQLFpSHiMmZr6DmKQz/6Eqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922784; c=relaxed/simple;
	bh=k7MK9xd2y9NYzKfh0s6OTL5BRCFHrm8pJxoCMM332Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pl/fFS08y62urtS/EC/WSj3kOqEokLkrSC2nSHIkVLDYSD0qin2Jn6+kXv98FeigJ3D7eF4PAgpMKyua+X1t360PVPkZ8vk9hqcYcHmyEx8ZQSZkhqTgCDtx2/5DAOTBESHaaRm3HmP2PIn++lYPYH9hIlH38JS4Fqnhla9qXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJ9UwSxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFG82jFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644I9cbB1151332
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=; b=MJ9UwSxpec0lWnuX
	Pu8t6hCto5TGsuSoKllIXlg8zAe1R1z3aJgSKEMXzMu5ji3OHd3/xQXgrJ8CcuPA
	lFMW4QOdhsTH09pze6ubsEETMR6cw9EFeE/P9sOvGpjRMbnE32BGxcP8vq+Ob2xl
	MfUzZT2DnpzVKlKEnTlS5C/9iCILEsCgJDxk5D+iEFsiW1mYq2IACsKPL8iOHxSr
	d7vG+khDBfssvNrirzKRsrzestywlek17JFzaknoo6L3IfMMeb7elA1FA9aGpBui
	SYOkVCn8sZYzCHkZwyRmhlETPMOnG6pIXg+6MBgKomXp4A+tweR/g0GxVPUSH9Z9
	P5Ekvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy9yjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:26:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso3495675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777922782; x=1778527582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=;
        b=RFG82jFeCj1Txp3qDOQLfsZ/RBIYkMksIB+a0EYGnPjJ9T5q10bOyqTTnVGw9Ly5y7
         BElAt4M+nygxUCf0tFMVsyBHZapiIyc4ZG3swvvys0t0mL0LNjeovgF1CLM3b56V2u1a
         qKh0zXXcbiB3IEJa3Q5MUZarmO/zWf45PABIo2XIcGIK75J2bYGKBVqW20umPpnxAH+2
         pTmkBa4K6tBBbVgu/AhA81MeyjoQWessp8us3MG2evmUhtVgP5hRrpAa1FHu04JgLluq
         r5XwL59518GNZ/vTeO66QOyQPLrcYjy23gYVPDk/VGp0M2BxZqfUo7NbR2s6lr9tRZsF
         v+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922782; x=1778527582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cYOOa0f6jVKTSVkbT8V0IdsyJ6KsR97BTOzCcLqBDE=;
        b=pNrPrZqLQVFQrq6jUq8XgzpjsmWaau/jmaMgAaEFSUDogwMKYuo20xnv5Pnsjazjjo
         8jSsB9IxJPBLgiUvaWEyS/5pV3qUBsfHfcyFpxGpQcaGJHToguNQ18y4R0rzDQX6WFiU
         Rh3TgczVRhw7Xhv2z44+d5g74gFxnsE228/jsRpQEbyYVOml0VQK5uX/ymNgDJ+2pFSj
         ubYFlCPPFs7nZVctWEbBETP/J/CY8r/VlbtXviMqSODocYtJni12S3Kfcc99yj6XMK7/
         4TWu46GlPjqksZRn8DI9Nv/WintQn2/k0Bs5Bv4vc6oXPBQ1n/d+GlSeFwmIioL1Upgg
         F8sw==
X-Forwarded-Encrypted: i=1; AFNElJ+/N1ownVpZ38l709kUua728mfIjJ5q9MFJP6MfFkEaiSnz+Hy13OBUI3QuZEy408m76Ma0lgAzmAY1VmZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvjsuGaA4mcDw7KUT/tNh+fRnYNlgEhL5ZSMwjy4XZ41LsGfW
	SsiFkVgF9gm4fcIn8Tm8UW1j8Hl7HWC48Ux2VZp8HazKnp8W+NMHN8rwypvH++rP2Mf4Mg/i6XU
	fvPQn0Zagkmb7TrkVCb3Ye0X0e2SoaaNm7CD9NAmTNFeUYxs4KN8tmZJC0TAyOsR4+L2L
X-Gm-Gg: AeBDievC02miF1t7N9VSyKKiPWO/NUGX0x+U7lZQnHZXS3Wr0V7OZyf3kZ/MW9uq6wl
	2InXA4YmWP7KmRunRGN9Zzov8BxN1qg+q7zXf4dYlJMaGXnXI5+tvC7Z3uSejMoa9V/DAgMPbmH
	eN5nZGaG4hETAx3LZiEcCkWT/Abp9OMSiPDBUmmrDeNZe8TNUtMESxDPA3k/twOCVuYtdFBeZcl
	sn9crUJ6Pics8753U5yCSgd4TcFjwe7OoyZCRJRccfoYJr1TMh/lBmnT0e/sa1EvOh1CXwZSk70
	XJKkkSbVlvjPObe5StvjoqiLURbfly+hNoE8iYFjGfI8hoplQ5hECkGRGkcdrceOAH3v1VIBY/I
	pUYYEXAcF0je4AJKguErI9Os7xFvEn07jBv8ClyNm0Z9gUKDc52LCdEoViObh
X-Received: by 2002:a17:903:1249:b0:2b2:5c84:32ba with SMTP id d9443c01a7336-2b9f2530f9fmr54736945ad.2.1777922781738;
        Mon, 04 May 2026 12:26:21 -0700 (PDT)
X-Received: by 2002:a17:903:1249:b0:2b2:5c84:32ba with SMTP id d9443c01a7336-2b9f2530f9fmr54736725ad.2.1777922781247;
        Mon, 04 May 2026 12:26:21 -0700 (PDT)
Received: from [192.168.0.8] ([49.204.27.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa8c3f2sm135648775ad.4.2026.05.04.12.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 12:26:20 -0700 (PDT)
Message-ID: <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
Date: Tue, 5 May 2026 00:56:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3OCBTYWx0ZWRfX5xpDpLGcBimk
 kUQgRsdOFamG5LGLyOV3SxdRNtDlobQCYoFB9dQlNlSGYKJmO+XV+qze+2eQpTHhPHHrY5h3RLj
 fbTablJVUGOEXrpfamkr/WEoOvVXcX2oXxYx2KEdgZVe5LFn51/eTXnhU0A0jLKYFWb8T++9M7Z
 5cw/2dUN3NrV5s0GU9t/sEDCaH0jdAx12E/CEHF/mpRvJaGC7p62YS+5JZ7wQN4RcpKegGXQ8uT
 phXxy883rq+mxIBoHa+5eFrzG5H1eMnMfWFsQkX9vtFBmleQ9PKS6AA/FhQS1/yNkAtdZIKxMB7
 k1megWYaQkI5qm5Vay9KKUON57zwTxaBANacIBXYEuNUJU1gMnsFHRZR+oipHP6wlIQCHnOhFfR
 bZaUFnfIF8zJCBboVPbqZA8rpHcdkGaUb1iiue974aXT/YQW4L5kEPGxmJS49QOBYh/R9YA8mh3
 01+9M30RUacJ6WkT6rg==
X-Proofpoint-ORIG-GUID: Dl-XyPTfICiEKps-IE1d52hxoO7K-cq7
X-Proofpoint-GUID: Dl-XyPTfICiEKps-IE1d52hxoO7K-cq7
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8f2de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=U0tfe/lGaXrCh4Nw9m/t+A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R7i2ZOxDFFjeJBF8qEcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040178
X-Rspamd-Queue-Id: D07634C346D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105810-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Hello Dmitry,


On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
>> The monaco-ac EVK is a new board variant which shares the majority of
>> its hardware description with the existing monaco-evk board.
> 
> No, this is not a good reason. Is there a common PCB? There was a long
> discussion for it for the Hamoa / Purwa EVK.

PCB is not common for these 2 boards.

Also, not sure if I mis-understood you - You had mentioned to have a
common file for both the variants [1] in the earlier version of patch
hence refactored it this way.

[1]
https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/

> 
>>
>> In preparation for adding this variant, extract the common hardware
>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>> include file, and update monaco-evk.dts to include it and keep only
>> board-specific overrides.
>>
>> No functional change intended.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
> 

Thanks,
Umang


