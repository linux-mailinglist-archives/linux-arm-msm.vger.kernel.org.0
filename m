Return-Path: <linux-arm-msm+bounces-82977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E8C7D224
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 15:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FF903AA2A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 14:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153D920DD51;
	Sat, 22 Nov 2025 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSGZukAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpXU8vly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B1182D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820198; cv=none; b=Di/3S3UAXK7GT3sYgfibeloCiZW0JXEZKixlwZpyygKL0o42vbGnCoSw0UGpf+3BRXVIdSuRXm7ndG24WnZJzbDH/Zaibxuor+GSjpQ6cvNCejcaQAstxtuaW/PJsC6eDzldnsV46oybcHud22xjzXj2AWHuMT94xE4CU0yyadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820198; c=relaxed/simple;
	bh=w6/8Mp4sc3KVSVekWse1UcfNbl49wyZrQvK46SLADXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7BywrFUD2whD/A2uH+aIB9t+P8iUZwmqsk1KU+b0tOg+8gXSQwQS5cjRQnU3r6dFNptoZNLa51ySzf4PcCy4gqcTWmqJVLpF2XF4imqjxUsN247AIs32Zt5t5othAbF9wCtoKvxqYVuxA/2Cq3L4aqiIm6PvKL7NOfftl7WtWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSGZukAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpXU8vly; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMD69eJ2105254
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 14:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=; b=jSGZukAHy463Vhtz
	N2Cg7cwvUe1eOdUYmEy3Bv89afj0kk6Gn7C5p7Ws9udeVH7iaqY9DdFL9UFfIpYK
	xhZWRBV2WqifTX3URkRXdQnw/4rz3ItJV/XEtrN4s/eGEguSOsToVNTXGSXtxH0r
	56UAT1J3EatoYkky2qLmaHFe7wtsJYPX7a/q9jfc1YHX0F1VhlegMEbNmefRzMc1
	cJGtxrg51Zn4dn5hKvU00E3aZURXcPriLPAy294tU6EpBqY0i063HWpFA5tU+bWF
	X5qasBMoXVpYVawZZhZhJcftEa4l/DGVMSpS3z1eQFmfSWL1oDN+wzGdcHGyD8fr
	qhU/7w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6bgrrce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 14:03:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfd5a5052eso63602137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 06:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763820195; x=1764424995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
        b=DpXU8vlysdl7gD/p0WLkyvY9+VLCJnxtSVaoGRnJjNaEsqofuCOvI3Xpjkkl6rDbZn
         d8uIUnnTBYBf08IrRtkyKfbU3rXMlvf26WCoOmA7VlBzQJj+uTYiB92Z5EnqCnuX1bFm
         IfPf+LwqkmLGaV2JmmD1nvMVhIRh2E3qIYW1z1blFFNcDH7hgMVX04au0iwXU/8i6zqW
         zvT6BwszsXW0Q07ywTkhUHwJqkNne0lRNWtGHcTC1iEQXwRzIC53lpF6tsHNfcWeDtJC
         PRhHbJG8y/5YhtBsBFLkKWAxD9mZQ2qbsuXCfNNaOf+qY/EXPKXBzG4FFwHUy+HD+Sdt
         JaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763820195; x=1764424995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFv6aFk1IpQWO3F93NnlDY2gTDZSprI4dUGFyCQW5uQ=;
        b=UA9xMdJZTzjGuba43uYz3q0pNbSjBo+1DnvERkms0lIQVnlLOcVVY1+q2A8wy8LLtE
         0rfeyAZLl9PE6SiMMjFMlEHOFB4Uoc9FXPe8XLPpEkDxs8+AAIZEOVx8jUBnQpAYhGBP
         snYaPmTOfMPLj/aMUbtk4cRREoCVvA3OfnThuM6ad53ZzSB9m/ZDt6nvtSE/4RstFrcz
         X/0ruf01cTtrTtyXZpFo7oOPG/FEpDAwvb8JU+m4Ng5exq7rOXK7tdOrZQyc+2f9FVFL
         faREwdOkkp+KCAhbEPnGwhNIxgQDTHn/mRDvNiEjKQ39JT3bteAKLGfURNJO1mv8FR3M
         BoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRuKgt7SCM6HReDFWaiJLqigtDR26ENdPs9fYgFUVyeRVfNudoXQ/9Km7gRcY+5OLnozB36Ya3NOpe3Wt@vger.kernel.org
