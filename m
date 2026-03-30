Return-Path: <linux-arm-msm+bounces-100888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OAEBgjIymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:59:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D993600D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F038B3015B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1373E022B;
	Mon, 30 Mar 2026 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZO8P1B1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en6EP9Ky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CE83DEAC9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897156; cv=none; b=izQyy7Z/6PI/aK+69Ii9j1w2Bnx1uk0/qY1CtduxT2gR0a1Ubih1no5oi0GdQCWQzARDOj2S/z4z4HO+TpAmOVtIvGp6duHRf7mKvDubV30X4PbApj4gnMusgMtESjYzovx0LZnbUyGi1uSm+Q3PQVrJDXhr76Psr6GwRieQlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897156; c=relaxed/simple;
	bh=rurzVOhNWsOISWAblSnsepOxzaSppT28rKrxnlWZzOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp3ZOZuY8+qJF/8et3SnSPe1F+HRYyEvmXUp28/oovwI6tJB7v+gIaoSY1VpQ/Mo5Mas1R/0/MHOp0+m+4aOAzqiovAmOwIDBLEZAWcmvssCLB8MK5lsYeovPcN1BpklozaSvhjnRtJNELEOO+PkHKA/SWavOUW+nDW080DNjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZO8P1B1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en6EP9Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UE4Y8I2458298
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5L+MSC4tlWhH18ltQL/d8CZo
	1W5RELdIZnlDlCgEdXg=; b=ZO8P1B1WQtykLm9L7Tgb1LwHKaGrrpWLsZdXSZNL
	z8OvUHBdsHKT38RjSzxB1BmhbcVrhzv2/TfHa5Ea6E0cd2kRX79Co1ZURBUvt6yd
	Q9oYAuIwvIX1Xw0+G4rnXrXHmw8ZaSxqp881689B8fNx2BCTwT2c8W5vZ4+Jwqav
	rjX2/nARk9Rud5L/nsuRcyJa2w8ppTm3ZJLnd9yvy5/UVgyDdvHnCqUdDzVecm0F
	7JzcScrGC1kr75xyV3AMoSC9vZ1DdGNHkSJrSvNbk5lmk5wBtKTgGvWlNjkKvAiU
	Al0cjo4gCmzPIl/ojhoA8NL/iVDU0Dac60HIA5czkwFlvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmtm89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:59:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so247868811cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897153; x=1775501953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5L+MSC4tlWhH18ltQL/d8CZo1W5RELdIZnlDlCgEdXg=;
        b=en6EP9Ky5PzPVO/PLZHTGsSkriDO9wEXre4h0rlHRUQb9V1JOxTmtZxzlpoIOyDhwN
         buXnYsfncyveI7UWGpn7Sy1rPejN4Ujn5HToSE4wvOozxKU+pusk9Q3mYlcjUuuSceR3
         c0nyFNMZoFUsgHsXybTIicfArqzskcuXtREKGpCOpIZZyQ501WUCVi4zv9XFUS5kk6YW
         TuX592qAomiRPk5K1Hu8ZzJeq2hUuom/I7lTZ9K94k7iAKGQ4l5em7YeRZnwKQbJK4kU
         n5zfWTEVL+WF7elOlqg4/kS/+YrQG75xDUzyCd77Yz245veuBAiw70ibhK7yV6jdFQrh
         40mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897153; x=1775501953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L+MSC4tlWhH18ltQL/d8CZo1W5RELdIZnlDlCgEdXg=;
        b=T4pRYmFijl6VWEdKbrD8PVZUHxWV0kACKOn017O9eTxe7+nuifYOpSJrwpUcJ1mwhT
         dXW8I/wRCJRhAKoDT3IDYarOODg1plbMrj+uJ//NuQpxEM0zrVISvE0FU+iKYf3XcJTS
         AJC6XEEMJGSXgmd9GeEtC+/17W53G9hsE6B3EbDP4ZtOzJvn7QGJARcuJTVCEiMlQ82z
         IQEO2ohU8ABl747Vk/FrktgxCpkP+1EujSl6UYRorvGhWOYVtIeM6Tv9J4eqa8J42rml
         eeS6JNXSPFJcKx2ZAS8Wg15nQ8orhf/6Y5H1f2zHJBfC/V5eauXxLm2rhuFvr0eYnKpA
         R5dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTsmZvaXIpQUIVbqpKsRqQ1mne/VHFyUPR3/S0VlZ04JWx1sSHSWBLZa7i/MrkohyK5XxBW9Oy+RCZil9P@vger.kernel.org
