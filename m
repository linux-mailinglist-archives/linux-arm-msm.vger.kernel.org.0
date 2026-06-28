Return-Path: <linux-arm-msm+bounces-114776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rUqQKKcfQWrelAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22C6D3DF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 15:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OFuXMWf/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V8wdXzdL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE2CD30066AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 13:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0593A59A3;
	Sun, 28 Jun 2026 13:20:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C733137923
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782652830; cv=none; b=tVsYD68mmiGiOZ9Fu+QThtDjlFJnUtjjm9flKEpmiCv/ud/raPMJgB8nacSlqGG+/sU2RguUc1tEWWcNMnkHdAZQtshVxq/XEA8uOwKkz9tLq7QdJW1wy8rQ6nSh2fDA9i1RWayyAHYBoEKyWWpB7tbVE8efQ+BanK5aURz8DWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782652830; c=relaxed/simple;
	bh=HQPj3lAr7VRimSV0ZnUtiZM+wwDMa19qQgGoRxNTZak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBBzcmTl3DP3wxhFhIDUp2Jkjc6R0FvngMyWTLaYkLxYGHA+s2Um9v9KxBynA+a7t8N+dmXE/2dlEjitaVN7Q0n3X1o6Ihg01/v6H1ps/7t/O+w8KMkitUCrMRRR0BhqCWJaGZfJ2jj6XqnokYaKUs0G+yMAotovisYpTR4t23U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFuXMWf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8wdXzdL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P4Lo3633104
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XIB7VmI+QpvTPuJKyvcnI2uq
	X/bF7EqWmyx4TGRyCNY=; b=OFuXMWf/ijkaU9K91CQ+bCV/zfdkCQIbqXEQlS/n
	qoVpyr0HzLWutcu3uBvnjySDpPwSJ8b/4ihaB4KlLoCsEGcL1JIiWOMx9CcbqoZE
	YpitCWFWORfXjF5H1Lbg2/fRZaWodjAZJ3LjDx5TJCQx9QIU9jI8UOrxupNdawRP
	64rEwjOPo5U5teD7h/cjhLYaK58Tu5B9GmcgLaoo9mxu4/m0UzUTDKiV0gtZ5kpQ
	k4GegimTT/idwhjiP/CB8WaLZts6SbdPBBCtPBIXYKQa1E5Vt/0V5H2FuPCegFH2
	UhzMsHQQ+cF4+CId7GVhLj/JcJl5dkpFGcu5aV57Ix+wwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tutxny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 13:20:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so542493485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782652827; x=1783257627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIB7VmI+QpvTPuJKyvcnI2uqX/bF7EqWmyx4TGRyCNY=;
        b=V8wdXzdL6ldpcg4Ht5G9zaWko73RnSwIIzzW4d+VLeWzzuxSpPHzciOmYYcPP87YLH
         E+eXIuq4KMQy1KlTx8XUcVcVo0LSvqCNVpSdsw48wrnMVP4+yYO4QxW0DIRP3VAVxPCU
         PmtZs1wn92//7x0UjyjJG6f1ODTuADmGwoOxlVUgSUnpujCD0dLLGdnROcLGHQj6icwA
         o9yIosvuXJ+k9jXBX2lrWkS1nGW1i3dbLd0EQfMByrE+osWNgzBg6yP5aZibU9yhgOSf
         oujK4AUOebB2oe5+gH/82WvxYTqOrvhIk44zHmVqPiwAm7etkcqEBHNtLSsDqnGLMkBF
         CdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782652827; x=1783257627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIB7VmI+QpvTPuJKyvcnI2uqX/bF7EqWmyx4TGRyCNY=;
        b=Fn48xuv+g2lIHx/ZcA1wL0AgW+WLHuijIWhTHdtVbXHFTJ9q9bcCph5lt1DzSTl+rd
         dl41q7qgTzdAnKiMrCoVSbCuP1oZh+HrPbJlHG8c88fGmkB/5kUWuIPUWqeim4USyEcI
         TZPWyK4g8X186A/Z02D2VI1t6A81EUhKL+2iMZPM7Fxm2QxZmGysTPxvBH1PmEDVNofn
         aCB8P1UQ9rusA4raip8QteSDJhe4tvBiSDdHcarJMkIsfxudjYvjSXEvhbDMXCcxh7T3
         8caANTYLCytxtS4zyjZoINERqDb32t9Q232DauvyxFNwUt6JDft+QYf4KPvvIUzOV/UM
         XeCw==
X-Forwarded-Encrypted: i=1; AFNElJ//0MHNnr+ZUTedC7r1LgDn3f4hoFe09+LiItUCD8MmNnm/dWhu5MplHtzK2i8mGxGY98kAXcmUs9Ls3Kt1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2L/ihTDOBZy2dn9T6E7cOJpf/tMnoOAHi4euqQ/9Ym+0TXsY+
	HXogb3/EfHAe+hhZXFhXm7tvTQKcsyFXoOU213UFfK33Js7fbDKR2qIGRB1qVQ3cCFwRJ82zfgV
	IPFYFaICer4atc+7AuYMio0SYtL65quDKvapXx58m3yaOtkr0N30GOZgJflj6gcBmfgDRpp4ryn
	hT
