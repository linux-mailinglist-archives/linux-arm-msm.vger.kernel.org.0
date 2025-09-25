Return-Path: <linux-arm-msm+bounces-74865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB2B9D1D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC7B3BAC5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EDAC2E0;
	Thu, 25 Sep 2025 02:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9s7v9Yd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD22C25557
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766568; cv=none; b=rqjKfPxc3S0CcjKMD4tfwKpAYRFIEOvho8bQ7VS7YYCtWGxPuBxy+2JZPePaLZE+vXk7j73wH4qlYnRDuZeVVrP8iPwftKHoth1+JamGUf44DnHaFfCperSrQiRxQr3u3qwMu17LjLindOEyO76HyBqu3LWXjhZNXU5Ehfryn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766568; c=relaxed/simple;
	bh=W4OgDqX0+JWXCpOQWquNZdf7HNox6eKrB136vl5Cdmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a51flCOwFiCaA5cd9R71Mzhpnd4Lp8zeRohVvJuSyZVdnokXngpKp8ZfxZoK441gX4EdttkWk0leW/ZUzUb3EVvJM6ebZguwPioF46rloB150ZpzAVaIZ/XO9U/lPQqhr9KwmKZlhNEy+7PAHVU4hy7ys5kzmWCUtl2daN+LDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9s7v9Yd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0KauM017453
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4F2ZVh7EAmpkP2a3mtjmGKdC
	wVw3z5Hk/A0buJB8e3U=; b=K9s7v9YdnmTYdJSJc5hBTKOeLThQCaGqXRhEbWxM
	75aRR6fRRkfDk3pblgvFD5wtY1feklTAZ/+1xdBQCEWwpfmWOLFBXl+oL8J9rVKV
	Q74zZ22j60WL/okfObTVQw1cp0YSILRJUsQO88Mag6w8u89AAnMN15T9O1nYcmWX
	IhTmUh2JfZJ3WrvxFW0rsdSVglL/SkO5kA76mfIGGEw7dKAdHt6Xp3RK3kmFnZwl
	zXkktjvFh0B509RHcARR2zXwZM1Lhsiq6/+LRPeGUVKIT5KLUrFjChrWjahs6LSC
	vO63ULYcuTeXCNzdC3jqh4WsdKC7q9yKnh+nCAHJbUpYQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyr3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:16:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d435215956so11207481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766565; x=1759371365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F2ZVh7EAmpkP2a3mtjmGKdCwVw3z5Hk/A0buJB8e3U=;
        b=Jmi991zvaAqhnKaSjfc5FY78gR3f5F6z9qL4OsVzPFfWiJRHzE+D9VKZRJq7k7c1dw
         JMima4Q4AGN5phHJrGkVRq9jus8Tzjm7fGB6EFx9j+wXdiQUuWMVQqC5GCIkl1auo4Og
         wlZ/bGhZGfedrDDpb6r6wjCBfXb8XGybvj+Sxadb/NapkB82b4+bby/NVloN9zonSZkS
         n+lsV0F3ODFPp3TXwdaj3WIrtRyE4QvSeKT9fiJnkCAk3Iy96RlYV6AO/LHY6ycpopop
         yqIItiYeSVbrjtj5PsIlEfKf2pJ6STyL10VKU4qAvx65bj5SLrBQluMMna7QnQeOwiuw
         uqpw==
X-Forwarded-Encrypted: i=1; AJvYcCX4vKYrWkY06KPvsn8cI9+nneLUTuhn5olS0hpNv1bqZSSpiqaj7M3Nsm1lXj89CA+zJLQV9tK7e0PhW6FW@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqC+iQONIoQutt1jq8Jzd1Tvnltx86NcS+ngd64oGpYScS+3U
	4quoygThqpAEUl89I6IBY9RbLybVsb0K6WXMJoYaum20MXw7U6KZDgsF6fiZlTuFSVjCcxzhpKg
	Jj4HTQ55vt+qiTIgTlAvKx1AfDDwrZWjJZ7O71w8V4PjrMB19TZLtn+ruDDsiIxvX/nQP
