Return-Path: <linux-arm-msm+bounces-58810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62D5ABE62F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CBD83BD9D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F22E25E818;
	Tue, 20 May 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdW/De8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651F213E74
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776855; cv=none; b=qksvAPPCh55swMs0EoBPIZOYxz7U47OF/ZeQLIBBkB2LZTRkns4kScwlH6M2BUGYkIw10lDAjyS8C3ZWAcW1LgwjYeZwL1+7nVX6o/qmkTgxvpd6oFIdvcHlXpPrXXr8kiFfP24PVCzGpJsjGYcmlXgaJvUIt2MEhAvl1xAPtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776855; c=relaxed/simple;
	bh=XQ4XgTPmany/RGspy2GIBUsx+iMe+wfnu4fIItFaIuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4AsmEWpNrOSqzl0itWXkLTdYIk/kz80bupi09sYcZTDGNqJuSeXKlu/6YO661oMU6L/gWT2DFkLDsCGCm1txRJl7sjO3RRsRecqhkLPeRU3j0P+S/KVIazeRJ69gWgfga028ZbR/1yAzu1nlcqpRrAPOxpYu/o2cdHYPO8JNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdW/De8M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0wc000730
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D574VKMt13jRsGePvduMNvfO
	E6OLnznj8lfsesnTXk8=; b=GdW/De8MpxDn0zQX+mtIuRKwqszlFpcT42Gt4VkP
	m6SickPJt/TgW8jDQEmthU+w/Hw6eKXTIbm+cY8C+2t6ofVQsCbjPr3A1PWNa++t
	FYsFCdLt628G1Ew1zy9wCWzIjCkZ9fWklOTXchPX4AEcFnstX/QOOlzvLNuLgHwy
	nNv2F+/LsoLMxRZFciErVbY6tMZ71+X8fo2xYfo0XCp6CiM72Hwn9yxEv5jM7jS0
	cOJyEnZPuNVuqLcR9PqtNSh7AkRbJidv+OanZuNSfu88tQ3kaKVrmCd982CEzpe8
	b/vwYrnkSSz4NAcB7k1Ypz8Wh0iFAlnwovEAy2IyERT4Yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rnmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:34:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c544d2c34fso934699185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776851; x=1748381651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D574VKMt13jRsGePvduMNvfOE6OLnznj8lfsesnTXk8=;
        b=SgRitjheSRE4TleOA9T/u7RZE8J6hYviQsk6bGdBRSamj8vh5zooCE8AEButTvBlSk
         YfGnH0BYz3CFjTBm405CceeBS0vYW72o5DLipmhi6c/Q2J+yUoXDDyAfOdL4qm+Yupg1
         dkU1A2kexGhly4vVgCbDYcHZ9+ruI9inHkFhawIpGx092iCZPUQAJAh6+eoP6jrKHPIp
         uzPeaj4jcLivOiD0+OVJ8d4iAlePbB5pDkzbOPpLLKW/dSP4eYAmLLYajVFw4BzNdH9Y
         BzOQNmiz7Y3zBACMoW/OEYw8Lds3Ex09yHtIlxuoeQ5Gg1mgrDkJwjU7USj7nOFLWOER
         fmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnwrHmMd8I0QkmrObG4kjsmi2aS23+WOObofFo1jvZWxLLFXm1OBLq0nAg3kYc0eWAD4LFfs07HdbadaMF@vger.kernel.org
X-Gm-Message-State: AOJu0YyazHpUkPPU/qYxjmBMoQyq18XZpEIc4mx9tUQE/9GAHBuBfQlm
	WI1WFhZ4ae0gl6YlcuM/hgX6XMoaq1oBeuYWXEMPJ90UPkvn1VfXkHfOXxoqF81c7uyg6gBfxhy
	WM3DOtNrRWICV5zqErW1/6m9PD1bvj0aILCUhzcIASKYvTea2+rO/q8gvbeQbXIxPLRZphzaoJH
	IrdSg=
X-Gm-Gg: ASbGncvxEQjYpp7HP7Kx8lluOpD13PeLmElnRm7/rk3PUxN3wcQHEdAVeR5pXXmKPAr
	rISt0HqZa4Oz0bmcS1O53xGJ9Fj1uRii9Cuu2+eFf6NrBzhz7BiyxWjUkLnO0fbypf1WQhCErwU
	sVbZLzpuuo+xT9Uk5Qf8auaQahTP0BvXum9q2PHWDxhuiadLW/7w+EfWq/BZXXAqnvmD3o8gvDQ
	uiw92fYYztoBo4UL8WqO7Rjz+SE8bXpq30+cc5MOs2p2gOja3XusyOeRD0KtWFZ3bCavUga/Dno
	My6UxYBwEuPSSr69C0NS3Ipu8KNQbv7yJ5B+wEZzsCucNYckmrziwZ9i5lEe9+aqdtV4aeSJh+c
	=
X-Received: by 2002:a05:620a:bd6:b0:7c9:269f:b654 with SMTP id af79cd13be357-7cd47f5a35bmr2777821285a.27.1747776851190;
        Tue, 20 May 2025 14:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKA2pBPWcs79Yb18p/rq2+59lyVGDqL6XxYthvFMrYyB1Z6dh1CSvcvBp1ka+Y93OnrlsbA==
X-Received: by 2002:a05:620a:bd6:b0:7c9:269f:b654 with SMTP id af79cd13be357-7cd47f5a35bmr2777816885a.27.1747776850828;
        Tue, 20 May 2025 14:34:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fd32030fsm565196e87.69.2025.05.20.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:34:09 -0700 (PDT)
Date: Wed, 21 May 2025 00:34:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as
 dma-coherent
Message-ID: <tqddtxx25bi6xb5jilpbgfccn7qz4qkonmstfbpz36rl3pnrwt@u4lv2tn46e5z>
References: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
X-Proofpoint-GUID: Z7sNSePfjEXRy2lR3ZNpJIZ41igl0-Zu
X-Proofpoint-ORIG-GUID: Z7sNSePfjEXRy2lR3ZNpJIZ41igl0-Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3NCBTYWx0ZWRfX7VTCI96kvbeM
 EvNjEYPyGYeISW8ZWAaRtDt5CCF8IRmBFKWaCOowfDujtrsFbl5okenZlc4MG/sn2xAPf8xx9dz
 jS2JvAvgcTTfni3goIfdDcp4p4PbGNE+anXd5tkm8DE26OWXmH16g2mfsb6fkMEuAU/x4rv9DTL
 sfYJcRnOF0hbak4s6fXT71C2vKUuiq+kJWxQCbiB+FjncJXCkzXpIF8Rk0m6R3Vt3o1OHZPF7SD
 pxLvP8TUey/kuE5zblQupvhcE03Yp47zQ2c1ECVefGZbQABiFk8icxockhSBX4Lajk1/G0nfIt3
 yE+GQaaVUihINxDgYcwbvyto2hZOdhXVxc7/b5vCytI5uN0tK19Q22xv6G2EpVu81jBvOA76plE
 h76is+GtuQLF35Dvy5xRUPqFrqnDCFk2mSoAcGa9suAAGPGonDlGmt8hUNY//gqzUYCNaUU/
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682cf554 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=ksxQWNrZAAAA:8 a=DQSoJIzS0BvOvZvfB4MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=519 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200174

On Wed, Apr 16, 2025 at 06:54:18PM +0800, Xilin Wu wrote:
> The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
> as such.
> 
> This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
> SDK on the qcs6490 platform.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Are context banks coherent on FP5? On Herobrine? Or Nothing Phone?

-- 
With best wishes
Dmitry

