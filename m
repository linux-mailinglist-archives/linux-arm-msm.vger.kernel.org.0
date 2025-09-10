Return-Path: <linux-arm-msm+bounces-73010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A1B52157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 21:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD22B1C86032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 19:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC99E2D3ED7;
	Wed, 10 Sep 2025 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avc37zmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2158BDF6C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533481; cv=none; b=JlltGnAykIYukTVipcw+ktmTFw7zyzQPyyvVbXn0WtKrwCaPSzycDNAp+Q2nBrqGDUgWKRY5Vbi5VHTTtH2pbS4QLUjzcYHLH0cF6POLWTIYehcvoPapl5KZPvpQuCebP05IsIeqiie6Qf42JUy07bLo8E+T/5ICb/Pb60lnBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533481; c=relaxed/simple;
	bh=TvvbGJhGoXgTGsOsVrfYtmt12BEe2nakx6B6C3BC+qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhJejfzr8YPN6Cqg6ctAPREqUCoGqGqUjjsgbX19vjxb86mR4mPd9wt0REK40S0d10bqn2vZp9ZGAk1nw1DoezmeoqaOcvZGO2txEzxjyyCU4sQeH6Ppv0/vC8K1yD83YThJTCe6Zur/BbuB0zbcuLvwqbNoceqkLaJaommdDFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avc37zmE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgGK3020857
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MRFwGcw4G0+ktZMni3vfLtmQ
	O/YRU2ZQtqpoFx/hjaA=; b=avc37zmEzVW7YjVsxItPhtWI22GJZQQOvskkWisI
	fAPD0eUnTWrwGwoiLO6/vxsGmyPbq3IOT3bDNSVNVJ9Cb2MPH1f/YAmv7QAcY8Lh
	yTzmcpRFSSiZfYNDmLTj7y+7A+m6xea7WQH0GmwOe5wmaLw5jv5tY2TEC0YocBab
	CzOvW1/dr2D6JZc7kOT9YGSwQkckprDcudn/1rdT9By0GObcCpBRtPZxTT2b7c1e
	QPuKJ5WTYEV9Uc7qEOByIVZQUFjqVgbtBlcdN/okWE5aChurpHzl8cLP8lDRQrBc
	PU9xSiqsSMWBtA8NUcn7IkT2woCXAPQ+JlIxcIPC+4K4PA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc295d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:44:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-75e974f3f7dso13155026d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533478; x=1758138278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRFwGcw4G0+ktZMni3vfLtmQO/YRU2ZQtqpoFx/hjaA=;
        b=ixEV16wS5mJCPQTYc0pA+tGZc3bSlOlFzCyKQ/74at1eGCDXyBMb2kvkN0APIcPtqG
         F1pypzC5N9dGn8Xf8prGeOWlYiIZrNVDMOaC2yJH/VXDrLANz/9DPRH8KehrqaATSf/d
         AMLsyL+Tdua3F0jsCOiSqr6yap/oSPWyaZrMjBFyPuxOrLRt2K47YrCQf/VKsXw5iqIR
         2fmzB9m5HxA3V8udUYQjpg6EO0aoNLpokPtzIycwpa7+LCmKNbzB6oXdzU7Y/Dv3/4UQ
         8SvJyQmq6dBuY8TAMdqmk5tpc2rKHYfbOvunGHwbt0B85P2hFQx/nzYw9eHlSHNjFfEB
         ybLA==
X-Forwarded-Encrypted: i=1; AJvYcCXL03iq7c3mNIP5g7xi3bVO1uF9KQO1RyH6mIQTZnATkxyZ54BO2l91zxYWFNr0MmjnxVFEgJEd9GMFCKJl@vger.kernel.org
X-Gm-Message-State: AOJu0YxSiXCxM6brl4f3qm7J0+ClRJbNgH5GPA9esgksiaGxi2LyDWya
	WfJ+lJfG0k/jaWbi9CSeeuzfX3rb91AxP0plM8/sAglzoNFwtujt6hgzsZOCMHy/FYI+IHEsCbk
	4l3+Sh6CIYwS40v6K6QYfKpnpOWv69A5QtEM9wdEmhW7Rz0YAwnrasB1pSOTi50/ky5AA
