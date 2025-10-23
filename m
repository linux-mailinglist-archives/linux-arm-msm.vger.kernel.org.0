Return-Path: <linux-arm-msm+bounces-78606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A660BC01AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675081884E00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6714931AF21;
	Thu, 23 Oct 2025 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eS6cCU1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BB30E82E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228751; cv=none; b=hW/9uRHQbhKHnb+koAqD9lQoEJWHrTjqL95sPJ3tfwccd+G5mxXhqv2bJFmnzq4wutRQmAZmebav02dKmeyR9nUB9ccR5rdHNzEMzsnmX9RDegOR5lHaXA94lOVqFAt0RuubLky1tW0JSaxr8dNqSOpfc6qeHn3oZwAdPrjcZxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228751; c=relaxed/simple;
	bh=iyqybZyY5bNHA9SGCguGT/BlJQnLxb0v/4db1Mh7q2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JThcapIg8GUaqe6mLAKaM84OQZN/M+S/yhtC4EQFrl4Fyqou+MNnlTkqpcKu+PEF36at+1YMV1Z5nXHNq3o+48S9bIY4m6Q9MY8u4M3M0GaJkbx5xvDpxDzH7pyaJM2k3Y+OF+4RB+pmdfh8Z8OOuSlQrGAxKjKFeGQcxDxHvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eS6cCU1Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NDrgsj016169
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qeoOcO1veesMqEcPVFZpMChT
	izPuVR7yr4me7bFPRXU=; b=eS6cCU1Qe1GY8YuVesatReNHMV+5BoJ/qwZiQHW0
	5WBaqZjCLHGpKUus6Q2sjxRr4eU2kGrcDTHvF31z2MNergVkd8wLS5ZRRuyznprL
	c+qW08oBIrrUMrUTZ9SpAYenc+HcIi/cEOBHxoF0ByC/Vq7jiG8B7yslcVxoI0xC
	a/r8Hx/QLMcQb46j+Oo9IbUSuVO6bn2Zb07We0GsojGZrnN0Tzc4aIwQxP8ZsD4J
	8EPT4Jn+9zA7afzb52lN5FJ3ZqbK1xzRLqud+G955E3LjFGdyFXbQtJu9Af2WsPG
	PZj3Rbr8kMfQ2K+YFiE8zkTbDK0hbBeq5d1YQnUb7oaJCg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpse9xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 14:12:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54aa347b2e1so1946655e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 07:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228748; x=1761833548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeoOcO1veesMqEcPVFZpMChTizPuVR7yr4me7bFPRXU=;
        b=koPEJL/Be3lTXBznDqEzvQVvwtJpl9ZYj/uHPovsKjCGMFwsbwEkMjjsDICyYmqs4t
         i6gcZnqZ7kl4Z2RYO1/q5ClvCgOnXoSyyLgjMPe1Ky6C7/azpemPEgVuOtWYAFFF4DE/
         JkwUOaPs1h/loDIGziakhLGyXeapMPRJbd6R0aJoymWHvbgJXcV6scRwCjtxYg4OAx3n
         LBaj1R6yNKakPyDFqjQMupIO9v0nhXl/vTEriw8B//lOqrrZhNs4WFgPUD+jLgSkq5bN
         yzZ0gjR8DAPliK9cclfKv6D3+LFmgdfSVYrAT1UKPM/HKSG9zmme/NbapKBs1XRpSuqs
         HFbA==
X-Forwarded-Encrypted: i=1; AJvYcCX0/TTZDLjNM7nNkRv8/axZ36qacmXTDjLuzyy7Op7lWR5vT/cyexDd5ZYI+K3C6Jw0eNPv+mNUiQysELQU@vger.kernel.org
X-Gm-Message-State: AOJu0YzcvV2eLDdPM7lW3RT8BMxRkqwlnSVsT0zukRP1LQbrPj5ssyiy
	ndqPbomOfUl42PnPA93ZreorUaRbfzKYFH0aHNa0x71SRwzEMOwGmkewRLl3xZSJ2553rlMd+d5
	was8SocbhT6LIqy9RwXq60wKrmTjCM6dkBp3rxqtuj7UcXJnmUONa0YANFY5l/1p5q9aZ
