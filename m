Return-Path: <linux-arm-msm+bounces-83502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31430C8B36E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECE053B4510
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943553090E6;
	Wed, 26 Nov 2025 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4gBdTtc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKPBISvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81CA219A81
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178500; cv=none; b=p+66Q2L2S0nLebmps4taej67nfXAJHljh7iKv0BocLXIzq1bRjVsu+qHV7Ai2x9HRemmqZqWuIQdYvtAwXSKjTngTjACCVu42rzBGG62YZ0DlSV4oCHCk67vRvZvSqQwzfqnvbOKPwydRhn3oIm2tmYj3n++T6Xn4nce5VgXQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178500; c=relaxed/simple;
	bh=aYf26yclBpU0W0OI36KWcQYEgzBrpPhalYGhwg5ECvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZCtv9NBJnJEVoVpU58KGXn8YMH5csRSipNcns0N+E9VbZO8MeGuK2tR0+xQJlKRUDQtG14qABti/BDcJPGJcgLodCf4138DQcMbP9l+U9Y2zVq/9T4cJkhgptTbwOsql8Rk6hCLKxpOTl/MAquTdxnHZEBCrv7dUV4g8qPnCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4gBdTtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKPBISvl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF7Y5r1457809
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=; b=Y4gBdTtcTXVaP+A1
	sMvbLaZVuStEDUkZTwCty87p2SMVDE9x2l4fo3Tqh0nOkjMklaJ+WE+U3Rukik9v
	jdb7AGz6P70eM0GxSHbMpaDYvCDkhwq3rIpPkL3/FYRw3jFowYFhsOMFv+38O4YH
	uF3lGdfU5bizWszZd/WEA1gpP0dcjTo56VwzuJS6193O7E2uhu9TNQpOnYQX3RjN
	tQY6wEtfCsgdgcx/+ypzF/v6ozqM0sDY84i6zeZV/aqZ4gxMMaJ5glPnS22LxBp8
	/xuZ0rBAaIfBhMwVetl2O64oUsS5YCKHhcYT6Zw2kZnv7Zh4m5b4CG6uilQ6gu2m
	MzXGPw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhtrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:34:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7565399a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178496; x=1764783296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=;
        b=UKPBISvlJ/ms3LjE2ePelsXjbU6ZrQkZYxeK8XUPKOG+Gs7vCCPpQd9sQ21Tcqn4ip
         T0aqdIiDO0pFG5ADj9tKGBQsiQP14I49EaLWjyfbgDCsd3QUyk+p45dX1RsjpAjkD4yw
         2QuFnHheRbdXYoDWjjo4qIBslNQQCi+zsGEyCBS4DLjxLRkDouLdBhSChj+Gr6UR12uM
         lIgcAve2hUuE71MVZFRRwZMhgGfyfAZqymCMrZcfGloGt2lXRlBr/Y+w1KEcviARbukG
         p6nJGIOT+kGi1mBWzrUYeYstoMiGIZpxr8tlEbUcsZgaxWCcxYM/dUPNUsBkeyNKtHoR
         oUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178496; x=1764783296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=;
        b=OFuHX9iAYAjRbPGreXJa+ScvLUz/mdaV/yTO5IdrdE90gmQuQqH3UAwZO5ld5biBtG
         UenRGr3LIvDGE6sdTZOUq+X7gV7IU9skjI/snXP4Qem6qC5dLQ7FvjmBgPcxTakqjmZa
         vWaHsmlTH1PE8FaiRqVzIsPQ9aGEeccpsklFao+dY+8avCjzxPo6jtllCOkbEAbSIa+y
         xalw4eAE+KRPuCqMKj8rwbcsHF7kdOECew4pxkzhu0Lj4z6U85bEqjhmdnfZFfh2zncH
         50jhtWdlKApDP8DIZg3RZ9vAMmJXYODihhqF7DuI6p45k82+zHeMVazcf201M8vfOWxb
         E2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU004xrZZYkOcbcxzTEIdw2TLFI2DaJ/hesGMQajX/dVnwo589400+Hagmq+WkeBXA1mhjp9bRyYNCJW8cP@vger.kernel.org
X-Gm-Message-State: AOJu0YwQf3BbNfQ4NnpF8GxaIvISW4XU2s/30Th7uU1Rae7T7pm3EIiN
	a64A0h76YrIykqDChxm84YbLk6a2HOLOt+3/60ZO+WAU//IWnj/fCYgXebgDh7ZzRYx8LTszd8Z
	tlo8W+zwniqv8SkO8CcpawzqN1Sib9zahdfhSSToXs9aDCXUkmG9ZnLA1qfndaJNcHgb8
