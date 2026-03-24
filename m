Return-Path: <linux-arm-msm+bounces-99485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id derDKS3owWnDXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:26:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FC5300794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AFED301CC83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966D4363083;
	Tue, 24 Mar 2026 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVgJBXqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsZQGhIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDE33A033
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315558; cv=none; b=VozbsPhG4CEvqh89iqoVziS2I/w6dp9I8DCh8PRU8qdsa6JTlr508avq9ympabpv+2V6JMMN0uI5LvlqTVbTEpo5qQCB/+lfaqCsybpC1KXKQRC6NyZRcjV2r2jDm86oQTbwVFqGS0bshaE4qruhzuRtBedZeT9foRBxzQBgQHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315558; c=relaxed/simple;
	bh=+fAPpI8XseDU+6+0+RtYGTb+1GD4gDCQcjGyNZdkMZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyEGlxHfs/Sms+WrFSK8Tn+mBK+AeahaGXYm9laf9RxDYJlGAuOm/tJjplrs4XBVWX/cyXd/4ydvsM/gXUpfc6eCIZaC4F+iAR4ski/XzvbZ56dAZ2NdNNyejWUcjjPqjAcatiSWqu1mbTB8y7ep02C0TqQMBoAPZ3E5XdaKjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVgJBXqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsZQGhIv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqqa43934910
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QCMAOd0oXwbfp37bMDassmgE
	guc4elFKX6KAbbU+uPk=; b=YVgJBXqbqJOCRO9pDtsviH1fILPSWLSSDVy5/JXQ
	AF2u8Lmt9Itj0BDZdEcn4FYd3K7KbailcluILW6M92YZtRlvyP9ZEfPAGXxSLyZF
	gcQGGMqD+pZivNFoM3XydjdV+NiiPWCtGDhl6UTi2+Y7m3xFWZKmN1Y21nVLC5Kb
	wLZZHB9nPMCX3uHwJ7j3T2AjFqsAuwM39cpE5X4X1LLDm8ySah4J7/wRlgBU69UX
	qEFX14hMak+w7ilibGregE3erE3htTf/hQmgAuKiXsItmsvtyKk6e9j8u1C8LxE+
	g8wHYHOug1RPpsy3D8L8WSUwiB4FqHq4Yx34Cx11eTHRGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0j292-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:25:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so357311231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774315555; x=1774920355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QCMAOd0oXwbfp37bMDassmgEguc4elFKX6KAbbU+uPk=;
        b=UsZQGhIvuchRBXq29RK8x6BcIncRJ2BTt3p4kRXOfOWnVU6r06bk14iQYdeYmw1qUz
         agkhnboMO8tWXEszDZ4VdzqQRnpwO4NGTPFSFz6wi3OHTDECOLUKnzfK4MqXTTBmGW2/
         BdchWcdeiDA8dlMjxdzM/KLcSw/gSGgN3A2IoNxB+Qvug7vbsX0Do8orWJjQ3reW6m5p
         52jV8AeCdyvMLY/mykGHKhOC8uHdbqApbdnQXEsVLQ/MtVlrCL7rSCs0GnkaWoKY3Qey
         19FI8PiTIkPHj3xTkry7TA2VtQ6+CykOtBj+mfoID+9507nsBbV+pZAvdHV1rLbcHCVD
         Cd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774315555; x=1774920355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCMAOd0oXwbfp37bMDassmgEguc4elFKX6KAbbU+uPk=;
        b=JHS2MHN0hnlCFgqXwudFBMCZrKlWekNkfbalaWeB8NObPva6cd5KDf7iftd6Kp7G7C
         Ismuv8BRbuivT+DEKyN9Grtu/4Yl7KXKtoH2HMKiHbQgSsbzrsy6SPC9HJ95P8+tnu8A
         Va+n2cqTBn1c/ROqcN3nPkYOWKwFs52lCpn3J+O0toFVCMlkrMA5K54dCnJBMLDJ4t4l
         Hh8gAg72lVTwhEJLcwZEIYc2ZzTWQIUyt7Ea0kAozq8sHd8F+TLFBhi/1SdfiBa3tI7e
         dVlPzqzWkTXbe22dp/v3gW4RLPtPFTq2pOjwev9NhPdFKOxOEUEeZ+hqEDwvmbAohYhV
         PDyg==
