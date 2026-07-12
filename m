Return-Path: <linux-arm-msm+bounces-118551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uDwcLOt3U2rrbAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:18:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6E7447C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:18:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ObeW3GqT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fnWeFlbx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118551-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118551-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 796DD300440D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1514E54723;
	Sun, 12 Jul 2026 11:17:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882AD3A6B85
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:17:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783855079; cv=none; b=Hyd4wbGY4XLunw9XFx93x7tKfCow4QHkOf3cI1Uri3uifMIsE3YLzSaGA66SmViJKLiwIdJCfVcEFnTQbUMXrgPLl18zXSea2Hxhe1AfUsjKgOwQ/XML2pNuYyXO8BDcyiWHBHbdEherKAfVfS0G3QOw02DvLlUr5rpgfuh+qas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783855079; c=relaxed/simple;
	bh=mlNMpSqtEi2jNANBb+GsheXM9NJDr0QX2HJ4hqQz+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyU8QIRatMFbtO7UKUmL36lyd8g4LCQmBaOIe62QUqTeJ5f6PV+bgTthBSIpTqqRgvKXe3HQZGWQrLw5vz76qwSEWzbeQCWcam52nPctnik/zQhNb2UjvwnFTkxlY88d/45cgky7teTGi5znRfZR5tCopxiSfVkscybFgRv/UcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObeW3GqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnWeFlbx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAc5hN2130571
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nHcJCXXB3ZnfIZ8ZoMcNX1TJ
	yR9lo/auPxWHf/zGIoY=; b=ObeW3GqTDEVzXmJWMcpzzCAcgcpbAxOfsm/s6ZmY
	uiUH6rsgkfIC8992UM8HBMM43qZ08amOgrvWU7Lx6nx4PgwG7memcm4y/rR2qbjG
	2UrthL6Ju/hEb7hhEfcMpy97pc2uvZzmJVNTjnDf96droNIA2+8GbMTmZuQZH3Yi
	Xz52wrkab3XdiUU7oNFgHSlbJBbzMdQ1T0Icm030iG12/ucJHitO4ghsv8/f+BBW
	Dr9VM9Fkyx0BaSo78t7UbrXu++kSMSXJeUDnXbGvK3K8jMuxYSiJ1T3pFkdiwxRW
	R4Q6KYWMXtM+NU+FxeObeE+tyCw5h4x4wfp1nJdN/bdLug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjjwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:17:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so58088766d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783855076; x=1784459876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHcJCXXB3ZnfIZ8ZoMcNX1TJyR9lo/auPxWHf/zGIoY=;
        b=fnWeFlbxg87UeoiuYgbTpbl/Eol0BMT6R3l0vHgi24kvXPhl4nF1Ki+ln3Nxem1fIP
         nlQRrkiR0PjPfstDJFGMpLy9uYqnztqI9MeuRsE8fKy5YxEHt9/DqM2L9wj63oKKkv15
         Pgt1neoyhjkosta3WT7d5VpLBnm8kjkhrjOszeQ6XfU2cTp5Y7vMUYgKcHG5IvIb+8vX
         YRsBm1WOZ8UAZ26Q3DMvIVP2KdbK2xOk7bw9QIr2oXhEjIIVgwDRE79MeEdj48Qksxl8
         tzRbhibveBn7OzzoUb4yt7WauxTfQ6oyLWcRgGLx81LuSTB6j4tfNvPnkqdQdRGRjhrc
         vT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783855076; x=1784459876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHcJCXXB3ZnfIZ8ZoMcNX1TJyR9lo/auPxWHf/zGIoY=;
        b=LCbCndOG9RZB+ptKu5sVqVFLgFrUtqyLWuRH15YBLa/cpYffDzTxm6iaCNyxCsdKI5
         w1TNhCnm4F66H8Me8ZvJLBG6wbkOGlbxIVkLNsCFzV4DLw2FRARLyhCoo9QKCFV3zN1G
         +eavaFpw1y0r4Ck3b7I5TGwpMxn3i7EcwH8SXMD6czODAIu+mEJe+ez1wPdvjn65+WcG
         8zWm36oHA0d+w1k1gfUBP5z+xRTDcuYBRC6FaII7Q9t/dMMcrfzmiJ/uZtEW0zJRErGI
         wFkAoE28UB79BQ31eTxyxlqf8+ySFER4YWgbO0XCRNH2NyFe6mAAOPQ/gu222qBlnDr/
         9vAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0JdfVNbSludJcTWLh8hnY7eQcB/osTI4ZXcuvXnj5FR6Zse9gI5FK5RZIQ75O3ykhFgjgKcmIcOPZFgXe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4JEBT0pSEuvXJji1RzaZeSfShD06f4z57SCjN05Gv8UfVmpFw
	BqVJ+8odBzuGtAadjP2gjBIvSTlm3Siq592s4WzizOhExqonSFiINHPXOhPJJME0FAX0CjjbpYu
	pGkRrHkr9uhtx1daiHs0NJjxSvydqNucINzxoXhZAb/lZkIKnMq7oOKWOtNUh/3hBYgL8
