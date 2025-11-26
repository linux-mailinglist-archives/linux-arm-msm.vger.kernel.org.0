Return-Path: <linux-arm-msm+bounces-83400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B88C88BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D22804E283B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444A9315D57;
	Wed, 26 Nov 2025 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltvTt4h0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c0tXzKfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C6D2D5C6C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146950; cv=none; b=rlSfYy+cv6P0UIHDKb5Vo5s/hkNgdNra7qyTlhlNjHduPAbWCIYR4rZ7y5UwYNB0Q203cupWC6FJcc6jnhj6SCZHkFIjEQbQoUBkkyqWT+gDEkNwH8b949bo0stk4691ElGxIqNoh5aZ8GkZONB4QkVKvK+8/XOpNO0fMti7bDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146950; c=relaxed/simple;
	bh=gk6FY/exCe3UX0ZIgiuhmVirrEMVQ6V0L91ME4nTxoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOGFembPASf7oO/B3CKPuKPiOkLV5dlRaiIPMJBE5DPcr74Yhw5OfZNOageXZUT7bHlzPwUFKaZkPo+cEeJbBfuyJvAoiSbv18RDrDiPQuQf+PV4UUl9ehNlQc7Qj7x3+6H55l3OXVkfcE/gFDSbYgG8oEoe77ydpxWkabAoBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltvTt4h0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c0tXzKfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6uuLm3890211
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=; b=ltvTt4h06Gn8bVcT
	jEa8QcX30xLmzee2QZ7E3U+tILfzDWLpjjZIOuzeNpr3/ypiizItS/r49pgQxk3/
	OOQsoTQl9sjs43vy6IpBhvQ2FKCLfBidqiBB+APGT2lVBIYHIlG7sEnl732jykmG
	aY3xpCXrD1AiXSsnpi+/xitcD1ULu3udUYghk/o9+k9hULd0QKf+d6Gb+srljhMT
	Uz9B2ieEmOo2vo3cla1RaQCDE3DrVIlsh48cibTHolfgktoD/vFBXxVc/LaibFfm
	W/JPi8OFHDtsbrdPy73hLeeg8Hu0ZaxzMSVyhLgF+U+PGw/GWnK+rdt7QiKT53fd
	yvgrHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmea4tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2955555f73dso99506185ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146947; x=1764751747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=;
        b=c0tXzKfkIUb0l0IxLQ52bYSwQ6bt6Bak3XGPk6Ovut/MEEgzy/WqyW+TCm/MA4Eepd
         3vppvXlZu3mlBLhTIFW40VNuuqRKIjJO97JIPaaiOkhCYC6iypxNLe07O1r9xZrss5XZ
         d3akT547pH8d1Ebk2NJr5eEDyha4CKqFqtJcPcM8R61ftD4Jk/M/Y3FiBOnsRGRqH/XF
         V8QUQZbRIjcWniNC2yg7jFQAPUl1XvWaaP3rYRS+nl0771+/1GUFnMM4SMDHh+4b7bUg
         eLuuQKALrZBrUZzS6/5+OSu2hS8VsqENNk38h8uBglAwCUH/ESNdg+Gea9XdcQrlbtQG
         XmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146947; x=1764751747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJbqLb4d9VUZGeN0fl4bqGBwMdTKQQYI6s37fm2IHsk=;
        b=nXM+WRm1h62xuIPFvp+R4y67qRwmdjpiqPkOI/wgo5bauUUC+zRiNnc+NcoXPIi7JU
         Vks5L7W12MbvI5I/RZTH7X7jxM4rdDqn9ftLWQ9XpFsSGKqt4W16YiW+hQGn11FRCoBd
         5Qb5eYtobSFV37Ory+XSJEjwJNjTmJy09E0IaFECUC467Zl96VoOQcRwIMouOZ7ZAszv
         cTuipvXweP0jFWeBdtLQON6U/1L1VhvI3owrr2ydnQxgXSIdZB+iT3XkO6tY6rhK4aXP
         paxO2BrEUggKEC3l97QCVMHYkDm9maxww8AlAX2t2O5EO6AeFXc8KMawAKdLQ0bQk/1F
         0j5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1Qrmj7MYslps08m3gO8BF735Owa0us0fDaK33GrHOLPkLxhGHwNET/1eIu0dP9Ya1lhtLs26IM1bbOefZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4+Z10CCKpCu+3UKaHbJ+bdbXaCzUZVB9mTG6tLiOHbDLwvyD
	Wv7uWfeS2oUNaek03b0YoH59ferH+stsn0z6EfF5xOgpMY1UZ+Op0pRtCKbJmqwK5bGLnxBBHD6
	F0768RwGqp9Chik2wEnBXs/ne297EV5AN0IurvZLXmOJDRBNykbgKqSRGDE50JkctDcZ8
