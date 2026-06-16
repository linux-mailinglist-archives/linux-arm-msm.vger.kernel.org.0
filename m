Return-Path: <linux-arm-msm+bounces-113306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QB79Mr+eMGoEVgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:54:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3307368B17A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:54:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TSeN0OOu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SECFdSj+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113306-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113306-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74135300F9D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FADC1AAE28;
	Tue, 16 Jun 2026 00:51:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8028267B07
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:50:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571061; cv=none; b=paQkPzhby5ipQLQA9eORQZZ6KbAYY/XGfExv5K63h/hi3sLGMhAU4w28EBGrSH3hZcO3fv6gTgosMF6WOgxZ7G8KihAlsTjkiXSmZ6Wn4bTsxedatEXsb2qPgRKeVsGNYLyChQEuMQfUOGP17LI3BcketQ4aRjMndkTSqFWFdXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571061; c=relaxed/simple;
	bh=CAvyfKvG5p/gsqBeJ1fOSxyFlA2K8+qszKfQbRCxlBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuPX3z+R6U4XjnG/HXpg4PTLy5bC1XCzHf/DHY9u5r35wzgT+z3CnIz3Bui+H+saEILgrMdHvlAsokdXIXPThvOxVC/G1sseAwxAI+84yFQg9BvpuGunoTaDdLEPwZqB//pTe55YjiQupSxaGuRIbn8vObAGlyc5FeypdOtdkzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSeN0OOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SECFdSj+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0Nuwv1584868
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsWO5RKsXXTb8O5pD3Gd6mYwJkxB/CCBjeSsyoNO8kM=; b=TSeN0OOuwW8y1jo1
	3iUGlPwpkvqoE7selmk0CriKEsVoM+sI7CNME2juL5eq9nsT4+prpbbt95lqTZKk
	rP4/cuFLulmquL3kpPmtcbzU90AkmkIZqE/d29IHy1QsmdzI2ZS5eugNJB3MJQUl
	SYvq2l1PGXDhM4OeGjdUCxods0suhEYpplFvJaZVipMwyNylWkkoHdLc1FM5rF1P
	esq3shv2CsBHQTnBlxgsq+SSRhfgyZ/glcS8rwTpdA+odfjNSu6REJftRLUDXOSw
	YMxtH+w7uUIGepwwJKYuvX8xfsNuvr4VeP4JumJLEjX5y8XPwRgxe7v2FCCyk/Mq
	Tv8fBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kvmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:50:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7bd027eso1047306685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571057; x=1782175857; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TsWO5RKsXXTb8O5pD3Gd6mYwJkxB/CCBjeSsyoNO8kM=;
        b=SECFdSj+EdX2rvpDutqmv2gCvzClgwo5yaWvDjbze1owmwRRnt99YOmudmehChLpcd
         tfxeH4eJi5DK5qzzIUz7G9g037rm607TP0uWXoGNJQN0dxKUbVsn7n8h3D5MmACP4sH0
         Vnth6QL/QasHZJd5+iAoD9oJWybIQjzuJEWOahQlYS3jDVXP5DBG6GdXPI2q4WvXYnlV
         DvAbCR1FDbDACNJsnj+COG1amCwBcG6E5uBx/OTUXp9kI0RVKbju1kFsOUmCfIAIAPQ2
         BMZCduDI+PVOvcY9CeP2MT/8QKbrb06uM/JSAuWX++wR6d69Y2Z8FHwqTdpp3UfbNoJz
         f7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571057; x=1782175857;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsWO5RKsXXTb8O5pD3Gd6mYwJkxB/CCBjeSsyoNO8kM=;
        b=hozPPL8edjqdUpDFJSQmvt9ACKmyhOrRxr+CnPGwPIzbVHocYyrMmeP6pKBQBS3N5k
         l+YmWvCoMLGW/kvzWgiBJ6O+0iPnaViB2SKWmUsd+bWYDhIjR8/RA50c+aWDCb3ok8DB
         QwMOg6FS9rlJYP2yEB+szYHgpk/s67lxOF8FU/75BtVIgOZp4404jEqvleZXToVhpSPz
         seJLByA82MNfyrKI4Sqk/FWzLw7yX2HIKm2+NRXrlXrwIFoXbElj9o0aaahYttxxdSJE
         QadcIyz12KVOTo/N7Um0yhW36UzIuA/6MqxWn/2S+ymmWrk/Vy3LP94LC3OdZcDmv0Ke
         3rmw==
