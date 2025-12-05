Return-Path: <linux-arm-msm+bounces-84436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 01983CA718B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AC313011302
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BF531196C;
	Fri,  5 Dec 2025 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnFt2avy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTmplznz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271830E857
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929442; cv=none; b=qd7c5rmVVX3BKo/pvn0CznmvoNkbUeKiQFKQmBkp3SVHNcYKobJ6SwfkfujuEKKEJC5+gxJWwk16txiOmk5AqI3pUvlOng0/gayWNTBIbGQ2UdMMhWJdEdVC+N+kZ4hbgCp/hBVv6wAc2JWEH0hlgu4f3Rf9nwhPQaGyrYghbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929442; c=relaxed/simple;
	bh=7QNr+/WNso9juVs3d73JtADhdzg9nNZmzQC8Q2c4FDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3D7o/ogfawg5cXXdGQFMeGXhlOACkfvmEk7cjj7qSSuxU9/KTzoATbnHODDIFYLNZd2mFf64Svv/neQlUFO4DGlvresOHgP1ILOH8tYoBkm/2IWxNNulVbQvtUOQNtKXCZdyrzGx4n7ek8Wa+jxPBCdzlyo+PVgbNPYVIGoyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnFt2avy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTmplznz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55chb72957222
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=; b=EnFt2avysqlqU3Pr
	R1TTsAjPul9RIqEAR3ZM4ejGNfXSxuJnh60LAdf5ma8OPXmnBjswrM0Vo+uZyzwh
	SO3fhr26TY51CgYQ5FTqLdKuxLwiWHKUEJqakaZIjfWUeoeIbpYTGKv6rTrcR5+X
	w13wk14K/zUiChaHyt9Onw3qxCI3xIcae/QxU6li4UWBQUvC51quO3K6l/crHtUt
	JyhdXRrJrL9LhByjOJZlr9ZIq21Yl5DN5F+i26IW97XUk71/kIXR3dUEt0NOcaWB
	TuqG+cg+ve3k6n057nm3vA/YJ+seRs4JWALUE6OmX45hn8fdgSX2PJUFSGlXLzZj
	BPAntw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ause78r9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:10:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so5396681cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764929433; x=1765534233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
        b=GTmplznzzrlmBHWAU1kMJx64WUOq3rif/6KaPP1chUBy4tNqvMLNrIUB/SSsCKsrME
         Ks/TLMls9UcJ9rremx3Skke35BLHILofzuJpMEaNkXrZG+6Jn21Y7vPny9qNd315Y/OI
         J0YHOqhBcJyL6dimD6wDAw7ayYHdAwa69WfwZmshpN+B7o5qJ4hTjqsg98/QTd9copCa
         8zZBrMa/J4CAhKNJo2E8wz3TRwUs0BtRyff5Tt0Ny0bcEGPJSk+W2kUQz7flpJM7/zjS
         ug4pyRc9KsA6a3aa0V1QG09xFuWxwYgtQ1w99DZPjqx62LM4wxGapSiETSpXEehPCVY5
         VSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764929433; x=1765534233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
        b=Bzqla05px6jZMBk5qpEdtNvMUUsMXevpIT1814oMuoJQuYNz+DESunD3reAc54str3
         AyRHF+300WFO8jCr/U1Wiy1J6/gWM9nkkMGCLNhH7BbxIwwkube0les/42ool41NKuE8
         KUCVM0U1f3I18WyUyMiNEXVP077xLAv2RNtI2nPOAuUxEU80355AnzZ4U/gksW4p4Oli
         aRiAI7dHFiL+0xcEzFrUqyboCXbk4nAr7g2QxmaI95/LkINFaLFMfgB4W9qwDHzXIJYv
         E9QVLW9rSS1NpFpiLwqQqSSxcpikPpTCzfQiN3yl7afA1r9Ro7Ry4hNh7iy2G6PP7P35
         Yj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTJ42QAD+6+oynQhfyDcu9NoXxO4338YY2NwDgHSN+GnVPUwawAyjuxtJAv/VUN1YW+80Hlmu+gYgued0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi6g8jhzQBKDg6hM6acZli/1chwA8Gx05D3UbFW2ZwKRE7fyYV
	iy3Z4aNC+jZ/2XfKS/ldIncGTmw/3T/ctUNmmmKWttaCnckBkuE1LMz64wSzCZ4iHGqGEdQRwRr
	Yz8Cpk4GHdf4BVG2GPSWAGNRLktBjjRGnAV8PH88s731TZL0a2zrjet+1mDE18uBG6V0C
X-Gm-Gg: ASbGncv2DVynR/AkibIHQ9J9wIOmpDV6jFyrLbM25Cb3KKQfYngQ0OLmh1Tw9+ObV+n
	NjruSEFpmfXpGcal1dTGF0S3gPuwj70WbSjx6nVqDkK+3nKi3d/WbizQ3O/+tc245WFGHv22eJK
	aNp8PnKdoMHGkDQm/OHiRa+o5aGNhyUSmDkITlGENVfeYAhQSl/jwsl7c7ppXBXTVNQeMEyfc7N
	i94Rc95hDvXVhIGBXVkSZ3TnbpliydMcWIFnhSY1+fwzdRgtUm354gous8VPOuT34ybxPZP9rIu
	+BfGaMXXuL2F2cowhVrJfzX+/JgF8Ot+VtEBVGPjMDCn654m3V3zGkhDkvXFzeohFlt8SaPkVtZ
	q+d05EUjzKrnZEYciUIA7VYAFnMP1rGT+Px2USlUL73D2FQifWH3ldtthWKoB+nkarA==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f01b4ec03cmr86964281cf.11.1764929432716;
        Fri, 05 Dec 2025 02:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyRAhn0k1YE9PnYXg3wa/SAZLktCWYdIO5bMKO203xivv/wR+f0izBEVjDCYKjQN90jdqwmw==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f01b4ec03cmr86963831cf.11.1764929432114;
        Fri, 05 Dec 2025 02:10:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49d24a6sm323585366b.54.2025.12.05.02.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:10:31 -0800 (PST)
Message-ID: <7d71f882-1d52-43d7-9f0f-e7f7b53c853f@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:10:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mMO2AmU0EBwLmQdbtghTNytfx6bnCtsu
X-Authority-Analysis: v=2.4 cv=YssChoYX c=1 sm=1 tr=0 ts=6932af99 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NCBTYWx0ZWRfX5ZNCrwhrO6+u
 88A+UDP87YAOem9r+rFrLkFNBwSZn7xDR+lAi7StLucRnL0y9gKs0grzmzAIfB94D0dRr+31gIt
 +e9KYxbVzUEr2tA8NuuLmvKcckixQkOn3hd/H8iUeiFBPGEgD6xTF9v6mj/yZ2MRdMgMXU5Du1C
 in2JgA1USw07bmHfp4T2INb2OcuOTsfE3DWLzlwYDCfahZF1TK56IUh5u0ajCwtBvApqrf2hRj1
 qI3tGozccPcyYH55O1srGLoY2ZWRTDA/j0nsUNwhzUpfJZbR73okzYjNXAldenTgR4Ex5HGSvwo
 BiSJI+hl6/cYjA0fJYuQqIJOmYpa5Ec46FSz4fh2CHKYzg/vBWW9aoEJVgTDttR/ejchHk69jOr
 tKkPJAgAG+4UAYC2GChnRtQodpcFEw==
X-Proofpoint-GUID: mMO2AmU0EBwLmQdbtghTNytfx6bnCtsu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050074

On 12/4/25 2:21 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

