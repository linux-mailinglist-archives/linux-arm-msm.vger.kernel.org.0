Return-Path: <linux-arm-msm+bounces-113106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TDIxHYazL2roEgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:10:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7036846B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:10:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DXRHMoLH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ahSGmyEs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE6F3056FEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA64F3C0A13;
	Mon, 15 Jun 2026 08:04:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925F3C0A00
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:04:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510648; cv=none; b=Su6KMx0jiG+BWjv+pQL0uROkp9xbbLrNfk8382fbFs5uqtcI4lj3JMZPiITREZhzyZU3YWj3BOY5Tzz62BhynhHntduNdcWtJWYUVsTCxLneqPUaM+V7Ns7jxfpjCEv/qLiClhJJWSNcVTuIYL65uylmq07BTX1YPOdI8Fu2Ig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510648; c=relaxed/simple;
	bh=306+Dnl51wBPqV9cZtf8UkZPlQZgUUwTx4NzKjshApY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhT3+gwkOTS00Zel3tCi5NUeoF6rgh8k8rGKE8htaiRq9UGVts6Kox4BOwgbZLyRMLjp2rCIzR54MJUTAJnL8qjvWdbSYE2pDmAgfeji8FqNE8v+jQQ4P2wG4kk/py9/N1WwXD71wNLvkziLxMrGyexQDGRxEPdy2oyWquIqJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXRHMoLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahSGmyEs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LiPD3853170
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=69HrKwFmXz8riMg7FP9KtF3p
	naP2sJ3u7cfriQzChOQ=; b=DXRHMoLHX+vrQ7nXmhsOc5Loakb5Kvri1bCKc4hQ
	Uv+aHRsWgnIxDpa7w7s/w7QcuF9aD2POvYKMjqe+BNh4z78z58BtLgi/fhPiG4bn
	AWhpwYIF2YmMaz8dHfb4judSrC4hWhYdPsJ3Ytl0FGfiyuJjwsBrmHbyzEgd63eH
	kgOwB7OEWknBID/VNDCOIOiUNZ4DgXIlZMBZCOOR8uynqf1u+oalnetw7u7TWgMW
	c5i9CCViBnGozoQGCEcx5OHgZSHDeQ0g526RPYZqCxvHPrc+3iKPIXeyCB8dYgLT
	dzl7mSRNKawoWdvpLrjG5Y7Nv24ToyZB8npMx6qMsZyHvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxcrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:04:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3772b6b31b4so2245694a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781510645; x=1782115445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69HrKwFmXz8riMg7FP9KtF3pnaP2sJ3u7cfriQzChOQ=;
        b=ahSGmyEstd7Dcu3Is5mpsp+u3u987f0L9z7rUWWf6rH171B2SwJVJ3WaLx2a0Tb66/
         8MGeENUHWxuUc8N3G2zcDcsf8YI4wcNP4cy3fQEfQFWg6vdXzMGKC1ROKmMKsgKUh8HU
         d6eYQAUVHousVacHuf2/vXzsM4pxI3VMuiO975DrxfH5QhD2GrX6wHRiON52ZYvB15Lk
         OrCXhm1x7MXbX5zDNwvD3tgjGD8SnXGUiYwa931EahRwBmRzSUChwtc3dTHBVJ+1vA+f
         QJslb0niz9Kt1jR1+r8SFTuOX/RrsGvnWelgM3JkdDmF9Mqj2lwjGcWBEYKW6yO2Ai5y
         z4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510645; x=1782115445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69HrKwFmXz8riMg7FP9KtF3pnaP2sJ3u7cfriQzChOQ=;
        b=T2MPBuDzhwV6yBKkZVKYH1dmdZYb7fhbQLeSjPOF30XpHZAygTPaSPm4QqdrRtF1VA
         8JmJEVzcMPomVCRL6qlcuERhABhhjJOJZbCsoG+EykJ1EmEcpcfMYT+kqtZsJIegFlCp
         rMZ6UgFei7kwS+yKmeCdcmDdyvktrXqQDbuKZ7CUhEGRqgesPFux1D3tjZ5bonimecT1
         8WAK3/BFcMmZpVtoVRSG0pjqxwAxS1LEt0JDBzxQtAfL4loTio/eAjGVyolXK/qGjzNB
         ii8x5WInI7ZDRz+R4G4zkQTgMkv3YKhw65D7hvUcS81LK5I4+oc2iSnr+Cp0YkWoDQoe
         eznQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hTIDneN7DxnkKRI3yDCpH9ngOTHh9WXWjLIgRi381sHIikgC05B3i5xEABM3C5C95PFPU/iEBOB1vxBgR@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzacGw4sPJGd5wSv2O5eoPwmLRiAjBsAfKmyq765FlYo6GXAs
	4KG01kP3+foKBh6PF7hFlKx2sFjRfr0f/A2CddJDyd1nJxN1zabqB19JIqNn43FGEIcUFvS1hC4
	JxktfZK3vbZK8sochhcbIYIrYcFkT/moMjHkxS66txMa3l1RqndpUQjdwy/LtLyDq9iCJ
