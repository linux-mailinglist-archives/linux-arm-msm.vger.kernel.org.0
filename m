Return-Path: <linux-arm-msm+bounces-52659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC5A73556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444113A63F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1431314A0B7;
	Thu, 27 Mar 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix/ktWvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51855146D6A
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087936; cv=none; b=sKiU5Lj4XENSRICrbJoroCSiZxdQbh1UXOmn3h6EhYdJgofCqI5RbLJY/XnQ1mnmhOd3jl+DQPEThpXRmKjJtGF+xQ7s8nlO0LnxTSIE69x9mOBjR4nkS5zcjM7UZArSPJBi++JQ5U4V+GulDQHXQlOugMkVlhU23RQbUbDiotI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087936; c=relaxed/simple;
	bh=qh61VxXk6rrwdvD9J5wdPdojUjMQR8+bCptKWIyzmLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skhhyRj7kHF8xbGaOpLQni/vudg37azRHR9Co+NBsXuCae7HN2Pb8k/fRpHShFsAYSHVGhZvQC9drhDIjw/CD41pUTpA4uj12X31pzaHYvg4e3BQNLgCym9xynoWkFbkebCkJ/+JYLSJbwxK3h4siniGdOeO05hfRcFjj1uYabs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix/ktWvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jHe9005989
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F57vfjNbGcDTin+L3ms633Xp
	GBmjQUIQqL1HJNUyNdo=; b=ix/ktWvly23sXPGQj6n9ta0nSzblZO2w08HZYkCB
	OXJNC8jiS/nwfyOSCSqfTJb0nIH96LQH8No4v6AVWS2Dst7sJrzAp2AlX1ke9kuW
	kFeFabdEevkCtD+cFk3UbkH4EQwHOiQKxE6OCzncghYJHIj/ljDlVO6EuxBUy3Z8
	bYdm5tLgspZAEET33AyGOiOjzr2e6R8nNJVzaU7UTly/luOEq+sVfiLeARCLhH/L
	3OgSq7eIeBBhleC7MBfAsj//cOkQHzvbtfxXYI/9yUQX6nmUrHBT+mA3L05hlcFv
	nX22HQQkdaxxs/OXXO8e87S91XxdVDh636O0h6F3CIRlEg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf5pbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:05:33 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f69273774cso1822548b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087932; x=1743692732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F57vfjNbGcDTin+L3ms633XpGBmjQUIQqL1HJNUyNdo=;
        b=p8jzsDmb6TnjoQAbeYDznJFOf1bNWyvINDjLCcP4BJyJDmgAXbogHYWWXNgFsEkvAH
         QGWF7+ShQfOyH6AD1+OqiOZuDKYdLU2i8V3PaOw+WBe+e3k46Mvt70CVU5Luse3NuhB4
         4FSSfS/QFWd3/6MXQRXveKe986pvzwplCXpiwF1kJsj2N7IWkTGJgUHwBHWPCfV7DnOr
         6n4jEHkzfQ7zF80MZ88W3JaVrJE0CBpDDlW8CuKPolWMD+y9fZ0xjMOBX2jSo4R4Wvzh
         zz3Kc4ecM+FyVXPIRwjoG/5BZZ7n5sNeaS+l5nLSFT5JeTNLk2zqxjbP3ChidL8jdr2Y
         mKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/CZJnaHP1ZNSb0eSTfnEWSqdYrSC9yFhACUKLTQTOQpVWOLoOn/TuZgv9CT3S4hGLI4VYa7pkasCMA9U/@vger.kernel.org
X-Gm-Message-State: AOJu0YxqROjykZqZ1rJbZ0A46TnynrZ5pD2lvHSi6/71ociYRBD81Ml2
	jRlQF8GJQZucufs6qm68moiol4BLAUy2kTsb2TuJriq2yMmJLxpbDxFS6irs8clRLYJlj8+KM4W
	82FHp+UBce1I3AMypXRNy4N9grBnPjZOdxEuH5HkgGG8tCbJ9ni81adD5EJuEmcfC
X-Gm-Gg: ASbGncs0+nRBRPaZCfC7TXiD/jYgdfHZhMtrCWT1t5uPVtPAjHIQrkyAFhnPB3UYgDY
	IZ66urSIo8FbKNgUI8thKSJ6LMMNLviXf+9YfpV0JAit6ipbh86LMmkmd6oat4sHOgMrLk0mPHN
	3Qeg64q9Nxb3NfBQMaf9tZixW/XR6A709pfXRNpzMrSPx6uGOhBhHub1yzsXXLS/zEfK/eEpYZU
	lx1BJ+/bOsUdgWSkwnLhaV0Hw+XITwxz8oHkZvNI00XkyNEU302covtXSpOPmEMbk6vd7S5mGKw
	jIKB3ERGh/6XWYnRhRObTV6BHMApWYQKZOx36WuzhRRDGGo58FPyEQEE/rXJdJHMo0C9hKwd4rr
	OmpQ=
X-Received: by 2002:a05:6808:640f:b0:3f6:7677:5bef with SMTP id 5614622812f47-3ff032dd054mr478569b6e.2.1743087932067;
        Thu, 27 Mar 2025 08:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjEeBXsYXajo8HENS0+khMH+MqPIBNHR763f2BP/fV55DfZhoTpVukuTj5il/7yyaeDxzOXA==
X-Received: by 2002:a05:6808:640f:b0:3f6:7677:5bef with SMTP id 5614622812f47-3ff032dd054mr478534b6e.2.1743087931589;
        Thu, 27 Mar 2025 08:05:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65081a1sm2102127e87.163.2025.03.27.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:05:29 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:05:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add crypto engine
Message-ID: <h3ol4qc242w7h3u7uiywxyc2v6op6cvxhzuk2dx5q5dvhitolp@pb6c53ki3cag>
References: <20250327142842.1138203-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327142842.1138203-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: P2mDcoefrkUo-Fld_uJnUoG3xct86f2_
X-Proofpoint-GUID: P2mDcoefrkUo-Fld_uJnUoG3xct86f2_
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e5693d cx=c_pps a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9 a=CjuIK1q_8ugA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270103

On Thu, Mar 27, 2025 at 03:28:42PM +0100, Loic Poulain wrote:
> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f0746123e594..c9ac06164d43 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -749,6 +749,34 @@ config_noc: interconnect@1900000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cryptobam: dma@1b04000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01b04000 0x0 0x24000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			iommus = <&apps_smmu 0x0084 0x0011>,
> +				 <&apps_smmu 0x0086 0x0011>,
> +				 <&apps_smmu 0x0094 0x0011>,
> +				 <&apps_smmu 0x0096 0x0011>;
> +		};
> +
> +		crypto: crypto@1b3a000 {
> +			compatible = "qcom,qcm2290-qce", "qcom,qce";
> +			reg = <0x0 0x01b3a000 0x0 0x6000>;
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "core";
> +			dmas = <&cryptobam 6>, <&cryptobam 7>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x0084 0x0011>,
> +				 <&apps_smmu 0x0086 0x0011>,
> +				 <&apps_smmu 0x0094 0x0011>,
> +				 <&apps_smmu 0x0096 0x0011>;

Don't these fall into the previous entries + mask? The same question
applies to BAM SMMU entries.

> +		};
> +
>  		qfprom@1b44000 {
>  			compatible = "qcom,qcm2290-qfprom", "qcom,qfprom";
>  			reg = <0x0 0x01b44000 0x0 0x3000>;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

