Return-Path: <linux-arm-msm+bounces-76721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802BBCA303
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A51074EA6CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564E8223DEC;
	Thu,  9 Oct 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJoSqlVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA632C8B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027299; cv=none; b=iMGLzySW2UL7adTCkaqXbXFodYK5DVkOTOj28cXMm0gNUr9jEucEeHAmDtC2w8JunO+mr44DnBapGjbinmNGDCYxeHXqtQaFXQqavBIXGxh/Fws3/Js97j3EjuvDfMsqTad58A2yzZE3XgMi0R3K1c8gvs3RN9z29Ne09xnpIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027299; c=relaxed/simple;
	bh=fqg3g5ZmYuV22v5Z1zMCldKZvaxyeZikhZJzA9NLUTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsorcKhWK8XgwDdpNo1tjlkMcX55Gd5Mz8rgsJgSWq1a8X10vxEL5nukNJFYnVJ2R61/646fX3zm1O/6eLQII8X+xXh7bcTHmqplOuq4pTw3aSp7CxRH4OPlQJv+TphEbz/OLKtPblrK7FtSa+YS9wGOmILYup6cN0ajGt6SEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJoSqlVN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EpM0v029755
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnXpFZQ4U6DhSA1tPT9J8U9x
	/9Yu9OLLvkeFfqxAsdo=; b=NJoSqlVNMOKWY3a0Z8om+XkzXR1iInrqnj0hMDKK
	bEBrLJVk+uXZ3JbJNTrHfhGkpD9prVO90x1akiNoyfbHmts8/0et/B1zCvbXcyAW
	kDp4EQHza/JUC6PbpLuZN9/S3C0z2icB39A9qSgFTlUlkGXXkYhL5jMcpm3qj0ks
	1wny+Goqbli8hx/1Ck/e5XYH+CfvneVZQHpHqdSNcoUHypZ7FISyiPb4DFAOLXNP
	98kpNEayE8oIpvdJK5BBiU+nSZFf3pRBcWQsyG+4tAcUcFI/5G5pPnwFkfgEY0J3
	j/1OWMp0XvHiUklN+epvkOMTOQ371Sxd7ybNpC3o5R9f/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nbkvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:28:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e57359997aso21559041cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760027294; x=1760632094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnXpFZQ4U6DhSA1tPT9J8U9x/9Yu9OLLvkeFfqxAsdo=;
        b=lkdl/lTiThYjnKJ/b+Yr1YmVctP/J8FusaiJM1oXpYGXWthtrLyktb4SzuQuw6cpD+
         oUw5TEmM0l1MWj3orMe/Z2qc/XyYalXVWm4GC++EJXmOVr+MqIa50nO3UGHkMwZg0Hm7
         CeKXV1OR8MLu42KwEy5y0oA2sK9JaWhBalvOkCnmMo3PWVeSx75Dor9qJC2c3F396Eqf
         4jGftOSpZjeqxQJrf7kJbc0TmXN2oekwuKIJnR+xugIccOfsMUfAoGnxdbJUq1QPTvWV
         VjkdYKu6VyUscULq8y0l+dGrFkEgJfy9mqWeU4X7xPCJBb3h/UhW980iUOCh/zEtoBKr
         3pbw==
X-Forwarded-Encrypted: i=1; AJvYcCUE3oXra2lHI9FEs3QCjJRg5JisoiFulKOZtFeZ120TagCs9ni4a0/nit1/Yq/RuumZQ2QeOXApdp5vFmfH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+pMTzEsiU2W+LqJ1tgzJjoS4RU9Pr5F9/VDmWFpbuI4kWYRk
	+At2qS4+w61Kg8hGaYEroaFMr6OGFHzRfucgRCwKwo5PuqB/688q6FwDfkFSX2UbxW37WEt+wmT
	GAAfKN5wW4JAI560XF8DinDvcBkRh/cOKpWFo/Ye008a9gelx9RtLcRHGT45n2LFeObIZ
X-Gm-Gg: ASbGncvAhemXME4vNfyyF3a0MEbf6rEwNLV4ejlYRGf4QVsF/eRlFEA9lh/Zkn1uYRn
	jozbXmcchsukIJUsStoPEE+w2HHoRrqJwjzF4LWrYpdvW0r3EZfH/OUyDkk7LhqY2lsIyMCXs1i
	IQCiCMXtklzv9N/w1kBwsv5ftp8n2s72GQT3OY4vTRN4J0PRE3msAHDbjogTt/m0Iuaco9EHtqC
	KdTwJIcbracJXGscmwOMC6kjjhsVhnQYJBh08SZdcmiFxJC8biCr/B5ob/2IJmX/N27NknHdrRO
	m77VDCT0CBM/ZIBkOUsX8NR69k9TcjGsvvjnIe6eMUAzjyTC2c2tQlhc0navfg71WDr9PnPYzDh
	Su3+sSwxwRLv0PM/jsxjEflxCTbinqDrvIuaGpUh41P1HnSlAp79cKfmcpg==
X-Received: by 2002:a05:622a:4acd:b0:4d9:4863:f4e5 with SMTP id d75a77b69052e-4e6ead6714fmr101251831cf.62.1760027294465;
        Thu, 09 Oct 2025 09:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjQJ0wOBwgsaJrRS5HHNu+KDYVK2dVDJgniqV9gP73jMPAU3sRYpuRCv1KT3nf4BpbOlVV5A==
X-Received: by 2002:a05:622a:4acd:b0:4d9:4863:f4e5 with SMTP id d75a77b69052e-4e6ead6714fmr101251071cf.62.1760027293700;
        Thu, 09 Oct 2025 09:28:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b63fc6sm29450151fa.36.2025.10.09.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:28:12 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:28:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
