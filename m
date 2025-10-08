Return-Path: <linux-arm-msm+bounces-76405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F244BC508D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6C073532E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485582820B6;
	Wed,  8 Oct 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIbl+IQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6627EFE7
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928195; cv=none; b=XD5dyBKbTRTK22Qlfne6ROrtwzMyQT0YiXODHC+5YEWlz7JRBD1g5BS8U1sNaftBelQmq3OZ1o6CLz515vdgUXDPU/rhQrmem+2DX4ZeYCiy9J/YjxHc7ce6rUHg9VXjM4I8jtkpxO213QtcUqbn5Vl0JwnJDFZruIon8t/XejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928195; c=relaxed/simple;
	bh=1VuEM3I+wo+gJRNNQsGhpeUty/mbEGcmXM06dhM39KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLlooZ/VrjKB2j0BVrAhJtjVnDjJnowGhOoYqlzBwMaVQFrh9auod1Mzh2kBKbarHmPHDz63N+ychK4FxTEj3D1hYrO0hQZojPAtw0WkygCiYMm0kNP8x6KB239BVVkRW9h7wFeLEmW9p2WG3cluxuL6YgUZaTN0xgEQxZ6vDjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIbl+IQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Tb6026711
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hiCtiNo8qpPT2bD5wSeikfNE
	shBu8SbNM8ccn6WVAMg=; b=IIbl+IQDbyYec5n93I9xSrvDr9V6umKQqcMHSc13
	5a2OBGOWfCmrcUrGhIJSFxSCIbNzZnLOQEKbvvPVB1iCpYMHlvURQIiZJPob+/+M
	F1k0DIObpkfLrc3odcHe5u8UdXeQ62UV1Iz5wvAucXCvL/K/LVzWCD5phqquG/R5
	jN3WpE0VjMHZ342v6MsOGP/zHDtzWG1U0oEvnP4AP4zmFwQni37yxTItFsuBVfr1
	DzHbt1xUApCUM6N47IQgrhDn0GQLCEjvesQHcO5ESqe735MlaEgAnx3H0fXop64i
	K89bQJkDZhE90En1vVkrKsJKgL9Q11PkzNLKPuv86Yj0fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n89hjamg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:56:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e0e7caf22eso204624571cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928190; x=1760532990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiCtiNo8qpPT2bD5wSeikfNEshBu8SbNM8ccn6WVAMg=;
        b=Z6Pxi6oUqGDtomGkL3mTX5cO6pTbAT40WsiQQfTTi9CKRE0JC9AMAoD+HntP3HQGMZ
         u7mEO3/B/16cATJ9EMgOk6oxrhzTjuwGefZKsJFWJc7sB3A/2CiWECQSpkFBaASmFWuJ
         YH/PXZCd4FDaw1cUnoTayJZT7Y4RVAKTTXLzB98ic6vmwcvF9LU8d6JRkbqN9KtXCgTt
         MiZwB0LIIwuTIJzAU4FNOdpXsEzMGZNtKsM4hDELLcBOhYlc3RaxCdyXjrRf8eTYjlSP
         opYoFxb4j46Ito/IEhaLRdFogYG0icJt74KaX0zIbOa5PE2vargNIDqByEEbFVD5petR
         Ya3A==
X-Forwarded-Encrypted: i=1; AJvYcCXIuwSMjqLuAuN1Da2+2H27PeZ0wlIsNPfylKK2N1AtLwtArhVRvuCTno4zHw19u/0Qegk1sddg+/X2BAIY@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTjM+jC/9xpInqGvz+x64sTb++JYgoVTskqUH8inYiukTOROZ
	ApO6N46iG9rwWK9DVE8aXAKD2ZE7JCKBK3eVwICX+EgMclBmzr8iNHBzHQpDv0bbvzK3h0uovwJ
	WoXvLZx+KrIKbBbyjCGKp+2+eJFO0iAvBKFyvjr/lFQ8E1I7mXCReoOqXP7DGby4HH14L
X-Gm-Gg: ASbGncuHxTrotLq4mLBhor8g9PHy1nyVuzO/TozLyDrr4+dcZBFaNMCwDjljX2nWT2t
	cmV3JBbyk/EI4ACJGBmIMW2TMwDivqNi8lEcBTelk6o0EKHsmdaS9KBX4iLjg9s3dJaQI6IaD2a
	3waWGhV4pl5HsulzKl6nm3Id20qGlY/PCXElMTxRrcuJsaQ78HEWB3rGaLa+H0UZ0aCE8ne8Qmm
	1wnZxOs4HS34LCC7bJJqTYzNtkxRbVNujFwcepuR6QdxGA4/qIPXBt7Z7GJgXNS0lQsVCpJKMZT
	WQS1m6KYUpsuwQtPN3LNh/c4oqsLuYFw+JHfcKeWbA38TMh8rvXdL/QIEKHvul1gbr5c5Sqr32i
	npg8KqSroZKHq+9ZHGBl0kVFR/Qf7I6vfQLHSZ/W3ild8Pyh3wAu6XJeQyQ==
