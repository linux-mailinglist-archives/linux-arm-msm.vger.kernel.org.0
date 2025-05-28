Return-Path: <linux-arm-msm+bounces-59721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF1AC6DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F66E4E658D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD928CF76;
	Wed, 28 May 2025 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQG8jL2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB34D28CF5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449042; cv=none; b=HnUXakNOaQEVOiwVQ+Exa0v2RKlvQfDMnAot06L/RmAMRhj3G3PJkpH2qFBdPDq+uA1uDZrKfTqL+jko2ePYZicqCz2XVkmKmoZQD79H/CuWYC+nkNz307mJ+BXuvkE65UDwUPCahpyeN+9VqmpUWpQl0fW3DC792GIz9Sg4cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449042; c=relaxed/simple;
	bh=8y2x+LUkxHKZ9G/Vq2dyw6iBXf3X7n+haN5ROVzStoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWA+lm05+oGf4cHciIVgAHn7lK1riWlxFeCmPIMlrh0mgq6bci8nJpRdpytMRM6MJgiNTtTd0pyTiuet8OHfPEVlAxL9bL8szmfcZHq5XNRwbdwpu331r6GlVhkkWeMgUns00y3y4fWkCLT4cuP1MxHJMtZcfHtnCCWmT4YYTNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQG8jL2K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB2M35028266
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VxpVLFBQGSAU+ebxYoQdGVlC
	qZnUme8PP63pkL+w6mw=; b=HQG8jL2KEaz3iRI7+/X70BOGq0pySi6cBM+txh6p
	wwfS2VZ87Whfg9qHLepHGDouRDd+QwZHiq2TCtS3T5HrXpxyPZ4/QUEwG1Qq0fTy
	qcwoRgB2BVUHGd1rP6AjofhexVwRmoH7LbceKGqCzOdnpXm4PGvlkanS/+sB/21l
	axt1rK1+T7z6M6WJy+zTGfImJxTbM9Zpgoh/siYhtXDu0qbQdbOslqAp7G76ml6j
	rDYYX8YwkfBsRCS90CxTlvEEhsz+yeiw4L+z0UiAOa12GFDZdpmpBLl2LvL3snPu
	yQUgCx/hRIHs2NMtJdRMO9qC3SM5ZBbcgDo7iq6hVtIgHg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjtvu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:17:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7351a0abd12so2104071a34.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748449039; x=1749053839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxpVLFBQGSAU+ebxYoQdGVlCqZnUme8PP63pkL+w6mw=;
        b=f7Gix1AfI7X6Y1WCtqR3f1EGbSODN2ARhZp4r9pznRYPTVkQW31tyR96ybMsmIGiWk
         BNtLRVfhT4t64LXa8uP9u/ThSMJVV9RVj0kleMgiU5y4NT0QeHEnkcfWcCNFK1+ZdZtg
         v82NJ9vWCuIwtOysQjbb0aDIvKuJ1UGeLf7XVFhxk1dWCR3SaYVISZVoFHXZtuH2M30Q
         5so1QGT3RFec2TZPKcCbySQnf3YNTEeZrkCfC4Ktsa7dOT/VybLHtAT16QH3dCEsR4xn
         Wzm1DnN9GfOYhXSTw0d4mQjB6h92IXFLfUZ7BO4CHdmMwxVJcMAGr8pusYIJa26BrWTB
         5tYg==
X-Forwarded-Encrypted: i=1; AJvYcCUUQVObKKnpjTo7GKOdCE7kV84VQSIN24MA059QEaWLAyLEFFTtCUyisO5BL01icoafFPmKogvhDpz8MnnM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rYJivE5VpK4/Jz/temLuOsGjU/a00I2EGscLEC2Cy2waAEkG
	OqOsVNbZ2Zi9+BeEjkkYqejDv6kyho6tWVtZHzR/3ZzF05VrFvrG3DHtpn/+psMKzabA2dpC9k9
	1PpaZzpn3cKDet1IMliwEuzPxP22Fp02RTi0ikXvjSya5gjOUJRxtxFRlGI4nMpquKuAp
