Return-Path: <linux-arm-msm+bounces-94968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PM9BECkpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:52:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D41DB336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71AD330ADBB8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56821401490;
	Mon,  2 Mar 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCuV60ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ee6E0LSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60031E107
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462867; cv=none; b=ge6A6XWg5KgHBtdJR417wb9m7JoN2w2kfLMqk6Kl4ZC+PjVhdrf1rmcKAiu4Gu98gOMR78aGcntmKOQhYRvng1bZEydUtXbEiqKqNkOjIlwXrXTco32UQd08/ScYm1okZ0mz97Hp0usztFi1oDxAVqyH8//aq+8OYUPflpsqqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462867; c=relaxed/simple;
	bh=xHm2/0kzP70sgHDm6XFfNgWlFOH72I6Z5rHr8xNFdN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFOm+O2wa+jXnybi+6nx+PsXCgbuvOlliGHCx/ugsgsZquOj5W3MuRzo4sb9bnNHSEv555GPq7ZJjw/UKhOpUL7s888+z/G1XJPV9hGNeM4tw25cG8Ipy/G/YHFPdrta6+u+ahvvtuQIJqu4+jnfxWOvQwIP/AM/nWylhfU06Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCuV60ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ee6E0LSx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EumU3630829
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Pe1xBVoZyyByHW60VSekRJw9
	vQs9ypwcbZeVpM4yors=; b=QCuV60hakmRPKEXxuR/orIK/T8r/7QBsjZ6gW6uT
	VHbp8XPnpwhi55Bs0eC4JV6VbdFZ2Y7wwSfS8La8ZAk8Vf50z7XAGpPo9WT0worT
	CHbnhB6eZfEKL+WXap5jLwtPLeCaAcABlGe0qN84/sQbkzDy6824T6HBIv4RWxhm
	2n/rg0JcscUhsHvOA9Q7uol4VALdBNkd6ZKjQgmCq/rWWM1DsE90/LM0vjZOWa3d
	AO+HDqXJFZfsE8h4Ae0W2/j2Y1mI+I/vDGrmcCPsaiO2FxDWO+7PA/zWXXTTd2hU
	sqkCoBwGranqPaSUJYpJZqxV+yY2uStSmKZn1zjtH6JKmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhs1wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:47:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ff05c73so3314902485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462864; x=1773067664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe1xBVoZyyByHW60VSekRJw9vQs9ypwcbZeVpM4yors=;
        b=Ee6E0LSx/q1pqKCBxuKacmogOa+r2J6khd+XDCfgEkmOkoEA8EXi9v98uYPt3jn4eV
         5SWKnM/HZ/MIL1rB2YYQt3+trGOxnQGKwlp0+2sukEy+fP4uKIvVXCXPFhK2VQ09AVVi
         aLI12fooUQ6im2EonR5RB2yEcOD/6F7TN2dB0HLGlK0qE4sfv19cD+iazEzXmqM3w/o6
         wQJaUQulsLsceiiGykkmNG4WLSFTkrWGZJmnQeMO0EzdyCO+8GLD1nE8mXXX2cqTBXB+
         lUtGi92q+GFrLFAovZ7KuYnxijYJIB4/4OaOFthXRjsSi28YK/7J7uVHCEYHUy+2oR4B
         JGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462864; x=1773067664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pe1xBVoZyyByHW60VSekRJw9vQs9ypwcbZeVpM4yors=;
        b=RLG+lePKCCgzn2g57sdotA+zsC+2cHCt8ciNq7Y6x8lsmFDSIa6Op0NFOiBrDKxnBt
         G+XYUMmRNexFm5j5gc2scepTbvmKDrqDq9FuiMIs1clwU9ztpxq7vySsVZXpnLVhH7RQ
         IifLogqmY5SpZFdLca/JDuUQuIcFvccUVIJH4sPTEErPMQSThKK+VUQ463O7JGijyXxJ
         x7cm5tiuCeNOqpvMd+sBNC0mcZ4Q65PaHOokR1rTxBaFRctwibhxUgUfy5cLQ9axsDkS
         3Sfusw3qJJto8tWMdF2ysONctQAPgsD0Pb4jJLoE09CVmfoLZXwIkyDWwHqv0iugJeCB
         6swg==
X-Forwarded-Encrypted: i=1; AJvYcCXO/HBjKpQEvsXE2XwyC/PsUyxp6w+QUBr7xWVTHvNiBnjvYcfImwsBryabi3aIVn/ogiLiAE4QHxAZFJhN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/XXxb2X8ySUh8EmaGrWKNX1JW0KIs4Xp3xGahO3/p6xaMvAi1
	Zbk3Ib0JsneE6zX1GMzOI+K9UxM4Ep3Yisl62XuopxxTol9BYnIv2iBJWUsryXv80X8NhGp7CsX
	Q1QKEehBvfx0K+OWr+CHUcY4+VN3ZROd8zyMfKIyIs7ZzrgA6yGpPGEjTqHcOlUM5q4D+fFfIA+
	h7
