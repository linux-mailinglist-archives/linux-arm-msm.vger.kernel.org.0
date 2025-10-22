Return-Path: <linux-arm-msm+bounces-78347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA7BFCB5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B868F4FE10A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B98434C155;
	Wed, 22 Oct 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7m6lo4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8937347BD1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144843; cv=none; b=Hk5QWz7nz6+jhTFXp7+rsUKSFRVyAzvCULiKFkOqKV3c5j6psa6lDcNEcGJwy8p8F3uc5YO1uqaVBRxPbE3RLxp80W9cyvaNE/lUMDGd/lI54GNfoQ+ZUFs46hvXrjQ7qPESlDAsB8ImsXeHf8DNYyH2M80eAs5Xde6cPi0eDA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144843; c=relaxed/simple;
	bh=aSEOuyGeDRREyMKLRrB1/egW0lrvI6dtGdeS4KFmgiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7apyuEe9WgetO4WvV98i9luirKWcUx2986qoVd7fDT4w/O8YYvnVCqJ4p+cSJaY5hJfP0UTS/PyHlLuMEEx1XNMyEvTL28+cQoV2U6Ovpyz7ygotwpDoXSjBDSNR+eBv8F4V/P1XLAJTiqPZcG5ACv8dF4HDYeonFXoNbh3t+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7m6lo4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7EOBw012340
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=; b=H7m6lo4bJ9+Nvn6z
	ct5jbWjwmzbAOzaCstoLQBztO6WF6xC5WIt6ihDUfRccP6V/DKONApuU/GEsLr+I
	L77XyOkHno3F5887p+xcGVd5uBBjjW8CPCpQajeMbNlH7WhiG+KVPrMOQC6JJpaG
	0eUEl4QQ7rJKK1esggRU99FZHlXSqjl9Imok3MxVzqle3HdMF6LNaflLPAl9kwdU
	98n0CIA/4TvadIKNkA8uq7obz/SCmk1iZmLfcBhoEXIgNbtFnkg5sJ4CNepyfK+P
	ei05QVnTU6Ko8YsXUU/+NFE+5o6NIre4GfZ6y4q1ftPp+RMF8OaePEWaj+ogxRhK
	yOmeIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jvey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:54:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dd3c89ad67so511661cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144840; x=1761749640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1D55EkVM9ROmsSy8YnVa/jnMbgKIG284477dKPaODQ=;
        b=QMFAeotIPUheqP61us8t+UKJy9hUuCz0OmksRmfYcTIF4EBH7Y+qPKHzokYdXuwKAD
         H4ykaT84adoOTL1Adv9pQM5v7wtebC5S6laZnCCPN4qH5VCz09OeOz9bIhmV0OAxRtVq
         cTvniwZ3P6aB1iuAo3ubv56CkPZxmjMLpkD+plZOubJxmx4gr/MHg06GTAUHH08j3HYb
         4CK0KqjxU+cYmgOU+CEP+ldh9xzItwPFjV46sacVT03daiPZRBBtU0zo6RsoZQEnFkjJ
         mGmSIYXN4RNCFrbpBSpZIHayzWWRUTBuwZLVTINDtI0a0dsi7ToM29tVSoC0W7OYNVt7
         GLpw==
X-Gm-Message-State: AOJu0YzAABG4cY1SlkMWnwXqBV9Ocia7wRQlkBSBvfGvuUmx65dxmtQe
	19Oy3YF+0S5i8W0uJFhoHYiT37yq5e+h8ElSvnrg9iunJjeSvKV4qS4cnWUakqyrIncrB8Qz74z
	cdGJ25A3mJBocanygj2ugHxWCEqsRkuD5fCoOAUjOHvH6xeMPKBI3EMKRDc6Pa55ct4E6
X-Gm-Gg: ASbGnctUWOJRXJ6xTbX/iSm2H9eLEQrsfSOCEY7Ur5y6HwiTJTbqdEVy41f0F/LcA7A
	G/F7dlfXfOerC72doQ56lNgTvexA7rtmZ367IKrO15Skl56wcwUMgNkKQmYgDn2pOPDGgB5k8m+
	Y/cvieohffmHIMOzk64SxfkXDcKMpaIfUNlxteJwIPCvNhSCRmnwuHfxDO1zvzDR+qrJ4Vopoxv
	EB8h40oRcbAwcc4ti/HqA726j+NY0p452jizB4aSbARFp1wDOD2cW03VO+oy90r2+/iRtufSML6
	fKtpnpTO/aFcGWrG8RG0YljYqYpgQKCRfKrBVt1qdPG2iNIiGnyiE/28wgTufQOKqKzlIIhw611
	T67EX5m5ZHY6IkmDtagQuG+d3nCa9aLgG6bdawWBPwAyvlQ1iKBU+sRe2
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ea116a2337mr58384741cf.1.1761144839859;
        Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYvZrPUqnLoE15E4DKPCHcqL6kLKjuVsKLcLPIxjePxERoJWVvHeMNwix7xgXgKYhV7otIeg==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4ea116a2337mr58384401cf.1.1761144839366;
        Wed, 22 Oct 2025 07:53:59 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d3fb6a63csm25808766b.29.2025.10.22.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:53:57 -0700 (PDT)
Message-ID: <59592a3d-447a-4c99-8654-d3cb9b9f9a58@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-add-displayport-support-to-qcs615-devicetree-v5-2-92f0f3bf469f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXzduGlH0oV4d8
 y4XWFX9cFDskOOeBYixxtNelgGJnKAkGTbC4hvk+1WWLXe2ly26YF6Vvh/BnznIzvSDXmj/RMxl
 ra2Gs5Ow6gkxyWrEFpF7WXzJF4Wf8Tyik65Rs/leVrEfrS+Zqy08oZnIyrlQiRi8Q99pPR54Ffp
 Sk0eWidECV26gCJFK1ldk+aqmlQU2GP3PSk8XAvj+W/tkWJofFXI6rya3nmYYpJywnjj+vx34/o
 WgdBfdH9mU2JyXqZiCDvSP+GubxkjHO9i1FJxT6gvtIrmYH+id66Ny6rbkTcPizoP46NxGymRn3
 QOfhMWqLIRZliW+q0NuI/ubW9Za1m86IDPvrbNiCtSjHuKNkbfT3x1EG6+o3xaCCkw24ci6K+o+
 ZYVwMiACP+GeCGH/3f6IT2/Fi82PIw==
X-Proofpoint-ORIG-GUID: LJGzoMJiT6IKN1ZvCd4lRUgOS6qbINOA
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f008 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qc9Wp3Nav7UuNmgFpJYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LJGzoMJiT6IKN1ZvCd4lRUgOS6qbINOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/21/25 5:18 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
> clock assignments for proper DP integration.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dp0_out: endpoint {

Ideally there should be a \n between the last property and
the following subnode

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

