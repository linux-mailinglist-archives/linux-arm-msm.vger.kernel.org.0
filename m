Return-Path: <linux-arm-msm+bounces-68986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE4B24A23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE651A28768
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44052E4252;
	Wed, 13 Aug 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrttD8hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB024DCE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090367; cv=none; b=YSg8YcDU2tCpmX37aZxEr/M85O2736ATfxidIc5D5nx9Ujwb+2LNW37xJxVJZsGdUXNEmzXJdGgra5aFEqVgZl5pJaNn/WENdESNoa5sVWgCSabxgnlGqD9NI4TJdgnvjjguGkE3pr1tyLVLOP/lcIBguXzM3Mb5Kj3UXtrnvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090367; c=relaxed/simple;
	bh=d2dH8QiBmFq7qd3ujvLNs76dVlfu8HWKslL4DMwoXYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7obio7/Q0cFW6h+6P40M3UURdb3sE8HnUPuLbOUaILGwr4IqCHtGV9gm9EHh7GO7ccwtuLEXJGOzQ0VXqsfl4z/d7WAf5HV9f9dkwA98t5HZVH99kyurDjp4RNreb8Gp6KFodfnkWhY7/o9QtImYsc0//3iX3Mcuh0xo327snc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrttD8hB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLg04027042
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CtsyGNtxwW43FmYplJvg8OI/
	hjnzMs36m1UNeiX8+ls=; b=KrttD8hBw+KKDrQbWYvvVofnlr/5K9SwkYdP4f9Z
	Ck56kjYz4lwKP6UWjnQst9JKQ9qqg6u7mC9u6dnO2R9EhrW8QeJfgL63uISLTJIY
	yIFHNp3F9Z8Tns8oA6KKoIqTRRatK43gJSZcajEFtKb8noN5G5cjjPNZLzpCOoDT
	4D/Fwc74QpeJcj8NJLB0iXCy656y/aZLnZIdTuUkeVtHouQnCYxc15UF2dHfHY5K
	a3/4P0tNa95tubWISBK+M4o8vOK4iqa/UW2SlMqEIx4FHemDMZxQc0pPrNELG2G7
	V+tpIpD3uAI1dBUTLc1S1qYso/hn71Efyk7FOSUxb4zf+w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjqntj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:06:04 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-741654f63aeso9597762a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090364; x=1755695164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtsyGNtxwW43FmYplJvg8OI/hjnzMs36m1UNeiX8+ls=;
        b=w8yai12vG17GNjd2+s/8i9itaImb4bhH3v5BKDtnfJ7ic0ya7iyPupuP5KF9CCIsIi
         F9h9mitrLA4hFU1RQFcx2OIIY11GyvdogTkbKev0UQHkc0cmx0iFeQBrQm7kqmMVSE51
         GhxjA1CTHTcI/XWS0VZizT2ZotTfud43MryYUJI5iVyRY8jMYhz2bc9JV4PRbJ/1V3ba
         KHKgyEK/lj+80SEMOHEY5mbDccmf1X/ut7cYEXsldMX7EAxGBYKPyYo6ZkCldhXdWM8s
         BndKU4jWp1YlEg2zzoVSXAjU/69FqSGwkv8JnjWi0JSeDzc7C76qpwiFHhim8j72JXWS
         mTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVowcrkhdp13TdqO6sUnWuV9ZrHF5rnH73mY96GMtNPRdlEJmEIJGEb9YxI9qwsQpLSjOabeIgyR/FU0thm@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyRQVJDYR2FQH2i7MKjSFoFjI3v9XGFSFpfqUpgZqtNEa30Rk
	7Nh/xFbd/+plGpAoQydszP+1Jr1VVRshWIAzOaGq2q2za+NU/7eKIoNUyi4393w9ZGRJz3yBoTD
	y2kEPqvRpsiQYwpMLBT13ZRdZrbGy/pQpJXvCDIPnuEZVxt9+qniOKzjHQjdZkgTcusxz
X-Gm-Gg: ASbGncuc1ixk1lnKvNqFt+5GmHtxwX8PjJGfOQKybpo0esDxxvcVk9YhGvomx5Ra8MW
	zCnuu8SBRmuEHL+dsbuZyWiaE6RVlwoDZTYCwIihsrQopVa7zT4p+AbIOpiyJSL8pkm+EbGfqMV
	x5e7SVzincr6plRijUpkJUOgfzZdmQWDwqCuZE8I/PYgI5LA0CorM9Y3ybFVSnWR7ANfmiKhUO2
	C/7vzE2ud0GR+YUahDhxmZZHSRKfeqp4uPgkBmAJTJ/sSulRXbAAjtSqv8X+JkIMFQlhmR6d00p
	UsCHjy4qEjbS3eR7YrbfW9lNLtbfmgRgK0mSS9A7i3OevJqrOZhZ2jlZl90W28WhzTVNNGiPewO
	kWuh1Qj7hvHwOkelfZjBUTcooLymB1E2NylU5qogZuIaqKUiYrPkl
X-Received: by 2002:a05:6830:3692:b0:73e:6bd0:ff93 with SMTP id 46e09a7af769-743753f6e87mr2331319a34.12.1755090363408;
        Wed, 13 Aug 2025 06:06:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5ogUaSFs5OWUWvVMI5qkYyf64qK16spVbpftIzt8rDMvSQPCS8EvSHndBFluBHhWuI5wHtQ==