X-Gm-Gg: ASbGncs0XBxlV+WcpAg+LCIW8v13mYmhMVi9PO6o2WVsHlWojSOlVFnut5+qeF3oXtl
	y0IK91KXRm9yKKmDWHP9odMNg46ehF/kkbjnu07pANdb3vCMWMTmQJY/VeVKypCAM3QhI5VfymD
	kUKk4sFqXOovjXPSadycqmT7s5jb20LscqM7klW92EcZSFnpfBoNAf1QVbbsGDkHs0K6DD2UcBw
	aTuP2bftJCT5OyePEBfD2q2cYgiNzehp7UM6C5UnLIhB0xy0pecCjmBLkRlZf6emBHbtExsjRJK
	ZeJZtyLbZBDupF0W2PZQy/pKUKJIeM/r0iATqOsAPsGVwNecKT8Qw7Ky7i+BJFnUVufPXqLqVfP
	biAGr36xvyl4twMOXba1jrlELj9rmEf1wKyuvmlxeXyv5V9EKm56E
X-Received: by 2002:a05:622a:488a:b0:4b5:e630:956d with SMTP id d75a77b69052e-4da48e6fb4fmr25434361cf.36.1758766564781;
        Wed, 24 Sep 2025 19:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO6F3bBcr0Eyxn631XnKZ093XGXPY9phD3HmDH4TIQtmfCmIzXmtds+LFYS7J/cdNe2teKog==
X-Received: by 2002:a05:622a:488a:b0:4b5:e630:956d with SMTP id d75a77b69052e-4da48e6fb4fmr25433871cf.36.1758766563671;
        Wed, 24 Sep 2025 19:16:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313dd67c4sm243342e87.55.2025.09.24.19.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:16:01 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:15:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 16/20] arm64: dts: qcom: kaanapali: Add QRD board
Message-ID: <adxbl5cejcng4iukb5xeriyi3e5xzeqn6xvqmro7o3y5f6tlio@qwxwv64uxvfj>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-16-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-16-3fdbc4b9e1b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vTGqLAsFMK3-2vedmjXcd5lv7ghIE5fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX0iNA4PnD4YAj
 LY1+4e3e25OSa1kMjdfMXZyXSiEVRuho1S/3loIUrYAofFtxeVptzT9GtVZVnE6o9zrpn+SZhW+
 Of+1r1/Lk+dswPItF0SRiz0t32OBJ6wwpTrRBkEhUJ/wxgbcSC+aAU+9AkdtGGvthuiNuYJYtqK
 FZ9g842XeItQrOF8f3PkLKZKpMS3zoWYAm9euiYo2rvCvWofhPHOJoXYxzYK9RkNFlR2203C5zL
 UxG2Qk5VSMo+Lm3eftCQ90k6e+YDcYLpE3vc6aJK8kIclumQ4uEzcKM5Low6zv4zDnTp2E46NZn
 wpkCGZtf3H3PW9gJqU8Lx1AGckFzGy3VQlyQ/oBMjm6f6XzFzeZFI2PxmaNPNIsCX+SZZXQLgTh
 DUiUeYD8
X-Proofpoint-GUID: vTGqLAsFMK3-2vedmjXcd5lv7ghIE5fx
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4a5e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lEEYZ7q47cWEcR7klmIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 05:17:33PM -0700, Jingyi Wang wrote:
> Add support for Qualcomm Kaanapali QRD board which enables booting to
> shell with uart console, UFS, PMIC peripherals, bus, SDHCI, remoteprocs,
> USB, PCIE, WLAN and Bluetooth.
> 
> Written with help from Jishnu Prakash (added rpmhpd nodes), Nitin Rawat
> (added ufs), Jyothi Kumar Seerapu(added bus), Ronak Raheja (added USB),
> Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC), Qiang Yu
> (added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 1212 ++++++++++++++++++++++++++++
>  2 files changed, 1213 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 7edfa5fa00fc..da9ef255073c 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
>  
>  lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> new file mode 100644
> index 000000000000..5900812c74a5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -0,0 +1,1212 @@
> +// SPDX-License-Identifier: BSD-3-Clause

Please sort the nodes in the file. You got two entries for tlmm, for
example.

> +&usb_1 {
> +	dr_mode = "peripheral";

Is it?

> +
> +	status = "okay";
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

