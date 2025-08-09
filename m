Return-Path: <linux-arm-msm+bounces-68166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D3B1F2FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A029582C41
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0F827A914;
	Sat,  9 Aug 2025 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3azN5yR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D769275AFA
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754726133; cv=none; b=C6zvKtfX1dNMd3BoK897GmkI08Bq5s3NfY9AoJv3+q2NIaLJHexEZG42cMGyOqRwZqzjEfpaK42OzRozdMMq6iY20JtZ4wTWpWZ5TlUCFLwHE5+9rCH4Lc8Tp9cyUwchY46qbPqBMyPSLjAtg5kkGSFLWEOWYg/iz9RIvYK0q48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754726133; c=relaxed/simple;
	bh=MEvMm/z0NSKa6tXqHI5JCOKaEI6VhdKm81fYs4KeO+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asp+j6F+Wl4eCaPnTnzAftgX5aANJbYPqFukpc92R8z6qanPLi2GyNozgCuTOI6zOvTtsI4EP7ZuQL+cjX9fFoOP7Jo7+0HQ5tUOSQkMo5tykXOqmUNpiKvRmvoHEpfm2Lcdo8qcabVVa8+mhN5dHK6Zd5tBjr4f1FyJ7Wk83Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3azN5yR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793V7Vk006538
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bpy41yTW5kRsP7L2ucrV9Bxz
	+ufAx1/nlB3z+r30uRs=; b=L3azN5yReOvTEHISGrnQ1UntSANurOTQT5AqzaY9
	PQLv+vKNoOlcpr7LTQiuHi2gMPlcGhAGYBYi5siKR6d8IoeWxWBcLA5QTA0XzbDW
	XlhacyWDqFfoRMH9YDI2i2Xeq/UY8KInMwyT/Z8CzT0bAQWBN2quRFpSIQ8u7PRa
	slxPcjxFlSY+EJ+liNs8DQtMertIXlSplXdSNrkFBmiet6O359ajuJoCPDsukY6J
	+J3s+ywvucLrI7+I7qJ7ozOQPTOEdNmSWr9ymB7CfYLxO1kbRnp62WIUqXDTrEsM
	ayjKPZ2AYiD12ZAm8iwFPE649siuQ8W535y/Wz6JJqE93A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdura0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:55:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b081d742d9so101306851cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754726129; x=1755330929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bpy41yTW5kRsP7L2ucrV9Bxz+ufAx1/nlB3z+r30uRs=;
        b=i88A73rpTzYks27PsaPggEF6eLFMaVmkosIO6JQaygkQvn5Hcd2pFUPLrfXyKMMzGA
         F4U81wR8hutU+Q/DIVkal9756UKrub7ARCi2Ird8u8qSCu3oV9ZLoC8Dr6/ceQqETVKG
         N3qZHlL05lnv/KgejGLGB9PoLKus37UWLSnQMKoIlhyNoMyiGJk/9kaiNrs7RVG9osZl
         HqPRdvbFwv8fRAyruXhYNFJ++UUnHLr3YYqEXBPCx4IptFESTJajCtqvG7Fp3JcpSzUo
         eY2iTSYx+SvY+k66WqI1lmzRCdepWInyYFDRxEYVRYINUmPBgVW2sNMs3qrX5/6RJV4J
         wM9A==
X-Forwarded-Encrypted: i=1; AJvYcCWIjXkXb1FKLyOwg0X8E97Iwf2SAgV1cXwA7pHy/AWK1G+QiUYtggVEwPlkZ3aJem2OekrLC6VKmG/UFR+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4mDIb/ZDQ4TmT6W4M67SI8zML5Q/c3v5BNxoqyHIZpYjJTM+G
	9J8QMz39gN9YSmbiXzlwYS1gAZVJPDHZRDxLThl3a26yfrBcl+njUi0cUxbmgjOQxwvK608yapv
	x4N9Xa2j2hjq3Nyxg7+eHGwDs+PiTLxSD1O36MaAKyG+blgsJhC7u1OctcN1i26/Dy9pv
