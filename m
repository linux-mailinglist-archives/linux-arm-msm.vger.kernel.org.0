Return-Path: <linux-arm-msm+bounces-94296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H6oWJ9g+oGllhQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:38:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAA1A5CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE9DB30CD902
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221633815D5;
	Thu, 26 Feb 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2EdUfJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoSf6Oxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D71342C9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109359; cv=none; b=J+MfDqNvSdOREtDvRubay5TcJFNvgThLEUxf6LmGKto2TkE85V3p1yLg7zv+sVMTxtbkatQvvfzn9eBgFMIIcSPm5+lwwenLn4mQzcRIi/tsiDJPNj4zvYdL2ztr5tqQ8Hk04FHwUJaPMJo0GVLCgw4I6E0CToSzFHMGab9QEx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109359; c=relaxed/simple;
	bh=jAZH2PQDlPKAfKQhRMxjnSpoFweNSVxAjXUlujWSv0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/ot04bLsiDcFJ2LAc3EA7ZVv5Rz+HnbmM+VrwxwWOlmhh/A/3dU+wbM/pmf70hFk6CwDzM8W1Hew2EncK+0oTiZtyRMYj0NXWoeUV9VD2Cd1k7AZtI09A4+gnZR5SoM3/564UyOBxEd9IfLrCKaMdN5zZw/118I/DfUOsc/NPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2EdUfJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoSf6Oxx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL4BS3747763
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5GMNC82o2PbIp3JNg7h1C+vK
	9NoeCm9TDJIU/C8NC8I=; b=T2EdUfJbHAVI+0GT7fY3kFu4OBWGb1E4XS9vCwYz
	6HJ2D2hfvG9j3pbp2sn07vVBw1gHCoSz5d8vKwxFWh9mrQeJjn7rclgCKLhHg5UC
	xagjwIgPgmWolVBhmpfXuIYaBnZ0BDi6c1KUFHxXwWIZZ3qgEXvTB++XN06xibBh
	pvDDLriwoEoK4//AlKVOiiTECn0tWJe6St088N4D8GLn1DFLJ7fORdGHaGftvaJY
	cy6kFNshDi5k2yAOnBKNwtDHulHSD8mgCUhhXpsI3EZ4tskICgHA+YZqt+HEZAFP
	z5F1xhtDRRmfJ36+de5c4NarHJYwv3/7BaWRnxQBgMT0wA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559k5ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:35:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so480533485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772109356; x=1772714156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
        b=JoSf6OxxU46gk5kPgJIsYDWnZ7P/El4ZxgJLsZJ27MLUsBzqLJzE+PpQR718dGmsyD
         dKj9qW1fOFrepKyF2pdKZlQgMimbaxaLuOvIizMqkXEwmq9TzZvX4gSw1L+A1fhzDEun
         XukWiJrKxUsJ4+R2idwKDWhw4BABzvYInrxL2UdqYKjzuc6R7EfEjPljOMhKhTleLOhh
         dF5ZhPc19pSsYgZo3hymV9PnfdnIOD6toUoIfId8hSYIOX9INkkOB4M3wbjM3JNMYsbF
         rKY6UmDOrUsRKWSGgsHJa2JHNi6r+QYtVfUgeEXTsoKOAf72X0UFWGpb62wfFZ3hOJBd
         xIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109356; x=1772714156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GMNC82o2PbIp3JNg7h1C+vK9NoeCm9TDJIU/C8NC8I=;
        b=XUQvPFhBg0utrz3akNkqpG1b+qo6pV2iGJUozdismo/WPGXW4etBY0b1DMRHg6oWsa
         Ka19bCkt9FW8/f9+EyeW8Mnik1RqNliYlPhfDmOA9TSeamYgNMpbkcSi9QZE6qrQ7TMS
         tk7qOltHpQ2Ex5bjQOV5vlhtHvzDsHake7DuyVxvMJ6Xui2FlUntzT9w992wFSHn1XHi
         4rK0A1zHDmS/gIku8nWjOD8XCMWW129HTF4OHuIXdkgNzA2x1tU+yEQbd/Rs1aI4zESz
         Y7i7/qq6JkN8/ozvicMTklmUGgqgkIRE3IOF+kAiOweu5B8H1/2OWqpK7RHckTOLXin3
         AkSA==
