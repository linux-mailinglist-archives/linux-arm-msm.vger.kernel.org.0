Return-Path: <linux-arm-msm+bounces-103973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHZ1CZWk52nX+gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:23:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7980B43D4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0A42303A9D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC12A363C40;
	Tue, 21 Apr 2026 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdQjvNCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajjTpaPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8212C030E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788578; cv=none; b=uOC2Olir8TltFLaxsr/UzlvMW7/zx6AFu0GJ7nD4ycvUmkc6ZJGmrLuHtbenoBui+MIj+kmvd1E4F7t0EB+CcFXb6sHvrNtjORI5q4nn4KTzIItYhkM47sUMMRwvYZ2sgR4tEXnOPl2VbCQ4iCxTz4X7eQd6AzXMiII2bg69wCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788578; c=relaxed/simple;
	bh=9GMKa/UAKike/KKgsnb+tj2TtGwYGb50AXLfNrYm+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSsX7TTgsGEIpNsjuTLBRZBCj50fqugNMT+6lQjeoFXh1Vq/PpDunamaU8sMbzweweGEUbltaJ1xCp7AwIsXB2IDBl7cENsBtzALUM4wD+2v6KooZ+z2vSEawjMb7aMWsco/yfdjCcWy9KIP471ek9ZrwCi0MQPw/BtLrxUZl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdQjvNCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajjTpaPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCLEYs3257313
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rcOVoIL16qipe3CVXLjQUxem
	aNCdSh2840igdyFaeuw=; b=IdQjvNCxZC7U+dvO33PUSAJHOjr7aHUIrp2+r+dh
	MEvvhpt5rzCHZh1G+yFFZETBgG3UWMHqyvxT4ji/C/KtnNwpGIMKPo0tOdfHKWiu
	N8MalkSifZzK0VYr49Iys4tK7Nc/eKSeIWZrRyHwED5qaB+vu2nj7leW+imQGSPs
	RnVc/Gj2622bAArQii9wuVbsrnBbLaYv7D9THYqWhALLruIXa0n8anDo/VO+yCI3
	gCCPeO/0gAdd9+tub+K/jjbyShfs4swwX12cqbFxlFt5fzjxY3tC912HXwIxLDIm
	WYBOfRoV6KkUasnkccjfMWKvcgTZ+V3lYZ4FWFJ3ZyYiKQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp3naa6e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:22:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61002acc895so2382218137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776788576; x=1777393376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rcOVoIL16qipe3CVXLjQUxemaNCdSh2840igdyFaeuw=;
        b=ajjTpaPKTczFMkfnbbK3zf2m+NzvnEM2EYUfyYYIRSzb4zeJqAOLaSfc+NeLjaf06f
         ux6P0QZTbEJDc4Hj2iIUswJLv28QGkUQGu1BK60jmXeTK3agEaZsczDRC3t5z/f4g3V2
         ioqtISM6oeaPNi+LD0PDk1tLQrflkj9NSKD0gFQcOMgktaxMo5/wJwrEYxwoOWr7XEdX
         6QVrO4E7lDiqFwHv0UMQBBSZXfiJTByyjxo494F1fOriOSAYVWkTm4fn77WEuPE41Lp9
         rsQqwY9iRsDBs+FbBtbIDKHsd3dI4oKfdRBMy2z7r6IBoBJBH3BBl9xkWvDGd6tDic5r
         +GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788576; x=1777393376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcOVoIL16qipe3CVXLjQUxemaNCdSh2840igdyFaeuw=;
        b=X4Hswh/GixTl3SysDna/bIxqnj8Y3a3yAcE0B0RgBA2Gd48Zd6jTFKsULGfxezrGxw
         ca5Bs4vohGlmoIoKG8dZImx5eFPCgP94VypS6gGCa6J5BsMUhJbzdmL7kYMVuAUNcyU6
         xUV+GfYKaTr6EgFZgYgSvB595Imm4K2Rd1yy2fU9QZuv+EUv+HrlC7lhAGugl6s2ty6R
         WdgoDiBn8fRcGHWaV9VkqLlXnPyXLtxEKQhWR3i9v30OViYOI/lQBbwvtdN8w6AUq3zr
         QocYrBFK+yCIspWsY/OdAf6vLpji+bac+X/P8s9d45o9EPRUDevpyU/91iNoAK7uLpb2
         akSA==
