Return-Path: <linux-arm-msm+bounces-116004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u4MMKY9ZRmqKRQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FC6F7964
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jXgYrgV8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HD7kdRaC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116004-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116004-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F6BE302A803
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF8347ECFA;
	Thu,  2 Jul 2026 12:08:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2946AF1B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:08:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994116; cv=none; b=BZBQpWXj2lmFvPVODfFtKrm6xRnJlbqDnv4zsAN8BZZxJRWna5p6cFHNK/KxdCK9WBhP3OU2zqH84+bBMuuKwvpL2pchlj9Q/UBa7UknUHDPMO5o+4ae7KtsqSeOE/FXXcqxkCkpQNnIwBajTJ2GaAGu4fTg/m/TCDbxFzXlVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994116; c=relaxed/simple;
	bh=OjyS0thUu5O7Qg9fVyTOKr75ltIXN5gXWbAhELiCNh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiLMNqb2yh3nF54adpBNQP+UA+zMRAyeF3Ooc9v+AGB26qGv/oRgEVbmC3YGM7EKT2aDE1myuAvh/VSI5SppYDnr/IIwjVPt7X85c02H+XqxTjZeBtl7i8ktj59e+illlh5J4x3EcxI/mZt0OoikbqhNbSfqi6Vbox4WzAJiiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXgYrgV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HD7kdRaC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628WDGg3009591
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=; b=jXgYrgV8PCunms7N
	2UvgMBDe8JBr6M8RmEi6tfecR+BX8U3AywLpvZTMeb9iwHIaEVzQezxGQXBDECGt
	CQAjmvXa4gdF3Dj5xVbspW2mFLqppFbnNi/1j4RRm/9mMa+/LHJKoGZqNxfPzI5A
	IuAOgtp5iKoYnXg/6W2PtlF/APNoUEA705AnpWf5TZP3gaxYgxQBxlYUrq3ih1no
	eCloZGpByV0Hjd8OwL0pdJrNPTUkVACejMKDdzMhyMTgr2mRxOY+2ZMJTNzWWJoF
	eNYtuddpPAlxdTbOjuX3rfcwJ5WrMyleCJyV1ee6NoVwX5ZPHvgHqlqOsk1PZINB
	0T2dEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruvtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:08:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c267931ebso6858051cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994110; x=1783598910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=;
        b=HD7kdRaCZLtnBtBmYRYQIXt6zmke3+KOLxlGrFkPYc0fScyGBMWGAVlCZ8Qo87iv9Z
         AiRWSFRC2gHOcHjntMX6e6SUf5iJEAY7ILpwdOw055ssyPqW50abrq2pN0hRAv/kN9QH
         usCbyr82/rrrMUviyFhhlXlgOpgpVeZdPYT6+JP7YplHUiJap/0AHrpEsPdWlg7dMTHY
         FPtsnAnmsJ4qVnefwfZFuylOhD05a5rz4uqu9DxymBM5A/SPO7JYW10mjaxUhDm15g4s
         R6ZljtcspSyyzLDODmkAMfaGUfDqVnNKrHxiT202IDHNDDVsDYVK5q6Tb8Wh73p36WBL
         fphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994110; x=1783598910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=;
        b=af1udR1OyUL0AGCT5CYmNwMvT/PJxhs2zYKzOVLerZjn7M8DCnzp/G7teYQerB7czm
         02XdrWWHnYsa7Sx4G6GGWbefGK/fks6U82RLsAw+HVb0/j7JHQGRghwlxMki80CCxRRD
         v2/Ich8YMEl0U0PdtFV/599oUcJ0e7OCyQH26n55CQCxNHnXY4SzNPvUPVo4CLNx8fDR
         lOP/OceEpeLKjla1BTdEC8orZ+iBsWUMsT13OMtuAhOXV9voOGylwFqfDyj2BDcvWcTN
         lXw+zOJACAmVsJb6HpCTHVXXRZaXkfRZSe/3ZPKQZaiYzUqzuHqcqVW+OeHTc5e/AP22
         coXA==