X-Forwarded-Encrypted: i=1; AJvYcCVjLnqe+dF8cScb2lmTuyDilUnSI3RtAr8McFQxUueLNz6clxd7NRNcEdLcOZwkvtnClnJWpnA3FEtT7tID@vger.kernel.org
X-Gm-Message-State: AOJu0YwoinuS2TxyRk7uWsHK6BRudQ7qON9QjJe4t1AD+ji+socDiJl8
	DxKCRK/zDBB6yrfUezwVmZFzQ/mD6J3L6/v8GltI8glAXOQQ9ULRRDciVE3D1UFsoXqFrXUTYvx
	0Kenhf74f3P8F262NeJ6mOMovqkAzLPNMtccdDlv8mGzCDJLw62hkgLwpNrfhOu8LtsJLWOe9hk
	Dy
X-Gm-Gg: ATEYQzzt8v/A/vuVLTGYl/SVPrkz0C6PbjLIITXJqksyvU+swkcnLzeUCKhRL5Vg9WU
	4/FV8AcVrf0wUVM3GBB+QrHihWxpV9p+wJGrndMTvmmiEvcc2WcCl/i25tTff90uyk4cA47d3O+
	bx2YR3NeL8TSyttP3nOABzom4wNlOG47OMmYMdniwstkOW5NQc0FpFuehCtG3B1GZrkdXU2HA1L
	rngu8AwPmdlhq/ZQg90tZ6mkJaxMTRQc+gdq3+jD8aq4meyZanU3+bVZxhf2D3pPgBMj0UBdoyM
	KSKBZ7XjM+Spur6ZOHLXt3k7nTYq1lyWs1OreZGhgj6kEFFLUAVTjhnNVfs/RYsivtIxY56S6MT
	vHWdxc7wndibheDY/s4WHLtKpBrk9PZJzjRefpM9ZGumMrmxZPWjMXIL0NyGYfWKg9t8GX0aQ8p
	FulS8/TNEEXP6bw42ZuBmheIebYvdv+/FjcKc=
X-Received: by 2002:ac8:5a8f:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50b4b2f1a74mr153890021cf.2.1774315555377;
        Mon, 23 Mar 2026 18:25:55 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:50b:4b2f:160f with SMTP id d75a77b69052e-50b4b2f1a74mr153889691cf.2.1774315554786;
        Mon, 23 Mar 2026 18:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa3575sm31492721fa.30.2026.03.23.18.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:25:52 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:25:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: kaanapali-mtp: Enable display DSI
 devices
Message-ID: <d63azyfpltbsicmmv6xjz2myttfkcwalm6akhbgk54i7udi2pe@mbztt2kz7r7s>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1e824 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=-WTkcuLTe7QwxQcHvqYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxMCBTYWx0ZWRfX/UUU6Ql6LLjq
 1TTtpvHqYvlj0U9YZS0gnX9gZVNByfxEhUy9HFSt8sELNeL+CmbzMBO1aiQX04DthMoSpguR83u
 xgcyqqR5GzzKk90NY7meao8R3+0lNr4cT2aEE2lIXoOuP0LLhCvUKcGAd5Lm6n+r2LZVtHEY9v3
 xD+gEtMK1J8P3Zlc/fZL8n/2/40xBM6FU3g9fE+ZSAYEMuWgEBxqQzt1XIocrWicuwfNhtMLgaY
 o0R4CewbSy7jL/cu3+fLQ0E7DMfO1IkdckkmOHZJW/VdIZxDsymJVSSi1O52QhivQojMaiimCu7
 7rmWIpaSGFvVVdQxoK56iapgOmWZuDmonv0u0XpfMNlNQW+srblT5gvq0Sz7aveqe9myb9/Hzku
 GsnUQLH1c919I8zxeaiFkr50qzhkDHpT5TDiBUL1KyvMEfcCjpjuqdMwTCNAzKAM1p0bFOKLetB
 y238l1+EAIxasDvtb3g==
