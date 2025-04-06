Return-Path: <linux-arm-msm+bounces-53323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B5A7D04C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 22:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 737A97A26C5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D1199235;
	Sun,  6 Apr 2025 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbQm2k1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13CD190485
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971466; cv=none; b=dqa1DpbAd1KrxJkC8x5HV5mKxiEYwdQDU51V1dI2zr4hQCoxGfLM534MTGIQ4vqsVYX8LWCaX+bT180j4kJjNCK5/Npw8Vw2mnqwFqKUfFHDfNwWf5JyZtdzbYN1YKu32Ue+rOSHTSyQACjUHb3wd1bXYAO3hNbdlafrsxBcEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971466; c=relaxed/simple;
	bh=0dJzKedoDUjfyYan4DVIZtP6ZwALUN7Ce6VUy4c7Hmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW8K0BoEbv0Pbis0MyCKi/r586fotJ1/oO/Flomfs2cPKfILYV54Rv6tYA/ctmlbVy3YQv5So3oEhLYE360YA1UbzIK2fg9lJFJliTrFtn/ZoA8EWK4e3FmFWTDQcWei3520Zq3tMXv+hbvi5DUmRST8vOuTaMMGvT6EtewRrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbQm2k1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JfOA2012630
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Apr 2025 20:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D3SL3RFEF7ExCpjlHS1MAW+1
	sKINZb/uEY7WG2e/dtQ=; b=nbQm2k1DHVgO9JyDnG/Cu3Htvankzz/CS2tae7sC
	KDwdAl5lhABX2+aeuKLhea7GRdFldmwz12BGRLczfzFCJ5eYdHnpqyXtjKY15L1M
	FRMOotG9L4ujTKWHcjmfWodCc6Cia5h4JPtwFBT14Ul4bW7DQApKgs2iYOUPTlRW
	Q2LlZaz3cW89OCRvGNIQmc8DVXYzP1/mM+AY1/lLydAKRxpELBInQmsAc1/nnYOL
	xLDum9ZNVG0pJoStxEAYIVNVf4QeOkPKtP0M3+fNe2EZD75vwH0Ztd4gxki0MaqO
	dNvr4XpxUjw5uX6kuVleWAC+mifBGqolKjtIU3L5gmFiRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1a95a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 20:31:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ac559cbaso728954685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 13:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971462; x=1744576262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3SL3RFEF7ExCpjlHS1MAW+1sKINZb/uEY7WG2e/dtQ=;
        b=G7M64npDH1UiwIXQTb+xXjrTr2Gsz2V5Mwkg/u+sv+c/pkzVP+t8Gru7/PsU0L+WdD
         aI46Zkmkxa0jY03ljsc9Po2ztkgaLuZLZ3XdV0t1h4f1jjV8AVu5Cp7p0/kzxmYWuYLW
         LptOwQpWYf9qIpeO4iHMK8f+J3ph0NcoW4QoxLdOyMBeINCLcVmgdRekgYJfZhtGZ4tX
         kLOl2+X2mTNlKyfQCAwCzNzF2UCi1TKsFbvYVFwpCrsWjMJeYr4DaN6jKYeuZdzpQCqz
         sRCXK7iJVhEdiZmjyv1iYX8pw+2wOns/O2xEhc/GhQuHFzqmZnWEi8CLYhJxukHEUUpz
         QCxg==
X-Forwarded-Encrypted: i=1; AJvYcCWwLPcykkquLzzOai2w8g3AhrtFS1xWZeGhtDaev0wS8jEEGCwsuX1Cx2Ym3zPMtkJXYCxybQbGcy1IpdjW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1kvgRZybUCY1SlT/69w8uLkqPArPd7kBTHFWEGkhwSAI2bvH
	2/0YKBj41Uo8w40SgZ82xrzYCGWd+41shfeWDu5wS/XTldeQKYXmDP5RjjlnHBVGDtaNZJWQJL6
	ZymHcENPoEijA8S2D1wUesDyC9+udDJ8vLgqRHTskp2/ABLohrxlLBZZNT2SGwX70
