Return-Path: <linux-arm-msm+bounces-90377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJGSIwrGc2kpygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:03:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B179B79F03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F533024444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137092222A1;
	Fri, 23 Jan 2026 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/NriZK/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoBs3io2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557F2AD3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195016; cv=none; b=SSL6yk9NyL3XvoTr0yUtNFPhxQygCdWA3TgY43BHVMGQhaFkAuSZxvkPLADnQtVXLk+EmqQUC/xygIXDZk6XiKEjVtayE6JipPf3O/C7UktnwA+T+OzvUI/VJphOwAjmsPD17fnmalqYlvdyPGmK/P5j5kStGKWFitGhSNM8ofc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195016; c=relaxed/simple;
	bh=718rcmAkAFKz4eRUdDMA4rVjTYyC4SvAmzZ8vzWMvrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efzsUWY+PL9nqLlb7yQ4rBPthCSB8ZVo/3wLl9AVO8TaawWtUq1KgoMhDk5PYPdxssEKD0uZCo8ByQtu+PcrFdybowVynYMoPxfc/F4ZlKX2K71z9Re4Hb+raDL2x/4kXmbcVb821NMlEYJEQKY+t8PmMfDwY3q3iQrbKSxmXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/NriZK/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoBs3io2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NCjWZl322603
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVwAOsk4ELq+P70OzoFnibplSLMMKQiSZRMQzV5IPyg=; b=i/NriZK/YUK0ac3B
	+lc7y4A+jEV15Lq0hxoCo/Ok0zpshcB1WvZtKiGkqm9ZeZrbE+Hta4M2rXG/gHu0
	aytR3sCnihvQS/+RoZhCy+WZ+Km3gKO9Jk1XHX0bPDTBT2ZfaJQ7jK7PX+B4cY9T
	dQ47tSBHs1iMarZYEbQtpTg0AQOLwN2Rt0xfcp/w/xuVX8JYQpMgDLLoSQP+1aEN
	nwiDfj+ttUSCLby4ENo0a5tl6GJqInkRLRl5fYdqo4myv96H1Nhg68dvQriOZZWR
	smmKbJw6nVh7m8sD9epwg3jwe4uQBDtoLuNVPMAJ4bFwHhLX0VhXgJLXJ69rTka9
	HhvXwQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv3mqagvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:03:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483af29f38so213399241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769195012; x=1769799812; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVwAOsk4ELq+P70OzoFnibplSLMMKQiSZRMQzV5IPyg=;
        b=PoBs3io2CytoEEzSu30sGDvIrmaNTT4A93xKTo1XIUb5+YuDLgqQegLNqwtQrTypYI
         gkNQ4AWvtMlpv3gFZB5ILNXIxYMnSyArkqhJsmgzPTwDH3v4XCIjdHnX4sBmdWrKzQsc
         QJLG+utje1LKjMmemNfWGxb0v4aOgJ5vyHUFPkrMta+zYFPZWoZssIiP7Z633CRJF2Mc
         yVzEkeNDjmXggrYKsV6WCrn9jrsft6LDsUV4kbVALWs2RAt+lIlyDsM1hAtk6l9W0W4T
         5ZCKpnUY0Y0MPcCFna+1kQMvPVsvpS39wxWh/1mYGIiohh2MO8Oi5oEYRbN+PoE2M4ex
         SclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195012; x=1769799812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVwAOsk4ELq+P70OzoFnibplSLMMKQiSZRMQzV5IPyg=;
        b=Bo0jA5HhL/8YOuG5T6bevvpFxQUTWLEjnEMv2zqfrS6dkvDBFjOfvRu6gpdKqfj4o3
         LoN8QMC9uqGAIZ8EfjHuw/ilLHjOPqmIImzY7g9QOksWooJLRyZyyG8YZcNhdBT3VuEV
         V6B89nZ7Md43UftkTKRI5xLe+wsSly6q3TK/5AO5fd/iK2308qY8DGITAKrLDCGCfMxC
         uKR/y7v6DHU0bkTMuYqWxRX+Mz5frtc/PTC1LUo+k+MuOXP10S8GtjlfONcGKNbgDtrI
         IuUmtJGuetGhqbgx6JyUUwjUrMTbj3GbYOjA2aC0O9vRfCMpKUVdOEvUkOR/8Z39NjCh
         stJg==
X-Forwarded-Encrypted: i=1; AJvYcCWdsLtlVwnZW0AKSEMNt8lqUpzjxrLc4thEm969rhw3fgI0w9DZ92F18EfK2T8TIMI8F0MxxM9GXznIOPxd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gWNLaSa0XHCFj21vmNiNR8zFby+pmNXwE6YIyrzaCUU48rsP
	EJhgQeeYewxTTe7ibS+MWuwZh2siZfXj0Ng8cRNdveyLfxC9797lYkpFdQKS0RM+nGhPpvZq4QL
	dI/INFmS8TSMZTzpnqtAqPuG9PypLLd6W3aJ71JOi2vRB+frvaqAxaCZg6OH6rIkAxsnu
X-Gm-Gg: AZuq6aID8ynZBmCrfEGVMwRCqHH50yqzYwFeexhk1KOqxPkymcUi2iaVv5bVUzUnL4W
	EMgqFdgj0IxRGGh0dgzPl1kGEhGAAHAptUKXxUbF7G6JFGzbJIeEA3OTsT98pTVV7zemPMLGmbB
	UhTyj4yjkequAL/+1etaV0EmyPDr8+9GoUCF//O3dvVyA5E0Ck5Mpk2mPj2J7VdLzqPeDSmQ06Z
	BMTJ44n8WznL/zgHQMzSZCds6tzFC8N0kPygiXZ3HbaC2ss/gnHfiIa2eVdpVSUuzqMMqWS/aK8
	F58Nokj0AKWFwNisendpkDiYSmyR49SkjPGJRR5E12kp2L2wpxKv0A+6hC0vxXGZpkg3Wc2SzGH
	ngYvNg1a+oFJUnVXfA906csKyrgojSDujDcUJ7hQdYiTfBh1h9lrVk9+jKIyy7n0ykkBifFRTPa
	YYVVF9wxe2k5oK/PPA37rDBRE=
