Return-Path: <linux-arm-msm+bounces-92814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Jy4ASlej2mtQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:23:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E951389B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DA4A3030EDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23027365A0A;
	Fri, 13 Feb 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5zSbXeR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXNT3Jgf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5236213B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003419; cv=none; b=CURcY224A2gDMQrhLNFncYjaBSXrrUMyz01DlrSWsYP6sTkXbFXBzZO7r6DErzCdjfLeQJoMoKxt3nxHJ/VTxtRS81IapIfrYguRly+170o7G3VEUtHBQW/+c1anhja0SL0jPARGRej2c8AVa0dcnkMhAbLpYFzyFkPN8b/+FM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003419; c=relaxed/simple;
	bh=GQjIVWkVSoqxOh+w41jzbcaxrz8M5s3AiF6NkLFjjKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ys7LgLukpboXOKc2ntMLOPLUZpypTQKZP1l7uTHbRBl2j3zF6DpB66SOcA4G46KEAR7CUkm4xBR8uYp+cq5SqEu4ooIp1nK/sk8menLonHTHgu8G/XcBhmW0E6CiP0+lSHhgSyeuVQnTHRoPMKLsrjxKElUhhTRoF4AgARSTPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5zSbXeR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXNT3Jgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DDTbvG441052
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xMqJ6GIysdqE7AaCQWBNtRLK
	P7OubguBLNmQd6OUnHw=; b=p5zSbXeRlKPbscbF38Z+fW3Vjsvq6P47KbGuu5jU
	J3tbSt9RG8bWM444hFgzTHK9V0Uvps6e0WrBZ7qXdXpooVI8ltivDlAz7mHCipWY
	L7rHxnKxiUSaBAQP8TUC4YdIh/VPlokHm1PmiGQBEAnx+f0QmS+liAI0ZoTEHg6M
	TzTZ2NlHaF7qHLf/+NZ88AdWb0yFa2kO6Oyu0r57jd7z+onmPf2baSVM89yUUscK
	lOWFInvFckVTwIpD9reDuhYhhwRS/wFFqc4gyTcK3afrk2iwqbtK2tfFdV5gBMVd
	mDpITzOK4yurA6W9kdirkSZMDSMbTzetCoE/tA7u++AiDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb14gh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:23:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso548600185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771003415; x=1771608215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMqJ6GIysdqE7AaCQWBNtRLKP7OubguBLNmQd6OUnHw=;
        b=EXNT3JgfXPdIjHQB6Y1BrwaUVKTtlRZ1pAc/Qpsl3bGf+AiBuGsxeCYg2LNoWtFA2i
         29ZFmrgi77LPys9y6wogqEcPAg98SktaCf1ysSLdO00i7jgbUYArtKR6p+SnLww0KyTk
         XzuzuYnOtSMYeb2iEUZf3dbRjohAwbIob8dNg/PNphFGQvueMioI6ildFMKvdAQGrypv
         h/MMQoO2/ib1rhdshBtFCWQCyFSTGD4wLibRezNmn9Ku6/25Vx4N3IM8ONNh6xC8FmFg
         yr42jiAsJf4PLkZJkayJOpgDmnhY6RC0s13rpVBaxbqSf+N1F0q9NFZ6G7A2UZYeH406
         nWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003415; x=1771608215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMqJ6GIysdqE7AaCQWBNtRLKP7OubguBLNmQd6OUnHw=;
        b=MkneE93qg/c4l9mfVp/5gr7qsVQoQM5wvyqtZLIRTDd7xNTslQNWKQCfVw/VOu1VQK
         hMkUusW/Gl5msHnoJLfB1hiELSjD2A49+oxEACemdgw3SFXxeiyza8MY37aeNQGbx+0j
         s4BgvRSP0F4KaJBplUBfifEEvRq9zSgGBmFxOsNNZSEDPv8FeZBz/2P6GZI43lT5h3qj
         5u66wT7EVJViNZOthhauosCZeQ0OCs9/n4Lu2yqwZUfM8eZl7NVXjEsCM5wOc5AhfU7S
         USEI1awh9Re2GoqN5LVouDkdf6YWanyfaG0yKHmgenZXc0InGKRoOS4+kCYLZmPl98wE
         PKxg==
X-Forwarded-Encrypted: i=1; AJvYcCXRxLOE8eu7SFv9YVd/MqcIgPxVwPZbBKjHIg9NGXVAwosnFsMuNJoKXJZFfKIddNveaLR370WCFKqtCukQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3agumIDPOlujU8PFbjbZCO9bOLTN/VF3TArW+bMBKH+tvQwYl
	7hiMoyQP4gwBAP3qgqhq6/nscCUNYoE1vUfH4L0VScpqtyKCno3ZUCTMWTEKYogGmZWqRob3py4
	7Jrc1Kl+JfZv5UXdlfmsnvxegyJE1IvOCQj8PIwqik02NkFJSK4F7dz+R4VM9cxK9f7GD
X-Gm-Gg: AZuq6aJbqR8mpa60hFdKjOnpC2Ci8vj1z9vz6zUW5qLfdDeznOOTgw2uE+f7hgh1Y7+
	I9mr8QPFBDH8OYYFB9SPEU/gvsE2gjc7lqvSbUXB2VXwI/Vi9OznxRBPeBOPOMRLhWHmv/ZdsHM
	C5lKIRO+lJC+U3PoC2LjK0uK/g3waZyBtotafVdl0ue3dofyphkL2NWPJh+S8jDVhZvNXkWh4ox
	bmxF+6kPwW8qk+lR0jnh0jF6dotYkx7gYMDzysIZMD1rVwiUUhqIbn7eS/hfV4Kwrgk6Ib03Rt4
	5vOc+x8pgpqYvbUXDhrGsOInAdFQ8Zn2BxgCpATq8Y8GlazmDzBJZdgGWMU8uwGXW3TyhpCT3BF
	wR26E7eNzWrtQKtu82fJHjGcWpEpkHff9w8fsDpys4/AiT2JfwHBG9tALBJhf8GuqWXKGybgCTu
	hh7tsP76igsBdU/XEcPi5rMb0L/WpTyb2xj9k=
