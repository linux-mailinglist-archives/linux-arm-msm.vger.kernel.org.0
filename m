Return-Path: <linux-arm-msm+bounces-56602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EDAA7C81
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC3D1B67021
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EAD21D59F;
	Fri,  2 May 2025 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnMuuV/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D89215184
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226565; cv=none; b=r6/xobyI/kjWqY3k/jIqlWKsPhVUfIkC5tmVSy4wJQmquTAM1Qe6hslj1UPfs5ytNuDnTPz61LNNY7B0MJUyCfAokpd9dTJfw9X7nv9yWjBy6dQyAGuDWIJuXNgYSU7ohS0glA9ozgsm2ldkINJECwxqqUVVN/WWRFwhrgn/U78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226565; c=relaxed/simple;
	bh=8ztnMAKmbdyNsPGlxL7edxZO62BJYChUmRhguiclIuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaHcbXupeNSJEijH676VhqS6idpyHoRRvMtgA+9sO3NIf4DknoBXfrqgxlxRSoSsv7W/pGO9tQUtk7A7uc6twvyoTLM+D920Rh/arxbce4GX2QXjm/vzELxHq+TQ4Eaj0eNhFoHHiqIzwIUxbpGFj3eteK8IoQJnP58se39/3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnMuuV/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KApA1022442
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 22:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1bOVgb8M6+D/Cf10VFmMIFoe
	5eQvQy5G8sTzJf7ev0Q=; b=nnMuuV/ukkrbGhT8RV3E3LdTpcgexym3eyUUA4Pe
	PB6PEsvGuek01R4Ao3fgmRzWOs6Qqog674w4R6NDeigYetsqsRcsr6D/AMZ6DgKq
	MARFHQp8u7UsR4pytkuex7dYtswv8Mz/21ytIjPxmJDhPU64/tiIjCetJcCj0nvJ
	jWyUGe9At2Mfahn5GC3UuhZ40aUi4XsALFgPLQHfCinautOjMg0sTrUeTJW7+blr
	GLXr9n5OrLCk5ufXn5S8HGNIm1dzi52tpkv5c2Rz1yfZH+J+/9f13a9QmpB0G8og
	QJrHCBcngKNHZJKH9SdOHcjRznODVtK7KaS/vV/TBI1Tpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4hkst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:56:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476753132a8so23871071cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 15:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226561; x=1746831361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bOVgb8M6+D/Cf10VFmMIFoe5eQvQy5G8sTzJf7ev0Q=;
        b=PFIrJRZBxhNZvGQbRhApMffl75gmXWLQni3QTDArV0v4SRTxghVvMv/KapLPz24bGW
         8dcsovhI+p9oNrelxAy+WTGlc4H7NRJo//znRIj3zEt/3zkKftdPkATdFtVWhOq2GnF1
         aDVIDxI4Gw4E1B1qWL9e3MqeqOG3ZssQiVOlVEeYcme1DOUYAvG4kvQkMr2s4IOCDB0p
         h/LFUnyNij5LbAT9L37znhrHzgoc/PaBC7um5vRGSQbulXUrgyWd7d/76ZZwhMu13kSi
         mQw8sJwGLmTBJu4H/clk1B4NHBb/AAUZ21LEyGqwCwKibKKVDTBXK4wEOTnaIlonpkDQ
         1jbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kRvouN4Kgz0F8Qc1E74LC/ZxEVXywFgHb6AARlF5SDsfVN8dWjcIBMGi4RmDEGKFm7PHjI0gKhsR3zlr@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFw+W2/9Eeg9KlI8TM2jjQpJbAYvJFQtd0q0J0gDFQFUEHcmh
	4KLOMJdZhjGSVTVfxhMW077c54FLYmTtAcHwE5tR6mT585hUrmcYS7iXtE+RSurc6jAhu8yks8n
	tom/WepmRJ+fPSTAsgB6iOXpbQlSVbv/VU57+HH6ixPrt+yriZCYlmxH09hvxkxch
