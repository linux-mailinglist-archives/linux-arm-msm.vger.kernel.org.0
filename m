Return-Path: <linux-arm-msm+bounces-115025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mX+PBjliQmq45wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F56D9F12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KRZBID8q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OWYeWSE6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 176BA3027332
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9A3B960B;
	Mon, 29 Jun 2026 12:14:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FE3BB4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:14:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735285; cv=none; b=fUyqV+dbwLVx36kaMoH9cuHvAOxVXmkrVIElfYgyg6sH40z4cc8mxiZqyuj/w9g1j39omnA9JT7ZtK5YmtXSNTiFrjp3rlYyd+mSuQW3ktEeBvKbmv4RjiuNx9me8HNDsPHojaHV3uCMXrOP24hPHd4TQmWhyYj8+3dAzkogrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735285; c=relaxed/simple;
	bh=ZfBQj73tTeph5ZD7ZMKd4CZaoKr61w4AR/5ear7QtCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flx3QUnpkOl2mlEL+e27fji7jjMpp/BLKnwA1SXYEkhdIYLgJ8kLs/KBCqnqx8CuQuq4VezdkHKFJqYzjky2O7YxtGbrqYa+o8ebwSrqcIEmf72IVAtf4G9sr/O/W7bltyPiP3SV4xoDSp5YiLKv8veMzBpwr09METg0lgInsa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRZBID8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWYeWSE6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKmi2656122
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=; b=KRZBID8q9ZxDLmoa
	VLqGHGfrwgE/9skHdghCXGW6YlWe8moc76aXfJZU0ufYxKV28YkAYRw0vf96/6sF
	3v3sz8+ZvmuMATO3wms+fdoY/Cz3jeMd5cTCU1dbkaeSw5T0SscTYoiCKjP2A5A3
	nMvgd6if+9Cw4NzJCq3ZkoqAkTHfeI/eQb8lQY6YVUbJAZWdI2sIMq45t1E8NlIa
	fNq0ruN10geppLNE2mVS8dMB9E2CI9i9YONbLYA+omH424P4fqDaHi0Odw47cm1h
	INaS1aURXvHufEmnnjLOzlF+YqOgUFz7gepysGqo3B1Km8dpAbT2nKRGhn8yg1Qi
	Fsi+iA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gqbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:14:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso5209270c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735281; x=1783340081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=;
        b=OWYeWSE6xE5PCEn1LkwG/XJ4CMnkJCL8bCnWwUsHqSSNHMBuB2DSvGjPpEVw2nyESe
         hzJWD5MPCUEa9yGY5pXaq2Ak2z+TlRvGYVZtML+E8VLTotmeaIN3AkA7s3QDtOklnCfq
         BBYTvwqJH+HWsmmLCT8sH8ErgnrTodii+7HnuEyLEaQabWyZjbkLi9DUGTzde8eptSiW
         T7v7c4UijQ3PrYYFjccdc0DOnmuzg4gwOIeO+nWKNfpTciGwx/MyoVLmjxHRy+bqXlsd
         8AK4FhuRkoxEuuJcZKz+VoaDLrZECswBPPFo4mMXK8+1mlfuEr1m3un/2knZru7DiGS7
         Q4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735281; x=1783340081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9w1/QIKFq54QUd/LJpbv83to7SgFgUUozDIlNCAR9E=;
        b=S8TfcrcR9oO9Ioz5QaB7722ynn1BsyzT4Nv8Hh6xzj+ymbHkxLaFURZ6uqSO/yOgby
         3P6szD9nOlvFLI5f2n9VvKW/qx+fcHzFqCpx+/XvTu6dnHBKgMZdJ29K5W1L4O3zMUuU
         a0L+5KgKKT6AAw53C2951yRUqTZa1CSRbJoE+5kVsg3Lpn9b72hwheBmrHbtpEnqlUgg
         /Tt2X1kFk379+TWUhn+odXC7JRevKiVJwncDwwMdMF+PYRMR9wiFI2Qv3vDbTponKOiZ
         xV4N/SZy59RjVnydVisuHOD1YgJ9fBWnIv3OUMD22+gPwi8kGzOvDRawUS25rhut9a5g
         ampQ==
X-Forwarded-Encrypted: i=1; AFNElJ+73C5MUKVZdZNetHwJAbTh1hTl98a3qzGMXG6oWEIIZdU/ysX0Ilzpz37devv1gzLBmcB8DsExRIdHjHek@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfgC/Sr6SwyCuQ9H7zhfZsSuM58D9V8PX+RFsKsbJ4PPBtsct
	zFEWXaTx2D3naG7CWlUMFTdaidtSl+RhoUSCHAEYGz9c925zW2qYcHEZS4Se/BaQPG6lbyTnrrA
	bNRcAeTNWJWuxL3FnIVIjBUxF43V8YxGInekZTnt781SsC5Hty2Oho8RDhbm1nTLv+WFd
