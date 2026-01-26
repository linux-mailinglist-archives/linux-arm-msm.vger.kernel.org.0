Return-Path: <linux-arm-msm+bounces-90574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGyULvp7d2n7ggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:36:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355989946
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 15:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C212C30429A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 14:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7048022DFB8;
	Mon, 26 Jan 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUOG8T+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crw2djK7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF15A2566F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437947; cv=none; b=dDQmQMccyuG2+0sVqvr9Us/tR+AknZWmKcqIHyy4wUwrS3bnE7g12tZM6GDP0jRFpaVLUlO8T6iIpLQGePP+3jvWQlL6O7Ez87JV0erYlR47yv9NMnc0xCPLXnU2736sgcVZgW5TMWcMI5FJlMX7x0YmFx3Aed6nKEcdekQNLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437947; c=relaxed/simple;
	bh=daHZqMONP/7qypDkU0uDwU4DBQuz8Gkx45cmlIumGR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCHGRDN9k7PABFrAbhTvLEqxagwkZgKncJpl3Zm54T0Qj5+A5WN/yHvUtZCgJmoE0U5kldM9dQdywkkjvCca9qGICtkAhzp4kD6gEiPU6BSWOa42U4s7NXc/N/uigCwj1dH3z0brJAJpBjjrxTSVADmITojH8+AN5IJ3cSksmp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUOG8T+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crw2djK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8xLbK2478397
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Q/TyKNcc6J5J/TnZoapO+PZ
	pmxpO5YpB2o1GEQ+6j0=; b=HUOG8T+mL1YwwNCl0a6pVvd26T43bK7b011nYTm/
	/uw2/0LFpla9i4IFx5sBqSku5W0aa6jCZnXBuOe1awdHVB2aXNpsdHK8xrB2TiTN
	M4Q2M4ovWeocMUzLaReZofzAM+/kpqxvbFDjoqmo6N+7R64D21XiUnoAOzN+O65E
	r+gp/Ix+gp3+VbR5U1pzPB5+WG1+gMAIaSOd1kBubX+JvveoGIoroIYYoR91DktM
	pxEhzn9FFlx8ML3Ke7b9Le562xzBdXxO3SyLsIrTtrwsLrKCWPyPhKyYeNdBONXy
	6ArXDoAukWaxEAZbeSQ0Q7ndhk0q1XDFHdAW8MEw0WiVlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dmtvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 14:32:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a87029b6so1437540585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 06:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769437944; x=1770042744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q/TyKNcc6J5J/TnZoapO+PZpmxpO5YpB2o1GEQ+6j0=;
        b=crw2djK7O5bYhZRpDgAN5RwiF1lShRdImGzYItzd/O3ZrNScOoGM5yPhxInNv70NLt
         OZoWLZcaWaS2+DaRKC2mKgWq5q4QaGiHHN/W/3Gkj4S8hL09X1jandraQP6OQVes12rg
         kSm5aq0VJ4yKrtRLfJYtIrYtSzXC9dR5hZ0aQt/yo3auW1P7Lxjv2GLug7B8Ya/wimmT
         eGDOUWMpcnGYT0QcxRXaRmFqIDBqi9P+otKKcxhhpj2xZx2/Mt8WQdYHEowS/jXpBZLx
         rwuejZ/BKfubgfKMkj2YWxWUmsBGlHDE45dVb1UOt7Zxk72hFzeyv2wV88847UrgPZ3+
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437944; x=1770042744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q/TyKNcc6J5J/TnZoapO+PZpmxpO5YpB2o1GEQ+6j0=;
        b=F8SGLONrhHtwBb33icWzOOx6ppq/QySIlqL75qDE68xtru4v7sCXnKzEf8j/RaPUSP
         SQhwXKfhiDhydl+LCfs/I9ZWyV1R208ljIAggKZavhtKIQg5m1yOJxXTt+wRJuyTVYlZ
         yzSwJXM36ttUAqsd2cgdJqzEqQCLDPu1Qwe0lr5CwtPYx6bHhszeLCG30WAT+BQmsxJv
         4EUhmqqnhRj8J8PaPqZCYVp/NCDs9N1rQlXknbEwiAkb59CIJV1W/q4KyCRKixVyL/uR
         QYYJPe3+soout3bvhoGJ50TB+zaLnFQqlf6lcNcTSezo2Cc0vCsnnm9JlAUoKzAxiLI2
         694w==
X-Forwarded-Encrypted: i=1; AJvYcCXLhnDHy5Kfu8/vXaMSqjR1go9+Ln2g96Ejt/CKDN5HEiX1XGgykezGmoZENPZscgxqk+6KREYnt7CYrZ8r@vger.kernel.org
X-Gm-Message-State: AOJu0YymhplG5KTMrsIHzLijelSwgGvmB15eG9HL0pM702DkwUDcpoi7
	5daOMzCWpjMPZN+wB4u4ad3YOS6TIw0bwIdPz2NPdsieqBizkn6KPBIMIDkP0eyjdpI1/05JxAG
	ru7sqTgtD5DL3TL8mGYTxqkEOJVukpTbp/9ZQcJYMDEgqGpDWvbtJqd8rFDZ96Yufc/QV
