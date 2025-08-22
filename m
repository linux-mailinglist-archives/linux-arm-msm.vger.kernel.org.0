Return-Path: <linux-arm-msm+bounces-70398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A0B316C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29001C8575E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB182F3C33;
	Fri, 22 Aug 2025 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gn1DLx/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD532E88AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863851; cv=none; b=uZ+2YnHkLrqO3CcfWJCzJPlmFJiqE8pfv3oqjyMsO9XHp0eV+ZIgoLsWgeg1MXwJA8q5zzus8sQ+s/fAX8q79lLpr1B/DJDKB5qJr2Y9CQeTsBHgoSuGxzJiKcCJ/fWGqShwYwBQcXDswKcqW8RcM8bSWqwmEwYBFUCV/krwQ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863851; c=relaxed/simple;
	bh=nSefmbJNLEpNd+HiuHfMnSedjNJWSWzgoQMTsT+oEOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd4n/ONgzLSzQTo6KS+tppbzfbDK1IIT+8081ZvCEJG/R/5qstIfqh8ELqTftZQZpMev//2DgRX7LtdsFBEltcYXEuBtcrndgCrwB7i3VWQE6OAaS5QuYH1V0xuUc6+v7+eB2fNUzmypiuHr1kTY90ZHDtAnuPfdkn/P82ntfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gn1DLx/g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8V5VD012445
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IteKC1aYtouJKzTP53k7aPmd
	vVmyIyP/U396Y+IO0Mc=; b=Gn1DLx/gnD1F2d5PojLp0fimH7NVCdpKR4v7+ODa
	e/r30sdNxOJQwpJCxPkDh2IyQ6X9eL32z53S74zncE9skzscDQ5F+8FgeUc3e3tk
	m4OGIQLN9GalUPhFRWNBr1IloJiWy4V2qARkq/LVImFej1PK/rhgduge19TUaPeE
	wWLvhhnHLOp0nPZ6qbToctNqcK5t0yOe8WDRVKTzH1RVNmvKDOpgT7va5rPY5pTu
	X3sl6TBV0+KoO5bmw+MRfUmY8yh5rOJLW5KGpO2gF1B4p2LaevwfiFOEv4KzRm4A
	r7hgoZNZcnRimtBIAPMd6DssapM6G24pLI9BspffA8ewPA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8ewfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:57:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9eb2eb9bso6831816d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863848; x=1756468648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IteKC1aYtouJKzTP53k7aPmdvVmyIyP/U396Y+IO0Mc=;
        b=grUCkI5CpgyNv/adjAwNIyy/lMeCTCBSXhMXsSdA3DWeQpPWwtdxIIjg08IPS/KYLb
         P9Qa3k/1UoZEspPDQaXux5K73K5quZigNEgd1ez2AvR4MaLNY9sJF6RwycSA3ArK7zo/
         racEPVtxZfTxFh7s/4Jh/xd4tSU/eQvIYxsDPZ7YaYzHVRC9yyscTckzEvgwAt5Dg+6v
         hDQZWiEe8wwZLsWfURLZka8Q0PMAQY7E3iUSDsQ1Ftc9BQx+hqlizdbNSWb8Lc36VjIw
         +q32vd0iaiSGRhadtQsyCCXK3/wbHGBa48907QWfXveT19J2bpRxgK+xLfi5esrlRLdk
         SQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9HV7B12+XcIZqVJUbaUBClpXjRyMLuQS4BsE7st/kjnR8D0TwDgjnjAG2qMEa0OFsX3+EkK3OnotY3DvV@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxBpMH2nDxTEAiFYVm0lTmitLgGdE+2FO2qFzNp7pWmNi+FhE
	0VswzoefyWOSquQR03XZGhkjQEqYAQXRnjAnOC1yAR6WwvZjvang/XAPKuJVpwpckRmCifVHr4p
	z3yPpZGGLoS/PMJlDeZ6FgKb/UAkZspmPZWcSyrheOMw/QegOaGVRrJztGukJ5T4R420P
