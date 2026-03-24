Return-Path: <linux-arm-msm+bounces-99483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN1SGeflwWkYXwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:16:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC14300661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 340DE3019453
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A4B1DDC28;
	Tue, 24 Mar 2026 01:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/V2NVdP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UePgi22u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6E1DF248
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314979; cv=none; b=Z7SrJR3fkVFbgGp6FElEXIrMsZFQXQcNTmTHmqdF2p5bEolvg5d9Xl5/6jbJhgaolNV6CbTsCfoLAT7JaNoSo68MvVubRULRyoCGABeOwEz4oXQtY+RD0GVo0t4OaRb8icD2Bu1M73y1GUX6y+xH7sg4NtILk4ypVADRM/xIV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314979; c=relaxed/simple;
	bh=1l3+Va5sqYSJgpgZYM+gzU64csJMw/k3cfhpHLNp6os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUPKgAQABmtgmahdy95JOOrTEvAWzuc+X4eTgWVkZa7D5x2tIYUMq2DuCYBCKoL+crU/RkQx0dAKUqFyueGC3U9HaRISnTPKDaOR4axdPqB6jVEiU4oepSF9pYBeYtjhul5UXAHtlyUqdZzcqd9LHHsnK/OuEA6hPoMlzgtiDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/V2NVdP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UePgi22u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqqZ23934910
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rsxzjbt6r5Pg4/NOwUWiiQIv
	8QhVIonCXubO1twg9k0=; b=U/V2NVdPGkzCZlRq32KiZVF6b7psyalPqbSkGZSU
	Ei768SswfIgKwdeSjsgcxpFv1IHo05uT+AufyPaZtTGTrYC4QNYL1AQyjg19xl8T
	YH2hac04wFkCLXD473GM/hfuD8fM2tln9qj3hkr2SYBp6pSvFve3CgijoucptBIR
	j9n31n/Fnc0Yjq8XD+TnC7AniYPhOsQ1Ij4vbcJ6i3DKJyfPGYdsLyqJ3sSA3EBI
	dVeg7v2mZ0cQ7UmcZQLUngEHGpSAhD0CM2ILkx5Awmh7JKZm0sOjglQHN817dRuL
	ERvVWupRI9UIvt1si/TYleAabWqQE2kOkTGvPE6lEq7zhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0j1du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:16:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091a96f0bcso198722321cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314977; x=1774919777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rsxzjbt6r5Pg4/NOwUWiiQIv8QhVIonCXubO1twg9k0=;
        b=UePgi22uVZp1TbxtMr1ES6aibsCZjszIRaDPrlFbTdfPK9MjX5NUxwaPwZGLGtQE88
         AUh03SC3+/tTL/UIpEgvB8PQlOO/EV6C0Hv+I+Idc6GKRMUo9+nThXZDXeMvSgygtaAi
         xxoiwWgdDITbLOb7M9duG/DYLSJw4cg6gJhX1Z1IMCi/EEIO5+ZK3VaHbqzHDP+DONWr
         u/7rsK78TSS0DovwDWwK3m9D7EAv7LIG0WXK581fIz33d/8JhCqly50JVkZi0+Mgsvm5
         GLDKcwK/uK+72T5mAOYDtK0cIUM1tM6kabD4Lcr08JOYQX9NAc3aHOJcvm/E6ptexYKW
         Cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314977; x=1774919777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsxzjbt6r5Pg4/NOwUWiiQIv8QhVIonCXubO1twg9k0=;
        b=Q2R/CNoPLg8OA+U4CQPz1YHER44bDnfUpup9bJXCa+FMzE5Wj9A6ohCZAvBGm2GZlV
         sWW8djF29LjzPEAFMBN7lcJEB/sQPKC7Z+T+ArCqHOCntdsPM86mW+5dpHn30YvEjgR6
         G2w4YTMVB5wzDbPMYkB7aM3XwA1De2ozipveHmC+OXdC61fv/e9+Z2XaPaUDIzfLnYAd
         QEJer7WEBhRUcgwfiLwG+zIH4BdWpKIyBdhimRABVGiXFZhtx85ZjBM8fp4jbnnzmSA9
         n2A1XMhuQKSa3qVrrSSpgew2tgi3vXh+fIDScW8VUvzGIg0fpnQ4VykqiFUTz483mDU0
         ZrAw==
