Return-Path: <linux-arm-msm+bounces-97975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ENYNbATuGk7YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:29:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBC29B60C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F671301A9E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4352B282F1D;
	Mon, 16 Mar 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhjEHBtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnFt5Ke4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF027EFEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671335; cv=none; b=PgHPNknpQwxAdV1QykdhIy0A3kgxSRThx8aIWGenqmVizNfpPi9V6JY5J2x1HJxLs5N157vx114u1CV9NPL8F1E9ItCrcq9sKfdIhMlUlZmW8xA51YO/RWoHkMtbJ5xui2ZFIdW6Q44QkWoaQt1EwdGTmR01eux3LxMwdHP86lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671335; c=relaxed/simple;
	bh=Oym9n3oxWFTZA4mqcq6fboCfClVZaOxQO+lnzTgtiro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6t9v7EjWshzC8CyXGt3ci7pAL/xBHl0y3ZA5mI1OwkmKbHVE98+J1+EScGtjHSyPrHcfrS9bgZMbNMGogLIxQ+ML3E71MLs2Zp13X9d1/viOlbOAYGrget1OefEhp+TfwMgQ28Y8/VXD00yqiEgCssyR0C9Xte7cldzh+efLQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhjEHBtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnFt5Ke4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBk8L3323604
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74yO8b4S84lStu/3hVA6Hz5K
	7prxIWx/s9Fs0CUTS+E=; b=hhjEHBtx5p3dyeruEZdRN4ggAXyN461Gk22VrDN+
	8EelU2nKWqabHDVDUBlfaJtJjTrzDz70MRMsM7wZz/ZUUeOfbpJW05jp3Y7hlWn/
	ixjnpysODldvCgVx5/SWktoEiG6CDvEcELh3x2IHotIk+baK55gX16DudY7XYypm
	4Gqk7TdmWQFX+IiO1iYDHPpjFabchXI6s8m/n2vaiuMANxrjZZVc3hTb1Mf5L3Oy
	wiskPzW5x3vk8ijnY0ye7xKu2kjcZ0bDbXY4XOn7odmuNnlRzCNP2tLWYFcp7d/x
	uJ5kmh21aegCO8axkKF0ze27gAyprb7wKJYOd2YN4YBgSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qp9m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:28:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so3000127085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671332; x=1774276132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=74yO8b4S84lStu/3hVA6Hz5K7prxIWx/s9Fs0CUTS+E=;
        b=PnFt5Ke40Rb/jsg3p7zYF3bgCdDGhJmC5mxH3mo8zGmzQ3TdPZp3Q+SfSaJ8WBqGB5
         QvDLENm4ctWgL6ovvmbRZm60aA2IN4V6XjklvgWfmiG8i926lrp+dvasq225nsfiiKLk
         LrGJH+vS6C82S4Nkd0KJM4FJWwoadiVC55x4YqDhflhpiKHuQnS36YNUvRYyplua3as7
         1kVMYjQ27GvysuVsQLEWWh1nRQl+XRVArz9agV0Kxs0mlcgQmBv9wHsz2NrDU8ZApDnT
         50sXvC+IpTvOrNjQpA+VUBCjOlChqoUUxomP4N6sSekbcIOPOeAP+EIP5o59dmuofR1c
         x1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671332; x=1774276132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74yO8b4S84lStu/3hVA6Hz5K7prxIWx/s9Fs0CUTS+E=;
        b=Yzljawo5dxsBdu119PZSW3Om/ZsiKrDDMyxMrly9QO6Lvul/FQrvHwMrVDAQWCA3Hr
         PhUfpj4celiM56yGvARoncyZKok+4gmCSR+eM1ElFTGYnnQ8R+IgsX43Vg085svIRy1d
         /VuShnU9ZCRi6cinnPMXsaDte+67X/jfZQUUnCHcG9dHni0SZBILzzj/DXMbMWyHsYhl
         qJAOS2lxulpLSaN3UITVwxT4T6T8EbnADWqMnfj1APxJ3YZ4myj1FIC/FDyLlLCdhKmL
         FnNJumbYtbZ4Uj0jjoGFt52lu1iqZ2lQjtdJP906Jc1C3UaHpn1mf91TeXGNOv3OxH/6
         DWxg==
