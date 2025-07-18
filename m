Return-Path: <linux-arm-msm+bounces-65620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1DB09F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C1601C47708
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36D6298269;
	Fri, 18 Jul 2025 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0LA6yVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC09221F04
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830861; cv=none; b=DR/zxszMHG0s0/SuyuH9fWgf1e54UThgTuCal5C//V4kxRTlWdf5aK5fonDYUMCsS9yxbwkYtsIe1rQB8aninbBhPaOSbe1mg+3vDB/wG2sWFPMNvk6IF/Jl2cj23PefOXE+zsljSasr4ATMyBEFR/S6w4MFiwQaRa8iD/URll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830861; c=relaxed/simple;
	bh=FGPREmcEPnOwK5l5AewGV5z4NawSGFEuuZib4LYJ1z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJ/ihbG66NCnv7KBvmSW5sqkRRrFXZ7DA1W0TvobOaZZr4ltbWRQIn9FCajO2QgJWslasn2L6cM+Zc7jix38mD3Wf9HJuqcnoOfWVD+SIlZz649ztG1ZCX9huncmt0ZbgtMc4FDremqR1afTgX9BdHFSi/YI/p3UlOWCWk0QLp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0LA6yVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8L21N007207
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2LrGVanutbs4/9+mngI5KLF5
	t6u0n34A7dypspT6PBY=; b=c0LA6yVyWaaIvWWQZhTZSgtA6vDYf/XrxMWyqiEx
	RitzYSlSINExQqM+6E5i4yG2SVHd5DGStSgZ9zo6ZcY/vgc5o8vDB7L8T8xKo8De
	WBY3xggBpB09L12FU/luRCf/rT30x89FmFh558y+7dhSdoJ8Weg0x31WfGvwk3vr
	sYinDpN/gmY/+L0EOH/VJdJd3XVBUU7rW9+MZ2FkzmgDz6JV/A153YCjL/bmBP2R
	d7A9SaFBid83QhMz9JPYOYr+CTr5ZrAxrwTbf9OpCF289Uwufp3xHVD/Gyo+1C9+
	azMpocOEr2fJmqrySpSIWl3kvkTVn+8w4zA4X7AjJZGC3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcac3u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e350915d2aso376960585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830858; x=1753435658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LrGVanutbs4/9+mngI5KLF5t6u0n34A7dypspT6PBY=;
        b=Ft5GakU++sNDZVP9Yk6xVwesyH/VezVn9DgEEJjArWG291AwmUy+Qu06nvRyWzIJiG
         hWYYwej56Q0AdD085awJt6SKH0dgSb6X0S5MYdWgqXDOfiYvVO0w+8dE7L4xUyHJndfd
         DKJHSIWY6C+UChIz6xA8jS+h9eCmna/LOtcLRvkS0eFpDbi9xe6N5qvGd5yTSCqHDN1i
         p+kOsU5RjAYVEBqyDutGJvXg9L+8nBMXcAa/1gVBJf8PFGGLy5Ug0358LUKMJxSoe9e5
         rjGISNuyCJuK7iBOt4LlT3dN7lIHCj971ONaNm/28zqZt9o4nppV+XCskSAespbEopiJ
         drAw==
X-Forwarded-Encrypted: i=1; AJvYcCVYNvYFKhX4FlBIE+B4ksIE6wlo1lzamuHta5phdA/1iOp+3YAfdGv5/UfhVRf9HxPK87fHeq/2VMADiY+H@vger.kernel.org
X-Gm-Message-State: AOJu0YyKncEhAkfIJyAy2HtjRDAxwF/+8e4ATSzyE1W6sxSphsx3khWB
	M6QqjmaRgo8e47POs7ESOTDf7NyRqgLZVfLJVJeW6XlwGC8xp5bebXjN/A8i6R44Dx2Id1M0pww
	TG+x41hHLe/+IaM2qF0nfmNaYGkSXmq7Pghohos4ikwcmw4GSwE88/wkC8r2OuI8k4qy4
X-Gm-Gg: ASbGncsx8CCiJ9PyGyW6Ki9w+PmiE3P3Fyml+7BrZ+p7ZKmMkFP+QaXHDWSjWwVGJzo
	8pAZlOj9zLExuKMAjv9pHn0f2y3aOTUH4mLrPUF66zMae/JfXN/xjHiw1gOkcqPsL+Z1Dxt1/EN
	abY7U2GngSV95MwX7xh2G5jgpFGJ8u6ZevE3JLRzxiPQmpzXevzRSmL1eqUQOeUj+DKHxRp5Nhl
	wkE2A5dmoCnfF+K/nkx2cftsi96exzMESmYaCZvyLEfMrNl5OB3UtaICJSsXs5e19iuINLY0z9C
	OkABm9hSemevoToxAj8dMFRVka98lmRSXQDXTcJAggDxcQVBunZzA/pXdQ6YUxQmUAhchthzA0B
	Ibve2/Rb6y0v7jr/MMy7zXcZnUPwG/YffoG6wnAxxjhO+aC4cb/0K
X-Received: by 2002:a05:620a:7112:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7e356a248demr336202785a.10.1752830857749;
        Fri, 18 Jul 2025 02:27:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRPTaLxKWC/RL7n39Kl8/6M0XWNZ+Lf77HUcHwzll4t6nXZKM+vIee/jhv/vO0jbOVdQCyeQ==
