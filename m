Return-Path: <linux-arm-msm+bounces-62637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA3AE9CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23A2E1C26754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98BB79CF;
	Thu, 26 Jun 2025 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSZj1CDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4857B5383
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938583; cv=none; b=ECpbEKdrzfAxTaytl5JQOLMq2ULVcrtSLxDEFiIiRT8Zw7ocd6WbH0bT7hX1MJL6l5lqsnXLmS63hQzeGR9JAbdAWhJoqWAIq+6ms0JZPx725HKGudBL2rOSMgd1v7dNFLuC9t+KKRxf0U3CeYpSTxTDhKd8x2KkX41ZcZdCmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938583; c=relaxed/simple;
	bh=9Ulf7o72U8DcrYow+1z4SBJCw3hIkvgPS6ofzKA4wPs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMqRZJmnoqr35UNAosnoTnzSqvfc1IwYP8orA7b0yn2EGSEqgJQZqykafaqFKiuF9CdR741XReW1pRW8iufYn4i2+c8qlA3P/orJq8BYcwTg1hpOV/LrgeZ+RZZ2OnOYYrLwfjR4pYTyrWx/7z5wgFBiSCcq7fK8jNz35Llx86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSZj1CDr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9dbEJ016254
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBwtiHKIyvgYyIKMG2QKXSaH
	zLS1UsXkLrpjRQkC6aU=; b=HSZj1CDrgaiRKXmxTbBm88pkg3ZX4/CYj5DlrNPO
	RjpSDGXrPIrIvxw3z86xR0cLOpZaU1Dak7mEy/CxUnxGrEzOEW+M4Pdncgd7VTjk
	ULF+66puebVsltx5Errzugvcim+J211SuoTGGGXWvoGQ3tq3PEHK84afxJFj4scE
	bXdunVWZnZYktx80HQxI8v/Ue1ZyceGPp4OO1DfTycjMjMZb3OK1F2JtQY4QJE3e
	loZsUiCXaKV+Gfp+PMPBV7QVdk8IBRSAFpspimllajI8o0dtfaLrxt9Yo+0gvgqN
	H6F7fugrdS3RwVHqMtbb5TlmCMGFNT7UDa2Yjh9gKNtTvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fcx9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399070cecso143833885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938579; x=1751543379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBwtiHKIyvgYyIKMG2QKXSaHzLS1UsXkLrpjRQkC6aU=;
        b=d1/akP+YifCAzKM2SJaSkQvh5WjAdjTJ3HO6gBif2SjacTrTcG8+0+9HlhrDCvvXHy
         d3h9UPU6icr50BMWMN78I4LToOjCweXi4Re1vc6Sl3nfB+5hWxcyetFH+Di1XmoSLz9d
         23CgjW+PsSL8kzAPn9/NY8fJS/dhbXIBzncPefOdWPHHysQGhHDy9hwGhUY2X87Rz5Q1
         WWUyKfKAHGH/1sSXK9uT2ouACKJK4qb1rN/XgC1uE1mshpNel0/VqMFvmDXEdKJWZF+p
         vXnGb0wStKydL8sg4hw/wUh9nhVHp0MhVYv+8KFsZR1wUzZXoy2flhfZWGc0k6jQcPSz
         hQVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Oy+EyKeUzpDw8DG4bN62wj9ah5qElqAN0COLndpl25GMRexNXOjTUMmkBeSOD9n5M9KMLnBL2avWz1h8@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZWBhVk0GjYHI8vRV/f2bN9aEYP5h/SCTS4M6SI2YNV8cBlxM
	BbJs3TaiBFMNf6nEXfF38YETvy715OsfNulAYEAsNUCTUruyL4oiHx+wWl/0EjOusiHlNOit0ps
	MBMbuI+g8LO7hxsSXa6L7Rmo3KXiDDnfWuyw4t+O5lf0CJf4m82kPHXoyeRtTBgGkprqF
