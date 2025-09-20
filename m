Return-Path: <linux-arm-msm+bounces-74310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D99B8D23F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 01:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02085625F59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 23:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527CC267B94;
	Sat, 20 Sep 2025 23:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqoANKw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34611DDA18
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 23:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758410488; cv=none; b=E73tsg6mLa9WaZsX1zAJp3uZIvsh9dDzeE61WW1DaBlCVum5/iHTTayMG9FGw6F5CCG4k/Hez826LnTIlOf6ywQM2bN3jQo+yuzalF+8IU8PKkqoHxnyxpgq38XRJQNszjSTl5nZltFch6TzjWtCKFn0hXcEk0UzEHNAIusrYIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758410488; c=relaxed/simple;
	bh=RUL1Zs2ER3rymeciz/eOY8tNxSFCvRDGsNi6QpI68eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/62fzekHAizt77RDb1Mi9M1n6ibdpa0iwpdVNn4NY4yWzg88EITsYGgEXaffjj4kr9CR1nZ1nEA2dJ26Ju5TjzFVQauGE9t8mDE9Qlhr1nmKz1zZtOC5OPdjoHyOI6HkpZUBrkTpyjIdSbLEfkX8oLJDWaIU6Iwl8VAhE8XUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqoANKw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KMHSOX011423
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 23:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ08kPi4J0e6QPjOfD6/wld0PtOfnxlKb2Gc/b7w35U=; b=pqoANKw6CwhCz9j1
	JD7U/Mv4jQ5cCH+952wBFWXKgoWPPlqzDBlBYQu3xziRVSkLFlP2sm4VxW3UWLKy
	qibAH/jOKD2fvndcAaHs9GErZZdc1GV9zVSrvJV/H7fJzNuQq8Sf4NOEZaEPXAas
	j6oz1j6NTC1tWPfmoBfqTtGKPsSI6CoQqng0d3g5rh0ezbvoIBKpg8xjBwE4+vhQ
	ezkJIOttUd4YH1KGh5RT8ar2Rb1sgtySaqz/pWWNE4CC51JmV7Puj1hp+UJQHYKl
	9m2p+DfmUBRDTpEXIhc09OXsnYkkN/Gad9NSVibZISwC2kCk8r1iFCfeVIsySOff
	4e8+RQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg31ct0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 23:21:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b49666c8b8so57377591cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 16:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758410484; x=1759015284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ08kPi4J0e6QPjOfD6/wld0PtOfnxlKb2Gc/b7w35U=;
        b=DSzU1P1CJA7qYSwQgG9fNKb6UMx70nihUDkMSDvFIC8/N3Vs1phAQu1IC1OjN0amJS
         cyGCnXTxDAxjDPnQRTsYCfauQt+yE4JEmSg4bUZe+NXdBVFeIQG6h5/qbc9Re02QtQNN
         5tNGhD/uRHkqZcbZViQkfwBoDJP0H5BUrebC2IIXdtrqrV3goXTBx94L+Iue3EVrJ9FM
         orgO19TJB2pRkc6vTXYsca2KLQ/v3z6E5uNJq4qD4hS9IGWFyK5D88Oh+YC5vGoSg5ck
         3KVy2XatA/XcOOfqt0KVmrEJXfp/uDK5L7h89Sg3ahzc8rvNCTZeDq40VYJNMp+Nt6T1
         D5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUktllsRd6A//3+/fU0UArdIP7YN5BdFRWcw7C+KLups5xrGZTroK46Ug7Pqq2jPhMlNY9XCZaaxmJvUyBs@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAcBUN4Eh08ZcRsho9R58CbUitG3s53bu3BLxvq0WVEghTJBI
	bTbBR5mxB3snnBF/XkrmycJuvPtZsSqQLVpr3HsmZsz2lmVskKgKEcOrKk2KV7SZg3zb9Rbnlr/
	2cM6myXEmdkwiPebiZ0J3pnx9UvbpUqdwUisVBlhmrpdIZ/QE/XeHVr1yEZy4FwveFdYL