X-Gm-Gg: AfdE7cmHlnZoZcYIM9WF1uZU8flmqj0sUSIjIxaheQZfUO8owjRJ7EGKCUcwD9csdpz
	8cw5MtYCKEvUK+MB+LLovJiaX6xHWM5O34oo/Vc5hjJdRTI5T5BW6I+XCdgD0faaA8/nvGyBdaC
	FlSUyuDhUIHzoZO/AR/wsWaAU6r2HwEUe/bqniX+Cu7krvfbnkINTKKFHIAp+gNFDyCOpCneiYi
	ZsiKYIy/rwrRjokNI6LfcHOniNssdoyGD7JP/8lHp91yQcuHEytIPCcXS9IrEsQlakWwkF/3rvc
	uBtDanFZD/908fJtryV0yJ2NoX7wWM4LtyhI3lsL65Ubr1gIMlx1ETpgaakD2J7Pdey7pYTUsyk
	AR0pQ2O8ca4Luyei9XcYPCysQa4MCd9p2LIdQ1nbtatPGszw3sO+GA5hlI8P7HffBHcW8b0qP0a
	DZAojYDmwjYFKUoUODJBOQGODO
X-Received: by 2002:a05:620a:29ca:b0:910:21d2:242d with SMTP id af79cd13be357-9293d4b2e4dmr1992723885a.57.1782652826767;
        Sun, 28 Jun 2026 06:20:26 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:910:21d2:242d with SMTP id af79cd13be357-9293d4b2e4dmr1992721185a.57.1782652826362;
        Sun, 28 Jun 2026 06:20:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6955108dsm5020178e87.23.2026.06.28.06.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:20:24 -0700 (PDT)
Date: Sun, 28 Jun 2026 16:20:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <obf2iw3wq6xuvftkkwf4wa47i4y7q2apoaa5a5vvprrcqphawo@gr2snc33hnph>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
 <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
 <akCIGtSZO-FW1EEo@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCIGtSZO-FW1EEo@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfXzunJlq0pXtGH
 IT5uoWT3xEm/JLHJj2GYXu6val3pF1uDmhRlzdbeRZfMvlAYgo5dJ3x6LZk9pRmSfk1maO8QcRv
 Mv+2KpoePBCMZ5on6OI7lfTjECTMC4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNyBTYWx0ZWRfX29uBieCmnpjJ
 Dqcn5nRccFUf1b47PRlQjw4ZH922vkXX4Sr4S3j030PMAOahD3DC3QatjB9CwpMLk/eaWzmgx6N
 2l8Chiq+CGLVeaSH2mNsEBsbo/X5MkCxDCBoO94zyUG4LgqrTjEJu5gETbfnGKsZLKCjeBpMn26
 HRlPPrahSmfgYq//H4sxmDhhmMn0iMf/84XmaE3vUWi1yG8hlX9dt0eCiDDMks2swgiEXI6zyda
 resQTIzJNE4F8XvayigysgoynxqcThv6aEt85+d03HajYelv7S3Fvja1F21mMyD0mv8UyRlTb2x
 d4onvXXtvqE2xNyhOkqmsmLevlN1xWrRQHdKzzNWUugj1TLVbZvt6KgdQf2z9IQWTxIyxmJfk9p
 jUF9+2lP3iu8phe62kNfSL21VC77zvfh7Ck7eaEWsj+BfAjVObDDPhMhFodRSA3nT6ztQr8KTJt
 PbDYkPG/oSps/ZP3mVQ==
X-Proofpoint-GUID: nZ2C4OpwDOTS7HBwKLiO9d6_U_hL9w85
X-Proofpoint-ORIG-GUID: nZ2C4OpwDOTS7HBwKLiO9d6_U_hL9w85
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a411f9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZhBxFOkNiJ_u52B85-4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A22C6D3DF1

On Sat, Jun 27, 2026 at 09:41:38PM -0500, Bjorn Andersson wrote:
> On Tue, Jun 23, 2026 at 09:06:51AM +0200, Konrad Dybcio wrote:
> > On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > 
> > > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > > the other typical Glymur platform capabilities.
> > > 
> > > The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> > > OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > > +&tlmm {
> > > +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> > > +			       <10 2>, /* OOB UART */
> > > +			       <44 4>, /* TPM */
> > > +			       <90 2>; /* TPM */
> > 
> > Is there no EC reset pin? I wouldn't want others to have to open up
> > a laptop after trying to find out what it does..

:-)

> > 
> 
> These are the ones needed to allow the thing to boot, I don't know what
> the EC reset pin does, but I guess we can add some more for convenience.
> 
> [..]
> > > +&uart21 {
> > > +	status = "disabled";
> > 
> > hm?
> > 
> 
> The debug-uart is left enabled in glymur.dtsi. Perhaps we should change
> that instead?

I think that would match other platforms. But, is it actually not wired
up? No debug connector or TPs?

-- 
With best wishes
Dmitry

