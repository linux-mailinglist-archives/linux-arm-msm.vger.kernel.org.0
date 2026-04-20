Return-Path: <linux-arm-msm+bounces-103762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP9PFFMk5ml1sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3642B32A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA35E3019765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75593A0B1C;
	Mon, 20 Apr 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgvc8jY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXGXHmVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8485C39FCDB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690247; cv=none; b=kKXmjq91VCSppL67eF3z3GOOAPZhCAjWM1JWD3fiQZvWNfCKTEv2Tk8hE+h8W2hWy2/eDApVfuEyL6aPY0bZdHKY0lFtxHyfF2ERxbShGS1ydmV0F9qd4z+7FoLdL7ilChte+BkoJZY8Dgty3TGEh6QYrGxd2GI3QWdCrzfi7Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690247; c=relaxed/simple;
	bh=Trk8gkpor/osngq4XuZ8gGF8Cd6HFh5WDJQJRtkJqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiQK2n3v42eqgMvlE8Te/3fu8wQCDteT3VGN+C6iaDBix/WXjEDkJIkT8/t5r4QVUAu2F+cSia61eG3pr3z0LR9F0WTPD4bj7NzLrSZB/Xk2LV7Lzt1YSmVTwpopkLdQ+WwjTjpa9MgWvhoOpuEBsQkgTM5XcpwZEbWQXexwOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgvc8jY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXGXHmVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBaogZ3212342
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXXwL6cYP99FpAVgoSPW7u6Z
	iYv32gJO6YC73BOhMRQ=; b=Lgvc8jY0caf41kIOS224JG7yicEysIrGJkkTuC0/
	oTeZjVWAV2mh8YFKLIa1UYPe1y4Gwu7RqBuTuKb8c689o7dTgYBqOKBtGVphjqqw
	oSDGy3Aaer3mtbnM81l9YpvpYUQjiZdZcbJJi3XyAJ5zSBBVHsAWfXPkwzlc22bm
	qqB+akw6lDAJ3MhjP8zq0PiDrn7DQj4ueQPd9UzfMpjhfsrLO7I3aygtXqOw6/PH
	hSogHbU5YogLTOqgiDqOuHYiM26FLrAbOMc24hH2+CaHT5qoXJPm1d8hBaHJtlcc
	Jjrd97e+uiUz1RyaI1K69mYNXcJFH6jQ2yMhXNTVrCPmOA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfhgg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 13:04:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e5791871fso5758879a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776690244; x=1777295044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXXwL6cYP99FpAVgoSPW7u6ZiYv32gJO6YC73BOhMRQ=;
        b=TXGXHmVRDldIYefqL5cTvSsSYEOjjV8LhOYt7XtMs0RPpWiF9Vf0zLlYzOsv0hHK5N
         7KgDYDQuYo2Om4xZ+S3QgYj5cD/DVtWV+BNF92aI9ZaOJdHf5uXlx9Zbw3g1vcur4JSw
         zYGBdfQVOBCFuj6V8bFe9NXuw0Xfu/vhK8v4sPrMt0n/l4scqZjW6hB46OH62ck34tSw
         dED0tWBzzrz2xi7yNIXxMD/7XTYLKCSFwR9hFiM351E6Mx2lI7+r48HyVozHA1s6mb+R
         WYWa4usT+AJ108JJEJMo6WGrmOBnPKmiZIozzX97lCj78I/EYDee0cXko2ppNIYL1fgV
         B2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776690244; x=1777295044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXXwL6cYP99FpAVgoSPW7u6ZiYv32gJO6YC73BOhMRQ=;
        b=gdHFgq35NdiVSld/y/6XLJGguc8Gqm6xAbopaniiA89vlnZh6h/xdrpmuD833IWUtL
         pzGO8qYIkqgEyvVq8yXYkkQdDMlr0ditgMLcUva3oLnyT2p3SYzzyTp4S13I6nwgioEA
         gdAAPn0dom3OprOWCQHOTVUd1eongqHoskTiOVyU34NBj3MQjG1gu7tcmCMTVA/cwhOE
         5xeQlPZQR+76hjF5z6Y1imiofzKOl4392aZd+kOpiMIbHBNyD2po3Y6zfPEHoenBiiDF
         o2kLrM2KYMmBa9G7lsPtbgr54xtvEskBY6jBAqtnwslqZxeS0UZPpVyGbjUhRKVZX+ct
         09Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/vFB6rJhxxrbd8UnZE2y+uKqyZ0xjDGuiPuMEa8UyMzaD+0YqGoizmD6aQVRlUoKdtcJHs0KufdVdVJsIw@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0ANK0KwVue18ywE4icmj8EYWzI5I5yCwmf+ALDL5I01Qjea4
	pDTH/iJ487GFVotAmGWeYz9GoJkulraIRa57ZVoo6vgO5nxZdgd/Vhzz9cDuDnku5SJSupGb/m+
	hVDKfzv/2nq/fg8V/s3dzDiPYum+eA/ARyDiCD/Opc78o2e+XSxIZCuDc/KMuw+m4SFi/
