Return-Path: <linux-arm-msm+bounces-58243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3AABA56C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 23:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28D733BF7D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 21:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C71322F3B1;
	Fri, 16 May 2025 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZxCk93D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70570280018
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431615; cv=none; b=Q5e3KUT401OGZQp+78otaNZbjHxriOKkVkjpns++2+5B8nZxG4ti4DGZUYNp/7wpENt/olC6cr0ikHReDBwDA18NOKzCahrFbkhGg3GPMJ7k0qfzw9ttbYFuokDwmZfoiaWCUx35ASrTfYLtdWhzkBZMWVGmgEa+5/co6B3rurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431615; c=relaxed/simple;
	bh=ULw5JL4jmb3bmAeCxcOGj0CElZI1/AiawMyUUrtPpyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHSPsDrMwkMXfdkIBC+DaeSBsORUGP9Y8g5HluR61u3ihZpm5k6GSAcMNkW6MCISbewUWEzWOhhV8ttiPOxo+FtnroET3bt9jsdxtMU3eWB01VWQ9OXGeB/k2pxkBzb2vBxv8+EOMS5pW7OFm7uQ0ENdBu/qWS3LA4PX3XqbBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZxCk93D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB27Kv002119
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WLyt+5Z0AOIejFDuTl8oaCpz
	mlN3FLZTqlnnQr41U2I=; b=FZxCk93DJkNcuvKAn8NQGI5E3U1ByqkuzIlIXHwl
	iS8RWtkTnRKnLl24gpFtA246E5VseX+zuE8I757cgPLvv+mBYyn2IXNBe98hKHP/
	d6VJybk+eyFFuYmNh2tPNuO/t4ibS0r6hxAf2MEduKGtJOuqd3gyFruTFnmJVevW
	feci+RPVlYx9FPqICCUEvrElyV/A9TiY1pWYM8abiQLE6piykZhs86Z2YArc/kSb
	0A7ez0t6JH8/3hJIyXskqiKrFpi7fDEsvDUcOzig0n+8+9pgvJOehdb/z0w0RrUr
	EpMezCOrEcuDmmMkfmIfuhWr9Bs4/p/utgw95xTeoo8PdA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrk1m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 21:40:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso55022186d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431611; x=1748036411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLyt+5Z0AOIejFDuTl8oaCpzmlN3FLZTqlnnQr41U2I=;
        b=wtFR6v06J7mVXraG35yWFuYqCoRjhhazRMEhJY2i7mHmqrJUqh/eK8gfMyUOVT7ddJ
         NBc8jsWqdymMLcE50tehlKgLZFffH00Ot5O9P17ka254bmcs7OWSJ1vjdA0NVfyxv6ZB
         PMaAvCsBJ3ThovtAAOd5uNeDTE6emiitgmIElAsBTAQo+sjdqmGDO01eMJo/r+DJpQQ5
         hopDR3OydauPYzgGXmOmP7hAqt3c/y0PXWpRRejMFmegStYYCKcWm/2rwnYyLrA1SU7t
         B3sT/frQy0r1s4s+GUDHuqFtZMJ7nQKulsnDtu9eGyKo9exiioHD/pVd3prvRR7WJVQj
         S8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWYYksjEGT5zZZyyJQPgThVpnSUT9ICOGxLumXTF8PR9oYo+0tolQbxNOZ45XCnOGdidTL4YY3zlXBpd4sL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Je/8oqK/wkVx4phaWfEcXiqbL/JyhRM0gl8AFVZAXtZwEETw
	BDQlQUPYDQB2pnNA9LexsUwN+Ho0eQqrvIaeN0OItDO8vnvtLKG4KCt7oZXxb7eWRuqnH7bu4Ih
	9khYk4kBk706OQUDY2LuXMI1Zsp7pgHAMWwlat/ANVA5z+Fjp+N8oWmdT8ZYi7RJctUjf