X-Proofpoint-GUID: C4xUG6YTbTu8imsSjRFdqBx2ntxQGjj3
X-Proofpoint-ORIG-GUID: C4xUG6YTbTu8imsSjRFdqBx2ntxQGjj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240010
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99485-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36FC5300794
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:19:46PM -0700, Jingyi Wang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Enable MDSS/DPU/DSI0 and add Novatek NT37801 panel on Kaanapali MTP
> board.
> 
> NT37801 Spec V1.0 chapter "5.7.1 Power On Sequence" states VDDI ranges
> 1.65V~1.95V, but ldo12 ranges 1.2V~1.8V, so change ldo12 range to
> 1.65V~1.8V.
> 
> pmh0110_d_e0_gpios and pmh0110_f_e0_gpios are configured for
> level shifters. Kaanapali need configure these pinctrl for panel
> function.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 118 ++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index d0f3909621c9..07247dc98b70 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -375,7 +375,7 @@ vreg_l11b_1p0: ldo11 {
>  
>  		vreg_l12b_1p8: ldo12 {
>  			regulator-name = "vreg_l12b_1p8";
> -			regulator-min-microvolt = <1200000>;
> +			regulator-min-microvolt = <1650000>;

Separate commit, Fixes tag.

>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
>  			regulator-allow-set-load;
> @@ -873,6 +873,51 @@ &lpass_vamacro {
>  	qcom,dmic-sample-rate = <4800000>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l1d_1p2>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "novatek,nt37801";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active &sde_esync0_suspend

Why is this esync0_suspend?

> +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend &sde_esync0_suspend
> +			     &sde_mdp_vsync_p_1p2_active &sde_mdp_vsync_p_1p8_active
> +			     &sde_disp0_rst_1p2_active &sde_disp0_rst_1p8_active>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p0>;
> +		vddio-supply = <&vreg_l12b_1p8>;
> +
> +		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l3d_0p8>;
> +
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	pinctrl-0 = <&pcie0_default_state>;
>  	pinctrl-names = "default";
> @@ -970,6 +1015,42 @@ bt_default: bt-default-state {
>  	};
>  };
>  
> +&pmh0110_d_e0_gpios {
> +	sde_mdp_vsync_p_1p2_active: sde-mdp-vsync-p-1p2-active-state {

If these are level shifters, should they be configured as a hog? Or
should they be modelled as regulators?

I'm not sure, how do we handle shifters and their supplies.

> +		pins = "gpio9";
> +		function = "paired";
> +		input-disable;
> +		output-enable;
> +		power-source = <2>; /* 1.2v */
> +	};
> +
> +	sde_mdp_vsync_p_1p8_active: sde-mdp-vsync-p-1p8-active-state {
> +		pins = "gpio10";
> +		function = "paired";
> +		input-enable;
> +		output-disable;
> +		power-source = <1>; /* 1.8v */
> +	};
> +};
> +
> +&pmh0110_f_e0_gpios {
> +	sde_disp0_rst_1p2_active: sde-disp0-rst-1p2-active-state {

The same.

> +		pins = "gpio9";
> +		function = "paired";
> +		input-enable;
> +		output-disable;
> +		power-source = <2>; /* 1.2v */
> +	};
> +
> +	sde_disp0_rst_1p8_active: sde-disp0-rst-1p8-active-state {
> +		pins = "gpio10";
> +		function = "paired";
> +		input-disable;
> +		output-enable;
> +		power-source = <1>; /* 1.8v */
> +	};
> +};
> +
>  &pon_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  
> @@ -1128,6 +1209,41 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>  		bias-disable;
>  	};
>  
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

It's the same as _active. Merge them.

> +
> +	sde_esync0_suspend: sde-esync0-suspend-state {
> +		pins = "gpio88";
> +		function = "mdp_esync0_out";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {

panel-reset-active-state

> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	key_vol_up_default: key-vol-up-default-state {
>  		pins = "gpio101";
>  		function = "gpio";
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

