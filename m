Return-Path: <linux-arm-msm+bounces-59047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D6AC0BC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45B711BC5570
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0294D28AAE3;
	Thu, 22 May 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQalo+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF828AAE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917614; cv=none; b=fdZOBbAjXSupVs5TNxgK/Baj52eofWQ2GdoTosJNoj+UHFhzFMLEXH8toN8lM2CxKekAbMyY7VNvUe3AONzV91FILO26SGOab+GibnUOT3D3NnLXC9TYxnpc+O4X+Dxj3YnPgBWm7U84fzc1WxX5F5sBSxGNYe/T0awK8Way63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917614; c=relaxed/simple;
	bh=comksqM040Dtg+dKOnenlhpQhBxf3j0t5doZzXqQIos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJBjcs4DKcN3AkSZi9LNX/YKJNCjrB3mjvRjSPt56JIMkbnY5sFa2gmmk1dRq1lTI9ORYEeE2k2v0MlCGN5ZiCQ3c8aeGbUK/swwqmT8ZgamF6HEd/8XnY70bieR0h8S2dbA4VCPhPIV0c71OT1yu4LAbpLn5vdTU7O2Nv7ul8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgQalo+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6rdI6031677
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+EqEHGQsGLV7fMWgFHiDCICo
	9owZC5//Pie9xhLsJeQ=; b=VgQalo+0oOyORAiuezYHZYJqlNe7dZ4MnpprEVb9
	vwU8lKz3Z6m6Rli/ceqcyMqHNWDZTKZrwrQDJwEjJB9n+fQ46sFrHMYJy6UkK2oK
	Ic1SkaBhS3pPYcbwBAFu0JcGLJPjaIdpZdtUMH6kbvPKNcsvLCTCQXf+lal7bZ3N
	cWPNJJAgtyuEFAx4YeQ4+APzW/Gx9udZfw2ceEMM1W+v4rd2pz2qDK5tDkjtbBDK
	OuNfLY0VCMBLzk27BTvpEZFCX+YMR6tg21W1/OTTQ0HHCxHl0ZuKyCoMyJnTfEl3
	x0M0JcYU9q+VzC+xAp4bwjtdW7eHUWWOoG3bGigQivs1zg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c24wwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:40:12 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-401c6b8b66fso6867880b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917611; x=1748522411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EqEHGQsGLV7fMWgFHiDCICo9owZC5//Pie9xhLsJeQ=;
        b=GKgJB9Bt34ZAMsFzmPRHXsdvRacw6c1PNVX90CMftYD7GHWvxmls9zth/yTJGd/Pzg
         5Woc8qjVHr33LOqt4CTebe/sSiESCtjD1MQ1gBC+XR5+BAHPIrqx2dspd8z3sv+mmyHY
         BE0b1urhLNjo08pCvEhHmZovj1feX8hd1CDQ3jmYDxV1kh7NvMF0rqQycVduNuA4++xq
         hPnWXnPL9JDLIF28BejJSCnb/aEha0SlPMfzI+QJNSclkOfk54/kPCs7GsPBZYRGHCLq
         yg/QWv6ALaWG/iTeZSsaDkTn8707SxDFf4sV5VlT93jgAREoNV9xhmeR/ZOyCtVgvTO2
         s30w==
X-Forwarded-Encrypted: i=1; AJvYcCWs1xGsynu1npFPu5Qj1TbY4typ9/1pmr/SNMEpA5Mz9kmSGzJjWEzYcuDdLhdQACwLPe3FONkncTuMmDgi@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJrPN0oFfJoIIqdFu9DCV3E+bRTBXLQbh6HKCul77oAAOwISp
	kllgAzWbOLRxTvKGhWT5UgGzmohKDv+MypLx5jEaNg73CgzqgMeGwGSM0tqXdpAqorPPDgGgWtO
	s4rOO65C4zlSaF2erCSla/f8kZl7CFpBCjMIlvwh8WC3JhCv5Po23e+2OoUclR6/w9SzZ5F66fX
	q8
X-Gm-Gg: ASbGncte6MW5u7imyMo/XOn79P/MDxR6y5VBfiM5RpUiuLf/JmHUx2IKPsjW3dLs3gV
	xI4E40PwcwQgC+uY5KD6hNo05P+uuD1/6/sJBGHOpSUpSehY7MdOvaq9M1Wb7TJGlSbbnUynRBT
	rM9BKJejqmURujyezS6NMj/Aeksugi5f1qguUJr09B/u78lorTTLxaYwtO4dxz8YLQPCZIc6Ed6
	CF03epl0xgQZPfQWSA8PebPvOKY30XXomk+40Xg02+16ij+VtNRGsEMyQEe7IpgtrIqsn/4y5e3
	WRCvbA6++uRCgtFJe1PIxQT8ieSrZFjXsImGqPgocPCaigYR1xqYFzG7kDsWDB3z+t/TdK2mIUU
	=
X-Received: by 2002:a05:6808:4498:b0:3fa:3d63:ac58 with SMTP id 5614622812f47-404da73f272mr16496149b6e.17.1747917610631;
        Thu, 22 May 2025 05:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFve+8mofNSpVKLWwuMYBvia/xh0sTk8FAf6wyF/tDiY8jaMMruPUXYmConthQlvyqWvXyIXA==
