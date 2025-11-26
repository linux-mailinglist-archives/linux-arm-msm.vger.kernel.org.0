Return-Path: <linux-arm-msm+bounces-83404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE1C88BEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9EE1C350982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B520231AF15;
	Wed, 26 Nov 2025 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZ+k4uiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAwvr5/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E6D31A7F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147026; cv=none; b=jnQxh7hp3PgsepEwMZf+jT+me133W9Fj0oCLOooQ76DKPsniDR3hSlbnclVnZ2VFp5yMt57HLfe7phShFzKlmAN6KtL8w9z444Y7Xr5knggiJcHewKfoOXkGI/90xSMaqXf6y8vlw6Ida6lLOm29eib8S4K8pnG5tPp9Dpe9tUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147026; c=relaxed/simple;
	bh=R5Seu0vgwgNrYrwozGl3pTb1ewpQL/V7FTFMjyZ0qxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8fF6tOteL7oBUYrj/rhG9rL2s4teIgHFGdvM4Q1XWQ0yd2fonWXWUKLInoVFgz1BAcPTQr62dyUxR75BSLXDT7oP10gk0z5B5C0rnM7P474zvu4/G50bfZtbfhugQkSod9sdXh12M2feyFx1tfMPiKTOBlvlW9CP5qVKH09t9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZ+k4uiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAwvr5/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ769rN2650830
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZufI0kznoahDSG8+4LkFnKpZT7IvFsfq4lHdJx3G0c=; b=AZ+k4uiAj70VNb1z
	IfP/xiuQbPNG8XovQjwh3SyccaosReCBpaoSGY6FNXM5aocsYcvrBQXSUoz/3Z2T
	m4Y0Wcs2KXt0c4EF1U3egVHPrHqdoPjcIKREkHbjjIU7M6SHKSvDmJMAoNxw9Qh2
	gy1SzNfKcnpo+xNTpr2kdoWhU3F2YiwLPegj+1o1kj+s+uNMzOwNzsj8DZ5j/MjY
	eZU+sLZ2wZ5x07CJA7O+d+xfuSXMK3RwMkFA9iQXpnISf7nSqBW1ar7yGY2LzEFO
	BtnHRVzv5kXLNoFQf9CrCrWsuP01/oo/h8QY37YOj3hZzTiRPPYvlRGz1oF1jvSf
	V76k4g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabue9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:50:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29557f43d56so82295685ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764147024; x=1764751824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZufI0kznoahDSG8+4LkFnKpZT7IvFsfq4lHdJx3G0c=;
        b=CAwvr5/BXq2Xcu5wEldzRJySA/xKSXvRMUS2qNXit0E5Uy+LaiZhxEtzSDDlv5Us1Z
         o3qm7yssbDAu0UbQnUjB3mTM1zWLv58G/j757nH2V0dTEo7VSNTzKi8Sl0FjXAxwDwTo
         lTd7FEUOJt+TjD3MH9N4f1GemvUo5REdOsfTKQ/VU7//hUHAgq8quW0c+wshL/xiBCPl
         Yn0/c2Ty4eQm7vPdbKylw3VRuRnRj3f+F2Qg8i0X/UyUl1+n48SXmfKCOxUqIrHq8o4V
         w5U6Y0hKU9MXwrsigTgxFsIVP0NoO4asxjh0B8ohKrEWm22VGz0NiHkeDzUothUgFFpP
         0K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764147024; x=1764751824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZufI0kznoahDSG8+4LkFnKpZT7IvFsfq4lHdJx3G0c=;
        b=HW1CaZ5UJqlwd1KdkfnM6oWq9ZYaxDixIKkLApqD9YeVAMFwaUfmVQcsOwPgCOLOdw
         VWC0Xnws3++aZetFMvLQKHvLdbslfXr+MqoE2JX+i39TSHHGcKB+W04whoARWR1IM0U9
         tpuf8x/gLpD07tJmhBzMZBJlECwTr2UmA3XcyTzmxSsElSG6MOiG1Stf8Id9LFli+Zg9
         NoR1qT8+6qf7fZtLiGSmM/tlB86DUywdvsQpCLH6rKnfS5zn1xQNlRe07thheryURI1G
         97mk+ILB56hYvGRi4g8sYnbeI5DG8kvxGzgUxbmd7jZT4JWD+cWM97rCaYls4JLJZSIk
         tXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCULMuADTCz+f9VEjyExZBXMVbhtFAGKaS3RxUZ4HfENNucLEFSypbkbXSVmHsXChArdl0pP+CUBVY98zaoY@vger.kernel.org
