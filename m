Return-Path: <linux-arm-msm+bounces-51711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C39A6738C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5510E189C4E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE07F20C012;
	Tue, 18 Mar 2025 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdDB8vrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2480E20AF88
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300013; cv=none; b=aXkHRroL8UDUf7v3lbIOUrfI+5ULkARpOtryEbRIzjbY56D6CKK/QTzGgTPjIK2hbRXaR0rJo5JHplXc23whWgNGqSs6ypPg8A6FmsrLs2GprlLpRni9TscdJOwvF9tIz+kiSrmd1SNIGou56868gWkMm0Dr0EL9+Rbpv3Cj4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300013; c=relaxed/simple;
	bh=frUuH+g+x3SXDn0kukrlBXuxRP/aJulriG5eEnACBr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgwkPSYRFTscEe6ZNeaIRrcgS4niOJu1aK8cQ8zzl8MKSt/UV53jgPTRYSiJlPwZgBgYuTSgd/wGlZ4i0gKtFJGK1meoooipCzBAX7kXBzdNtoVRuhhj7EcxBo/NGe6EtuWVFi6LS0relAO7g3sso1oAoby4wQOCZDWof/Z2xsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdDB8vrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAWsVj010361
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=; b=NdDB8vrmmtVUVhtE
	CXCHwNTuANP3skL9wayZf6jWMFfodBw+Uhh9F+yEtiV5j08T/3uF0Hve5WQogOq6
	HFwn9wsPrCKK4Q/mI8NZEvkKepfeZLDLLV+im9dy9YotURnCZlF/v/rc/Jt7O5RK
	//EXxqPquaXuKHZJuFMPio80/f1TzGmDBCdtkeepElOoWUpwCu//mlQkYr1vNo4F
	ZPTTyqJ8gZcZaAnwRQ+yXGEKlCA48p+3q43/Yq81MtYCfFjHV6+S4rV4uhE+gSd4
	CaEgS1i+y1sMjb0thxdv4zBmnHKduBEyO7q2iDClLKXjPL7Mh3smpibQ/foTywz4
	UAtWgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exx31q90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:13:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5530c2e01so30881285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300009; x=1742904809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=;
        b=YmsgH1RhXsQxZMS96zdyxZD9KctvHbudtkCnjvKZcB5PCLnyIlqBHz7kHBA9Jy5cww
         XVte9AdRoVZUwRgClc/qjWk7XEeZULRPtI1qbIdvLJaaHjFJ3cz53LZEm9CeBD64TJUl
         uySoRzzLsAji6kLduQN8X0LtiWB4AC9jA1eZknK/e65RwPhP/26qBBouLeyOc6VqlbTa
         C/YV2FBoE0EjPrIxQL0impraof7iwALKWtqbxp/qV2Du4u7o8pLeDbq1TvSV0Rwtvq6d
         VK/zCF4+lDdNkiz/B+59tnjIx+L0ozOV3XIBEzm4ArnX+5vm5cegHjGOPDJsuAKuGSy4
         1Zqw==
X-Gm-Message-State: AOJu0YxOdJYdltUEBm4s+NPgbHVvgHmH4HJ6/i9T1pKiv3VdIxBa9wNt
	nfVgBXc0JacLzb9gOHRkppQZyel6M+difaX9sr82/nQnKsX29DnnYr4UsoIRRIkvcFsFXPVsJcC
	+/y4aShReIOMp9I9LlRoOEqNiJITbzKcpoYIBNBIOmdMw6PswU+IbRg/zUz823oR8
X-Gm-Gg: ASbGnctvzsscn5QnCKWnhYyzCiKXsoAevlNOZRlbDSPzcUaeCNw2aukQOGlDMFvE7Fv
	3GZnow5QHzNs1uHkAG3AbtJ0zEgKjJshF5eHr6IexirHCaG6XYNAlFBBcZywvbIuPJ3MZIeI5tJ
	Kkq6ERIfOH2S7aZbBQt/pHl9BQ5d801eKtwD4xE5/IQ2A2F+IPojiGm3FXkc5oYpcrxxs9BSSU6
	gC1MBgF8zVkPI0nlflrwuf7YN1mWjNn2+TcPXBa3FiOceS3s07qhXbQsVc7IH9dzZ8vYwlRKx3Q
	GTuFLPOP9EOq+1G2ayBhabQJXEm7A3Bce6sMSR5q6LQq4V/ylYy4J2ZDGPqr7FwcJbx18A==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id d75a77b69052e-476c8190534mr96005061cf.11.1742300008835;
        Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe06kgM8AmHXFM5Gw3aBJVby/YG/haZcqc6BvqbAFtXAm2nFUQvuHUdNVMcDGWgpVpF/fRZg==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id d75a77b69052e-476c8190534mr96004821cf.11.1742300008446;
        Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm849452066b.149.2025.03.18.05.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:13:27 -0700 (PDT)
Message-ID: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+uy4sGx c=1 sm=1 tr=0 ts=67d9636a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=GlwZi-m6aQ2r2PzHKf4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: c6wleAo1tQ4Ak-HQdntYfE7tHkKt31I5
X-Proofpoint-GUID: c6wleAo1tQ4Ak-HQdntYfE7tHkKt31I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=508 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {

The register that the consumer of this points to doesn't seem to exist..

Konrad

