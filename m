Return-Path: <linux-arm-msm+bounces-101792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PUsNQVn0WlvIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:31:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852B39C3CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA071300A8DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20C72C21E8;
	Sat,  4 Apr 2026 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8bMDwrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U43lt0lV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F819343E
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331074; cv=none; b=SqqbXqkONPeI+NI2XEdoC42VFCMAZj2DvnVjTrNlqd5sqcibEDkJC+ZEeRhaxmsAo5GMQW2EzJz37u+Fr06y9MipoiKiF/3FCXtQPIO64T4CRt2MBKEqk2kWjKu73DpGy8raq5Kt0EgJST2LlrHxavvlUZWyUJh9+KSReIsnH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331074; c=relaxed/simple;
	bh=LSx9WTzV44rNY0Dbl8hoAX6cmBv+s/gox6Q9nQ7XLpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHrh6rqR0asgV+eytsKRyMKRjiTifpBe6tPCf+PMEgZRZJyUI03B6hV9mD2NA69BL6rj+s37FNYqGzLX/NJYkAD1cxm/WmnlRlGNA38t6VWMqf3wlAAFskAbC+FKxVL5FWdxXGKuKJWqgDM2cIP24qlwexnKwUlpbXbIGZxWJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8bMDwrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U43lt0lV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Fx5VY1417136
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M0hspaMhz5L3e9U4dgwg5Gv8
	XugdZo31JAxgaxDLXww=; b=e8bMDwrmo9j1UbbwJWRU0kUYSvszPE9eAWoboFF9
	die7cvmTepvSa/0ElwP1d5plnaU6FLqI4A96bVfyZi5prx6tbLixkXSOVNXN16w/
	+4385KgCtzibsdIWwG369z0/FJd4xCxvH9gA0Dz1SRw+b6w3iSS9kjaaNZzuDf/x
	clx5w5P3Cg/i1Fi07oYqEAo1PUwPHrAGglXJnUJTf1Y/JSiiGmd7iMxvpu3jtkgq
	nB0yGdWWTBXjZhLwARsbFZKZknHlgLnzONPj1GVU/8r14rsqrvTFYJv6alqqauWq
	YW2KJxzCTrvu3IfU3VmYxZPh0O0avGhSszC7d3ADlp/Syw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhedy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:31:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso97727701cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331071; x=1775935871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0hspaMhz5L3e9U4dgwg5Gv8XugdZo31JAxgaxDLXww=;
        b=U43lt0lVIqjOIGAK2imIE1GjdHYL1Sa348xDTJHIyEua7UmBuB4C+hH/BYvWF6qyR8
         ObQBCaARtdSTvGoLBbT3JN3q2Lf7aK2DoUMJDPFbE6zYnm1sa4gfx8o4Cxb/cZOLqbAu
         h2mkIeNIJ8AId4Aubgj7NGhXlDCoDg9rEuFzBQQkoGzO1n71K4lqHhUwcrDMx9T0Gjby
         T2ymd4upf0KpQzYD3qz8yAR/3XgWh1XhfYdXwlxlkSHNnVRbpLVEheLbjL0g2tScl0/4
         6bZl9uxYUPYA3aMTunjN8imIOlSY24lVOE0xkdLRtBLQ1Z3OljEXeC/pCfZUa4wjKaKi
         c3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331071; x=1775935871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0hspaMhz5L3e9U4dgwg5Gv8XugdZo31JAxgaxDLXww=;
        b=jhqam6EWWHxfL/Lr28sSJ4ukb0GaLp0FgvZU3skrC+FwDFI/9h9VR2FWQwhu1JW252
         Auk6v6bJFW07bgRy4wgD+kB5I5LYaUJJrAT88pBkPkQVB5EEb+/Jd6wrT/SOCcQN4gUe
         1/4Ifw/iJNiIPHkXhOnLiyOI3I1Sm2ai2zzITyU8rPSLyWIEBNqZT+ULch07uk7VOFpa
         rxzdWQ9tC+bZcrNfpZDrUvJLHiDI7zhIEQj6I5VvNOAAPWln6vnHVIOz1CElfp3LV5Le
         TgtZBX804MEWZMD9B6Hsp2XhwSRteGSVbkaENGJIISOsSnkGHx8OuKzL1AiZJXFletab
         AZEg==
X-Forwarded-Encrypted: i=1; AJvYcCWTXBGGCMmKDxZTgKUa+qSGHjNK2zUYo2abPe67bBrtwdqdMEQc5N5q7Scv/rf2q88peX2Uf+nQVlDkZu1U@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5QL+WLKJ3ELoahtaFgSgrhmK+n9T1N9Ca3xcA1TrZ1FUBOUZ
	GbNohLtJNUS3BLdSbjUxaQdAtvPE0WcuTQbDdwxGq2/WENoJBpaw62LHfqvqZZ4Rqa75wi4pI3y
	JC3F2R3de6k5fztgVoy2gm+XsegWJal2IO0OvLsuHoOWAwQGkNj4VeoCpjlyGJcFEjVew
