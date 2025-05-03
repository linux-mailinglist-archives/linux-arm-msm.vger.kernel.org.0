Return-Path: <linux-arm-msm+bounces-56614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC122AA7EA2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5190E467993
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074D19CC0C;
	Sat,  3 May 2025 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXccz21A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E519CCEA
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 05:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250909; cv=none; b=MrnBeLxVP6pYOqH785/lwsoIyjqIvXUsmzIU7TkCAb1QPKwuMJKsefQHRZCaP0UMxUuVTGU3+IJM79PWZfSXmzCGgbeHkzVzicA2ValQjFKDaevy04AsFGmYemWYfbM7DLaGI8OuCH7tedTcpXfKOVt3w+20+2J8GCGLw9/UZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250909; c=relaxed/simple;
	bh=q0eAETRmKsPtS7GTtwnbg+OJfUU7opW559y9TXWQb2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wh8aOc8gDFj8bokO2exdKaVrJKIIAFMB2q3tbrCU3zerZn+Wt7LQMrP3gPRZvzm1VVkytp+dSRwy1UsGeBVEQPwdAQPeeI/zLVaQRbMnvpd+OJ2IOtYaPt3nZgmJnnafFNRYk6uHAkigN3O2veak780fRjNkepiekXDmKnG12ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXccz21A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434H8TL012284
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 05:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5KpXDftb6Ovg8fC5Csp3/qO7
	lNm71j48LLDisZjHCHg=; b=RXccz21ArRQ/9XUjtN7UQAqSHI/wdL7FyA0x2T0b
	eDNsTOfwJkfKAEyQpSXzj5wrymxLRI82rbCMy1lb+VRXhgW5cDgWPngBeAbfoVgG
	p8456VGF3Im0r3QbBuX8jVlS3J71gNVWZ0TotI40mvrCYBEPWghTPgfvwIan6vhs
	y23wV2i9dA1aM8A7ecTZhXl2BVI4TIQF9fcTznrdlgQQ9VggbuRJBanlpJUTMv4x
	fq8zR3vw8CTlFYDhx1PF/LXUb34ePUF1R3+NFdaD7dxqrAvFeCdh/vOvCtlpEot6
	cm/87pcq+bP3jXudjB1Pgr0nXuGAe/+WGRU2C8NsidfWiA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep095c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 05:41:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47b36edcdb1so2227851cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 22:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250905; x=1746855705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KpXDftb6Ovg8fC5Csp3/qO7lNm71j48LLDisZjHCHg=;
        b=tcEmS2NVaG4JPjrFCC+zuht7S3zERVTGo2hzoX80aRag3+k37AvdOsuPGBiBIgjFYq
         UMrzKi7OnENxlZ6HZCQAWK+AejvyD4u0297kfIUuLVVlsBrnPXGSK+rPJnrjAFI2ljnd
         nGe0VjcXaSUqYx1aFvgxOibt6NK2vFpI5Q8uDUvxnK6WC9J8MWDD8f7gm3lNq58sq+Mc
         JRRYgf1WNNxx/hWjY1ENGZkMtyI8Ocb46/JNHDD4TC6Chjcz7jURaCSkLRWfDVgnt4xs
         MxggYIcuy6A859tl2jis5jNegjh9Jc/lQXk/fswsnZs89RJt7tE/g9TcJYa7Z+ZY+gdU
         CxWg==
X-Forwarded-Encrypted: i=1; AJvYcCVs/ELcFBX/d6aWpSYad+y4BDieXo5TjnuN15INvQOx3EKerF7ZMeLc6dcaVc4YXA9bKX9mA7onlAFzSWVf@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCFfcNdlaupdvIU2DWsFJioKInRJLu+z7DfOcXuHznWSJeQeM
	oX6QTs+U/PvnhZ1B5FJNV494mmyrLKOPdirNgFYyaSBVOjzeRjvHo0E0zJbWIRktnw0+w5kydjE
	xz7HsImsir9EB+xMSjLYfDFVfHE5wWq4u2uZeMc2i4x6+jn03ZU2ihvVhdRoLsRsM
X-Gm-Gg: ASbGnctGKjO8TowhxTlhGrXIrzMnohINy7fVBm/G2VCBCQ4jAaQOhyHiGGO6awooBO+
	U9t8GCEz6XsdEPW6AIMh19yYBMJOoRftP8srUOwf+pMMyGi+jVdoEOk0Eqe4PeS8GfdXlpefBvT
	o46Mx0mgWd16JcUutt3hBh4ttwu4DZMe0VuVnlofU8bpIWjk1sPynyGUmXy6Vyee9GFq0P+tkRM
	I8bYhuBcjOsAoQt3aa/GxNHxh+orZCFciBipk2xG3Pmr1wT9QH7I6AX81TkWbibOoI6ECn3/T5H
	IXeanc1XtBsRH+86Bmu82dX5u9oR9C9Wn+7FOD5vU0TGvDHoYfK/LSjqBng7Qwg7j/CWEbfY03Q
	=
