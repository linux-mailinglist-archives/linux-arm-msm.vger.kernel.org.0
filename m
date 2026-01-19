Return-Path: <linux-arm-msm+bounces-89562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64569D39E8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F4A3036425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 06:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1838E26C3A2;
	Mon, 19 Jan 2026 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRB21Vh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnANnTmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94272242D9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804390; cv=none; b=E9xGo2huz2V3giFqQ6LWN/+lLTxVCpn9g55iaJ4g066oRTLVI+meDH8pEsO12RZ1Gj4xYzBTSJFh2fQ9XvNnQtseWitbPYV60CNoLAoHSUmg+geXxP/IIu0KldyirWUQMYAlGGfNBuSzT8GEo0Cn+xT88kB/N90mCvAYjSqpknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804390; c=relaxed/simple;
	bh=3Vj40UZBPf9P1cZtv23nglhfop56SnIqNtbrp+4euMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFYoR4PmbCtmmVa+gL535NjtFs1+zhS8jsr+L4BqlzD/D9d6NXWeq6RXwBwba1bx1wTsHHUb3DMqi5j43gjWBV4O3j5zCISaKJVsXpEo17M3F5HZmSuEsd5vg32NCYJ9N3xU/FDMCbhxUpHPxNFgPh8gAeXhjtM4DomkoScSZ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRB21Vh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnANnTmN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1dgmR4134318
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/zejiEHMPmrNrr5ntutP7bS
	CiAHEOSGtD0aZ1q4iQ8=; b=pRB21Vh7ebPZucBbPU0DBkNLZVOGc4kvo1gL9CL8
	SJXPjzds8JBytJBYOtHAtl/0Pq4qN8t1QNUbcamEgRL/t1Ww2oIPrAF97SdPugR9
	kRj28kISMci9SxDArxlsKskw7xROnQFazm6/1NmXMjDjLxTi0NsMW/z4G5KqaHG/
	i3lyrRocgVb6KODgZ7l+NVl8su0LRLiIcw+dV8R+XYUDopOz+T6TgCwaW+WDXyyk
	8yjLdIfzGhTveaA7XBLm9bp5r6DYv8qMgEqAMhqBskNqCAtwpF3fltaRd1I3SUkd
	EQVReg4qCryelGjwQB3uv0NqnmqCsskoknShpYIpNjXkpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yrn7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:33:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so844465985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768804386; x=1769409186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/zejiEHMPmrNrr5ntutP7bSCiAHEOSGtD0aZ1q4iQ8=;
        b=RnANnTmN4URaNt3bCBoZ3o3e40HrSqP0xBPUNnsEF+c/RCYPbf6xk2zGzTit8MxE11
         vFNEImb+FQ49XvT5JtOxVMrCWq4+Xm+jxRUubyzFXsm8lL8dN178YRXCYSivt0DDZ93E
         Iu8XqPfGVuKLlyFL9D4bC8uatQElF3pkvapzz6GFYyuIul+0pi/7FCz222qx6bLU1R2E
         7LlSQBM4Z2hK5Xc2NscKkhAThEbiD4G1seFx6IY3O/9G8Nd1Caqn0mIwGOLDthwLE7dy
         MM8mJDDxbd7hzEJ/9QVmaXvzlAy0zjanJfE2IlxLn7K4tPwoTCWywg/UzaYWmlzKL2Xa
         9Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804386; x=1769409186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/zejiEHMPmrNrr5ntutP7bSCiAHEOSGtD0aZ1q4iQ8=;
        b=oFsqtE/u4BzxPk9wuENYTxK84qlOy5EeTjt9Pwa8XLK5aZnMs9nkrx1dxqx7uA407E
         Dl3vvcZhOrs5eS0AiCAIRkPUwyMUiCDBWacfyGBGsT0cjK354QGVsPyvXXUhRDrhQ3xL
         n/t8xOW5sQBCHLO8qVShbyCmXQyyR9TsXF7AfST6TSQVjYVtBLvs07qqU9n3gprpQRcO
         GAGWQx60zpJqdySrkJnKp35hsFPopuw+KGmnwOXzjaPfFix4BFi2bGMnAVLvlp8a0pyN
         wOlPipktDXvy4IfBxM5ZRtCXzdvBMSQ1bzWhXoYIvu11TeSJCfZ7xBegpsv8YF87CAgE
         uJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCXT6osakDs685KKaBKz6M8s7m17+hezKWGoxQ+7joiHJBD0EeAp/WRg0hPv9j71jMiTCj0YxLJUy36o2HD3@vger.kernel.org
X-Gm-Message-State: AOJu0YyNc72HjoK9y3nLaUDRNcsC9CZcSXRaQYb7+JbXdKZjZUm9B4+T
	cf0otRbYwgHLO36A7RBgDX2o4WDnyMwk8aW5ITn6LaBs7gNLGS+DUPB1GWveFVfCllpBhxhJM6y
	bNYzN14IFMWt3Jc7xPaxugyhG1O0KNLp33aaSqMO4tRTQkEf+AOMZW0ZpvZrtxf0H+6onjYqRmj
	K3
