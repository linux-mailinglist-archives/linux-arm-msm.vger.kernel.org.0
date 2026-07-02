Return-Path: <linux-arm-msm+bounces-116025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EWbJHSBfRmr+RwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B76F7F17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:52:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fuc0b/dD";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A139331971DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398E9478E3A;
	Thu,  2 Jul 2026 12:43:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9C429827;
	Thu,  2 Jul 2026 12:43:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996221; cv=none; b=eyt67I5fE9sMNfnakw8OTYSLrvWQ1kRRjY3ryYhbsFQiYCzYbdWBmPXUN7JnLDTMfy+YpC8vJhOQws8h/1nMgeLGZTSnNrDfG4gJdI1Nsie0QSfcYlJjpwk/ZoYDYza9PQLmaVKZQF+xEhdLMOXFVNcQ7BCvtbatagXwhfRNU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996221; c=relaxed/simple;
	bh=U6zHc6oM5FkWmTAII9i9xh3jPrlzLNFLxNMJZxTZT+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKcpWVZSbXvdC2r+/5xgaAWtsAFo9JP1Q1kc84KNMy5vy+mrcewlvmZEy+TTmnDQr9Y5tOOF+E7Uj83mAQbRv7S41QVTQFBQFpF4rsPIIEyBwpMtBWelgMZZuANfkmr0byVn7XVIfOxNF0YYPAMZEFNO/N9R1BF+MIhySsHMisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuc0b/dD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662C3e9J389788;
	Thu, 2 Jul 2026 12:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=knZqk+WP73YgkbPYZxTMHsw9
	ccahenb4fvLr5OOIi6w=; b=fuc0b/dDP+sm9eI9zsHwMc+1A2k//NwRZKfugQd2
	sC2fAs18OpbpY6VIesvkZmQ/44wKB7c5cXs+XfFajo5Ub1QpKsjBCeZ1eMxaXk2X
	5n+HHFxKlpZtpo9gkHOnFpyelKTjiORj/kGWSiUSA/wT3x1Zf+DSRmX3fW18l/sG
	tx8ugT1ctfeXxthyoPmuj7a+QRYj7RiuGzl6oHKBwYe5/T94oLFwr4IEdBFw68NW
	7/kx2VozUUqOYIFN5zON8V9YMbuc6xekOyu17FtWJahQAjetyzX5t8PO6u8rsai6
	h5Jqa9BYX3SaevKJvnMSXtOfZUrtOauD5p3CMkXuB6jl1A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp85ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:43:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 662ChW7O030294;
	Thu, 2 Jul 2026 12:43:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kkt1tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:43:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 662ChWJU030287;
	Thu, 2 Jul 2026 12:43:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 662ChWa5030286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:43:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id B6E3DB2A; Thu,  2 Jul 2026 18:13:31 +0530 (+0530)
Date: Thu, 2 Jul 2026 18:13:31 +0530
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
Message-ID: <20260702124331.pogzemduzwv25pau@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-3-6bac2bac7131@oss.qualcomm.com>
 <83cdc9dd-65d2-48c0-b172-d66f513b9c74@oss.qualcomm.com>
 <20260702073321.xsyu33rxtrku2xdn@hu-kotarake-hyd.qualcomm.com>
 <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ab24c54-5e37-48df-a410-8fae6d7b5289@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX9YxdFxRwH0r5
 FJRI2mcQDmJ2arSWIN5ZbO7547wkurB+6XkN8ncJRoOtqzzjNmC9koVJ7gxmHFOxuyyXvwgcbYu
 kkjbOdWi2ZKPKNIHE4CPGmEM4imeuEE=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a465cf8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HCBAKmTEwsamell87sMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX/uUBkg19IJQz
 XuH1F0GcHt7P7dCjaPVSXEeBwZIK6gRr1guQTlZB8ZEPKBn85fdCnm1Vs1Jq56Cqc0TtxRL4dDu
 i5i4NtnBYr0adYOOoJ7t2+MH8zKR1iQFC6ijwMG4OtYQeVYFJebvSg+5010ONBbpCOB5ChFSonK
 GNIrYJiMPFJeZ3bOtVk57jaMJrYqBmS5OQpcsctuJgo+kaVmSUk+kAn4c8wENEv0n3GcUABG+Fj
 wPWeJlhPSfXjIH3qvFvv1A7zaSy3KkzukB2mxpitc4qX4QtZWDWmNhEI6pUBH4or+akS/uAyHeh
 higSC6D68+8l747kNoOKlBEScFxc77h0fT9j046PoI6Mq5sWHjIrtY0Qh8gRsEjwmx4OHTMlQYT
 9SorLIWdMqNs1lwmmF0iNVmC7qotsWn+JbtokiJu/hoJ19EglgDMHQ8CVU4zfX+YGblZ3pepaEm
 MAB5hWWJ6Q4wyiO9puQ==
X-Proofpoint-ORIG-GUID: NZ0xbASfqIOTYF9_HDBGxhqilbYiBtme
X-Proofpoint-GUID: NZ0xbASfqIOTYF9_HDBGxhqilbYiBtme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B93B76F7F17

On Thu, Jul 02, 2026 at 02:07:12PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:33 AM, Rakesh Kota wrote:
> > On Wed, Jul 01, 2026 at 01:26:11PM +0200, Konrad Dybcio wrote:
> >> On 7/1/26 12:28 PM, Rakesh Kota wrote:
> >>> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> >>> constraints in qrb2210 DTS files to use microvolt instead of
> >>> microamp.
> >>>
> >>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
> >>>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
> >>>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
> >>>  3 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> >>> index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
> >>> --- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
> >>> @@ -37,7 +37,7 @@ pm4125_resin: resin {
> >>>  		};
> >>>  
> >>>  		pm4125_vbus: usb-vbus-regulator@1100 {
> >>> -			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
> >>> +			compatible = "qcom,pm4125-vbus-reg";
> >>>  			reg = <0x1100>;
> >>>  			status = "disabled";
> >>>  		};
> >>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> >>> index bf088fa9807f040f0c8f405f9111b01790b09377..2b50f3f577577d30a87fcb6466c7d7690270aaa3 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> >>> @@ -235,8 +235,8 @@ &mdss_dsi0_phy {
> >>>  };
> >>>  
> >>>  &pm4125_vbus {
> >>> -	regulator-min-microamp = <500000>;
> >>> -	regulator-max-microamp = <500000>;
> >>> +	regulator-min-microvolt = <4250000>;
> >>> +	regulator-max-microvolt = <5000000>;
> >>
> >> Perhaps that's a stupid question, but is there any good reason to
> >> not just keep it at 5V if enabled?
> >>
> > We could hardcode 5V, but keeping the range allows clients to select a
> > lower voltage if needed. The driver supports voltage selection per use
> > case, so hardcoding 5V would restrict that flexibility.
> 
> I'm trying to understand if this would ever happen in practice
>
Fair point.The dependent client here is the one connecting the USB
device to the Host. We don't have a concrete example today, but the
voltage range is kept flexible to avoid restricting future use cases.
That said, if 5V is the agreed practical default, we're open to
hardcoding it for simplicity.

regards
Rakesh Kota

