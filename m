Return-Path: <linux-arm-msm+bounces-113104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f19oM9OrL2prEQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB48684406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:37:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cdLwKuBy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kZtwnw0j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113104-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113104-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B51933019831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F59C3BE17D;
	Mon, 15 Jun 2026 07:37:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95D3090D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:37:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509067; cv=none; b=NQljOclvh4U2EkaiUjPlML493MBKUpBtjInUXSEB3LlcoG4GQs8d2oYuQ1byejX49DXWEonizjy+FtMOQx4fx4Wh6m2btUoglE/N5B+mH8FoTe2NmM0SWJpLbUk/sL83raBeXgar+BjtukqM+mn4x8hvMaYOnwxoczZbv4VADNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509067; c=relaxed/simple;
	bh=JNkDNEnXyRueWYXiUuPsYeB1uw+H5DfKndAs0vsPneg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeKR4F1rdcPDw4Gi751KMXn9gAy4BYTONnKmOgGcoTtEJKv6xfnkWEuU+XoCwtuYYB8JPsNSB+uEAUiWyJw7HG3dp9kosWB/CHfCUxsW/UrXI3k2W3jYK76OgmdEc+PGox6SOUQsVb9jFyDdZ+0SDCygh+vfcX0ssmYGAo3gF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdLwKuBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZtwnw0j; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KZwJ3709647
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KA/kjF8FvreUrlkAuGn/Suka
	SvADoi6dD6lgMWfNLEo=; b=cdLwKuBy/TwyFfmmzwAZb5TGI4uatcGyNKp0XxcZ
	Kk2OUqW/YUTGMGLX2w4T9gv2LI8FhvQUCKyYTaWLubMJlYPnwK746UDjPtGZil/Q
	nN1xao5iszS8q9BX98J4mRqOrGti6QJCuFucjAl4i5t3OWHgfZmTIytKFplAa1Hh
	k5cgr4RUVNoK6MV7nYqt8RmSVM7Z20VivKQfOy/Q4Y2h/sT6rRqXqP/XeHwuXYLx
	SglQgby5gW/GgymTBnT0SCN2wSM703tQSn0oC6rRrgMb68vTY8yPX2MgaaGsWqpx
	ILcc6SySpUcWNTmaWGflTdnYpGVpyD5bvBiDpP1zxXbOLw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9567r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:37:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2cde332so1420121a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 00:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781509064; x=1782113864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA/kjF8FvreUrlkAuGn/SukaSvADoi6dD6lgMWfNLEo=;
        b=kZtwnw0jXWLFmoHm/lWr8FYHcBo6WrkayfQAP+xkRI7hhEzERZ59VodMtUXuYm1huO
         eUABF5Ou437Djo9amxavpGMssHqdFDhNyagkXLRqjHa7XEfGvTNjofeeDe1wFlTOczkr
         jIyStBbGfW8UgMz9fYcPB9hW2a36Jv9ADhVHM3gA2vaLrWsUkOX0UhII+F1UzX/skGJz
         w8hclf8R3N6DqmhyQQvtoj7lTu2BTiM5KNxZpEu2x2rWckeT/Xyjy8uGYdr2AAsSM6Hu
         iLeanC32uFH3z7Vex/Gmo0pTtUQcmGY4n9lXp8s6f4fR9s85qGuqSMh3H/jnWhxEnUBa
         i+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509064; x=1782113864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA/kjF8FvreUrlkAuGn/SukaSvADoi6dD6lgMWfNLEo=;
        b=sbpHNIL5e8TRLdxOudxXPoGw6+NJzc6aQC8FvVvNNiqh6Ad3JYjZZkEJW6p75w3nsp
         wM4uQShxdbk06Vovhg73jJr6pZ9oxcpdo/lhQS8w+us5DpDlB+GlmCW4hgZZ7/B9CE0H
         IURFaiodZ0+8mCdsreqL2IfOVEM08oLt7zUVChnp3KaaAUEAlQ9auZGYhKCV5HyRYdFr
         bDcWQjKe3u+nX7wrXC1Siira0pslkWtJcNwAMd1sLoawB6sjCJA6ooh7koQ0Nl+e65Hh
         mhnkMolZkGD0qP70HPZus1xdwn57x77U/2XfJ6+1hi5jZXG08gnyfQ6q3NNtAdtgeIqM
         FHpg==
X-Forwarded-Encrypted: i=1; AFNElJ+4MATgSiIzcSNHp4vRb7XLz6Wu4k+qAogi3wsUt5Xi+ui8ZdqohT0vocqMGrGTXAf1LqnwFmLgmv0Oc39C@vger.kernel.org
X-Gm-Message-State: AOJu0YxezmHGZg5YRnvA6eiD9bxE4Ypo4Ef8dCQEMdoWknLuK96wZEKB
	ABD8qAXjoUm0rGk5Mc1+rnAg4HtxugH5b50MuJiYj+IVSUxlJ7tQuwR4TBVljUExptpxIlqdskE
	njnDHgiD2JudyEb9qKHDn5r83MVBUwlIjU3X27gVxtKp2Q+wcGgRzSrDPgLqy096t4TkJ