X-Gm-Gg: AeBDieu3ajJYVOllyHtTB0957zIrhoVI/h1q4/NglWGtHE2NLllx0AtNAHqDU04IXF/
	kkVz9cwtCXRF4v2zrOK2a9/bb5s/YtcOk1CKSLpidPK43oGK8YSEisN0FUUW52unJfvOuApy2vO
	TE9vawh0vhPpWXdyQu3TW4bRtCvGcgrs+MxWTfs1eceLpTumDyn7rQV6icvzrA94Xjyz/VdsHXo
	rtgT7xLcqOBKKPjdWq6jajqUUt0fQG+frMtfPdsSFoFSoArs9mKsCJIvKIIC53nYfCcGOnP8keM
	Y6ugVWjrz99fJnaoA8AwxlVnGbzdqkBWzyzQNN789gZjVSfVLiP7jEf18mp5oA4oxfguZ7KbpTR
	V7iqg5akfQAZgDvhAuRdjCUu+Dtw2ZAx3LfqllPz98I5SgCs=
X-Received: by 2002:a17:90b:3f84:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36140468c28mr13356790a91.17.1776690244033;
        Mon, 20 Apr 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3f84:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36140468c28mr13356738a91.17.1776690243409;
        Mon, 20 Apr 2026 06:04:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm32973763f8f.6.2026.04.20.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:04:01 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:03:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <kzyttwrt67eqjdhqsibhtr2ue3enciusfjnqxgxr235z4z5yth@j3kkukfjn6fr>
References: <adyfWzVHsg3qo9cH@prism>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adyfWzVHsg3qo9cH@prism>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNiBTYWx0ZWRfXwoy5GYoNIQFo
 gxZi6ozryfAbYKoL1DUV0fJFl4UvC6TPVac5yzletpH17kiCA445NjTycCSaKLPYgOF8shCN3Kg
 AN5YeZ20NHs57XyvlkZXdgsaptD0Chd4Wj7K1DOQWB8++IgAYS7IoS2ps4ADDyFRY0PYBpEcfZq
 viEqI+JlGlievqxAJgBksrd4HuKL5Ub1g6Y5o108p+rzxYQLxLAwe+BTa5SjnZt5WwbflBWZ8Na
 MliC2d2CnMFVEVlyHr/N0Mk+KdG/AO9GMnnLFo5hnbrddTUIa2xZFoHUNWdiu/tUvSq8q3RPQUW
 tzY8LKVBhY8FyCSCuPsxv3wDvrq1jaHh6D585lUbCcohhLfp0Op90SaMz3/v4DYMhtxBXljAZkn
 2xdvqCXHeRdAWLgLDZRlwdOrOCWfL8zGikDjCPn2rWyuvNfocTJb6wJ9AY8DxTyOSuLswR0l8UR
 v4MB/quMvqINepifMXQ==
X-Proofpoint-ORIG-GUID: gPvYiJuViB1O3U9sL4a8ghuPFdlGMYke
X-Proofpoint-GUID: gPvYiJuViB1O3U9sL4a8ghuPFdlGMYke
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e62445 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i2al5Ykz3Aht5zOOcbIA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200126
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103762-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7E3642B32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-13 07:52:27, Alexander Koskovich wrote:
> On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
> > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > 
> > Describe the port and repeater, and enable the USB controller and PHYs.
> > 
> > Also specify the ADSP firmware and enable the remoteproc.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > index 90f629800cb0..c31f00e36eee 100644
> > --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> > @@ -6,9 +6,12 @@
> >  /dts-v1/;
> ...
> >  
> > +&usb_hsphy {
> > +	vdd-supply = <&vreg_l2b>;
> 
> Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
> eusb2_phy0 as l7k. I don't see this being overriden by anything else
> downstream either.
> 
> Just bringing it up since I copied this part for another Eliza platform
> (USB 2 only) and USB failed until I fixed this supply.

Yep. That seems to be the case. Thanks for pointing this out.

Will fix when respinning.