X-Forwarded-Encrypted: i=1; AJvYcCVueZwjY8IHETG6fosd852/OnqYs+Wqb5b2nv/Vj2lc+jKFlFNXr05qK56oTCESfWnU7VES+J2T+v82ZxXa@vger.kernel.org
X-Gm-Message-State: AOJu0YzGu3iCIwR0i+UoExhR2jbH05wrkLdQ1aHrrC9tPVW2ks5Zflqt
	oOxW4wLskTbjVbbFh7+TEyzYJWP0yns7s2uF+eaEeMw0MbCRnjafXEg0aImden40IHRnDBljBNw
	m0JmhuqicWH8m1xOjoq3VH53ozDGPckbdAVyg+BW8YXZBLuYa8ydjc2gg59WstoYgAGEn
X-Gm-Gg: ATEYQzzJ5FMf5pq9Gj7axTlgHt86JfmqWnF/3zE/9tF37eujJ7GABu+DSEcshkFZKmm
	M5r2FpdIJTLhvc5xNi3omAcHyP47rHZVxevf+/Ng9otQmikmycrBj023FVCymqNF9KGUjlCGMjo
	qW2MwKXY1nViLmISPgAN4gVETkjJ1K5suh/eBTSUVdMOl4CiK+vr7PwdbPpR/xswwXsk6IuAs/n
	WnLXO0iIc9ri+VHyPcAYZKWiUwntq+40Z3tAbSPhI01pdR9u6094QL5JfLzwBj27Uw8IO3NzWUe
	hnmjuOMnwkJwcRBw6FXyCR7iB881wMGshU1l+bbV+c2nsiKzOJUrF2ucK7fEAJ54hOqfdJXrpg1
	IhdvC9wtI9m1wWiAO8OLZsssm9rwdeAcTR/3Zn5TZq/2gW+v5GDGIGt9JMqpaL4bsN7Ne6ljNVd
	yLzihd1gMYIgZmgOqI4l8y9H13GUE0NBZmQU0=
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cb8ca83779mr2673673785a.63.1772109356233;
        Thu, 26 Feb 2026 04:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8ca:4438:b8ed with SMTP id af79cd13be357-8cb8ca83779mr2673670085a.63.1772109355723;
        Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b189sm5886321fa.3.2026.02.26.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:35:55 -0800 (PST)
Date: Thu, 26 Feb 2026 14:35:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
Message-ID: <dyqv6ds3tdqcdrdl6zexwdn4mhi4g4p77sdymaqan6nmdhqmxc@mzl372c52wi4>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-6-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225054525.6803-6-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: BikwqgUgZ4VS2-Yihbh7QUQkXXw4ziLz
X-Proofpoint-GUID: BikwqgUgZ4VS2-Yihbh7QUQkXXw4ziLz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExNCBTYWx0ZWRfX/S6/bvv+UE6o
 ix9y468g4Ra1xnREGPcfC9ajY4xCfnx/Gh7n0kZu0OpmxFr757fb1dJ5ORrdPZPuz+z152jEtnA
 mbF0fTVfBtWVZgqz7b58LvpXnQO5xQP2ANC1HWLalqXnU20wX9VDmqSOiVErAZY4VeDNEiD/SSR
 aLdKuLt0xPdqoXHM9Z4YfaSAEbn3DPx1RrxXRPH/6hrOrXrCRLSVpbbV7YE7W0eVJvGI8enhFZt
 MYFJRzkE4lbNOWohigkTeyiY813yQOnTohbrpEKVyK5CinbrD1d3GqTumESJAVP2Z5vGbEzCLNk
 WtZ818k3haU0nM8s9YJLOYYobAtJRt9p51jSv+E1z3gtFKY5nI1H3SF7QBmw3I8AUs4QGjWWnBa
 +APzCz1xqG99VmV2qs54nz8pRvsCJ2EQHFAmOjyweqtknm5wSiv07g3NkdxN1RJ14BFL/u7tgEQ
 VypWKSt+YP2L/U0KsnQ==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a03e2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=2VfSu496nhalCebPFTMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94296-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DBAA1A5CA5
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:45:25PM +0800, Pengyu Luo wrote:
> The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> utilizing the same register layouts and clock structures.
> 
> However, DSI won't work properly for now (Partial content wrapped to
> the left side) until we submit dispcc fixes. And some panels require
> DPU timing calculation fixes too. (hdisplay / width timing round errors
> cause the fifo error)

I'm looking forward to reviewing those patches!

> 

-- 
With best wishes
Dmitry

