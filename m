Return-Path: <linux-arm-msm+bounces-119212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8985N+1gV2rzKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:29:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6675CFF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:29:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KWCjg+gj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="OdI/apA2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68374302441E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D3144161D;
	Wed, 15 Jul 2026 10:27:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B4344162D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:27:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111268; cv=none; b=uR9rg/o3cI8WBLZP7XKnrzCrFIEPhuZ3v3OmUOBSgjCFsHOIHr00DAuFhsm8JBvH7zDQACueYypviOysrgo8jZwmpaMjpzwdCx57rED6XZWr33TLzluY/YQG6SgIPngPfHXWg/CiHEFUKxaNWun+6Lk/aXZ7en7Icyi+HGrVamg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111268; c=relaxed/simple;
	bh=F9j0xQ3mrNQ20w5XTBZ6u3V6/dJHSyjNscaZuGoSW/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fyfuh8fJgytc+G5PI4g41ATxyFWeP/d0G661WqJtDmKZFtvmJC5KSuOAf09lWUyCKRHFob2Voo6odWSX194QPnRng/wJUildp93nVblyCgU8Hcd0CaruBhejUPlXrnjumEHJii/k8QfV2m0+9T/jRLCvG9pOSwBggaIPl6k9T7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWCjg+gj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdI/apA2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9ZTna3319752
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=; b=KWCjg+gjcu6CWjMb
	3QQpD6/Dp2o4S1N/JPnG/LpoQKCwZq6/wSZcSBshBYshjyD43TQNyRvumDBI3N62
	cJTjwLIgc4ZTASmzpl+fH+HnS+6c7eVSbjNDDN79eMx4tlEdwPk7eBWBzhkswSsq
	Et1HjxwOG8vY//643EyhrDMHKOFl6WOfDeHewneAeLYDH/bHOVb2MXWrbW5oee/8
	C0IWlKUSmWaTsKvixA582spiQjO4mjNJGu0/KYQgb1Umqzorj1fA/fHVGt3yIw3j
	jNuUO4PHesWUGJATWyXolyQtEBAMX5s1WLXRXS8fnkEufxjU6kHrSpxyuDn8Pvsj
	aYMwnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q605kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:27:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so13363921cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111264; x=1784716064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=;
        b=OdI/apA29vs+fhjpWNtERnxEPN0lB5yavgftg1YnADITBbA/GiJjzbd3DZBR7dprhq
         BAEOse1NAaQbN0BZmfaby9C4jGNJ+W5dqwaPW1y/wUar9S0WoJxTR+iirWMrnkvBOGuF
         q+soVoKw8uD/UXivvKJziZ34uXYgZKVY/1BMCQRP5+cJ2386AXGUGO6bFrrooO5QCPX3
         iFLXl5cORC9u8BE7Iew/01832+d7n08TQ8OqY4GyBglFm1gCXaWPUa45S2HealYWCn6L
         TJWZu5DNu+0kchxVUYA9uAOeemrqMPLi3QMOiZhelkDnu/k4EAmuIu3eA6E06L2G0XPW
         tOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111264; x=1784716064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqeWffSaD4dQlURL8TfYn7r46vLJtQDYSCX+eoewaBY=;
        b=R0PTSp1eB+iB/q/wTCKAwcrELvXQgHfwua6+MuF4E9IzTWGRsvgpd17GtatUOrR8YA
         Xb9UHoO/AbzkFv0wV8kZOiXyw+NTqyTXCE/al+942V+IXzFROKThkfUYfVB5d6pU9fSt
         +PsvDHjJrXuWcRevhGLyK/j0euTRMPZxKRBVHQVxMLXJc6S47eXhwAWzlLaNNRyo4ZYR
         D4dFNzjsx78BCTvNGdxVJPQ8a1Tpxm5DIOiLQih+SAuJC0UGh0TmVkyLBF55oRn3ira8
         hKd0uL1BdkY6F7RqDBmvlDT829K+ZABit0dFN6ZX/yPBe73WhgQAKY8FNpS9jN57aM/q
         VCiw==