X-Gm-Gg: ASbGncsVOM+BVJANWnI3wG1ug1qu5wfVPci9eWT7Y0NwJvminE1fUvZOPUiGPGowPww
	VHykgjtScEdjI+nszvxFvdWPgP9z3leeEpvmDv29BdmO+LXZBfG16FUqzBaZPTN+1OGY6OHzEJg
	R5Y1XepGETPCxcEOEIWmkXbIzpewBAO1yB+CAGV4ATCw2+wA9eUMfkJkFfrzMl+yIjPU1mDp9hC
	1nWIb8NbBq7oZIcg/krN0wZQTAGSjNhkD6n9wo1nwxmJXVYAahiInT73OG6c9caW4Z8lTHyiuOU
	OS/PORK49GrGWhCL2zR0Jzxwf/fM9Hil8YC2GJNrxdwXOZ8V6LsUSZCp3Ziy1szs4BqQOM2YSSQ
	=
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f8b08aad53mr84737046d6.31.1747431611224;
        Fri, 16 May 2025 14:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlSkHU/95FW0SPZKEO3RfhsXaoQpKMCqmBdWYPgcm4PwTrfg++Ymk08ToHgTYtlLPYBsZyPQ==
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6f8b08aad53mr84736776d6.31.1747431610813;
        Fri, 16 May 2025 14:40:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7038518sm595002e87.210.2025.05.16.14.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:40:09 -0700 (PDT)
Date: Sat, 17 May 2025 00:40:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Message-ID: <62vhglzixy2hl7uhl3queml5z3vvvqw6kefhaboip3iql6ep4e@kbl4yihvj65g>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
 <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kuS6m0wL0lQAwMVp9cHNijxs8sXisTEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfX+MAxS8Uwn1le
 HePkWnhnu4Gtgqfpr0+ogJcUjB6PoWJgVCEkv1oHwYzIV1Jdu3zjt8xUbjZd5JkV/hyC/TEjGyy
 Da38uCj6HI4RGyVsA+gKAZYJkF4nLt/TOah8mVsz+TAsSqFWYbMRwISX5rlB9yEAekFZ/fQ5SOt
 HWj4joDW0ursMfMJPgKYN4LWxEF4FUCCYCJM+tn+vGmplMplKe3on3faPD/3eFIzX7K8d2GW98T
 taPutdz2oHmRQFVl1OBrei0j4B3PVueyQ0AhHF/clJH9N1tfadWbAav0BSsNcT4l7Qh4Fuc1FHE
 1GNE6QKvLN7tWXROc7ezwiLvQ+WfpXQu9W/o8kKX4FboBSqE6zKSkAjgAUK1+GdnUKu0c4dzNUt
 yMrG5VkXcCNvUBc03Lv5t8vBSt1Lk++dz+3rhlTG9gRkihOqrEbyaIGsVJclPpsCzuUSZ0Ca
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6827b0bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Ey3AjrcxibMDRGd7HuQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kuS6m0wL0lQAwMVp9cHNijxs8sXisTEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160212

On Thu, May 15, 2025 at 05:48:09PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> > On Thu, 15 May 2025 at 02:52, Jessica Zhang
> > <jessica.zhang@oss.qualcomm.com> wrote:
> > > 
> > > Since the max mixer width is not a strict hardware limit, use the actual
> > 
> > Is it? What is the actual max width that the mixer can support?
> 
> Hi Dmitry,
> 
> By hardware limit, I mean restrictions based on the size of buffers within
> the hardware block itself.
> 
> PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a max
> supported width based on the size of their hardware buffers. On the other
> hand, LM doesn't so it isn't necessarily restricted by a max width.
> 
> I can clarify this in the commit message and cover letter.

Yes, please. The text above is perfect for the commit message.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > > hardware limit (the writeback maxlinewidth) to filter modes.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
> > >   1 file changed, 1 insertion(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > index 8ff496082902..0a198896f656 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
> > >          struct msm_drm_private *priv = dev->dev_private;
> > >          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> > > 
> > > -       /*
> > > -        * We should ideally be limiting the modes only to the maxlinewidth but
> > > -        * on some chipsets this will allow even 4k modes to be added which will
> > > -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> > > -        * and source split support added lets limit the modes based on max_mixer_width
> > > -        * as 4K modes can then be supported.
> > > -        */
> > > -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> > > +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
> > >                          dev->mode_config.max_height);
> > >   }
> > > 
> > > 
> > > --
> > > 2.49.0
> > > 
> 

-- 
With best wishes
Dmitry

