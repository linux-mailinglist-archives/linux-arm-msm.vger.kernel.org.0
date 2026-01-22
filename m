Return-Path: <linux-arm-msm+bounces-90097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDPyGDB+cWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:32:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B11605A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9FC723C93DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 01:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C935502C;
	Thu, 22 Jan 2026 01:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdFo5+cq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmsf5LsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B73176F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769045451; cv=none; b=ASFo/cOEwsX0+tYBDOLtPN2saIRNH6Lb+mjh9AIl+EavzNJ+D13alc4JiW57gNqFshvgaA5ki/R+BPUPjgds8MEr+pZ9W6mm9fngX/nj75Nb1/1vYF/y3zOBjvQjxPLTfnjxERp8ctuJPkdGavctlIP0jhjfwcgIrbm5B3YEVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769045451; c=relaxed/simple;
	bh=8EMPIW5vkoVeMObdD9o3/dWi5qABbWOngXVa6XorGi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FD/zMW3ggWdeLzTc/gdQbPfK1h6/JWVYq00qlAjT1KM9gc3w4wKsCQCN8rUKvrvn9OT/hbqdfBiCW5+lLy1Yo1TTTmHIAiY/9oPCgDEVbheHuRS60ByxaVrS+MCEQqjf6ZN8g6Njb1kXJN1of0xK9nWFjI4tSKMk23PNACWnKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdFo5+cq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmsf5LsH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOibs107530
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YRXguZAe/HWolTQJwqgVk2xx
	NQlz6f7cY1R7DReOXgw=; b=KdFo5+cqcEdLJKqdfEnyxekIOYIYHVdS33yKosnx
	6/j9jOCl1lQiB2sb1muDUgwwCC3/9UJsqx/4gLljgvdUkEy3CzsevV9x3P8s1Css
	biJp6H00Fyux83ztXkUHQXfVeGjwuKgVWvs13VVcpE/NLYFChsmPeSSsyC24knXw
	S7HmWfmeVqTIowUfkgEv3b/3a20E0UXjr4Ee3cF6I8EqJ7Sl4P10Ra3gIR4JaSOP
	3/vr0WuX2LwITmY222zbvI8/eJSFS1PTN8rTrC6wvV1m4yy58go2v8O48u7f3KN5
	nqJAHyM+hDNm09GDPQE8l8JU5zDz7eqczTcEuQoWrVevOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgrj8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:30:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5297cfe68so107812385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769045447; x=1769650247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRXguZAe/HWolTQJwqgVk2xxNQlz6f7cY1R7DReOXgw=;
        b=cmsf5LsHscUuaK6UEHXeorTxP4jPT+rQFh4t01Tjja6IRYQtCe8+Sj9v01Pkg25cHG
         dD0V6ghlI0sRPTvNQneCVVc4VjZtTV/45pBbePGJ2L/bf5o23JChRqaS3s/fpyJZNm2N
         aJwHVMDSlkEYxmFuWKg4cV0dPtwAorQ6DbnMNpNP1+G3biAW+dH+mrTnb7eNRW1CLO2N
         db4cdjkNcEOa7SBOXMnHO1MRl6zgxlfgZ6i7BX3fe0QN46ASkgIaqUPdcIvg6u94JQFo
         lJqIPAngut9EkWSFqnA/QDFdipK4gDij+rOtL/QUp1Y9/ci0jAm8oHXBUtPiujJ40jZi
         Dkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769045447; x=1769650247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRXguZAe/HWolTQJwqgVk2xxNQlz6f7cY1R7DReOXgw=;
        b=uldHPbTIF8UTtukScvxiVyEFY0rn+gjjziyTFWXSvznLGPvexkb4Sp0Fl31WmDYjU7
         NI+pj56VW6ECZ4obY93y2chq9u80+EbLAEOonnKEsS3LVR7Q/7D41K/KIhNPO+8f4gBv
         H4R9L16enzVeVQbQI0jZTAF8ysMflyn1nOz11oXfrgMB85k6HYTlGv5oravCwqu8uyDr
         t/haq6pxtOWT5XBYV+bpgmcF6eEHPiILxMG/dANjEgBlySKk6GF8FvbxHnB1HcOAXm0/
         cfSX8ugpl0kAUuPfttTDof5yl/n8xMGiPFodz3P6IE4NfGGbfEQSMVLkL6poIj9uTF/V
         wuDg==