X-Gm-Gg: AeBDietrF2HHNdOo9XNUh+O6yqkpHfo4gD00vnT7pZZpG+iAJjb6uG/YWBlmafnw1U2
	nnA+S2b9L2veX458X6YxR4UAPRpJqx5wRuPKmgszUV6sdI/e5uj2iUKISjQI9lx8r48Ps7llEuX
	J8xNdcEErtnLwBHJ3nmzwbZpEaOX8atVDNf0+qQsGeGjegtGiCHYqWBoQ8M2oR98kDX+yVq9AVY
	t2oy7RAjQyBwOz5AoybsxVQQYAc7Ky0RbhF7ozewLjsHh/ROV7TtBRMV8jg3J6B1gqif0jaXJ9C
	wY4/H5UAszW1KQkRyaJEM55ESZhQjBWlP1ziMnQPzHgQSWpVCs+UjBplBvMh4WdMwI0UD55CjmR
	JoY0w8D1FLL69RFV+X9ER8EgcnzyvSSJ20plbezHRtHcr8kdq1s9Y2xLkMiKell+qUIDZ9FnWnr
	ihLv0kGjPjRbQBMda/4Kl4JzfoiKl5rCt+3vc=
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr114152841cf.45.1775331071556;
        Sat, 04 Apr 2026 12:31:11 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr114152571cf.45.1775331071131;
        Sat, 04 Apr 2026 12:31:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm2306712e87.75.2026.04.04.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:31:10 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <b7fpqtn2qq5uqeqzpoeelizexhfhqry5i7wreecgj4t6g4u3va@glp24l7t33sy>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
 <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
 <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX1GCZn4cvXNsx
 /HmrA/dL84Rm0jkUXtpzarh0D2TZTcmk49oIfOBnZ/oiGw/Fbp/XwRUmz1qACG9QODjhFKHBYH/
 jPUaUAeBRlX2JDlMwwLLm6u68A2PPnXCl/yo9TcV8+wWrbJherZ+9oHMHrcR0A2SLewrXQZTU6c
 nT6yLv0QULkANlUIJz92u4XU+qgs7hbnKLxEyq05361yQZ8uLFZsdsjSWOx+5EJ9Q7ktLYbK+LK
 W/73crn+U2DGexuw2u/eCysySfHKvNEE0eCVLvR0ku6LmXa9xw0iaSNv6+0/GcdH8JtFIbKFwTZ
 vdMWn0hBzDdnSG+8nbjPF1nupT2ZO81tpCDJ4ceGm7FaqcnJT83Z9W2JhNehOvppa514J8rFCxo
 7zudfg8eltkJk3qWBD4zNJsMDXEBbAYtJjY0joqkciTzk0lBQNPDQujQDRbsX0pgNqeg4MTCJe9
 jz4PeSRHw3+XDTB88Gw==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d16700 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dKYsdM090wwGdDnEZ2kA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nmS1RAY_EDizolQym4nHCia7LMoDT9oe
X-Proofpoint-GUID: nmS1RAY_EDizolQym4nHCia7LMoDT9oe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040186
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
	TAGGED_FROM(0.00)[bounces-101792-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3852B39C3CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 09:41:16PM +0530, Akhil P Oommen wrote:
> On 4/4/2026 1:50 AM, Dmitry Baryshkov wrote:
> > On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
> >> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> >>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>
> >>> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> >>> device mode till glink node is added.
> >>>
> >>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
> >>>  1 file changed, 27 insertions(+)
> >>>
> >>> +
> >>> +&usb {
> >>> +	dr_mode = "peripheral";
> >>
> >> I can see that the usb port in the MTP support 'host' mode too. Should
> >> this be 'otg'?
> > 
> > It's stated in the commit message: OTG requires glink, which is not
> > available yet.
> 
> If the issue is with switching between host vs device mode, isn't it
> more useful to use "host" here? 'Host' mode does work on this device and
> I use that to connect an ethernet dongle to ssh.

Another issue is VBUS. Without UCSI / pmic_glink control one will have
to set vbus regulators to always-on, which might be bad if it gets
plugged into another device.

Last, but not least, sadly enough of people ar still tied to the 'adb
push' mindset and workflow.

For all those reasons the USB is usually brought up as a peripheral
first, unless it comes together with the UCSI / TCPM implementation.

> 
> -Akhil.
> 
> > 
> > 
> 

-- 
With best wishes
Dmitry