X-Gm-Gg: AfdE7cntANmV2N2McZPIlwjDsr3BkWaQ8/6ycUoutN1xqzWqmqZKeIyFyMl/Gpvr1lR
	mW4zKcyi2un3ixzIntVyAXCGiefCAXEi8R/ZWC9/Lezqxuy8mBAmanCYYRJoNyc4BuT3EPeJ4Z3
	/YMyR5s7XjiAvkS4AFbT3Ho4HPulcgYwi2o65mZ4vjG3jieK7H/UNBKjbRjbRnLeJNMx6zBBroh
	2jiXSuwyJ0YTFN5CIydP79IieUbm5L/p/bjys0KsYoIP4NEEav8WnownF8B94Qmn0P7OJjTyKBE
	SjFFjWttQgfqgaViGzD0WNb+X5bgtY9WxODCh7EIY5NfShySEtsYSPxco8clDWefonmiTWKQQWK
	ZhsmZolSibFg7wnEDleGXDnfCiKyz0jxGeykzIQyDmB1cfsB4IHExMV05TQ==
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6303124c88.50.1782735281436;
        Mon, 29 Jun 2026 05:14:41 -0700 (PDT)
X-Received: by 2002:a05:7022:ef08:b0:139:ed59:4b8e with SMTP id a92af1059eb24-139ed594d8emr6303104c88.50.1782735280907;
        Mon, 29 Jun 2026 05:14:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm77382329c88.15.2026.06.29.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:14:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 05:14:38 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
Message-ID: <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX0bG1tePxSC3H
 bSpV5HHfp0UDtL04g5LqUV1/zI/0LtqoGS245ha56/BYmYJPUASK8AHjoHfWFN1F6tMTsjt3bnx
 RTIZrIaMER/FxHPTmH/y52zfuw5/gqbUoJCAh8w0jneq9k0zR3K97f3+UM2PtgcC+2p1BvKZWT3
 4fUF/v5nSOgMWN1ygSk8/M3uMroMhDuKmWQEMPOaKp2yQRxAGIMymwWirF82hZN8RgGAt7cWSW8
 SwcJTnfAquQL3mDz/INejDR1SH2J4o+cPlpSg7RvCkS1DE0ORMSZmcG5lpdQnEUvN2zVYrnOZCA
 P2WF1GklQ/LT00XObkvhYgJIyOjCxVK1WpgdhKi0n90hkVR5xBmU2LCQQqy0pIrugfyGXSyM4Gt
 Qh/HVQQ3uG7clLkAoOlwVrBQ9J4XQrd65ons9+c7C/ApUujxAe+IjrPvJMHCWNUNzBa00jgm0gr
 /hI/Yl4VlGlH7Q6Jk1g==
X-Proofpoint-GUID: ywGpTppwrP0fpcxcaGDOlOj7E2dc8vlf
X-Proofpoint-ORIG-GUID: ywGpTppwrP0fpcxcaGDOlOj7E2dc8vlf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX3XgY7X13DAgV
 iqONFYN8ueYyKORqHtGH1byHXoUZGqpw1IDS0f854CYkjF1rysDtjXSDOsD91pzuwTzVh3DTuqY
 Ugv1COCTzcQ14d1iyoaPqNTcaVtx/xk=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a4261b2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HbeE6YyLVr5UAZUz1j0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 739F56D9F12

On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
> On 6/23/26 3:05 PM, Qiang Yu wrote:
> > The PCIe QMP PHYs on Glymur require both refgen for stable reference
> > voltage and qref for stable reference clock. The refgen requires two power
> > supplies: vdda-refgen0p9 and vdda-refgen1p2.
> > 
> > can be extended in the future.
> > 
> > This series creates a Glymur-specific supply list including the refgen
> > supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Changes in v2:
> > - Add dts patch in this series.
> > - Reword commit msg of dtbinding patch.
> > - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> > 
> > ---
> 
> Is this necessary (for Glymur) now that we correlated some of the
> TCSR clocks with the right nodes?

This patch is necessary for glymur and mahua and other Qualcomm targets,
which can be verified from the REFGEN page and power grid page on ipcat.

Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
REFGEN0, the PHY driver votes the REFGEN0 LDOs.

For some PHY instances in power grid, you can only see one REFGEN, that
indicates the phy doesn't require QREF or the phy and the QREF it requires
share same REFGEN.
> 
> Perhaps this would be necessary for Mahua since its clocks don't
> require QREF (or we can lie about it and handle them there)?

For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
still need to vote in PHY driver.

- Qiang Yu

