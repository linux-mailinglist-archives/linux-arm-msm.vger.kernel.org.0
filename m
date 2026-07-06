Return-Path: <linux-arm-msm+bounces-116695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cMm3NmeMS2onVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:07:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DCD70FA55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SaqEcrQZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tg0rZZEw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116695-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116695-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93C6D325B387
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30BC4D2ED9;
	Mon,  6 Jul 2026 08:49:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F574C9572
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:49:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327766; cv=none; b=SAplCnq5surbB62tjaHlfsq9FPRg7wTaAFNLBSAL5JLs0CF/DryVt4boJefzRgxQH0y6Mfr9SJaIywajpq1Bo0TGt4qGgv+Ol6ca3UCes9AwTQ00UAcjYNL8p8YhLm0zfOn5mqhNh5asL5nBthSBffLYF9bf9emGC4bn7cG24PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327766; c=relaxed/simple;
	bh=1rV/OGFdt+BIYFKUw1YtYeydtLI+LEeW/ot6556DNQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgZ5AZyQMPnedIgZFMjnyx6BBNmS43o9LdqlZjsiBUm4fq6p1cLiMfXtDixbTPvEk/3tIbOnsydZ9psnB62JVC7aXhbQ2yzGGK0JJiJ9KLc0h34szchPjJEH7hLIORSmE9PctjFALTInx8rmxp0X6hElMMnvdLcEitO/SboGmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaqEcrQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tg0rZZEw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668NIo24073011
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=; b=SaqEcrQZixh8kqJX
	NIbjiiJv30noknviAqvmMqgcd9dLg97+KHUy1B+DowDAtFZdbHov2MJOyoJff6iq
	rqDYW2t4byAMNskkfn2DEmteAKvkbmtwdfnzzGWPM9pYwk9ipzRkB/unQDpp8wQO
	spC9sxDTJrVufwRQlROqiocRM89e1lPBV1O8a+WO5Ti9EHzSmsRDEWPLvWF6owNB
	KQMo662zF2+8K0WTRQ81OMSHEK20fKVNoKuj+ARZc+lVli3a93Wr8++tSyhr4abz
	mQhBlKRhfEKrta7A91FCOx0fOf8vmN+8cT/qCJhPL0qbIjn1JKUVPpUrlbkgGQV5
	z0EtTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t883gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:49:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efc8d8e897so10960996d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327755; x=1783932555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=Tg0rZZEwzfnSD1HPInJagJB6K9DiQRk0bNCWeoVA54izpP5r/u1dEt2DtMolL2PjCI
         mw76VLr+X9zUCcztubkUCgA0XEP5az4M1fBJ4c/LtWy/M5FkIbLSilIAKLpKTkDQoMZS
         0gdFNnumXVeS2h2t6/SVRmK7Cu0mzhPKSWj/xCHM+IH+8kStKmi3hVmUNTzUClnTaKV9
         7orvYOJ9uqdij/CMYIq3mcT5oWAJCdBm7kPS0vaxzsbnT9D1zO1t9p1uyi+w0PvdCgMw
         xYBukHl8lGN+BFc72ZQVUh5zFt6gXZWHbJEwVZtlzOaERUX0d3MucwmS2MfZdoD+PoUk
         dI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327755; x=1783932555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDj+GWBjiBSeF5JpgYDOTVoWkRnCXYhtIDJ7JnjDj8U=;
        b=BbA7qcG+iJqqgEd1ZN+jq3wJTIP4N2+60t5YnfIS7dL44SICGq+LH8CpjETA7n47OY
         QKtlH3M1u11R0zcs+dWx2pacTz96xK3cHGT2cBPKrRbBEfp2+ASRaoxIwLcdBMGlCmov
         b2cEk8R9e9CTSkNNhR9QjVJz2e5rwJEdiW17o4OLyrCvJ6woSUXlLIY2dqQduZ7CgsW0
         fcRxaguQGSNj134JLU/AWzxIGfGCD19UnctZNeJ/YgmBasG/QsLojPRI9ow1lf2r5Nmy
         8sIYwD0YmBNOc4scSkVnFNPbbUO/tqNT2T1rFy/KZwUjNnBHZdVWHgymmz1EBOyohuNC
         jsbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOL8KegTvjplKRXbZFk9JyvNzo3EmBBMe2o0JfK/8l4+d5zgcI9emHz5Xdj+MaBCuM3nAy2vkPR36YTERb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2duNE363jBbFG+ZDXSpMS1wXqtUBDd0zyTsVFOVAqBIyyL8iX
	pih27d93Iwaz6pCHgE78vdfWbuWWwePZw7SYku5EWuV1GUFBPpXkjB0XITyvcFo0yNDvMbETLmf
	xPyuPKiV+0lF7dS/CyoPIQ4zTsXbv50+rheMboyzvG7Ynz7a4TC2Fq4Hy5hLnBbeUrTtb
