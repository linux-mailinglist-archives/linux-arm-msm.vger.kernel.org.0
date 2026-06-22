Return-Path: <linux-arm-msm+bounces-114006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2sPKAcg5OWp/owcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:34:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF26AFE44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:33:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M3WRrSGL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ils7ASIG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64E643020005
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EAC3B7B96;
	Mon, 22 Jun 2026 13:31:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A43B8BD7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135093; cv=none; b=rOwAwCHNWS5vILr3xLpHIpiqJS2E0axl5jE7D6Ggs+qiEz6geuo1sfPFMdcG74phoqUSeIf6GuRZFnDH9xOPiA0ip3gdYgdHzWIZ3M2Zzt6bWbRoN8p4VQ0FkFyf2/PJZMHPzWk/X2BrY0bGAcOK0w5Yssi6lx5CgLDgr1AIXmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135093; c=relaxed/simple;
	bh=mqNPBpW5DKpud7/HAPxwB+AgX0tvOHrLtdUgoYRqgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV7NNECILYLJW30SExoHIrJzaj0LA094ebqwf6/23u7CIvwgxQuHvUgzCjf2yJVKjqHOBDWd25vJdoffb7+W6vOnT7x5Pc5sGfV7PSZ42oBJf7Nzge2yOINTGbNtuv7co9LeBRpdNulqWN+lr9p3My3B8DXfOuTq7dKlDjxCj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3WRrSGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ils7ASIG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFnhF774892
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XexZ6PYZqHiFAxF4MblvIRov
	HQa8h1fFE3wk9u09j4Q=; b=M3WRrSGLoxM2kM6F4XrZckHx8xzHUH33HdfkeZWm
	tJDQqhuVvC/tl65u1O0bFpclPTRCs5Bdh1PCaVneDO7pMIXAwHCMb4Clf13NB5AX
	dLrXozOuKmkgCX1pfBrHAQmCVhfV6lf0cH9W5r3hQmuENtXRzzaEyiLLe23muSoE
	qnyOXffLs9tACv/+NAKonIJXY21ucIFF9s/LGIJyADWTv0P9BxDU7tktSUnRsmpt
	KxrLDdAx1vGfzXOFfI7MRZzo4ldZoGxtrZkLl4k9giRHHLgf43WdtTvtA/tu9hQc
	1b5nDQ/ZPjCgEn7wxlH8ZqdyOfRPMO19HLlIV19QI9MlSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj8pch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:31:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c50cd6cbcso322565eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135084; x=1782739884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XexZ6PYZqHiFAxF4MblvIRovHQa8h1fFE3wk9u09j4Q=;
        b=Ils7ASIGGZiwv1P5Gx2kmY6WTMNb/IDoirIz6sWK4+QSoDwdpNgwvs+499ceqVKXWC
         UIqqmw0mHj88IZh7HhKLCQJJJT+OL44oq0JDNB/6hrxPZ8EHjtNhOc6BUtdM/GfHl+oV
         Pk/K7pv5QYBd2rp5hreeN2MXTX0J/jWmr19Ir/mM1Qa9AWUiK5kYPEK5Mq3VddYTWQY7
         myzfRP01qw6ttfMHx/eKSxkMgoy0MpGT22GDojXIOIvhWrPADi22eW80e9Sq1S3nuyJr
         HsAxOFU+K9++6KwH8h8d5ErmZLpYxLguF5ZXcoZjKP9YfBb49+90LWKaD/Abs4ZB8CuX
         nSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135084; x=1782739884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XexZ6PYZqHiFAxF4MblvIRovHQa8h1fFE3wk9u09j4Q=;
        b=VsMN8I9nPu4J6PRGicWJIM7+Zd+jk3aL/8PMFoS6aM8/0T0lpTslOY9kfWqh2HBRyf
         3MlGvOem3UNjb9jxt8Sc7RZ6X/1rSHEkG2aR/8iK4OU92+hp/7s34xwAlNeFTPxW+1BU
         wr+V4gbQangMuL+QXSU+2FdHUUwLfR8LX/CYtsMYbe9P33/WroPknorqjnk/GF/ZYvmc
         5A/b7bYhlvVLjBDOuF8/klp8vtlpIQaYDOkii1/bFK4GaL90PirFqBPptIZvhiILHNxw
         cuDatD4XFq7TSQhaNVNsrW5Fu7asbm0IkhxCkt8M7l/uLM4bf4Z4RFT/4NuHMkv9DStP
         dEpg==
