Return-Path: <linux-arm-msm+bounces-95218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAdeDRZip2lvhAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:35:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE91F8064
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 23:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75F473116735
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 22:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25143537F8;
	Tue,  3 Mar 2026 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cddr5VaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdIwnxs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C22EE611
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 22:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577169; cv=none; b=CMsLSY0znl+tGR4ok695uWNrwxSierAGz/W2VTwr8yrKM+HUneW4pXeOINLWbBbcnL9uRqU88bL9GaSXk7y60dGAf7698X5LRNz7qTKQJMgn5Mi67ss7upLqkx/oGNAuTqoXlVkskQabm+dAUssdS1S9zkEMIypj0M8w/jQSgkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577169; c=relaxed/simple;
	bh=qDXe7h/Q2B3JNQcLdubzrdUVk9xrv6s8v7tjOZCDfZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFa4ULpzXKeqMbV3It6IAK5AQml+cFhaNGA/RcW1V6sqTrWxYh8tixG7kSQLwQr3UYbaONWTy87wn7kTZKgkBSjdcvqBVeMJdN0+E8Rca367PWphevwj9km112N2vxN97EyExUMR2Js313eR3lzF89WxyXlqptCBiog6KHmOPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cddr5VaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdIwnxs2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0OHC3708650
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 22:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=; b=cddr5VaVmVXykzRj
	cx3cakWNvDoLzY1BgQ6gMnlzMHsl6giVCxiRmxB1yX7RfXUWK5KTIrVEcu8Vo+RR
	WbYBDWE6FoUCNgwDmEBjp5F2detpVxt5bG7OP3HByXxD9EfS2OdAL0i6EwhkAQ1V
	snA1K5E2vaexC3sZ8Th7G1ytUXjoLh61LmLkdi2zL542CUJcqtu1Znvq6rrQN1hE
	T9/gZRQtL87FmUK1MF7eIQNZcgqMttFtexF91IuaEiEM7mSYSx7ztvai/KeabxGZ
	SRXx80+A93HtAHidEx3ghNo9mMQixHb1hjlOnb3oftRQQpfKBcRLomPTuvobhpin
	zcNMmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm3ccb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 22:32:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a1ce5d31so83217011cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 14:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772577166; x=1773181966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
        b=UdIwnxs2D41I0MmuyQkjTzMztqooX4fqqray9z6yDKvISp9itjylcpU2kJzpPbjiYC
         L3K16TpPTU2GJNAnsKcmcU5BYDWWL30/EPuzG3L57V335pBVMOdwXb1B5t79n+Hk3/fj
         rSiQmCDaUwJ8R/axQ9lMsPqGOuFgiXg4ndxXnAVYssQUdE4okcHzK31vmWxm15e6HjVr
         X0TdOF0vP0jrPq6gboxAbzumwqw2V+kuGRrBhmucov12wSY2nvYNNaksPS1AepADRbjD
         PUiiwTK32hCiOPmOVOwLcs6J3BQv7aVD4H3Cox70OxFDBhQ3JONMa8gD+HhetONByw4f
         IIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577166; x=1773181966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
        b=LJG8E1C1mz7IpPXUYsH8nTk/odmqy3PK+yP7UDOSRXnCPNU5VEsX/xaNEBEkFHIMnZ
         UrgMmQWE3IC0VOl/Cc8YGpLFqwvFBjcj3lOVa/HlzrlbssMQG2T7KdhRnUsCpzTMDMAP
         ax/5jrRhrUudL972r7zx7qCdoMy3XfPvPSOvpqRngkBWVFDilfCsmZU2ECc8UVCkLzW+
         9yPLvoSsa4oUKm0isJK00P6U0QufdoVHONrDuowbyq7zBQ92vyvyBTfgAv48En+o1AJy
         Fu5Z/rC0J9cGjF8TUNG3IYRILoi5+zsEVkJDjhpAD6L3QdrI2MFMjEL2aSqgzirzUCpu
         4R+g==
X-Forwarded-Encrypted: i=1; AJvYcCURpZ5gXyS8EGdvWuz4vexCmuNKwpVQF7XVa7xm+cvrqHtG5d8S6w9JaQ1FDzk5HoLZLqC0qTUtePUqesme@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UUdVNlz73uyu0HyuSiFlbgBS+fwVRCFzFxIvp4vN5YFkm+x2
	rSUYqHIYfrgmeloRAkqIGKbfridX2Ait4B4pb+vJQx5L8eSCpNpVJ1YRUML6URn0VdssDqMivHI
	lMoa70PY28NWDwYVfzoJBJf4ima2Xc9LXdiAPBC1wu5jy+JnFUh+cq2DCjYVNiWAtwUGo