X-Forwarded-Encrypted: i=1; AJvYcCWPxlZ+1y2w/p6MsB2XhJbF9AsCRg8w+gVtlvd6t4Rjxgv6/yvWeS2usDSxVNrp1ROExMY7WWXwvJg4TwMJ@vger.kernel.org
X-Gm-Message-State: AOJu0YznV5FTX35gQMVDGb4dZ9uSlSLaDAwWw83yefGhndLRTZoKkfR1
	DgrpaTp47EDHC8Edy2ZdO4fW8lETENvoVn+UX9Rwk2Mx0gZMC5Atf5Qk20zfiKcVM1M+DelVaaJ
	6frNH8XRWk8KVQMeoRfuMVvQelRlhbTGh3UISw/wLKvmHk9Q/FRLfpa/Xfh3IQN6uISxh82NBa9
	zH
X-Gm-Gg: ATEYQzxI61RXAn23y8V8wFlrup09Ligzs+OPpnmQB7hkKrvabWJ7iJTh0nnYIWKbRlH
	9AtNozOB/K3w9q29rc19uWhb2U6r83ATxI3XANMeNpE/hvgcttpX6BJQ4rRwKIBVDfyDESkDJmY
	T9isKEDtFfTS8W6ieVCvuGkWm6AACMX6ZLMZlugdL+ESXgXiWqY1ncRSlO/xu2bavyvWsX8RKpT
	43p/sV9ErkGrQPlbJ3TzyqRin3kXBIzB5HEPu1M1PxtIrkspifixQgvdutx052vkKoX19Npg/HE
	l0wRw+9bh26GNDCiGcuGEPf3yLqeNYdgaN0oXfjCy7qSozCnrqaknUlVoWE6GgjTmtg/QPao6VP
	oiIkNPQioV4HUElfIYF6h3caWSpga+K+qXVzBZwn5ULU0HGxPOV8LJE4FrbNUXwh3R4NS4+mjsg
	5KV9HgD4rVcdXi207kFT0hZs60NwlgXqJM8gw=
X-Received: by 2002:a05:620a:4041:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8cdb5a83bcdmr1632416085a.21.1773671331786;
        Mon, 16 Mar 2026 07:28:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8cdb5a83bcdmr1632411585a.21.1773671331271;
        Mon, 16 Mar 2026 07:28:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5f33bsm33396071fa.27.2026.03.16.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:28:50 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:28:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
Message-ID: <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
X-Proofpoint-GUID: i88lm3L9CrFRGVmjUS1Yfh2a4T5LdmUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXzrDQssh4yDkp
 oQ9DKv75yBnca8gy6FNnU5lrlvAmZTSFilILjmSlxcy7NULOcTjH+xT0IRlvE5llcXLLJqlkz1z
 yCE2FK7rS3fKma7bi0MMq+NDfDK7VEPRbEycQnSvqeTHCSsdN2HpQ/YEOs1+OGunnbRjAgo3gY1
 nxs8Dm2uTLQ9RrW4B5XIruNFQ6n5RawFhXf7lJH6Fq54VrLpGOe5mUGt9aW89jmmKbz1P2pst8i
 AGcDEzUSYIjkdIHVaPlO11jHRnUj9N1HYNoJQV+7gcIcxP9d5QTB2xNpMOvM8n8LBL1IBHCuqZk
 etZN+/5iBRNxakxLy06beCGbNJOpr9haIlRObsQdotbZpFjuh0Yh62aKd8rlz0+07hPWAJR1pTM
 RFG120JH7B4msxSUk8ndIKtuShfIlqEc88a3NwgASaQjGZ/k55BZU4uKUOAhn5yjap1JxxQZZVw
 0OQifVguENsE4IE7XUg==
X-Proofpoint-ORIG-GUID: i88lm3L9CrFRGVmjUS1Yfh2a4T5LdmUW
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b813a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=aLg-ZeeFEV5HabecVkUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160108
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97975-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9BBC29B60C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:22:44AM +0100, Konrad Dybcio wrote:
> On 3/14/26 5:14 AM, Alexander Koskovich wrote:
> > Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
> > GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
> > to family >= ADRENO_6XX_GEN4.
> > 
> > This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
> > an incorrect GMEM_BASE which results in severe rendering corruption.
> > 
> > Update check to also include ADRENO_6XX_GEN3 to fix A650.
> > 
> > Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
> 
> Hm, that commit also changed the value for A730 - Akhil/Rob, should
> that be changed back?

I'd say, I'm also surprised about something being broken for A650. Which
path / stack uses this value?

> 
> Konrad
> 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index d5fe6f6f0dec..0ac3fba5c277 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >  		*value = adreno_gpu->info->gmem;
> >  		return 0;
> >  	case MSM_PARAM_GMEM_BASE:
> > -		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
> > +		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
> >  			*value = 0;
> >  		else
> >  			*value = 0x100000;
> > 
> > ---
> > base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> > change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425
> > 
> > Best regards,

-- 
With best wishes
Dmitry

