Return-Path: <linux-arm-msm+bounces-51610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0CDA64CAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E78CD7A22C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438C723373A;
	Mon, 17 Mar 2025 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr9eaoL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D6189905
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211072; cv=none; b=ZjrLCUjDZn6DqvsYopB55eTRI16Le+Qq8VfRxjk8EPynNpnDjcXl//YkjoC7Ohh8C/dBCdVL+Rx0viu4Pw32ToSNdOzYBwpzR+g7l2IQUwYmu7WmXk/XZ+s4TfBoNWGXnTV3yhWZ7KOLMgabIXEhYMNdBItq2uAgQ7I4mwCzeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211072; c=relaxed/simple;
	bh=ERBkrBW1jXuLcvdKfLSnqEM6VUWt7tHIo7Mc9TxQWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InoGBAUX7jGxsacpbZe/POWGDXk2ILFX3FwrgkaRu+IhO6OwGosUs3at0f0DFIsLAVwU6GBqJ5RLQZ04VMoUE/krzhdD/8z9a8KSC8k7ZpgmdG8EXHEWTaF0zpcmtkTK0x7O0tphltL6bsu4zRgVowuUYeT9p9SY93NioKr7/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr9eaoL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9sQTc014469
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yxyQZODdXLkSP4pKmGvOhty0
	JHw7brHWE7Qvit2mgQ8=; b=cr9eaoL2JZ2LV2+RNEY6lxhf3RgxDQE7If1mWlce
	pbuHq5Qi0y2jqduPuQ639ji4N2vShG0+S7OcjBuKy1VOregTrudDo0/hxGCmjUrb
	ZfQCp84Vg6+U8it08YkWT8DK2PN9ugbS2GFh3g5lcQtT5jWchN0GZLlwbx+68MXL
	kS+GLBlQ0bHoHNNybJj0yaCYwda7ssZ91jtgfD1F9hl/zWGH99Isr8MhEkaRKc6b
	fywrUUpdFGpfcKtn0MTcMmFbYeFxj/YR8ydz4neZMbPVfqqfDy7W+8pSCwYl3ckr
	PGd3HPSAZ8APC1dfjYkmzI+yJqNmTywvemTl4eCS8Z0qqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdmk5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:31:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c17f91dbso784390485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 04:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211068; x=1742815868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxyQZODdXLkSP4pKmGvOhty0JHw7brHWE7Qvit2mgQ8=;
        b=AF0GtqMzrkaKGisiXH1RrGsip6tcuZPHGK86pF3bV41MXT1lyw5I2yDLMNfCRejAyX
         SCwl3BirhVEpuGRnY5hNJFgJJefc92t+NBjjlkKd3rGdAOSMFB67cM5EmDxKiYUxmjyg
         duif/5BZ/7FzDLAWR9AGuJck2Qle1XuuMekkUA3WN/S1BNBAjTWjb6rXTU7PKjXHI3Xm
         yuAFy5tIwn+ve+ZVit7+bRbB6KELd1g7HOch5BJz9Z4ZmCznjRtLe6JbbK2KGPMVNEPq
         9RWf0gwmYCFXJeveIsXqISXpfMa0dUEXl5Dl7yrgwSNxm4CNr1C6ZygKFH1O5S0f0XeX
         +gQg==
X-Forwarded-Encrypted: i=1; AJvYcCXs0oLANn623XJK0WeaxHS1CG8vINhTrT88GsTOaII9WiLeZbKlZEagLg98E0PACMLEttLCPQLNXDDJHshY@vger.kernel.org
X-Gm-Message-State: AOJu0YxnTuURoZQr8s7evgAl/DGNz3IUioGlwvuQOMHH40EHL0RpTj+0
	QbzihEaT3Fo8nG1wcfIG1SUvku8qxuZsT/bUe+jbxRJ7ZsRI92DX5a1wV8zaIpVYaNfubHn8Fnu
	NLw0Wsb17LTWUgHsWTp1b3/bZC3vV+WGtk4+MHKqUt4GaMsm1uUKckAFvCGQGk/RF
X-Gm-Gg: ASbGncuGBiaM144dSYI/DYGHu/O1q+QhKB7xO3Q8cF2JkBBMndk3UgSilODskfbISXk
	Pp0CX+4LRqw4BMIq6P8WpAHcN0Sd2fP9FuVnhuL2sMq91eZaWbv1UscV3lbmUGEFK3aLaWb8wHr
	O++2uiPC6Bw81zQHT6RhZ2o+WhAQlNKPmwMZvhAIoehU9jlp3eZE6yXV/WBEuiHaaZwTDeWPUM9
	2d+Z3L8MLU0xRKXa/2wwxCOo3LvlYp+pEeKAmsJ7QVmcv+hRZ3bzpXLS0c7IXXAjQQ78zNFvZ4J
	/JND7/g8iL6o3qaKe+xLVBwZwojFLN79/VaeJP9TgcnOS+Vy9oMfG1+ACIy6dceNtnNoAG+Nmhf
	F0BU=
X-Received: by 2002:a05:620a:2402:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c57c8fd7a8mr1408212485a.38.1742211068517;
        Mon, 17 Mar 2025 04:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyzB4PA4i/ZI1x7x2UAZWqGYU5b/+Y54NT9qN4ljiJY5IlVc9vIREnL/Bl6tJpjNqwt0qkSQ==
X-Received: by 2002:a05:620a:2402:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c57c8fd7a8mr1408210185a.38.1742211068190;
        Mon, 17 Mar 2025 04:31:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da280sm15695621fa.89.2025.03.17.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:31:06 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:31:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Message-ID: <awgq7zqeqkp2iwyk7vbn3mugsaq723bisxzhaswmzpt3iyc5rw@2vsarnkjdrjr>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d807fd cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=vjPId6sXUSytdOGuP0cA:9 a=a5fHTQWifTJYonsY:21 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -nIW0et2bXjuFEuWEt3bEwHGAyy91tji
X-Proofpoint-GUID: -nIW0et2bXjuFEuWEt3bEwHGAyy91tji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170084

On Tue, Mar 11, 2025 at 05:33:55PM +0530, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sa8775p-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +			memory-region = <&pil_video_mem>;
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +			reset-names = "bus";
> +
> +			iommus = <&apps_smmu 0x0880 0x0400>,
> +				 <&apps_smmu 0x0887 0x0400>;
> +			dma-coherent;

I think almost missed it:

	status = "disabled";

Don't enable the device by default, there is a chance of the firmware
being not present.

-- 
With best wishes
Dmitry