X-Gm-Gg: ASbGnctQC14UQXBuLu1Yv3ohVxnAx5YEiV8xYXXNRIiLcJwEdBUghs/878EWeIus0Is
	j5IkQIHOvi3HWEBbjJFm7gruK6uE35V3zyfu+rftT58/+76DCRkloQN+XiCUr8HbI6q1DGjhXVr
	o19kfqETnCB5rPaxiQh/K3ief/i1sNR+58eJxhpKW2gje5GVoeFeobItz3kfRcYnSMvFT2vgPNK
	7RERIhY9B+vz43zJNboeu0FrBaWPhL8JBTom9qf2TFwmozKIkH+hYzdFAed1DRuheS5DhHF2o6k
	msTPL+Nz7lrM/JxrW0fIiFJ8i8yYZMPMmkaSXMQT59MZtK02xgti9Gq8WESA7S92rChJMAAZM8T
	8siMQy9NwmjfYVGdMjtYekTDsrNZQ237rWWDTON2w4FdATEmN/ZUR
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id 6a1803df08f44-7393ec165cfmr207443106d6.36.1757533477912;
        Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLTybLfL00fFfCA42iPicU5GPH+S6SfBfiUJaoauFhGCNadtLOwQ0vunk0e3CAte+J5/R2vA==
X-Received: by 2002:a05:6214:d83:b0:722:4cf0:43ca with SMTP id 6a1803df08f44-7393ec165cfmr207442566d6.36.1757533477313;
        Wed, 10 Sep 2025 12:44:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c4ffd5sm43997081fa.14.2025.09.10.12.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:44:35 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:44:32 +0300
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
Subject: Re: [PATCH 2/7] drm: writeback: Modify writeback init helpers
Message-ID: <nw4ehd7a655rzyf6g5yxb3z25en45esja2i5uowzy4wpmb2el6@orycag5iccho>
References: <20250909100649.1509696-1-suraj.kandpal@intel.com>
 <20250909100649.1509696-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909100649.1509696-3-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c1d526 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=T65gB5C1oy4ZwBZl7KYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MCOO3FXFnhTrPEvT_j8MJGKWz5GvikEQ
X-Proofpoint-GUID: MCOO3FXFnhTrPEvT_j8MJGKWz5GvikEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX5n4qtZuHADY6
 45pf6H+GLs1dU+uhtIms91AwE4tg42OTmniRcG3/KZel2CvZ34vtZe7i8ESIO9dZkOj5bia7VXQ
 /718E10bk1gHlcTzAtrcUpVCuw2VPBT7ryaE1r13FWQvlmYIcUCbxWlE3Gs23+ZP6/wMX4LFo18
 Ojc3dXPOBNjTkT9QVhmoVOkIvYHm97dyCiLPO9VzSz2YjBqC+GGdGihSYuws4/KEs16PiIJxP9J
 XjAjtYLGZkY6z23H0SDzYgyV7Oro4NSTpZvL/8a7seXupn1sFOiWiEg14Y0O+e1BkG+ENZRiWZl
 56ftSCvOCgLGzQ0qQUPgCFHSk/d9efdfAM153HMA5Ujs0ZXkPuy9WXEfimwDUzLuF4KpB7BNiHK
 9oA1D/pq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Tue, Sep 09, 2025 at 03:36:44PM +0530, Suraj Kandpal wrote:
> Now with drm_writeback_connector moved to drm_connector it makes
> more sense use drm_connector as an argument rather than drm_connector.

than drm_writeback_connector

> The writeback connector can easily be derived from drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c |  2 +-
>  .../drm/arm/display/komeda/komeda_wb_connector.c |  5 +----
>  drivers/gpu/drm/arm/malidp_mw.c                  |  2 +-
>  drivers/gpu/drm/drm_writeback.c                  | 16 ++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    |  2 +-
>  .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c  |  3 +--
>  drivers/gpu/drm/vc4/vc4_txp.c                    |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c            |  4 ++--
>  include/drm/drm_writeback.h                      |  4 ++--
>  9 files changed, 18 insertions(+), 22 deletions(-)
> 
> @@ -338,13 +338,13 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
>   * Returns: 0 on success, or a negative error code
>   */
>  int drmm_writeback_connector_init(struct drm_device *dev,
> -				  struct drm_writeback_connector *wb_connector,
> +				  struct drm_connector *connector,
>  				  const struct drm_connector_funcs *con_funcs,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector =
> -		drm_writeback_to_connector(wb_connector);
> +	struct drm_writeback_connector *wb_connector =
> +		drm_connector_to_writeback(connector);

You can use &connector->writeback without extra wrappers.

>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,

-- 
With best wishes
Dmitry

