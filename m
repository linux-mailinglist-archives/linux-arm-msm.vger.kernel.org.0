Return-Path: <linux-arm-msm+bounces-106339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B1PAFJz/GkEQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:11:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5704E744F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72F8B303C7FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23D3921DF;
	Thu,  7 May 2026 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8jZkoVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g20X+xxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8D372B51
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152261; cv=none; b=XheiChil7oLe3m/8Yyx7E+fyQF8MSfxZYkxcQSYgjHYjYeGYR3rmd1FnR0LZ1UDJnxBqPJmin46EFieJwFpv5bByRCIMcify7S5lfa6Q4djKFrd5Sbwtx0uX2qDCmzGgw2FOVN0VDV/ryZdc2YJeMI7w6BYGeHwRaF119HIQkf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152261; c=relaxed/simple;
	bh=iwBZ7AtMlhelEvLw+tye8c1q7oBAuTMT4QG11XTcpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyDJfevB3wVdT3+LOTggy/i14PlVOPos7a9q9ByHak0BXSLPaQCL7HSfVS90mH1s+eIF7Hlegi4cfIIF3Ivt76lXUTkuHU9VzuXfJp7ZXG5p/vYfnJJlMgOAX6KwxUqXqIcXJ/16JDFywlfJfISTmPtEwh0qCtdCqMFPuo7nzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8jZkoVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g20X+xxt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wRIM1926200
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Y1kuY6AIGy+U4i/Y7pzL/6z
	K08GGDx+3n+4jmLdQvU=; b=O8jZkoVAqt+2HLCrU2eOD6YB3L6iTXF67LpCaRSu
	QAseQv6SNf3eYEndOf+rlKeYTn5xvcmLoniRiabHTBNmoqEMId5tALIdR3xOYLal
	M80isMChprYO83Hs+kwz+mL4ar0l+0LD04kBgpK1seap2XZ0v0VI+meYkfLPzgo3
	KBDG4EMuoWNq5Zso9HhvywmqbfipwOrbHtnNVXWsHQgvlbg5GkRkX0VlgFlAuOP/
	XMvHY5T8+aYuRcvjrt7euN2/KcH6wo7D/lvgSKY71ochyglzsfOMjdPS2CMXeRpC
	XLTzyjYCysKfoMAX/LiT99/jDAE5AaN5C03ulU4NuObiYA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g967f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:10:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57563cc7576so798812e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778152252; x=1778757052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=g20X+xxtK858QKAdfgknvaE5wdXkNyjSMvfJhZsM6umA6INVGTekjmpmviDynIAbE7
         GY0wLAqURl7qTs0JYq3mapcEpWu2Fci6AnGvHS5lWqGGtjLs8omBvAOxFfDObaMfibhF
         PwM+jNftyf3QhpHC0hygrhI/driWYyGigVa1n8vhZcm/pYz6q4ceKZF/BPx4K6ckm0B3
         bAxuqhXMrUvK3olSICpxo3v0TDsKXKGpClj5VB/Wav5BaxT0xWZo1kQXQiPQXF/jGCcO
         UYnUyrkyA2H1y6I7DVw4YAOVH60PjlPH+ZYzE3cyu2qYSL2llSduqNx9xD4WpT/d+f2Z
         DikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152252; x=1778757052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y1kuY6AIGy+U4i/Y7pzL/6zK08GGDx+3n+4jmLdQvU=;
        b=kPyaRKB1eKrtrvA3zkBCXmE7Agi2prVfaUVZG+f0rThJ1zZRN16VGvBsrsnWXlY0rM
         W4DFey4tuZLJYTa/pk4lH/kHzMFyWnbOkL4KsduIxHv6eNdZUhdbx3wEY6hnVgFFwDTV
         9lnphXSCNxXl7b839WjdLI78UX22ShnpZBe7ugF44oCX9y9rubt63LvfUYooZkg+lJZS
         Jt8hHiMLXjnc3RD/rYMAKVhMzxGsM80NiFzdn0fqQsh+kEzaVuIHGDwhGtma5u0mSpE7
         22bJBEQeSuiYck34aW9TV2ImuT7LTQcCGJlGlBbhglpu/hqQyZXmQsVyAhBy/nI+5R65
         OJ2w==
X-Forwarded-Encrypted: i=1; AFNElJ9DvU70sGir7q3sKr5sKyVpeY21h6QhkjHNVIGnH0tB0qO8WUCZpjLd2K65r6ZLWAGL1Ca7LsHqkXJlh9Uj@vger.kernel.org
X-Gm-Message-State: AOJu0YwOn1QAx9OKuHE2Tki2TISekTwY/98v9uKj4VWW5yW5/hx5l+7i
	mDwZXSMkb5a/rYTu2V0cuZIQSpJc7xIFizC65jK8tChFAS2jF90P/Duf5HpA+nTooZqjBaXj9/N
	diAvaD+RWnAGIZ7M5AmgLWD3U4R7imaC3RWaSJ+gytJWjEAikQhj1YsJmtSSgHF6RghqD
