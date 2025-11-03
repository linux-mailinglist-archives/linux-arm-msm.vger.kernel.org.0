Return-Path: <linux-arm-msm+bounces-80078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C532FC2B1EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 11:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8141F3B55DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 10:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756592FF64E;
	Mon,  3 Nov 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sxy+X6bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkhfPsRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED472472BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166641; cv=none; b=GcwkQu9uZMe16LcBLE5ziFCB9ckjTU87wUsRCB5/hA+z1P41ophwe/6rGkiCPWSUpNExI0Fe/3fct6joYQLPoYx5T5ctGw6mLJMq6FfPyh/aAovR6kGpjxSwhEVEGsUPqb/XyzWBXSdmOzWQv4lXPyjReXNPuebKbP30M9Qs7mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166641; c=relaxed/simple;
	bh=S3z3AEYSNb6TqWPbM2T/LYKK3xNTKe5o6Px3LyQEqeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdJZqyP+SE4EVvnUQR08i3zAYlmktRqKZ+m6YXkj1kxksp/qArrKTYbX2qliv2TqTgpRu/K1BRmKLBd+cEeT58Fj4vAjN/VcFFARwGDmGXJdqwH8ZY1A9+Bps1BAGZYuZI4MjFXTHkmQo/Q0Qak0aLkKmZxbYO0G9P/McQOY+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sxy+X6bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkhfPsRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36BHMR2267853
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 10:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTCZB2uO9jAu0wY+BLk/6izG8J5g9DH/vQc6x1Of+V0=; b=Sxy+X6btoxN9FDsF
	Ahg4XrrZA/uLfXkL3j2WkbUm23qFSe6Fr86Vsg24q0R1WJS/w1IFErKTXK+dl77q
	4aipmB13Uo3R90BoeHOp1SVSsLZuPCNs02xO9kB4eYP4wwhJk2MOicXJtmtGZNVD
	jFqGj8p3Y6pKAqqfOovOptA7nraw+y/8uYMiis5rBKN2idS8y87wK/ScIrpaYtzx
	Dy3gp2BTYudm7aweeNIrqAoxBULNS76v2U9O8MzLJr3E8jssKBxnKLinQaFQi01F
	qNiI03i/gxLpALO8CezqJPkyZNCSVPA2cUeZgIBylKejJZ4AnZi7xelogw+zV+zo
	oMLOqw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwagu9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:43:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87dfd456d01so15682746d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762166638; x=1762771438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTCZB2uO9jAu0wY+BLk/6izG8J5g9DH/vQc6x1Of+V0=;
        b=FkhfPsRcWFgwOPCf29bo3JRIVowFEL54esLswpUZPNGqqIMteG15gYsESj4D24MZl9
         Y2F7DajOGHVB7wPaNCIbq1gRuazKxmwUruzYhaa9S2ai8j4LIgYZt6/49SB4z1yYc6Ra
         x3OTVphDcvRMMxzSIkqFXqJRR8NjCVsnIO7gDRdhF9f13kvcCzO9P3NGRUMGxySpBa20
         pvimZE4+02KINUooQ1ktefSB/OoH9vPnGILE/1CG0mx0O/6VGUzIzrTazrd/lxVTzsHd
         E2i6poX/5yxF3Oxw8b1nwmMLal7wEcsQbA5I+VeoZj2wm50xqCZoYb7FEvXm4EUJxExQ
         m74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166638; x=1762771438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTCZB2uO9jAu0wY+BLk/6izG8J5g9DH/vQc6x1Of+V0=;
        b=YTn8cj9xxFyPpJzppafLVukDLsVWliDI9YVDFCNv9HgMGqZVsPGYY2Q61wCeoE0vK7
         o/TeDa6FzIg7ewHW/Ik7zZh4O0wDLdNppe0Dq9ooyZBvo78kbY6KnB8Y55nnv0jG+vYj
         TZGGCZq9qaTKxdYoQJb2W/qYutDm5kdFs1fkwy1p07HJkXWU1i20InFZe7LDTccTYqag
         +nyUPhs8PvUTlm6NrWHIb9FeKqfQkA60dgcE2Zg/mDZJgcSI54FgaG8qaU/m59oaCqsD
         cO2/CpFpGI61/OVh7qDpGb5bmcoUVstwUxkaWYPKOoF1AF5SOnV7gb0uiZcMmJ9qeGhU
         OaKg==