X-Gm-Message-State: AOJu0YyHra4qgzmvov5zoGAZPxjBQMCfg/cje9q1kIY2EHMm7y2zUeqx
	m4tCuRDtJB/vkSuEhyqLoxWzNIT1KjCu1z4Qy5pikZDIHcf22FpqBIVS3g36dn3XRf/yOvCyfIg
	Fdppaob5+VdhOwpN4M3D8/ugwYlW1dX4QOQdTBfYOzwgvlraFIdcFl5y6j0y7ScLeJV44
X-Gm-Gg: ASbGncvENYYHFmrsZY0mup/Uix2onNYCuQZj9j0jRzlzXqrib0P0wAeA7cceu4csN9m
	ERLk41tEIKIj1pjhCI//gnyLQJFItFEi6w1P6dBWKBDvVRrawSOtOXjapOq9SGueDvpSYnYdv7l
	0XNu7OiQFqADH2hSyCeLsJE0t0/sLeu0uBRGwb7KjRnmE0IKjOHOrF4ei3oDtSvw+aa3G4gu4Xb
	PeMqKNY/ZhrABWdMt5YnBF5JQb9RCkV4lKVhWcvBDqXMbangtDHuAF41EmMY8qg4rSm+UepCQyP
	MVi0TRiAvbhdajuhM0xhrHK3IvrMplJJUpNJHEuhB+WneTVyyFIhDruxozmK3ltsiSKwTSrS3zI
	eI1zWnpFAz9lxvHA6YMDca07NPKSpWLKTkwwSlzcWCI6obbDyrQkOX7IfNZiKr3RUk50=
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e1e6ab5701mr905537137.7.1763820194466;
        Sat, 22 Nov 2025 06:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOa5oUdJ8Eo4PVOAHiaccaEv2w3avq9wi2Hvan5TZ2E3W36cwP0a8YCtGpXcrKuWHN8TVK2w==
X-Received: by 2002:a05:6102:f07:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e1e6ab5701mr905500137.7.1763820193999;
        Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d502fasm726258966b.17.2025.11.22.06.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 06:03:13 -0800 (PST)
Message-ID: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 15:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
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
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uRGVrmHkYexLBKHD6b0e3l9TkSSmsv_T
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=6921c2a3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=K5gqOp28Iz7Nk40COgAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uRGVrmHkYexLBKHD6b0e3l9TkSSmsv_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNSBTYWx0ZWRfX9Gzx8AItIQ9h
 uFyDjWa/6al5GAfWyLS+lH+FJ+Vrtfp6dcqNe8/3DV7EtX866ctO5sOMwWdwnDZ0Qnsh5tDfs3W
 f+RJZiNSG/MhHP9/SSjTKEO85l7zrNTQXZSXSa2FSm0X5Wu2cFGvLl/q8QvtoCBlZdHZTIjcMVR
 WueK5WlUxHcW7jLLFPDYCjKiichcVtY4MobjloCU2abO/5Sv7/H67p/GJzI6PLXVxe6ZPWQlVgz
 Q5OmCxIDLRh7gDmT5n6uCWCU65Y2Tfra50gr1vgF0LMjlVR6a3s/I0PLKUGo5DsOC8EUHXA8u/y
 cG/jm0d6gTJ4nyNFlyKR4lBo8oKYcXci5VmBWTJ5ZSJUQyAL8+Eglb0VejxLhgi8NKvftMITXxP
 FbIfKOSWITek6nUmBtyNMAreWvOilQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220115

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-845000000 {
> +					opp-hz = /bits/ 64 <845000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +					opp-peak-kBps = <7050000>;
> +				};

I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
or mobile parts specifically?

[...]

> +
> +				opp-745000000 {
> +					opp-hz = /bits/ 64 <745000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>;
> +					opp-peak-kBps = <6075000>;
> +				};
> +
> +				opp-650000000 {
> +					opp-hz = /bits/ 64 <650000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <5287500>;
> +				};

Here the freq map says 700 MHz

> +				opp-500000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <3975000>;
> +				};

550

Konrad