X-Forwarded-Encrypted: i=1; AJvYcCUEIG05gDpHTdVFr+S/TGh5hjGHocMYS351Vm2jU1QL+HtV71kBJCqgrgWqGSky37JX5xGQpGFWBevMyOg2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6VPkocWMJn1sQsOFYyCvnk/pFkBddkU4lvKkWDBMKO/bLTQF
	St+GAM1TWSIunJmsFNyONmDZZpOnLBSy4MjtUn4vzF5DFOSw09+8h+F9x6+nd5PvDYcfG9bgjIK
	XydGdVTRnRjJoOulrwrt9FjuSoL0S1CeqeUvYLn+XRyezPBN1rkz1jcDHgB3Y+vXeRei2
X-Gm-Gg: AZuq6aLkk3SXnmMNMj4akW9TUbQ8HstIQFac+G70yD0M71YPKQV8bV8lHZ65v686i/m
	2isbEvDAYt/i+S/w9ixwhk3mzvEghLF7yx0zzDigFEExpyMnygKFKQcL3IALVZijjsGcqN9gPxK
	k6+0AbP28VeHKsZ0pC7c6nVGfwT5+f8PWfKg1i/LefiV1PBt+4hywIeZeDZuvqNGh0znnfHRzUO
	gSBpjE8fbvRHzbpRTpA64RpsJlSHpzpjCz1aPS+p15j5cHYHwcfhl1tsy+kcaSQRl9d2LbgtKNr
	MlK5hSdurwZ/+vEv3u6qZX6pAHskC8mhdUynU05jSSgwyVtCBFDQRyKKrniOlG/v+TyXn9E8f7K
	bVW174/Ogsh4Z1ZmKoq1oWqThKyizxmGBpVuwRc5KohJvvSfPWIv/90aWj+Lje01e4a3528HvWb
	cjg2FpqGrZKIKQb62nNNWxNLA=
X-Received: by 2002:a05:620a:290f:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8c6a67ad1a9mr2566994985a.82.1769045447344;
        Wed, 21 Jan 2026 17:30:47 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8b2:5cdd:6a16 with SMTP id af79cd13be357-8c6a67ad1a9mr2566990585a.82.1769045446788;
        Wed, 21 Jan 2026 17:30:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f8a1d6sm52282081fa.40.2026.01.21.17.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 17:30:44 -0800 (PST)
Date: Thu, 22 Jan 2026 03:30:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
Message-ID: <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxMCBTYWx0ZWRfX9pvHrKt/TMon
 ZiwfIXA6SxhtHvMu47+mUeD7WkKzIkJapuFwZiKsA93fOGko0YxFDRIgZsjvv4anYbi9f1tA+qD
 B/vRLje5ORhehfa/qMDvctaoh61FRBGzfYVsMCQqHxL8LDv59tA5dArUTTgSxHYqAguWKxp5wBv
 JtZ5ib1fETt5Vby3fZp0ly7VUCsRoqxZtTeTu8pza+bVTNNo1xLL5APlMURDwgDzRboyAFU9ZyL
 1mdHFSB8LHeE6jCYT+9x/uffCgBho6jIKdG9BOmiUvaFh2xDc/NrXb0jx3NvY1Qd2K/VRW8Mi8q
 3W88eXvwLlPUfD70mgJJKjzqHIewvGl53X92IykVcdADSRg4fEeAUqRcbBaMh9jL+tKA5iCJinl
 xAetNPij1P+fVa5b6pHGAxryjBQLiC/VG+LG5UrNCag8O3kqNKBylLZObCE3B7a/+hLNCg4RCYe
 h+TvO3yL5ZwXwhVD3Pw==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=69717dc8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=xr2jeuCrqBIryPMD71IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gtN3f22U1psoC1YzVsc7tD4IW59LK4Gx
X-Proofpoint-GUID: gtN3f22U1psoC1YzVsc7tD4IW59LK4Gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90097-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,0.0.0.1:email,outlook.com:email,oss.qualcomm.com:dkim,0.0.0.0:email,1c:email,qualcomm.com:dkim,e:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05B11605A6
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone wihout the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>  4 files changed, 1449 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..1ba29755e5ba 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>  
>  sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> new file mode 100644
> index 000000000000..141d92933957
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +
> +&i2c3 {

clock-frequency?

> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l15b_1p8>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				wcd_usbss_headset_out: endpoint {
> +					remote-endpoint = <&wcd_codec_headset_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {

clock-frequency?

> +	status = "okay";
> +
> +	typec-mux@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +
> +		vcc-supply = <&vreg_l15b_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_ss_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&iris {
> +	status = "okay";

With the default firmware?

> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
> +			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
> +			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";

Is it fused?

> +
> +	status = "okay";
> +};
> +

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 07ae74851621..fcd5a1a45803 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcieport1: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index d8bb40ef820e..0781dce7cda2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c

Something stray

> @@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  	of_node_put(phy_node);
>  
>  	if (!phy_pdev) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
> +		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  	if (!msm_dsi->phy) {
>  		put_device(&phy_pdev->dev);
> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
> +		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