X-Gm-Gg: ASbGnctf141BIjfgekntWMjdUKnfKXH/3DdcvCdTzB1dpnG6YE+7+SYdUmI0Bg/et/s
	IJTn/egxcxDDP96ZuQ06F1GwA+q6eAZZMy7QtmDyp7u7urJWGa7K5QZaOSe29xfRl9Zj3RuhRU+
	VfW3Sb5lhvr/JClq/i1B3gIzSWzYFRcD3RXlpMXJTh84I12Aa/xpbt9bJsNo/gKU3ScXlynrUNh
	WJSFshvoCHM12vQCS6w1hQRAFBb2pyXu0SzyG4AraTruMOuLxgRK7hOXNWdS6SnymUYbGhEH/qM
	uRMMCS/qatk4Zl0P9418/6C6gEND9pKG0DfvTmWIqooWNCHzlz+pWHEBAt8LaQPnpQGNmx/xAP+
	FHjsaJy7nSXrcG1Jven+uUNcyLrLt3dunXLB4WMhnH8cgMd/088uw
X-Received: by 2002:a05:622a:1389:b0:4b9:6bbf:7073 with SMTP id d75a77b69052e-4c0720ac134mr82344421cf.53.1758410484399;
        Sat, 20 Sep 2025 16:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYGaTWFE/W0JZvdbyAwuAt0nxQOFKarDbY+G/GCtpOyicyxYjNEFi6dQXVLSt7TGc08dWv0Q==
X-Received: by 2002:a05:622a:1389:b0:4b9:6bbf:7073 with SMTP id d75a77b69052e-4c0720ac134mr82344251cf.53.1758410483922;
        Sat, 20 Sep 2025 16:21:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a68e8814sm2191909e87.62.2025.09.20.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 16:21:23 -0700 (PDT)
Date: Sun, 21 Sep 2025 02:21:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: r0q: add gpio keys
Message-ID: <3sox7jdjpahljevgyctg7zbvoua364hyajbap3ulsykloxqzna@dl2lfxdppdba>
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-2-ghatto404@gmail.com>
 <qiiuezocvxvj5bhrr77v6o2amaaaepdx54pqoewvhtnxce5ccz@g7bhkrb6a4pd>
 <5436E420-E459-4E47-9752-EF80F550FA6F@gmail.com>
 <r6e23h4nkddktkle5rohdiiqkw667rq26j7u2yodao6p3scixp@y3roqbly4oje>
 <B58EE981-3702-4FA3-B150-A3C862643870@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B58EE981-3702-4FA3-B150-A3C862643870@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX5/n1G4X1aWit
 e4t/35t3fP7kpriAUEIz4nUC6A1AHQiuCofreXB5ZAUj71S3yZes+nWQcx0OBKJoD/QzFK8mMnl
 nxd7dbDO8Nfg8hRgWuVUMx7KNGQDfbw259TVuw15bca5myPKQB+uwD5zOC16f/1xEYzXLknd8yJ
 x0ZYBb3jHBmahoFZoW+evgqSiwqGRl/iQy+hnow7MuF43UbSI35hOHcM/24uqO4AUujFq9BOG/Q
 cFR3l9hmd/EDD3MctXXM3Ev8o30GQQmdnjt1Z2sEIPxR/bSlOtSCCXLsBXgb8UfieS1hxn7yOWi
 ZyTImwDDYyfoBeIc7DFc9bbFlmhd4LWKxVpZylY7t+jmP1+SODkrmJ7IRiZHGMsfZ4ufvtKcXzR
 pb0dmAl7
X-Proofpoint-GUID: m-yniTROuR8yAVK2SsKhCsfkIi9oCkGp
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf36f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tsbVFwL6q7DH9GSC2JYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: m-yniTROuR8yAVK2SsKhCsfkIi9oCkGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_08,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