X-Gm-Gg: Acq92OGp8J+pY6IMfxXPI3Kjo+pmKwpvSPbwsPqm/Pm+giZjCbJ3yidxXYPJQY529Yk
	3obNDhUr2yhpgojwFOrAnQnbrYzEW9NHOoXWuvWGn9/qwdOamA4H0xXP5zQyDyo11MpBILyNfM7
	GT7smTz6Eeu/DwyEgfEV6ZiYCYBjvnYlIhw/CXioUWUEmSHi/V4HqyyEksH57f/Yh0J5EiiVY8E
	DYHm+hC/TFXP/Cx7NFL0yZM5qIwztva5syqL8SpCZ5f7YSuuPrinj67N+yEubNcgprSAlRduOsg
	eZPevHENoIBdjdJomi4GGeIPwp7d5yp6KcpboEoD5+WeUwgfqyRifLr/iURJtIkWnmnkGzbNL6d
	izBwwQN80klPYXu/IbdE3OGfT0uOlWUIGGIWtRTBRXn1GtiLGWptLVKQJyoA=
X-Received: by 2002:a17:90a:c890:b0:36d:a510:f8eb with SMTP id 98e67ed59e1d1-37a01846de6mr14273910a91.3.1781510645447;
        Mon, 15 Jun 2026 01:04:05 -0700 (PDT)
X-Received: by 2002:a17:90a:c890:b0:36d:a510:f8eb with SMTP id 98e67ed59e1d1-37a01846de6mr14273878a91.3.1781510644980;
        Mon, 15 Jun 2026 01:04:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm15354774a91.16.2026.06.15.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:04:04 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:33:56 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Message-ID: <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
 <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4MiBTYWx0ZWRfXxFXLBgT/MJTf
 fuv3+05ziWRjx8Mk+uizBBB/GFnyNDuc2IkPViHNgBqr53fmVHDnTGHSAwOJaZmKd3CAT2Ms+aj
 njw3jN1NAOCojrXUaVz7gsFNpiONikk=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fb1f6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FjpnKfaMezcxXxbuv6AA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4MiBTYWx0ZWRfXxl2aZcyYHsNx
 pNo872fd3YR2DyRvFCvVQ0bCeDA0K3bITDYAXykRVszmyAr6Jj3f72F/e/dHERbYhyBFU5q5ATn
 UvzQXGR35bG0Ttu1pfEu0ZLyvifhVH+Nqj1/vn28vu9h3DTJhzwLkIAFHanoHknsLQlgvUOKKig
 EBjAEp7CZvP3j+NEDaUDN2bzAS8YVRrqddbcTOptcdsDkRZhPTXfNQn4G77QzoKfWuGCX6m4E/8
 mQYq1CUY9QOALaJRmstHqVho7SatAlezCUrjNWkr1R9eyV6dhPACsbmIwzD4L/hyhMv7twKtJJf
 9XhZmbwrWwxoxiPi7lgl6C8/mac9894cCLttkm8IR3SIVzRI1G2/k8Ug+APfIhjtnuGsw1DBOwH
 Cim6eymuF8aV4Fpve1ekrP8QtWwROCfDrhEF6R8Tq2OIScbiSjCUwq5wtdXDScewLgKDqtWkY7w
 HJvrGgMYM1UruTVfkEw==
X-Proofpoint-GUID: 5hE3ilLqi6OxAaj2-7qH8HnsSo8xhFAC
X-Proofpoint-ORIG-GUID: 5hE3ilLqi6OxAaj2-7qH8HnsSo8xhFAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-arakshit-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:kuldeep.singh@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE7036846B8

On Thu, Jun 11, 2026 at 05:42:10PM +0530, Kuldeep Singh wrote:
> On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> > Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> > an optional OPP-table.
> > 
> > Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> > platform.
> 
> s/eMMC/sdhc
> 
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
> > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
> >  			clock-names = "core",
> >  				      "iface";
> >  			power-domains = <&rpmhpd SC7280_CX>;
> > +
> > +			operating-points-v2 = <&ice_mmc_opp_table>;
> 
> To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?

Do you mean sdhc_ice_opp_table?

Abhinaba Rakshit

