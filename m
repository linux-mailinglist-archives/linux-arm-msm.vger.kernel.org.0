Return-Path: <linux-arm-msm+bounces-51926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CFA68931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58E7E173F62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069071F4CBE;
	Wed, 19 Mar 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TC05RK93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE95253356
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379198; cv=none; b=rxqaf1Nqi8jPyYN6Ezk16gsHMEWvIi0kixpsIMpXgP7ZRNDy+RLB3kPg7ODZ4Hd8KCyWCmsXV2519oWsU8uKcTYLMHVyQeJmJNDNV70HP3V7rKrNCSWGXH+CQSfMlT7h+tZOiKekwgoFuTiHeu54BquumjKMFKjG0MVXjLrkTqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379198; c=relaxed/simple;
	bh=FQqkd3UD5cFKUZMWDXjjIYnJpbI4T4OLsCT8E5377IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkZSBJhMjNKE2OoGq2Ln+8lvTnw8Dn/pDirifxjbAGMPYOOXc+GAvIPO3EbtN08aTy+BOQWdbNDp/NYqFggQnTe3pGeBCW+Gw/nuUlrvthq85qK+pEV4sqkXtqCyL3jLho1Iq+mRkJ6SwvwzMcCs2/7UgFzx8k2MGtAYFcj/kv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TC05RK93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4loe6020889
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BzOgaUP4YY0eDws0aWKAsEU7
	oVttDPeZjX9XK/23ugQ=; b=TC05RK93YiF1GqByldB/gf6L7axjIPdv7ShEZmly
	j8CrpntMRdDRMXze0IYnFLcMyQvieB4ui/ZgP1Xx9rN5eSGWaGwPF+N7Cte9anQL
	2b5j6MChhm4KDi68S9L2rPgafRwo+zWSYUCOonpyOSM9Co0p6EedXSA3VNREJvs+
	NESxMXXvbspJZ83jKdTkRAvPe3hbI3invE+TI9HOgmW0X1g2+7oLletGcQoQgJEW
	AiwtUWRMDN35aLS/pAYkcKnG1mGIEQtosHgGJdwZFL6w7cOFvlW6ZI9Eccg0VBaB
	30ivw/7XvzVLdQZ9WAWGWk3u/ACOXVp3qF9bb9F/EiH2OQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbmusb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:13:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767bab171dso65180301cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379191; x=1742983991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzOgaUP4YY0eDws0aWKAsEU7oVttDPeZjX9XK/23ugQ=;
        b=HvBiZbWaEM4M7NVYx7VLU5EfMXi1loQkvA17GcBv7k9GK0FbGMfSmi7lBiZFNdtisW
         ptho4/7A7e8yOH+vlZpYQoMbYzHqou0h7TtcV+0xgpMCrPqEWiH6ako0qt4LNOp+/Kv0
         ZMJLi+NuZOfPZ1OYjkEhDR5AA1V6ujzW8CEUZkD7aqGhNSc/G/gWZV+A3v8xgU9QDQcc
         G7p3Ex5X4SkHu/NilYiJfniv4a3lHnXJb+BsBF1did4/PSjfECZ+rMjv+c+k7Bgvh0kd
         pYlBCoFAznFLCRXUpN4Av67htZqYM7RuegCsMxbAHxRuPHZriPiMO/RnuCbvVKAegb7M
         qfHg==
X-Forwarded-Encrypted: i=1; AJvYcCVk44UEG1jeGYskyuTwEWT0C/1xZXcmhu2p/+wZFGUHTGeF+dYFL7r1uw2lBGrctXGdGPdAcjWMiwp/V3yt@vger.kernel.org
X-Gm-Message-State: AOJu0YyLU6/tybTbrr+nyRYrQ/2VxgGLjpSjaC4a3x+t2MCUcYV82O8K
	XToh+qPP0wiOMtsL0RXxLIvs0tE8J9AoUmyKK6QenuZ7oT8St2cjNkMHfbsjbIStV21T5gMk5ES
	+MccnUhlcV73Nf2/2ezpRRzhd6kKJ+rgqp9N4rOJ/Ymy3KQ12Nc3VgwA6LRyJ5Shi
X-Gm-Gg: ASbGncs+zlLnlejFu9GyNdPT1IttgV2o4OYgwfp/qfC1dqfb6J4YnbcM7YlnfYH+M66
	e3ahe0MJR8t7Jw3t3T/dbDkYJggcf/7M05QcNEQhZibKw02gXDZnBgCpAubZi7rOO+5Ya/RlI37
	Pzru2oNMg+z3g9GFDDgVf0a8TAc+C+HA9OcWCfPf3OosjM2nViIYRKJ7ROn9SonDFuA6vIGDZOb
	zIgcQ2NdtwOkZT5zEyp3KeRGJvPYnyD13vjm6du4QUCIviI5keoFWn6YqHLaUw0WfoMY9XqVWZw
	ZeYHm03O9Jq3xRWf7JCnTTrNHNwA+1brkps/QmnXGTmNBHgQv6eDxp8w7o+wJmf2p31mtl3l/x2
	trE4=
X-Received: by 2002:a05:6214:5007:b0:6e8:fcc6:35b6 with SMTP id 6a1803df08f44-6eb292722bbmr30110596d6.2.1742379191497;
        Wed, 19 Mar 2025 03:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFomP09Kr2DMPM29iyMwok3J9WTa1tGY/JQNAW2xLViUvtmFK3w/vJU3gEEPzA2eYZ77jwNBw==
X-Received: by 2002:a05:6214:5007:b0:6e8:fcc6:35b6 with SMTP id 6a1803df08f44-6eb292722bbmr30110206d6.2.1742379191179;
        Wed, 19 Mar 2025 03:13:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da3d2sm23062521fa.92.2025.03.19.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:13:10 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:13:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stone Zhang <quic_stonez@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com,
        quic_yuzha@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <fhpsphwz65dlsqhyycwabofamacynshz5e5ez4gafkmdain5dp@32dpgc5mrhdr>
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
 <20250318093350.2682132-3-quic_stonez@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318093350.2682132-3-quic_stonez@quicinc.com>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67da98bb cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=rwSZFTdBrp3Ud2uedjEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ulH7OJRx1IwZgVkuWLRQrTyfpsA2_jd6
X-Proofpoint-GUID: ulH7OJRx1IwZgVkuWLRQrTyfpsA2_jd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190071

On Tue, Mar 18, 2025 at 05:33:50PM +0800, Stone Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 108 ++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> @@ -320,6 +402,25 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "QC_QCS8300_Ride";

Almost missed it. What is your baseline? Krzysztof has sent his
qcom,calibration-variant patches [1] in February. Bjorn has picked them
up on March 4th.

This needs to be rebased on top of [1].

[1] https://lore.kernel.org/linux-arm-msm/20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org/

> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
-- 
With best wishes
Dmitry

