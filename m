Return-Path: <linux-arm-msm+bounces-74306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E983CB8D0A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 22:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1BB346065B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 20:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA042853EE;
	Sat, 20 Sep 2025 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9gpCqJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522319309E
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758399352; cv=none; b=hU7pbKgwAijJp4vF2+pfV3+Pplk8oIG//2k/4zSctyPsVts9H9B9Mw6dUmvwKaDYwnSNW2TM8zsSdEG9gRf0hCzGTxEKvB4QsOrvP6Yf+I0Pw0P3TrlvLzhoAgN/vz5h1nDeJp9CuqyvBeiMj2fEOcDbHXdbQgC/jojJwtirUIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758399352; c=relaxed/simple;
	bh=ehh7rR35mtVNzGpsoeQkGq1aRFmROUW8bfdfH07Yzj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9qto2fR2POnxMo4nQ72x4HoTOZov7OVP6mb3XPDqEeqiv4N7z1WE+5pqotcPexm0oLrxbBZ/2aFIGX6y5S0wCaV8DaPWgx55e8IL3Zm+YsL5KuX8WxYW13zXOdKdOAV8BSuyIPG5FJX73Vfg/cBTpY6sttCV/XZNH0mpss0PrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9gpCqJD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJVIOO023684
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxr1OwE6woCsy9ph6puI8An7SoT1y1/n+0nY/X+D0BY=; b=G9gpCqJDGLLtRNRA
	+0vRaSXaPz1xSb72Hq1AnJTvGDThZZkQac6ebr0Qjhm1LnyVlL7CSGHVaweymJP2
	fduQmxF8vwejGMONzgIz7dk/SNqWjWsPsU9QUbSXm76D0/Zkol3NP4or6Skb/7As
	I/vVdZTO1+gJyZy6sGQL0TrMRda1wX67I+qQgbAmISt7URWEpf84RsiNec6795HO
	4N3BSQK8SyVVnbvbQpJxUWAgvyIq1BaEVfYELJfZHWdpoV459Z6b1m1Oqop8Tz2b
	m5p5yaairzIFct8JthBeKxF6sheMSW8AVWLnxmz+KsmYJRegV0zrBIB4J+MzoUk3
	CWQ8rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ssbdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:15:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b548745115so67818651cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 13:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758399347; x=1759004147;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxr1OwE6woCsy9ph6puI8An7SoT1y1/n+0nY/X+D0BY=;
        b=iERHuCA8ai/+4xJ+AO8fswXa2pXIxTp59zzeSd/cbRezjEWq2V9RfdU7LKFx28Qazm
         dVsdFh6kFC0TkXR618PtXQkMP4TlAMh1/JpZ1/5hlrresO/Mz5LfEGqeROk7D8LkBEIO
         2wQnujrfAEku8FiKzH9bty3qV9bFGOx3CrTESkbxLiLNRUYbYZkk2x4yEJBs8mytd+Ha
         wYkmSisPIan/D0EaPET2n7L9BDlOS99kBjXlCFV/NB3adPFiECpCy+uou1rRSvNcENrT
         4y4hiVBkTr//CHdDR/R5c1RQD8fnvPeg9r3owK+mE35FyuYsAyixKvCURUlyuV+ATx7O
         IRDA==
X-Forwarded-Encrypted: i=1; AJvYcCWMtqXr62y2uQd2JMq1VdiuR0BgDlwDxCEdh5vkoB3pFHNSJK0X9CZ0VwPSlZvcMbdUjpNGWKtwBUBKjWR3@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLV501+KNIZm2qfq5F0VGvT2HRl/J03snge9rsYxvrRab9mnA
	ulRCboDVOykYb+ujyyAm5wwfvG55eAGu6taqTpO8MDvB1Ae2wxKrVDPvez4vjQ0ZDhVTNHgR01R
	G3GC7E09wD0r/3033s36zybIN12vLuyJX4ggq4/QGNAoqTORUYXNxpLt8Dnity892tOWY
X-Gm-Gg: ASbGncvvfIqd+xRSyylpB+VsQgF51IWYmGGtg9cyTFV76TWy9h0vjygkP/UOctQoojW
	AnDCRHXTHa+0xBt2Z53YcRJcP2hQPLehiwuD2bsEnVfr1hS9oEQjYf7MXovWY9u2Vnkg45GcaE3
	SbsMz7lBVOXYAFREDAygL91j9CC5LSvXXZjJyVapWkPgls516Bmi33aE3QbWJxFyWi/HmLi9HhY
	2pCLq1pxrYpd7lS3CNEgFWfQZHT36ou0lvcRwd1iePuky05dIB5rFMrPEeTbd2WIE/47Bf9eD+j
	jeXBtINGvQfOlY09Oz5FVOV7Kykm+koom9lNUqriC3g3+xSYS/Oxkr4F+vYs/kha4cG0ySZa71z
	sdCPRGwm8Lx8n1uZY7f6wb2OAOQvUDCahk/fK4xseZEUr6I/I5NMJ
X-Received: by 2002:a05:622a:1901:b0:4b7:9e60:e344 with SMTP id d75a77b69052e-4bdaed6db53mr137324091cf.31.1758399347194;
        Sat, 20 Sep 2025 13:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIgnxQ52I0il7IQ1thYRIw+v/2tADbsAI+6zmr+gpePo3kxfC0SKEeBt0o4Y3XDSfKvLXqQ==
X-Received: by 2002:a05:622a:1901:b0:4b7:9e60:e344 with SMTP id d75a77b69052e-4bdaed6db53mr137323871cf.31.1758399346678;
        Sat, 20 Sep 2025 13:15:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3628559a89dsm17870521fa.66.2025.09.20.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:15:44 -0700 (PDT)