X-Gm-Gg: ATEYQzyVqxszgJJ3hOIeFWy7POcVdzNo+nsbyxyM62JD5C4kWr4o5ut02zmtEDOaqE4
	aTsIrH7rNAei/wTmhO9WfxecP/mFribXRsvKHkCl1EdKoJRmkMbdEvPwQDJEUKzKL7oz4FZQ6g4
	ynd8We+dNK5SNBkzn2ymzo9lbjs3nVdFUFe7aeFiIo17lS4ySbE1KbY9dQ1Zy08encCl4nuAaAr
	H+DpsZrzNfqoK29iCF7Zi8EK+mQM7bGdxySNo27VukPBDB1vvEHBNfNVtN8PuvJGwXCBUvtkDrL
	PEWvpfSXmTNTk7eF/VxXU7uWp9c/aLd7QodFm0LwD8aOY0TexgEMFr4cJWoDnuLOTwmZL33HF6C
	3skW4g7rGg7YKlUPaOJJbeoCSIqjN04mAexhKWqd5XdAHJPJuhQv6l6heZ6T/+k7GuLtuzXv1OP
	1SLuzPhbV0b1A8P1pU3A0AFFZWr1t7Prin5Wc=
X-Received: by 2002:a05:620a:4801:b0:8cb:3e7c:a4a4 with SMTP id af79cd13be357-8cbc8ef6b97mr1588388785a.46.1772462864090;
        Mon, 02 Mar 2026 06:47:44 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:8cb:3e7c:a4a4 with SMTP id af79cd13be357-8cbc8ef6b97mr1588386085a.46.1772462863608;
        Mon, 02 Mar 2026 06:47:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a122cb7e0asm4421e87.14.2026.03.02.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:47:42 -0800 (PST)
Date: Mon, 2 Mar 2026 16:47:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage
 support
Message-ID: <3insznroqfkpgdspe4wj3nrxgp4igeoyawr5udscpfi66m4kmc@brssmf6olu6g>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <ltuoonopd2fmxhxnfmezflwqicyagha3jchxl3inputbtnpvhm@gsgnsccr62pk>
 <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWgo/FYDhCVvaX/@hu-mchunara-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: djrfPh0TZmfe3YRkOR4bxsMZdZbq-Vzz
X-Proofpoint-GUID: djrfPh0TZmfe3YRkOR4bxsMZdZbq-Vzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfX4pzYk+1i0NnB
 TbiCIElAbQzFDxV1ZPSzpTgzSSj913td3pfiiENwg2Jvn1ViGzE0I1SgIcvTXsB5PXNFub6kihn
 Rk+vNchCSLiHfVyodTrt4K3I01Im5tpPat7jqyyBkM5dUmPWGIOoOCAEOHiZ3ni2l1UGr1I6lKm
 031mL1FaTD7GVAOUnyM+t6jaaw8VRf7NZmeJKJR/id0C+JPICK4E2FUDFoIfMLt1w1XlZx9vcQR
 fhxaOEbOlE6giziYp7GqbW8/bBeo1tRyn7wa7LH7jaV4OUaU/rs+indB8eYgiaiUvjicSOiwG2b
 eY+5hkXyGDGAxXtb7EPARiLLHRETLpi1+KvwLIpQoR2YxX/pclsqSubdwQUGvLyJPZqYRHjwkuJ
 Wv0gt3nmXHeilpJGnvmitVcX6+4qzix08jGHRL/x47hBstbX/ICUd14+8cG/APKMadvmmewLXcp
 p65xDo5H2VigyflMNhw==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5a311 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=fOYwyGtB0dFlG2PNkNwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020124
X-Rspamd-Queue-Id: 648D41DB336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94968-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:07:23PM +0530, Monish Chunara wrote:
> On Fri, Feb 27, 2026 at 10:05:32PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Feb 27, 2026 at 04:20:52PM +0530, Monish Chunara wrote:
> > > This series enables SDHCI storage support for both SD Card and eMMC on the
> > > Qualcomm Monaco EVK platform.
> > > 
> > > The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
> > > cases. Previously, the common SoC dtsi unconditionally enabled the
> > > 'supports-cqe' property. This causes regression for SD cards, resulting
> > > in timeouts and initialization failures during the probe sequence, as
> > > the driver attempts to enable Command Queueing (CQE) logic incompatible
> > > with the SD protocol.
> > > 
> > > To resolve this and enable full storage support, this series:
> > > 
> > > 1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
> > >    now only enabled in the specific eMMC configuration where it is
> > >    supported.
> > > 2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
> > > 3. Adds a device tree overlay to enable eMMC support. This configuration
> > >    also explicitly disables the UFS controller to prevent power leakage,
> > >    as the VCC regulator is shared between the UFS and eMMC rails on this
> > >    platform.
> > > 
> > > Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.
> > > 
> > > Monish Chunara (3):
> > >   arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> > >   arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> > >   arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
> > 
> > You are adding two overlays. But what does it mean? Does EVK has no uSD
> > / eMMC at all, having both attachable via some kind of mezzanine? Is one
> > of them attachable? Or are both cases present onboard with the correct
> > one being selected by the DIP switch?
> > 
> 
> The monaco EVK has both storage devices present onboard and the desired one is
> selected via a DIP switch. The overlay selection logic would be based on a
> fitImage metadata entry that gets populated at UEFI level by determining the
> currently selected storage device (eMMC/SD) on the device.
> 
> Hence, this approach becomes robust to enable the user for using either of the
> two mediums, without any additional requirement of reflashing any images.

You are answering a different question :-)

Let me formulate my question as a review comment:
- identify the default DIP switch position
- squash corresponding dtso into the dts
- leave only the default dts and non-default dtso to be applied by UEFI
  if necessary.

-- 
With best wishes
Dmitry