X-Gm-Gg: AeBDieuGtbCiivo4qJ2HlzA2SW72t6QzHmWADAzTutI8uGqNMROGdULXdAlVqcR2nXt
	12n3Tvm+snYjDmyngqeAE1jUF/JZCGZVejHZAS+wuhbxeMY5rQECy7QwRYNdq9p5ub8/Q6EaIvY
	4KYRzCEOqWbaOtOVSmyyfhKZ8jxuJk1Yw0husqt17/PhB3J8cSrUJ3z9D8oC+dVQQzT5GC+EgR8
	eMJT14FHue+oiNMLDUuUMs/hOTIq1+cHec50dlRU5IuoR3qY+QGthwjHc9T8cxW4+IUI7kgTt++
	raRsVc6EKwTtLeer//aUHef1Rz2Rvy7nnVSABdUBblkik3rKjkTpT1XUIZpJiWIyOXPmS/DPLcd
	JMcPNtAcgjcQV2mJ3d1Hh30mPvKf/qa0ypya8AKjlnCF47GKmepl0xIHmq+CdHAgVhIEtKy+nHL
	M5oBWWNL8UaKIKqOo75flSFbz6K+AaFgrJ1IK4YfWGLB7jMchKzkczktuf
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284820137.26.1778152251751;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
X-Received: by 2002:a05:6102:84d2:b0:605:38d2:26cc with SMTP id ada2fe7eead31-630f9036c70mr2284814137.26.1778152251228;
        Thu, 07 May 2026 04:10:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22de94sm5528582e87.7.2026.05.07.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:10:50 -0700 (PDT)
Date: Thu, 7 May 2026 14:10:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <nfh7duwh3o6hayhxz4pxwfwng6fi6q4l5rlzlgjjk3atakw4h6@6xbyk3nppdrt>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <mplk3qvyslzazuolwlcgy6fb6ta7ts63x3dq5wwybyejaxpyh3@fctfzjkyxi55>
 <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <605bcc1c-a4ab-4125-a4b9-facf801db26c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc733c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kzQ9Fxln275sraQuM_AA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: yFbeKhD-xNnsLzBVzpWWX-7ws7fG9cJB
X-Proofpoint-GUID: yFbeKhD-xNnsLzBVzpWWX-7ws7fG9cJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMSBTYWx0ZWRfX9f118vwNh12V
 WBnCWIeUVH1HZpjt4hBUdexhkGv0yXSNqWy3CU0o8ISAV1uvCTRtz53QfPCfQna13cj9TkkWYGo
 qX8HzvOZrvKIfjFBIIcO+dHwyLGgrTaqtHp/v8tLmnL+0gwrxLn8EI0w/oTQuB3iCS91DdFBBBK
 yWEi+rukpx7PWQjcYOMqyIpQsIOEQNA1MU1oBmOeOJu9/pkUfWCqe06cfRn/IalNsQ6b2i+MhYf
 r42K2xP96tFROjxPUyGkiH7uvRY2cuNbVF/JMfn8vLxhcOWGHD9l3vxMm/Fl4tmadvexJNRH+BV
 UIw8cnykwGlxtx8DLYf5yt68BupnPsJfyMt1xqsvdQ7X+rVVz5UcrydZDfbKVs4XFZATMiQ2Kd4
 aoQWUxH8WsmV+hpm5AgtfUmt6SUVLKL61CiWZpVFZSJ7PTvizinmq4etwQsOLV5m/yKYtkTTKci
 LeZY/NwFuHNVQXO539g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070111
X-Rspamd-Queue-Id: 8B5704E744F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106339-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,samsung.com,vger.kernel.org,lists.freedesktop.org,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 03:28:21PM +0530, Sibi Sankar wrote:
> 
> On 5/7/2026 2:40 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 11:52:29AM +0530, Sibi Sankar wrote:
> > > The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> > > Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> > > pre-determined algorithm strings and param_id pairs hosted on the SCMI
> > > controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> > > mechanism to control the various caches and ram is hosted on the CPU Control
> > > Processor (CPUCP) and the method to tweak and start the governor is exposed
> > > through the QCOM SCMI Generic Extension Protocol.
> > 
> > Could you please clarify, does this apply to the common commercial
> > Glymur and Hamoa laptops?
> 
> Yes, they do apply to common commercial Glymur/Hamoa Laptops
> as is. This is the same solution used on the windows side of things
> as well. There can be certain cases like Johan has reported earlier
> where certain oems are stuck with on older version of CPUCP
> which requires a the memlat string to be sent out in lower case
> we should be able to handle those as well with overriding those
> by using driver data and specific compatibles.

Ack, thanks for the confirmation.

-- 
With best wishes
Dmitry

