Return-Path: <linux-arm-msm+bounces-41974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8D9F0A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D47C16A3B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3394D1C3C01;
	Fri, 13 Dec 2024 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG9tTFfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6F1C3BF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087505; cv=none; b=Brx4hvrgojps9nMMDTZZisQeasd2S9B7gts0FMSgxElzUpu8kISncNVu/xJpQq0YMmHQX8uhGnirkylQKho6Hr6Prw1LoTb1KzybJL63myvvkIm8QvFifcI129v6iZB93SSN3z9JjFw5b/BB7B9kCrzhNVvMpo6/3q+zlYoRUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087505; c=relaxed/simple;
	bh=qPegP8LQZPlLlcXjJutGC9jbyKdfJn1J8L/k3V4SUjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFPSaPafDS61fg2Thb0HZ/au84Icmj3dGtkrDjh/D3EBrpHI4gddpzzhbW+/c4lZSGwBaBspyPAzcO8jLH2jWHdOpiQH+v0zaiipjhTxtOggTHBciUS+Ly2JrjyrAxdbjQvAEp1I3yFGM8ChGO+dsZ6YLM9JQOmaKPLWXgsf7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EG9tTFfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD3IaCM000492
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=; b=EG9tTFfm2TloFuR+
	3E01OEJ9VK1ZzJceSpF3cGNO5HdcGNeHBhrWFukSPpRM2uJfdmxyAz9oHcS3UlMB
	t45WovcXkChj2msq6YYuXdTNft7aPcHmOEqkhpjrUBLwUFzoB9AlsDAJ44jRcct2
	mdoHuRUhDLcUV2RIEn7ixNK0gKNQ5PDy+scUaVI7pxp/7S0IQem0JBLydCc4J7Yg
	DHtIRYkyAx56ZYeRkDzwLQawVflhKcHX0YoxSKTGIkHPrt4mxH597yZWOA8sa3qc
	wCyW2Rg6bsHtrdCOq5c7O9bR8A1u0TwZnwUL5AVU3kw1y3lEk+DNL+uSUENP2XXB
	8s8QBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4jmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:58:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8e8153104so3668326d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 02:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087501; x=1734692301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCJavJQ71PqZHCYPa//4JL9cKiXxNPidx5M706eMzJ4=;
        b=VfjaOw9YR41k8s4AxmRbRYbmCdRSIgX6vRV5TduEO3QHnYxJGW0+q/vWjgs9VQ2BXK
         SHFwUCqDCv8uavZp8Wp4AGOpJmXcUKht5CdS4pEXvooQu96+j/ug9RUYtzfUo8LTiqac
         jfVeBsyoGPULN2u+06FjWhJ7r34b8D6aalLTB2KLiO5clKGSbtxICdVVWd+k4bx2VcpE
         We0l4bx5RwZbaJdAL8k9Ke8P12GOs2P3VzXwL1wgwHBaRQeAmwUMFkgOLeNdlT6abxbU
         p3i6FonGbwYOLmmsvjdPseEuaA4HcZ2w1vLH7m2uWMcFCzYtKHV2ruKH2JRnbv4hTl/F
         VvmQ==
X-Gm-Message-State: AOJu0YwwVQWs0mlovb2hhjxGGDLqCgwkjig6ZnSzCdXj5i9RetGHCWin
	aTUB+O7RfG30AQlNsdrM+/XlDxClSIXoa3uZnnMlfChW3PS2iybWYbaYzdhxxUat6i++n8ZVqd6
	Fkh2ndfQxFmKz5yywZGNkKSXWXg1EG0PqdbAEcsDoperDFu/YyjbL/mVYY6HZGm4p
X-Gm-Gg: ASbGnctXReE+Z6b9Qlm2T/vPijMCUP+Gb8ZpNMzvJNq9G/f3vfxvay0fNwVO7vPI3ul
	m+EcUC0xte7F/v+hDb7IaXIeZKOSZEyYgEAc7LcgBwQYF5VFIa88y2ZLlkIJLSsbQl6xqL1LKHa
	E22M4MrX2b2oJFDeRwk7UpBDgtvsjLe2LJdfd8oDU/lIT2jNJWcVVnT4UzfZiWn8M+DiH6BEnJr
	9doeJlJ4gVXhT6Arhf4f8H43HFxLlv8YuTemok4IbJTxS4dkw7RGdYuBPk6I9MYtbhKLjjUIyzI
	ntD6EvotIcK81NKXNihAckWIu0LVJZCBxrD7
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6dc969a9b25mr11838746d6.9.1734087501507;
        Fri, 13 Dec 2024 02:58:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsGI6dtYfqNBiF9YOclKzsnUndifeUSlM+bUU1xm7lXts86DjAKnT5BGz3KaXNPyr6IOpU9g==
X-Received: by 2002:a05:6214:f0d:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6dc969a9b25mr11838586d6.9.1734087501091;
        Fri, 13 Dec 2024 02:58:21 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab897873d9sm23026666b.191.2024.12.13.02.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:58:19 -0800 (PST)
Message-ID: <0cc06b94-806d-4e63-ac57-9d9aed45a3e7@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
        20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
        20240924143958.25-2-quic_rlaggysh@quicinc.com,
        20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
        20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
        20241122074922.28153-1-quic_qqzhou@quicinc.com,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-4-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qJp4PA5ZwhIiG1A2Ftt5jdAsPNSr3Gaz
X-Proofpoint-ORIG-GUID: qJp4PA5ZwhIiG1A2Ftt5jdAsPNSr3Gaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=709 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

