Return-Path: <linux-arm-msm+bounces-99409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK40IwSywWnlUgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:35:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012A2FDC7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3421E302705F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE77D31D381;
	Mon, 23 Mar 2026 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgP2qOHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRfEUfT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D231837DE8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774301691; cv=none; b=oW0al2XE4Lve/R4IoADuysZXRzhMaKnP4fFAut7OnihmoRSjynRl1YLTiQa5eRw9ZN5/yFQCgwTZn1vu+BYH2X1+mA+9ef02hSSi/ijlqA1qOuqB7Ndg5Z1hQz+YQypTR3n4U9lb48ab6w7cpfJFy1dlOQ9sZ2Dd99iMfjlOP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774301691; c=relaxed/simple;
	bh=V8y48RE/07i9UvHf46rRjTyzzRDAxsjTOb0lW8vOAn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONwXTBzIg/OgY0za9MR/KrNUwF7wIlKk+W2m4PQ+G58K1kjcK7Z73pFepPHapPWr2ukRVTmDxj4RAU6TrAwVpEt+JIdwRQQNWxJ1uhnzOV9VeAGsgOhYoXOTD3WGGiXixNwmsKx8lRVBuFP2DPeH7UGNNh4BSs4aNqB5Tb6LSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgP2qOHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRfEUfT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXxT3634275
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XL/mxvhwSK84ExUEbd63Igwq
	6w+EmRFKM9+Ygja1XaI=; b=AgP2qOHKIk4ZqiC0l+oS4vFqYFzVwQmqLBwWVE0h
	N9Tz7hpYt9IjDIjpinWgOPiezehmvzg+qUMjI3qs/O4ZK0eoztUfkFOzoBOYG75R
	b7MVGzuBwW7wTQJQU4kXcDTigJ7LMk4G+tfBi1iF5t2lcJhSKNYI2Abk8Maraafo
	WR/aZFHChAw/NNDvS5vvVeWkx7AAgaorfI1B+5I74tICBEJbKAw/+cZKPFVenaXI
	vMKMXzDoh4SKRExz3FcMILwXjLf1Nts/sTjZtNNMlI4OZ+Rdz7LzHaNOXdPc8sQP
	6psdI6/RRZFwA+dI9HhNyTAArjlm018s5FccjbLTdYh3tA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4j46j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:34:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so152537971cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774301688; x=1774906488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XL/mxvhwSK84ExUEbd63Igwq6w+EmRFKM9+Ygja1XaI=;
        b=KRfEUfT5Ofm/ceN8U4YIQ8KkE9pkDgArH5ya6Bl1ZyZ9Jb/qYwYft9DZyejJAc4j97
         mZeI28mPXfKP/K/0zevuXK1ilwl4u46x0tsqlMHuhPEXlcElfTOY/w7bx/I1fonF25D5
         ++NlW/Hls01NlLE/14bUhd837ovz8xamc52Ps99Xfrav2y8hj/G030VSxTCe0JaXYdhp
         49lxvondIJHkuxzqICTFy2g4fyWjL6ARm9DYsiSJzdnZwrUtAXJFtz+44+/9kd5oaiBr
         tuEdVQHd4PDNEnoXP1VpChv1f0G872QOKlC98mG0pRqJGpaj7JBNfOpfkK8HGMR/JOuE
         +sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301688; x=1774906488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL/mxvhwSK84ExUEbd63Igwq6w+EmRFKM9+Ygja1XaI=;
        b=s+YnZgp3sCkiG13UCcYZEZIKdNydLPWTqbixC6du2ijHQCs6ctkiSyL3WpmAtfDCvr
         PFnHUbnWUv78eX31O2HkXtvEbyftxRLvEsX2XMaLpoFp5EARzs2uva10sNSjQ3QX5Uti
         GCdsIgM7LtjsvxTkdFTDA63Cc4tLOP3iGrFMsOWIx6dS9PQ2+nTrHMnDBxHjaktxa/kg
         5LaOAvXXcb1kvz4hA8qcGIddRWpgd98njCgB389JgloXTGHGbkX47kMMFkjmL+Ho679K
         j7GOVJahx1junDV2GidSN8TgPmAipHyd9OsrS8AVN2EGlSmItBdZhq5hLl6NXe4rnvH4
         cFHw==
X-Forwarded-Encrypted: i=1; AJvYcCX9O7mtiL7YOx32L7G3puP/DV5WWczdt5nnNDs3Tt0SlNowIRPppPjBmv1SIPFjvq7bsifnAwAbFGPhXu89@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1eCG26Qp9JMHg/QmNQADqYVwP3Z4upg4Ie0nP7U+mIVwiMLB
	QuM9M5f5D5sHJRUoOSSf9GpTNQWR9l31yVF6EMNfuQTVTNaNGecbeWbf6IP+lPyKXA10WLwv4bT
	lQiTouhfJ1BkCtwrTW+2e2UIXfw3Kte0vDYMMg9Jx1Q0vcP+CgKiyshWuC37a9wP1ECJD
