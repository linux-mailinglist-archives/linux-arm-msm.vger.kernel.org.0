Return-Path: <linux-arm-msm+bounces-106734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL/sNSk5/mkroAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:27:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 344814FB185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 677003037145
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03D13FBED4;
	Fri,  8 May 2026 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tpg9h12O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEKCwq5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96220E702
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268454; cv=none; b=St+HUJkdiyTVcY+iyS1FDyU0gWBBE08uh1YUOdG4B91zML8nN/lJYkYswXmsBTbHHdX/9LoBMmZgzc8c05ni8jbWbmEDg2IBVC2i9jYhVNdnxHdVaKr1q6NuFaYAKNJJiLnKgm7oGHaaLcczfWqKub/QLyfNGUipN9pY+AMhO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268454; c=relaxed/simple;
	bh=vLFJYlz472BIEbCJJrK+f2v/oLfa/ZS2Gxm8V04XxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efNHuMiA8brXN52Vgs/yUfSHU5BMe0+fOMkLkHJ+l7ACtdQqIaP51XvdONOwrhRmyj4Fb1YQMC1TfU+KjgdDTXnRmX2IECfOKXxPdCKvMlKX5XfsS4JHWDg7oLzO2Z65v0f1ZN//X0yidGkKahUsbuNt4BdumIgVDaLSb7OHwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tpg9h12O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEKCwq5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648DGFFU317527
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yY55dO2IMk/92g6rGd8QRogQ
	Oy5+UeRlbKNLCfs3a9k=; b=Tpg9h12Ox8yR+fzY8akuJaF9alimLJl+7606HI/b
	iclAu58skbnVvjdJT2knGf0tvHSBvYJixU6Nix23LLkzkeGyKzY/XKHOD9nRwELk
	GPAO+D61c/jtFcG73tcbjTN3Fy9a9QWO8u2MVwr02/9Tw5RMw8y4DmaT/uCm88jS
	NHXUDm2HwxFM6zkueKz1y1aQuaSCR4kURy2dJ8P0Tbq2wjQNU7EDWMA+2NRC8A3R
	Uh+rlUnob0M2Tdm0RTHGPJ9dlqRjxXTzv88B1Jj1u5amDegGQubRvUCOYMYea/Cl
	13IZHeOgqERGxqGdOHgxe7Cz7u9Mb5FOHSlabzbp8qD0ig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1bc02w0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:27:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e575a50bcso29575321cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268452; x=1778873252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=bEKCwq5zL/UG9SXbAivmcvd6t8UxrKXsm1ZDc+DUwsfdIhtIWZa7aYbEcURENaoe/p
         6bx+6KZuGB4Ai2vCR74P2vrMhWuqeyB09gAspZOlnnABIVXG8WyELkU28T94TbvnpOwu
         dVqDVLWMKNC2/R9Yi/3NGjDF1QgZGWp6o5DnKVgiHGLy/TRJnCs7eJfWVNFHFRlWjrOK
         +uFN8I7yshQ9dwkksonvrQqScIIblOZ2eDBqzjp5spLDgLvjKExSghIvVsuFe/gPuY3+
         idFKO5MmaTL+CspDgCjNwqVuvdoZPyzMSX8LwcSxf0KgvdWXO2TfZcPgrz+V1Aq5XW6/
         cJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268452; x=1778873252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY55dO2IMk/92g6rGd8QRogQOy5+UeRlbKNLCfs3a9k=;
        b=T+0f/MIeT35/8fqtHyqxAO54S6Ea62ciNHjOqm7ZaiTBDfYPWQ1a2Omc7GhPPaBjWJ
         ExKpnyBzdP6/h8guSdOP/9F8ldnefeurcsJmc9nqI6fPYlb2xuf82kleDLl4dm8DzxIQ
         YDcD6EOHot1noX/euLRAfabFF4XTKNAmqBFEh9X8naxg0qTIXyBMhiZcfRne0cqjFBbX
         KrU6nyRJli/9PaI17YH8iTIGjwZGLwvb4Qi/6yC7Wl7GBp9W7bfAHEXEnjnTKFOC/kvB
         PVztgTqYeiZip77yqNYqCuDf0bWbTsGYdsEH5TwoWS7InApeAkRozOMLGFbJ1MNzXiUm
         kipA==
X-Forwarded-Encrypted: i=1; AFNElJ/39Msq6hb5I1yfPnv8s1qlM1PGBmm36M3CxKJ5rHE+8T746pTlUA2fdObDiVL1pulf7IYUE9greHCeYrkA@vger.kernel.org
X-Gm-Message-State: AOJu0YyWi3lbR0tOC2irspGPEm8hVTSvwM74cC0ZjF9WKfnSDHsBTcCW
	zT5FbNWWIF7WBdkLoMWWCJAqX6kuX7Og3lA4P0qq7e1ohQCIfkubVZ55/ZoaednOzS34q0fsZk3
	XtuvqKMTzEMBEKj4FU4hmSocvM1nGyHILy/Blxz4sjiszgit9Rx2vplgidbu5opt5Y7Cm
