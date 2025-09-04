Return-Path: <linux-arm-msm+bounces-72135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C8B44727
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 22:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9866F17D09C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEDC277C87;
	Thu,  4 Sep 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlUmau70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502841C5496
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017163; cv=none; b=GD6XcS8fUB40wHsgoQVmdT+bPHf7bALAA5JqYwwC5V8pJDIsSU0nb8t3EtemWZ2udccf5pLCCptNLcMwrTmobW2dbCjocSRgeZlLytV0v2j1X0rXoo746QVgM4nwuU+lQeZDzjWXOgQJW7y0VWGBdEdGepAxowEvRQDKpQL9yK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017163; c=relaxed/simple;
	bh=wyZL0V100TmfNRkX1sfGVrcXY9LrAk2QjOM3w5dQ/E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IriPn0/3I3FFeBJIEqwY6PaZgqIv/7GbnjQKtAhRyk/mXW3TbuijAaiqhhw7d+gKFUbaLZWZjMLbaOA/EmY3QazZVY9VL5VaSXjeDaN0Y1o4tExDzEo2La7V5eqQYNMtMNLIcWhxsLd0YDgr9AVllzrpJQqNBwzvaf4Kf+yjXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlUmau70; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584DZteh004158
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 20:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jWUNPuAEFI7JhvBCvnX55AlM
	FNdm2ykDPTbZ1bebaeI=; b=LlUmau709APIAZJv07SIRxbrcWaOjAIlpCqDCpOL
	UkS8iDsrKpDMR1yQRPuZMMZXSbNIoKg2U7KiKjdZHNSWhuJc/nQLAN2AQHt4Dz7Z
	FJh9XZxqrb2RFVz7xetDKWowFWiT3EqhWFJpfM4PfF2GQig0AhIxeTfAR/OH8egS
	XA5k40IT+eIOAj4lfpLsd2sy6SDIyb7o0oxeoyFW3xdzGXLjxQ4e7qU/YCr72wer
	RbFB2sABL+DQYIZDdPViNiUBLT0swhIVax9eB3/Gj+JKWg0vwqWpwdiLRTD/DQWr
	bp27CjFNyaPBg1hmXlE5wHuqpxuLX4o/iHUtUK4jtHgmuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0erx1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 20:19:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b30cb3c705so36641041cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017160; x=1757621960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWUNPuAEFI7JhvBCvnX55AlMFNdm2ykDPTbZ1bebaeI=;
        b=P7dIqzGdMs7qMJ8gYQKrsrhkt7O3sfevGS4Vijap5DIy69GZNI0ZgnYzN7kX+wE/qu
         Ecl9OWz07zUdx8r2gaCzBORjw7VWxNUJVwGTnmXos92okqwpgy88BTcEadv0c2YZGoeq
         hZfs0wwq2QF8zWpxUkYIAfXXxAyk4HfXvV1QJW8+GZLXM9CSsk/mmTe0Jrvj+JCR0SYV
         TzaTaZ8UqtDXJ6Ew9IDD3jbw+qgx3x8TiFp49oWX6FbuNYWFcNFzS8KuHtpZ+4dRejvn
         4U5Pf7U5Jf0eu/EZjkd50K4H1aIXufA9Q9t6HRQaFphrSM0TYEYAG0Sd9jdcKuxt0CZ9
         B/OA==
X-Forwarded-Encrypted: i=1; AJvYcCU73nh9eH7Exg1NmHYhCEDYkNoWlxIcVpJ7JKLqzScE6wiW5UZIINpYMItJs1lArQKcBJvpBhHo48iHQogK@vger.kernel.org
X-Gm-Message-State: AOJu0YzoupwwZv4Al+bpNhFRYJcuMc9fZ+7bAEQDrLCRrr3z3IF1vkN4
	WwFjK8HoiY2M67Siv1aIS2WwDkxcCLenMbTCHcTF+nlN9rwW8+Ff1qqHE/tbMYYGNFDVbCmBkKE
	1b7OSWDG4qJUzVPA0PfaF90PbLBTFn94oK5rO00RLNhgI1scYKmzKDZ8olgnbAsscHubW
X-Gm-Gg: ASbGncuYwB+zPWgSXGM6ijkbYRGgZ9NkgwmmHuC6fHe1QQYnNpunD6b0JknKsvSwWfu
	jQNovIK1rL3Zw7WCKYljI5maAuTTwoHeFF0OwfacDxTQGxNhWaFvASraO12YjzeubkzD57H5b+m
	hqCjHP0VhLxmH33jmKvsRtxxilCXSO4bq6drXMYkGDJW1UzKCm6uUS9HJ0BgVINpHDM6/EAKNlK
	Bly8jAD7vuW7oOLCgT7HClq+Hh6V5H1cZJVtLOhXuKmGHIMrT4eR1u/6LQ8dE4uMc+2lsRmf1jS
	Y21ViSKkGIfw+tS3DywMRoaSxi1vywINnK1UY//O846nwZoBCpYcgayCLrePKDBN/0Ndbjyd1jg
	ltGMbL99Xbf2q7S8JTSWYQnfXy0Rj2DCNmc5dfnUXq/FUpfhG8gRQ
X-Received: by 2002:a05:622a:2518:b0:4b5:d7e3:14a9 with SMTP id d75a77b69052e-4b5d7e31a96mr37976211cf.17.1757017160062;
        Thu, 04 Sep 2025 13:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJcRQsxcgT+uSNce80CLe8CYyvhDKUkldf2jsGuUpffbpj69zWEbc4KJJjbhdYWm1raJiMhA==
