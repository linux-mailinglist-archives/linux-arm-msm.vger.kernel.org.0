Return-Path: <linux-arm-msm+bounces-60761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D89AD3488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065CE1676D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FED28DF26;
	Tue, 10 Jun 2025 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozUwuk4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C228DF14
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553649; cv=none; b=qiS3sdg9Z0+42DQ3VeFrrjci1YT4eT2cxkKp1bUUrMJbeots6s70SLb9dLWlgcK41Jlogm5Y85k34FmO0MiUP1F9OI0lmPI6DRbCOTRtNACVuGRxXAg8hlkkaR872AknJfCbDSAtdm10ESCjLTU0WjQvSF5k2UR0riVSxPHa9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553649; c=relaxed/simple;
	bh=UPlSsOeQrv5JUW5Lfe0X5nkvCTI9hlUwH96nurL1irc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKxmV32YQxGfD7mBNbDlw1IqLfhYEPtjCm9lYQxc/iYZ4mjpLRH6hl1huyt3VxuluneAYDhNKqduNB74q22T57YiReJLPX0FMYmHH/waCcmcYgPh8Cj5Kz4o7UHHYnWEbFBtFqHJmPb23lBlT75mIP3uCT43cOOoHq9s1F7MCeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozUwuk4p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6fkDY003617
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=67IOVthVyAUCNLQvy2dAGJFK
	71qcOVj/j2a2DCuKxFc=; b=ozUwuk4pI0e+BxTK6z0TRimpey/N3EVTyiLkO8F/
	ZdhOSPQny7XTvFSQtffbeCuqqhPCZhVcUfTxOOwAlIJsoJztI3ck/uc/lAMXBcxQ
	2CkfXC9Y58MUy9wKtnaeSLhFEE/Iy+gp/WxWMk4uXl/z/rdE8nZqg4WPcFBNz4+K
	+nPw3fv2LnzRgJYv8YObNiOedcMZOCahxWelcy/FEIi32XGtuq8vTck+vFh2Vsvp
	jHHS17fUDzCywifq6rOXnC1Lm5hFSPciCBNMFebGqVvptcWfnEBGJmyYyzEztA3I
	Q2CU4gQ5O0p2w1WTnWWqjnT4bSMQsqRdwlSzlfdU0uaTNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y3yp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:07:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0981315c8so544018185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553646; x=1750158446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67IOVthVyAUCNLQvy2dAGJFK71qcOVj/j2a2DCuKxFc=;
        b=dzySvYHiBKh0MU4+U3TlX6HE/+FpAen6NBpYMfTBWTBQz3ZfOCerh7oF9jFDIZn05Q
         +NKHvAD7i/oFXW2DlD4Oj9OQQ18D+r4r8fF+PVOkBfwYAXSKiMMXNYY4rkSGSOnkyMF6
         r6CNhNo7i3DQ3sOTS6ogg80qA7EabnLkZqmYg4BpLbvRL456p+ONW7gdnb8sUlXKaSev
         YAaYjDH72cFumqodlrRr2+iZS+FfbdGnNCdwjXje85O1l0OKyXOApLOrjIqyEvJIZwzs
         SccphVQf+g3qyg7tw4ecrQZfu69/o/Sgyvx3XLquTnxNqvVEequZ1ZDVUafIPj1fkSFN
         RZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCW4FSZBtFZ7/a09Knd2rcK1ZmX3Fxf1hPb3qqjvy4al0o6vlD7vSa6NXoGF6XPYT3oxkhwgkb8bajRl+eB+@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQavwfKfegyb+a7v0pIttHNRtFcc3s6fXY22SLc7qCMujb8d9
	6dMoA7gC5bnjG5hqGUQNQGyKzIOugbizLZL9HwNlYxEdc9PuOZgYFMHx64MDxxgP9Su2MndrqSt
	kz6IM7UmsKGoi7TA3b8Ayk2xgZioNLAWBfKmmDmgps/BG0dyA3zw2Ug07wMdaCcKtAcFz