X-Received: by 2002:a05:622a:1991:b0:4d0:fbd5:4cd5 with SMTP id d75a77b69052e-4e6eacb3cc6mr46909241cf.11.1759928190349;
        Wed, 08 Oct 2025 05:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhF0fqQEIszukwundy9NKl7UcbsMGK/tT9v7Zk57QUPhf5ki+jTRUeEtc46h45Talc6F2Zbw==
X-Received: by 2002:a05:622a:1991:b0:4d0:fbd5:4cd5 with SMTP id d75a77b69052e-4e6eacb3cc6mr46908921cf.11.1759928189856;
        Wed, 08 Oct 2025 05:56:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a7e5asm7195676e87.113.2025.10.08.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:56:28 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/24] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <d3nyfefrqactlma56wt2kjmb2zj7tvul6hlphjtxcide5szshw@omnsdj7eqxrm>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-2-24b601bbecc0@oss.qualcomm.com>
 <wzhfv4v5urehjjlldsdznrnv244pdzpuolofalvj3cerscipch@7gkb5dvjwl4i>
 <d7125f03-ae6e-4907-a739-840b68593804@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7125f03-ae6e-4907-a739-840b68593804@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0NiBTYWx0ZWRfX9lh+XSlc9Ixm
 mwnG9N8POqEsOEB0TsxP47m0HxnjBbkbvU67sqiYie3IOJnLt67O/Kyvc19mHyEuQ4cCC/J5q8f
 jxvw+wmaIkcrKxxhCMu0eTM1GlGpH52txTBE+zRGxhaH2RHsll02vWp2PFnB8YnxrLoi+7KHs87
 /GAT15PGYclt/pBX0aKKytTwGzDyZ7aSV3TGRX3jLXsdsTfkEO9XaI975S/fmt0E3F5nooRYJDM
 gwvq541Bnom9euXMObZTuiR9PGlL5ecBLrV7K24cXt0IQgH+A+VTqYziJDVnfDj4TggGJpsTpKL
 RXh+r/TC1nzf1ZAHSO1gvgoAxjwj3z/yUy7Cv9CPJ1jLisNXv1igyqjMuf2csXL1a2zqy5iI4i6
 +JJFTP/eoXDc9gN6JQBVotpZWd0EYQ==
X-Proofpoint-ORIG-GUID: ya48K3ljtX8HRuzEFmERykwtp-W_Yj8U
X-Proofpoint-GUID: ya48K3ljtX8HRuzEFmERykwtp-W_Yj8U
X-Authority-Analysis: v=2.4 cv=cKbtc1eN c=1 sm=1 tr=0 ts=68e65f80 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HAf9aL_hb54jzGR_yskA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070146

On Wed, Oct 08, 2025 at 04:56:17PM +0530, Pankaj Patil wrote:
> On 9/25/2025 11:01 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 12:02:10PM +0530, Pankaj Patil wrote:
> >> The serial engine must be properly setup before kernel reaches
> >> "init",so UART driver and its dependencies needs to be built in.
> >> Enable its dependency clocks,interconnect and pinctrl as built-in
> >> to boot Glymur CRD board to UART console with full USB support.
> >>
> >> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/configs/defconfig | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> @@ -1641,6 +1645,7 @@ CONFIG_PHY_QCOM_QMP=m
> >>  CONFIG_PHY_QCOM_QUSB2=m
> >>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
> >>  CONFIG_PHY_QCOM_M31_USB=m
> >> +CONFIG_PHY_QCOM_M31_EUSB=m
> > Is this also a dependency for UART?
> 
> No, it's a dependency for USB, commit message mentions
> full USB support being enabled

Please rephrase the commit message to make it more obvious (yes, I
missed the USB part).

> 
> >>  CONFIG_PHY_QCOM_USB_HS=m
> >>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
> >>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> >> @@ -1718,6 +1723,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
> >>  CONFIG_INTERCONNECT_IMX8MQ=m
> >>  CONFIG_INTERCONNECT_IMX8MP=y
> >>  CONFIG_INTERCONNECT_QCOM=y
> >> +CONFIG_INTERCONNECT_QCOM_GLYMUR=y
> >>  CONFIG_INTERCONNECT_QCOM_MSM8916=m
> >>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> >>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> >>
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