X-Received: by 2002:ad4:5caa:0:b0:6f5:dd5:a594 with SMTP id 6a1803df08f44-6f8b2cb94cemr428744686d6.5.1747917599863;
        Thu, 22 May 2025 05:39:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e6esm3376695e87.136.2025.05.22.05.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:39:58 -0700 (PDT)
Date: Thu, 22 May 2025 15:39:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
Message-ID: <tm2ogebkaxu3g6xdmrjkx3u6veac45qd7mtiruan4rcevs75xn@apubmfvg74nt>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
 <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOCBTYWx0ZWRfX9tWS6xIyN7rF
 iv0bBaH2RH20zlyF+SXk++OdPQtBy43g+mMnRYqYsYkP4qJDIdB7pTADyWPUoHNTsBSy3aozjgO
 tBUKJVJmfkifrR6NUb8nU6ydra8NT+hWMo5l+4PnVQbtUU5QnzpZF/v2j71bB5oGVNefOqMh7hK
 6w7+9klsPN/mT9XU3thB/LlyZFk6RlEOVL927ziUbG4Cn0EurdBMN/Pt7qJ6hkOd6aR4J8piMou
 RTjZlv2I7xlRGC/Jd5UeY9Z2IPehI0qKfpnKPJV4sMkThMgCDnj586+YNMr6f81UoHK+FCkqTxP
 n99PFh/8bWXJ5ZYdsAQlUCCqY/j/7EmOaQ5GdlybLwuF8EW5VlRhV35J1LW9pRSFujo4K292e02
 p8f0MATgrqJRfaBdsLvZ3c8eNZDJoTHVFJSg5G6vMmjVqo6Ojj3WXcFV3zjLyVSk7TOFsuit
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f1b2c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kkxXnT2X172yt9C4ahEA:9
 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cWpXfdtiHdpm-JjbTsXovmJRf-xVAEZO
X-Proofpoint-GUID: cWpXfdtiHdpm-JjbTsXovmJRf-xVAEZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220128

On Thu, May 22, 2025 at 09:38:34AM +0200, neil.armstrong@linaro.org wrote:
> On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> > drivers allows better code sharing with the rest of the PHY system.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/Makefile                     |   7 -
> >   drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
> >   drivers/phy/qualcomm/Kconfig                     |  21 +
> >   drivers/phy/qualcomm/Makefile                    |  14 +
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
> >   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
> >   drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
> >   22 files changed, 2259 insertions(+), 2596 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -5,6 +5,7 @@
> >    */
> >   #include <linux/delay.h>
> > +#include <linux/phy/phy.h>
> >   #include <drm/drm_bridge_connector.h>
> >   #include <drm/drm_edid.h>
> >   #include <drm/display/drm_hdmi_helper.h>
> > @@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	struct drm_encoder *encoder = bridge->encoder;
> >   	struct drm_connector *connector;
> >   	struct drm_connector_state *conn_state;
> >   	struct drm_crtc_state *crtc_state;
> > +	union phy_configure_opts phy_opts;
> > +	int ret;
> >   	DBG("power up");
> > @@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	if (!hdmi->power_on) {
> > -		msm_hdmi_phy_resource_enable(phy);
> > +		phy_init(hdmi->phy);
> >   		msm_hdmi_power_on(bridge);
> >   		hdmi->power_on = true;
> >   	}
> > @@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >   	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> > -	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> > +	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> > +	phy_opts.hdmi.bpc = 8;
> > +	phy_configure(hdmi->phy, &phy_opts);
> > +
> > +	ret = phy_power_on(hdmi->phy);
> > +	if (WARN_ON(ret))
> > +		return;
> > +
> > +	if (hdmi->extp_clk) {
> > +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
> > +
> > +		ret = clk_prepare_enable(hdmi->extp_clk);
> > +		if (ret)
> > +			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
> > +	}
> 
> Why do you again set the extp_clk since it's already set & enabled in msm_hdmi_power_on() ?
> 
> Perhaps I missed a change but it's like that on next-20250521

Yes. And it was a part of the series beforehand. I will check, why it
was required or I will drop it.

> 
> >   	msm_hdmi_set_mode(hdmi, true);
> > @@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   {
> >   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> >   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> > -	struct hdmi_phy *phy = hdmi->phy;
> >   	if (hdmi->hdcp_ctrl)
> >   		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
> > @@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >   	mutex_lock(&hdmi->state_mutex);
> >   	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
> > -	msm_hdmi_phy_powerdown(phy);
> > +	if (hdmi->extp_clk)
> > +		clk_disable_unprepare(hdmi->extp_clk);
> > +
> > +	phy_power_off(hdmi->phy);
> >   	if (hdmi->power_on) {
> >   		power_off(bridge);
> >   		hdmi->power_on = false;
> >   		if (hdmi->connector->display_info.is_hdmi)
> >   			msm_hdmi_audio_update(hdmi);
> > -		msm_hdmi_phy_resource_disable(phy);
> > +		phy_exit(hdmi->phy);
> >   	}
> >   	mutex_unlock(&hdmi->state_mutex);
> >   }
> <snip>
> 
> Otherwise it looks fine even there's a lot to digest and hard to figure out
> the exact changes done to the PHY drivers.

Yes. I have been trying to find other ways to handle such move, but I
couldn't find any.

-- 
With best wishes
Dmitry

