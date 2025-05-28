Return-Path: <linux-arm-msm+bounces-59720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394ABAC6DAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D801416E604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C528A415;
	Wed, 28 May 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNa+2p9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97321632C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448958; cv=none; b=BCiZyywrfgjpIa5rmABiNvxp7Ebs7BbMaW/BhNioDTkHh/Ia7ObOTU6R8XHqxFK7QKjGlZ4FRJqKrO4Hl8j9T/XyxwOWOYrUS5U88oego3+Jc1j5wuZm/exN3rhY1l15dZ4fEA+4DFRuK51l/NnMWgBxCjhS4LGph/f+0O+roHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448958; c=relaxed/simple;
	bh=Yzfyc3hJ2cranAfg+FXNl85uQMxVx0K6I1IIZeVv/6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX4BpQPYSsgFO/bxilSXGR6Lks8gs3wQanLOVEBE87KlbhVhXUwwT/WaSBiZfZNh3rZ2Ov8SjUY+iBmcZjSwOJmi7kGldYX9Fit9m6W5Immd7WRnNai4cE/8+OYHGgrqwzpMs6ZCKPCoW9ccdXS0L56aXg0Jn2mLNUfvBRU8i5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNa+2p9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7AIR8013434
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0gI5oH5wVtb0UAnjoDixYRCS
	/R30DexWdEZ/g8LW7xM=; b=pNa+2p9Z46vGb9NaB3B0Cq3D13AWihW5QSQ4waHd
	pYlbClDLFsnAF8q2gOWs1eWiEusVfyTskLIHeK1eQdiXKeruOjZD30+u2u1yR5m/
	Mc7w6uyWiNlOvh0bimWjnsYzMZjLLb7trCpARjZ3t/2scDa1g9ToI7rz3J2vl8SI
	vdQqS+SOmtWPLAEvZfz74HfUgpOYoshhyQ25KeUEa7jREA+ClOJe6h1T6SoNmNq1
	/07aku6zd6IJVCRF/W+zYCNbu/pX5emDiTlYlNVdXZEALGRvwhlFTuGzKT0NDVC9
	dvRYWL8bOGkjiuLm901YgW/bbfeTB2LXi4EbHtPqv5koaw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcy989-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:15:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-735a86e8e0eso392416a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448954; x=1749053754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gI5oH5wVtb0UAnjoDixYRCS/R30DexWdEZ/g8LW7xM=;
        b=ezn/vpIhLcoG1VP1FtUOllY0tTpqTQoNF4C585orNYNszFs6vT+8+dceqIB4weepzY
         h67j9OdsC6fKc22USYhKOd8A1yIYhQ9rI6amzuojMtgrAMr/8zbmYJbecPogRctoxwEO
         02A/TldJrUgxMg1KJTjnnDLaNQnTtTgSrfW9F2WNbPpBFYq+vgNPM0pe1cTOjDOJNUlp
         zi3O2TiX6q6QIxyVuk/9KbDIlS/Lc0lq4R14BdNVZ+PKu2lWPRAcXrmEUlWOrrSXoAqP
         f5ftyp46yVEnjuCyo08sGAknNimuIhKFRH8r2WywJyJBsW2nnMWvVZWLpYdQjqAtkUWU
         HEuA==
X-Forwarded-Encrypted: i=1; AJvYcCVPNiilVXnjaA3wpMo7FqKN7CYJtbR/dfB3BVtb/uVyI/QIwZVBfjrVDGa+yJdNhXy6a6byqYTomms4r2QW@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKABBay0gkSpec9PwxXIOpk7mD6sdhI1Pw9J4zoTZj8H5fLjb
	bwDCBagMUuZOU+ELz5wXdsbi4YUEFWiywua7OaNeK3lrhZyFUlHg87bIfgcbeG7Ld1sDYng0ik+
	YVO4FGwwQYR5LC3DZ9yDUO2my0VIGGKFJj74Z8kNfGjXUhEfh35Vbj9UHC2F/LWmmGz25
X-Gm-Gg: ASbGncuVCeVFxYcdZmEKctTAI2973DhMgEHJAHwUBA96jBocVwaqBm5qq32NIBq+BR2
	qCIg5olS3buURLcpr84cgrQCisaW0FjZHVRlAvjYGQrxQcMSsI85fKvyVEIC8ibxPS1DmMi8Tf/
	hpsdYnugWzZiMHUXiK4jbAhB0vEcYvF2ncKbHY21M7jRDgBAsasTLhqJF3VHv6hR120spsYv57b
	U0edHsWnGUUFbRbwV39lHKmBsMUCC2TgomOken41sKrUXZW+lMoCIIHpOLvYiIhZzPFl/AXb9ly
	7yrWTo64z2rssBf6jyTlH9pZL+IwGm5pIrocnsMoVtcrqFeA8rFb31XU4tWSAhrL23lIssk1WZ0
	=