X-Gm-Gg: ASbGncuH7rdTQXpYqVnFO4TWQVbE7jMCjsD9x4onEHlrnZMZhZq1Inw8oeSSRHqVQLG
	Nyr8cxU6CrMxTnsrMfio1d6B/kJV4sMFWn1OfP9+benpbz4834hTCB/WnOvNVe69Q980d7NEXQx
	1j+WiQHXX/mk1v+JStcBnlxneJ++2qsBnwM8jVFoXg+nTUXtrhZ9lHVFPAXuVkOZxFDR9/IdtAc
	b4dShbmohzlunHfamy6ye2FcueaRP2yST/ReVRH4nSnoog0Y1Oln1YaOgQirGaE4Q8AeCgel0cB
	roqE6EJaqzirF8cq9XiHMQengu4LA1e0ehaHv6yJPQjysKQoIIQXqMlpBBcjcDENHt5ep2XQJl9
	TnPQ=
X-Received: by 2002:a05:620a:2891:b0:7c5:57b2:2cb9 with SMTP id af79cd13be357-7c77dda1c09mr772035485a.26.1743971462515;
        Sun, 06 Apr 2025 13:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3veInaAbq3I1bKUD5eq/cfgw6MPpVDuHnLn0g2UE+IdMIGdhBMtA+oqNpUDXsimNCO2y84A==
X-Received: by 2002:a05:620a:2891:b0:7c5:57b2:2cb9 with SMTP id af79cd13be357-7c77dda1c09mr772033685a.26.1743971462156;
        Sun, 06 Apr 2025 13:31:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b908sm13667311fa.55.2025.04.06.13.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:31:01 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:30:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg
 override handler
Message-ID: <v6cra77j7q7gwwqcdylrp6eegdkcgtlhxbtvehfxhvdnaahp6q@emcwrbbzhyyf>
References: <20250405174319.405975-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405174319.405975-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: s9KS0r8NwzR-uCwaTMvpVmo58rDVkuaJ
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f2e487 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=MVnmeVZX-4zFk2mnhQcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: s9KS0r8NwzR-uCwaTMvpVmo58rDVkuaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=918 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060150

On Sun, Apr 06, 2025 at 01:43:18AM +0800, Pengyu Luo wrote:
> In downstream tree, many registers need to be overrided, it varies
> from devices and platforms, not only HS trasmit amplitude(0x51),
> HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57).
> 
> The device I plan to upstream also uses it, so I write the patch for
> it (Oneplus Pad Pro / Oneplus Pad 2, sm8650-mtp based).
> 
> In upstream, only Sony Xperia 1 V is using this, so fixing it for sony,
> in downstream, some crd, mtp, htk devices also use it, I have no
> such device, don't set it for them.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../qcom/sm8550-sony-xperia-yodo-pdx234.dts   |  5 +-
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 86 +++++++++++++++----
>  2 files changed, 72 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> index d90dc7b37..99f5fd32c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
> @@ -673,9 +673,8 @@ cam_pwr_a_cs: cam-pwr-a-cs-state {
>  };
>  
>  &pm8550b_eusb2_repeater {
> -	qcom,tune-usb2-disc-thres = /bits/ 8 <0x6>;
> -	qcom,tune-usb2-amplitude = /bits/ 8 <0xf>;
> -	qcom,tune-usb2-preem = /bits/ 8 <0x7>;
> +	qcom,param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;
> +	qcom,host-param-override-seq = <0x51 0x08 0x53 0x06 0x57 0x07>;

Other than Krzysztof's comments: In upstream we describe invididual
properties / overrides rather than just dumping the whole register
sequence. So, using a single 'seq' property is not acceptable.

>  	vdd18-supply = <&pm8550_l15>;
>  	vdd3-supply = <&pm8550_l5>;
>  };

-- 
With best wishes
Dmitry