X-Forwarded-Encrypted: i=1; AJvYcCXDxTBZJcYkGgTEGNKesH/wnpmOasIUcWYBWmpYubM6fiShUPImnjYsFe9/HfhvpeynMkFtQFhzbimX3Qxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mV+txC1f+dB45NbN5LGeUPlJxsc9sIM7dcZ82T28LZcgp6a4
	sKX13ANM46EaxAr5BCzRCz5p5U5SJzbtY4sKjRBSmjin/Pb3bgCGFLu21MoY5gBdwtJ7w6a3x0L
	E0oHLQw7Z7xFUaBhqs/MvnGB0yobJYwF5VZjWY8Ocj+i21OIcO77RfAy4wcoBF+xMnfGw
X-Gm-Gg: ATEYQzxyeQpgNmxc7WMjajAIi+LZZwpScG0gJrfVY5KbjMjDyPTu/twUeTaL4tMbkX6
	iUTWDJdaeB8lea14G3o5X1kd6B7iK2ZtgxL9KWvqneisHBtG9/V/eZEyMlPVvTXplsfnpKuTaRN
	pvH3MjgTYjsqYc2gcR0nf6dp/ZI3mPBP5HBARHSB/cXHlMrIsiy7AksOje7Bt3073X6vkWPxdW/
	h9yFVR05MBO/IsHt3QLWMbAAMrgVWMXbnKr1o298RcI1qBeudBDZED6uNxcEaJKTIqEFP5YMYpe
	s8l99fdGfHMGt5qOur5x4FGCEO53RIriGbCaaQ3jlS5gytLTTZRT/pc/VUcva4src8a8xWOFy7r
	i/VabKesybjeUIgZ8fRLiH8F18h/MJbSkQSa4/SIFHCtud2c5oJjHRYyp/35cURdOpoWc+z+s/u
	3hyXQ6Is7aLVX/p0+LApt/eUx9oLwWL8iKups=
X-Received: by 2002:a05:622a:1a9f:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50b37a6f68fmr223443341cf.44.1774314976894;
        Mon, 23 Mar 2026 18:16:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9f:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50b37a6f68fmr223443061cf.44.1774314976387;
        Mon, 23 Mar 2026 18:16:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192be7sm2840169e87.17.2026.03.23.18.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:16:14 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:16:11 +0200
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
        Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1e5e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jW_e0x0zkUzx9qZkMvMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX3+V44e4/yfTi
 vG4ethRSx7aG1Fds3Pv1qHix4B1WRobptlDiQJNjFiYWOtcsJZwbgOPXIqi95zTHLSoPF/uUuRZ
 N6oF+FOhCdtMh/qeuoaQdxbyCUVKIii7ko/y6QIrbgxbYWt+n02cbH8O1iCAS29XXSaijCV0bZm
 gLYZJe0hHSINw/e2dMpiatwA83iUeTRXUJMGurBL2pMAJ385z/OG9LuDAG5VaeWrF380W/OAMWo
 Za6fDwmfEj/w0jryygZ50cVpMQR37jdAbYDgNiKqyxRvUy6zKIikYMB+H0fl7islOF23y9N279Q
 3pV7r2W44WCORrKKAQZhrJOA6GVh4UO8tuOCIas6w8IMLG6GHcOcUppKdt6NKEdATfshsECx+zB
 ujOV8jcaBRYlrNK98AN3ayv8IdOPlu4S2f6LEat0d9/k3UgmSxaUlsL/k8yA0SE328cZEtBaGH6
 gCua4SroMvOPW8/3Yaw==
X-Proofpoint-GUID: LH1QrDF7-6hx4O0-ibYdQqe26fe5k7PR
X-Proofpoint-ORIG-GUID: LH1QrDF7-6hx4O0-ibYdQqe26fe5k7PR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240008
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
	TAGGED_FROM(0.00)[bounces-99483-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 0CC14300661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 11:19:44PM -0700, Jingyi Wang wrote:
> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
> 
> Enable bluetooth WCN785x and Wi-Fi on Kaanapali MTP board.
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 121 +++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 5054c5933687..d0f3909621c9 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -27,6 +27,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart7;
> +		serial1 = &uart18;
>  	};
>  
>  	chosen {
> @@ -189,6 +190,68 @@ wcd939x: audio-codec {
>  
>  		#sound-dai-cells = <1>;
>  	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;

swctrl-gpios?

> +
> +		vdd-supply = <&vreg_s2j_0p8>;
> +		vddio-supply = <&vreg_l2g_1p8>;
> +		vddio1p2-supply = <&vreg_l3g_1p2>;
> +		vddaon-supply = <&vreg_s7g_0p9>;
> +		vdddig-supply = <&vreg_s1j_0p8>;
> +		vddrfa1p2-supply = <&vreg_s7f_1p2>;
> +		vddrfa1p8-supply = <&vreg_s8f_1p8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +

-- 
With best wishes
Dmitry

