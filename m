Return-Path: <linux-arm-msm+bounces-114690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qXTKEzqZPmo5IwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:22:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B36CE707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:22:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P+2CbihK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jOY0+Vq0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114690-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114690-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADBBB31384D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607343803F7;
	Fri, 26 Jun 2026 15:15:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2737DE84
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486937; cv=none; b=cJgSrOPDFJXq/5FmZThsChl0BLa4SDm+w+PrABo+iuCU2HCCgxKQLbM2pK/42HDkH9Wh5HSW4SKbdD3FhCCSkmJQYir4E2rAJtD4WUpBBVJSLIoPBGQ3HdpJRF3bymj+mA9DvOwLmiQkB+a+NnaiR2DEyswiOpesxB9PBNzNTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486937; c=relaxed/simple;
	bh=Bg2g5/O4ANAJpRdlTfb18RSa531+fBt1OIeK5gNau/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp4VKtTd61Np2BcJVvsB0303qLOz5zHmXnGpmFQUtXHHA5BLQhHdtgN8HTdjv1xcR9SDfieWdudSW0O2ePxn+MwRUdRh2GPC8Xc6n9/0AUL4NPUVkdBk2SDgHSEiO/JwTyv+vXDD0GqK2gHc02QOtkPn13b1dlhzxpaGEiSrZ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+2CbihK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOY0+Vq0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF493n1446983
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GahfmZ+krNr3vOn7I9cIdit+
	K/oa9QGSrgxEmne3Kbo=; b=P+2CbihKtcxB6V4ky4cDUznq7m4Wt3WkUb7fhEXI
	FlCTA4GPQIdwGGGx73fyPGd4aiqlb8MsJ0ET8K2GNpJawsmYILuHm0lRLl6CH/Gd
	niI26hv4Fw6o2MiqPwStWU9bmXX+F0KBI5qzprVT/uNdcVQcGS/jOrY6DWkEpRJR
	2Dod/1DG02NawYlBVWVdkRky/lO4jUKODhk/aDJ/WDXsfWjqnOppnbkhgdUYcPHK
	RCigjEeyPmKvAwIULX20YtOpsgRF2EZNuN0DrLxgX1/yiU7SQxioDqIpf+AIKPVP
	qlNu2kvMs9iSWFUOQ8CbU8171vxNs6vJjSGLJzfgxcerwA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tsduw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:15:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-735d7587140so196502137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782486929; x=1783091729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GahfmZ+krNr3vOn7I9cIdit+K/oa9QGSrgxEmne3Kbo=;
        b=jOY0+Vq09C5yAoxrr3PlHoT+W2BnbuDH3ZX9z2vF2na6grH7iXQYd156A1ne8EMq/R
         ZzqkoueDfQU5l4xDhQdJ//Ha4U86RtOMksUsIFRnrSLSRWnqOg2SnKxJ5lUdQkUIxlDV
         eeVRawmIAY0dOJWpO5+KwFfp4RaH9NBktmnw9xLBB4FXAWh5J58LwiEteBb5DTfCKYVv
         U33YS6R4p1h61Z6nkn/gTGmCwb6rd6xWuhatUZEIDwezILz/vgMwqDHq1/iARjCqH3uw
         VUOhDSVN4NsECDRMl6Uxnm1Y/dpHKd8rTc8tqEcK4E/WxWrIIOLICfJElG8w0udpOWG/
         gjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486929; x=1783091729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GahfmZ+krNr3vOn7I9cIdit+K/oa9QGSrgxEmne3Kbo=;
        b=eOTo9X8bv2oXVxGwTMbsOTMtfG8SH2XhTW0L0Z0QTdToGLCCz6z2vWP/jgymA5v926
         gNdkt5mP07U+JxLvoi7k9eUjFccZVxyC8tp1aQiLIitc/TZNp/1+R/8/15EKS05M4cIs
         nZMOcIh5svbOPK91L20CYyKtfUeDHuo+O8Li6p8jsriJhSp/bMHV3YMRN/9iX86PKh7W
         aq2f0KxsqiJsslliDBUnVhIl/1z7BA5ihDA80XrkH3zkh80CLb4qEkt19wldOTQWc1Ky
         UVuwcm1mqzS3KhNb++vfIvWUkueR3lheA1ASiOknypT3WaCcCzCxHy0e6b9HfY8NkE1/
         dtxg==
