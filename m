Return-Path: <linux-arm-msm+bounces-76761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64CBCBC82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 08:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6863C54D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 06:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C6C258ED1;
	Fri, 10 Oct 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZS/Du9ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB62459F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077644; cv=none; b=q/VBphQNnuDWio8jNDhkYR295j7KJjtxVz9HY1MR7SjovwGoSmy3Me7yfQkS0kq4G7pD+H0M8s2Ohbi2Ng07IN/yajwMScW3YVZ0lKcZBDzMXGoXkGrbJP6wvMdExF3FHDYzOCXhe9Jr7SQ/X4wYECte/Pex5o4D/fTMNuiP8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077644; c=relaxed/simple;
	bh=pnGq//BMmE5bY73Ar2fzVMMFUkllb6bB1zHYfLKr9oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHtM3re/zFr7KtK6ugjX/sCCmwfnhyJlkh7GERGQ4dsoAIFXIIvCaU3zDhgMpLwDUSELGJJDzi3ny43fRKky9NGC8aHDJI9uUKndDSz6WYqWcsc9uhcZCKFLL47MUxV+xeLyV7nhKDrr0OiTCzAIIeOC7u1ic2KG/d6t5rDI/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZS/Du9ps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6J4U4010967
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8KOlJ1KeODNmXdXyLJpBfhqY
	iV7WSitTJL7ZDmq9RSY=; b=ZS/Du9psdphoUphP4v5iSES+PKhNKQ+r2OENk8JG
	9Tlubmfx4AzXz0g2xsn4SQCq2mBJySL1YqJakn4eeIBjEJS/gzgD6Ys7GhCJ95ca
	PzzMHvw1pHub3PQqO7hm/v6X1R1MbyXtozpe49V/35ykvDP+2FZKz3fbiiWt0viO
	wgi+8XiphatwvH5b0YgfCb+T1tBAiRDefzM2MPY2oA5mVYk0r6iV7QY7R4g1D/5H
	r+wmeiAgxf1q/vESbVCJC2onK/PfcT2ZL70rYQpreJJeEmIzLk4zR8ypo1Vn2Rg0
	0mWMG3GGRDTSyMLDtIxjCiXhO1VQwPur/JUlGLW3T6Z26g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j5cch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:27:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-268149e1c28so43255135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 23:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760077641; x=1760682441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KOlJ1KeODNmXdXyLJpBfhqYiV7WSitTJL7ZDmq9RSY=;
        b=uXLFUy6IRfzg7jm59gbIazYmRptXuSw026N8AE7mXf5B9y7+6NXbK5/nIas4TuWguD
         if6zFwY2xXYzdE5vpF1cWLP0MY9/gP1vs21N0fndCfOd9w7kNqcOpFMcCB87Ci+vrEeg
         yX9SMjmEybwyD1YlNocmLvkeNFvPdvo2+J6UMRi/AgQf/GXjZgHShPXS65pGz7KLMEC8
         N74Tw+dnEqcqCv2LQFp+qxE2iwq93WuTS6QXapGmfUgrOZw9Y+/6MsfYCFwvgptziJb6
         9EENqYBxfBcLuXrGSc0b6km8DSTbEVZQubDnE16HIHGW4gDisb0KZkC/UdJk7IUFkFuS
         V/xg==
X-Gm-Message-State: AOJu0YzB5k++yKlmbcK61qs6Ul1QyJsOWx9bfN9Oi8j7kVuH6r34ziQL
	cH2C1KynKeDTXejL3s1BjYFMV7NZPQrHunHaUSIS9VPdCilFVBDGFsDCTOxYMIuxdeF71g45uPN
	6yjxXtCd/uJdyK6WQg50iIkdCuhMgyAPrzhdpS6SduH34ScO900y69Og1SDzKYdo4QzGz
X-Gm-Gg: ASbGncvvUGd93Yh9RvRfZUY5R+O5e5n/dm82jdU/9cWH7MkxPMAmbqMTn9ymXMgq8u5
	tha0fjgXleOidzkbqqqVbzDmwJM9OchH3lX5cvcSIKZ0boLrvObR9wR4lvjNvS50diWwATZBIIB
	qLGsIbUv3AP1PMER1J0QbwzwZ3S60kOaslMo19qh0aWy1wyIcAGlVIHzn3ADLnr3VWMFMewHZ3M
	LogZDngNCffkN/q4C1icUkyfQnbXatRseoZViHLR4qmiQZykPgpCBvXq1QSCr95Op1rEMMJ5LdM
	T3PiHkZYlYIz7cdoAOgqfy7zxF4VCl+RznMn60cfkFgsqDr2mEeO+UXt2nr7tKS1HNo=
