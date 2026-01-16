Return-Path: <linux-arm-msm+bounces-89370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB2D2F98F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D50FB30A5E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A0A30DEDC;
	Fri, 16 Jan 2026 10:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iv6JwJfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pnq5QjR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90235EDB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559527; cv=none; b=ILEUTDH07ckk1TSBDxJMD+JrtBWrrhmaAmhUBZwppVVMymI40xh/8+oXC/ElhXf7Nf/uN+obSR+iCfnrZ3RmMPwQakDbr6gNEPGLRnaUywPslpMDY2uMRGWDxiaL1wmRXoSiZsLY2IOvOA6vW+dIb8QU7jMlK6M6sPNppyqJfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559527; c=relaxed/simple;
	bh=/Cx7V5d/qObJUyBY9jlVvQ8ZZP50XCxdpJR7+g4EbCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVz8ENfUCPQHQ8rvGvvmt9xMmSZoppw4Srq8CNZOvFCkikuOWlvhRFEPfe2Aq+oW+y8CKGljwq045K+8Ex3719Bua3WKiGJrVcPhdcXF7LzuguExJ04OeAirP6YB4PZ8LqgFMLXRalJIdSx6+7WOUMtXB0B5PQEkRB56Mn/U7CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iv6JwJfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pnq5QjR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8D0H43596383
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=; b=iv6JwJfANV98Tvl1
	LQm81yzPFtLSjzBMX9cTKqZSEhVr/Kwfp4UNegqU6wZG/tsaRUUR443ordZzO8s7
	RhJ5ByFbwrXZm7Fp9mjRkg0aPjK4EALl8HuajU57sLHbn8ednQQbvvNn4zuJ5Nap
	FaxgbbSIdrX3Lb3HNWrOh1pHYo2MoeGVgHjLUKDxWZ3y0mwESqF6DFnbIUcCsoHy
	4ReSw5HlIjHKzMYL6i6RMeeiiB8psZZKXAPCRzFRf74Iw+tHyNrqIQ22yzfw+yD4
	0DjCpVTkECsJUiUHZkKqC+vrhx34MYW4VTnVR+CTs9I3EAPIHdtrYOxuF/ELJeCF
	P2S0aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rst6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:32:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so1577959a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768559525; x=1769164325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=;
        b=Pnq5QjR9FZXo15nhhAZVE1XTBx1pPlBarGAYQe2mLmGwq+NIfLgliGBoHVKPXEu/ZC
         cMOofyRmzCfGS8b0cGa+gc4SRLov4qHEyDyitvIWFFedtXgsUVd59bG9f9PjTUz3Ndqw
         6NeSy/Cvxy6ZpAKkUjiPim99DFxfYdteRCbEWxvhwoTg9G3zOhpINsQBwFHp0X3/5yej
         +1/X0uAs0pzq76RxZWtK7NLI7pRQnf8LkLTusrs98V0QjLKww2vi0DeUA0zsTHLhsCUH
         vFuI1CRs/V/m+KwHOkrF45tBNsqEkHEjzm8m9bk8AXCVrQb7iZL847c8Y7M7AqHbn15c
         RZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768559525; x=1769164325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=952Y3ub3hNvwTYEtHfS96ADhtWIoX8HVuHXXqCwpINc=;
        b=f8brzrNtxzgAw0mWyIwUNQY2TOGlCYRWmwpXnkJqfOHpsixqbZTPBdN6BNBJKYXpjI
         ZNoFeOWr/Gwt4+dbFfU0DIM2hDB7zgWSG8R0MXzzNhYkaSvwrxI2KElI52aw4Iha9Owy
         e6k0wF/ZGjo5TCYXpPWMkmNZSDFXkuDyLlQOkRw2RQjQ6qVLQ1VWLJ6Eny2POtjcgxcY
         C9g1G2fQMbvyMbsIlsvCPUKSoeC+W6jvmeJX+GKrcN/40vSbBOEscJeypGomui/eUsuw
         VLr9x4ryw7VrwfnssETDzAibsSoBP2dXv86kKb2aIfXSaxuFCMBrRKxdoNOfv076z9EN
         Xdpw==
