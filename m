Return-Path: <linux-arm-msm+bounces-83402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3ADC88BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6D13AAF88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FDF31A56C;
	Wed, 26 Nov 2025 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCzCcEp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZ42/SlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063531A57B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146977; cv=none; b=LM2NNMWaCHtQnvw4RovagoMRMOHy19my/7eJRCyHXKk9rsHzi3Oc5gQM/bOJTkEVpXydO/g/8sapX/rhVCv/ZGGKAeCNLLE3stfPSKkZ4NuzHFERH2U6nTwrB+CXUo81J22xjFZrWLahhR2Xlm7SWRdVRub8xqJpME454q+PfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146977; c=relaxed/simple;
	bh=xJkqiA2mCUZbdNXFhujVDnBxmGwgg3orfD7vlQC5W5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etK9sdJi2l06+hY3UqBwxPB3ICHNCiTVxAQZMi4yPR4wbzH3vcOKNKdh4DmhvTgjYae9cvZ2dkCZgd0NQQ7sO/qFW28LDyfHJBh6cabZOErlpMaCkPt8qb9uKmnbu6a2SPhCwZDzjq8tVEzSL2l3bz8/V5iwA9HzNdHTjhPZhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCzCcEp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZ42/SlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2FxIH3317325
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=; b=QCzCcEp7KlzFmQtr
	+Pr9LWJPbRK157M13xvyNzQ0CFhmvZdaqfALYQ4WHuhePaJusymFi60pTZy8gHew
	+xtIme1kQn/SpZ8EhRTJvGs6cM2BwYdbwroZyQ06ztqNlQHj6fhBEqhFzuE6H4gp
	OfaGWVRwdgsQ/lUrGRsqoZCPdkPfMF8hOGXTXCaoLnWdZAsuhl7Sw/LBpkgabvH6
	SXDtzQ7VdERXcQS4fq7XweJ82UFDPj81CV6yndXR1qvlk5KFTdZWjGmZI25Gv7y+
	Og7x72TzLq6QITww9hEhn6ewA2c6FzPqtx4tsUUW56jowb8yw9DsS0/zRycIMouR
	ZwejUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qjvvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29845b18d1aso127349815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146974; x=1764751774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=;
        b=fZ42/SlF14fZOxU+M/r5SudwctbqXed0zpXwFwNEWZp9kWAKYue0k2KmGqkPoRjTDS
         Jm4eYcIeBVs8HXfX4WCCQ20Q1xvWDPLS1FzDgR37q8ACjxYH67CRpCFlyBgpvEk94DN3
         07hk5oK1yJQPwmP0+OlcvLqkqFh/raKx+kx30nFJSXo3+EVLdGaIZcya7u25taOuU0QP
         Z2qyrDLPYZp2xaCNhKg9uCU+B5zfw8yiryYAXb85g+XBWS9u8LTR1lW91fvMGk7RF/M6
         gWsgQcrDYSRM0S+hNXQOtYNR7HwlMS0JAWi92M5AKbgmSFIxlk8/I9uNZf+qcT3e9Z0Z
         w1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146974; x=1764751774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKYzaThavMfN9xSkCeJZ9Om/p7isw7/8Buf4mXyG9fw=;
        b=Mq+eifxQ9ukDNuMySjliHtkJEvwRXbnaochECPIFlQf+mT+f3l7oi21EQ724w8lmie
         kllhTS41X1NtvaaBHOE1booKiK71V8PCTgClrAZRJ//jZjc2B4fCEdf5NfZ3UoPoB8MX
         3H+egfe5ZYoQ440GROq/tCNIXL7958uZBBAlffBGPdOY07xdp8LkKBkN0whiFhoOqu28
         9Fx19hyc8VCtPdxwPYJdPWX1kqdTJVN+HXFNyf/5GpSpcqtzLNzSSzGXSlrKloaYBUPR
         D6HyxIzxfgN4ylhm8+b6za9KXolBLDzMtPKLGCkecGeF9hnoCxn8gdPWyH2RUlu6nFWd
         mjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKPBR1QU4W3AkBrof3jO/x5WkJ7D/iLdoqPWIjpi5KYXoBwodhQKxk6NK2zYl+zsf2/XEskQ467ijBquq5@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJWLX9pUen5dd/Ys4LbaSt20s/bbinkL4m+LiOFR9flDDfLSo
	zl1O0ba5kV+O6cRO6DnnB+WpqaKKSJD3nX+fniqgXlO0PaKcqpiVo1X1AhFVB5iSHDq+1AKsYii
	LGjXEZD9/HqE+TRhRnz1a1pRK5NG44OCk0B8U3Jqe/HimjcGrwAlZE91hJOUvS4eZIoGk