X-Received: by 2002:a17:903:94f:b0:27e:c27f:b834 with SMTP id d9443c01a7336-290272f7e6fmr145372135ad.56.1760077640833;
        Thu, 09 Oct 2025 23:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfC4Z+Rtwh20NJKoWgbMQbKmnRvWnaw1tbJid4gWcGtL7HdfPaybNBG6CJfaeKuWX+dFJFFg==
X-Received: by 2002:a17:903:94f:b0:27e:c27f:b834 with SMTP id d9443c01a7336-290272f7e6fmr145371765ad.56.1760077640123;
        Thu, 09 Oct 2025 23:27:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de7871sm47073245ad.16.2025.10.09.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:27:19 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:57:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
Message-ID: <20251010062713.jff37ulgskv5xllf@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
X-Proofpoint-GUID: Emn6Ql57ariZluCCtfw1TQppLf6nAn9t
X-Proofpoint-ORIG-GUID: Emn6Ql57ariZluCCtfw1TQppLf6nAn9t
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e8a749 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=oFCgBSb2_MPOKaEsi3wA:9
 a=CjuIK1q_8ugA:10 a=eSe6kog-UzkA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9Z2M8QGX+Pwb
 NSiYnYAPrAtzAQJ6mkh33oDpuIT5qinnK+Z9XD9COgsT3FqUZ6gB9uNtiYRfttudmIF4gW9KnRu
 UtblLdI/8eqeLVPWmq0jrW25hOycTFQBROwRkdiDn2Npv0RvZVPaq5v0LE6sFYdANS5B0WF1Wqw
 hzlfyKQOKqeTbz0P/yo2kYM3v5Nntk7Ff5nDMhI2fqp70ACV/eI2RipKjPcDzyW1zvPDhwsCID0
 dt1PI9XUFEoSIPkLEVkWN691mKmNB7AO4e32c+AMHjrktpPc1NQYYHHM6VJNyfAwrvTz28GkgNr
 M3aV55vr2uGobr0wuZHVHU8Tc24jyV2Xt+z7K/xixn17P13b3J9uPmLKpnGPry6MZsiBjHCTcMF
 0w5pcXWhuqHORXdzAvr9WOrMboInDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 10:18:57PM +0530, Mukesh Ojha wrote:
> All the Lemans IOT variants boards are using Gunyah hypervisor which
> means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, remote processor firmware IOMMU streams is
> controlled by the Gunyah however when Linux take ownership of it in EL2,
> It need to configure it properly to use remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |  7 +++++-
>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..e2eb6c4f8e25 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-camera-csi1-imx577.dtb
> +lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
> @@ -136,7 +138,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb

Either this can be removed., or removed from below line.

> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> +qcs9100-ride-el2-dtbs := qcs9100-ride.dtb lemans-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb qcs9100-ride-el2.dtb
> +qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb qcs9100-ride-r3-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> new file mode 100644
> index 000000000000..582b0a3a291a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/*
> + * Lemans specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iris {
> +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
> +	status = "disabled";
> +};
> +
> +/*
> + * When running under Gunyah, remote processor firmware IOMMU streams is
> + * controlled by the Gunyah however when we take ownership of it in EL2,
> + * we need to configure it properly to use remote processor.
> + */
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x3000 0x0>;
> +};
> +
> +&remoteproc_cdsp0 {
> +	iommus = <&apps_smmu 0x21c0 0x0400>;
> +};
> +
> +&remoteproc_cdsp1 {
> +	iommus = <&apps_smmu 0x29c0 0x0400>;
> +};
> +
> +&remoteproc_gpdsp0 {
> +       iommus = <&apps_smmu 0x38a0 0x0>;
> +};
> +
> +&remoteproc_gpdsp1 {
> +       iommus = <&apps_smmu 0x38c0 0x0>;
> +};
> 
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha

