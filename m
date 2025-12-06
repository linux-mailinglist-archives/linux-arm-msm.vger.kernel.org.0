Return-Path: <linux-arm-msm+bounces-84568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA580CAA524
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B79E23012CF4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AFA2F3C30;
	Sat,  6 Dec 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRAMgs9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSvHkI+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8066286422
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020503; cv=none; b=LAxTn0k8/fZykvbdPg4dy5wp9qDXiKSaw+pwzYgslEF6sBUBeMeN9E7Twm6oJW7BoLS30dZfrrZZOadCDAgdDW9DUbtCl8dc7/bu63TDDGvs0p4N7SGVB1NGoka93jJvNqDeyNgnbjrMOYfaj9hw6RcYyTskhtnSFdsS8l/Is2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020503; c=relaxed/simple;
	bh=sy8LuxttyWBbhy4283Xw5tNBEb9LVJpfl85panOxFVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruujpFFrENOoAmnecuy37xEEhtDqPGGzqMH+UvJ9YgpJC0WAeD7WMt0gOrNOd42bqoMJ3nEe80wdSR7lso/U3h1AezF4Pw4fcaoc7+sMEHLen9WDQqRpAS0g5+FGGJWy79GsyN6RZLSjsVgg4WYu0YVIGLVgr8sJTNkKGnENnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRAMgs9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSvHkI+N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B65XedK2829227
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 11:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eftNH50iSq+b1pQ7t2A41tuU
	7np/m1Ety8HH1ooE1SM=; b=fRAMgs9mCxazzXMzvY/ljPhA+e7OThl3YLhsj8ag
	E0+PTIudFHWg6pcpyS5dVUKEgLQEZjFp+y6zKUBesZtRUICX+Rn6X4SUtEH4SREF
	0FsGlxPwLVw3mjj7/nScJ1gkLbuxG0waYVBscNDBnvK2xuhSbNJTI0dP3WYXL9+a
	s8CX6KXW6q5TDl2KvW0GrNYKNkdLRUql9XF6eLXmTo4BZ0O2DgtYsXUEwaZI3naq
	7W/jEEsk1epwTBdXUFtdTQd0dXYTtx3yiUwzixFB/3p+Nf2ljpaMz9rvnnj1vZi8
	Ay9uoZglavJpHuWbrN3KSqMbokUI5/kFcN3+xnKj11Psrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9uprx8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 11:28:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51396f3efso508693985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020498; x=1765625298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
        b=XSvHkI+NU+bSk73RHjHQzlZHHaNxUWCi61ZziRB8k2WNtEvs/nlAjolPfTaTPUQKKQ
         20E/GJ5j+BMdmSGvnYsF+ktAnf16iJFS0SHLXA+ELkIayhEoQRE4KidDbZWV0L1jneJl
         OVBvNGgCcPR8Evs+vImQmqM2LDDEejuV7/rzeVFdnAUIKXUFrynltMIAzQ+E9zPwVa+y
         Zx7KP8apRbdiuiYbzn2/fYD8zXJSYYEkcieUqJvVMW3Htxax2yw1gZ1MUXDHykHqiuB/
         3aWAcKtZ2Kh0UsNSKG4nhvGh75WpwfZmc3YgOMP3NU8v6EBVsDPAAq7VyULgCINKKVdN
         MB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020498; x=1765625298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eftNH50iSq+b1pQ7t2A41tuU7np/m1Ety8HH1ooE1SM=;
        b=N1cmB/A+zifkQTW9C3HEI+TTurzVNe/y/9OqfGxFkp8RijC4GQ+Zehz8n1Qf8xOHB7
         iDWkPJR2jOG6PGwykFXK/ylvm25VZI5O2Hd1wQf7KtQ8A+4THqz8gIyyQMLCXh3BIKHK
         pjyGiV6x+KiEys4KfoR2oz1DHoee3flyRFojrxfgQ8/hXDRaszcgvwEKvZKIqQvXO/nn
         sqX3UtTp3KVJEgAU7is0GzHrE5B216N7yptA6CVFeAdh1JFwmE11ehhZAetU8t497HwR
         AP3E7UQ6SwnKDyLIoG3V4bxb8IdvhhXi/xgwuRJBQ1f4SSLxbddQGbgH1sqagn37y85K
         MLHw==
X-Forwarded-Encrypted: i=1; AJvYcCV1h9v1qy//dASF2zZOjuI8V4ve11qROgouItL0d8uEBEb6d9LTcZUqqM/S46jHumAhRhflGtYCMUXq7QUH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywewyj/fFgSuk8icHEl0slOQkArrcUHNrE851LIwwhY0MtKeNXx
	IgVV/h+eLAWkESGdvCcgjnhRf35m+ax6TqEkssIm+7IiCN42LiHZZxCzfDJU4EVeHj4x8oW4zuA
	mUD/CBoLU98lswlBRw9G4eOmuIJNopD3N3O47TL25lSxuEGPnoreG9d3ntJVN86f8YwZJ