X-Forwarded-Encrypted: i=1; AFNElJ8F9XCxLQGsub0br1VGQdbspADjhR3W5JWxN1bPwhH/OpA7EWd+vOoewrJWBjRSjSt7yUTwBLgyhby9Efcl@vger.kernel.org
X-Gm-Message-State: AOJu0YwbejZzu0RAUNLCRt/IjvMOtD2XDUGRUUr60wARBdy6nuzFI5XV
	FdwNvNuYhhRIcUKZ2jrZZGWTrent7F28glCQoFfuUjGfNA2GfASbjiWMhjt9jLkQ4iAjxshJkvh
	9zqtTtLgRq2cd6KTZP+NFQfIyYwE2Dc6juSMhEtaqbSUenrPW6Y3hbnc22+IycbC05bg1n4pph/
	eI
X-Gm-Gg: Acq92OE0i8zlh+Lk4lOun5loM8hfQ5nIwjtrlL6VXN0BRHiZNWI/+7Pe2CwCWzHLnms
	vEGpqTvRw2QnGvI242NIbm/AkGnfkU9HJTFsh3eNWPUMq9oXIszWlQDtI1S8F6ogYNYjuaMycko
	vCrpaFGrvcrbeQt5va9V+ZrmBRTLoANEm/ePs0aoO2u63UKj8l2EQVfge74zmMqx58HOdaljdzh
	60/8qyyRPaloxZOpYf4e/HV4KxvWFNYjp0cQlDJsmmJ8+qNrT7t/FHEUc4c+ckk9g/L9BzcspsM
	6lDITfzVJLPwaaMvG7PU4WLW4PGvJr37cTuJiW15pBkMCSeRq7UOeGz1L3A4xyr1O7ofb8pgN9H
	aieUIIoTqa8+Jp6x73i2SZmHnt+eYsCYeFgpPJL9o6xKx2yc8WAke0P5cVg77aovs50HYBX8qib
	aC89K+W6JsovQaOJfKpMY5z7Wm0wAjDknP4KI=
X-Received: by 2002:a05:620a:1a07:b0:915:94f7:55df with SMTP id af79cd13be357-917f069deb6mr1959121085a.20.1781571057488;
        Mon, 15 Jun 2026 17:50:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:915:94f7:55df with SMTP id af79cd13be357-917f069deb6mr1959117285a.20.1781571057011;
        Mon, 15 Jun 2026 17:50:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm3036997e87.59.2026.06.15.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:50:54 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:50:51 +0300
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
Subject: Re: [PATCH v4 37/39] drm/msm/dp: add HPD callback for dp MST
Message-ID: <t4ocbdrm4d3xlocycwnsgkcyyuaebfbkid73pxzel46nh724rs@wairidx7ct2x>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-37-b20518dea8de@oss.qualcomm.com>
 <ml35zldwr6f7euzmw6noy7j5mufyhfhmwoigkwq5ykyyl3amgb@5eo63mfnd4tg>
 <42c2bbab-dd86-4ba8-94f6-a6f377425be9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42c2bbab-dd86-4ba8-94f6-a6f377425be9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNSBTYWx0ZWRfXxHrXGGYe5JQs
 tB67+2yNkQR5tQDgCrVfIY05yikvQBalH9k8hTtkULPJtNE99PysI6qjznXZ+amX9OvwnCXAo9m
 jqE4H2w/tyjfYGyPxqoNYQo1OrZvUys=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309df2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gNI8i-zqcxB5eE8BvuQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNSBTYWx0ZWRfX7VrrfnKmorNV
 rik1ZFJdBZMbNaG/oGdhTJ20j119w0RWLkT/ISq6rod4lPV8vWv5nJnKs9lF0TvKqQC3GMX5DzQ
 WYoDQK8UCnVfdtruhDpUCkFS2bpDCxAalXuaLJXAWh9RprohOVFhQnD07gCWulr0zcD2JchFEhb
 NXqVHAX9A3YUU7gsUZBrKMz52T4eT67wTRx3O7pj3QJ6bur568eGtK/Hn5wutOf7//Gtvmdwrad
 7BDrw+/Oi7E0fxhrdR/qu0Fcye31DqxpPgErPL7C3HnhpMh6lWpIXh2fEgaqq6hPiAyyL11hFf9
 4sAqSuKJ3gyGgn6sTakZ3i7Tnh29cjZTopJT+XKkCl7U/fZPa8fgiptUkeL9wFBV1vFZUcxbbcq
 RDqrLIdL1gMxDp+atc/IVU5eMQOkaLDErcje0SRhAMcR0DR08B93td/LTc8YAiGcXYWewugLRu/
 xGzWSTWiBx8DBqaMJBQ==