X-Forwarded-Encrypted: i=1; AHgh+RrZDmhgA4VwtfhT8moAYusMGnNrCecIIoFuu8R1H9eTwJIB1Zoqx4ke2JBXzj9we/yjTclIjbJKLhpkwvV5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwSMLv67QIfW4AvB6+gh2EhNFRVtrqxchBU5JQ7Mhi+vZWlN7
	wdg/utbMUMxmXnsk6m2/G2X9w2rO0uVvTAyvHV2A0xbuntfgKcQsbkIfWbntLkYZSgmmxuTuTdi
	kNUJh/pynpo7bAqsfU8h7loP4YtFuYjecf6yNxRBZB/jWydPwfGnhAPWb7JF2xeOc1DnI
X-Gm-Gg: AfdE7cnqnmU9YUGGyuyiQ1Yb5HqKZdaEhD0zJ+e2g0ikcHkWacg7lzHw+yrEKazIOd1
	p6lLoby6bhNBf4P8tXGMABPD7LE8YCZ2sV+2J2O85U5ZYsOk0lOWB/r9Qa1Kt3GXP5nweXdLSm/
	JMeVq+mB7+Wu8GR6q+ar+Hb1bDmET0admPoU0dzTbliVJzdGnvtyl/cpW6edjra2mtvVa057kD7
	BVugRkqO3k07/CqYM33v7sDbpCx7opz2McTrl12w/hhLIZct1BBPiQ/GSkyeYHsSBKv5Oqa0CKd
	oledv4U/ZTYHm86o1GGMUWC5GZglAf2BBnyrV7tnnan5+I2WeS2cF2mRLSAlnXXJYSS7h/FLwMB
	1bIUMHHy8vv8mUyjRFli5WQ==
X-Received: by 2002:a05:6102:801d:b0:62f:34db:9474 with SMTP id ada2fe7eead31-7343619b129mr3535751137.20.1782486928676;
        Fri, 26 Jun 2026 08:15:28 -0700 (PDT)
X-Received: by 2002:a05:6102:801d:b0:62f:34db:9474 with SMTP id ada2fe7eead31-7343619b129mr3535736137.20.1782486927926;
        Fri, 26 Jun 2026 08:15:27 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269009163sm93882315e9.11.2026.06.26.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 08:15:27 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:15:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Message-ID: <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX5DjjdzOm86eL
 jhC7l+ITzTVICQWtyeO84kenDwyPtCufrvvGYGmlr4D46evJG/CD2I59hMwltoYEZG7wmWtLEAV
 eYErgFeYpYqN6yPgf4Oh/PcMsABuUng=
X-Proofpoint-GUID: SauFzKlafJ-yyOr31UL9ylTmRX_cpe1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX+6LfRo0tHrsx
 gd4qvcT8D6cR0ELJQDPO84iU5XguzoHdC+lLnFhrpBFMJL8g2FVfBrQZuZOcUtoYt0A53YD2/TF
 2JCThlPU0zSQaUMFKHWYE+cPFgkq6tAyBQh6tej4rIhwVhg8p8uvfSutM6a/zpqiXdLIDJQsuom
 bofpz5Bw8hfn8XF0IZf0KIe2LIh//MrPyV0FXpdt8vOElq8UJwhzUtl0eVjet/F+WTg/pYNOoiY
 RcfpnTpuqLtycSThVQtdUO8wkzChHR64tZsX8kDsFgG23/OgZZuhkWxelRg7+Hnmz4kiFiSpYEe
 W/83AMSsPJsxim2fPrgyP3wZADCVRG47Jl7FP2ow4jGiWh3hM0Sbby0/Z4DeS81tte5zUMuW7nr
 cPqwP86/8XHMss0yHBvK+B2VZf8dUw9RwQlBYRLkx6EmvyIc82eH9GWS7UV/eX18NDnts/AFIXw
 tbV0uZ9o2u2j8zyTG7A==
X-Proofpoint-ORIG-GUID: SauFzKlafJ-yyOr31UL9ylTmRX_cpe1W
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e9791 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DRydhnnv5MIbgefyc0MA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,63xby7l2zjzr:mid];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B11B36CE707

