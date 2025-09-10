Return-Path: <linux-arm-msm+bounces-73009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03777B52151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 21:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21A517AED8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 19:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F662D94A3;
	Wed, 10 Sep 2025 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4C4B47D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2D2D8DAA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533378; cv=none; b=l01/CpmlsdUDOhO7Yb70/pdIiPNKJoK/HW3QGBmPImsPWXU5hQ1BdE/lhO7MKk1oRKsQuqtDLY4R3yla3k1T8NwVaI4f7xhtvZ/GPsbouREFYFkJrgMh4b/xwvfVIxo7YDOjX2Er80CPSVbhsZJ+T3eFxXgeJa8aAp9wdXvV4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533378; c=relaxed/simple;
	bh=MQpBZcZUOtzDMkHLZE+Sa1KfkWkiVgX6IBFRTbdmMN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYEVLl3ZoZ5xLI8dOBrEECODDpKVmg50Ml7CF32hHtrpN8IxxdSirOsIblox+X0Od9tF84bZ7aUO3spRmg7lHgczKPmRjnDjTIhQvVpdgPJ1kJOyWKSR4LU6vtI2mgtlPkFm4MadbftupFCyI8cciWn/nJG6l6ibJ5B1OgBulzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4C4B47D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgGuQ011381
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AshvdUVEa9FiNe5UYmEu3NEb
	RFgCfkbR3d/lUj1X4cc=; b=M4C4B47DFelWfTtHXBl58OlfAnb9kgVzh2KD5MDP
	u21jR0DMliki4JJ9sbq0tg/a+i93jCDeMlXDMvHLvtf7lP6zdaXEhxxR40DF68h+
	rU/qxdJlK0+ZmRfhw4E6cF67By/Tr+FieX8DVNFtWhOFAWxwvGr5eR1s72BMLocK
	/g2sryaJrEckcY4rJKMHckuG4bRdtmZmv+k7ig0la9HsVvpcCZ4RXA1kAkttl361
	6ckX43sYScEE63NUml41VV+UYRTAp8Z6clD8qHBQqabTgKjKw1MHHCSsIvDTZ3y4
	RhcJ4PBDMquA6XnTAn+tQ4uLj2dtQHl0xxkg7UDOFdLxag==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0w1pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:42:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e5f80723so148431cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533374; x=1758138174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AshvdUVEa9FiNe5UYmEu3NEbRFgCfkbR3d/lUj1X4cc=;
        b=lfJY9Hcdb8t8UsyYh/5m3KjJKII8BtyMAMrfztnR4B0J65rshILzZcBitdqBFLyQuR
         zjrhupAO30adVJ6O08IeDIVkqPnO+DmWjJnUPKBk8O803j1OUN9k4GWC10c7JNM0xvJC
         8E0hyW+g+xcQHGeApAwnJcqGL7DNVGcZiZcMXHi9x5+K7HTBSBqRItuuEJeLk6rOAHFy
         i64pRILtctCgOIggd7rfqg/iiRqm+IErT/MyvndAQhSnM58u/k4yfouUNTJNpxWgtljX
         gc95QV6y0096yjl/8MPBdniacrhRULanlaqWHijCMgT9VI3kMYPzeiROkpoB71U/fxzF
         c/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUBrMSpzcZNkBUrFMLXwb4qFcx0XlakFfyCAtT3alCrzEY1ZidlYzkaqr6wFBPYXRkaNF40JaEjYRE+U007@vger.kernel.org
X-Gm-Message-State: AOJu0YxxB50DD8CKRVCPn0lO+Stlj7+ZEDec0iZOWOtSH7EyguMCWWMt
	I4dN/H2OvfRXPeCbE02k3OKED0EmTEFZAqcZdbHynHBFQHfMIpC4p6szjykbuanzpiB50P0Kmwu
	pCNrDScr8ZrQOvDDBvaIVUaF8I42ZRXdin/pH0RBf7m8Vf4j+a2vqUpFMbxBDbaUTCZLy