X-Received: by 2002:a05:622a:2518:b0:4b5:d7e3:14a9 with SMTP id d75a77b69052e-4b5d7e31a96mr37975871cf.17.1757017159540;
        Thu, 04 Sep 2025 13:19:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm16137861fa.22.2025.09.04.13.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:19:17 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:19:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
Message-ID: <k7vorukb6rockoanjdebfjw3iio4l5nu3u6hdqyi4ke4cp3h66@omwo5bjxbt4t>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-12-40f0bb31b8c8@oss.qualcomm.com>
 <c2d810bc-bdba-464b-9a05-49ca2e1c773b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2d810bc-bdba-464b-9a05-49ca2e1c773b@oss.qualcomm.com>
X-Proofpoint-GUID: NJ9GMWnYkhDt6uwdK9qenopqPWss0k9o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0yrTt9ha6QeJ
 qNhP8SswleojZXXeNaFLByk9tVTc5pAvvhPtYFPduoniOa1fa1mTCnZHw22VTSyjziUkvHOuCEu
 07w9TwiVGSmBCvp/gvgVTVR+hFwt/GfkniMNTZvsjTiFFUf+p6El+NWzjEZux8xID3W7Aj+XVVC
 2rwRrudUaIgef1URCutQJvadjMV14aR3r3kVw7dBdBVgVCvugyIOBnItz6CMqj6+orliclKZ8ab
 fQpPiwc8X1rvfVyJWl1yX7KbAK1P+hQCD1uUG07mL/9zzBeF4ONAZvgmCzpdiSM4S7aMNHwPsck
 DyE1/AihaQ0RoSfRaPPRvuizLH4MtueHMrk2asMdLZIP1mBO++Ab+oZpLH7GUdxrq0Uux9tjlmD
 d7AOHaiw
X-Proofpoint-ORIG-GUID: NJ9GMWnYkhDt6uwdK9qenopqPWss0k9o
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9f449 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ncykOhDuLf7TmHMgJ_oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Thu, Sep 04, 2025 at 11:38:16AM -0700, Jessica Zhang wrote:
> 
> 
> On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> > The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
> > MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
> > msm_media_info.h. Replace them with the standard Linux macros,
> > round_up() and DIV_ROUND_UP() respectively.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 62 ++++++++++++-----------------
> >   1 file changed, 26 insertions(+), 36 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index 67bc5a6eeb43dcf113dea9eccdb778cd52b1ad40..6a0426ed1460c5af4822844d7a7b0c51739df875 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -10,16 +10,6 @@
> >   #include "dpu_kms.h"
> >   #include "dpu_formats.h"
> > -#ifndef MSM_MEDIA_ALIGN
> > -#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
> > -	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
> > -	(((__sz) + (__align) - 1) & (~((__align) - 1))))
> > -#endif
> > -
> > -#ifndef MSM_MEDIA_ROUNDUP
> > -#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
> > -#endif
> > -
> >   #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
> >   /*
> > @@ -80,57 +70,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
> >   		    fmt->pixel_format == DRM_FORMAT_P010) {
> >   			if (MSM_FORMAT_IS_DX(fmt)) {
> >   				if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
> > -					stride = MSM_MEDIA_ALIGN(fb->width, 192);
> > -					stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> > +					stride = round_up(fb->width, 192);
> 
> Hi Dmitry,
> 
> It seems like the usage of round_up() here might be incorrect -- the docs
> say "round up to next specified power of 2".
> 
> Maybe we should use roundup() instead here?


Indeed, two macros with very simlar names. Thanks for spotting it!

> 
> The rest of the patch LGTM.
> 
> Thanks,
> 
> Jessica Zhang
> 
> > +					stride = round_up(stride * 4 / 3, 256);
> >   					y_tile_width = 48;
> >   				} else {
> > -					stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
> > +					stride = round_up(fb->width * 2, 256);
> >   					y_tile_width = 32;
> >   				}
> > -				sclines = MSM_MEDIA_ALIGN(fb->height, 16);
> > +				sclines = round_up(fb->height, 16);
> >   				y_tile_height = 4;
> >   			} else {
> > -				stride = MSM_MEDIA_ALIGN(fb->width, 128);
> > +				stride = round_up(fb->width, 128);
> >   				y_tile_width = 32;
> > -				sclines = MSM_MEDIA_ALIGN(fb->height, 32);
> > +				sclines = round_up(fb->height, 32);
> >   				y_tile_height = 8;
> >   			}
> >   		}
> >   		layout->plane_pitch[0] = stride;
> > -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> > +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
> >   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		layout->plane_pitch[1] = stride;
> > -		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
> > +		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
> >   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		if (!meta)
> >   			return 0;
> > -		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
> > -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
> > +		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
> > +		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
> > -		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
> > -		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
> > -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> > +		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
> > +		y_meta_scanlines = round_up(y_meta_scanlines, 16);
> > +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
> >   			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> > -		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
> > -		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
> > +		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
> > +		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
> > -		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
> > -		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
> > -		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
> > +		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
> > +		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
> > +		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
> >   			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   	} else {
> >   		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
> > -		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
> > -		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
> > -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> > +		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
> > +		rgb_scanlines = round_up(fb->height, 16);
> > +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
> >   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   		if (!meta)
> > @@ -139,13 +129,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
> >   		/* uAPI leaves plane[1] empty and plane[2] as meta */
> >   		layout->num_planes += 1;
> > -		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
> > -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
> > +		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
> > +		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
> > -		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
> > -		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
> > +		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
> > +		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
> > -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> > +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
> >   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
> >   	}
> > 
> 

-- 
With best wishes
Dmitry