X-Gm-Gg: ASbGnctPQ3eaNLp3vd2k+TLq4RUznWhnp025W0GOxH0cpj40WkQrGkbqjBkYy5iGPpN
	5f80fe5hVPcuobYKNy9OqQ1vNhFVNOsElV8PAKV2rGIchGacyDVu4pdUZgv2zNxq0+F9pvucPm6
	XOW22pTF9sSQoxCk09qWjHLAlfLVXYnsxqnTnupxQ2EwyrHKLfDAgXwpoS0t9nrF525FmDh/9Km
	UwXbYWhjKdOoGirAU6PHyNyZvOff87yU0/gnXMC6QMR7WlALA/ODtGmL5olEJ6FXvVdRbKeO5FF
	qLFX+NKCagzpzsCCWTPkunGrsD+Oa5Iwsm0c805csSDXdN8gymzUNDmLDZeVbjVpF90/pgozC12
	aNGt582pGTgnwZI9M26RRJm0w9rapWMzMPys=
X-Received: by 2002:a05:620a:17a5:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d22997212cmr2105916885a.28.1749553646130;
        Tue, 10 Jun 2025 04:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQUgDPSzkOF7xlBQA+g6oVPlHMD5leL1gdy86R0SYpc/kGI1tFwHixo/KGMNQxz18+0VYj+A==
X-Received: by 2002:a05:620a:17a5:b0:7ca:f09d:1473 with SMTP id af79cd13be357-7d22997212cmr2105912785a.28.1749553645647;
        Tue, 10 Jun 2025 04:07:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772aa46sm1503884e87.187.2025.06.10.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:07:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:07:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8450-qrd: add pmic glink node
Message-ID: <20250610110721.tn7kkbcucbfx2o2e@umbar.lan>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091805.2997546-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091805.2997546-2-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX9zYEjKX3zlcq
 9m05FzQlnLkXtzXMcnFe2oNS+c91/r35qVZ+4c5Fv4+2EvgFrG0iwQYBUTCkfQFgf2RrpPfdrvT
 +EO4dCYvtmFvxtuEdQoJorOn/yqvjw9s7IZ1cCX6N3d27VcwXEomF5S5hGNxDFJqyzsefgVV2Ip
 q+A9Db388dfn7eZsjpzJ44bme7HwdQ9Bskwo6NimdY5kr28Yrh0EiKR7iMcklYGx4lEwjgEMeGH
 QLhwqNkFIuXoVn81kokcJssY+aYG1P7IzUXj04qPiZ2tRNrFmsxMvbBw04xRBOuOp+iEZEyuCZn
 kMA/xKx08y512oG2gx/nwPvdx1Hsd4+J0Q4KsU6Jel7p6wm4YU2G+GYTzA6fzUbz6lJaXqzo8ky
 d754gjr8+HHVCZqh3p1xJHf9rsozHipXeScuhp7x21QiapNAdJVgOsxRcCSJIJVh20Da2ZEO
X-Proofpoint-GUID: wGyVHS1JeKXFWh0yihArlhoQ_gpfygfA
X-Proofpoint-ORIG-GUID: wGyVHS1JeKXFWh0yihArlhoQ_gpfygfA
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684811ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5fFL1RxHffGAKPhwOvIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=922 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:48:04PM +0530, Krishna Kurapati wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 54 ++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 8c39fbcaad80..0580408485eb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -37,6 +37,49 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8450-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_qmpphy_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +					};
> +				};
> +
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -462,7 +505,12 @@ &usb_1 {
>  };
>  
>  &usb_1_dwc3 {
> -	dr_mode = "peripheral";
> +	dr_mode = "otg";

It should be a default, you can drop it.

> +	usb-role-switch;

This should go to sm8450.dtsi

> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_hs_in>;
>  };
>  
>  &usb_1_hsphy {
> @@ -487,3 +535,7 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p91>;
>  };
> +
> +&usb_1_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss_in>;
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