X-Gm-Gg: ASbGncvtNXcEf0vntSwxW6OUoslTvMFpcfwgcxIlUo5j89EKVOSDg414iz2dsuQYxZz
	eQD0xsclhaelGm21vBhoYvECtzv0Ey6VnMVeXQ5mjMcikFNZS9a4oxuurJpJKPZWsqAxduWl6U1
	0tCm92Q90EACA32lUX3taPYPeqn5SqDUgUcml50EFAf5rzdJXbLejEjuFVG7Ew90Dyw4SL6A0eS
	DpzWBwAcrHV7t2pIZ1YVEqwrq5aNupQWWKora64y9FJF9m9oitruoq1ZHBfpb7un4x6O3bzcQvm
	KL0vOBVA8C+C/D4u8lK+4xCKYiX9HU6Xv+cK8gFOj18pYzJBqpQsbb+FrCqJMmdi+xtkyQHcMl0
	Sw+i8PD3xcA+YbK9Y4CwdBJtXuVKiFSJ3fxk1E5Ah19sA+AR/TCLl
X-Received: by 2002:ac8:7c45:0:b0:4b0:aba1:d716 with SMTP id d75a77b69052e-4b0bfcba7b7mr22351651cf.51.1754726129087;
        Sat, 09 Aug 2025 00:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWh0wH/XYu6MxnL9BGa8/d04wIKlcDPKSSS431MPGMBx8HxPe0UWHgnixqCdznmpzQTN6fsw==
X-Received: by 2002:ac8:7c45:0:b0:4b0:aba1:d716 with SMTP id d75a77b69052e-4b0bfcba7b7mr22351431cf.51.1754726128504;
        Sat, 09 Aug 2025 00:55:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333bab6a92bsm27111fa.45.2025.08.09.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:55:26 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:55:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Message-ID: <bxobv4ofetrhnxa7n45fmm3sllqgy37fzgxnyutm3osjqg4yhl@tvdsf6mghuqk>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
 <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
 <DM3PPF208195D8D863A5A2E8A151A77A7B3E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D9DF6BA02300F667B1967E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D9DF6BA02300F667B1967E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6896fef1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ft45mRQNhs6EWNLFJ_8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FD8y6gTBfVjXVT_HGomIflEwyBPblCRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXylUv9+aci7l5
 uz3Thhc5ck9etSpqJRy4lDB7lKa+wd+ekQc/GOPRe/autwj64k3lVicir/QYPEj2GZ9flzNB+f/
 80y0IOwTCl18zGQhSkJofvT74HvvEDwzy4EG+bOuyZ8G41b0t6eEhtobnrELTkUBf76T/7umiKG
 AYTW2J9+WYicb+cTyqXi3R+N547fwme7UiITywwFfpyJALIterv0TuEEdfD6fkYHXMjtA7TXtbS
 ZZCXIuPBShPNH8qNLASEgmZKcGZg/M+Nt0Jyjq05zjVRAoMDbOBiux9475+P8x8UhyrTt6teGhi
 e5ksBh61IeqF5iELy1pQTkLI5i4T1jKvEg4YB7NSf/+5UssswwZdbLtQQCFqWUJkcBPT3mJDmJy
 4I9ozHIV
X-Proofpoint-GUID: FD8y6gTBfVjXVT_HGomIflEwyBPblCRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Fri, Aug 08, 2025 at 05:24:19AM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Kandpal, Suraj
> > Sent: Friday, August 8, 2025 10:35 AM
[...]
> > Subject: RE: [PATCH 8/8] drm: writeback: rename
> > drm_writeback_connector_init_with_encoder()

Please fix your email setup to not include this splats.

> > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > LGTM,
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> One thing I noticed was after the Rename both drm_writeback_connector_init
> And drmm_writeback_connector_init have identical comments both allowing custom encoders
> To be used now is that what we were aiming for with the only difference being the 
> ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
>                                        wb_connector);
> call ?

No, there is also a difference in drm_connector_init() vs
drmm_connector_init().


-- 
With best wishes
Dmitry