X-Received: by 2002:a05:6830:f95:b0:72b:9e3b:82be with SMTP id 46e09a7af769-7355cf4e473mr10325995a34.7.1748448954502;
        Wed, 28 May 2025 09:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYwrXg6faG2a+Jm8PE28X/HbDkL+0E2l18X5AHSQXLcRbVwR7vfI1Mutzhzw+1inWKHRoFw==
X-Received: by 2002:a05:6830:f95:b0:72b:9e3b:82be with SMTP id 46e09a7af769-7355cf4e473mr10325944a34.7.1748448954067;
        Wed, 28 May 2025 09:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62a93asm339330e87.95.2025.05.28.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:15:51 -0700 (PDT)
Date: Wed, 28 May 2025 19:15:50 +0300
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
Subject: Re: [PATCH 11/45] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <6hwh4bstjunf5kp2ruepsj5clztvjjtxfvxamttwpvhsdpg7ep@24w2uq4qurzd>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
 <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
 <3992e14b-7a5c-4787-9bd9-71a2190c1e64@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3992e14b-7a5c-4787-9bd9-71a2190c1e64@quicinc.com>
X-Proofpoint-ORIG-GUID: W3L0Rygo9tekg_qwdNdhu_9JnE5ZlIvs
X-Proofpoint-GUID: W3L0Rygo9tekg_qwdNdhu_9JnE5ZlIvs
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=683736bb cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=hmVhL5nSZav6zxmTOrAA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX8BmZ8qSGFlQu
 AVSBpH9AvsKqtmrfDZSvxzWW/cJ8OUt4DKRkTsrzmZEWIZ5TVxyhuJhvOqxeuD6Mz6VoDhbqK8v
 23QxBO5Pxth0U1iYbDwP4xQA0HBXNsrcUutZvp0z0SyvL3oAK8PZDPs2Vjht3HmB5kns6Ofd4RI
 cNHEHUqiAx1BG+ZQFvgEsRhWw9rwaRx48SpHDaClwI+qiQJzhKIrutDkge0oU5ILkKLu5JoIStY
 RWcmFThtcfY7qTz0N6PzpFQ6EsH8Bkg3qO7ZM+JCVZv4nci40jV05BJo4QZXiG1uzsF/rdQM9Hx
 CLJxBO7QlPjXEGZQGbf7Wl3ix3z8NRsyi6RpWTp0E3/HZQUA6do02Ek9EKFp/RFcSqeUxwexITX
 w04AdKNer68KfE+8JctSYPMn2Xqyo/l7Y1LcqRVGkUMxi3ZBHlJrUpUucN2v7455AV7ynFWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280141

On Mon, May 26, 2025 at 08:47:22PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 17:14, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:42PM -0800, Abhinav Kumar wrote:
> > > Split dp_ctrl_off() into stream and link parts so that for MST
> > > cases we can control the link and pixel parts separately.
> > 
> > Please start by describing the problem.
> Got it.
> > 
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++--------------------------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
> > >   3 files changed, 7 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 118f5ed83e464f9f27f813eb39624f9c3189f5ac..485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -1739,7 +1739,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	 * running. Add the global reset just before disabling the
> > >   	 * link clocks and core clocks.
> > >   	 */
> > > -	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
> > 
> > Huh? What happened with the rest of the msm_dp_ctrl_off() code sequence?
> > It got dropped, but the commit message tells nothing about it.
> > 
> The function msm_dp_ctrl_off has been split into two parts, stream_clk_off
> and off_link, so it got dropped. This part is a bit confusing, will make it
> clearer.


Then msm_dp_ctrl_off_link() should be a part of this patch.

> > >   	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> > >   	if (ret) {
> > > @@ -2042,7 +2043,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	return ret;
> > >   }
> > > -static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > > @@ -2110,30 +2111,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   		phy, phy->init_count, phy->power_count);
> > >   }
> > > -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > -{
> > > -	struct msm_dp_ctrl_private *ctrl;
> > > -	struct phy *phy;
> > > -
> > > -	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > -	phy = ctrl->phy;
> > > -
> > > -	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> > > -
> > > -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> > > -
> > > -	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > -
> > > -	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
> > > -
> > > -	dev_pm_opp_set_rate(ctrl->dev, 0);
> > > -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > -
> > > -	phy_power_off(phy);
> > > -	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
> > > -			phy, phy->init_count, phy->power_count);
> > > -}
> > > -
> > >   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > index 547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da..887cf5a866f07cb9038887a0634d3e1a0375879c 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
> > >   void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> > > -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> > > +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index c059f749c1f204deac9dfb0c56f537f5545d9acb..b0458bbc89e934ca33ed5af3f2a8ebca30b50824 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -911,7 +911,9 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> > >   	if (dp->link->sink_count == 0)
> > >   		msm_dp_ctrl_psm_config(dp->ctrl);
> > > -	msm_dp_ctrl_off(dp->ctrl);
> > > +	msm_dp_ctrl_stream_clk_off(dp->ctrl);
> > > +
> > > +	msm_dp_ctrl_off_link(dp->ctrl);
> > >   	/* re-init the PHY so that we can listen to Dongle disconnect */
> > >   	if (dp->link->sink_count == 0)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