X-Gm-Message-State: AOJu0YwdMJBh8R2SFI4IHfWZ4wu2hMbnULWtwjahZnVUBvj0i+JQ7IE2
	K+qQmSFE4OjY/Rykc/1B49zrm4LaozvVxn04PLEf1E+FHe07HsGTDCbcRoI0c/EufvbL4UzpyFQ
	Z6FdUHNAXspW47hNM7Tqa7MNic15DnV9GtVUh0DuxhZJTOr+vgdrDXaMqf0LUxsYRv0/U
X-Gm-Gg: AY/fxX6Pq1yuRflguwCmS81m6f1wFkyzbGOkoJzA5Wdae0aVnFd7w1FfgpguiOmSPUP
	9SOhkCK/v540B46zDUW9XHVGEjinF3rNXim/Rf9aVJl8yMy/7bfZqZ2rFMLa3avO4pfhTm7Xn8S
	ds4Pyo+pyqeAdhHtjDZ8yYRzLMeE89JNioktqvtyuWc78XTHF+a6MCUf+t7TLhrEisK6Mqa6Vou
	AxbCvWbdtOsKHZukwdIRtEATznmI7Zi9arXuM7cQS9NECGcJ8U9rUSZ4DVxAHInMaOjIiMXO665
	yag2Fgn12HN6E7pKuXoMcAZZtaWFhoyPIqeg9W5/suFOZp9PmGuW81yJreAYFiDWLnsvy8THsfy
	HLWEJBAx7+Q5i6Vr8aOyuxmD1k6doaQwHPf/LRqrciw==
X-Received: by 2002:a17:90b:180c:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-35272f96be6mr2269123a91.19.1768559524726;
        Fri, 16 Jan 2026 02:32:04 -0800 (PST)
X-Received: by 2002:a17:90b:180c:b0:349:8116:a2d9 with SMTP id 98e67ed59e1d1-35272f96be6mr2269111a91.19.1768559524275;
        Fri, 16 Jan 2026 02:32:04 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf24dd2bsm1763003a12.10.2026.01.16.02.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:32:03 -0800 (PST)
Message-ID: <9dbabf2f-e2eb-ffad-7cf9-f452a10e7628@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:01:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/6] media: iris: Introduce buffer size calculations
 for vpu4
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-3-8d11d840358a@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-3-8d11d840358a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OCBTYWx0ZWRfX1R75luMGoYbn
 W4uaq8F3bPrkeprAQoxbkoCjsU9DiArDSbLMsypfuWo97gQy7VOM/j+MKowumNG5zwjGwUajLHT
 jPpDydAQsjQzIIyWoQOhCFrp6DQmDCviRU6NxGBjG4Ug9MvwI0VB4fM7lclXmec/GeGG3oj1XHh
 u64RMmm73G9VvIC7O/jWThbkDWP3mstsTwgrvToijQoMcNYxz82nDdFPeFfLO0GedBjINynXxjq
 AqNpsUcPBXQgyrQqlqzcxjLQJtpEke1TxkuLftuh9KtjN0+1s2CHn55RiwKJAL2ynfHR4ZQNgWS
 P9pyXQS4KahpxsxRfuF34QtPbZLrH/E6zCAes81FFJ6ZikvVa67iqJ0GWTTrBkjsJohe6jhoUQw
 CZoC0MoRC04xeE/bUR7/pvny1pgkZGrTPIUOzzmHqqwVbbj0aJxrm1LvwVO5Iq9oZdHjlEo0nke
 7TWgJc8Z0xitSoKvU9w==
X-Proofpoint-ORIG-GUID: F9_UV6AwghDFf0v36EkrGiwgsjieTkbu
X-Proofpoint-GUID: F9_UV6AwghDFf0v36EkrGiwgsjieTkbu
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=696a13a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=blWSk0AuXjsE0o78ys1YMg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AadUnATRwRICCIMr-X0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160078



On 12/10/2025 6:06 PM, Vikash Garodia wrote:
> Introduces vp4 buffer size calculation for both encoder and decoder.
> Reuse the buffer size calculation which are common, while adding the
> vpu4 ones separately.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 342 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 ++
>  2 files changed, 366 insertions(+)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

