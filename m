Return-Path: <linux-arm-msm+bounces-100508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFDRCzcVx2mWSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:39:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A434C648
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 005073015E09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA91438F936;
	Fri, 27 Mar 2026 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/eQFagn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXy9RFhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791F33EAEC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654500; cv=none; b=Efaf48GVp4ErYiG7uXKJRnS9WTQvC80uJhkiyhvoMoKzadhaG5FPasCWtJudWnY/8YVjj7wx8NgiveUShjZvhQshCo0Hi/e199O3Hx5sShAMeTnoKy8gI8HF+Ir6WrXCWXEHX69OeAdb+jCVkenQr85GC65N9hCwWzQO3xR4O98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654500; c=relaxed/simple;
	bh=5SfqcZmm7pV88JC5OG5HsgWb0I/z30fDoitR58+0OZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbIALZBWMfO5ehuMfmVq9/JMfepMHTEtFT1wFHQJyzbQCnYX43p5qgsoPvWit6/8P4lnJICjADlhirQV3Cbog1rNJdJBwwoqhIl80EJcedOD8NdviWytG2D3hOXiwfKIOzAGZbp918sQcgIFd1dTnnDyEnMknWLUMT9HPPqhElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/eQFagn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXy9RFhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN3n621648628
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/VoCIrpAvd+Z3bHm8hG5MCfI
	mTIzBCTyZdUbxL+dMhE=; b=f/eQFagn9LvK5pMVLF5YKpnIuGilmhSBi8khBOZ8
	HTSF2IO1nu7aH6NxUzBFwypb7cKXlNrbLvw2lONDmOOAbhv434S+9XpEjHJlc7NV
	GpmwPGa5Vj8usbyN2eMOHia5kuLo3MT8kb9CsbllBBvEhVwLuGHaocYSOUgIISOf
	9fDs2mv6hcnCBIVSoGQwkYZscYWiu64vIJgY7w7py/StkZCQyFl+fDtgtNluwYIc
	qN1HpHqhFgQiNRyrTYyMtv7XdYBxAQUB301AnvoZlAiOaw3039T9rlRHqhyQAtpu
	n/3oza+nvXecDDudeSf5UX6UKysgjGvimb7ETLiO1yX39w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111gcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:34:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ce375c788so6626556d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654498; x=1775259298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VoCIrpAvd+Z3bHm8hG5MCfImTIzBCTyZdUbxL+dMhE=;
        b=VXy9RFhSl2JVeoN7z2O4spG/iocGOOahkFzp/cRHqxBrMep7drhgEE9Rbt/N5CXhi3
         QP5lXOpeXfsXWAV5jooGyHo9WAFH+62M5PhcJFszzpGMlvX1x/H9od3tVj5ZPrLIxLtb
         TdadABRCxbowWDq1pxZEWOm0nYH3AFh4g/wqYgc1W8vf/jBmyEOfOmejqzEWGMZw/2Yr
         RL55jc5TQdI70pyZo56ys6iklVqVV5XwvOVQik/I4w+XfNw28v6ezRqNEA3L6EK2GOij
         +LcwSMKKhtoGlV4a/RrobZlT3DZWww7zF7L+RwdzEjslS8oqx0Y0+OmKNdaLnTNHeiHf
         AsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654498; x=1775259298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VoCIrpAvd+Z3bHm8hG5MCfImTIzBCTyZdUbxL+dMhE=;
        b=hasZnGyaFK3oCJb2A0hqmKNWFCljvY715+F55Iiig9tH5HAdoceGfWSfA4UJ3CERxP
         6zIj0JsplV3hti4IvIj4gIFx33aIoErrixcZsB7oehFTDYtNRAlykML6vL+I8cF59NRO
         R34/630Cz7ZyxtpnTdiWPCTopkokR0uzZHqlHquD/PrtquQxi/DSmvnKi6PJsd1ceP1L
         2V+ekSjK25ZVXS38TmGlz1XlmshcoxWljxFahAapGgL/+HBWYEa38KyGUnTdDkN6PrkY
         KElasnOi6oFiOXC3lQKgIVFJRmlpB8RJUmjtlrUopfzjrXI6J0RebnBe++8J964n9XW/
         p4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXArZaEyYk/1gC33yx9dQiPFARj6xBXuav0ZNsAOfflTUmaRqatPQULakq4y7Xlb0RWc4eFcXfMh9ZR1EdC@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPO8+mQlX7tAPi2ckZD/6WzoYonnA+ZmjEiKD80f5p9l2R/6G
	G8Sz4PtZ6mwull6C1KK69fJ1zzBlVXh1dN0ebcCenNFJHfSuAa5fDWdbyTVCLyk5b6BUrB7l3HU
	TA5m6Nc4TBDskykMlQGzRiZa32Ux4oIXMIyEH/A9wYmfkvHzikdZZiggQgWeZnHNup493