X-Gm-Gg: ASbGncuQPvacdAwuSGJ7Q1t5dysi9jesuGQjz59uLN0l7K3z0b5Fv2hIUXLpwilcjKj
	6LMa3XpPr64kB07Rrg5GC1FaaRdTpq1lBDcZ96z/kkIeFsnX5LXG732KSuHVijnxwAI6cbEe8dt
	UpjJEI0AYwbOuapNquSSCmIFfLsXCcq0sBXjW5N7ruZg1htyWGiTC9udYPpgVQt6UZoSZrgq0y9
	S3Aky8cVh2OoAtr+Ow1mzHlKYvHQGbkens07rL7MQW9Kbqa/oSS5gHhlc+yB+/J4dKGjvolQgUR
	gGwLKKjEFnS12FMResewOZjxh8s9YtX8pi5SLM1zqNJZfRFOvEVuG0F6DMNCJLfuFOYIrv9E96M
	y4XSImz75TTxUN6XYqujPmK9TI4+A999O3zPK
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr204304975ad.41.1764146974216;
        Wed, 26 Nov 2025 00:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSyNEPYTAcZX9Fl/ELmiSxuZq3jP9ASW96xANuBE/lQpDBL7kMlmh8D/R+amAATw4sROEmzA==
X-Received: by 2002:a17:902:d484:b0:295:586d:677d with SMTP id d9443c01a7336-29b6c6925b6mr204304695ad.41.1764146973764;
        Wed, 26 Nov 2025 00:49:33 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138628sm191492625ad.31.2025.11.26.00.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:33 -0800 (PST)
Message-ID: <5ddaa17f-931e-4883-a91d-89f60b392c44@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: gcc-sm4450: Update the SDCC RCGs to use
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
 <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-3-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXw1LD6Ah7LCsH
 z7GZ/CHQ3PgbXssgd2rxyx2N8dek9vd5PIU3HXFTJJ3DEYA3ZaDfbDyzR0m/kwm8lVrI2Aq3qFj
 cqk9/Tl6726VybdusHomW6XOPauPFLYC4lFC5PTScJ8QedKZ2XQ+bYhcrLyrZjt749fX2cWScyU
 wGQF2dS4kGSkZhQHjdocGqEFb4AsOmbxvLhfTZHI74/0KFX/P0lNBiZeIPqqgMssm9OPz2YMgU5
 ucR7OrP3wp3wgwhPhK/FAhcJ0gNLR0QXiPJc6pZXToodioY03zf38NXzG7Dwgefezc2HvpuRuup
 UrG/mGAIlmundbIwZg2OwkcQEuEYnJXHpEn5IvZ0Nu51zTm5aqsMCNLVZwnxvofScqWM4Whdbie
 GKNjfAlEVACoPvPQogKTwM/AgBUs1g==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6926bf1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KUIRXu8KYkrAdfImjFS6f67JvLSUh29z
X-Proofpoint-GUID: KUIRXu8KYkrAdfImjFS6f67JvLSUh29z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: c32c4ef98bac ("clk: qcom: Add GCC driver support for SM4450")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

