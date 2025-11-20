Return-Path: <linux-arm-msm+bounces-82698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 088F7C75168
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2958C4EE72E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989DE3A8D55;
	Thu, 20 Nov 2025 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSA2LaSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrJj/QFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD203A8D50
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652398; cv=none; b=Xp4RriHftapxLnH+0G0b6x764xAs4PlaQFwvuyWy1PyA8YtV+TgaxYEFWEwrzerTurhub5MT6r/OwyyqmSa+6Wlhvid5AfjJX20Ds6C5ZGCmij2QBGcgrGkTdWi1a5z/b6Zc79L/krlCVfE/Rkmo2FN1iGOuKq/xk8Br/DN/Ba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652398; c=relaxed/simple;
	bh=5Wc3ejRtiURe7JaqiY6q8o4kW5h4CFOYD7HE7vSDPDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSyECQzdAtt7gkWmPuH4DsR7epBlzkNvjZQgcPOshv49Idz07fYdti4Lq41OkltgBj2FyAf2wFfVzj/Q6LEREf/iU+Q8538W4fFk7JsNRYdi3rie++kmJhrwxfUGUBhxW8FBkYbnVddm7eLQzaN5dcZC0KrWzNZx2E5cTmSQxgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSA2LaSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrJj/QFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBroQ93543892
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AQUnt8R1hfssXWrwBDO1uELZUUUAnwmeA8fWT6ADe8=; b=MSA2LaSjoyyaXnfm
	s+tTLRqyqKubFDC2hh2mdjtgq2cqoQRYpxTxu38fWXA2xpUGFK/DxyfJcXVbAE4d
	lKfwN9QnvelCBH+rKWJpDYQ1M6+vnxkn7MvjTDP+PdDHecW96Lw63vQfZ7ILqsul
	nZXyLZAB/x7JBc4X/KIKzZ1XD79XHrJIChd0/A3Flh6jsnBERr5dJa6twEwhTMy2
	wq+2MCdnkqPW7GUgf7QKhcaSFx5XFOv7adjGPjAWd8wQZhPmVnb/vyODQpN9oykF
	G2J6qSRNnsP2WnNDHFA6Z4H14XPK/FcCh2z2rtUjDNqaFvhe/NFn6kfXwtj7KoON
	PfnacA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t3wa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed767bf637so1461941cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763652394; x=1764257194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AQUnt8R1hfssXWrwBDO1uELZUUUAnwmeA8fWT6ADe8=;
        b=DrJj/QFnyBw/1c71C1unPcUEMRiWThMZNf4SM4CEsOtySoDiiaeexBREpWf0VtDk3u
         gpDVuabt0jT++olBVCDc/Gppvp2r+g7/PIDxi2+UtRZLE4QXQ4898T0JeiHl/k4JJyvq
         unwl4UVsb5ERTscmGfct+y2LNANIyB+xsnw0+vzQtWKd3vWXJE+XTHlEyRBN+wRB7Cir
         4tXbrknxC0dsv3+N71kODP3WZxG1molwfV/CT2mrwEc9t5o3acFxUlom0zpuEkO5pSqq
         k6gIXnQRy7Z6+9sqN7OL2WgfdT5aH5Xd8k2L1T7ouMm10HEFi6SSZTYqY6VAdA3TRkBQ
         KYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763652394; x=1764257194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AQUnt8R1hfssXWrwBDO1uELZUUUAnwmeA8fWT6ADe8=;
        b=qPP191lpKMzO0PZJnBWbdZg2Nof90m4MI3zlsZFXR8kQ+iMsTIC5asgdsRuxe1dJBK
         nrTCp1+LeYWMVBqoPL6eIm65FhEZsEddWNDrKRyoQ2hMvpXnlY1sHkoaQliDpKGUd+lq
         xnO4o2Ub/GK4UXgo4WQe2ttjWvf/Uifiv5nCNtcSo/B/pQbPQF+2SF1JUd+8tjoj6SW1
         DxKJqCq1p3+MXGY0qQ2SGOyHNAuLR8PUcdIrAS0nM8gj3m1h5Np8rDAf+txuFdvVfd8H
         lAFgobjTJGHkDATL0ndLmcWs9NEv/u2bzkLkS2Hrp9vKBqWSUs59G6wZDOTj0OR4XtnP
         OnLw==