X-Forwarded-Encrypted: i=1; AFNElJ/pAIgI1zsgIfCP2MwT9bK5ARveq7HZRa4EYLKVl5alncXclvuFPh+ZrDJzCKqflcTkFiKEDmPAJwMbzAw8@vger.kernel.org
X-Gm-Message-State: AOJu0YwHdibz8Y2DtIwytLg2IPVXDAIZ3ewI87O79HLVeMEfNDm6FvRb
	Tf0p80NbJ+XT8lFzsHFc9s7ld/eBS2CT3hSmrioIxKg9OShRk1o4lWNF8aL0uKAKKyfnPRUP7BL
	PXv0jO2QBX7DjNXOjKspuapzKYllSzGX8aZUsJA6GJfsbj/4O+JAGxBOW1ybcrn7x9G9V
X-Gm-Gg: AeBDieuHZkENnOFsnZxXYeLCF5y4bJ55TrnkqZZ32thwjYKBKQW5v6gis3vxIJJj8wE
	O67s8GwYX73VJ1mPD/ryHSyia0TLyFQZo8uyIv52AvLfvjN6NQ+kF5ZG5mSPpTbcQJmDw18C6eF
	trqP1Y2ZBk+9+3vE9A1xVTq9XJYvUtBua5jIqc/WiCmcOUKxoyxA3RbcXcJ6t+arH084uZETZo/
	WQzfDj76WdCsJdEJb+iQi3ez9OCM0GXwXadgTgUv5G0OVE2vtppftxepfALQbOJsJXUcE0NfvcM
	Unon22eSHiurjrLFG68I23gEU7MX8JqSGwAQflkhnR1qtlBqIjuJmQoLmVbN4MVg1pgyunkk4Ez
	aa+LqGfIGslYwokVwH+rwBEoszMBI+bvCsWjHJA2nlqD4q/rRLXUhScsOGk0FAdCgRkIPPJxQhk
	0sgJ+IZphq5+3BAdPhxAqODJpQvWj1cFKOitHUvxltGxvGKQ==
X-Received: by 2002:a05:6102:6881:b0:611:c935:f9c5 with SMTP id ada2fe7eead31-616f72fd3c5mr8181429137.24.1776788576100;
        Tue, 21 Apr 2026 09:22:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6881:b0:611:c935:f9c5 with SMTP id ada2fe7eead31-616f72fd3c5mr8181396137.24.1776788575695;
        Tue, 21 Apr 2026 09:22:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec365sm3743851e87.83.2026.04.21.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:22:54 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm: fbdev: Fix error reporting
Message-ID: <qenwfdjh5yqjgxikqsidw6gcgzmg22g5spk6qerlqtqvidbxc2@sdie3l5zp3ez>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-4-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-4-tzimmermann@suse.de>
X-Proofpoint-GUID: AWNnjRl7N4RQRY3CMnV7H6FzCy51uzu-
X-Proofpoint-ORIG-GUID: AWNnjRl7N4RQRY3CMnV7H6FzCy51uzu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2MiBTYWx0ZWRfX4UvBihj/CczX
 0/Ny32za20OPr6eM+JDmnivf3yEKZ/6fJ0+HutIdjm52QW2guZetlYAVQGq1gzJhpManrslvZbf
 F5zYKsoaoslJBRqFZXnU6rixUAmRU8/XuUSe75OyWBQVrao88ubNPVv4h05CJn7Qt9THMSTpwd1
 GBkD85AoRoiPfuMFn/HujrJpAIx2cI3gvgHiPMwROupx4uBaeRx//CRvileczG8maHgXbx1nTo7
 gnzuiM0tvF+VUDGUnyhOW1jBkkWJKyHNI6BDzgVOJp0k5XAdl7E71ZD5E2SuprXpyu4GTZAvgII
 YVgQUg9XJ5v836N7nPhHkhJkUmDKfMT1swjHIPbQgL57R9NNsaw10hGiAomOlb88a1gKgznBiGa
 WRXpBHSyoCMowVAdZ394mzz36gbSVVastTndKg6eyfVRsCajXGS8jCfRVEGPD/roAVNM8XnHssb
 EnFDSptYmis2P7I0OjQ==
X-Authority-Analysis: v=2.4 cv=O9cJeh9W c=1 sm=1 tr=0 ts=69e7a460 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yEC9iBQ8i4zJ9DQTUTYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210162
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103973-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7980B43D4D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:16PM +0200, Thomas Zimmermann wrote:
> Replace deprecated error reporting in msm_fbdev_driver_fbdev_probe().
> Use drm_warn() and drm_err() instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