X-Gm-Message-State: AOJu0Yz9Y8EbY0Kffbj3u/GFuLNQ94ZNtMoNZzQui/CLnjBmlyA7ilb1
	+yenDka6DReEVWDmW1R+657nSiYbN8LDjzlQP14KIDvuYb2rnLbTPoBGUdmnc6/V2mRi9d4/yVM
	5rXPTy7wHm9JMkN8ZDAIxGv7UPR1DIC7TUphmYt/5rkHUpj046ORq7m8hHHjO7pgqF3s0
X-Gm-Gg: ASbGncsB7A/1Ux02wVZXeem+LwbymbY/8hj1E3yHH8F/MjxxG6Qtrr0AkYmn9vQkTMV
	+WZ8jWgwUxtr0mZ5Dd9eRrrwN7qCvqbR73fz+ndsuZiEef1eoMxYJUlqD6kRu4CwUzxBrMuV2dp
	TZBmJW7EAQLr6wZQBKlA5AtQ9E1ImEumE70Kf474SdXrzVKcW1vatr0Xd+ou91SPOQrT0D89j8M
	5dOFhPVS3bwUg8JJYIDh0RsG6Z6WUHkktoQhAS/+dnGyxgWKAlcaVUyS6G16fTW4H2JnYbHNE4k
	IugeUs8etPC4NI1SDTK/RGWbE0Q6kS265jBXNJYjzeNi0XckxEIeUgApworW4zgIf8wRQ6KWPkw
	UX7f+njzcBlCuhwIAvvUhVex63tshHh3De+KPbGPbs0BARHY7RyGxFpNe
X-Received: by 2002:a05:6214:1634:b0:880:442d:6339 with SMTP id 6a1803df08f44-880442d711cmr61924046d6.4.1762166638114;
        Mon, 03 Nov 2025 02:43:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMpuU91JDujKnOv2gb5OrdLPzgPeAZ8rWjLiqjT7iQk4EJ7Oo6aW135nvnZvmkdSKRuGQ+PQ==
X-Received: by 2002:a05:6214:1634:b0:880:442d:6339 with SMTP id 6a1803df08f44-880442d711cmr61923956d6.4.1762166637617;
        Mon, 03 Nov 2025 02:43:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b719b3117a4sm60330566b.59.2025.11.03.02.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:43:56 -0800 (PST)
Message-ID: <48292ed6-1d63-4fd6-9163-096358f507d5@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 11:43:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: qcom: ice: Add HWKM v1 support for wrapped keys
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030161012.3391239-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030161012.3391239-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=6908876f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fyxe1uYkvd6LmZs5FP4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: oYhiUFxTloFVQgxFOr43MvjpT4yRUZiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5OCBTYWx0ZWRfX5PW2mIIDSPba
 vwuz1fJXT+EuhFL7Eo9QP7v54CrISytjceFnqvjE3xTD3MbBq7+n11B5ZngZltIvFSKTpKiR2qI
 bUQnqozEAEUj8cxXiUky4HI7RD5UYzc7M+0txna+MK5L4EMsZBGrkWYYDCihCLLSPp4c++woRNV
 aUXMTyf9Tl6XqP1P7lrJlYBfkOM0wxQnvgYRPECeRL+qgOeCOCAn2RXa+3FfFZHvx62ocOpBX0T
 3/qkZXma4Nj47RYGngL85sL2W9FMgNjroWLueG/u8ZV8rRWpUS+gC4lwt/nS1Imxmj0gSwI8vw6
 IY5Jf+M7faox34q3PYkxfKbwuYfCcUDFJ+6DnOWDqAqEE+3VFreRbUsg3k8lW+F1HU1K1aFU66r
 KTP927GkMSr+2ePm+q1ChNd4OSlnnQ==
X-Proofpoint-GUID: oYhiUFxTloFVQgxFOr43MvjpT4yRUZiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030098

On 10/30/25 5:10 PM, Neeraj Soni wrote:
> HWKM v1 and v2 differ slightly in wrapped key size and the bit fields for
> certain status registers and operating mode (legacy or standard).
> 
> Add support to select HWKM version based on the major and minor revisions.
> Use this HWKM version to select wrapped key size and to configure the bit
> fields in registers for operating modes and hardware status.
> 
> Support for SCM calls for wrapped keys is being added in the TrustZone for
> few SoCs with HWKM v1. Existing check of qcom_scm_has_wrapped_key_support()
> API ensures that HWKM is used only if these SCM calls are supported in
> TrustZone for that SoC.
> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

