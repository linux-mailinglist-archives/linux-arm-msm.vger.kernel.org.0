Return-Path: <linux-arm-msm+bounces-117370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HwhkNH4tTWrQwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:46:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8F71DFE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:46:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DDhLK/AG";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HBOeDPF4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A5B03082EA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9242C43634B;
	Tue,  7 Jul 2026 16:42:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94F3EB10D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:42:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442573; cv=none; b=Co36REgWso89g4b4uzp9kgbzLbqb5D9u2MR+htIJHtCrUSYBmlC2lqr241/m+jXNwv5zvjA2PhOGRGrtBMT7GFW2N1ea753ffbMAv9ACOyhTgbT7jCIFkXIwrIVJuSMaTkLv2p2wc6OF1zxS47qoocG8EHi9OOhvIGtdyoNXfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442573; c=relaxed/simple;
	bh=zmmmXJpEFQfT9LL96zAN1n79uNV+fe4mehteFTXk5XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twtD2SkXhnCFHYa0ydiXBWsnBXAuwAlxTCTBXV8ra2eCY+XTWZMnWrlGUToiE4Pb88n+Km96afb1HOiLwUj1XBLcTB2+Wk+XOSWtVZ9rIJ7/HN6hVlsj/ZZigoAcgBmDtCCpkX89+kPZhsqf0oPzfyZ0s8rnaWLLtqzndvdZ0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDhLK/AG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBOeDPF4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTGhX029968
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Qe7pk8a29mkB/ToP9tmorjc
	IpiQB2oLiDgFYvMoFYg=; b=DDhLK/AGst7Ue6QNhxSF4MvK7XU1G78tumVNHwOM
	EzXTz4sonhbzFrqn5CjS3GAIUkzpNJJyMXBGrL4IsDwFDH+kwUlOX8zKiOBMNgCr
	J6MG4SpbtUn2P9zl6C5kY3EDE1qJCIgngchwnwf5pZqSSEIEtJYQpqnbTmd2JJ5C
	9Ye4FoXgEJboC7/QDGVpEtsGsDGNe7e0VKrq+Jd+8VewbNB/X1ECYi30VF0IMLle
	Tiq6y2Js3aZNW4aDloTDxgXrIHi2IEEaEib8K0K8adIoDLtZ4W1ZqOpGRNIX84BQ
	XLb2tu3L608A31Cxy4VNuUC13LHhJczzT9nnxN4B09zhbQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7bhgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:42:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7390c789e4cso3621701137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442570; x=1784047370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=HBOeDPF4+BQz6LUrswgnRVZxKRSRYW2vOEHroYOApNBWC4VI7hDztq1ltjzObE/qpw
         LITojsCgWHUj9M5qzvI8/vVi9ewnDqk/nsoobbxlzgMJ34ZiG1E/upd1Nn5zToiAuZAp
         FcpNbnpEln8CADlV/TQEPXglJURkN0woIr/cE5+UubHvS/os6JA3tvGiExE7/Wy4SHzS
         kj2MLf00RxACJq7sSCbwWid52m/nHO4qGAdF02DvSjrlAWcOSDmLivnSILVBvRjscMWT
         xqYj3Efd1jENtp/dHTSRav/upNHqY6qjVKadU8J64myNzn5/qHtejZwi0s9Xyx8NcOoa
         EFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442570; x=1784047370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=RqkCVm7ct0nQynrzPvoq2f2wUUvmkl9t3etKgl0fK3xUK300jmwHfQWsahV0Paaq4Z
         Pt76uM2qwYH4nOgvLx74Ur3i8t3wGf0Z7VGitv26cCUUugxNRwSfdk39XVak686HqRTZ
         ryzVKJ8DCPMzBSIjrI/mZa445noEGj3SSQuXDHw++Ulzqb5pc4pW+c+IoywiRFvaqV+X
         4qZ0N4yENeG7Vu8H4mR+QkHSvw5uL2/2aEOG3QzTB8/cxr6wNwlCZi76w7sUtTtXDRCn
         RFW/eCFO1S49CyKB+NSgQ0bmxCB6jXKfFAyKZRyHNDSDS7nnGVDJEPYFFb0Wyi/8q7HC
         id6A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3bCQtXaKQ1wQflr/jTcNPG39Dljao9/bJAQRY4buBAve2Dovjbqh6oHX30muVGAeEYtsP63yAYVEapWgj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9S4WdBuhKYavmdE5jlzm3g1ued8iQnLQ5R+wY39l2XH8tr4Kg
	T1vrThic6R9ESucGNdtTxz/8/kfjUaz280PgtBjLRODXV1RPYTLaA8mUMzUXthCfD3OYtwX05Zl
	S8XrD6/E1W7d9+Y5lylBOqkikzt1j+VYKwzupnNlEZQCEMOSf0D6SWWBO3JyT8vtQ09JO