On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
> 
> 
> On 6/25/2026 3:42 PM, Abel Vesa wrote:
> > On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
> >> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> >> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> >> the GCC clock references to use the newly added PHY nodes instead of
> >> placeholder zeros.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> ---
> >> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
> >> ---
> >>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 357 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> index 7e97361a5dc5..2a51da62270d 100644
> >> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> >> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
> >>  
> >>  			clocks = <&bi_tcxo_div2>,
> >>  				 <&sleep_clk>,
> >> -				 <0>,
> >> -				 <0>,
> >> +				 <&pcie0_phy>,
> >> +				 <&pcie1_phy>,
> >>  				 <&ufs_mem_phy 0>,
> >>  				 <&ufs_mem_phy 1>,
> >>  				 <&ufs_mem_phy 2>,
> >> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
> >>  			#interconnect-cells = <2>;
> >>  		};
> >>  
> >> +		pcie0: pcie@1c00000 {
> >> +			device_type = "pci";
> >> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> >> +			reg = <0 0x01c00000 0 0x3000>,
> >> +			      <0 0x40000000 0 0xf1d>,
> >> +			      <0 0x40000f20 0 0xa8>,
> >> +			      <0 0x40001000 0 0x1000>,
> >> +			      <0 0x40100000 0 0x100000>,
> >> +			      <0 0x01c03000 0 0x1000>;
> >> +			reg-names = "parf",
> >> +				    "dbi",
> >> +				    "elbi",
> >> +				    "atu",
> >> +				    "config",
> >> +				    "mhi";
> >> +			#address-cells = <3>;
> >> +			#size-cells = <2>;
> >> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> >> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
> >> +
> >> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "msi0",
> >> +					  "msi1",
> >> +					  "msi2",
> >> +					  "msi3",
> >> +					  "msi4",
> >> +					  "msi5",
> >> +					  "msi6",
> >> +					  "msi7",
> >> +					  "global";
> >> +
> >> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> >> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> >> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> >> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> >> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> >> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> >> +			clock-names = "aux",
> >> +				      "cfg",
> >> +				      "bus_master",
> >> +				      "bus_slave",
> >> +				      "slave_q2a",
> >> +				      "ddrss_sf_tbu",
> >> +				      "noc_aggr",
> >> +				      "cnoc_sf_axi";
> >> +
> >> +			resets = <&gcc GCC_PCIE_0_BCR>,
> >> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> >> +			reset-names = "pci",
> >> +				      "link_down";
> >> +
> >> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> >> +			interconnect-names = "pcie-mem",
> >> +					     "cpu-pcie";
> >> +
> >> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
> >> +
> >> +			operating-points-v2 = <&pcie0_opp_table>;
> >> +
> >> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
> >> +				    <0x100 &apps_smmu 0x1481 0x1>;
> >> +
> >> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-map-mask = <0 0 0 0x7>;
> >> +			#interrupt-cells = <1>;
> >> +
> >> +			linux,pci-domain = <0>;
> >> +			num-lanes = <1>;
> >> +			bus-range = <0 0xff>;
> >> +
> >> +			dma-coherent;
> >> +
> > No pinctrl states?
> >
> >> +
> >> +		pcie1: pcie@1c08000 {
> >> +			device_type = "pci";
> >> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> >> +			reg = <0 0x01c08000 0 0x3000>,
> >> +			      <0 0x44000000 0 0xf1d>,
> >> +			      <0 0x44000f20 0 0xa8>,
> >> +			      <0 0x44001000 0 0x1000>,
> >> +			      <0 0x44100000 0 0x100000>,
> >> +			      <0 0x01c0b000 0 0x1000>;
> >> +			reg-names = "parf",
> >> +				    "dbi",
> >> +				    "elbi",
> >> +				    "atu",
> >> +				    "config",
> >> +				    "mhi";
> >> +			#address-cells = <3>;
> >> +			#size-cells = <2>;
> >> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> >> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
> >> +
> >> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> >> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-names = "msi0",
> >> +					  "msi1",
> >> +					  "msi2",
> >> +					  "msi3",
> >> +					  "msi4",
> >> +					  "msi5",
> >> +					  "msi6",
> >> +					  "msi7",
> >> +					  "global";
> >> +
> >> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> >> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> >> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> >> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> >> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> >> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> >> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> >> +			clock-names = "aux",
> >> +				      "cfg",
> >> +				      "bus_master",
> >> +				      "bus_slave",
> >> +				      "slave_q2a",
> >> +				      "ddrss_sf_tbu",
> >> +				      "noc_aggr",
> >> +				      "cnoc_sf_axi";
> >> +
> >> +			resets = <&gcc GCC_PCIE_1_BCR>,
> >> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> >> +			reset-names = "pci",
> >> +				      "link_down";
> >> +
> >> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> >> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> >> +			interconnect-names = "pcie-mem",
> >> +					     "cpu-pcie";
> >> +
> >> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> >> +
> >> +			operating-points-v2 = <&pcie1_opp_table>;
> >> +
> >> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
> >> +				    <0x100 &apps_smmu 0x1401 0x1>;
> >> +
> >> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> >> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> >> +			interrupt-map-mask = <0 0 0 0x7>;
> >> +			#interrupt-cells = <1>;
> >> +
> >> +			linux,pci-domain = <1>;
> >> +			num-lanes = <2>;
> >> +			bus-range = <0 0xff>;
> >> +
> >> +			dma-coherent;
> > No pinctrl states?
> As we are adding perst & wake gpio's in board specific file, it is better to
> add the pincntrl also
> there only.

I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
them. Though some of the newer platforms moved them in the board dts.