X-Gm-Gg: AfdE7ckyVSRFY4tiJVoMX0eAPzRWlOibkogISoWW8KbVzHpFL0W4rr6APR7q4QnSmhw
	zvt0DfdsYAy/XhRl1xa7ubghmG8Ji6xWoSEfQxljRH/VV5gk797lgZ0lKSuQLBYWCvUA48OVkbt
	8g2SB+fw1V0Hmu7iB3m52skDf1jk6xczKCaMRQQLE7xSq4iPovqrz7tr6aWVZtLVnZ56Njpeego
	2aQ119VmAEvNLG4hNRGm8Ee4Vm1I4fgy+/eEB1A2YrD+e7XoO8YtERLgdmeDqy2DJ+iG41z98fT
	O1ZR/U7a5fwA7agPLctyemSgZrlXT9DrI0nL2qBt4XEsuR9q5fQHrqYwjT58YrwKVR16adEbYrY
	qTwv32mk9zDy/XR0vYrwctc9DimHTbeUf5wU=
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103946d6.2.1783327755084;
        Mon, 06 Jul 2026 01:49:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5181:b0:8f1:7139:d6a8 with SMTP id 6a1803df08f44-8f749a7315fmr109103826d6.2.1783327754703;
        Mon, 06 Jul 2026 01:49:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm3455501a12.3.2026.07.06.01.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:49:13 -0700 (PDT)
Message-ID: <a4f31004-8e74-447b-988a-e3250859e74a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX+AJ9QVGyqcIH
 DTSeCaT26tyQ9oOCvrxkzakpxKhRduNrqqdhnu2p4Whn/AkOWlUHcbWFTnqQAed8U3/vQSI+sxF
 /tK71ZVOu0ZEQIJEexQuo85oXTA1q08=
X-Proofpoint-GUID: mdLrVTmrQQuK1_HbReZjiyJOzjqYzSx1
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6c0c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=m8Bw7PwqJOGBpySAz2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: mdLrVTmrQQuK1_HbReZjiyJOzjqYzSx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX+Z7imTDoAjCi
 Ehy/7FuvMELsi3vmlDrSOS8sxskkovA4tytPYJZafMGUTejUF09jLCe3k6ZJmeo4JkyDEw/AgQz
 oltzuIUNRqrlXtHSJ9bh4OvST2FID83//oftOrv0JWDRdVw1P7TiM9bbpQdOUuTWqxVpCaNMBxb
 ueW3pCnSfYU/yuUL+dbVT7t34Knq3Kx8sLOlyjiTWsU2pIpCTRDrKZXQ+SYaiUCOL0g4Q1XxCRF
 hJEI3VpvZSAlGKWw2gx97OVjk0PE/UII05Bsg/QDPOeVx9/KSayUb6wVos42eHjSeNKC2jNs4fS
 snk8CBGjDf8ZQwvI3GSyw6isjVhhqTUm5hPiHIRcCq9FdAe2pTiSEUSzpcITh51GFOrjBwcKZH0
 SIMXZCCiXyarni1jEnyymwEAjZnNfkip28P73/Z0nH+GemtIhe66J7By05m5ns++G6kvbKrIjKj
 HTYqhCAIwsNULsB3REw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116695-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 73DCD70FA55

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

