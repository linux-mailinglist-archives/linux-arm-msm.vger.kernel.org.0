Return-Path: <linux-arm-msm+bounces-115846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ovkfCY8XRmqwJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:47:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39A6F45A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AvaDEEzz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115846-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115846-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F9F33011F1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428DD3921DB;
	Thu,  2 Jul 2026 07:33:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0022AE48;
	Thu,  2 Jul 2026 07:33:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977610; cv=none; b=hb3ZEJp1sPYPX4HZgEm/kjRkn68OB5s4WBq5IOJE36I7AF3vEBnS5RSJXkj80DI7mcTRJn53dQgAI0QAXF5+GHW7vji2adP5gBmJhjv7W8fhHqpNJy/uHtnW619rCs0qIaSgkaRujQUa02lQZrJk1zreogABOOepyFj993gqF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977610; c=relaxed/simple;
	bh=Bb6vx4LHptMbl/a9QRertonCAErPy5n1vbqEKWu2iFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8/LEfmThFFPqsG2Sm78UuMxl1U8QlY0qEXNpNWjke3XBtOfnpzwmMtk+dQJBnVJtNH5YeozzcaN4aIzUcLiayefDIr2PPyVPw20CQoqb5Y+sJEMyQj53Bgm3s9BGWyLjLaeU3vrhWqlFggaXvAJEMu4xJMPtF9//OKR9IOucfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvaDEEzz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KJjc3067584;
	Thu, 2 Jul 2026 07:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0SX3akTrbcN3NOrRUxvj6y1Y
	0jRsMdPFATXwTBtKA5w=; b=AvaDEEzzd74Bu7NCEWMuFvbkVIRDRECDfQefdo2x
	LzDm6ZullLvC2VISvCH+mX1RsSm+bztxyWjuOAD6+lHdGpDtYYJLFoLq0HAhVp30
	btLUFa/LUXIc3P9fJpwckIb3zGl9dKost0G1nN79BPn8wZjG7vkm8xBIDoqy8jrY
	laKAMCfwsmIgPN3ZHSEgTI/rtiWR4gqtd3ejvc88694AZD4EZwRNbRUl2J3nzxGp
	pQI4kCXykY6at6pRz1u7ydmV83yGT5Ih+mRjWuI/AT0YoYSN8oqjbb+EoC2arYT2
	9KJNNW1RnpfZ2fOpQ/BnHXtccFzqMAzghAb1kovd/L5adQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amddr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:33:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6627XMgs014920;
	Thu, 2 Jul 2026 07:33:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kknxt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:33:22 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6627XMrk014912;
	Thu, 2 Jul 2026 07:33:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6627XMem014905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:33:22 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id A9D9CB2B; Thu,  2 Jul 2026 13:03:21 +0530 (+0530)
Date: Thu, 2 Jul 2026 13:03:21 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: lhruxtv_w0KckDSSg1rD34v8Dfx0Azb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX4fuFjbchnb7J
 D0ev6yNPATtEnQNRQx3FWReH4J1J/U4TO6OBjpF8xF32qnSSnHu3ej05KeESWdIUxC1ahEN0rqw
 IfXjSB1io7RZKvckDdTXCOnfPVv0c6lOo/yvkO6PYPwm92yW/mQv0u+oqTdvp5dSEPbbeKj2Jx3
 Gp40EVKI0LlfotFi8WSHPVb8/1mYKZvKd5bsPgOrPD4dPLOfMUnyhUPYyZ7xVchkMskRhslyunh
 +7RCsuniW131CBnk5f3ss1ysWiCi0Vbz6IMSJCM0KdsW56UpTwSD370Ms+KzDTXB/WuM8M8yOum
 BfJNH44gGzexqJXhFeKjQdTXmAUpD1/2M5XdryO0Yqt680UjpBkPx+Q74rS281G73sdq5RAYEj6
 XfSPVibljVmqdHR/JpoDf6Qehuf351MfMM0qyLpIZLLU7R7rEzhppolkt3I+SzkZZm3YFrBUnky
 oRl3IXKwnIqfoWBebkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX5PIegKLPWA4B
 pjVTlqb+wAN6EAGJX92jwwhnstB5US5SF7QgXplmoBbZmkTbtqSuRL7FlwNhzM4yxuns3rwbQRk
 oPZ00xwfuxVoq/CAR5BRfBNwyWHeZ58=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a461445 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=csMZEKT9KW2s2GwMH6cA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: lhruxtv_w0KckDSSg1rD34v8Dfx0Azb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115846-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:from_mime,hu-kotarake-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF39A6F45A3

On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
> On 7/1/26 12:28 PM, Rakesh Kota wrote:
> > Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> > constraints in qrb2210 DTS files to use microvolt instead of
> > microamp.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> > --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> > @@ -37,7 +37,7 @@ pm4125_resin: resin {
> >  		};
> >  
> >  		pm4125_vbus: usb-vbus-regulator@1100 {
> > -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> > +			compatible = "qcom,pm4125-vbus-reg";
> >  			reg = <0x1100>;
> >  			status = "disabled";
> >  		};
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
> >  };
> >  
> >  &pm4125_vbus {
> > -	regulator-min-microamp = <500000>;
> > -	regulator-max-microamp = <500000>;
> > +	regulator-min-microvolt = <4250000>;
> > +	regulator-max-microvolt = <5000000>;
> 
> Perhaps that's a stupid question, but is there any good reason to
> not just keep it at 5V if enabled?
>
We could hardcode 5V, but keeping the range allows clients to select a
lower voltage if needed. The driver supports voltage selection per use
case, so hardcoding 5V would restrict that flexibility.

regard
Rakesh kota