X-Gm-Gg: ASbGncuajNZnJmNun3MGhmc02doahhyAOmSM2Y38Mzeaa26BD98Eafge0VImJ6lFs8p
	uv0DqCgM2cZpJw4xlIFzpuLTGOF/Z1GLBNq+B0GGQS7hsZ6vNrE0e42tXa2VIbBIwcGCjJd+1mp
	4e3FU70FKiwe7MAD+iiSt7yaZcThuClNpBwAAl/ut0+NEWPCUkz26ZCoyBLsrxvQKB3JM4xj2Bx
	ecaMn3HMDxy5fIYg/tCIYcAW9tS4LYriqFlyg061M0/Tv5xLz1QMPj5h+o3yjVfqSQD08zdG5PZ
	BGW2nztXzdny3g0V1lCek6U7P7W3iLjy5nMZqfH6VRQ7eo8wA7bRMtntDCXEmMVtZoVOcMgLzV0
	9ypdIVnH+qs6HtosLmiQr8haba7nxf9tT2RYajK7EEQ==
X-Received: by 2002:a17:90b:2f83:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-3475ed51453mr7919482a91.24.1764178495553;
        Wed, 26 Nov 2025 09:34:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp5mCdN9f9LFiefcsSriDXhzKm7ugs3IpHAqPHcQDDWsl8AfaEfO8/utu17ZBzu2FzrtVCbA==
X-Received: by 2002:a17:90b:2f83:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-3475ed51453mr7919455a91.24.1764178495041;
        Wed, 26 Nov 2025 09:34:55 -0800 (PST)
Received: from [192.168.0.100] ([49.206.43.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c3f1asm3232645a91.16.2025.11.26.09.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:34:53 -0800 (PST)
Message-ID: <7eb0eb2c-c011-486c-b41a-3ac8baabe2d7@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 23:04:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
 <daef579c-6289-433c-b1cd-0a8c182f4b8b@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <daef579c-6289-433c-b1cd-0a8c182f4b8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MyBTYWx0ZWRfX3ySQLq5d1z2Z
 2CfDLJrRFYOtlRpj38045bQPDXPQiAJrFjTlqvPnqorCRhE5QfGXc5ZH/My+OuumFlDtgrhX95P
 5o+N9E8ViuCcarG2FwDns/CrQJKCCQTvHEd12qwQ2rVQzJQFo7RC4gMKelMZBTP+G4kxFgze/aa
 0K3tcGw5qF6o6R2JgwzKnryDgAurkpcyg+5pilNEVu7Wqel1Wol4u+9mupam6K607VTFwlB8g1F
 Ym6UQ+UttqOnBe71MG70TXL9/xkpR2gTkNWQ2KeMxayiJrQZWMLx8ahdwlljlP4juC4g4giYgUX
 wFnpb1ou5zP5jM3SMYFGQbHak7S3FeyViH/o+UIVlD6g6YLeC1HPUSh6oUUWLLkvVAEFCu3VAn/
 0rdN71auBwSCx/rzj5xUC6xWl5mjnA==
X-Proofpoint-GUID: LVbY0kw8df26e3y2A0HQ2itjFvBnWcJx
X-Proofpoint-ORIG-GUID: LVbY0kw8df26e3y2A0HQ2itjFvBnWcJx
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=69273a40 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qGQbs1vc2yhDUS/Kx3M+Dw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FvykduKxJR7RWhW4CT4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260143



On 11/26/2025 2:20 PM, Imran Shaik wrote:
> 
> 
> On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
>> This series updates the clock ops to clk_rcg2_shared_floor_ops
>> for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
>> chipsets.
>>
>> This change is required to ensure RCG is safely parked during
>> disable and new parent configuration is programmed in hardware
>> only when new parent is enabled, to avoid cases where RCG
>> configuration fails to update and overclocking issues.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>> Jagadeesh Kona (5):
>>       clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
>>
>>  drivers/clk/qcom/gcc-milos.c  | 6 +++---
>>  drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
>>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>>  5 files changed, 12 insertions(+), 12 deletions(-)
>> ---
>> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
>> change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787
>>
>> Best regards,
> 
> Can you please add similar fix-ups for gcc-qdu1000.c/gcc-x1e80100.c as well.
> 

Sure, I will add fix-ups for above targets also and post v2.

Thanks,
Jagadeesh