X-Gm-Gg: ASbGnctZWLPACVNR8dyfaiVJldqgnxqU1/3elfgDrb+dwhjqwaMb0CudIwjWz4viZIF
	zlVY7UqBr9drFuV6poyxTH7kY15Gs38jYoIPZTa5vVMf0EpdAmbx/Tj/Oi++kWTq5rLTwdwBhWV
	ltmwaG/9s0OclOHBOODBAf/VY+Gwl1aKpVMHhyaw1IOokzSnUxlhqaNe08gWAyWIfLjkfapZIsX
	IBH4/1LE0p+xuPuGWY88lrQoutwuagR9dXMnuY3SH4b0FNR2vRa37hh//Z6XZoZ1B/2aba4ryIS
	6OuVAgBS72nlZGXRTQ/R4aZvvt2ouWVsDZtfS45ifqnCPGQw+fjxZhRNmS1ZCFg7FqNhXYLfF85
	42H71wr5/droUEepA6O5ylnr/NUmANR7Oz5n4G+WyH3ZD2jbD94ccIyjGViPMXjicHq0YfrOS60
	tR0M/QT2MfyhLI
X-Received: by 2002:a05:6122:4885:b0:557:c743:e14c with SMTP id 71dfb90a1353d-557c743e201mr404430e0c.11.1761228747635;
        Thu, 23 Oct 2025 07:12:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgbKo41PqVd7TUv2vVkrbVSOh/K8cr27Fv5VDy+4ClPVzLmIu3ASP4QAwm/TtYKYA6F9LwQA==
X-Received: by 2002:a05:6122:4885:b0:557:c743:e14c with SMTP id 71dfb90a1353d-557c743e201mr404318e0c.11.1761228745509;
        Thu, 23 Oct 2025 07:12:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d680322dsm4791451fa.47.2025.10.23.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:12:24 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:12:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add gpio regulator for cpu
 power supply
Message-ID: <3xxdcekqzn6hxc2zoavsge3s53czavpfs2evc3ot37aivw4rib@uee2g2mem3hx>
References: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfXxwxj6OaUkthn
 pRHpqDvYU9zuyEh2pOP8eg/riAiS/i+Y0bDjt09nH/2X3N6n04EwREfVoNj3i6ODRDrw88iihkm
 hvnAE1y3pkrMGqcVxT34PxLN0OYBBSzLkHoMQj/6vlEBwMGUIvhprTzV/VDFitS6Os6JMNrBLlJ
 nU3+4Hw1sutDn/NoECcJbkNaENXQkuN3iaNtwMhruEmYdMb52w+TH9k5wfBXJ1OJ1HvN27m2D7j
 cSAIcEJTRa360SJWQ2R0BZcszOndXaevVmKCPWenubXw/XIQ6kFTFq3NefiBC7CF62N/b4L2BKy
 xZGW5W40lNd9rGdXPVadXYBgz0kHbOQwFvJCn4/EEtTBRuJ5g0i1joaxCtq7suwmDTi9JGGeHll
 oJjYlfiEr640sGhbz2+57FA3l6IX0w==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fa37cd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=Mip_WMAhk2IpQyCGaMUA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B5K_nxo9rmTUIr9phLJqhyB1ByGdqnb0
X-Proofpoint-ORIG-GUID: B5K_nxo9rmTUIr9phLJqhyB1ByGdqnb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On Thu, Oct 23, 2025 at 09:32:24AM +0530, Manikanta Mylavarapu wrote:
> Add a GPIO-controlled regulator node for the CPU rail on the
> IPQ5424 RDP466 platform. This regulator supports two voltage
> levels 850mV and 1000mV.
> 
> Update CPU nodes to reference the regulator via the `cpu-supply`
> property, and add the required pinctrl configuration for GPIO17.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 24 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  4 ++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 738618551203..6d14eb2fe821 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -46,6 +46,23 @@ led-0 {
>  		};
>  	};
>  
> +	vreg_apc: regulator-vreg-apc {
> +		compatible = "regulator-gpio";
> +		regulator-name = "vreg_apc";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <1000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-ramp-delay = <250>;
> +
> +		gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <850000 0>, <1000000 1>;
> +
> +		pinctrl-0 = <&regulator_gpio_default>;
> +		pinctrl-names = "default";

'vreg' > 'usb'

> +	};
> +
>  	vreg_misc_3p3: regulator-usb-3p3 {
>  		compatible = "regulator-fixed";
>  		regulator-min-microvolt = <3300000>;
-- 
With best wishes
Dmitry

