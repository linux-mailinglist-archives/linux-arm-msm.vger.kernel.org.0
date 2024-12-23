Return-Path: <linux-arm-msm+bounces-43153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACA9FB060
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 156227A073D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDE01AF4EA;
	Mon, 23 Dec 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF49Hchy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F013C9A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734965631; cv=none; b=Hqt6We/8N4+ju3bkAebKzfPOjRuTdzr0IfHmPRUAyrkhbGboQOham4T1t9yc6f5qL6UKk8D152ajhZPINkhlweHUJzxfNkRSskdIC7m1fd9RZ2VYGY+jVQSIJ866w5P010xgGNa91cWjd5BOPzVNcGsATBc7eOAZUoam8k+/NJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734965631; c=relaxed/simple;
	bh=CyzMCMYAz+KkX92qmYTRPtAH/01JI4J4PB4eo/xsZY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5QkoKBj37AdrIZ5l+udSu48O8ddF9hFabPdz9k2gNXsFqJFImfAXHh3srcuM1PYhSr07QXabo8cZu3G3EEBnRpt2wQk3C3WLKlXfAjEVgVulJEDlVUpPPJRcQLIrv8btE5u61hWL7FEo//hv0l55m6/xXTbHx2IzhCuBZaJJ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF49Hchy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCaoVT004205
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bwPjLaIInGXOqxf5KkGwC0tPH+0F6GxMu10ZOKyI0tk=; b=HF49HchyZ46q8Qh3
	JajbX5/gqEGbPTiv9jcQbkw5NdFzVvHRd3hsyF9Y37t28IoIoBkr/sisDR71vxm7
	7YLQkw/6Xkl2g1tdM8fXc87BXzu4Ke01+H2bI3xLLfY8PdZgAmSu5pfzdUi+OISY
	bS57tFfdyqBu2jSQPTA7VJmtPk9f110aZxDlHpDGzRtoMmdvqYiFdvMwm3MKzIGe
	2YujoKd7LfW1loWskWTeTB/30vKUoM5vVLznZuJW7CY5WooLknrRKGAkrDrr/9Qf
	XgZ7dg+mroUltMs9u8ZMbWSnziWMzWn9OfDigj34dFiIWI6EJd9GQdpyFOQyxOML
	GVjSTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8168c0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 14:53:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f8762a69so6336976d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 06:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734965628; x=1735570428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwPjLaIInGXOqxf5KkGwC0tPH+0F6GxMu10ZOKyI0tk=;
        b=QG84V5QxDElfG4NrtY5yoc+VQ+j/9ulObvGlMSWYZTkfrhOUPusfjyynapPgSsQlnp
         sMkVQS/I4HS/2Vf/wLyaYV5hOSD1xfsi3a3K9SDotjzCNh7/vBr/Eduw4gUclmzriamH
         1lH1Hp2HgIC64ofNgyk1TlTv8imn6AzpvGda0tVsSK/+uKq/edA/K77GGZwSKVLCoMi+
         cfJsS5VcAoyDQNDV/3I+yevhRFJYJgiuhKil2uYQBmQz9KEWeykaWa9f7FQd5iu/cgtt
         VsVTQXvWbI1xYVuJJIAJVLbKqVXzVkavthC6y88amsCkHaWTOy/7r3vu5CCDWIoOy6F8
         eRFQ==
X-Gm-Message-State: AOJu0YxJI3+WWgtrK0VPH1RGU54u9PCpp2ncVZ4KNFnUfV9mujLLlxAY
	ceGADRsXAihzjWRTX+eZO87lGzpchvJmbvGyBt04uIGhC3EUcvCMNzaMVIVq1KUITH0jsE79kXh
	XyVVrOX4z0K/QMVjGp+RI01JF7is8NMgkuf91j7Gy5mRNb58XPgA01PsjhyYDDoIJ
X-Gm-Gg: ASbGncvW/vNtu9C9LHTGq6Zv1aTqcRGMPhV1d7elG0pOOuyWF3Nf6leOjF0+KMFNkER
	rdEdwz8HHw47UcSZXtdtXRfjxx3r14bS0KWblfeKiYySYsHhRWubjOrWoECErUR5iKjWfaYruy8
	fHtFsV5zLuPb7ltXIeORzK5ISnIrvAfHfi5lziJO3E3oZTsEGMJaTRyCkCvfLDFq3bxIxtm46fV
	9klMY88okXx+fyQ9DXaVVUDAVo7WCLvhyacEw5Tud6apJhf0TGtd5660eEjqX4GL0e6C9qsP8ZG
	FWZr7VA6q8T5u64lXkeVcEVidH1EUPbccqU=
X-Received: by 2002:a05:620a:3913:b0:7b6:db16:bc85 with SMTP id af79cd13be357-7b9ba725035mr798629285a.4.1734965627937;
        Mon, 23 Dec 2024 06:53:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWdkN6EFmuFJ8wzSEf6GwnVczTFA/C+T9RLpWjLxftI/V+3Z5eKYQeN1WXp4BsHL2OsjPWrw==
X-Received: by 2002:a05:620a:3913:b0:7b6:db16:bc85 with SMTP id af79cd13be357-7b9ba725035mr798628085a.4.1734965627628;
        Mon, 23 Dec 2024 06:53:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8dbsm4961381a12.40.2024.12.23.06.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 06:53:47 -0800 (PST)
Message-ID: <430ebbd0-87da-4cb5-bfd3-8bf842f40ce9@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 15:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vHpXBLH5Ajie2zcsXOwoPKik0RNbo3sM
X-Proofpoint-GUID: vHpXBLH5Ajie2zcsXOwoPKik0RNbo3sM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=765
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> Each GPU OPP requires a specific peak DDR bandwidth, let's add
> those to each OPP and also the related interconnect path.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

