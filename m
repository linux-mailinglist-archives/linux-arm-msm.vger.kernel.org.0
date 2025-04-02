Return-Path: <linux-arm-msm+bounces-53046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449BA79102
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 16:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 024D57A5079
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA6723BD0B;
	Wed,  2 Apr 2025 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4HCYmCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68923A57F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603622; cv=none; b=LXkZOBdr57plWokSUr+2IPQi3oSIU741gn/LC+R1DmVBa9G24kd+Px3c2Psuy482LEJNdfffCeEjbje+KBpJdh9/p1J27J6Vc7WlZZJnUZf9mCmsmowiE9jvrNLrkT2yefFyeNCUJ2KM8+fBpMVu8gr1M/faaZ7h19Pg0f6aU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603622; c=relaxed/simple;
	bh=O+/YDL04sI1f9othV9v0cw+sBvegWdeZrHPSrCANuhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNEmOCXwT+QdfvYEzbtc9BGky88//yFpSfqbbO6pfYBOkeAM9P2wQmunD+deZthlGSen424TFgp9wAJfWRdYd9SVPxmJZ0Ik+nKQsXcDxYhvftStPj0oSAoiPqQvkSMycWurRmPzZXWOepmMMxrJe0XiDrf6iN8IvxIWzb2q4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4HCYmCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DS4eL007554
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Apr 2025 14:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/qGYZtqBb+ruyRdMIRuJ6QLg
	js6pRr9EKhlvDKdDaCw=; b=N4HCYmCTzEH7OlvuG8sUK6WDJhozdZWYoFjCYMVs
	dQ0EMPWeDOEDuRqcq812b/Y8Bw6SZkzMvEj8S/NR6vb0SF4rfBOowe6HdcO6TlCT
	kL7ynyKQ0tFwSgEt4db6uTgHw9zQ23ybQi7IzI6M4QdDWij2htH3AQx1hNNWE887
	j2kv2avbgUubiG1HJVrrGybmtC2Vr3YWn+HVi4HfTyg4ETJxi3ydpRY8imwdc+Ka
	6HcP4WKpsrQLWfJOvkkEShXguDzhvEXpyqSc8qii3Txs0LXgWo46ihyl6QcglGr4
	d2nywqYNNA1TDkn+uaOUGwsuVYPLeIJozIxC9deyZPm+yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxb01kaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 14:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so1044388785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 07:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603618; x=1744208418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qGYZtqBb+ruyRdMIRuJ6QLgjs6pRr9EKhlvDKdDaCw=;
        b=KrVuVq2WdW10AB5oB0abR74ORH8RH9kcv4bwSgd5E29AkoymwRN5WGBkPrsu5Ulp/d
         B5unBGu7JlgRwC1Q/GFLFIjK0XvR2Lwr0X3fTPKAi8mGnNPEyop997Udx44+siQkG3WI
         pcM0NZV4LpEVshNocOa5VDgAXhkX7uQP1Oh66dEuzpznd1qtZrj1F+KibWdYygdrFvBJ
         bmL3GLxz1mJKWvzSBGmeTndDHb1UitlvssKjuUL90PWMnsVXUPLEBKn068t+AIeZy9N3
         vn3IIa6nI9UKS+BFe6Pj2WFesr+IRfOm6oEHw4reRvGMoYU3TnPZrGGg8XHVF+6kddZL
         abhg==
X-Forwarded-Encrypted: i=1; AJvYcCWiUUY6oZy2f6PTcz5OvOC0cCNuO8j6rU+7WA464yMlNHfZqa7HzvrPEl7QRdBzv27Xmcnt3EvndsG5zbbE@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZosx9Ad1ZSNXH42w3jxgfy9DvAa2TMtKmSyfTjEwBD831+tf
	scpssid5EN7hHCcIbNe+jW+oeiV3tiEK3bMhnh7NGxiWlrgyNrBfC5QL79WQxVVvKGwEJJnNRaB
	pQC6OAbcacuH68fPqu4xfqqH+ckTVh+qKUIResqdWvO3GwU/9gJZoFt8mcVlKbqw/
X-Gm-Gg: ASbGnctQ4wyosYOtKl3gHOtz3k4ukLOeFbU6hnfXTHL4RVqsMilWGD5LuG3MnyI9yxY
	OHs9TrIV9VZyV0RmbKk/4g9LI5WRDmpa1Ch4W8C0QC+2kyrK3LLTINRVvabOrY1+7PNwm9I6Fsy
	CYZL2nNuvJoyLRW9xzQeit84U3aogD0SChQo3Q0oa7y6mcXvkXPS/zknuB3DqznAGO07QYdgMBJ
	1VCKEBwu8rb5jlPfySzTk60mjsqRe/pXV2e/0SmKIoBTwxTC2KNmJoMOwYIORc4TSqA9i6X+r7v
	MRcIZ2ZZ4EVgnM/l9Qpbyyp/LPcgL1uQcVog+kEpXrGLjY/Muwg4EisQBS5xxbTldRGzXHh2jy5
	WVrk=
X-Received: by 2002:a05:620a:2706:b0:7c5:3c0a:ab7e with SMTP id af79cd13be357-7c75ba71001mr1092850385a.5.1743603617833;
        Wed, 02 Apr 2025 07:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN/o86mpNr71v5/E92elkySR66M2OBZPRdbDiD45m3sJoaAQs1MMCF0xJOCLz5KtgNWdAhew==
X-Received: by 2002:a05:620a:2706:b0:7c5:3c0a:ab7e with SMTP id af79cd13be357-7c75ba71001mr1092845985a.5.1743603617437;
        Wed, 02 Apr 2025 07:20:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b10956250sm1328678e87.69.2025.04.02.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:20:15 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:20:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
Message-ID: <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402102723.219960-3-quic_mmanikan@quicinc.com>
X-Proofpoint-ORIG-GUID: ichHvDLhVqnFjjEUR104EmS89z5moPnJ
X-Proofpoint-GUID: ichHvDLhVqnFjjEUR104EmS89z5moPnJ
X-Authority-Analysis: v=2.4 cv=BavY0qt2 c=1 sm=1 tr=0 ts=67ed47a3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=hiaWuzcqqAfEAn4-ncMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=923 phishscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020090

On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V6:
> 	- No change.
> 
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index 0fd0ebe0251d..1f89530cb035 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -82,6 +82,32 @@ &dwc_1 {
>  	dr_mode = "host";
>  };
>  
> +&pcie2 {
> +	pinctrl-0 = <&pcie2_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;


No wake-gpios? Please document it in the commit message.

> +
> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	status = "okay";
> +};
> +
> +&pcie3 {
> +	pinctrl-0 = <&pcie3_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	status = "okay";
> +};
> +
>  &qusb_phy_0 {
>  	vdd-supply = <&vreg_misc_0p925>;
>  	vdda-pll-supply = <&vreg_misc_1p8>;
> @@ -197,6 +223,20 @@ data-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	pcie2_default_state: pcie2-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	pcie3_default_state: pcie3-default-state {
> +		pins = "gpio34";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart1 {
> @@ -216,4 +256,3 @@ &usb3 {
>  &xo_board {
>  	clock-frequency = <24000000>;
>  };
> -
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