Message-ID: <kocj7sf6jgj4uynvlxvbsojc4bykyj2ipb4ex56fagjqoxwcie@2trytltkhd4a>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <588a7b68-2e2e-4e65-9249-fe8b18b67927@linaro.org>
 <831f6fd7-b81f-4d6f-b9bd-5a8fe514befb@oss.qualcomm.com>
 <0c9ca026-9986-4347-a86d-8bf65e2d12e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c9ca026-9986-4347-a86d-8bf65e2d12e6@linaro.org>
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e7e29f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=SzOJWy82pAEjsAOwwT4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: gsb533B8uBkp-X8Flf9j-TxCiOEfQIAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+BAJ0tx2cP/1
 GQtd84erww7eL3ZjZfjP+fo2eegoPIadCmEAos07ihmVJtz8uy7Hbnn4yvVOwD8UhW2NRTOsTD2
 iP03UEnvkDjhug1OA8MSiEq+N4+fQdtmuZ9iWotTDRcAnIytYyIb8bz9DI9eSFmWwUJeAjw1GrY
 kkQhXphaZkMq5fpuhdtgKgmw8SoQOb2kuvvhnhmy+a6mbMDRd8PXUiVXTD09ZlWAy3cfZ1h9A18
 Cdar8vXW49qePBIAenWmqqG6/mIBWnizOMbzO1ZPzC7PgwZHYF9+DKBUbeeD+Ff15KQuk5atGPb
 tAqiInzJxNZfBeHQi6AnvvmGajhQ8imzax1oxa8lJx0QbAxNG7KtC0s8QHsmy4YK7mVtqdpyDCv
 qRozSDYFjk64ybIP3/j22bm/iFWZnQ==
X-Proofpoint-GUID: gsb533B8uBkp-X8Flf9j-TxCiOEfQIAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 05:58:03PM +0300, Eugen Hristev wrote:
> 
> 
> On 10/9/25 16:54, Jishnu Prakash wrote:
> > Hi Eugen,
> > 
> > On 9/25/2025 1:33 PM, Eugen Hristev wrote:
> >>
> >>
> >> On 9/25/25 03:17, Jingyi Wang wrote:
> >>> Enable more features on Kaanapali MTP boards including PMIC peripherals,
> >>> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
> >>>
> >>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> >>> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
> >>> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
> >>>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 663 +++++++++++++++++++++++++++++
> >>>  1 file changed, 663 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> >>> index 9cf3158e2712..2949579481a9 100644
> >>> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> >>> @@ -5,9 +5,23 @@
> >>>  
> > 
> > ...
> > 
> >>> +
> >>> +&spmi_bus1 {
> >>> +	pmd8028: pmic@4 {
> >>> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
> >>> +		reg = <0x4 SPMI_USID>;
> >>> +		#address-cells = <1>;
> >>> +		#size-cells = <0>;
> >>> +
> >>> +		pmd8028_temp_alarm: temp-alarm@a00 {
> >>> +			compatible = "qcom,spmi-temp-alarm";
> >>> +			reg = <0xa00>;
> >>> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> >>> +			#thermal-sensor-cells = <0>;
> >>> +		};
> >>> +
> >>> +		pmd8028_gpios: gpio@8800 {
> >>> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
> >>> +			reg = <0x8800>;
> >>> +			gpio-controller;
> >>> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
> >>> +			#gpio-cells = <2>;
> >>> +			interrupt-controller;
> >>> +			#interrupt-cells = <2>;
> >>> +		};
> >>> +	};
> >>> +
> >>> +	pmih0108: pmic@7 {
> >>> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
> >>> +		reg = <0x7 SPMI_USID>;
> >>> +		#address-cells = <1>;
> >>> +		#size-cells = <0>;
> >>> +
> >>> +		pmih0108_temp_alarm: temp-alarm@a00 {
> >>> +			compatible = "qcom,spmi-temp-alarm";
> >>> +			reg = <0xa00>;
> >>> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> >>> +			#thermal-sensor-cells = <0>;
> >>> +		};
> >>> +
> >>> +		pmih0108_gpios: gpio@8800 {
> >>> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
> >>> +			reg = <0x8800>;
> >>> +			gpio-controller;
> >>> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
> >>> +			#gpio-cells = <2>;
> >>> +			interrupt-controller;
> >>> +			#interrupt-cells = <2>;
> >>> +		};
> >>> +
> >>> +		pmih0108_eusb2_repeater: phy@fd00 {
> >>> +			compatible = "qcom,pm8550b-eusb2-repeater";
> >>> +			reg = <0xfd00>;
> >>> +			#phy-cells = <0>;
> >>> +			vdd18-supply = <&vreg_l15b_1p8>;
> >>> +			vdd3-supply = <&vreg_l5b_3p1>;
> >>> +		};
> >>> +	};
> >>> +
> >>> +	pmr735d: pmic@a {
> >>
> >> Hi,
> >>
> >> The PMR735D is available in pmr735d_a.dtsi
> >>
> >> Can we find a way to reuse that include file instead of duplicating it
> >> here ?
> > 
> > In pmr735d_a.dtsi, the peripherals are added under the parent phandle
> > "spmi_bus", which was commonly used in older SoCs having only a single
> > bus under the PMIC arbiter, but in Kaanapali, there are two buses
> > present under the PMIC arbiter, with phandles "spmi_bus0" and "spmi_bus1",
> > so we cannot include the file as it is.
> > 
> 
> I know the problem. I disagree with using include files in one case, and
> having the PMIC in the dts in the other case.
> 
> So there has to be a unified way to handle this in all cases.

Rework SPMI PMICs to follow the approach started by Johan for PM8008. I
think this is the way to go.

-- 
With best wishes
Dmitry