X-Gm-Gg: ASbGncsYDmM2IFANb317GCX/sJhPqIk9F18i/k7BEiNn48MiHEYB1IKehK8rwdcXVPS
	wre8jR/YtpaGdYb3HTesGC9UpXvYqnW/yHIXf3e4Ng37Lr458nfiDKgMlIctT3yLi9xx2o1QkLr
	r+KJmS/ktiruETjcye5bSWehMdUow7vBE25KSXOPi6PQhhROXpJjLCL9XMJd6wvIbQJvJcTOnTg
	mLyvInAyrtWmU6H9uc9GOGS2mWiQax4yrpwytqGPALaBeeR0PLdlUJfGw5CC8TjwpKd1JzFnLQL
	kuoX1AvQ5mObdI/JSz8cfkn+4FFMxzOI7LujHk7PRbWpkqdNhLKXgfgppb/wH3JWpcOPKvxZeSN
	qLzh2uSXqbd0GBsyydWMdaiGKALTnSLi+7VDeAEYq1c4fFE0fwqbI
X-Received: by 2002:ad4:5aeb:0:b0:70b:43c2:3890 with SMTP id 6a1803df08f44-70d97208655mr31235726d6.49.1755863847785;
        Fri, 22 Aug 2025 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCkU8ELIIGHVUoLs0oCCVGOKRw2eAWAdvzOHisLhC+LnbkmMk8bUy9Y1FCe4SEL5Mw4GbMdA==
X-Received: by 2002:ad4:5aeb:0:b0:70b:43c2:3890 with SMTP id 6a1803df08f44-70d97208655mr31235366d6.49.1755863846801;
        Fri, 22 Aug 2025 04:57:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm3447261e87.13.2025.08.22.04.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:57:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <26j2trl7lypmqzjnw6kwgqz32eqcags34qpgaua7zbwxd4lbgx@n54gemj42xbd>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
 <aKhYYjUuOQ7H1aPm@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKhYYjUuOQ7H1aPm@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX3cLLIaTRG93t
 SQRMq5iWWcFKlsgaF12YvyzBz24tazxcjc2RfOgGMa0SAv0sgmS0nkoM2+nlNOnLomiha2ickHc
 oNMYaphjnaR0AcTQ2SUGmG6CwpMwvCMVRpA3zj37DospGBkS+XgnzntMjxx78ulp1HQNprXXFhz
 q9q1emwdxtqN1b+zZ0I+c/66f/1cSzs4ptEM7TSr4FHpHXmsdubTyGDOZYKiewMcRfYYSXowaKM
 DW0OgwIVefyGWlyTFqbHHUPfk4BUgI+CFukO4UjR7F7Y1RvAPmHCcbdz61TY3MNolxIL7m+xTEQ
 JmJ3vVAe52FLdL9vHDm31yEe/8Em3Wn4qzvoiCsrfPCnFvM8CZdoe7SVkDgs27tR4VgWiFzCbeC
 OewRTIAEMX/Bag8IptzAdIJRoiWXgQ==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a85b28 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=3azC0ehC7UzJKJg3NCUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZEnoB_eMN8V3rldDp1sJEo3q0Y_QXvuq
X-Proofpoint-ORIG-GUID: ZEnoB_eMN8V3rldDp1sJEo3q0Y_QXvuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

On Fri, Aug 22, 2025 at 01:45:38PM +0200, Stephan Gerhold wrote:
> On Fri, Aug 22, 2025 at 02:01:30PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 21, 2025 at 03:53:28PM +0200, Neil Armstrong wrote:
> > > The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> > > connected to the third QMP Combo PHY 4 lanes.
> > > 
> > > Add all the data routing, disable mode switching and specify the
> > > QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> > > the underlying DP phy.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > @@ -62,6 +62,20 @@ switch-lid {
> > >  		};
> > >  	};
> > >  
> > > +
> > > +	hdmi-connector {
> > > +		compatible = "hdmi-connector";
> > > +		type = "a";
> > > +		pinctrl-0 = <&hdmi_hpd_default>;
> > > +		pinctrl-names = "default";
> > [...]
> > > +
> > > +		port {
> > > +			hdmi_con: endpoint {
> > > +				remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > 
> > Please describe the transparent bridge too. It can be covered by the
> > simple-bridge.yaml / simple-bridge.c
> > 
> 
> I think this isn't the case here(?), but how are we going to handle
> devices where we don't know which bridge chip is used? I've seen at
> least 3 or 4 different chips already across all X1E laptops and we don't
> have schematics for most of them.

Open the case, inspect the board, identify the chip. Everything is as
usual.

-- 
With best wishes
Dmitry