X-Gm-Message-State: AOJu0YyUssEqhUhJbU4sppkvWg6Y5q72vXKv9m7U4/eLDdTO0oAtCjIC
	yCyMwSJZgoahRsGU/EShON7osrTABQvVLWAikRG6PxGdMwuTtNFCOo4kmfrI97B0XKCqFwgVte1
	TyPC3ErjEjfMSCSEdwM6OIBosOaKp0wbZNxVAVamTODHI7F7nzHhYzvnQAA1sSnsOJxwM
X-Gm-Gg: ATEYQzxOLZzemYY7y1Pw9/7nJjYLDmpMI98a7ZFHmPXm9NDdX14y4GwjcipyaKstNPY
	CsY708c05cn93IoVHAta5Or4C91wsVyTI+UWvxKZlZKLuxPeSGUXt1stc9bvzeGyoPSxBgFmxpj
	kHKzVTHnRkz7oufUEtNqBRv4Uvmrd6HyJcNZAVuJxdnsJMseFDNDPB98ngf0eEcJZBR0Hi27/dr
	1Wr1agWdJbWn/t9H0bkTr8EfFE2aIyA5dApdbDQM1KT2R2NqUKs52mmAS7z1cYEuVkwNE5h3F/M
	7w6mPiCue2ZFOD5HVOqpkoMDbHzuCRlwHk4pwco1weO78f1t2GA2X9NgnzjpvgYmSSv65VvV6vT
	zb+5PRlLCGl8P03fk+5MdFgrYYLEbfHW6lAAYxhL0wpwu2qdXLd30NOAnhk/jAOBnWMkkP7cfzz
	bF5c7XDVOGOGd5Kz4BdwbyTGJ33F0ev4kvoqU=
X-Received: by 2002:ac8:5cc6:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50ba37d2555mr204548581cf.13.1774897153409;
        Mon, 30 Mar 2026 11:59:13 -0700 (PDT)
X-Received: by 2002:ac8:5cc6:0:b0:4ee:1b0e:861a with SMTP id d75a77b69052e-50ba37d2555mr204548171cf.13.1774897152925;
        Mon, 30 Mar 2026 11:59:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1444bc8sm1803053e87.53.2026.03.30.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:59:11 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:59:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <eid56vtzvz5bvbmwcscn7a5zzc2cebivvjk77ofbonppu65pfw@45vfv25lx6v2>
References: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
 <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX6CXixvmLFRNv
 NvgpEvYdIsclDe4gDbZCwJTKcLButVwA9aXvZdlbuAWA/6zvK2kwyk/sJm8Z3VntiZfz2UVyG9p
 b9G361pLL9hxv5NUazV0bHpGKp0Iwh+pQhRLagEJoXpapAuZZwdW/CAR06RnXJjsQL0kdx7ivqR
 sfh+C3R4OV6MP35tLDpZyO7vxi+C1EgkKTdc59+EUzx93D1XOMMmr08tAFx2VHLINK9rwllZTXC
 ibj0cOEafA8NWtKRnr7EPxLMzE1Bi2zR/WhUejwG+QUjC89cqTK29rn/04QyHh6JstqxsaVfVen
 pwiGGrEiVsqdXMC3kemZj0Qx/rmX3UOgnD37dowDEzp3513X1VgixNxHI+raw1A/rc1htF9002u
 /cJ3b0btd630a0RbNIJi5/p4AHOUeJYUJws7FQ6KQYwch3/xbeG2XSAHX81B3DNI+ZMgWVwyYOn
 htItN2qBKugr024SHDQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cac802 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TWhWyw5ojoweXFhmMj8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xMpuEz1VpX3l8oRACNcyC3AzeodhBK5c
X-Proofpoint-ORIG-GUID: xMpuEz1VpX3l8oRACNcyC3AzeodhBK5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100888-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3D993600D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 03:32:55PM +0100, Bryan O'Donoghue wrote:
> On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
> > > That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.
> > CDM is a much lower-level API then what is expected from
> > a media-controller centric V4L2 driver. Basically the OPE
> > driver will export:
> 
> My concern is about wrappering one thing inside of another thing and then
> stuffing it again back into CDM and doing the same on the way out.
> 
> There are already 50 MMIO writes in the OPE ISR, I don't believe it is
> sustainable to keep adding MMIO into that.

That's why I asked about the ABI. If we have a format for OPE
programming, we can reuse it for CDM. If we don't, we have to open the
wormhole. That is unless we make OPE driver utilize CDM instead of
writing registers through MMIO (and instead of userspace directly
programming the CDM).

> 
> I'm aware of a project in qcom that did something with making the CDM format
> in libcamera and handed that off to kernel, recommend looking into that.
> 
> ---
> bod

-- 
With best wishes
Dmitry