X-Gm-Gg: AfdE7cmeac1OIdc+uPv1aPmLCdOph9EzO9iB1PaHLqP4gS4/HJc0HUCchec3x0IuDyV
	gFdim6wEdW7cYZ3UXOw0pg7uDOM3dZkVzgXD0bgKsj3OyPwBpjEC1VHLMdCkDHOxbz2n48bfQCR
	Y3K4Dz7e0s24ksHS1li34jmv1fGsu65kO7GhvprFMNwkpvMwamGmQt3o+BVT0VviZ6VNNKWlG2R
	M5sfhNJ03gO9RuJybRiaBtTNnf5i3JjANWxIj+pvAuMHckWd2XEbfzRPadYBxCE8SrLgvhtAQ4f
	rYt7kARbs2odL9gzttFOV+tev0Of/TG70/6V7qSNqbcjYqsnPSiqvgCAjCryBHM1WcTG2AbCyF3
	ehu/N2yXFjVA6V1x5Wtbuw7+7RrYVX7disUge2VLK9EXxTSdRcB/NCpmQ+ps4cI9QkEE27piNe3
	qynqU/XEuoOpR9SqFlshcGSyue
X-Received: by 2002:a05:6214:3ca0:b0:8f2:f32c:6bbb with SMTP id 6a1803df08f44-9040236311fmr64736796d6.51.1783855075722;
        Sun, 12 Jul 2026 04:17:55 -0700 (PDT)
X-Received: by 2002:a05:6214:3ca0:b0:8f2:f32c:6bbb with SMTP id 6a1803df08f44-9040236311fmr64736436d6.51.1783855075279;
        Sun, 12 Jul 2026 04:17:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b0cea1d984sm1120207e87.51.2026.07.12.04.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:17:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:17:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 02/25] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <anxxmx4qfdil4chif37e2xzk3juuvpnqdoc5mg3jcbdkoaa5rg@obruztrgljpp>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-2-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-2-2ed6aee1867a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a5377e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=vzSq-QvcmNpNVXwySUEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z4yn1CdrwddNGI8X2aY88dXiOMZeikXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNyBTYWx0ZWRfX89y5YbDjszBd
 NNCxii4RZOMcqOTdzzH86YxzNaGYighGVcKmq5SQFW634jkgUpwYRapJwUhjIOo5F9hm8Rnh8sJ
 Oskf0om2mlooV/v+vfgfCpXUuCndbN/EKNig4ucfjddjUtTdCa6wAWfMwbGl9DpvWO7LfqBkpK6
 yX1LvFEtah7njqn9Uz9DQ6aSRZFxr8YXRg4/TOwVRXNfxL0Xv7nVccmhgYP7rTycDgEx8a2yfgq
 zUiI1XUKQKDAhoLiDTYe+JH7yLJ06eqCpQGRKUtpmZAuoUErn1mtnf2yrubnZt7MORbHv19x9Jt
 AwekeXsBK7+Fj3d/vAHIAu96iPHU61b74iRoBGV/9o6r3LyZbyT5tqeS8PpcQKEEI6zhYJMEvhr
 Gu9tIXKY8mD598G1+RL5/dQahPLw07x17C/EkjBK7vkJZTrgJMKlZ+efnu72h4NXDcQchRl4+0r
 9pFrtOlvk4GtrF6pDUw==
X-Proofpoint-GUID: Z4yn1CdrwddNGI8X2aY88dXiOMZeikXO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNyBTYWx0ZWRfX3GlsLMkRI9Vq
 aq4IwkfhQnE23quXGICbB8v58HT0b3D2lkx6kh8p7lkd4ZG7tHgMny3jIGJV4IPPQI5reMSr9bx
 NJLhOdJsrKuPeh/WebBl8mNdVD5LO9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118551-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88C6E7447C3

On Mon, Jun 29, 2026 at 10:14:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP controllers across different SoCs vary in the number of concurrent
> MST streams they can support. Rather than hardcoding per-platform
> values, the number of available pixel clocks in DT serves as a natural
> indicator since each stream requires a dedicated pixel clock.
> 
> Introduce max_stream to capture this at initialization time and expose
> it for the MST module to use during setup.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 +++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  4 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index a475e787656e..68fb4facb056 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -127,6 +127,7 @@ struct msm_dp_ctrl_private {
>  	struct clk_bulk_data *link_clks;
>  
>  	struct clk *pixel_clk[DP_STREAM_MAX];
> +	unsigned int num_pixel_clks;

Squash num_pixel_clks to the previous patch.

>  
>  	union phy_configure_opts phy_opts;
>  
> @@ -2754,6 +2755,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> +	ctrl->num_pixel_clks = 0;
>  	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
>  		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>  
> @@ -2766,11 +2768,22 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  			DRM_DEBUG_DP("stream %d pixel clock not found", i);
>  			break;
>  		}
> +
> +		ctrl->num_pixel_clks++;
>  	}
>  
>  	return 0;
>  }
>  
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	return ctrl->num_pixel_clks;
> +}
> +
>  struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
>  			struct drm_dp_aux *aux,
>  			struct phy *phy,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index be0d89d60914..305add3dcd93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -55,4 +55,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bb243ab09e66..9cd243411e44 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -87,6 +87,8 @@ struct msm_dp_display_private {
>  
>  	void __iomem *p0_base;
>  	size_t p0_len;
> +
> +	int max_stream;
>  };
>  
>  struct msm_dp_desc {
> @@ -578,6 +580,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		dp->ctrl = NULL;
>  		goto error_link;
>  	}
> +	dp->max_stream = msm_dp_ctrl_get_stream_cnt(dp->ctrl);
>  
>  	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
>  	if (IS_ERR(dp->audio)) {
> @@ -1178,6 +1181,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  	return 0;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp->max_stream;

Anything stopping the driver from returning
msm_dp_ctrl_get_stream_cnt(dp->ctrl) here? Why do we need to cache it?

> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 43ed79093e24..d3d4ab98089d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -26,6 +26,7 @@ struct msm_dp {
>  	bool psr_supported;
>  };
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