X-Proofpoint-GUID: G1IyaB_NNWZ1D0eMsg8dW-uEAMTNkOPW
X-Proofpoint-ORIG-GUID: G1IyaB_NNWZ1D0eMsg8dW-uEAMTNkOPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160005
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113306-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,quicinc.com:email,patchwork.freedesktop.org:url,vger.kernel.org:from_smtp,wairidx7ct2x:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3307368B17A

On Mon, Jun 15, 2026 at 06:05:07PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 6:00 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:34:12PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add HPD callback for the MST module which shall be invoked from the
> > > dp_display's HPD handler to perform MST specific operations in case
> > > of HPD. In MST case, route the HPD messages to MST module.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++----
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
> > >   3 files changed, 54 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 919767945ba5..ca89e20b7563 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -454,6 +454,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
> > >   			dp->msm_dp_display.connector_type,
> > >   			dp->link->sink_count);
> > > +	if (dp->plugged)
> > > +		return 0;
> > > +
> > >   	mutex_lock(&dp->plugged_lock);
> > >   	ret = pm_runtime_resume_and_get(&pdev->dev);
> > > @@ -556,12 +559,19 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
> > >   {
> > >   	u32 sink_request;
> > >   	int rc = 0;
> > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > >   	/* irq_hpd can happen at either connected or disconnected state */
> > >   	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
> > >   			dp->msm_dp_display.connector_type,
> > >   			dp->link->sink_count);
> > > +	if (msm_dp_display->mst_active) {
> > > +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> > 
> > Will this work for USB-C?
> > 
> Hmm not work for USB-C. We can remove this check here, as the IRQ thread can
> handle the disconnect case itself.

Please. Start testing with USB-C too.

> > > +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> > > +		return 0;
> > > +	}
> > > +
> > >   	/* check for any test request issued by sink */
> > >   	rc = msm_dp_link_process_request(dp->link);
> > >   	if (!rc) {
> > > @@ -1125,9 +1135,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> > >   				      connector_status_connected);
> > >   	/* Send HPD as connected and distinguish it in the notifier */
> > > -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> > > -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> > > -				      connector_status_connected);
> > > +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> > > +		if (dp->msm_dp_display.mst_active)
> > > +			msm_dp_irq_hpd_handle(dp);
> > 
> > No, don't touch this code. HPD notifications might be coming from the
> > other entities. This IRQ thread can only send the HPD notification.
> > There rest should be handled in the notifier.
> > 
> Ok. From my understanding, after this series
> (https://patchwork.freedesktop.org/series/164954/#rev5) is rebased, we
> should use drm_aux_hpd_bridge_notify_extra() here to notify the IRQ?

No. There is no aux bridge here. But yes, I'd need to call a different
function in that series.

> > > +		else
> > > +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> > > +					      connector_status_connected);
> > > +	}
> > >   	ret = IRQ_HANDLED;
> > > @@ -1793,7 +1807,8 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   			msm_dp_hpd_plug_handle(dp);
> > >   		}
> > >   	} else {
> > > -		msm_dp_hpd_unplug_handle(dp);
> > > +		if (hpd_link_status == ISR_DISCONNECTED)
> > 
> > Why?
> > 
> Let me explain this in more detail here.
> Currently, MST hotplug and IRQ events are handled through the SST bridge.
> This guards against spurious unplug handling caused by
> msm_dp_bridge_hpd_notify() being invoked from non-HPD contexts where status
> == connector_status_disconnected does not actually mean the cable is gone.
> 
> In addition to the real HPD IRQ path, drm_bridge_connector_detect() also
> calls drm_bridge_connector_hpd_notify() to broadcast the detect result to
> all bridges in the chain. So a single physical plug-in produces multiple
> msm_dp_bridge_hpd_notify() calls — one from the real IRQ, then several more
> from various probe/poll paths. Stack traces from a single insertion on
> QCS8300:
> 
>   1. msm_dp_display_irq_thread → real HPD plug, status=connected
>   2. fbdev probe triggered by (1) → drm_bridge_connector_detect →
> status=disconnected (link not ready yet)

This should not be happening. We don't use link status anymore to return
connected status.

>   3. output_poll_execute worker → same path → status=disconnected
>   4. drm_dp_mst_link_probe_work → same path → status=disconnected
>   5. output_poll_execute again → status=disconnected
> 
> Here not work for USB-C case yet, I’d like to switch to using
> drm_dp_read_sink_count to detect whether the sink is actually disconnected
> or no sink devices.

drm_dp_read_sink_count() isn't enough here. See the plugged flag. Maybe
we need more flags here.

> 
> > > +			msm_dp_hpd_unplug_handle(dp);
> > >   	}
> > >   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);

-- 
With best wishes
Dmitry