X-Gm-Gg: AeBDietV0+GUmWkMZ0lmDm2MpvLNVyG963+Wj/uaq84xNk1ks2+Fn2MsY2vMTOCXRa1
	48S9gZu4yJmGpyHpVzUQtW4vVjXMgfmlto3miPjywIwHjaVp5pGepPlRDYYj4actaTs5s/5hkMY
	h/kDdA3sxiPFFKylkqcBP7+CQv98jhoHb9Ai19XMqF3zLdOI4WJaBEmRAPpatSidwtOgKmDmIIF
	X4LMRkrSVjQfGGAVkRjDCAKDuxgz3B8LlQJzPBz57UdIQTscQpllWg1Owp7uR5UITypsnsNyp3G
	a4JUlYSTQHuqA9w4l/gcFVs1XFK9P62Y6+GBdeUfQ3gPNQJognfsP1bLXDJopviYKhIKhYDm2DF
	k6a0wEFjHXPegnaJFNxEsaAUXSoZ4ODva1ABLFbvTSJrXGIxuUk+NBrobbAcvc9/hI9L64h7707
	oRzjLv7Rg8jAl5J6R8UeKXm5PUw74X0IgVJ7U=
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185973311cf.25.1778268451630;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4a17:b0:50f:b904:457 with SMTP id d75a77b69052e-51461e2dc75mr185972601cf.25.1778268451066;
        Fri, 08 May 2026 12:27:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660ebsm756622e87.64.2026.05.08.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:27:28 -0700 (PDT)
Date: Fri, 8 May 2026 22:27:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
Message-ID: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfX1z7xge/pcVre
 VA9JnT5VzSWpZkTygxpNU7KeP2YLnNkmjPOmwuugIUdmMmG0x3dreG+ARsCCZ4+CA2mr4SU9+9Z
 kuyxafr3qfAqNoSH2RMxrhNSsTrH+O+fz8p5lTGFMUseK3fsBHq28E2/vtuM5AhKb6mbicB9DwH
 swoU0J1dMNt4cP5U82pkyFkCxCAglHKvYdg/LctcFi54COUNA1Ldmcta7PjPJjMO146sCx7ShiK
 QiGVmqQADchk6rNN+Zlnjc9935gQQZjaauiEoEbbVaV4IxXvCtuuIbywsvY2k3YsGGBDe+QHEgz
 2aT6w75rKfNw8c5PHh9Pxgok2Luu5FNjS/QyqjBkiHqTo1/itz1Sm7KiJ+n9RE7duE79VQEm5Q4
 D8oe9ylMl0PWJCCwehMVxqp5lOMIGBrTbMvsYwOS99eB7yc+DXaoIDXhCt+vT1QAuPMLQPqChcy
 SFv6eEehCG9Qa1HbebQ==
X-Proofpoint-GUID: pJ0RbhcQGLiaVO0hf4owJ9fuzSU_Ehnd
X-Authority-Analysis: v=2.4 cv=JJQLdcKb c=1 sm=1 tr=0 ts=69fe3924 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mqQgVc0qi76843LXJscA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pJ0RbhcQGLiaVO0hf4owJ9fuzSU_Ehnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193
X-Rspamd-Queue-Id: 344814FB185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106734-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous platforms, thus different
> clocks and resets.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..c47443174f97 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/media/qcom,glymur-iris.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>  			status = "disabled";
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,glymur-iris";
> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_CLK>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",

I first wrote the comment regarding resets. But the clocks seem to have
the same pattern. It's not just "iface1" clock. It's the clock for one
of the cores. And there is another clock for another core. Please make
that nicely named.

> +				      "core_freerun",
> +				      "vcodec0_core_freerun",
> +				      "iface2",
> +				      "vcodec1_core",
> +				      "vcodec1_core_freerun";
> +
> +			dma-coherent;
> +
> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&videocc VIDEO_CC_MVS1_GDSC>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx",
> +					     "vcodec1";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",

The names of the resets suggest that there is single "common" reset and
then one reset per each core.

> +				      "core",
> +				      "vcodec0_core",
> +				      "bus2",
> +				      "vcodec1_core";

Are there two codecs? Or are there two cores? Your naming suggests the
former case.

> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable on boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +
> +				opp-655000000 {
> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_turbo_l1>;
> +				};
> +			};
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible = "qcom,glymur-mdss";
>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

