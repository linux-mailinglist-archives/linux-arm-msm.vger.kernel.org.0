Return-Path: <linux-arm-msm+bounces-41853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77759EFD80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD21C188F62D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3EC1885AA;
	Thu, 12 Dec 2024 20:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtoNMoUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86267183CB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734035560; cv=none; b=ucsbJLoP0NW3XHoM8QAhyTMPNcEcWDxbVzFL/yqWtrd6EDbFKes3bkEeq9GW3c02zbb1b3iE/25zV+cq1UZsWvq75iXMz0Yd243XMIy4uxHcC2OnAt0127TFWxcuhgcmFp6VCNkuAhF4dJOgXbOlj12eZXucF4orZ0eMBWNYzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734035560; c=relaxed/simple;
	bh=zmKqzO7vG03D6QzsbdumPnCLN49gq8PRJKyrZFDsyO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLZeG7VnyeSEAMPndNhr9CHYVmgKtYq+wyHTzTds+P6FMdhcQbJwCdbmPnwLDNzKy8Mp86F2GJeGslOJ3x89HDcxXNt7PVmzipX7C94nbqiYnzzmONCAowVu7/zK84cjHSfKDSE28M3pr2y2mGMl7GwhYDCeUAgT9924Ad8Ik2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtoNMoUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHwDlS028100
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhBLGRTjN+wy+d9lgDLUbymMJJz+nFkVV7ekVI51mL4=; b=jtoNMoUaiNjMXr+8
	JAx1x8nP8xlfzgrz7BDhzouCHivEXGVA+dhjtaWRPAqVlo4qL1Gozj7JYrvtr9qM
	MkCb3X0t1gkQXIIIix64LY8mD4s5Y4hh4uzq2GeTJ3ySuaw8RWyPUUBX58rdtvCS
	z6gP6jUkeJUFMvMv3Qe+fo8HlZt3dl618ypqUucl6/epwG/MpQxzpeeYa8YFdhrM
	99mbvSvdf9bJE9V/t6IIF/R9RYZptYta5iXmbC5ZZ9xOASghHJ1h0Hb3fy0Z0pxi
	2hIMQW1h0oad+Q4y2X3ihhtj9QwF7uiIu4bn4VLYPziGLFhqWnJRlPIqH8pUK4v7
	AAouSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xv5us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 20:32:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b66edf3284so5214585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 12:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734035556; x=1734640356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhBLGRTjN+wy+d9lgDLUbymMJJz+nFkVV7ekVI51mL4=;
        b=qSc+wx1rSIx4972TTIDvaUoasKMV+AQcpjQDdb3x0xBA3PLtCMKaLoJ8YS73o0/onu
         XKzg7+iPi8vKOyAR/MlTm4qzNH70AcCNJafgpz/qSaeIPRy7LR5d8vzLR/rh3bP3EZRJ
         7bbungHLQdxSCl0cSAhaxR4uhIQZEE52WqMPuf/05lCHa9tynnefOcasxtwp7r/gXEvl
         0IGpPUyyQ8mBfIwvD5gWF9OrT+6MCYKYoFSOLfUxp4X1sw1SgJV75BrMPEwl+/+V0I4C
         NTHHX0S8MWytiGKbjTVEhqzSt18rT3baRT4Y9FFJAYBkYMDxA8B+B8qzMYLgMWfug5Zl
         KB1Q==
X-Gm-Message-State: AOJu0YxOyXTqICMKjLHT1Cm4FkbKqiqCN/N8l4dUleoabqZ6JnPYAEj+
	XRNphcvrTiWGMl9vcpiS+ta01Uri20fp7cmNKaz8kBsICo/a8Jy4ZbYFfNHv/fzJwIm0bV3QVcu
	2DE1l1ZitN4KGimU8YjZJI/svf+2/IPo4QeipjPKRPetM1CZIl/WXGMfzmDI+qMZB
X-Gm-Gg: ASbGncuol2dTXxSMwjuj+9CcUSCr1jzDQ0sWJjG5Znffu4zyTnPFRBT81HBZT/dJiVK
	Ur+uNanev+ziY6Im1XneTT7l4Zvz/s6Jx3MpVwh4LkVTwcl06Ar6qH0QAIuzPq4/vNUV9FMtKv0
	gbwVwlRmLTEU4gLuIazU+MffN6JLg2tpnYG/8GJBRKxMvHCMsjvfL+OGrG8Y/MU7x/IgcsiNE2a
	zDHilISlEJCfZ8DKJvnTT1dfmBucfHc6WsJ87R+rvrt76oLg0VUu4RGs7HEPUHunQ2I4Qze3oX8
	eFPFhYIdx1oIbn3+Hex8BCPPY7Ta7OokJPKMRA==
X-Received: by 2002:a05:620a:3905:b0:7a9:bc9b:b27 with SMTP id af79cd13be357-7b6f890562emr83306985a.6.1734035556552;
        Thu, 12 Dec 2024 12:32:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZopsOLk6/XkFBqZnV98IPFq5LepZFprenEt5dRRro0F9YUmKjZgKugYy/6AwCP6/weI3sBA==
X-Received: by 2002:a05:620a:3905:b0:7a9:bc9b:b27 with SMTP id af79cd13be357-7b6f890562emr83304785a.6.1734035556157;
        Thu, 12 Dec 2024 12:32:36 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798fc7sm10620346a12.62.2024.12.12.12.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 12:32:34 -0800 (PST)
Message-ID: <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 21:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
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
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ixKKL5sjw_7mUswB9eioScHBlpzEM-KR
X-Proofpoint-GUID: ixKKL5sjw_7mUswB9eioScHBlpzEM-KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120149

On 11.12.2024 9:29 AM, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7020100,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },

All a7xx targets use the same BCMs with the only difference being
the ACV voting mask. You may want to make these non-anonymous structs.

> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

I think perfmode is simply supposed to be set when bw == max_bw

Konrad

