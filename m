Return-Path: <linux-arm-msm+bounces-115950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQJqKm9FRmrwNQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:03:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F666F65D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 13:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="avGLBL/1";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bCaiVTN+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 939F630380CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4EB3CAE75;
	Thu,  2 Jul 2026 10:56:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFF3C4B89
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 10:56:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989814; cv=none; b=tEsfYmYMMiG1GiP4kCJezmodkzDcRPxJ2LwDN2zALMht28Ii3t22WbLDINxXBSipqMstTUhuVNFmxkcNcZOZif5fLOGO9xeKqdCGKEc/UJk+PGcFhPG/Z5/35/+MATGzPIxDgTGNzXOt847W7kLnX/aIPk8/FvdBdg6RWEOX0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989814; c=relaxed/simple;
	bh=3AY8KOyUUyqG7bvvPct26mdyF2ZJXyCQ44f2DHyTO0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jejniv7NMKkVQH2fqU9wlW2eVqFIxQLTX/JG/J8FvC0QQmWsMj4YqlbCYRQY7IEOZN5LrX94YSw/E17abRdWl+0fVhVy9hF54g3R6B2hz5lkbt5ReuoWMxkRl3wVkPNzLBypfUqoGc+amMbKs3pwYfizwUUcSFc0ZN8M6s0HWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avGLBL/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCaiVTN+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628WD7u3009591
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 10:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=; b=avGLBL/13aCEgnD/
	yX9H0oixMcRik2vEesKt6ceIaas1P3zCDg65zzZqjWNm5u4HILtuaCl/WedbQoLk
	LM9HtQXV8Vu5G2X+cePmKUIjqIaGcWtkEJCASIwjbkKyFGDgPmyPjrjp06ygFSVb
	paepII5OgZcj7/RPGk5GiQxTmz3SLOY3b+Ic9CgO+Hou7iuSU7IcbOoRgTUtN8Vh
	6l6L4Wq34FtxaITwB9YNTX8AromL80uC1X5DVxZn+7ygULCN8GIx6ZZhbXtwhkbE
	nc/xltO9bwud8onLjH2eofHKuyVUOetaZoIkKlbnFbjZduykN2lY3VzQGgl32lbY
	obzquQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f579ruman-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:56:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6cb57d25so40018085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989812; x=1783594612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=;
        b=bCaiVTN+C83d3n2/R7ftMv+OBjskS9BYhRKQbWNAMAePXJs51quCQ7kthqwb9Ie+Zx
         n6Qu/lqppvbJQdN3fm6xuiULuNi3M2kFLuR0yTTdRaxBPN0RtcZFzzwZCgM/NVfn8pk2
         e9LCMLl4FjT9DhGkEocxXNW2l0/0xy8BCJU7IdEKbt96Zrr+30Or2l0pJDv6vg+fCIne
         EKEFgzkDkhvbXa+dYE1apbaxpg2CslTJgeDQQq/VzuQmNMAPa9QLK3Qo51xlHnZ5xJy7
         La8EQ8voaCT52X+GjX7gTDOEO2OrX/q2B7PNj8iP2+0AxjdlCekLPooyEckWTQA4BqiA
         fnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989812; x=1783594612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgxzcki5UyBbV4/pVuiRUjRfHm1oE4qpLL6wM16QHWg=;
        b=nU+41T/7Pc+aN5uYUBQZAbfR7pDgd88Dp9+oVwl8KOcMJT51+3PHBH4tOFvxC+2Muy
         VpREHQG4AXItDMuH4xWFSYisuJQ2rtGcBp0ThTqPcuQQH1STArOBlvK5AFDmjJSCsWPT
         lT+GDJ9zizKI1OeesnXjq7aTTj3XxuVypcFAv5BoXq0XaqgFs7NZ8CWTC7Za+6IFYk7a
         P4BSIIK9ueC+A/5fiXJJz9sSlbq8jr2sGzjppAMTeNOH5WTUxSMvMau3POB22l7DcyQv
         SuFp7PqsXWGy8hyRF15RHz4xeHyNn4WfgLoQ1clKBgsrHUZRAZBdvwvFARd+dQdDZqvY
         /TMg==