X-Received: by 2002:a05:6830:3692:b0:73e:6bd0:ff93 with SMTP id 46e09a7af769-743753f6e87mr2331236a34.12.1755090362521;
        Wed, 13 Aug 2025 06:06:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc6c14843sm2192955e87.124.2025.08.13.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:06:01 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:05:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
 <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
 <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX2YGux5OTKIC9
 KKwMksBkV6diI6eZ/0ROUUVTqmfyNtgsFySdGa9vC6ZfYlq12pOn3iF23Wg06BcltYgjNUfZ2a9
 a2kdpnFr5BmIjHnmThP6T3MM+I8dQ9jBO4PK8zf8AKNV+urWBZxelw91UMx1VxWCCnmDlB7Z4Y+
 uXrROLw0ItD1ByO2mVrjxDLQGuBqQ4zuW6LWaGrxJkE4BPzXXa1Ad1tngaTff1zoMkUxXScwZ+x
 TX7kcJC6Lz+ExWvh0ofnMo0//V1kNR6quFDoU8ZXYTIUEsQP6ii4fEXVt7BDBlXimERab51bj7w
 oRgeculrbrP+Zdm4JgNWfxljZ6WaZimLcUmmA/KvlfDOe4yMStWns5qDv2kgsJOWUWr+dmI8qJd
 HOa51DEK
X-Proofpoint-GUID: bLWJohEFp136Z_7pzrj5PeuGlfMo8gzv
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c8dbc cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=QnCa7YtPqE7sD9tSJnwA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bLWJohEFp136Z_7pzrj5PeuGlfMo8gzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On Wed, Aug 13, 2025 at 07:56:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 21:16, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Enable/Disable of DP pixel clock happens in multiple code paths
> > > leading to code duplication. Move it into individual helpers so that
> > > the helpers can be called wherever necessary.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
> > >   1 file changed, 52 insertions(+), 46 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > > -	bool stream_clks_on;
> > > +	bool pixel_clks_on;
> > 
> > As you are touching this part, how many paths lead to pixel clock being
> > enabled and/or disabled? Can we sort them out and drop this flag, making
> > sure that the clock can be enabled only in one place and disabled in
> > another one (hopefully)?
> > 
> Here we only have 2 paths to enable/disable pixel,
> 1.msm_dp_ctrl_process_phy_test_request 2.msm_dp_display_enable/disable.
> both of them are in pairs. Maybe we can keep this state to make it easier to
> access the on/off status of each of them in the case of 4 MST streams. when
> we get the snapshot of the pixel clk, we can visit here.

I don't think I completely follow the MST part. I last reviewed your
patches some time ago, so I might have forgotten part of the series.

We need some refcounting or state processing in order to identify if
there is at least one active stream. Only if we are transitioning from
the full-off to the at-least-one-on or from the last-one-on to the
all-off we need to toggle the pixel clock. This means that we don't need
the pixel_clks_on flag but some other kind of variable.

Note, I might be wrong here, please feel free to point me to a patch
which handles that.

> > >   };
> > >   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->core_clks_on = true;
> > >   	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > > @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->core_clks_on = false;
> > >   	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > >   }
> > > @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->link_clks_on = true;
> > >   	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > > @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	ctrl->link_clks_on = false;
> > >   	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > -		   str_on_off(ctrl->stream_clks_on),
> > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > +		   str_on_off(ctrl->pixel_clks_on),
> > >   		   str_on_off(ctrl->link_clks_on),
> > >   		   str_on_off(ctrl->core_clks_on));
> > >   }
> > > @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> > >   	return success;
> > >   }
> > > +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > +	if (ret) {
> > > +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (ctrl->pixel_clks_on) {
> > > +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > +	} else {
> > > +		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > +			return ret;
> > > +		}
> > > +		ctrl->pixel_clks_on = true;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +{
> > > +	struct msm_dp_ctrl_private *ctrl;
> > > +
> > > +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > +
> > > +	if (ctrl->pixel_clks_on) {
> > > +		clk_disable_unprepare(ctrl->pixel_clk);
> > > +		ctrl->pixel_clks_on = false;
> > > +	}
> > > +}
> > > +
> > >   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> > >   						struct msm_dp_panel *msm_dp_panel)
> > >   {
> > > @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	}
> > >   	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > -	if (ret) {
> > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > -		return ret;
> > > -	}
> > > -
> > > -	if (ctrl->stream_clks_on) {
> > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > -	} else {
> > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > -		if (ret) {
> > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > -			return ret;
> > > -		}
> > > -		ctrl->stream_clks_on = true;
> > > -	}
> > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > >   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> > > @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
> > >   		   ctrl->link->link_params.num_lanes);
> > >   	drm_dbg_dp(ctrl->drm_dev,
> > > -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> > > -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> > > +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> > > +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
> > >   	if (!ctrl->link_clks_on) { /* link clk is off */
> > >   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> > > @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > >   	if (ret) {
> > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > -		goto end;
> > > -	}
> > > -
> > > -	if (ctrl->stream_clks_on) {
> > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > -	} else {
> > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > -		if (ret) {
> > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > -			goto end;
> > > -		}
> > > -		ctrl->stream_clks_on = true;
> > > +		DRM_ERROR("failed to enable pixel clk\n");
> > > +		return ret;
> > >   	}
> > >   	/*
> > > @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	drm_dbg_dp(ctrl->drm_dev,
> > >   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> > > -end:
> > >   	return ret;
> > >   }
> > > @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > -	if (ctrl->stream_clks_on) {
> > > -		clk_disable_unprepare(ctrl->pixel_clk);
> > > -		ctrl->stream_clks_on = false;
> > > -	}
> > > +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
> > >   	dev_pm_opp_set_rate(ctrl->dev, 0);
> > >   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