X-Received: by 2002:a05:6102:d8a:b0:5dc:51c5:e3c7 with SMTP id ada2fe7eead31-5f54bc6e014mr1093675137.26.1769195012131;
        Fri, 23 Jan 2026 11:03:32 -0800 (PST)
X-Received: by 2002:a05:6102:d8a:b0:5dc:51c5:e3c7 with SMTP id ada2fe7eead31-5f54bc6e014mr1093660137.26.1769195011662;
        Fri, 23 Jan 2026 11:03:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm7430331fa.24.2026.01.23.11.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:03:29 -0800 (PST)
Date: Fri, 23 Jan 2026 21:03:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
Message-ID: <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com>
 <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
 <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: u_S7PPQ6wGQaOF4fRYWCvXiyKrq4FddZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NSBTYWx0ZWRfXwbvZj+2eDYUq
 brIi4BWVPM7HfKfUywx2MFRtCHyOdkS+kSw4F1wEleQixqwhRuAyAVtabK0Rc4Cf628Ijc52j2T
 znhsS1t7lysE4Ni+onTlGVwm8PzGQe4a5rG9Hu3F8KX1RQT5EMPZAYIWFYLO2e/k2jdiqVnGDPE
 M5wP0BD8L4NVYN3JpkbubmfuUUORw5SZj/3sz1c4rtMYIzR6+GMp195uhxr5xOVUXZAVssRF350
 AXg5LvOCq0glvfM3calEmeOjv6Mn8QhE3LJAZhUYxLAbmnWALa+LWsZl1VvLlkqv88b8ieSSf0v
 xo2ESj4S3+sm+bh+J2U2B505VwuvBnslf836f1ly6FpzDW6ZDNMvJJz4C+dhaHHBIrw55vu3q+f
 3DRFR4r549FC/8kK41HzZJp/mmFm980hDqHukubPjoQBWpD3vcQn3BQYQNOkR34lvJ6WQtnX5Sa
 8B4GXUi43Aiki4IQz/g==
X-Authority-Analysis: v=2.4 cv=SMpPlevH c=1 sm=1 tr=0 ts=6973c604 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=I_CKYeSSvBE3VrBswM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u_S7PPQ6wGQaOF4fRYWCvXiyKrq4FddZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230145
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-90377-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B179B79F03
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
> 
> On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
> > 
> > On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
> > > On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
> > > > From: Casey Connolly <casey.connolly@linaro.org>
> > > > 
> > > > Generalise the qcom,bam-dmux child node support by probing all
> > > > remoteproc children with of_platform_populate(). This will be used to
> > > > enable support for devices which are best represented as
> > > > subnodes of the
> > > > remoteproc, such as those representing QMI clients.
> > > Please flip this around, start with the description of the problem
> > > you're trying to solve.
> > > 
> > > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > This must have your signed-off-by, where you certifies the origin of
> > > this patch.
> > > 
> > > > ---
> > > >   drivers/remoteproc/qcom_q6v5.c     | 4 ++++
> > > >   drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
> > > >   2 files changed, 4 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/qcom_q6v5.c
> > > > b/drivers/remoteproc/qcom_q6v5.c
> > > > index 58d5b85e58cd..a02839c7ed8c 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > > @@ -6,6 +6,7 @@
> > > >    * Copyright (C) 2014 Sony Mobile Communications AB
> > > >    * Copyright (c) 2012-2013, The Linux Foundation. All rights
> > > > reserved.
> > > >    */
> > > > +#include <linux/of_platform.h>
> > > >   #include <linux/kernel.h>
> > > >   #include <linux/platform_device.h>
> > > >   #include <linux/interconnect.h>
> > > > @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> > > > struct platform_device *pdev,
> > > >           return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
> > > >                        "failed to acquire interconnect path\n");
> > > >   +    of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
> > > There are other child nodes here, in particular the GLINK and SMD edges.
> > > Do we really want platform_devices registered for them?
> > > 
> > > Regards,
> > > Bjorn
> > 
> > 
> > thanks for pointing this, can you please suggest the right approach.
> > 
> > This should not impact glink, as that is registering as rproc sub node,
> > And we need rproc cooling as child node
> > 
> > of remote proc subsytem to create probe dependency only.
> > 
> > 
> > Can we do platform populate for specific child, would that be right
> > approach. or we should create rproc cooling as independent of parent ?
> > 
> 
> HI Bjorn,
> 
> I’d like to highlight the impact and details of placement of remoteproc
> cooling dt node:
> 
> 
> ->As a child of the remote proc subsystem node:
>     In this configuration, the cooling device will only be probed once the
> corresponding remote proc subsystem itself is probed.
> 
> ->Outside the remote proc subsystem, may be part of soc node:
>     In this setup, the cooling device will be probed independently. It will
> wait until the remoteproc subsystem is brought up
>     before completing cooling registration.
>     The drawback here is that if the parent remoteproc subsystem is
> disabled, the cooling device will still undergo an
>     unnecessary probe, even though it cannot be registered.

Bjorns question was different. It wasn't about pushing cooling device
outside of the remoteproc node. It is about not registering the devices.

Can we follow the approach outlined by qcom_add_smd_subdev() /
qcom_add_glink_subdev()?

-- 
With best wishes
Dmitry