X-Gm-Gg: ASbGncvVWpg9cdh6LXE/97E/yIXaxH/W3RdjKy4BrsAvfEhxI84Jkxms/knPDqZUxeH
	ePJ2+1kYh6VFiJpWMWJ0HRBLQOAnFryQYZSLTj6iANzzT4hO7vCfLO5W1cEciK6MwmLxKgYJKkj
	wHkFi9TpbItx6Bahy20lJE73T6qRAV7nuO/T+a4d5eTvRJWla9iHDNJmqOjwqpPBqLVoV0QoUmc
	/z07tqrv0SvlWY+XlBvP8MNVjKQyZB3uxbwS0XsWzZgBoado9a1W6HOgp6bD5YPx4Zk2Cvc3Ll5
	PpaAj138zUJ/zRn/dw1wTGoQ9JXk7gJDuiSNqU5sKMMxFMwOuxYTH9FMH9vC2N1CXjiGV56fSyg
	=
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id 46e09a7af769-7355d1ca50emr11492059a34.28.1748449038817;
        Wed, 28 May 2025 09:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHymD5QPdG3sq4BRZVWcnUYrodeFvRGV9A9NykcrdI34F0kJ6xyyBvUoKiYlRqJdH2mRLZZDA==
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id 46e09a7af769-7355d1ca50emr11492023a34.28.1748449038359;
        Wed, 28 May 2025 09:17:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b39dcsm340216e87.215.2025.05.28.09.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:17:17 -0700 (PDT)
Date: Wed, 28 May 2025 19:17:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <ujrlphqfh6j6n2qz7wslapidmwacnj32cgdhwahmqpjpylmmk4@daraslg4fdk3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
 <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
 <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6837370f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=aWFAwB44HXOIBnsjnyQA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yrlcZfkFsnACDVG6O2x7ytmrcVuYP0aA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfXx7eLOGs6i3RS
 rLUF6befjv7X7wiS1wzELnCUdOGzKbYyyguOL1sZOCcaSkaGZDbApHhC/fHpF93gd4RHibdxkwE
 VVp65yGx/Ig/F2a6YghuL9QvXq9zr6+lvP5pELqr2JXw5ZhTndbZGWqCG6e2iZxZ7vg1u6uXVUO
 6TWE9/8FHOnNT3hu3fMeD72EN987QXY7oF5Z5k/6YdiOrZJKPnB9KrNjcvUj30IO3Fcb6KLreEE
 l7mKIUBPAyjGEgjosDi9qbdNQC+ToD9IA98n6grjHNsHEBHUnPGAd9hp0jYwxGm4hzDYiHvoCYm
 /lRXI2tBd1ZjxDySNffyh+g0Sk4VehirWGwT1EnF0z2sxvD0SltBrXQyyVhgoONSmvfgST+v+9S
 SHscVeSPtD88BiOssOq6WxBfOX8LhAVQMHli/oTdujV94a4rfNtoIfB1edlR5O7f6slkdlD/
X-Proofpoint-GUID: yrlcZfkFsnACDVG6O2x7ytmrcVuYP0aA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280141

On Mon, May 26, 2025 at 08:57:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/8 13:42, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1
> > > which will be used for MST in the dp_catalog. Also add additional
> > > register defines for stream 1.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
> > >   drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
> > >   5 files changed, 99 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
> > >   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > >   	catalog = panel->catalog;
> > > +
> > >   	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
> > > +	catalog->stream_id = msm_dp_panel->stream_id;
> > 
> > Why is it a proper place to set catalog->stream_id? It doesn't looks
> > like it to me.
> Ok, maybe msm_dp_display_set_stream_id is more proper place. Or can we drop
> stream_id in catalog totally, and f the stream_id is needed in the catalog
> function, pass it as a parameter to the catalog function. just like that:
> int msm_dp_ctrl_***(struct msm_dp_ctrl *ctrl, enum msm_dp_stream_id
> stream_id,***);


LGTM.


-- 
With best wishes
Dmitry