X-Gm-Message-State: AOJu0YzE7siZcdDrLk+ZYbXawbQ88ex3/nSNjH7trliyRNQZFUUXUA00
	F9wE3ADLYOdK+pb+Ytxgw6MFwJl2pmGUiofbq9HFFl0ohAg8m2Zg/7Vnf/BYouEx9HmApB43ClP
	xpR7wu8pyBl79N5lAXJypr3TX7kBg7wInBLa9IkypJufDKZXPmHhau1Q0QIfJ6BS+Zhd9
X-Gm-Gg: ASbGnct6UY9WXvo0VSdgqtLbI1m42xc2aRu/yFhxsujLdtTpkbseGVlwUhmBQ1LgC0L
	ptsUKm88QDrwXPKYh48ylkEAHVxMqWsU2sUeBsk8XNgV3bOK1J0p0N9v6Cse3Z8g9u4vTmfXprd
	1wFYYGbilV2LrW9WKP+2rwreo/ZtESKKfH1BEhBjV9b+JImXxvnOwzbu6DWzqfOjEwTQcRl/Lak
	oX+PyHszDLbklXVuUag3lsu+TIe9e2IW2gFpPMriCSG0iv36jv4aGhExeI/eZ3uXthMs/oO0kh3
	FRL0X5gbEYGIdx22dfcRR/FPvBjnsPYVZgQOJNc78EgNfHfzYm+MtCL4j40u7GJXm2mqneVpgAc
	IUkfFcvb9h0MsHpcTjcDIK14q0HwPyIBvHjE8
X-Received: by 2002:a17:903:2ca:b0:297:e231:f410 with SMTP id d9443c01a7336-29baae65be1mr61265225ad.13.1764147023427;
        Wed, 26 Nov 2025 00:50:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuCkYn+sTu2H/8PZIbNOJcRgrh328lbfRotI9dqupw3qF54d9sznBJ+uC5sEsjDITQ2KHICA==
X-Received: by 2002:a17:903:2ca:b0:297:e231:f410 with SMTP id d9443c01a7336-29baae65be1mr61264855ad.13.1764147022959;
        Wed, 26 Nov 2025 00:50:22 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm194138735ad.14.2025.11.26.00.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:50:22 -0800 (PST)
Message-ID: <daef579c-6289-433c-b1cd-0a8c182f4b8b@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:20:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
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
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6926bf50 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=74pRFSKMM3CLsv8Bj7oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: RFGQLcGd-5xpl7QFtBYr6kBdR66U5Y30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX5r4ahA4leDWi
 dn6tRuLhpl49lyAtu59V7L9WRNOyepqJURKMjygimeOPfZFnS2nBH/bgygZNUlvyxPvQYlj4yfz
 Q8WTw4xBfYXViy1RnBO8gZRuNH7XWr/rXQ9H06dLsXP4j10+SOvC24W9WB9Ah/ler+drbbeR/lW
 y0BB9pjsUsg3BmNpNTjPUzFcVxoyJFK0xWpx3lcU2ZAwDeAfIQYA7up3VfaBUkukHNHp1ARJ42C
 A5+KZIfLqS6jQ5dG9j7+NETQN0d5o90VSFGZM9e2noB1LGaH8YPp2F0dNq4Vqc55z4g+zHdCxcy
 HCD3whEtQwvzgKCfdnMRVfeXEoTLIYAkJ3Bm9D297tE5sbNoTETSRKo0G0HwJoUOmcpzqcx6jEI
 KkQ08T9LQIXcYsIaGgs/+IHSNshpEA==
X-Proofpoint-GUID: RFGQLcGd-5xpl7QFtBYr6kBdR66U5Y30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> This series updates the clock ops to clk_rcg2_shared_floor_ops
> for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
> chipsets.
> 
> This change is required to ensure RCG is safely parked during
> disable and new parent configuration is programmed in hardware
> only when new parent is enabled, to avoid cases where RCG
> configuration fails to update and overclocking issues.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
> Jagadeesh Kona (5):
>       clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
>       clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
>       clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
>       clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
>       clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
> 
>  drivers/clk/qcom/gcc-milos.c  | 6 +++---
>  drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
> ---
> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
> change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787
> 
> Best regards,

Can you please add similar fix-ups for gcc-qdu1000.c/gcc-x1e80100.c as well.

Thanks,
Imran