X-Gm-Gg: AfdE7cnqtsdT6+oevhJk7zAZLVv4ViWspeUkt7KlvyPp0dYF4GvmFp6g01vsO5ZE+bE
	cYWp70HO6UuctMkemxeu+jfK9v3J928HbTw3HFD+hTNQV9CDKZyZ44hWEJpRiAFmOJG7hOZh92o
	RkMDdeQubRnoSsoriCv3jTEU+ncIAQvnxKjmP8YZ8PUKmvlBLxPILGC9gIge92w+PNPQh5edePc
	xV/egeaM61EGwlBmNeKdQnTiRASNlDh/dgtuf7Tp0td3AJw7xoiasR3DD8uMgn8zE9R5GZU6wsE
	KoF1mF/uQezDdYuuNfa6Dgkv28O5ZdQmpN49rnWjGU+J5Xr3MVQo0gZHf1aOZ+PlY7p6m/BK0Wa
	46JYPzWZem5TIAwc6UI5ttfcclkPIz4TIOqKU58UNh06SGlaBYzaDQC+OIZ8RHurCIejS4TBlEl
	92MFnqkeHkBL4kE2qrK2yKK3Ky
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674873137.29.1783442570388;
        Tue, 07 Jul 2026 09:42:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674805137.29.1783442568650;
        Tue, 07 Jul 2026 09:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm391001fa.40.2026.07.07.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:42:46 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:42:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mtGDV7ikvuJGXbEULbBKnMxBNV3LAdAS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX0mY9JdQkC1Th
 MfCNRu2riFt/auJ6ux1FsHGeO4w4po7ra2IwTKORkETmYNRiuzzdoTC3Lf96e9jOHRIIuhx1SI7
 DTmmyPj8Zi7yBFLyy27JEG5PQPOi6PrtsjdT4ZcUIy1+YhVyAUPhvo/rJoRYDPfoXj+b8QBWcZt
 yuQpJGBhw0al3/eDhh53ATIw/82Bxg+XSJdkIz89TKKY1lt/OGNVBUGUcriBc1+s3VKePds386y
 wBml1Oob2S66cJRIQi6mfD/fB1KVLH8puCoOf1pgU1OOhK6LOCjkRHR0DQeCPr4ViSwH3KHjSr+
 boKL0PEj2RVlulun0TdzJUfIn+m3dq9wprsmhqvajT2fq1xTF+0j0x9oYbSapAvY2X087qujAbO
 wztIyWTMX+kUA5TWnMz9FavvrVTtzA5mP8LN6jTAEDs3iFiw0H3fDp2pUjqKwUO0LzsLlfvzAKn
 wd6t+oHFUmxt1iyPLJg==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d2c8b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=51R1jNVWGJiQLheemG0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX4zod8PTk4kki
 MajnFnXft+XyI5SQGKVuBhCsZ4FxC21hulvqrxGg6Joeo+UB1uRkALgwB0x0zwnemayXes5RnBk
 bWmNM9neoCtKIfLPTRjGfRxHs77TPHo=
X-Proofpoint-GUID: mtGDV7ikvuJGXbEULbBKnMxBNV3LAdAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117370-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,57u2pofxewuh:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CF8F71DFE8

On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > 
> > Why is it limited only to those SoCs? Is it also applicable to other
> > Qualcomm SoCs?
> > 
> 
> I was hoping to keep this series focused on the core infrastructure
> changes: the bindings, base ICC bandwidth-voting support, and DT
> interconnect properties for the platforms currently supported on
> Qualcomm Linux and have been validated so far.
> 
> The additional targets have not been tested yet, so I'd prefer
> to add their support in a separate follow-up series once validation
> is complete, rather than growing this series further. WDYT?

Then it should be a part of the commit message. All SoCs since SDM12345
need to vote on the interconnect (and then, in the cover letter mention
that you convert only a few of the SoCs). We possibly can help with
testing on other platforms.

> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 

-- 
With best wishes
Dmitry