X-Gm-Gg: ASbGncsEHYBT5tvaVvNAwunGs3SiNZFo97cbIK7+PM2DnLDRAf20/AZvn//e455IzTz
	rzYezbCZr3Dc6EXHvDmaCy9jSLq1JyHYdCnxasBOQKGc4L8T8JwnVW9v3ICOiWNTUZi1N5XqnZb
	OEY0RDzYUSrpJ4ulG8JS/Vbi7H6gI2EU5ev84JHH3iXkMLoUwwt5vnC0XjKWTUHUmyzqsFhjG8C
	4VcEqRdtBqLoBgeyfZIQ5WRAeVesnT0rhMBsiOjOgMblJHJeyyxU5seevYRJRf3uukaP5vei5vr
	ecxxvlzsjDhhGDHtGroAvsfkkbh1VgQIJcngXFvOQZGnvvSWI65Knlg3ODQx16Fx1BWVOeUJ6oa
	uYHT7fmG4pdCoqI6tI2wWrlToahuTbzkj8uW3wODy0MgIBghQ7icn
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id d75a77b69052e-4b5f84bdc04mr172828911cf.84.1757533373941;
        Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LM5n6q3x7O/nMFCbv+KTdGAJSRvFARvfiNuJedE701eBLHhZVYWWeXkwyAfYeYOBgycy0w==
X-Received: by 2002:a05:622a:1904:b0:4b2:8ac4:ef85 with SMTP id d75a77b69052e-4b5f84bdc04mr172828411cf.84.1757533373376;
        Wed, 10 Sep 2025 12:42:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56dbfb5d10fsm49073e87.108.2025.09.10.12.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:42:52 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:42:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
        arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
        harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [PATCH 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <curkiddhkz6k4rtbxxmmmm4oqyjzvda3xc2bc5c6dmq2c5qgkk@z6cwzap2hwgy>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-2-suraj.kandpal@intel.com>
X-Proofpoint-ORIG-GUID: w4L8_8wF11Y9w6O8SdeGdKfdmlqvCrWL
X-Proofpoint-GUID: w4L8_8wF11Y9w6O8SdeGdKfdmlqvCrWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX0SSWd2CGAXpB
 f8zmi/0v8sfBHFbHPzzwCE+K/Gz1TyYabVRD4KZaBoA+0cN0C4zIEN64QFFweQQTlMw8c3kGNZT
 Cjj5OyKD1YmGU+dVxl0bqwGmqov/X89mSvkgeePSmVbJlcVyUuENh791k0RK4RjOrUrHQvTLYD9
 GGO5pA33OMYfdcxEXGMNX7RRjqrRX+CFxchMALQWJor/tf2a3+VwvNcyXuSJlSHrw1L7W9CCijH
 Y7SDf441trmNVQ1xf67fb6s3LaaSO1VhLLoLyQj+FgPmx+WD9P4D6pfjqQYnd6HjveVTPWIzQTs
 CbWLVUkYYrhlP6FYpR9/Dn1tLLTYS9XrzE7dzQ49BLFK7iu1Olt0x725sWOflpIXiFbXuNtCyvF
 Ku/nYB1i
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c1d4bf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=ht3OSqXAj6RBLq6GiRYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Tue, Sep 09, 2025 at 03:36:43PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as Intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not,
> this is due to the limitation of inheritance in C.
> To solve this we move the drm_writeback_connector within the

Please take a look at Documentation/process/submitting-patches.rst:
s/we //g, etc.

> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We also make this drm_writeback_connector
> a union with hdmi connector to save memory and since a connector can
> never be both writeback and hdmi it should serve us well.
> We do all other requireda modifications that come with these changes
> along with addition of new function which returns the drm_connector
> when drm_writeback_connector is present.
> We also modify drivers using the drm_writeback_connector to
> allow them to use this connector without breaking them.
> The drivers modified here are amd, komeda, mali, vc4, vkms,
> rcar_du, msm
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
>  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
>  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
>  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
>  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
>  drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
>  .../drm/renesas/rcar-du/rcar_du_writeback.c   | 19 ++---
>  drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
>  drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         | 13 ++--
>  include/drm/drm_connector.h                   | 70 +++++++++++++++++--
>  include/drm/drm_writeback.h                   | 68 ++----------------
>  22 files changed, 163 insertions(+), 137 deletions(-)
> 
> @@ -2305,6 +2366,7 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +

Probably a refactoring leftover.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry

