Return-Path: <linux-arm-msm+bounces-76661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BDABC951D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 15:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2BB1A61D30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 13:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DF18528E;
	Thu,  9 Oct 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgjC7lf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3A2C21D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016782; cv=none; b=OgTyyBe3GYu95uh3NhCU+jO3WrBqtOH9+1zsxgVomJd+00Zmgoh6wkJsKgPvUiTRdpptpAWhGbdcnzKbiJjSHMGzmx3rkLJIdpQ7uX35CnguIldEM5VS0XwWBiwa35iZgpCdNN9nWMZ9wDha2k9YnBTgtv6vE3Y9Mz8uCC8uIJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016782; c=relaxed/simple;
	bh=6ta58I6Q1aZWuHTt+8vwHZrputBGhleQ9DK0QH2ht9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CV8HI+fd83NK35zB1ITLH7HIbZNS3GX0ZduY8J3nnYrV2vzJ9Xdo0aB3rXSoQVdeecDbjSfdHfbOkjJ+qZtb2k9BgDoyN9D9nH8BCzjUc6vAwiewjC1UKf4YvBh01jzdLIm4+EzqsqWW2noVw8N3OQguSWiKJuLc6R2oGkykBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSgjC7lf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5998VC6V032110
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 13:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RRr9DsOTbQL+IhH2cQUogvPD
	iLS8DNEDEbNUEWkTRTg=; b=NSgjC7lfbBgTxi4WQX3tdtzkY/WqL0mozpo5s32Z
	E/wukCkntqZq08uD5vOClESI3KnKzb5bsudg3ABvfFY0HOpSRctfklIdnhQTUW45
	MhfWkYbbM102O/ipBVg9zILkwap0aipTxBcPTcPTUOFrRoQRBOKDJ1nSa1KvFcMj
	WyPpeV/dOst/tb/kSGtNjerKKCelofJuz+VsmLKB9JHUclgjriAnvsvR84HbdOPg
	Kfi6UDLynP12r9cZITunI4XKApAChyAmtES3Cy7iMbnL9h7+RSTii5eTrjj9CxWE
	94Xt4f6BGN37Z/Nu27kDJckZyr5bMurQdBo9ytUJNm5mDQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49p9m0rw4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 13:32:55 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-54aa347b2e1so1848085e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 06:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016774; x=1760621574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRr9DsOTbQL+IhH2cQUogvPDiLS8DNEDEbNUEWkTRTg=;
        b=QdDhrntzaUcOyccgqaFjKuJENAn4Zgz0uAd4pP/ZMwp34FHXlU8q+awbVeZZbkRTxA
         x1cs7037CH/KVxunNb5asypdde19IcIqPNzosOQloubzNNYqtTlb4VnajCg8XY4wwYHC
         6jiCCElXExzf9k3I8ZCGv5z8Y5ITAi2wS6mmZPnpiSLhbVBdEG7TO7zxzxWKm8AfUtq9
         xTqe3PdMVAXYfMaeELg+jwX5l1EuVO95giRqlf5zcfmI11WcVTt/cuEyAS09MWm41RMb
         +NyjMTUFN0/9rcX4wXhWX87WvYBk021GJ1Wr3gVCnPlYCIIfwe4w5paVYRD3cUq8Kswn
         ppTA==
X-Forwarded-Encrypted: i=1; AJvYcCXTlBYgBj1sp1hOfUeKtpCke6RNk16TmidN6fOSbZQ+dPIBwoXWOTTeMIMRMAAZwR8Bfd4VzyiIOkQOiOrB@vger.kernel.org
X-Gm-Message-State: AOJu0YxE9ciuS6S9UMr76Rik0pHtTxxti2poSH5FqvogjR9IaznBiPxz
	Pzy08pnJmaLWHf6MDJC6l4Cz0dbv9dXSwF6JEHc17Ou7vbAoUCirsyysQBGcfliOkZUs9ePrBHK
	0WKlK/Y9i3nMENEoroE0yJlJAnK0OoMgCxkRdjLYVlTit5EOvphEH6ds2cA+Nk4yGMU0f
X-Gm-Gg: ASbGnctVb0I6pHs+7WQ0XT6myTrACgwHLfdv6Xm6Fwtg5nhP93SgY2j1PdL0k791Fjl
	KuKwKGRSEK9Rh7uOroeafOJYnrMEAVuirmtj2Dk761EmTKuuamW2/XartKybBtz/sWOFHHa6zzA
	3LDYHGF+9sqRlG+H1Rn+4LGwVqJ00jY+EhgZFpSceVVYfoT3nwznrED8KuwZ6Mimi9jl9VFNjzj
	0wVLmWy3v5Yu54VOCY8JPwaPgBWAOR7iUC//HLPpagpgUGUUkq5UF8Y/CI8Qo0zAgq6M7uoF7X2
	r3EWXNRLysK2D3okCb2aJYnwV98tWuI1MwPL/CUvU7Ufq/N8YmzVAnh4xTsidTxT+Zj3AVllrZP
	m6Cn1yFsaaiPu9BQY7JRneKwlgcjxlargUm2pPAesYd+JFwdn2DwkCpXNIg==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464554e0c.15.1760016774168;
        Thu, 09 Oct 2025 06:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF11oySDBoem7xTkH1oLPUQwPCox0qjhESMy2x1A0tSRyY/Tw898j/talcs/MTKAv8Q9vNTjA==
X-Received: by 2002:a05:6122:169a:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-554b8c23f89mr3464505e0c.15.1760016773679;
        Thu, 09 Oct 2025 06:32:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm1047769e87.90.2025.10.09.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:32:52 -0700 (PDT)
Date: Thu, 9 Oct 2025 16:32:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
Message-ID: <w23s7pc3diq742biiq6sah6lkps6irejtkvcwvyotbaty37hvj@j2nheyk3ir4e>
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=a/U9NESF c=1 sm=1 tr=0 ts=68e7b987 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=463TWv_Jhf9JylTOhJ4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: SPM6IVeaabdbbGyx4BYRa6uqKbzPz6jc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0NyBTYWx0ZWRfX0zaP/k09lVml
 FcGTzyCRe0aY2U6XqcnX/VuDq1aur9WhI7f2ObSQcvF8zXXgsVPFCgPF4cZDPVnV78KtWTJogAq
 6p5WqVc1n9sgwTWniYrI2JrbsfSwnATBcVS02w9sd2lsXetzeWAOHdU8h88EWLSKpgZc0D0DEnh
 ch1ublHlV73cqun+yAfSIEMU8wDm7ZoQOVkhSYhMvhTQ6c92AtJdZJ0j8HC5blx+kpsYxctdzyc
 cWtsJ+cWdHnkJgYoM2dGyv51Xt+8dWgzFUfgakl54JFa1RQWwYwp+mherS1jhs/F8zsrcAx1w7v
 pE4bh2WmV3wj2F/uUxDfViDoMRgrtIKnwFqV6x8s9g1af/fw2y+gw1+QhH90Dk5D+juehX3Wn32
 ukk1pdsKYpVqm18jURykIVDSQv9Sog==
X-Proofpoint-ORIG-GUID: SPM6IVeaabdbbGyx4BYRa6uqKbzPz6jc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090047

On Thu, Oct 09, 2025 at 03:16:28PM +0200, Thomas Zimmermann wrote:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
> 
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
> 
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>  drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>  drivers/gpu/drm/drm_client.c               |  4 ++++
>  drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>  drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>  drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>  drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>  drivers/gpu/drm/msm/msm_fbdev.c            |  2 --

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # core, msm

>  drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>  drivers/gpu/drm/tegra/fbdev.c              |  2 --
>  include/drm/drm_client.h                   | 10 ++++++++++
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 

-- 
With best wishes
Dmitry