X-Gm-Gg: ASbGncsptvSrkwBQXKWk4aT8tJU4jMvE+aP7xi9TjxSYkRo+ozzHCxf52452s9tPb8A
	gJrjx1MaCXUUT2N8eAYURTM59qz0dPShNm5uwbBY9YITY+CylYo8RxZ9OHr6JvacfwX28q37QGs
	LltFScIKPG9dYw+9YgR7KkNeqicSWt4wlccv/dHoyAoDuXJ42ll4Q//d5gHcU1f60EJuMlvqfBX
	YrevRrLmPb2tbOMqDeTVS4LvVb8ab9XlFwwh2Fxr2izarPR5XTDifGgLXLW7skfI1x0IqAQ7/V5
	IuZ7YRsx9LjxMI59RsaOQ2d/y1XoSShNP+mF8lpwqHA6Hok4o6IbqXPQ2wyTt2HCMG3DnBqfINE
	=
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701931cf.8.1746226561603;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT8z6Lg3ovxc73cJTMCXyVkvLsgnAqZM902lh4jo0RicuOeI5EXmmvrbC9puKXeOOVnqrsqg==
X-Received: by 2002:a05:622a:1924:b0:48a:2122:5047 with SMTP id d75a77b69052e-48c30d80312mr77701501cf.8.1746226561049;
        Fri, 02 May 2025 15:56:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029019c4dsm5052961fa.46.2025.05.02.15.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:56:00 -0700 (PDT)
Date: Sat, 3 May 2025 01:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lgh8y-dNXRVNpPt5p4VdcXdjnCWD50GS
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68154d82 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=G4SMBwoHVf5iV8dplL4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OCBTYWx0ZWRfXzSZVV3fjrahA fER563qTj2zsBlhgxqcZgzY3WFOq/TkXJEat7sy/b+3ixN6fSfFcQJqZKg6lVKuy8AsqJURx0li 4ic8uDi9rB6Wr4dgUJYiIOYnNPpVxirS+G++K0oVoj0FbW9BubP+kmoN2eN7KJIHaQ7zr59ETPz
 CoToCoZwlwlvLPNVZdo8ya8hBxRgD6sppZEtY5tBvC4ZZHHyxFxo783R9ivDSKKisHu76PNFO7l wDL43BSBOMea+sBSzwaBLKUas9XSc/6Pn5/OkjgHf7VhCwH5x9vEOm8EQj12YnTrwKy6WRPMSno GtS91/FSP2eQbgOjWf66M9GuQjXrxOeFB4BI/6McgdF7zD37vk8MYgtULRxXfQZgwPxdGmJMrKl
 GqadA6wkuUzDf28eKO9S2R0IoiyVM8aGJwwuXRwFRuL62mdBwO7HLmCtR1cHVqUjXuCvZvDm
X-Proofpoint-GUID: lgh8y-dNXRVNpPt5p4VdcXdjnCWD50GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=496 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020188

On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Have your tried enabling it for X13s? Windows drivers provide
qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 72 ++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 3f9195da90ee898c68296f19dc55bcb3ac73fe29..75ec34bfa729946687c4c35aa9550685cac95a10 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -695,6 +695,11 @@ pil_adsp_mem: adsp-region@86c00000 {
>  			no-map;
>  		};
>  
> +		pil_slpi_mem: slpi-region@88c00000 {
> +			reg = <0 0x88c00000 0 0x1500000>;
> +			no-map;
> +		};
> +
>  		pil_nsp0_mem: cdsp0-region@8a100000 {
>  			reg = <0 0x8a100000 0 0x1e00000>;
>  			no-map;
> @@ -783,6 +788,30 @@ smp2p_nsp1_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-slpi {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <481>, <430>;
> +		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +					     IPCC_MPROC_SIGNAL_SMP2P
> +					     IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&ipcc IPCC_CLIENT_SLPI
> +				IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		smp2p_slpi_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_slpi_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -2454,6 +2483,49 @@ tcsr: syscon@1fc0000 {
>  			reg = <0x0 0x01fc0000 0x0 0x30000>;
>  		};
>  
> +		remoteproc_slpi: remoteproc@2400000 {
> +			compatible = "qcom,sc8280xp-slpi-pas", "qcom,sm8350-slpi-pas";
> +			reg = <0 0x02400000 0 0x10000>;
> +
> +			interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd SC8280XP_LCX>,
> +					<&rpmhpd SC8280XP_LMX>;
> +			power-domain-names = "lcx", "lmx";
> +
> +			memory-region = <&pil_slpi_mem>;
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&smp2p_slpi_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> +							IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "slpi";
> +				qcom,remote-pid = <3>;

No fastrpc contexts?

> +			};
> +		};
> +
>  		remoteproc_adsp: remoteproc@3000000 {
>  			compatible = "qcom,sc8280xp-adsp-pas";
>  			reg = <0 0x03000000 0 0x10000>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

