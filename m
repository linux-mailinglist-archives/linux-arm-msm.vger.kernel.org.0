Return-Path: <linux-arm-msm+bounces-70391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC146B31680
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA141D052AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BA32E2F03;
	Fri, 22 Aug 2025 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut4ZmXNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7E2F1FDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862847; cv=none; b=ivzpGSZbEbCEzuS6o2ngKtqJVQqdiKsmHOCe4WMhsxZ0/wTVJmM36JOwIlm612sbRGyQIVK4snH62EyioNynHw06arvGkm7IZhw6eNjTAzpnP5PIYTi7zj8+VOFHeU8vi5WWgFzAlwO7+PrdAECObGdR2r1ZXOHIBpff7UgybYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862847; c=relaxed/simple;
	bh=z3dg3+uFGdtg0oNaTcQ0qCnHDKy+RCFkNf7fAl1o4fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arBuYj3laEnP7u7S3pbbVyZNMJxYbuami1a+wNps7rNrjmAv7yUaUP/h2ULew5tHTyatKEqlQrzg3vkAwTd7xBcK4S/3A0z9ATEg30aUKPCT5wxHXL79gLHxcV7rVJOLEjpOXd6152Yb5jK7YU7NlRm4CDYqLsbj2RCyGw3M8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut4ZmXNN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UW1S028822
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R3VBpF5unS5o4qUNQOe4EEFU
	h9fh4aEIJOsFeee/U5g=; b=Ut4ZmXNNyrfpyfc5sOajrSXqKleaNdKErZTKNrYa
	hhfX4lFu8Pwk39eh2dml0oUoi5eAY9Wa/aqCJ38bUR4Yc/h44ah+Kiv1+KYjhUVw
	Hu4u6BNMBJnOVcqR7HNWRVed7m7TLTkCxwzU8M+IndULAsTPZnujyh58u9fqRQUb
	7EweY/wk6S90VWr8dREaM6dmdu9DWMtyNf8a6EVQvneiP8JoKdBkBNas6NUZ1Msn
	gI6ymC9IHUfGYl1g92YOK6DDzozIcWAS0bdQRWgEgsjRSDdqc8uhAnQ5fgTqRFgb
	XaKJmhM3fmwpbCgEjkWPKN1CsZLYAZGH9l8olNoG8Gqpbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cs1ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:40:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8706abd44so521188285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862842; x=1756467642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3VBpF5unS5o4qUNQOe4EEFUh9fh4aEIJOsFeee/U5g=;
        b=okOlcLtom921CrI5OLjxjoLD2/1B035Gx0B/6/T59H7lDdOJmL4Li8BqjROewih/M7
         +SEgddpKePhNKchCVqkjpV6JPw1O2qSACBCJGQqeBQ8Jjxq0Y4DPoV69VygzRaxO60j/
         tcswpbs4d3PYSOzVSYfYdOGcGilJMr1N6jWmCxUR/UqWxHEk1Fwt4Dq3RY/qMwIgiHuJ
         DAelVY1Rv3UouLOuZz19PKr9NxmHZyIlU0ViygCjNJCsP2F+qcnzjvy7c6gRtDK5OMdE
         7UO9NeQz0MtlvvRIOBp8YqGznpDAp0Y5A50yQLWhNrL7fZQwQqUqRCmBv6J9OyQzJS1Y
         X9ug==
X-Forwarded-Encrypted: i=1; AJvYcCXsQvUWGM6sBt3Pc/HUN9wJlxLCk0SbOOrK15Tga0m6RIH5ouzGl67mIqs9bxVnufsSih5BVqOyj9hBTQie@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQ/bTWxQo6sKoeiYmKAodBL8+m1EWTz+GomZOo99CecRB4svg
	Lb46YvqCiYvGk2RH8J2Vzldcy7lUryJ7393bHK6XnH+9tduLwTY+1FdfBdWfI/P+8WoPoYe8gU0
	Gfrstoc4fE1aVbx/rECW56OihXmEU2MSaNpvO+VjVQtUgt9r/DRpdd5SNgB/SrxlrWx7f
X-Gm-Gg: ASbGncs6JDlIeJu6GEIvbwwphCgpsYYT6hxL5LrrTwB1bm5x63aAVbT4HdM65/HtFFI
	K9v3iLryw2fyX/U0TOCbr+iFmNcsHpLHQB41h83cstkUlsAvhyhZ56CyGLQzkeU1Gw++fDqoC6b
	tRQZvKhIecZh0FGVx9p6v36fekzqaWHR6wRSF08t7b/SQfpsygvzW0ke5q/lJTzqd/x5tPGQRyP
	iN3YovBNzDhadLvWTxdFlVx0JdjJtA0Dlu8FedyYzmGAZfwL56lbotjYEb3Ui87PZrrbmR4M2Jk
	Z7wG5BAjZCbxDv4SrobuQPq4tkY2mk/O/4fY1JIdtQF0oRZRUfSNdPhDNHQuqLF3mvbNmYAg4pv
	qJOq3t3c3UhRvP8ZzEDdnnWW1rABjsavjezSVWjF3nAYzvVoKBcYS