X-Gm-Gg: Acq92OGBchr3zS5quA9vyu7vV8wOPOSpXvTdjpZ+sROwpeQnjnD+i0MIq7LTSMVxxOm
	D56p51RAktjQay/ipo8qSDGbRCUQ3xF7PcHzLxSbfGVATZ3ACyBpq0SCp9qJdD63xq30jQBaVgE
	C9N+CqK41LxrZDmOtmNMezi2WivtHIA0aFBSRG3gx8f7oOKlO0Ym/oskyjVHvbC4hK/3p0n1nqK
	54gL941R/FXT/EkjzjV/5yxdPEUhCq9Greuh9LaQGNF78IQ731IN9IQXYSWyf6VGP3vMBxhejEm
	Hn3GKAwOyq3lZs6k48I++OZfIT+Z0hr1HBgaYhCuKGobReu6uH5s7xdnOFHEbM2R92gR5tn/FAt
	VChHnFALgA2GTR02godsIYABIZ5UXRqhsJGM0QJLROnGeaAEqV5Rf4EMw
X-Received: by 2002:a05:6a21:7807:b0:3b7:9c69:99d8 with SMTP id adf61e73a8af0-3b79c69b373mr7696101637.2.1781509064046;
        Mon, 15 Jun 2026 00:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7807:b0:3b7:9c69:99d8 with SMTP id adf61e73a8af0-3b79c69b373mr7696058637.2.1781509063593;
        Mon, 15 Jun 2026 00:37:43 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accac96sm9860782b3a.14.2026.06.15.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:37:43 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:07:34 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: Shikra SD Card support
Message-ID: <ai+rvsUsZts5o0oL@hu-mchunara-hyd.qualcomm.com>
References: <20260604122045.494712-1-monish.chunara@oss.qualcomm.com>
 <hpvnpq2rx2axmtxmk2y6tddeo42ohvd4ae3z37lynzm5nug4vf@sg5ndaqfdlvh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hpvnpq2rx2axmtxmk2y6tddeo42ohvd4ae3z37lynzm5nug4vf@sg5ndaqfdlvh>
X-Proofpoint-ORIG-GUID: JY0UsFdq5a4wTEyzAaYK5Q93mGaQtZkG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NiBTYWx0ZWRfX2tX+o6X8TA7t
 kYPZfeuiHCO4P05oa6ecDj4e6N45h0qduXVoYEnHSUjWDRGkxCB3MeL3kDysk/Z10ZdpaDgaNWV
 MEdLvTh36tYFnOooxacagORVGeIaLvE=
X-Proofpoint-GUID: JY0UsFdq5a4wTEyzAaYK5Q93mGaQtZkG
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fabc9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2VYifEciZLNaiyXlYSoA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NiBTYWx0ZWRfX7R5H2MSan3M/
 uIgdF9Yknt6s9AccLSf2VjpLY+RebCPUrs+W0z1uEkVUZe+9JFPRhSyP0iB3vg7nJSRiyOgQluv
 vAocLA5Vxoq7CPL1XJ0qqivjCn8t6WINZ12ESgqzjAj0Ua9ABkT5zyeUkhJ7TCZJumhfyJLT879
 taLndTlvkvpBuQJwDySfPXWc/6qV/8voaJjdeXhW06Ra6+AKbpNFhpIAAb+ohe0KjRsMtB+Qy8B
 oBz6TUKHyMfnnelpfAaNmvM1FyeyUDzQjNc6ESzafZftoFP5cUe9Y8QY2YG6jGbN5Leo//UV6Sw
 z3j97GyDonpZqmptzTnEpNNuRVINXbX0waBkysGZwHbVloM+HDSx/5YptpLaWLl0j35E00EE0pV
 s9vBlW1eefEoqbIAqYghpsY9H9uGMF3sHzxuOSndnOSB43jbqVDhIoWD7kNN5R/f7QX8pDfoRw2
 zDXBn963EsBCz6kf9yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150076
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
	TAGGED_FROM(0.00)[bounces-113104-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:kernel@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5BB48684406

On Thu, Jun 04, 2026 at 04:22:42PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 05:50:43PM +0530, Monish Chunara wrote:
> > This series adds SD card support for the Shikra platform.
> > 
> > The first patch adds the SDHC2 controller node and the necessary pinctrl
> > configurations to the base Shikra SoC dtsi. The second patch enables 
> > this support on the Shikra EVK (CQS, CQM, and IQS variants) by defining
> > the regulator supplies and the card detection GPIO.
> > 
> > Testing:
> > - Validated on Shikra EVK variants.
> > 
> > This series depends on:
> > - https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
> > - https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
> 
> And how does SDCC depend on TSENS or remote proc?
> 

Added the dependencies as per M0/M1 series. Will update exact dependencies for
SD card in the cover letter of next series.

> > - https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com/
> > 
> > Monish Chunara (2):
> >   arm64: dts: qcom: Add SD Card support for Shikra SoC
> >   arm64: dts: qcom: Enable SD card for Shikra EVK
> > 
> >  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++
> >  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++
> >  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++
> >  arch/arm64/boot/dts/qcom/shikra.dtsi        | 93 +++++++++++++++++++++
> >  4 files changed, 147 insertions(+)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

