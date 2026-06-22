Return-Path: <linux-arm-msm+bounces-114005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b/nYImk4OWo0owcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:28:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7E6AFDA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:28:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jn26DHZE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VvNfCssa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 507E0304232F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1213AE6F3;
	Mon, 22 Jun 2026 13:25:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C534E761
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:25:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134703; cv=none; b=kHWC9sH9Z+5XBjRdSanjwMd4diyq5urv0GpoNe4O0+MyT+kRm8L75Ar3gP3KeQxLEu3hv5c65pCsb35A7y/yWwL4RfkkppSKBP9JnIezZg5mWzWXCs3GstNhg2NE8TutdyWALuTM/50VnoMLCzFVAV/KtDyXLg7w3Aus2GqZPV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134703; c=relaxed/simple;
	bh=Lj/oVPnB/95Wl7MnqnPwuq5mYkRXjp3lzUWb5YjTH94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFDqVGQcWQGFzuzDSPvSvopjNDECZcPB7H6GbUCIJchMTvCEUc3raUt0gS4hVpRr2Lj+XxbQIJatEVPtMy30IB7gStiJGk5G2qyqO7zodP+m7u0PIRq7yOkjISDHIiAlQa94tf7nmAouVCYzJaszi+dNS1wqNk1vsBsLseU18jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn26DHZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNfCssa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDH2tK1096504
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EV4Wemo6ixakVHZXIVFrt3J
	dpQFipHlrf248A8xxAI=; b=jn26DHZE82vn6utMVr+2DPgeFvhX7yTZF2cXVepS
	Go4loYhPC6IjoEjKJT9N1U7POqW8RLF0hP6kGCfeAx/bhQctxj5u6YjYiHQ0zf8w
	LHkLgFm7bTBvbpNsTOF2K5SDjpdES46cJVldf3RlXdIesmKSNgTPA0Ns+MQl/G1m
	KJcx6CsxbXlDilH6hyUyYj+LNgwiT20BvbDWQQ9EkHZOFeVTE1T0r04ecn6RJCHk
	Y4IkKy4eB0n85J3f0ohyrhDnQgl1jWnJI+5UxKBdfrvgp4OGECbew7W3l6pAzp+S
	JVyyeGtWSsoUAS3OJc9gzdeKRtAi+Vf6H/VWyPWFkr9a4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h6qkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:24:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0a27ad86so10050258eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134695; x=1782739495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=VvNfCssaNzQd1X3JQqic3lm9+sDo1RB8pcwaNULodJxn/lGqwY4W06k1V9hHTQiISF
         sfqTlCt2gy7yQ/99zaVpHjLLxCUpgbxdCGUv/cP6/f+7vK62IRf2KTx04BKlardcRDjz
         1MYmfSh9qukBSsIeHjh5WW3jw6PdQnsIjhSuOnhluZin2q9lq2ndSvnaVGBv+Gq+A5L5
         enstYhbbdpvZdakQoBauAi37dqgPuGwGIahmvFI3xeWlq4j+WsI5VC8+aAPZd8ZsJSJ9
         o2LoUiuQzwNv6EMvBE+VpohfeCgsJCnFspYhQCkgbFiKzpQ5ZksuTh5ykKYwHmo7fc9L
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134695; x=1782739495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EV4Wemo6ixakVHZXIVFrt3JdpQFipHlrf248A8xxAI=;
        b=G+O+9zA7A7cpgdGJXJmWOi0wFdXcLNkfSMloeIxRKBJK1AuBvywiHzyDl0j/akcWoQ
         Fmyl+8NVnLLKLeoA++k3kvYQ/zzNPb3dhSveJoWRG4sML3gFjCWX4vBmiM9FRgtPhpzg
         Odnt6uXpLWZ0Sn6kYIJGpc1wPigO9cGnAG9Fkyaejo8x4l4ercOrp8EqtSWHUCVRafdj
         FzOvPAmUCc783QpyshGBqzkL0MDc2W8Uf8lekvNcieg1Of3KZOwdqTGkXcfUeWmKfcD8
         fRFDKH0JuaBs32CsLjfrSrtI1icqv7uhc0JN8yU/IKdr/ntbhXy65PpZh3fWtNUqUIfC
         3LeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdJToje/Z0VZP1zJFmOeogRvMXBwbGtTG1NBfq9XZItFk/kyvrY76+xuaZsiuje8Wj3E0QweCyaw0YVn1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yylh4gwy3oPyGex8UkIc0qu7BPC5MRCOtTHHBEBdNnb5xuq6406
	Y4+ZAOuvS2OtKqZzFbbRVr/WYG978O2EJ5zUBu88Zm1NtruGHwBOiZG8j58B39m90TOEunvy439
	3lKAR8RSq0TKgJJIzhg/tjWumEQNqwy/5EpaSyy79NB9SuiwA+Yqqie+a7RQJmVbrbgIp