X-Gm-Gg: ATEYQzybvH1O7SKC6IRel959gyZ8vz9/9h9Qo+bQModzrHW3gyaRvgx8Pssld6qogAH
	RAk01ezjzAomOdM3SfHT1iyTQvAwKZyTo6IfrIyym/nVoAd9SnN0+HfOefUE5XVkPO964dhZVgD
	H4nOq2xPcHvfAmvFT4yIDgTbyvda8zyjcqEmr69f4AWst5qgMiNnIDFqh9zdajJEiZmimUsBTmp
	uYENRdLWZtMBj9IS26lFUTHFOXSttgRE/KekcXIg1S1pD9CeHBlx24TZuefc5VzMaSbfN1DzFKj
	Tr0WRvRluLmU+TuFqtM3889Q/P5z4u6y614XucRcWIYlI3Goa5lHz+Cqd9djXwtYEzs/IgKVAc/
	XDB8mzV+wjsfIUaqqsV//EBN849SsYwFSJH97+EncgOuu0dUACWqbHJ/FoJYmtOOxxqiHhcEcBT
	OBsbijfsS9XpcLEBtORAyFGibj53GmJjkSLtA=
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr58001341cf.6.1774654497888;
        Fri, 27 Mar 2026 16:34:57 -0700 (PDT)
X-Received: by 2002:a05:622a:488a:b0:509:1b01:8926 with SMTP id d75a77b69052e-50ba37efac0mr58001091cf.6.1774654497447;
        Fri, 27 Mar 2026 16:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b8db8sm1192241fa.29.2026.03.27.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:34:56 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:34:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] arm64: dts: qcom: sdm845-oneplus: Describe
 Wi-Fi/BT properly
Message-ID: <umsy2om6l7ql5pxtm44jmlzpvbq4frqzlbqhncajl3nuiqfwie@6qaoost35glh>
References: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
 <20260327-wcn3990-pwrctl-sdm845-v1-2-3f5c34e3fdd0@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-wcn3990-pwrctl-sdm845-v1-2-3f5c34e3fdd0@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfX/c1zVPYyJLEv
 As0pj2zDCTgSl3LMg8IbJnzwQA/ilE3vO5tHKIuVGe58Vu5wBjvfcjnJbTINynDOVjQICiKagXJ
 3ZeXYYJm9mgVzuY6WmOaUAvk/xshMGWTdCcElae27alVEWTJxDMTLADrYbwkJdLOJ0DSqYiT5im
 NP6MNK2CqKO3CwOUe52GV1zaNWbz+niYQTgZeu2XC6Quk0ylXOfMy3JIRZ54uEJasTHk7002r0Z
 YL9Z13YY7TKAQ/xdct84XYWVA7taYWpYrsgZFhyMywLMPRgZvgFdB604yMYtbj2Yn/9fLXVax3b
 V1zwp9OBirYGLPP/rh4m+wxwDpM8u3ASp8ZbC0QjzIUyzWAl0H3TWfLhtDnqMocjrnwFPuxbmuM
 2EcRs5OqRzFQpvqTND0ZTbmV/WkaKfLWytP+zDTNHc4ewMwelGSq/pRbPRdXvgRkchVV2K+KWkE
 9NTrLQ1FLndyvnqjPUw==
X-Proofpoint-ORIG-GUID: yG36R-M-XhuOTSVDxCjMYow6sAWhv76m
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c71422 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cb6hrz4NNR8bXqT0X9gA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: yG36R-M-XhuOTSVDxCjMYow6sAWhv76m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100508-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 851A434C648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 02:07:09PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard Wi-Fi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree
> and rewire Bluetooth and WiFi supply properties to use the PMU LDO
> outputs instead of referencing the SoC regulators directly.
> 
> Verified against the datasheet.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 65 +++++++++++++++++++---
>  1 file changed, 56 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

