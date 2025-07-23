Return-Path: <linux-arm-msm+bounces-66365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE93B0FC56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16EA51889ECB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2802258CD9;
	Wed, 23 Jul 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfCtL84g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57D1DFCB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307647; cv=none; b=SK5PXnlvKxPChBTcfY+cUS7A/AH+fPC9nF6l+XWGUwlhlVjRR3+039xJFD8DRIkc4uEsQ8qHL7tMogx5VnF2l71nBO1mqZqjZUuki0DsbAlFB7GAlXrROzEDth1ICDUNwUY7QE+SHmPCnJ29Y3oNEV7OXDCMi1c6ILAMaL2Xt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307647; c=relaxed/simple;
	bh=jjCh+UoYp4thUJ4utFKmMc30L5O1p//QCj2O11qZk6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROYhLCCp8zITdIVvJbXnh2bsm00gzXksaNuItH9Ob694txPYQu9F1V9+bn7mT0d7OpI3r2zXt/37z18fzj4f3kiJ/arbArUVDMHoqwV9I48C+I7qc8pCNj7/5ddS0OtqOFcW96i5R+3RBapxaa8URUBU3mmGya6rvcII1tlN7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfCtL84g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NITxn6015739
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzsHnqL9/hadPlM9oZ6TcSm5Sor5EgahUS/FmSJA380=; b=AfCtL84g/WgiuJo8
	wd98mkQAmPlVVt0pymqGy8LmcdiL8JCcan5VSCAzVgcfVUWMWrBviYkbGYz6AM+z
	7OG85BulK4hhCfzezB/KgaxMsuZzLuaqexCRlZLMas/Shozs/hYSel8eZ5XQJkQW
	gC6nKykdEqYgjqZsFGOBlAs/jFh5u5ij6kxoMdJxZzsjr82w7sFuBwNEhKW45Ml8
	jW1PIPutGH21X9cLYxkf7qWD2QOV7z8LoIhetRMVg/SzupvATa/V4laKwtYrWUpf
	49Z+X7VeKaq67FgOdh5qniGEVkJWkopuzDaqiIwSm/E/sWJty4jt1HaOuaZapMuJ
	IxoDoQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd03n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:54:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311e7337f26so266786a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307644; x=1753912444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzsHnqL9/hadPlM9oZ6TcSm5Sor5EgahUS/FmSJA380=;
        b=pVLEfltHuWz2nyGShloEETPoJgY2/Doq4WZXU96cejIr2jkAhhvfADRBjcb5XNfmjx
         lxNj8Wn4z8TgmBp/4jEu+mu0cQAl/fouYEPUQDrz7A/JjsUMueDy+qKCJGTTwbSO++G/
         b62O+tBJsQ5eeSOEgpNsgGyh3TvxLcDBBU32UlDldCSenQvsCGHUCqUIebzOWeTkz5k3
         dDag+Plv3Qoik+qtkqIlQQsMdjVEDiRhnseHsqDDHnGsdxcWghdUOL4neR9gKLm53i+C
         FBEyl+sbfjgkBF7TmDrRJGD9gMhwPE3ZbxOlDR7mhIMA/Tqut5MAs07MFGNkScCkDHAt
         f1Uw==
X-Gm-Message-State: AOJu0YzTCK4+iEqOJ2KBWyHRqPdpTqBnGoEU1DgWFUXsIzMh6RR9oicE
	0LX4ISjckEY96mv8WYmWDBfHug5ST0/BiEXYqql1kPYvnlVwLL4qSz/w+hgoOGlsC4P5/WWSUKh
	kvInBD4EwR+OqfA+7RYzJwir3ps+Kg8yj762R2FAiS5CjLYqRdWYobwvrQsUv7/dhqTx1
X-Gm-Gg: ASbGncsRQ+lAisbYg3/ViXxBOV2o2tAGLYCNOemtDAgXRvvDiqmRVAxa7hLe3UBtvp8
	FpGAUHNRzciOtRJS15fmQcnAGGXERPlDwN/xFYM7jsY+qsFjegaLmz21r8W/vV0Ik48xVmf6DNA
	qfEsFibboD5bWon5JMHGHz6b9vusDCUyytKokewhMMohSkrN/PeKHtmX2V/PWi6r43J7rpZB5bI
	0zbCosDruhnxbveMxHrT7Wwk9XWeRD2lJMFtiuM4uMpe0df/qHWD9ttDDV0JIDPfyQuZXgu5AkC
	bNyRsP8koNTrDBC1IzGuGdMHASIi6/nGNCpWrUNbja9KnSpnHLqt/AnHg+ahFA==
X-Received: by 2002:a17:90b:562b:b0:319:bf4:c3e8 with SMTP id 98e67ed59e1d1-31e507c4148mr7375979a91.18.1753307644528;
        Wed, 23 Jul 2025 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPJPJDfrA159Lqv2Tdqj6Nf4Prqoe6Smdo5JPb9rk84PO6Hho36y1HH3kU1XqlJ1NR66kYIQ==
X-Received: by 2002:a17:90b:562b:b0:319:bf4:c3e8 with SMTP id 98e67ed59e1d1-31e507c4148mr7375953a91.18.1753307644126;
        Wed, 23 Jul 2025 14:54:04 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e639d780esm54569a91.1.2025.07.23.14.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 14:54:03 -0700 (PDT)
Message-ID: <343d2e49-aa52-463b-a844-e78af2a54d1d@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:23:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
 <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4rLBACUrRzcZf3UhB1_p5R1lre7gHZxW
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688159fd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5VcmFa3VxYkzaEkvw6AA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX1hFXg6lzjs0b
 nyO+husKVFweX3wudExzf25XfvNi4DSmYyH0EdtVDa8L5T20KZJxcVNCDofPbY9R1xyAgeJ3DBT
 Uoa/yLdRpPDn12UQBn4EnpIt2nGaQQtciUXI1A4EzAHqlAqhqMHOm95T5wbx/IZg4h8+dwLothP
 hggRYEeocpbRXiNSW2KyBDHetHHj6zO3cYzvaMJ3+Z3ru3zjCUAk96iNJrd6Ts/I0IjEuwtxx8h
 jbr1zUd7btfhXvBl6qc6ofIKX8WeHnbFZqApKKOafnOrk3rDVioe3RyBa5X9Vt13kDHZnBtGXr9
 vmO9rbecIjLnYnhi8PX6JvMWjGCFW3RQdkbHPJOzg09ifEoalOMdzd8iHYFZj1VKn3iLoTAGHVC
 KhBfOb0+Y/k9cDevUPTzxNeK4jz8jkqV8PGQQ6CCFzSx+ZrnAI0Hge+KhVxX/fVGQRjZIn5o
X-Proofpoint-ORIG-GUID: 4rLBACUrRzcZf3UhB1_p5R1lre7gHZxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=462
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230187

On 7/23/2025 4:02 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
>> add gx_is_on check before accessing any GX registers during crashstate
>> capture and recovery.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/*
>> +	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
>> +	 * without 'whereami' support
>> +	 */
> 
> Firmware that old won't even be accepted by the driver, see the slightly
> confusing logic in a6xx_ucode_check_version()

hmm. you are right. In that case, I don't know why we still have the
below bit here:

	ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);

-Akhil

> 
> Konrad