X-Received: by 2002:a05:620a:7112:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7e356a248demr336198985a.10.1752830857235;
        Fri, 18 Jul 2025 02:27:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31dadf33sm183041e87.214.2025.07.18.02.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:27:36 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:27:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <ng7koaqz6s4cslugrujklsrprsl7v7wijtserr6edvsvbeqfkv@pldexeryni7h>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-4-f6f5d0f9a163@oss.qualcomm.com>
 <aHkm4qjgSaklHGp0@linaro.org>
 <4363f117-cc25-4904-84cf-4b3779797223@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4363f117-cc25-4904-84cf-4b3779797223@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3NCBTYWx0ZWRfX0z98jekBng+r
 Ji8Unfl3lseZ5UhSthGDrCLxgk3++VbrgGJdjCnvxCDRlldptbEzJva7Zhjs0hcRvZjxC54B9nY
 g3V63NuSE5ukbFdPrRJtbk0LxjM9Mexes4GWp0zKu8ifcmyiqml9dnVwmVsHNV0RnyVh4yuvMT8
 2Ge7Nc6j7KF1ffHqAxqSL+JDqd981poOWKGx6vlhlVnMI0CL4uRoXkcUMIR3Madh/1T7FKEc3kf
 R0VCTMtCqb/+ZYfHCMWRiKX7Hju7mCnleoCOfYXT7aR1kY+7XdKnbotz8bNCWJezfWdj4Iwwmg3
 D8NPpfr+nfp+GdaT7iuqqbeDPs4FFyepOwey114eZLx/lOTT0dhbuD2G+9J7FJiaxFwaarqj8bd
 0Gd6l4NU4xz26cIEgel1s45OWzml4fk4Lvv8aYeZZS+QUcbPRHjFHj5AOTply/X3+LSK7GOQ
X-Proofpoint-GUID: 0wrbRexUgwDtYRYh1OahTlapHsEzHYyi
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a138a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LY8-0S5nuflZfSqsnlMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0wrbRexUgwDtYRYh1OahTlapHsEzHYyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180074

On Fri, Jul 18, 2025 at 04:19:13PM +0800, Yijie Yang wrote:
> 
> 
> On 2025-07-18 00:37, Stephan Gerhold wrote:
> > On Wed, Jul 16, 2025 at 05:08:42PM +0800, Yijie Yang wrote:
> > > The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> > > the Hamoa IoT SoM and a carrier board. Together, they form a complete
> > > embedded system capable of booting to UART.
> > > 
> > > This change enables and overlays the following peripherals on the carrier
> > > board:
> > > - UART
> > > - On-board regulators
> > > - USB Type-C mux
> > > - Pinctrl
> > > - Embedded USB (EUSB) repeaters
> > > - NVMe
> > > - pmic-glink
> > > 
> > > Written with contributions from Shuai Zhang (added Bluetooth).
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile          |   1 +
> > >   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 835 +++++++++++++++++++++++++++++
> > >   2 files changed, 836 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..c5994b75d3e56e74ffb64b2389ee1bcc086f3065 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..843f39c9d59286a9303a545411b2518d7649a059
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> > > [...]
> > > +	vreg_wcn_3p3: regulator-wcn-3p3 {
> > > +		compatible = "regulator-fixed";
> > > +
> > > +		regulator-name = "VREG_WCN_3P3";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +
> > > +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> > > +		enable-active-high;
> > > +
> > > +		pinctrl-0 = <&wcn_sw_en>;
> > > +		pinctrl-names = "default";
> > > +
> > > +		regulator-boot-on;
> > > +	};
> > > +
> > > +	/*
> > > +	 * TODO: These two regulators are actually part of the removable M.2
> > > +	 * card and not the CRD mainboard. Need to describe this differently.
> > > +	 * Functionally it works correctly, because all we need to do is to
> > > +	 * turn on the actual 3.3V supply above.
> > > +	 */
> > > +	vreg_wcn_0p95: regulator-wcn-0p95 {
> > > +		compatible = "regulator-fixed";
> > > +
> > > +		regulator-name = "VREG_WCN_0P95";
> > > +		regulator-min-microvolt = <950000>;
> > > +		regulator-max-microvolt = <950000>;
> > > +
> > > +		vin-supply = <&vreg_wcn_3p3>;
> > > +	};
> > > +
> > > +	vreg_wcn_1p9: regulator-wcn-1p9 {
> > > +		compatible = "regulator-fixed";
> > > +
> > > +		regulator-name = "VREG_WCN_1P9";
> > > +		regulator-min-microvolt = <1900000>;
> > > +		regulator-max-microvolt = <1900000>;
> > > +
> > > +		vin-supply = <&vreg_wcn_3p3>;
> > > +	};
> > 
> > Like the TODO comment already says, regulators located on a M.2 card
> > shouldn't be described as part of the device DT. We need a proper
> > solution for modelling the M.2 slots together with the standard power
> > supplies (3.3V and 1.8V) and hook this up to the pwrseq subsystem. This
> > is also the reason why the CRD does not have Bluetooth enabled upstream
> > yet, this needs to be solved first.
> > 
> > As far as I know, there is no one actively working on addressing this at
> > the moment. Perhaps you can assign someone at QC to work on solving this
> > upstream.
> 
> This power section is now managed by UEFI, rendering these regulator nodes
> unnecessary. Therefore, I will remove them in the next version.

No. The regulators for the M.2 slot should be present here so that Linux
doesn't disable them. Which triggers a question: how are they
controlled? I don't see a GPIO line there.

> 
> > 
> > Thanks,
> > Stephan
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

