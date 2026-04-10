Return-Path: <linux-arm-msm+bounces-102594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N6JB72m2GkhgggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:29:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553233D355A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A53300822C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161173A0EA5;
	Fri, 10 Apr 2026 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXdn4z2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iW5ICh1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA0C3191CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806099; cv=none; b=JU1oUfHB+ND5bFx2G+CAvSuqLe+mqS4iMUq9QuOTfRcyzkoEBBnG5YuVDtXyfb3E1mrMEhtMTabBWY4ROUPp+6dO8uf8BGkrTKE+9O1JLK+kg2RWAa+0Rx8rDoIoSmO91gcyZj370NL2it13oZhuOcNUXduHf8zakAyl2k2JyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806099; c=relaxed/simple;
	bh=OFtbOO1ubND4xBX/rJGFykVTxR+pMWVFmqATSLPmN5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5ps72YmmbrQTrgvFVuf5o5DKJXUO573crxUJgWXEm5PzR26cbEC2BGRHeSDbml/pWwsSwSTlPIXXSzxpgrkH0yJs1QZHA6papZzYhpJ7SK/B6MaNkNxnJuw8DipxGYJYvQnrH9UOQJT0FPG/lJY6dLVBDYcW4KBVOU9BBlCsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXdn4z2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iW5ICh1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6olf31433168
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzMTrJ8rSoC60jUEXeA7/Au3
	2kTyaCo0Qi2cMsxR190=; b=BXdn4z2n05QrDVwf0YyVLpQGdKBjB/BGQ/auJGwS
	EjmN3xFnfLkWmc0WhiM76aT006kpbFw8B3ag1bF1OjZwNG04NDw8znALGaw+QzaT
	bVIQndRiDvcG2qNEPGewHYJQ7P0VSYgu3UA6uTEN53MEMukaCnq8f6KCv4txNpfq
	kiKD1l8akqMmMFVVMiYw9A7ecKGw0UhQFcc0nZXh/pkGWY+QNbscwWWmZ6PCx0pu
	16jrA99kQJGT5xNRnAVFY1JT6J+g+onXLC2WtWT/zID/ngeeJFU+sMJ0fvVx/uQ3
	hjogQaslQW3d3Az3bp2hA59Don5gboA1bH3jN8LbPm3ExA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfb7r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:28:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2336285eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775806096; x=1776410896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzMTrJ8rSoC60jUEXeA7/Au32kTyaCo0Qi2cMsxR190=;
        b=iW5ICh1ja7rtDkjxtKAvNWieWGsRB9H1CGvAuL/yU1qlisu/Z7uuy3ad55HRPAm48i
         Iwnk2y1asBgYQn37IQOHV85H8TRUHK/R5/4UYgUo7ghAuJwMc1d3dRORGDem9WFr6scY
         rx/2dvTcJSnrUjYGqMs2WTLdYB7kKHGkECjIXvCdtkG1FNAH221L59flTd0EzN7+0g7x
         GgfGfSnwye+AtpnCGtOlZ71JIqnrYah9EQpw++N/A9QXW0JWF7PehlPIkdux13uhmW9x
         mXnu21xGeo2F7IcOTLjsenregD3CXOpouY9tck6HtS6gwRcF0nSgAn0ZNuzcsEArA3jk
         AsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806096; x=1776410896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzMTrJ8rSoC60jUEXeA7/Au32kTyaCo0Qi2cMsxR190=;
        b=LJ0UseVQ8v7hNX+kwnk0TouIWcNeg6JDxBNXWikXq6Osc1/czeBuOeC76xh+2v9PVw
         A3rE61d8jrqmvKDNKkKYNg4Mkpce9hhg4AmpcVNh/dxvrcpNeYZAXQBYsDJnlJhNP7tM
         eHlpMXURuKl9rbaoNx7GPzgxvHD5KuBHMNiSCoJ3MHKsKbFEkjvF8Btf4soMSiCUWktY
         ii9S+xmrhILcyc+bInIVT1Mh3R7JAvtaefcAKrjxjV2Xdi6vGVhaAGgmUo1RZGEJwDH5
         2njp/JpOcL8u5rlx6SpuBwEi9IunBTbN+dXCRNEm4TsfGMmp38BSVuvS/3HvG4Sj2fHd
         gxbA==
X-Forwarded-Encrypted: i=1; AJvYcCWdogFPy1Hmy2jqUnI43MVEhCGkD6DOOUQdCdEKe00qQrXDVX5z42rfNN9bHcbLeVu8yGfda6CO52LeZL+l@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYI9KpELig9mjZguRsZk5Dc3Kva5elhOceE+MffCQ8o7F+FLS
	UHKfxF05oOX4emE7udWEMf8oKjcS3mh9KAwaIXsxebqbwJ77VsQ0XUkL1vmTvjmXwr2iff9amjy
	6xozOrwF8SLZsrY5wrdvsEiIPwvbfSJI7iuqSHH3B19vUef1e5LPtTefRpMLkg1+S+qBT