X-Forwarded-Encrypted: i=1; AFNElJ/2MXomJw/WIiJ+N5KjZciIeTD07LBnqWaNAX96KxZ54XJWBB7RT3+Ncjb+iAkFzquxfBXPqCjUvrCns1En@vger.kernel.org
X-Gm-Message-State: AOJu0YxPszQtubwCQt4Gj+mMyRFf2FCLI4CVWRdj0Vd7zn1qWZlCuycP
	InbKZ4s13vKAo2Jf82Vy9PCgnXmlAobk6u8jAZuhGh28CTjgGagkS1pHYl2wvNyRsEbDD/dWmC9
	lmJ1KTO8e8pH4tUwm6uOsDNCJSS/4MqSQPrISIMppfZYgNHneR7Ss8T+lOQvpyIQCvp3s
X-Gm-Gg: AfdE7cle5PR06wbdZLJEu/Np7Rc/xHYFjnU+PtbkKBofi+JIRtOn9JseoiKhSBhUuIk
	hudtTfwtBzS1kJNh9/YXxsONkew1Q3Z9LcvgrbKycD0SscgB1BEG0V7Yz7+QGknMFyeYm8TbBP7
	u6rEUbjDftHdDjDeyVQkyxgnCBhMgaa2UlCKaLsdWxzrT3Tj+FcjUtkwqTxlW2oYOEjZf7lCqvr
	WhEnoJ155RaUIH0Zt1pIGEZvfXtj650menfocddNsGg1MydtqrA4hhcoZbK+lw3XPrs7wItS7xV
	lLdJxjom7zIqkDfZRNrqJNS7u1S5fvn1BDI1Gs34/GnHlnagGV8P7PPOkPBdKanuyGrPgdzln6k
	vZcRXbf2f4uQVTECTc62abWAfP+Ox1on2zN0f7U4TStHALzB3xexMlCoHRQ==
X-Received: by 2002:a05:7022:609c:b0:132:5d42:55ba with SMTP id a92af1059eb24-139a4eae2e1mr8849500c88.16.1782135083830;
        Mon, 22 Jun 2026 06:31:23 -0700 (PDT)
X-Received: by 2002:a05:7022:609c:b0:132:5d42:55ba with SMTP id a92af1059eb24-139a4eae2e1mr8849459c88.16.1782135083156;
        Mon, 22 Jun 2026 06:31:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm7514085c88.14.2026.06.22.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:31:22 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:31:20 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Message-ID: <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0TOIag__BFyckuRJGdocKEif01oI7xvr
X-Proofpoint-GUID: 0TOIag__BFyckuRJGdocKEif01oI7xvr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfXwaesUyQ6U1AP
 r+8oWLUi5srUXO2debdzp4QZIgGg9HoZCF9wsWw6ah9j05rG3MUb1acfum/I8eMcxx4d4ZiPAWh
 p8Ki/Kr/9Zcv0S7SqlsCvXRQqfwthqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX3+dCAOXB86bR
 HK36/TXpQL6u4FVNI0mtrT/zqMX9XljWUhEpylxsPfHK9Sv7UsV61HwG43X7dGAdIQ4fyEQ4BES
 U9wMlTFttH3CtGCnP3t7DebvO0Bf8mVeWjbJucksfWyslqVQg4B/lvt9Hxc3w7Ww+jaHuIE9gzZ
 586uykb+NvFzNEWtmR7htbz0aj8NJ6FudjXqgz0GiLGG66oBqEZvALkx+SfjHE67rQ2WCZHNmZF
 FCBUnWIDiyOE+Cb6bnmKBbFFsCFIHjEdl4FeVo+eX0+84xD8rjnxv7wzBtepZ1DH8rDEHcuggJ4
 c4UHRuO8sHYufSHgfVKhDoQYsIzHVP1Zz1LebuXhddfKyFO02gxClnDvFJ6y/5Ilt5kuWoGrKoO
 2xEvrc1ztnVkRAv+AGZHw/7KWNqVutT6/zskjogmNrN9l2Cn/h4bZImqhV2ScXyI7CMbXED45m6
 DlKviJvlSheNJqCYw6A==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a39392c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VLUydKHk4FZoEkntXf0A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114006-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BFF26AFE44

On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> > compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> > LDO supplies for the PCIe clkref paths on the CRD board.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
> >  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > index 9c8244e892dd..8b42f5174b31 100644
> > --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > @@ -19,3 +19,18 @@ / {
> >  	model = "Qualcomm Technologies, Inc. Mahua CRD";
> >  	compatible = "qcom,mahua-crd", "qcom,mahua";
> >  };
> > +
> > +&tcsr {
> > +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
> 
> The supplies are correct, but QREF uses refgen4 on Mahua
>

The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
think rename the supplies as vdda-refgen4-0p9-supply is better?

> There's also rx0 with a 0p9 supply on l2f_e1

Okay, RX0 is required for USB and EDP, will add it.

- Qaing Yu