On Sat, Sep 20, 2025 at 05:22:28PM -0300, Eric Gonçalves wrote:
> 
> 
> On September 20, 2025 5:15:41 PM GMT-03:00, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Sat, Sep 20, 2025 at 03:02:42PM -0300, Eric Gonçalves wrote:
> >> 
> >> 
> >> On September 20, 2025 12:45:27 PM GMT-03:00, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >> >On Sat, Sep 20, 2025 at 01:46:33AM +0000, Eric Gonçalves wrote:
> >> >> Add GPIO keys support to Samsung Galaxy S22 (r0q).
> >> >> 
> >> >> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> >> >> ---
> >> >>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 53 +++++++++++++++----
> >> >>  1 file changed, 44 insertions(+), 9 deletions(-)
> >> >> 
> >> >> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> >> index 880d74ae6032..70e953824996 100644
> >> >> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> >> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> >> >> @@ -2,11 +2,12 @@
> >> >>  
> >> >>  /dts-v1/;
> >> >>  
> >> >> +#include <dt-bindings/input/linux-event-codes.h>
> >> >>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >> >> -
> >> >>  #include "sm8450.dtsi"
> >> >>  #include "pm8350.dtsi"
> >> >>  #include "pm8350c.dtsi"
> >> >> +#include "pmk8350.dtsi"
> >> >>  
> >> >>  / {
> >> >>  	model = "Samsung Galaxy S22 5G";
> >> >> @@ -28,13 +29,19 @@ framebuffer: framebuffer@b8000000 {
> >> >>  		};
> >> >>  	};
> >> >>  
> >> >> -	vph_pwr: regulator-vph-pwr {
> >> >> -		compatible = "regulator-fixed";
> >> >> -		regulator-name = "vph_pwr";
> >> >> -		regulator-min-microvolt = <3700000>;
> >> >> -		regulator-max-microvolt = <3700000>;
> >> >> -		regulator-always-on;
> >> >> -		regulator-boot-on;
> >> >
> >> >Please don't mix up refactorings and new features. Split this patch into
> >> >several.
> >> The patch only added gpio-keys node and pon_resin,
> >> pon_pwrkey. Do you mean I have to split each button
> >> into separate patches?
> >
> >No. The patch also moves regulator-vph-pwr and changes the comment in
> >the TLMM node.
> >
> I thought they would be too small to be
> patches on their own. Is it okay if I split
> them into 2: arm64: dts: qcom: r0q: small refactor
> and arm64: dts: qcom: r0q: add gpio keys?

SGTM.

> >> >
> >> >> +	gpio-keys {
> >> >> +		compatible = "gpio-keys";
> >> >> +		autorepeat;
> >> >> +
> >> >> +		pinctrl-0 = <&vol_up_n>;
> >> >> +		pinctrl-names = "default";
> >> >> +
> >> >> +		key-vol-up {
> >> >> +			label = "Volume Up";
> >> >> +			linux,code = <KEY_VOLUMEUP>;
> >> >> +			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
> >> >> +			debounce-interval = <15>;
> >> >> +		};
> >> >>  	};
> >> >>  
> >> >>  	reserved-memory {
> >> >> @@ -47,6 +54,15 @@ splash-region@b8000000 {
> >> >>  			no-map;
> >> >>  		};
> >> >>  	};
> >> >> +
> >> >> +	vph_pwr: regulator-vph-pwr {
> >> >> +		compatible = "regulator-fixed";
> >> >> +		regulator-name = "vph_pwr";
> >> >> +		regulator-min-microvolt = <3700000>;
> >> >> +		regulator-max-microvolt = <3700000>;
> >> >> +		regulator-always-on;
> >> >> +		regulator-boot-on;
> >> >> +	};
> >> >>  };
> >> >>  
> >> >>  &apps_rsc {
> >> >> @@ -119,8 +135,27 @@ vreg_l1c_1p8: ldo1 {
> >> >>  	};
> >> >>  };
> >> >>  
> >> >> +&pm8350_gpios {
> >> >> +	vol_up_n: vol-up-n-state {
> >> >> +		pins = "gpio6";
> >> >> +		function = "normal";
> >> >> +		power-source = <1>;
> >> >> +		input-enable;
> >> >> +	};
> >> >> +};
> >> >> +
> >> >> +&pon_pwrkey {
> >> >> +	status = "okay";
> >> >> +};
> >> >> +
> >> >> +&pon_resin {
> >> >> +	linux,code = <KEY_VOLUMEDOWN>;
> >> >> +
> >> >> +	status = "okay";
> >> >> +};
> >> >> +
> >> >>  &tlmm {
> >> >> -	gpio-reserved-ranges = <36 4>; /* SPI (not linked to anything) */
> >> >> +	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
> >> >>  };
> >> >>  
> >> >>  &usb_1 {
> >> >> -- 
> >> >> 2.51.0
> >> >> 
> >> >
> >> Resend because I forgot to CC the mailing lists
> >

-- 
With best wishes
Dmitry