X-Gm-Gg: ASbGncsGMGJs7AfNR6oqN9MHYSUBTp6Tx3cUGuVx3frMcjYhcpO2BVRaDIL6gJcWOeq
	RtLb2eY0s4TX+xpBnUzd4ASQgkQsEW/FgxGqFpIvUs99bEB0wMTXHtXmEBdrm4JuIvw6uKweouC
	+5HNbRCTru93GJmYWHl77XdSaMtIfQUsMpMEwFmK/9sWQIl8AIQ6HApxNz1/MSVKBMf/ttSeiLj
	fg50SEEpMSMKrMI3iEJN6x/jg2sMacvuJdON4SFM5u2drM7yo8aUnu3ovBUnFpeoaTDR7PCL4Cc
	2wWy6RVI2WKjF9Aoc+4SPUw4gqVoN4x/18ryPYC8at4TC5Iv4LPxo8PCTTGOZOzK2lH3ofLMoDj
	4raVBWNDYUt3NqM7rjwpXq64HAKk46Oricl7o
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr206687435ad.34.1764146946762;
        Wed, 26 Nov 2025 00:49:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErt1qd2Un8WGSuB/03VkAMAmnBY9QCa6Co6dCEREHFFW5Lh0pUl11JX5DQT8aZKSgxmlXUpw==
X-Received: by 2002:a17:903:1ae5:b0:295:3a79:e7e5 with SMTP id d9443c01a7336-29b6bf3bd68mr206687245ad.34.1764146946307;
        Wed, 26 Nov 2025 00:49:06 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm191356455ad.35.2025.11.26.00.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:05 -0800 (PST)
Message-ID: <f6df63fa-9904-45d9-9e5a-7b30065801fb@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:18:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-4-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6926bf03 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX8IZgeDAGFkxP
 h+uQPerYPDspUkwU1R5+hLj5ztWLHpaRu+0BOkj3aCuEqEzj2TluY0M2sSvmxpSla45LTmyptnC
 i3Oji99l7xf2xtqReu8ekXq4GPFLNueoGU0T9twP1gfuwr/9IG+5FwFxN2fpiuIaRhauCOIxFFA
 EOfdgSPwAcTpLC3yEBY4qLn9mVO5gkdurfr/98Riu6pZCA+zhv5nEjHxz+aeTvcvcFtLrkc8gai
 TM3pKSsTRO/OA2uA6uwQxwJdpNdlzoLjjKH8Esfmtxf3Z4G9caKQN7KbL/kc4//NSamQ9QFOlSI
 XpAeohnDihFfwqHze7VXWd4e2EJmAWqh0de4iVhisgv444GRnxM7rkcqoNyUiMkbVPGbHAYSIw7
 kZOAz13e8rDdylcTUHdCB1/6DnOzgw==
X-Proofpoint-GUID: 2IoiFCvBDEt_3jeiNyBxonJfvtPfuKQA
X-Proofpoint-ORIG-GUID: 2IoiFCvBDEt_3jeiNyBxonJfvtPfuKQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 108cdc09b2de ("clk: qcom: Add GCC driver support for SDX75")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sdx75.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

