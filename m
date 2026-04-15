Return-Path: <linux-arm-msm+bounces-103280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIAJBsBy32mFTAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:13:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B84039D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D631430BE64D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEEE367F3D;
	Wed, 15 Apr 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQjuajSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJKMnGYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5136494C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251528; cv=none; b=pW5/h6vNDQaHGlSu311NPVOPLgM6FyikMvkDT1+rrbJPBsrZYhuKXpAV4MGRE/HDpuz7qPYb0q1J9ZiMXFPQnrYdJ+62XoY6lHa+XHIvC6D7tY6yiy1JNW1Q/3+Z5gW/Ph6E4NaUL2Dg/WPyylSCVoAk7kVERjq5ZDquW0xXMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251528; c=relaxed/simple;
	bh=oIaMFQ7L+L+/2Z0AfVlBwMaiXjTmwVj0tLL2cxLGOEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeU2g7fSD0mxmhsOZUZAkJS9322nHiTM1ajq7jwxM5TLLNfnlXAjXL50NTRiQOjf0E7fk5JQZPURUISa7AavHvKQZsmGG2q5+cumARqPv4nhN2o7pT4kKDiDTDxaaJKN1Z7IEkoDFxKbmYK2BqLcquZMjiZjDJovjK5LNkQQvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQjuajSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJKMnGYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8aWc93937170
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nrDD974FpG+wDz+fDVFkn9Ql
	xywic/Iv4KPsmAldIA0=; b=BQjuajSsK7ltSEbj01fSZ/SYH9FnTKFUGJog7kUy
	Pi9G3Orr7zWvwXR/r+IV9HWkWOt1PRUkr8RbJ4+U/VdVBRiHHWwjjIK7Svb5ipZr
	xCtdJKafu2dxjDQsy4/Qsz6vNVEsIlFx9UAlT0IkHtYrSXquYLdrAeynfe0Vla63
	RHdO5ZpzKF96omqq7BwyquCYrWzSs9BjoroYxsMA+KhiXO2n/zYA+tq1XgvVqRYR
	NVoyaPlJDXLdshrJXhhs4qhS1q/2YYzPr73B21ZUlScAY5QpyMg1EoX7JWvo1Kit
	7c3UnTm/jShDggKfjtdWuCjsKHxyU2fXk1tYBsQ3JQjHCg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf3gv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:12:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c283a1212so24435521c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776251524; x=1776856324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrDD974FpG+wDz+fDVFkn9Qlxywic/Iv4KPsmAldIA0=;
        b=bJKMnGYz7892qQJV5ynvizI1FQRk8Z2d2GqKdVBlRpEAo5y0TVGZoZTmYyEsBO9wGt
         WMNdIlf8VM5X359xNg1Jk4OwQXmyLT+8iIAWmp9577d+qWZv5WClowINdfWSjCe8UWfk
         I2ZjbnrHvYBau9PBCGjW7K8V1jFz21meX54tD2mDfMrvIwfoCzcpCQ0QFJk2UZXXCWja
         vLq+3F3euVusoqC0LGD1C8SVJHKMKmNq/ty/8LPrAaIxBcqsnvNRYTX3Qrtq/j7xJ6oQ
         3F+zR9haHGGuWpDauy+KzGwuoq+/r0oLvIu05DFyfBMAhv25IUmYsZyD8alGHrt1xDC8
         oITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776251524; x=1776856324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrDD974FpG+wDz+fDVFkn9Qlxywic/Iv4KPsmAldIA0=;
        b=ONqQsh3D/IfCTVs2UCO+nvAhtYHb3P2uhhlUpluvX++La7xrug+0AQvQns4/TCAjm/
         j45e5HUgN3SY6KlF7ar4KHV1WcL91rReVXk/UcNCj2AapV/OsdRh6DYG6G/FfXWZhnmX
         fW3Puh3JyVYR4P/1Q9S5+mudAbn9ySuZ+TRdZ7vI2IbZV2weRwOh0r7aXNrxT8/IrAxR
         rlx9S6pxDsYLTHs5XuZPtl7KsItNh0cbTxrd9iXNhCFszwuBPqhCiwDawy/STHTk6G8K
         TG/ylg2hd7FQQQsHcwpxNuVnANsBjJA+HpA+9dT6gsQh9uubMdJStWD40FqOsz/QVqZE
         PIyA==
X-Forwarded-Encrypted: i=1; AFNElJ8c3DsyKUgWIV9rFJrALh58pqv4VYTkRt5fPByhfEjNcaHHAWdNBwnT7ty3su3mobFcwB5GP6g8pn7ekNCN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8wVgoL9awfm/R1hYxhq6Hvr+wlcFzK0nSiZbqXmNZ09OtgI2+
	ipRfVgwzfH+aWf4s1sjcx5/Ctt2k0C+PrgH4O1K8Mw/YwGVyQuP/HL9jXiC5yM44/EbplnOSONf
	tOMvPlNCQ9fSmstsw12UQt51WKxBqKpJSvjkMZMbC3eHrdyIStUODDqFrQOobWWaZuUPB