X-Gm-Message-State: AOJu0YwjX33p+H56bW4wzjUGYNnefM12KfmiSNg+T4W42PQQ3Hfe+TIF
	7Eqs+QiIZC11AmHiCux0URj0Gz3wE+o713veOo6aKxO1UNGsMS8ERLzbnQvMUnb87F2JMZfwbrk
	1cFxYfPVI6TE08DprGxGsT64itoE6KdgDBQqLvIXlg5IhK/wh6X4DIte9vM9trcgw69ArtjxDfD
	2L
X-Gm-Gg: AfdE7cmlJUO4l/BxDDBdXeUq/+sRM82jmWJgRG8NOak4/zNPLHYihpdQWhRtAUIBM53
	bXi24Gh0LwHX4DxU8v5XNP47tdRiUxgrdJI11+4xL8RgSJMMucrYqmsnrvYyUw1iEdWgCsSXRE1
	Y+CVf12NmoIcyVscdVuzWtf97UMzGL3MOZha3ZRoWugt/1l0EO3RpsE09fpGoAQ4joNoSqIMasj
	6zmMD2T3QSXLbVzu8RKy+Iz4e61/k8VWc8uUQyeK4PTgGx/AkliDdi7Fa3U82hPDUMvG/DNnHZp
	qdmsPMdnAhB+yKLsm+/ZwfufmNCaItZuGtWml1KyxfT4b2hXov8itK1Q4fQAPAZFS/B08x6pwDQ
	/kDq+X5vkIxL7SRgCJWiawyOv7JtxkJVVQCI=
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr54171181cf.6.1782994110476;
        Thu, 02 Jul 2026 05:08:30 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr54170781cf.6.1782994109918;
        Thu, 02 Jul 2026 05:08:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm120457966b.58.2026.07.02.05.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:08:29 -0700 (PDT)
Message-ID: <b655782c-7250-4311-9822-f3565fea752f@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:08:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
 <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX3cAYzRHU7sGu
 JWfLE5wEiK8VWmXn3tDX1JeVP+YG41ebbltoKExkqz6lvmWo9spp40FkdSlgd3/X/zI/1kWxuR0
 V9YXVTbqZ2ppYg4QVx9GKgDj2bY0szcuWQNuHA3zl/0kLw2lXFRs0UmiFtZMbYIf6bmhtRAucnb
 JE2Ol7gg47xKQXxxDcUUgiQJjF+E7arRAD8LeD9Ah74u4L4JK3DPC96LBcznOY9mF5b2RgPf5Oc
 2xfXbzf3O6uVFyGj0E+/gq4vhRW0/erl4+qUsyuD/+kcBnYbyzepOfiJXFFU+TBC5ys7sK0OSCG
 bmV2GQYRmhIVIiBq4jpQvrlIpwbDoplVaJfMOreckXKz1dkwA/2NOmPoZ8y8OTzCZQHIT0c6uf1
 GTXM7hCP2uVr3wt9pkhVOYLBNSlrL5xGJsZszB6tIOqMaQsTdbOUthqMmswbxolBhzjK0N8c/Jx
 m5xUDDxM+FuLlmmfilA==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4654bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jlLNuUvImV_oxURiXAgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uAf4ABuHh8NrOfKD4ppshYpoDIhtrhJ3
X-Proofpoint-ORIG-GUID: uAf4ABuHh8NrOfKD4ppshYpoDIhtrhJ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX2vChrg0EoQPd
 IiqQ/TTdZ+k3ylDp7gPFVl6nCfLt56SeNubK769yboHPovIH94I9e/kiOwCGhRr59Am5u3djGJp
 AF7+WkMD6/+kvqSc5OkE7DULaPHy3Ck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116004-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF8FC6F7964

On 7/2/26 9:33 AM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