X-Gm-Gg: ATEYQzyZ7EJh1TCWrQB0tm9d5dui52oMjjKg+st411Ua+4uUfndEJyscIsP/HX3JTH3
	fdP/gV7jYBVoOtagxOxahGJPn9XT+xL3CNq7sjguhxxYZOr1LZp8GgqNl/VwwDSW9/Pt/1piYsM
	rSAM1lNRGitGWTJw+KqRkSE9gt4RN88OArzUjR975vWSEbmyuvDZKz2j6fxRpXuinAUFjmZXxS8
	CTbFOh29rIuyyqqEMtjrS3VC4ZU4SJ5r5GNzY1oTfmL51UmeaZM6P1f7HHdgHYQIbksrAnPg/WY
	+eEtXgQe2IN0/7x6I2+r2icc0W2wH1eqQ9rsDPCSZjR9AOmPveBy273Rz9WNooNH2maYGB9L2Z3
	IbVfVZI49c9IUmdKkgTO6umcB1r57HKy0F8WsuckvC/6GuocYMUWWT9GdyDDCjA9UDw++L07tME
	EnOyCmqdSeMiqFUJrcwAOmgFLOkA5wh/f+CS8=
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id d75a77b69052e-508db2c0253mr193631cf.31.1772577166285;
        Tue, 03 Mar 2026 14:32:46 -0800 (PST)
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id d75a77b69052e-508db2c0253mr193331cf.31.1772577165819;
        Tue, 03 Mar 2026 14:32:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1237b81b0sm844996e87.50.2026.03.03.14.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:32:43 -0800 (PST)
Date: Wed, 4 Mar 2026 00:32:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
X-Proofpoint-GUID: yAS09EKzMtSub1MAuC129ZQLO_2AQs8K
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a7618f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6Tb7KvMF9jvO1snUnhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yAS09EKzMtSub1MAuC129ZQLO_2AQs8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfXxCP8rFyZ/4wb
 +ZF4CycJ4UCCQg+IQ3MVclWy8ntEI25AVhHxmvxqWLbZi4FfjpLurxArQ6KBS0fldVrHnmYHn3+
 OWB4+FGVH7h1TPG5prnckvn53kKwwFWv7JNCbAMBsZf3mQ2p38+3cPTQzvEcVgQTDg14cBvx6nh
 NP2CJWaawpxZ4cLwbwNJjSSy2VOcKjKUcM1kNdPVAcCySuvxqSiu3+FJKCpB/kv3hArQA+D3hvR
 LWYulR0wLZtab2UdvSTMPIklR4r/V4OyOAtorjMMcr6ut4XQx5T7trj5Q/VErxHY+dmPBnbgjqp
 ToGsrdCdM3fLGxRIOg2/yHHssoylYYGVLOyBrDDKFJW3rJZuI1ZaZ3t5xTDCEBfT8I98xAPz+e6
 QgOZSVlru1aWsPKD7M6CnBHko87W13FDXEo93/doP1Uv2GEmDYBQTebEEY0i1YTgvAe/hdSmBtj
 LvwX/8cg9k/xAtADgqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030185
X-Rspamd-Queue-Id: 8DAE91F8064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95218-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> On Sun, Feb 22, 2026 at 12:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > binds to the first display subsystem that probes. This implicit binding
> > > prevents subsequent display subsystems from probing successfully,
> > > breaking multi-display support.
> > >
> > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > probing. This allows each display subsystem to initialize independently,
> > > ensuring that all display subsystems are probed.
> > >
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > > Depends on:
> > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> >
> > What exactly depends on this patchset?
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > >  module_param(modeset, bool, 0600);
> > >
> > > -static bool separate_gpu_kms;
> > > +static bool separate_gpu_kms = true;
> > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > >  module_param(separate_gpu_kms, bool, 0400);
> >
> > The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:
> 
>  -1: separate drm devices if there is more than one dpu or gpu,
>      otherwise, single combined drm device [default]
>   0: single drm device (matching up pairs of dpu and gpu if needed)
>   1: separate drm devices
> 
> This way we aren't changing (or breaking) things for existing users.

I'd rather break things and hear about them being broken.

> 
> BR,
> -R
> 
> > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