X-Gm-Gg: ASbGncvQgATv+qG2XWRD3sLDWigVM4XRmvvq3TphGAMqpGFo+PYVmx+7cZNjb7TH3Ye
	4nGbJSjXmJ4VHm7ehwxrLmeqFJxUNDbvDyfDj1FgRFiuNcnAYHOaFDKgaLz6WCB3CjH28r7OdY8
	RkvtFefqc3k7igzjeoHKh/W2MaB0Om7kKeflJN/YGgpFPhIgcKBTQ9aALJx9IiZtFLcbNL6+z3L
	Q9Vg2+jTKo6MxOdUAoyKclOZ8pLmUrXowZG4zeCA+M4qEZvUEY5lSltqGHJLrnuujXA0YS0ciVA
	H3sNNlH+hE1fi3pbzMLJ1KW/gNsEYHDKEZ0TBkuR+UjrF8cSOhie/FEd4Q==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880327685a.50.1750938579256;
        Thu, 26 Jun 2025 04:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEZLJex3QT9MiFpQxhLoKdZ4j1Cu8HP2gRnN7PwYTuwEzqabvzfKKTsfgs0N8lf/Fd99BcDg==
X-Received: by 2002:a05:620a:4087:b0:7d3:8e3d:da92 with SMTP id af79cd13be357-7d42976b8ffmr880323485a.50.1750938578872;
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm47428985e9.6.2025.06.26.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:49:38 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 13:49:36 +0200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF0z0NiuL+Cg38kC@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
 <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5OSBTYWx0ZWRfXxMmHz/tgoE2A
 wnD8Mkk0flp2NU/IsSuJlBZBZ70qMY6lm4kqTugcDI5Bi+Kdo9SFxokkV28PWzY/ZCnKom8b43s
 cCpSvMbPo5KnO1uVDJN2ZyHkL7OEbmjWKZjVb3cTRbKf7e4a9uAb+HlTPBuPdAuHt91EPEiaP+j
 1KFpjKZiiu6b/44V/9SAcCnEO+9CNgsK3/dvKRLRPkBu6AwDtOcQvzpWXR8NhuNl7SOCqMd7/hw
 oLRWaSE138b+aQuiVNvan2jowWu+C23c/aKyZjTgDAeAV1TGyUpjXukuIp5Z0tJNMSNn2iVxUpy
 IAd+p7Nq30AQeYztripN/AEIH3DPBoMRNqTNmDhPsIw2iS9T0C6+q0ZOo7RJZiCdcGuBoV10gnb
 AxzesfrffXrBurfflYSJ06TSoMeqOuRa4101HgYYCKEH1ZWobQ1H/5E1yVqsMGSGbpeSkfSi
X-Proofpoint-ORIG-GUID: xQ1OnEpOK9mFgzs1u8RBuOD_qK_5_hCH
X-Proofpoint-GUID: xQ1OnEpOK9mFgzs1u8RBuOD_qK_5_hCH
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685d33d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Llyb1ICWO3Llu68erG4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260099

On 23/06/25 13:16:30, Konrad Dybcio wrote:
> On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
> > Add DT entries for the qcm2290 venus encoder/decoder.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		venus: video-codec@5a00000 {
> > +			compatible = "qcom,qcm2290-venus";
> > +			reg = <0 0x5a00000 0 0xff000>;
> 
> the size seems to be 0xf0000 instead

you are right

> 
> > +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			power-domains = <&gcc GCC_VENUS_GDSC>,
> > +					<&gcc GCC_VCODEC0_GDSC>,
> > +					<&rpmpd QCM2290_VDDCX>;
> > +			power-domain-names = "venus", "vcodec0", "cx";
> 
> one per line, please, also below

ok

> 
> > +			operating-points-v2 = <&venus_opp_table>;
> > +
> > +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > +				 <&gcc GCC_VIDEO_AHB_CLK>,
> 
> On other platforms, this clock is consumed by videocc
> 
> > +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> > +			clock-names = "core", "iface", "bus", "throttle",
> > +				      "vcodec0_core", "vcodec0_bus";
> > +
> > +			memory-region = <&pil_video_mem>;
> > +			iommus = <&apps_smmu 0x860 0x0>,
> > +				 <&apps_smmu 0x880 0x0>,
> > +				 <&apps_smmu 0x861 0x04>,
> > +				 <&apps_smmu 0x863 0x0>,
> > +				 <&apps_smmu 0x804 0xE0>;
> 
> lowercase hex is preferred

yep

> 
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
> 
> for this path: RPM_ALWAYS_TAG> +					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
> 
> for this one: RPM_ACTIVE_TAG
>

ok

> > +			interconnect-names = "video-mem", "cpu-cfg";
> > +
> > +			venus_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +				opp-133000000 {
> 
> please add a newline before the subnode

ok

> 
> Konrad