X-Gm-Gg: AeBDietgqt++MvkuizZBEyr1/OprFnG5FJaNu6vAbOu316JTAx0nWOiJ1WhcqOyORuK
	tv6NXjagIaxaB/jZQXKWrxEQJCmmDK7xX3RPlItqxBJiJ1oQGZ+B8itm83dq86n0pxbnAokRTDa
	eurfCChLnyiRz+yygp3qisAg0kJXawK8XF+BOxiiwqlwdTncYcsMxZpmLpr9v4u8Mqj2iZ1UeJ+
	WO6hQLnWbmoFSVcHkgxTwX3ZtQn++2XMfMhzNfXBuJP9RAevDVwbR3Lt5GVoakv0IKdT0qHDANt
	aj7Jkxp6MVdx83n5/LsbsBG1AOHA5tYe0PRSd4lvGOOwW8mdF7/X/6V4d2Ux7cS+ZRZg5hqkADb
	LyYVEc0oTFqjksA3vYU+NxlzJQVeBRseVEnFStMU2f+ZvLtaXqyyDoKHOTWC/NB+284QqTYTU2j
	7Z2lk17A==
X-Received: by 2002:a05:7022:4592:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c34e930a9mr11409531c88.2.1776251524354;
        Wed, 15 Apr 2026 04:12:04 -0700 (PDT)
X-Received: by 2002:a05:7022:4592:b0:12b:ed30:5b85 with SMTP id a92af1059eb24-12c34e930a9mr11409511c88.2.1776251523717;
        Wed, 15 Apr 2026 04:12:03 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b5627sm1427409c88.13.2026.04.15.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:12:03 -0700 (PDT)
Date: Wed, 15 Apr 2026 04:12:01 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
Message-ID: <ad9ygQD6962M_UpV@hu-anancv-lv.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
 <adm2oq_ozs_VUXs0@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adm2oq_ozs_VUXs0@baldur>
X-Proofpoint-ORIG-GUID: 2YJhfuC3C7_LfSXP9TIzL7hpAkzv0ofe
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df7285 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ecx7AO-9lf1Fo7kMJGEA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 2YJhfuC3C7_LfSXP9TIzL7hpAkzv0ofe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMyBTYWx0ZWRfX45KqyW9pQRVl
 mgSknpcIEYo8QZ78H3YUjsA1wPaL6cKdX/tLhnnNdbEeixBQfDaiqdjcgAN3GihYcDg0V1EP9NW
 YDrmJKjSrVmHKlvjAe8MXVhVL//N5yVvxi6dTVFDOqw4bBFSq3uwij0tA6kVexScSUpzV55vI8K
 1pNgjhk9/z+5K42+VBsNwnG/fHEJNTUA4UbkigAgBJDYALnzPu38Xosf6Qt6kQizXgrwXQZU4qc
 Ru39hi86ry5kNP7OA6moxMDi09VRfxjGsGMOwlJ7nI0mUgWmar7ZGB+ZbTMTl73N8izLcJi9wO+
 qGI65OQA3UxJDiwAtw5fUa8q2bm9LPW5tD5TIXApKaQZ8Ig57zzMyj1kECVUKixHcNokqYrp44r
 CeCyTqsfqwE211DACiWLh0k/g3laicDtn5cuxpTA7oIcZJcK5OvQV0TroE1PAoTxRKoI9H8+yaW
 vI3Lg7Tnsv+qRZncsHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150103
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fa0000:email,hu-anancv-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103280-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 677B84039D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bjorn,

On Fri, Apr 10, 2026 at 09:52:18PM -0500, Bjorn Andersson wrote:
> On Fri, Apr 03, 2026 at 04:39:05AM -0700, Ananthu C V wrote:
> > From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > 
> 
> Your commit is lacking both subject prefix and commit message.

Yes, sorry for that. Some mess happened during the process, next revision will
have everything proper.

> 
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> 
> v3? Where is the changelog?

This is also part of the aforementioned mess up, already taken care of for the
next revision prep.

> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
> >  arch/arm64/boot/dts/qcom/glymur.dtsi     | 47 ++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > index 2852d257ac8c..3fdf8dbbde02 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > @@ -560,6 +560,13 @@ &pon_resin {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_soccp {
> > +	firmware-name = "qcom/glymur/soccp.mbn",
> > +			"qcom/glymur/soccp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> >  &tlmm {
> >  	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
> >  			       <10 2>, /* OOB UART */
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index f23cf81ddb77..f7f3374a5e08 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -2264,6 +2264,53 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >  			};
> >  		};
> >  
> > +		remoteproc_soccp: remoteproc-soccp@d00000 {
> 
> Isn't remoteproc@ sufficient?

ack.

> 

> > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> 
> This binding hasn't been merged, and yet you don't mention that this
> can't be merged?

My understanding was that the prerequisite-***-id part would serve as the dependency.
I'll make sure to explicitly mention such cases in the future.

> 
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
> > +		};
> > +
> >  		usb_hs_phy: phy@fa0000 {
> >  			compatible = "qcom,glymur-m31-eusb2-phy",
> >  				     "qcom,sm8750-m31-eusb2-phy";
> > 
> > ---
> > base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
> > change-id: 20260403-glymur-soccp-2ca25f3b30e2
> > prerequisite-message-id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
> > prerequisite-patch-id: fa390011ee531589a7ad14250d158f497622efbd
> > prerequisite-patch-id: 93e7fca58a5c06edefa624ec2b006dd80f4749a8
> > prerequisite-patch-id: 99a3b6a7fcd061267b40097ad25f652ebe0a4c7b
> 
> Why isn't this list empty?

As mentioned above, this was supposed to be the dependency, my bad for not mentioning it
explicitly.

> 
> Regards,
> Bjorn

Thanks for the review, Bjorn. I'll probably wait until the driver changes are merged to
make another revision.

Best,
Ananthu