X-Received: by 2002:a05:6214:d6d:b0:70d:8d5d:59a1 with SMTP id 6a1803df08f44-70d97205d99mr36224906d6.45.1755862841816;
        Fri, 22 Aug 2025 04:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqTyhMMs7n5KY1lW09izaZu/eTxO2Ydf4e+xDEopme0nS+sjhxdykVOhMlGGOSceWoiv2AyA==
X-Received: by 2002:a05:6214:d6d:b0:70d:8d5d:59a1 with SMTP id 6a1803df08f44-70d97205d99mr36224116d6.45.1755862841093;
        Fri, 22 Aug 2025 04:40:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3153cddasm255874e87.125.2025.08.22.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:40:40 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:40:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <k6n4ojdhsr2sjxoyrvo7qdoajdxbrjuuxfuhw76wrmpegdyayo@arumyjto7kpp>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
 <431de5f8-2dca-4ec0-9b94-fcc12480e8c9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <431de5f8-2dca-4ec0-9b94-fcc12480e8c9@linaro.org>
X-Proofpoint-GUID: u9eYsGYVb1tpz4yBNhIwL9EnxwcNGbIY
X-Proofpoint-ORIG-GUID: u9eYsGYVb1tpz4yBNhIwL9EnxwcNGbIY
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a8573d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=0Y_XMaiD5XwD0HHrWAcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+fx4xlFujKVp
 ferldeIuATIhXj0HerCXGm7wJSmuRmcNOlUFIPuywRSHRzT5/1UsskRsUroLhT2AyKg4MP/E+s+
 UynuBerNA8NjXQ+4dzfCjd0GOBpg7ZRJLqRmwvC53CCujAufIPVTcGtibTfuIPTQ5Py4pAIV/Gi
 4ACdOb206XINlMpbExHaCmdFf4JWsGH31eHD4BPohDOcrJxj8/3ObvQeTHT5dqxzX1hsPC9O4z8
 YGx1NcnGgM6NVxXyqDVZyc+GavgTU3EejWbtEHkrG0Qo+ATflFQPMyiUQIHw+DPWQivcMrK8SWK
 +etxLn42RB13BBTiA1MhWavmSbmYOMMkQszhzUPtlRgN2Q1TYTmACRpsL6p5gh5KHD+y/VD71Os
 yz6xozV3BHY33dgCeugq2yUiWwuF7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 01:02:56PM +0200, Neil Armstrong wrote:
> On 22/08/2025 13:01, Dmitry Baryshkov wrote:
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
> > >   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
> > >   1 file changed, 44 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > @@ -62,6 +62,20 @@ switch-lid {
> > >   		};
> > >   	};
> > > +
> > > +	hdmi-connector {
> > > +		compatible = "hdmi-connector";
> > > +		type = "a";
> > > +		pinctrl-0 = <&hdmi_hpd_default>;
> > > +		pinctrl-names = "default";
> > 
> > If this is a DP HPD signal, it should be a part of the DP device.
> > 
> > > +
> > > +		port {
> > > +			hdmi_con: endpoint {
> > > +				remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > 
> > Please describe the transparent bridge too. It can be covered by the
> > simple-bridge.yaml / simple-bridge.c
> 
> Ack, indeed it could take the pinctrl thing.

Pinctrl, enables, etc.

But from my POV the HPD pin should be a part of the DP controller
itself.

> 
> Neil
> 
> > 
> > 
> > > +			};
> > > +		};
> > > +	};
> > > +
> > >   	pmic-glink {
> > >   		compatible = "qcom,x1e80100-pmic-glink",
> > >   			     "qcom,sm8550-pmic-glink",
> > > @@ -1007,6 +1021,14 @@ &mdss_dp1_out {
> > >   	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > >   };
> > > +&mdss_dp2 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mdss_dp2_out {
> > > +	data-lanes = <0 1 2 3>;
> > > +};
> > > +
> > >   &mdss_dp3 {
> > >   	/delete-property/ #sound-dai-cells;
> > > @@ -1263,6 +1285,12 @@ &tlmm {
> > >   			       <72 2>, /* Secure EC I2C connection (?) */
> > >   			       <238 1>; /* UFS Reset */
> > > +	hdmi_hpd_default: hdmi-hpd-default-state {
> > > +		pins = "gpio126";
> > > +		function = "usb2_dp";
> > > +		bias-disable;
> > > +	};
> > > +
> > >   	eusb3_reset_n: eusb3-reset-n-state {
> > >   		pins = "gpio6";
> > >   		function = "gpio";
> > > @@ -1486,6 +1514,22 @@ &usb_1_ss0_qmpphy_out {
> > >   	remote-endpoint = <&retimer_ss0_ss_in>;
> > >   };
> > > +&usb_1_ss2_qmpphy {
> > > +	vdda-phy-supply = <&vreg_l2j_1p2>;
> > > +	vdda-pll-supply = <&vreg_l2d_0p9>;
> > > +
> > > +	qcom,combo-initial-mode = "dp";
> > > +
> > > +	/delete-property/ mode-switch;
> > > +	/delete-property/ orientation-switch;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_1_ss2_qmpphy_out {
> > > +	remote-endpoint = <&hdmi_con>;
> > > +};
> > > +
> > >   &usb_1_ss1_hsphy {
> > >   	vdd-supply = <&vreg_l3j_0p8>;
> > >   	vdda12-supply = <&vreg_l2j_1p2>;
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

