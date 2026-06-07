Return-Path: <linux-arm-msm+bounces-111562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MamKJgxUJWohHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:20:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B465062D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:20:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MnMQ2Fjg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MLlh2o3Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD5803012C41
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC549329E7E;
	Sun,  7 Jun 2026 11:12:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B136E484
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:11:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830722; cv=none; b=omJxIaTubxlzucZeAeqj+TyZ71uQPCIlm2GzbNsCqmvV6iPm22FDbnGsVavcTrH2m+eW3bR2ogHpbUs+iHh7gehPFoz8aMXOsS+MhkKHwOcuioBsFj2yF9kmFV481Wsp6jQ5+eRGwDeeoAcmLE4Z0VpfSXU1baJZ7ji4sIU/2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830722; c=relaxed/simple;
	bh=gXOs7xyF3UoJeaY0FmlCNYsF0TUd74tf/YVDSRzzjfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUvvxZR338o+CouLNFDBWkxpC93G9QA04TnMbfAy7TQ70mJHAOuJEW4bpYYH/sHZEMlFOFpV0VlPisZ+/znJxa7SYypreo7U+2DQlLuKr4BoiTUqhBTRcuAyWXeZtu8/h3AV/XREkh3Y68Qn2s0k8mnY2h/QAdY5l6H8Ry1PNUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnMQ2Fjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLlh2o3Y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B0TXK4140596
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=enZ/tluXe8uhwFgBtqOA8N+V
	Y9yHa7VDeQa55KuB+cw=; b=MnMQ2FjgMuNjX5Uu9p8t/O2IquGVC5yZY91yGNYe
	/FyVopwZPPM7ZYdXJCxlqydZ+CAybJLh29dL1J2N6bDz8fGLM6ZEcvkH65ioWep6
	qZrdE4lNimODiXPHqPpzAXxic59PdHMZplSD6rd+EJQSzM1cSt6KlUprdOHftAZX
	0Upt/TiWddt3xeKIP8oTXSOfQ3mLxawvK1QF99plKHJdfkfYGbWeP9wSlMbpqLu3
	JIjK2XEVCHcbYOFxcrsFULF06M7MpLQAx5OuZNDa4RzJQ7uDMWfhDFr0xBH90wca
	zRzikH11wmSuDtFpOKab6sDgbhTzHosY6Os6B3xaWzNmNA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrbwy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:11:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfe512e871so1619355137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830716; x=1781435516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enZ/tluXe8uhwFgBtqOA8N+VY9yHa7VDeQa55KuB+cw=;
        b=MLlh2o3Ym9MJg0WfxZ4pMqDqQinJzpksHJGX/p7yA4O/EFD4uehGHFMD+quvj+NtB8
         We3BQut9Z7rYPD31DAe/A1DROR1S3vblFqT3JuSrrWTmPXUfNRyxVHBVPWWLUJgSsgnc
         Bat+VFbAk8yhFVa9OJAv8KjYbxrIoEW7H+F5EN9a1CaYmQutyLZM6l16YHR8Lt0egnqy
         G81VQmvJXOVH2zbU5tzHVSmkaLHPEr8jXu9rs65L4S9j25bZqHI3Ehl/uw4haJLdwxED
         NsO6Abz5qhAf1uea5HJYn0JA933mJ66M0dv1eiQINd1OOUyottfJlJ+a+Iar6gqcnfIy
         B+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830716; x=1781435516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enZ/tluXe8uhwFgBtqOA8N+VY9yHa7VDeQa55KuB+cw=;
        b=fIEu0nON4y4HEUMkzJftehLMEZiuIbSnKNf/+bHqJ1Z1ZjM8b7n4mez0m+6LarUQFq
         I1W0Ybhx9482B/s2Rcw9bfJsgWQMbVi+SlxsDXXiF2l9qX9T7M5Q8ir5ha3PttVRGP48
         YNBVLv6lmtuJkTydInUjfFd/pwcCwqFBpOCGMhDFKywROea+OqZsJWdfjntUDykR5+qF
         10OkdEUZqaxp/U8obZNr3gnH98cLFfkeTojUhpA+c1Ta1vC612Wxda0ULWroKxsFbhgd
         8EJZjVlA7XBV/l6Gid9szGGfMvDDvLgaQlfeUTkW8I7SzN+gAqfh1mBcbYie747DgZf1
         +RxQ==
X-Forwarded-Encrypted: i=1; AFNElJ97Bu1a7eNSIDRQ+311w8YNFO47owyVIeFw8sptcWs0gvMNcGhqxt6C07lTrO85BAzD78QpzR0FlqEfbUdO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1p9dxYthkCR64ZeSXnnBM3Ot62uZ12WfELOXsVB26DZRUeoLj
	opl8j1pwLZEN0NDv6Y/5V9pamOBuOQyv08Zie+5HDjID3SIvaHV0S617aTpY7ntPfN6/o28P9wB
	dO3bKUsPl40GESKVIlk13FhGmGoRQjHFKMHcmGQGkb3nrR7USx88m9+FEc6P0Z3eikhzlgXAQxD
	1e