X-Received: by 2002:a05:620a:400b:b0:8c7:155a:6d04 with SMTP id af79cd13be357-8cb4c01488dmr37201185a.54.1771003414937;
        Fri, 13 Feb 2026 09:23:34 -0800 (PST)
X-Received: by 2002:a05:620a:400b:b0:8c7:155a:6d04 with SMTP id af79cd13be357-8cb4c01488dmr37195885a.54.1771003414411;
        Fri, 13 Feb 2026 09:23:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689d15bsm13399651fa.12.2026.02.13.09.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:23:33 -0800 (PST)
Date: Fri, 13 Feb 2026 19:23:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>,
        Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-arduino-imola: describe DSI /
 DP bridge
Message-ID: <qugoirbj2tkor22k5lom5fcibr4sz3ydhsdntokpjq6mu62fde@cnggfnh7ydpo>
References: <20260211-uno-q-anx7625-v1-1-677bbcf63668@oss.qualcomm.com>
 <3bdf5c83-bdc8-403b-957a-052afe27b99b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdf5c83-bdc8-403b-957a-052afe27b99b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMyBTYWx0ZWRfX2pxEZSFtM+X5
 gKGEdboSS9TAO0P8uGMaZI94t866/zgHjC4rT0ec3uHqhkWboFqAzdV9/ymzsROhQZb07iaLQOR
 aR5wfDtGcuHzFqMTPvCIc0gp9ikaQO+QBxmf+hkv2i/XvqK9HKoKXoQ08HUpdMHexvLOV7tFDnA
 HlXeK200HyuolTMRRceeDt8rSCjr7IZELlbHaZR6BxrhofL5yhcUk3FD4M59cctOEV7fQ6FF5D9
 TtaDd6oVPuaCOD8KQFbWIAwdrne/1ZGhOP9xq9lHFEmmRRRFSMwjN+HRbRylKx+Zof8JirYEfJA
 zVx7N6u/98qjaudh1GMlaE+zPHwnxsEr6HnBADQZsizJGy9v8Hk23WuI0qLHV4JFl+PfTcfZebY
 wp4L8E76CwS7syrEe8co2pQlYik8ZCterWvzMbc2y4zsoKwLnUZAEtaT+bXV0SSycPfMdc5JWU4
 e5o2vBD9Zmm6y7hCWKQ==
X-Proofpoint-ORIG-GUID: i5KE4QZG6yGr-1dlaWCVFfsMzYedxc9Q
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f5e17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=rCqQYDvUj8KrUa5C-6oA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: i5KE4QZG6yGr-1dlaWCVFfsMzYedxc9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92814-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.58:email,oss.qualcomm.com:dkim,arduino.cc:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74E951389B0
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 10:40:41AM +0100, Konrad Dybcio wrote:
> On 2/11/26 10:28 AM, Dmitry Baryshkov wrote:
> > Aruino Uno-Q uses Analogix ANX7625 DSI-to-DP bridge to convert DSI
> > signals to the connected USB-C DisplayPort dongles. Decribe the chip,
> > USB-C connector and routing of USB and display signals.
> > 
> > Co-developed-by: Martino Facchin <m.facchin@arduino.cc>
> > Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/usb/pd.h>
> >  #include "agatti.dtsi"
> >  #include "pm4125.dtsi"
> >  
> > @@ -109,6 +110,16 @@ multi-led {
> >  		leds = <&ledr>, <&ledg>, <&ledb>;
> >  	};
> >  
> > +	vreg_anx_30: regulator-anx-30 {
> > +		/* ANX7625 VDD3 */
> 
> This comment is only mildly useful given the anx7625 node consumes it
> via a reference in "vdd33-supply"
> 
> [...]
> 
> > +	anx7625: encoder@58 {
> > +		compatible = "analogix,anx7625";
> > +		reg = <0x58>;
> > +		interrupts-extended = <&tlmm 81 IRQ_TYPE_EDGE_FALLING>;
> > +		vdd10-supply = <&pm4125_l11>;
> > +		vdd18-supply = <&pm4125_l15>;
> > +		vdd33-supply = <&vreg_anx_30>;
> > +		analogix,audio-enable;
> > +		analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > +		analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > +
> > +		pinctrl-0 = <&anx7625_int_pin>, <&anx7625_cable_det_pin>;
> 
> no mode-orientation/switch?

No, why? ANX handles everything internally.

> 
> 
> > +
> > +		connector {
> > +			compatible = "usb-c-connector";
> > +			power-role = "sink";
> > +			data-role = "dual";
> > +			try-power-role = "sink";
> > +
> > +			pd-revision = /bits/ 8 <0x03 0x00 0x00 0x00>;
> > +			op-sink-microwatt = <15000000>;
> > +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> > +				     PDO_VAR(5000, 20000, 3000)>;
> 
> nice!
> 
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> 
> Please add a \n between the last prop and the following subnodes
> 
> lg otherwise
> 
> Konrad

-- 
With best wishes
Dmitry