X-Received: by 2002:a05:622a:59cb:b0:48b:42ca:13d6 with SMTP id d75a77b69052e-48c31160cd0mr65412091cf.7.1746250905554;
        Fri, 02 May 2025 22:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGFrywm96tWAeoxFx5+AhywAWsJxWn4Z/d5zAW0fzBPsXteeqpsqblog7s9PlyRRVInkgDHQ==
X-Received: by 2002:a05:622a:59cb:b0:48b:42ca:13d6 with SMTP id d75a77b69052e-48c31160cd0mr65411951cf.7.1746250905248;
        Fri, 02 May 2025 22:41:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1734sm649908e87.32.2025.05.02.22.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:41:43 -0700 (PDT)
Date: Sat, 3 May 2025 08:41:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
Message-ID: <xvmk4paonzafxm5aesu67ggkwpdak2ughhi35wap45rjtuplsk@xe52pvnudsbp>
References: <20250429173334.303003-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429173334.303003-1-quic_vdadhani@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815ac9a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=_CnAHy6i7R4rVe1gsZYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DzT2228fLuCGroOH4_jKFKtrKbCM-5Jo
X-Proofpoint-GUID: DzT2228fLuCGroOH4_jKFKtrKbCM-5Jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NiBTYWx0ZWRfXydyHNR/osIPq
 J7HTYxwpQwNYGD5KnoE+0BgJxrQnuCS9rSo9gysffIviqpWPZp95rJ+7sS72tIu49LFqSZnQyWl
 ReBQHzUsdEaQ19X6gErE898hfjOQ7YYAiHCvbrH8tN4YJDu4hyFM9cLVgmhx6boWFSAKIISzc0W
 HYPTrZZdxigtaG4gnRtpu4j96h2M8LtQZhcDHkC2lYPomnx16Mb8y4XQ14WGloBvogxzzndzc5I
 aUl1yJUWUoWY6vApIXn/agYP4BeNBXD5fgYPkkl81L0o9P97QhgpD21AZ5nfWo9IioQBLRbZDwe
 4o8Rd1MmXUAhfBAKMQtBleGboo/9TKYQyfLlNtTVNvws5K8l4wEhYCsQvjh6gkD7wVof8UaAdMq
 Yz3WZGGNaFX2qLleQgxD42B0TlHlKLS9xf4QC9ZsjnbINIoHygyw+y7QYhyZi1wag0t1p5H/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=985 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030046

On Tue, Apr 29, 2025 at 11:03:34PM +0530, Viken Dadhaniya wrote:
> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
> Serial Engines (SEs) are missing in the SoC device tree. These
> configurations are required by client teams when enabling any SEs as I2C,
> SPI, or Serial protocols.
> 
> Add default pin configurations for Serial Engines (SEs) for all supported
> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
> change facilitates slave device driver clients to enable usecase with
> minimal modifications.
> 
> Remove duplicate pin configurations from target-specific file as same pin
> configuration is included in the SoC device tree.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v2 -> v3:
> 
> - Remove duplicate pin configurations from target-specific file.
> 
> v2 Link: https://lore.kernel.org/lkml/20250324151047.842648-1-quic_vdadhani@quicinc.com/
> 
> v1 -> v2:
> 
> - Drop drive-strength and bias property from soc dtsi.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/lkml/20250225154136.3052757-1-quic_vdadhani@quicinc.com/
> ---
> ---
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  35 -
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 750 +++++++++++++++++++++
>  2 files changed, 750 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 967913169539..3b4243ef37e7 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -508,15 +508,11 @@ queue3 {
>  
>  &i2c11 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c11_default>;
> -	pinctrl-names = "default";
>  	status = "okay";
>  };
>  
>  &i2c18 {
>  	clock-frequency = <400000>;
> -	pinctrl-0 = <&qup_i2c18_default>;
> -	pinctrl-names = "default";
>  	status = "okay";
>  };
>  
> @@ -678,8 +674,6 @@ &sleep_clk {
>  };
>  
>  &spi16 {
> -	pinctrl-0 = <&qup_spi16_default>;
> -	pinctrl-names = "default";
>  	status = "okay";
>  };
>  
> @@ -712,80 +706,53 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> -	qup_uart10_default: qup-uart10-state {
> -		pins = "gpio46", "gpio47";
> -		function = "qup1_se3";
> -	};
> -
>  	qup_spi16_default: qup-spi16-state {
> -		pins = "gpio86", "gpio87", "gpio88", "gpio89";
> -		function = "qup2_se2";
>  		drive-strength = <6>;
>  		bias-disable;
>  	};

If you are movign parts of these pinstates to the sa8775p.dtsi, then you
should also turn these declarations into label-based updates:

&qup_spi16_default {
	drive-strength = <6>;
	bias-disable;
};

Otherwise the configuration is fragile: if the name gets changed, then
two parts will not match.

>  
>  	qup_i2c11_default: qup-i2c11-state {
> -		pins = "gpio48", "gpio49";
> -		function = "qup1_se4";
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
>  
> 

-- 
With best wishes
Dmitry