X-Gm-Gg: Acq92OHexvUqw3SSBJt2zH1SGI+fs5ySYPek2D4tSu5pSPE2iQUD9wcnulD1CnF+mm3
	My1M2XrFnXM0v2M7xFel9qgmPEtnNXoKHsDgvxOSSuRty9jqpI0Btm/zKwbm84tj2/kZ5GS1LgH
	CezqJg0M2ggS0oEPHEZzRbwlc5lFLke3tKQH+9/hFasXszz6GEBaW5ans0Gm6shF8RI46AOt3k4
	LxYopOl+qRlUHSjcZbPjV4LY06ktGIUO9pWGrKuJgJyx3ycedmw6u6b1u3ORiHFQG1VKtuCoj1U
	jILqbpk4yiwzsLIFDljh2aEyngogLFFTqjrz7odDvLMuBOXV5qvz54jwwRiW8dsdX1cjg5Bg+yv
	YCkJ5nd28WQoOyGN4TqUqcuOGROGwpjhu2KPU3XZvUiG/+60SORjGT0GbC8na+XOsrSQgaP9X3a
	7yJoDtZlSPkbiFlEZMFKFDtrGWcfk3CmELHObUR9MQiC9KGw==
X-Received: by 2002:a05:6102:e0d:b0:6c8:aed:ca95 with SMTP id ada2fe7eead31-6fef3bf72dcmr5306226137.13.1780830716279;
        Sun, 07 Jun 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:6c8:aed:ca95 with SMTP id ada2fe7eead31-6fef3bf72dcmr5306218137.13.1780830715882;
        Sun, 07 Jun 2026 04:11:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b986c42sm3011518e87.58.2026.06.07.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:11:54 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <oibdoesblpjvwovevtrmwdbmeci572bofr5oxsww5xepzgl24t@gws54xvpxbhx>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
 <20260519125655.23796-4-blfizzyy@gmail.com>
 <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>
 <aiVOZDqBGq_hal75@page.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiVOZDqBGq_hal75@page.local>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX7/fMYmRtCtcl
 w7TbevXvj7oyiB9q3ycRgL49t3f+ozd7u0vsLemAqlc6Z3SGXSrqfBRARtF9W0xFDhtr7Hc4WiJ
 K8PPushxbbx36jldeYruRcbR5Dc4lCrp41WDU+0lA6LKY2cvcO9tDb2fx8spRpOpNqOu/ukpW+u
 4WrLoFNYqUggB8X7vS4r7jdpbjAa00DOEVKv2nEk+1EQzn0aOktWj2ffKjyh2ujY9g7s33n6RZG
 5ENi5/fyGU4Tlez4ZgIUbrvJOTVaWj2z7OBByi9SdOREopsGyY6c7SZzQyxeLgH1p3lnEnFFX4A
 /+amAH1DiHxAOIPCt6oki0LNOCsm4tUrbxSeWlUfeDq0x1yEYw7xP4oq3U9zhOaMbFEwBiuCLAI
 e5Zx3YxNIyktKSbR7pla74r4UOt5vYp4g8M9nejq8H94ENeEesA/Xwr/cOjsAo4F/q+WOMPN0WM
 3/OSKTH94/O2Q7K4MkQ==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2551fd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=dKimQ99n0vQM2SySGJAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: nj2mC5dij15MQfOG8UnHdhSqYpffUuwC
X-Proofpoint-GUID: nj2mC5dij15MQfOG8UnHdhSqYpffUuwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gws54xvpxbhx:mid];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 043B465062D

On Sun, Jun 07, 2026 at 04:30:10PM +0530, Ajit Singh wrote:
> On Sun, Jun 07, 2026 at 01:17:43PM +0530, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 06:26:55PM +0530, Ajit Singh wrote:
> Thanks for the review.
> > > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > > QCS6490 SoC.
> > > 
> > > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > > support along with regulators.
> > > 
> > > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > >  .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
> > >  2 files changed, 1026 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> > > 
> > > +
> > > +&pcie0_clkreq_n {
> > > +	bias-pull-up;
> > > +	drive-strength = <2>;
> > > +};
> > 
> > Could you please add a /* pinctrl */ comment at the end of the file and
> > group all pinctrl-related changes after it?
> > 
> Ack
> > > +
> > > +
> > > +&uart5 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&ufs_mem_hc {
> > > +	/delete-property/ qcom,ice;
> > 
> > This should be explained in the commit message.
> > 
> Ack, I will explain this in the commit message.
> 
> ICE is kept disabled because enabling it currently triggers an SError
> during qcom_ice_create() on this board. I am keeping ICE disabled for the
> initial board support.
> > > +
> > > +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> > > +	vcc-supply = <&vreg_l7b_2p96>;
> > > +	vcc-max-microamp = <800000>;
> > > +	vccq-supply = <&vreg_l9b_1p2>;
> > > +	vccq-max-microamp = <900000>;
> > > +	vccq2-supply = <&vreg_l9b_1p2>;
> > > +	vccq2-max-microamp = <900000>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_2 {
> > > +	dr_mode = "host";
> > 
> > Is it actually host-only?
> > 
> Yes, this is routed to a USB hub which exposes two USB-A host ports. The board
> does not use this port for OTG or device mode.

Comment it, please.

> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