X-Gm-Message-State: AOJu0YwMDBSsdtTEz/tW4G7gbWT+DBgAcqrtqx5VLh0CVpr1BboC6qHf
	cQuK+SmMHl2I4h/2uJO97wXXgWESwlSqdfypPAxjfbMN0nvIYQs+CyFfphwFrGYgV/Jaryz0XZr
	/ZATuNT0sb3MXKm95fC6ddMKt07a+U0ANWEmV1t0xySM22znKrzVs/zEcC1CzyDsadn25
X-Gm-Gg: ASbGnctjlG9eULPhi82RwSnJPHNcQV1/SIlMSZDSmGjwUZLjZwdHe0Ntx+o9aaU3TQG
	RHDsa/D6Tw9frr+7tg/sQnGJSgye8NTZ4YDCe60nUcwNNtKqZm8zTDfWgyWOOBzkFcZYDOz/xrq
	8S3V5naW8ZcIfM5YNN+aQALMPxLIc70CJsa02YqpscdooHazbZ0dGsaZW2ZOiiH5acAMhy87Xck
	CexewiI2jT8sE3svqBAbwlVKgr0wR++V4MRahywV1xjG3CykZMatS69s9Aa7MM14J+OMVzVxvaF
	Ik0Idhjza4snwDVUZUYHuPeSrTAR6QBjBBwWcR6nN6rz0dM1lZDSUN5GDn8YqYiAz4BQlPrb1EU
	QHtVxe+i3a9WYyQ4oqKILrvMRSsyxn5hElhh7/+3kb4LBWUWqCSu+PA4EZ/h7P0jQMPQ=
X-Received: by 2002:a05:622a:292:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ee49723b53mr32074201cf.8.1763652394592;
        Thu, 20 Nov 2025 07:26:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESJssF3y4tl3k/csmeu4ARV8XTqkRyd2Cor12nhp7kf9kzuwf1VHyPMpf2S9kODR1TiQL8IA==
X-Received: by 2002:a05:622a:292:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4ee49723b53mr32073581cf.8.1763652393948;
        Thu, 20 Nov 2025 07:26:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5ebsm232729366b.14.2025.11.20.07.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:26:32 -0800 (PST)
Message-ID: <cfdd0865-9f5d-4c53-928a-9c7bafb55375@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:26:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: qcom: dts: sm8750: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
References: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251120-add-coresight-nodes-for-pakala-v3-1-03bb7651bc90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691f332b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=2HuvaDRDMhcgrcBVsOwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xF45C4p-asCPWcCI_0Pfz2uyAxbcDL9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfXxGZpzbFgRN9c
 tt5jWCf0Ql31+K9WQDpgjNaXeFlC/7N+f3UweFR+QD1OYUY1pV5ekbdgiHt19R3pHQvOBRiuYS7
 CkxB1VH2kJUHQdKxsTH/Ljoyb1j/bmA26mwyBRL4ady8lhhkju60w1Q6hidK7CDyrOEbvT0RczJ
 RYVufEVZTWm7ySdiJEtm8mxGEz2vWDMB5b3y+ilRKySvpRr2+dfthN4E0R0plYiwLuG5xjKOND9
 pcg2R5AA4galgqAQ5B9WN/eiQB7Xc6/DUZS0vBPwZQTqqhPQC+Ho4WFr3pMIllUvFiSF1/rJM1X
 YOk7Wp3wHLtX66j6g3Qfu0Oa71E1ZTQu+51UwUcOD+jCepW7MWN30u/G6KTBpaIQ4dKZAykmdIC
 FOzjnWsiyOrEopfdG7SKtPmbixVAiA==
X-Proofpoint-ORIG-GUID: xF45C4p-asCPWcCI_0Pfz2uyAxbcDL9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101

On 11/20/25 2:48 PM, Jie Gan wrote:
> Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
> the STM and TPDM sources to route trace data to the ETF for debugging.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v3:
> - replace the turing string with cdsp.

thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