X-Gm-Gg: AeBDies+SiLhoRn2//QPko3VhKlsg7lKeyYFciI7F7EwMr9DUO4jeDGH3EnljmAXZFC
	BMQJvcEP/OdoW1KQwTDNyr4eUZF6cpEDXBw0yAhxQ/+7hcA5Jb9p3VOQatozZ2edBmHq2NRyMkN
	aTGFdl4EfwRyU+0tXmj48OMGuS7AjgIiTnN+Di2wT6mrZrnFrAFM/i0Njr0xl0VVw2/JGynN6gB
	xlqKfwyrUsRBydDBkkjAjrmA568ERhMvffXggpbgGelId/oeZKTlOhVREv0iu16sZ79GhueKgxj
	10uqS807sVy2lPASAAR5HIVBUYe/uglDoUOgZTwSZWlZzmeD2wR1Q+U3rXYm2eAc3zg2hB0GVi1
	3BwuZ6q0V6Gh1eB0zI6/LT1HLWNUHNUhGHk7ZXk5CGkLBRZchl05bskwxvpB4phe1pG/rxaA=
X-Received: by 2002:a05:7301:fa04:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2d587a8c4fbmr1241996eec.12.1775806095660;
        Fri, 10 Apr 2026 00:28:15 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2c7:5a7b:e8c0 with SMTP id 5a478bee46e88-2d587a8c4fbmr1241974eec.12.1775806094998;
        Fri, 10 Apr 2026 00:28:14 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faab010sm3095528eec.12.2026.04.10.00.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:28:14 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:28:12 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <adimjMsZRerNVFcY@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8a690 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gImegswrDfqCA0j4wuIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2NyBTYWx0ZWRfX+UN7KddhNZka
 SWZ4utAHPHBO0X9Bvpi8AOKUeZhB/9cV4YyQ9wSjQC8bJgGboyl9gToL+wMMedOLT3z8hmUa52k
 dgTlNvIfMdrDeuHAx06fIhRM8eewMKhB/WJavMSnTo6D/0qKtg6TSMm4AMIU3NeXnuiLIbEMlIC
 4P5REvIWlFtZthlIweUKD+ni0l9oyN+EO9l571Lvhyy+4mhOiFV5CjQK1OZ+OKfJ+Pd0G9nKdyT
 tUHCV07aGzegkxvx4stRPjC/sb62RuNynvlBQv9br43+vKcix5s6ERaWKUWRCUS+I8PsxJyo8JS
 cr4OHK/uYAluIjQBxaizP2dd8yOjaOXcUu4nmQsfNKtloKNoa2ZTn1HkMVGNdNSVigTTzAAXcS3
 n0YfdLc1xI8ns8aABMsTe9ClrHlGIaWT/bql4nNYZoO/L6MO/axQvsdf0su2NEGnoBVEB9M/Owd
 j0tq63Msp9/MXQqPJIQ==
X-Proofpoint-ORIG-GUID: Wl3_OgabIuGgMboxHNgC3rGvsJXy_ZUl
X-Proofpoint-GUID: Wl3_OgabIuGgMboxHNgC3rGvsJXy_ZUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,hu-anancv-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,d00000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102594-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 553233D355A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 01:41:33PM +0200, Konrad Dybcio wrote:
> On 4/3/26 1:39 PM, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> remoteproc-soccp@ ->remoteproc@

ack

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "wdog",
> > +					  "fatal",
> > +					  "ready",
> > +					  "handover",
> > +					  "stop-ack",
> > +					  "pong";
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "xo";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>,
> > +					<&rpmhpd RPMHPD_MX>;
> > +			power-domain-names = "cx",
> > +					     "mx";
> > +
> > +			memory-region = <&soccp_mem>,
> > +					<&soccpdtb_mem>;
> > +
> > +			qcom,smem-states = <&soccp_smp2p_out 0>,
> > +					   <&soccp_smp2p_out 8>;
> > +			qcom,smem-state-names = "stop",
> > +						"ping";
> > +
> > +			status = "disabled";
> 
> Let's drop this line, no one should desire to run a system without SoCCP

ack, that makes sense.

> > +
> > +			glink-edge {
> > +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> > +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> > +							     IRQ_TYPE_EDGE_RISING>;
> > +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> > +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > +				qcom,remote-pid = <19>;
> > +				label = "soccp";
> > +
> > +			};
> 
> Stray \n above

noted, will fix.

> Konrad

Thanks for the review Konrad, will reflect the changes in the next revision.

Best,
Ananthu