X-Gm-Gg: AZuq6aLbV2H5MEsoXkCQp0dbezIeBxzdi5ih1Llk3Sph4yCxT1/77VAFMf9+swaIUrM
	XzQwjKorLJld+QLJcc8n1fpEmYxJvkBh/DueQonBD15Ks0qVsMYXKPM4UQXEbbhr+EozUzjS84f
	aJ1uHxwrNdyohrTM/O/oyRpCQUuSzJvrkp/aU1hNVehq3hK4g1A/lg9e169wq8x1VbwOqr5VPSt
	DBv7st8N5vkjiUJDr9QcuoZFI5NJ+qdgBhJzLJCVQf9nPC4/U8XdJoatXTIuQHUVu4g2VEEys5T
	fXFNPOd0R9lYq1teuUOykzMKKesAAVwsIWkhglwr18Y3Kb0p6z9dIMMtSAYgXhoM71LlbQReiEQ
	xDDDXloWaMunl041zUVZxiHIX
X-Received: by 2002:a05:620a:1a19:b0:8c6:de6f:8996 with SMTP id af79cd13be357-8c6f95e72d8mr489078185a.16.1769437943950;
        Mon, 26 Jan 2026 06:32:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a19:b0:8c6:de6f:8996 with SMTP id af79cd13be357-8c6f95e72d8mr489071485a.16.1769437943294;
        Mon, 26 Jan 2026 06:32:23 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3b4625sm109913795e9.0.2026.01.26.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:31:45 -0800 (PST)
Date: Mon, 26 Jan 2026 16:31:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <wh4qsgwl6drye2d227mv22pxz57cikp6ogabklo6fvlzljqafp@sgps7d52yp2d>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyMyBTYWx0ZWRfX7gdPPwLS14NG
 eGmXXRMxLIXb3eFIsiYk0tlyjHZX6XfNDQU5oTwXr6ZfHUto4/LIN8dmFIh/C/HKQpjajiqMZOC
 Gh94M7v6yWZmmWqTdlKdHOH1Ja5U4Tzl6iMqCqJrx96dm8mdHYwruJ+Nm2E/3IpR69jNOGMdT0h
 xEPpvzzT0Bv42UFD8GAigBw5j2kahEaPiUy1YG5G5DZEdfz19E2zQqAKJ8acOZmKB7FxUIBb3uy
 W/H4Cda6UObg0nW+FUUys7tXOkjJ21nyyAnMaA8UYZSEWHy2EZ94ep+dkilljvl9G/chO71e2g8
 wv7rjp1F+OjeDj80BTvpIC5rwb98kHNcqu9WOzMdnqIUUyq1Ux95HD/3oZbXUQDfSVOUrxPbnLj
 uXPfBwVqXmUAp6O7FkufI/krGL1V5XYsW07znBPUHvBF9j63d7mGFhauT4bvXqnOC9Ej4xpZYQ+
 QpT7anoc96eD3LW6b3A==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69777af9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MOwG-Syh1sNcuLoOUM4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pCrF4XOr9OXUg99ze19K5S-ax7A5mx10
X-Proofpoint-GUID: pCrF4XOr9OXUg99ze19K5S-ax7A5mx10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,fa2000:email,oss.qualcomm.com:dkim,fa1000:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3355989946
X-Rspamd-Action: no action

On 26-01-13 14:13:32, Konrad Dybcio wrote:
> On 1/13/26 1:33 PM, Abel Vesa wrote:
> > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > 
> > The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> > controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> > PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> > DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> > 
> > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  
> > +		usb_mp_hsphy0: phy@fa1000 {
> > +			compatible = "qcom,glymur-m31-eusb2-phy",
> > +				     "qcom,sm8750-m31-eusb2-phy";
> > +
> > +			reg = <0 0x00fa1000 0 0x29c>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> > +			clock-names = "ref";
> > +
> > +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_mp_hsphy1: phy@fa2000  {
> > +			compatible = "qcom,glymur-m31-eusb2-phy",
> > +				     "qcom,sm8750-m31-eusb2-phy";
> > +
> > +			reg = <0 0x00fa2000 0 0x29c>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> > +			clock-names = "ref";
> > +
> > +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> > +
> > +			status = "disabled";
> > +		};
> 
> 
> [...]
> 
> > +		usb1_ss0_hsphy: phy@fd3000 {
> 
> Let's not repeat the mess introduced in hamoa..
> 
> Perhaps let's fall back to usb_0 etc.?

Sure. So then:

USB SS[0-2]              -> usb_[0-2]
USB MP                   -> usb_mp
USB 2.0 (USB20S in docs) -> ?

> 
> [...]
> 
> 
> > +			snps,dis_u2_susphy_quirk;
> > +			snps,dis_enblslpm_quirk;
> > +			snps,dis_u3_susphy_quirk;
> > +			snps,usb2-lpm-disable;
> 
> Other SoCs have a list that's much longer, please consult Wesley if
> this list is enough

Will do.