X-Gm-Gg: AY/fxX5WHZnu4OQRtoRCv6nbh3vX58XsiUvv8lS3UTZK21cnm41vE6UKgOKpxzB5kNC
	sRUznEOjovddo0bWcRx6U6bsiosFuAy3Nn/zuaXwma963QXaCcW32YF9ZNlBDLFwSzT06KGA6Ir
	Yyobl2Zo+fkXScC6hG98Z3cQvzFaupNYBtq+AabbPPwcrEMFjnReBTmkSHWWmh/Yu+Pc+lfAdvb
	ZNltP72MAWj0CpYGqqzEj4iqi2GFqv0h7p83HW1b6aLoMd7pE2NHap3tuFuK4kXIF/v5PJPHVhm
	p3N0eaSfjI4/zUcfhB1EKR6I+kuL1NEu4/BnJq6I1E8HCv77x92Uh8vEhBITtLifLsB9RfsUE9T
	7re1H4jsqcL5LhVg3EqK8YxzMDFMpou/CQxaxnDGin3zrowIkrF+PivBokGEEh+fPNREG+kFdhy
	5U1CQUyx6OqwHPrTF1G5lGhjk=
X-Received: by 2002:a05:620a:3910:b0:8c5:3881:da90 with SMTP id af79cd13be357-8c6a67a1fccmr1485257885a.75.1768804386378;
        Sun, 18 Jan 2026 22:33:06 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c5:3881:da90 with SMTP id af79cd13be357-8c6a67a1fccmr1485256785a.75.1768804385928;
        Sun, 18 Jan 2026 22:33:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf352846sm3070297e87.38.2026.01.18.22.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:33:05 -0800 (PST)
Date: Mon, 19 Jan 2026 08:33:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
Message-ID: <k6elnnmc6pblbf6mndb3jwaave2iccytwpbg3f6oo6yqzahyoy@4mljaxcq366u>
References: <20260119041101.2685092-1-wei.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119041101.2685092-1-wei.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696dd023 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RAcZDtF_tHjv-8NrTeEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1MSBTYWx0ZWRfX+RqNWDzsyev1
 PtFrnANpLZikwy6k66JIdZDz+v5t1oAeZkI03udgsEVcIhZ6q0ZZy4t/jLPZaObCXMjN++jj+1i
 GdA6HJmuVDUXcgYTp4L9rwfGLc0eYSAqEqNH5plwXo2lohNoM/18kt4kjmdqFZV5SGr3g9gvTJZ
 HqTOPS3i8t+RLPR8rtTRUwj+T3RaRy1zZkLKgN0u1meIG095+gxy9G3fHE2eDJAzAuSxK33bvea
 101EylOQVkqCW/+LQ1BnBryvNKMfNRzHL6RbkJUrEsXmyGXINYwQQnPbRbyzWVbdTVOYM+/zRZ5
 Vu5JCIFI+WYgj9LP4T/JplQqX2j0C73HdIbpaBQcVsxALgeXH4VuR4jigvTjAqdN6MHETivZVr/
 lQCMkN4fewCd8nwGZDKW1AZCgRkuInsv36ryrusDmbMjzxopzOF8/DVufd+6+j5yE29P13NdXUY
 hiKqMScom/eoufBgh+g==
X-Proofpoint-ORIG-GUID: 6n5Xuoxi5joAU2_X96XyNvaSyZiT2Aza
X-Proofpoint-GUID: 6n5Xuoxi5joAU2_X96XyNvaSyZiT2Aza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190051

On Sun, Jan 18, 2026 at 08:11:00PM -0800, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---
> This patch depends on:
> - PCIe
> https://lore.kernel.org/all/20251128104928.4070050-1-ziyue.zhang@oss.qualcomm.com/
> 
> Changes in v6:
> - Rebase patches
> - Remove unintended 'output-low' from wlan-en-state pinctrl (Konrad)
> - Link to v5: https://lore.kernel.org/all/20251113055148.2729943-1-wei.zhang@oss.qualcomm.com/
> 
> Changes in v5:
> - Rebase patches
> - Flip the order of property-n and property-names (Konrad)
> - Flip the order of bias and output property (Konrad)
> - Link to v4: https://lore.kernel.org/all/20250325075331.1662306-1-quic_stonez@quicinc.com/
> 
> Changes in v4:
> - Rename the symbol pcieport0 to pcie0_port0 (Konrad)
> - Adjust the property order in node pcie0_port0 (Konrad)
> - Add to the commit message mentioning FW and BDF used by QCS8300 (Dmitry)
> - Specify the calibration data using the correct variant (Dmitry)
> - Link to v3: https://lore.kernel.org/all/20250318093350.2682132-1-quic_stonez@quicinc.com/
> 
> Changes in v3:
> - Complete the nodes property definitions according to DTS binding requirements (Bjorn)
> - Link to v2: https://lore.kernel.org/all/20250227065439.1407230-1-quic_stonez@quicinc.com/
> 
> Changes in v2:
> - Rename the nodes name according to DTS coding style (Konrad & Krzysztof)
> - Provide regulator-min/max-microvolt to the regulators (Konrad)
> - Link to v1: https://lore.kernel.org/all/20250210062910.3618336-1-quic_stonez@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 107 ++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 68691f7b5f94..9a5de3754cc1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -33,6 +33,88 @@ regulator-usb2-vbus {
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> +
> +	vreg_conn_1p8: vreg-conn-1p8 {

I wonder hopw I didn't notice it earlier. What is the name for other
regulator nodes in this file? What are the name for the regulator nodes
you are adding? Why do they differ?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_conn_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		startup-delay-us = <4000>;
> +		enable-active-high;
> +		gpio = <&pmm8650au_1_gpios 4 GPIO_ACTIVE_HIGH>;
> +	};
> +

-- 
With best wishes
Dmitry