X-Gm-Message-State: AOJu0YzHzL9YIhlKuFwNR0amnafJlwN5XD5k3AcfwNlKHQnRKOIL2nI8
	EG2dXLcpr37GNclwmBb7sWxAtFyy5wrmdVphp/EpAkhjnSkOQfsu6SiNAqml4fMyIrvACzhgFlE
	CcMUGsnbCNjhwiU7OfxVwi5hEheA6JLu7+38tkcDhPPR3JPhG/FRkZUSzsrTKg6pwxIwf
X-Gm-Gg: AfdE7clex+JCnNwPqlXYJG0G2TvxlqDOxsZODrFDrWMFLXP1sVHGd3AnbaajVFlQ7tf
	TbS60X4FzZhw4miyvJjsGNDIRaezUPa82PrcGSq9Xyou5mTsGrcXibvXqFZZSUkjermpJq1aGD5
	ekEnmCHI01BUpWS+hANe4fFe5+zS589C8UsSBae0MXm/x4zq9FFyHzbwVxTWfg4IMcCJ06LxLIr
	FrU7sIotH7cVdFbyaoCFD3j5DOP3gp8btYXbUZCj70VKaQ8Qz9k5QVcJkI8cblpPrp6wQByrKUo
	0kIHv+rXLaG0zPJYMgNaP8yfYRJdpDqFah7sk6YUX0QYuCLTQ6j+pE9gzWqqSW4zqhMz4uYCJyv
	GRMvQzy933RGYNL2sQ2lILyDozxq1Ilb9TN0=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138516531cf.9.1784111264318;
        Wed, 15 Jul 2026 03:27:44 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138516331cf.9.1784111263944;
        Wed, 15 Jul 2026 03:27:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm1117074266b.33.2026.07.15.03.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:27:42 -0700 (PDT)
Message-ID: <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:27:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX9xJUn7CaT7R+
 UQKDklpessiVRg9/ZthfwhdDaW86HRAzrPEQK3jIpaTT133Nw/yfyMfbD4pwlbezq7eXfWgiUZV
 p1Lyu2CxBy6slwFLg4MuX0TB4quIbCM=
X-Proofpoint-ORIG-GUID: M_W8C6i8j4vSsuB-x-AxgjHoZ58TaK8W
X-Proofpoint-GUID: M_W8C6i8j4vSsuB-x-AxgjHoZ58TaK8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXxI44igiBuMoX
 bykQ1k5b9cLfVzzkVR5/AfBVOd2EtnvfFA+28psW6aWLUACV7SShjHlfGjTMdQ8RB/s/vBvDjx2
 cOSEOS2tZL4WS9qOJ/z7W9hC2ZWGGW7ojDrsfAlOfYdszpt6COFL/ZfkNaxsHq3A/tC8N4+MPEQ
 azT8azCrPXbxCy7BIlWYfVF2+TqVEAtC5NC8EvL+VreDw6OrKeoeMH/jOz2KAR3joGXJwdQwfp5
 DnX19jEKfrz9JaRGtpo9hxR401BxfIdUoLvU5Ggf75rF6+f2hA3WD7YHuk7hhNvzOaLnvMj0dnZ
 XkF0K/Xn2cRTLPFPHuMJR4fzwjHD6jji/tBRc2hGw6EnpKX+mRC92PPOeHx8HUJenPqw3lsUsv6
 u0v0ZBLuz4vLsF4XlI32uck7ZWyTFR0RxzJPPJZNI6uqlnQB1vkX3+9ka8TQhEZzLyOBeDTtbcr
 piwIAln4Bdcp6mmVGpw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a5760a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bddrti4C3Ac78WpyR4IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:apateriy@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46A6675CFF9

On 7/7/26 6:36 PM, Komal Bajaj wrote:
> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>> SoC internally and not available for general use.
>> These are generally added to prevent non-secure access upon TLMM
>> probe, i.e. the board won't boot if some of them are not protected.
>>
>> I assume the proposed set contains both ones that are _absolutely
>> forbidden_ for Linux to touch, but also ones that are dedicated to
>> some specific purpose that Linux _shouldn't_ touch.
> 
> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
> I will update the commit message accordingly.

I'm not sure how to read your response. In other words - is this
patch boot-critical?

Konrad