X-Gm-Gg: AfdE7ckDSqv2xOcKw6MxxtqDmX6BheIvyd3gAD4YxvuDBrEvTmbhORYtZCShfz4K7uW
	oQDMmY+v89BM7konuvyGwqWMnCuqKaBSA++5BupTFBrL3dUwhoTJCB4Z8AUHI+5T3NhQA6YRHB4
	K8ASZYBTsTEGJkkGrBl3qpiEKe3AkHqZBDmVGThfICaU7fDn26oP665VUfnKo5FSRxvXtxYDAxI
	H6QQbwOWLisex0DnzgwqDsyGI2ywAsMNV1/83PNpcv3J8tu3S/5JZzMnN2O3LLCyZUBwmTFZ5ym
	cuHFkJ7IvC3fo9m/u+XX/uaIBqZBcxECwFfaWihG3YAAYEyX9/TwbR5otipB7RHNbwjVoKvP4ZG
	H4YN1Svsbgle3OI8+aRtM79OgGWnQug9YXUIWqiuEhXbKtWrNK7G3o1Ag+A==
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940792eec.20.1782134694826;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0f:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-30c07006529mr9940762eec.20.1782134694241;
        Mon, 22 Jun 2026 06:24:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c32csm11113098eec.6.2026.06.22.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:24:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:24:50 -0700
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
Subject: Re: [PATCH v6 6/8] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Message-ID: <ajk3opFNCQYrnwiA@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-6-c939c22ded0c@oss.qualcomm.com>
 <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <314bab03-5f19-4954-9ad6-fe14d429ff5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX/KisTYC0uGlV
 sWN2jso+iuZalPnbCKXBBrfdkfSDO8ykHqdvdvqDlOzBwl4N4GeMNxnVjuLMuVf75q+h05+J5j/
 /57VrszdurdqJZAtlRTivO7DIoI52UAPcvvaWjX9fCDA5GdehMTjD+rmzVh129AohRARWGEJaWo
 /DZmHhJySbxXrERlbgSQND+bXSbEfPxCHiEo26lGQ/mlAz55swWnLA0EkmOnc199ITL1xyFsTz/
 MocUSWCG3nsyr3ur7HpdUp3U1hEIQHNQEp1ZmpwuQLiWNBk7S8G0bbPeM/exxm5WauTW+/EP28i
 uybqKjdDkclrLRl7JW1LtXOVs0qs7myX2RC62acWam1hm1SxUY/9Tm+BQf7SL+l54B2hjXX4lkA
 /83AvSuA8lxYHf5p/OJmp5Sxwkujm7ykVqfUNxoiSlxfNQWdSQ380Oa47dg+qHL4NgqFAXUOMSS
 4gPSqUcgrnXgz1GwPyw==
X-Proofpoint-ORIG-GUID: lOSR4x2dTcnVnS22cmAskcAeBVr2qvBC
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a3937ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UxYOzgASb6pbHj99R6kA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX9V+DFXFpS/nO
 icBEaHY4MhiWbwAs/vWSm0UpYXZs/gt+qSyVF0O7MHS6qNZ0PRijXwgnlPryRQstSL/07nQJnIx
 0hVulp0eJjDqRNko4czCLtRttDKnJCY=
X-Proofpoint-GUID: lOSR4x2dTcnVnS22cmAskcAeBVr2qvBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114005-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8D7E6AFDA9

On Mon, Jun 22, 2026 at 02:16:45PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > The TCSR clkref_en clocks gate the QREF block which provides reference
> > clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
> > and refgen blocks on the CRD board.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > index c98dfb3941fa..92b929ee3448 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > @@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
> >  	vdd3-supply = <&vreg_l7b_e0_2p79>;
> >  };
> >  
> > +&tcsr {
> > +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0

For COB, it is l2h_e0. L2c_e0 is used in SIP.

> 
> > +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
> 
> l2c_e0
> 
> > +	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
> > +	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0

Same as l2c_e0

- Qiang Yu
> 
> > +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
> > +	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
> 
> l4c_e0
> 
> Konrad