X-Gm-Message-State: AOJu0YzkxCAOw+D/BBudn3zkXMyjq3kwC8aEBOdbrgAkwclZjQsqmOJU
	1fyAC98qt79uWjZiFJpW5ndwyTEI6QbMMdUpPdFbDbY/j+SubWmU3YEJGJyJTAWtbpiZrTjIE0C
	Zuy5eY7gq8NNnMx14JRtO2RN0bFJwXO87PC4F82EBE9kcfcVz4ta3Br/d1iezmUuGbPCl
X-Gm-Gg: AfdE7cn+fZXOKr8QTYfG6PZjbTjQoakgY5xVyVipQzKgBF867BPlDt7zb6QrsQNheog
	xPOFHbEMx5l+F4TND0f/PvxYX+1jciDMQcZAKQa5A8zRp5vi2ppI/o1NtHOIkxpbXTG6eKyEOFY
	RUV2zacA8sPyISpLI34/w+0hgZEfHEyN0Ee0La8duyLCf5qT+PhapdVocc87JPuvPYRxykyfpJL
	K+Cp2ojlKqPDJCojqzQLgj/cSv5KhdShhMj66fBOblHlNnl9lICFUt7H2JEY6rWPl4leSdcOdCE
	njVrMKP8XJ+2brCr1d9txWJ2xVXYkfg82GlbQN+QU5vyU4K+fbkVoeqeft4AzXPuFzuUVX/LfRx
	9GFvGRcv0beoHC+CEtMnJB2s48FrgbRlYuFM=
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr45694221cf.1.1782989811861;
        Thu, 02 Jul 2026 03:56:51 -0700 (PDT)
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr45694001cf.1.1782989811437;
        Thu, 02 Jul 2026 03:56:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm110052666b.42.2026.07.02.03.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:56:50 -0700 (PDT)
Message-ID: <be113bb4-3248-44a5-8fe6-5942ec60f75e@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] arm64: dts: qcom: shikra: Add SMP2P nodes
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
        linux-pm@vger.kernel.org,
        Vishnu Santhosh
 <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-5-f911ac92720c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX6G7GEVJLmvxE
 bgpr+/Gs2Ubfy8ylia/Pj5gfdy5n4QjSVDelP6xvA6DyE0DuaTW8/j3Sh03LH69OEjVN1tkIGn8
 yVCMNPPUnvIAtUu+2dx/lufXt6MHvpCwGDyp89m3aNv1/M18ItctsV4ygHDjUd67C+6OefiyJz4
 kh/ukCZ0WHbuMymUhM9/eV38KIHjjEMiSKWtwzOl3uJ1jHGlYR3idx5krSSXUFJuC5BiBa6ENQY
 404N9hAW8YEdQ0Qzbgzik5FSgGjj1nU1wBovaTmv3oe39lDWjWuA6I3ONTyofOZ9kWxQeQ80zwp
 pWafSO6ukwd1bW+G8F5xVYjkfl3JlI2TCeTBBzkTnvm/E+3tpORRQOgcI0KrwMkNeYSMtRDPsRY
 jgLGVCSaNxDeT3DuJp3Qo493f9+4tfAITI7nRhWE+klF5vYvm+cKMGPFzX/9mvW7MfVc+f0niXc
 U3PsUYy9r7IF9RCKS7A==
X-Authority-Analysis: v=2.4 cv=X8pi7mTe c=1 sm=1 tr=0 ts=6a4643f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YUvwHg7a0UAiIoF5iVoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zAleNYhPxcMXiJ0eWA7wkO-CcLY1ITPR
X-Proofpoint-ORIG-GUID: zAleNYhPxcMXiJ0eWA7wkO-CcLY1ITPR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX7VAVTjvC+jqf
 mD6o1za3zJgpItnLInO792HzGv2hsawIQGsg+W+6SvIoRNRS41AvxQkAno0/lw/JacZIbqsEzvY
 b17q7IpwzUsgWBjQClCNv0HX16UvUfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115950-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:vishnu.santhosh@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43F666F65D5

On 7/2/26 11:50 AM, Komal Bajaj wrote:
> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
> Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
> inter-processor signalling for remoteproc state management.
> 
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