Date: Sat, 20 Sep 2025 23:15:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: r0q: add gpio keys
Message-ID: <r6e23h4nkddktkle5rohdiiqkw667rq26j7u2yodao6p3scixp@y3roqbly4oje>
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-2-ghatto404@gmail.com>
 <qiiuezocvxvj5bhrr77v6o2amaaaepdx54pqoewvhtnxce5ccz@g7bhkrb6a4pd>
 <5436E420-E459-4E47-9752-EF80F550FA6F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5436E420-E459-4E47-9752-EF80F550FA6F@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXzjgLN2GuMt0x
 8O/GD9zOiht/0id69X/pYKf0Z94WfNPCNkYNToQMpfUFt82NopKaGwUGwgQgpoYD+lm+LhBHNtg
 HIouCzmUn2hTVhOfSAsMpsiXWiH3ylDEdmDEP6sQFNaV+OpuwBkTfYn/Pj+COIE3RJFv/+5c3p5
 ro3dzaXLsj8+w2CwpxZ3x1o7moAXKxhk/d09van5bT5+iY5o8ob/A70tXrA5ivq/q+xPz5nYrmt
 4M6jaDhTHaFDncJ47u/ESV6WJfxpsbVkJcsICXhzP3JjgQlrk2RKKV3Nd6uBWCPUGAaMpdVzYIo
 ltlSV5VaPIESEa10mcay/gVA0Nw6ggqVAa69fQFsQYJeZjxyr/VMfzPk50JSefbdXKjd/LQW1xd
 wH/1GI5r
X-Proofpoint-ORIG-GUID: BCbUpvVIi_Fn2P-hFCbKgmNejbQ89tOO
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cf0b74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=gpHoPsJBt9AuGvPBovIA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BCbUpvVIi_Fn2P-hFCbKgmNejbQ89tOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sat, Sep 20, 2025 at 03:02:42PM -0300, Eric Gonçalves wrote:
> 
> 
> On September 20, 2025 12:45:27 PM GMT-03:00, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Sat, Sep 20, 2025 at 01:46:33AM +0000, Eric Gonçalves wrote:
> >> Add GPIO keys support to Samsung Galaxy S22 (r0q).
> >> 
> >> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> >> ---
> >>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 53 +++++++++++++++----
> >>  1 file changed, 44 insertions(+), 9 deletions(-)
> >> 
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> index 880d74ae6032..70e953824996 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> @@ -2,11 +2,12 @@
> >>  
> >>  /dts-v1/;
> >>  
> >> +#include <dt-bindings/input/linux-event-codes.h>
> >>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >> -
> >>  #include "sm8450.dtsi"
> >>  #include "pm8350.dtsi"
> >>  #include "pm8350c.dtsi"
> >> +#include "pmk8350.dtsi"
> >>  
> >>  / {
> >>  	model = "Samsung Galaxy S22 5G";
> >> @@ -28,13 +29,19 @@ framebuffer: framebuffer@b8000000 {
> >>  		};
> >>  	};
> >>  
> >> -	vph_pwr: regulator-vph-pwr {
> >> -		compatible = "regulator-fixed";
> >> -		regulator-name = "vph_pwr";
> >> -		regulator-min-microvolt = <3700000>;
> >> -		regulator-max-microvolt = <3700000>;
> >> -		regulator-always-on;
> >> -		regulator-boot-on;
> >
> >Please don't mix up refactorings and new features. Split this patch into
> >several.
> The patch only added gpio-keys node and pon_resin,
> pon_pwrkey. Do you mean I have to split each button
> into separate patches?

No. The patch also moves regulator-vph-pwr and changes the comment in
the TLMM node.

> >
> >> +	gpio-keys {
> >> +		compatible = "gpio-keys";
> >> +		autorepeat;
> >> +
> >> +		pinctrl-0 = <&vol_up_n>;
> >> +		pinctrl-names = "default";
> >> +
> >> +		key-vol-up {
> >> +			label = "Volume Up";
> >> +			linux,code = <KEY_VOLUMEUP>;
> >> +			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
> >> +			debounce-interval = <15>;
> >> +		};
> >>  	};
> >>  
> >>  	reserved-memory {
> >> @@ -47,6 +54,15 @@ splash-region@b8000000 {
> >>  			no-map;
> >>  		};
> >>  	};
> >> +
> >> +	vph_pwr: regulator-vph-pwr {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vph_pwr";
> >> +		regulator-min-microvolt = <3700000>;
> >> +		regulator-max-microvolt = <3700000>;
> >> +		regulator-always-on;
> >> +		regulator-boot-on;
> >> +	};
> >>  };
> >>  
> >>  &apps_rsc {
> >> @@ -119,8 +135,27 @@ vreg_l1c_1p8: ldo1 {
> >>  	};
> >>  };
> >>  
> >> +&pm8350_gpios {
> >> +	vol_up_n: vol-up-n-state {
> >> +		pins = "gpio6";
> >> +		function = "normal";
> >> +		power-source = <1>;
> >> +		input-enable;
> >> +	};
> >> +};
> >> +
> >> +&pon_pwrkey {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&pon_resin {
> >> +	linux,code = <KEY_VOLUMEDOWN>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >>  &tlmm {
> >> -	gpio-reserved-ranges = <36 4>; /* SPI (not linked to anything) */
> >> +	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
> >>  };
> >>  
> >>  &usb_1 {
> >> -- 
> >> 2.51.0
> >> 
> >
> Resend because I forgot to CC the mailing lists

-- 
With best wishes
Dmitry