X-Gm-Gg: ATEYQzwVNb8nlv4jP2mPfg9torXLnjzOE4hN0F5B13yrdnh2P1RApcKlQPVF3om/o2H
	DZIMROEmtr5Q1Om3qJPk/kHqBpHflnc1+ssUydUE6pq24xH6qsY8avQHHngO/T1D25KIrISIjRN
	tAy6XI+zDAkdCAfyOBWbQaczACILYFZ+Zrso1mv2uHdEs0yLLgPfg3uOZLLpq0ot8nPbQzRVcZh
	1RT/CKTN4lIrGYDVoYrbpnrbc7jl7TSeH1XH8RLtOHOqImaplFEaZMsKmc5Oc+L9G/rb1XTZvAh
	AG/J8gnTDoFPd3hgIbq70621pbQOh1NYclhh9ZtQrBAr/ET9F/3gSwTdquP8jE9gL2YIrwl8inT
	SJLOgdszBMErVGPS4MbiD9uYCbcaCKDckZDRsvOOz10YW2mqstTN5/YC1KMO/lXEJWPN+k9LXW8
	MKSkAuaaUXVjthMq2oGMQKOuyeh8HajYxUSEI=
X-Received: by 2002:a05:622a:1a92:b0:509:1ffc:c538 with SMTP id d75a77b69052e-50b3740caadmr226535231cf.19.1774301688143;
        Mon, 23 Mar 2026 14:34:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1a92:b0:509:1ffc:c538 with SMTP id d75a77b69052e-50b3740caadmr226534841cf.19.1774301687708;
        Mon, 23 Mar 2026 14:34:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2967f8693sm82220e87.19.2026.03.23.14.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:34:46 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
Message-ID: <x6b2miikgofuhfnrgnuf47mrrcbz2fkvht25dilo33teafcsax@v5f5j2g2wuxp>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
X-Proofpoint-GUID: EVO02eesaAV4u7Rs43sg-RX_n_dJiArd
X-Proofpoint-ORIG-GUID: EVO02eesaAV4u7Rs43sg-RX_n_dJiArd
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1b1f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=K4oKIo9cefoP7Fos7hIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MCBTYWx0ZWRfX4M5sPygwVpxP
 KfHq3W1diUhVCh6tSUHrWhNSGgyQzvRCLEycYQmdL11qacAuOONYzR4PtHinETRNtN3+MkPTxUj
 E3PmHTnEG4qfQyVVX+okj/VZlACM9zAxiB0UseGp/fderSx0yaYBJYFUM8a0HJ3OXDqO90g/uVf
 JnvoAIVYaZ4xVWzU3eHheeHJUtYPkSRzml1sSwLi69u8X+byc4DzCRYm4IdgPU8t0W6d4SwQXpa
 kwv+vMIOehwyVL0tq2k3iX1etFi2dOgXrWrK1S7SGLr2gBjqOMjBWF5fyxwMxdp0zbE0bjExRlk
 xyEdzY/CtnoJpYxOgcKik4ZBgNBt3Uj8nKghZ2zilIT9+REdiYObr7/O/R/paSBHjkE8Y/NIUp2
 sh2Jve3RXBJhySaogJezkOMyWl/JEo/3PJv/da9qMK2DRlE4wuGEm1Gd6qN4fYa5kzUYQDyTybq
 lAtXl/Xo1LimlHSRdvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99409-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 3012A2FDC7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:42:24AM +0530, Akhil P Oommen wrote:
> Adreno X2-85 series present in Glymur chipset supports a new mechanism
> for SKU detection. A new CX_MISC register exposes the combined (or
> final) speedbin value from both HW fuse register and the Soft Fuse
> register.
> 
> Implement this new SKU detection along with a new quirk to identify the
> GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85

SOFT SKU -> Soft fuse?

> and add its SKU table to the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  9 +++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 ++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
>  6 files changed, 53 insertions(+), 13 deletions(-)
> 
> @@ -1213,10 +1212,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  			devm_pm_opp_set_clkname(dev, "core");
>  	}
>  
> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
> -		speedbin = 0xffff;
> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> -

You have removed this from the generic code and then added it to a5xx
and a6xx+. Wouldn't this cause a change on a2xx - a4xx?

>  	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
>  			ADRENO_CHIPID_ARGS(config->chip_id));
>  	if (!gpu_name)

-- 
With best wishes
Dmitry