X-Gm-Gg: ASbGncvmJrhi1OiTisxGajlXDkHCsK9utel8d3z+Z6gAcDwqg/WxmW5Y5/R3YQcaVzP
	CI++I/KjFQCLHP2nLZoY83Zcul6g4pLgOmMXciiJXoVi/B+XtanH7EJyn4qT0CGeZ8WYta7rGTO
	X6eDnr4B8dZV+rZRXqo+UCD3Utl3+icVHdmdwxAU/+o/KzB0xI0hUsg8RDOKUURvxSga1UMF0EG
	CjhB3zQmeGw1LjA3Im+sWlP1H4COldk1Rtu1y6xShDcUpf27i/NBheBFHxTXuUslbKTlqiUz7VT
	9qaWsKRAQHmELP26iKxI0N9FDO4egOnftjUiW5Tnuhq/89x5jFX9kaBY3Ena688/HtuYJKsDzg3
	+sSQ2bSZyapBeMk3XGZJiEyY1c7HwvUosGojXuQ7xkeXotyda8XR8JImbwUmUzgzrOXyzvXHNC/
	KdSjnsdmuWV0lzDQyWrmoROt8=
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8b6a23f9f27mr297014385a.83.1765020498337;
        Sat, 06 Dec 2025 03:28:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJHWqoex+xRiDmmBbNdl3f9VzwXv1wYvWtOWvVciq53luinVftKkSOrV0+ulKIRpu8jICgkw==
X-Received: by 2002:a05:620a:6cca:b0:8b2:e0ad:eb97 with SMTP id af79cd13be357-8b6a23f9f27mr297010485a.83.1765020497870;
        Sat, 06 Dec 2025 03:28:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a5d7sm2399030e87.15.2025.12.06.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:28:16 -0800 (PST)
Date: Sat, 6 Dec 2025 13:28:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
References: <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
X-Proofpoint-GUID: d_7Awr9_jpGHhpEjDoLPHToHlBpqp2vv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MiBTYWx0ZWRfX91nCKMPDHao2
 dU7AmUaN24sMtKax2irniUcJocJwFf5cpOcu5DsZhdsiB97Zs2hxm2inkgMk6CJM0YHCWH6QjsW
 3xQtwE0xZZiu4qwisO5ltNPPKCXbqHWaphJ3645Gu5cPe9yGiU071sTK0apVHXZnld+RX5/UDrI
 qoIHKHPXWJXOjUf8L32hOmOVtwejghGC6ae8BMOpX2t9rhIpiepBCOrgn6CZ49Hwjz7CuzuQqaR
 XdCkjlpW7b0yh6QgEz412x1KyNjAezGGG6vbNXz7Mwx58UL2LvNqon0HM4wYuup7k+jzjw4wULa
 DTA+eWDSURWEhOTGbOJ5Dh8rQIjjGGYAEAVkGOk36TIZqqEvnFaPzEuHuZEbIp8+QQD0nM5Swa+
 Y+i9/nqL1Lxv5CWtyWDM29xq7O4Pbg==
X-Proofpoint-ORIG-GUID: d_7Awr9_jpGHhpEjDoLPHToHlBpqp2vv
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69341352 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dcO_3dQx6njePB8vrlkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060092

On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
> On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > > So it's not really impossible, you just need some hardware and a day's
> > > worth of work.
> > > 
> > > There's no reason these should get a pass, it's breaking the spec for no
> > > reason.
> > > 
> > > > > For SPD, It's really not clear to me why atomic_check should do that in
> > > > > the first place. Your initial concern was about exposing infoframes in
> > > > > debugfs that wouldn't be used by the driver.
> > > > > 
> > > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > > whatever is in the atomic state, what's should we force drivers to do
> > > > > that?
> > > > 
> > > > I really don't think that drivers should mess up with debugfs on their
> > > > own. Making atomic_check() disable the unsupported InfoFrames makes the
> > > > picture perfect: the DRM no longer tries to program them to the
> > > > hardware, DebugFS files stay empty, so the whole state becomes
> > > > consistent.
> > > 
> > > In the "bridge has no access to infoframes" case, there's really no
> > > infoframe. An empty file is "the infoframe can be there but isn't used",
> > > not "we don't have access to it and can't report them". Only drivers
> > > have those infos.
> > > 
> > > If we do split up write_infoframe into multiple functions though, I
> > > guess we could create the debugfs file only if the function pointer is
> > > set, which removes drivers' involvement if you don't like that.
> > 
> > I'm fine with not using HDMI connector framework for lt9611uxc.
> > Likewise, I think, it's fine to have empty files for the infoframes
> > which are not being sent over the wire for any reason (hw not supporting
> > it is one of the reasons).
> 
> I can't think of any other example in the kernel where an empty file
> means that the driver doesn't support something.

Okay. So we need to sort out implementing the split write_infoframes in
drm_bridge_connector. Any suggestions there? I'm asking, because I don't
want to end up exploding it.

-- 
With best wishes
Dmitry

