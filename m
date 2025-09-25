Return-Path: <linux-arm-msm+bounces-75210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B13BA1AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102FE623A7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044651E573F;
	Thu, 25 Sep 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJN3rzCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A27F25EF81
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837001; cv=none; b=qNA6j2UMQGWALZpV/eCzLA82f8cEqO34Q8etkLSmg5eJPsmtV86NpkX6JI3paeFL64uHYFZWtZLngiM5c/Fu39bYeIRCqB4kMFOPvzFHr8m0Lor5PDnlGxRLjQSPeUAIvVBkCnpVTdcSHTMIFBnai9DNPVmsjeqraha05EB2LS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837001; c=relaxed/simple;
	bh=JvB1YVXUJ/sRS9akglH2Uf9pFr6m6kOFJ7nwp5S1qzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIIyjaTFp+yspG4igJichXq4fuYDPmYkDil3B43tFzGnqGIXl4iOfbJJ6hvT6j5PqHo4EjM4zNDALNZonmtK7OWtY7GbV6tHppwmUXubgjSZtsfdzuTPPT6JcBtqnl3z/voYoHPse8rf13DigbbseDXEI/c86ePz98Mo/6UmUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJN3rzCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPvqc021818
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EsE8hUNPrzXdS3krzD+9JlR/Fl7R5Lniz8rFMY5V+pU=; b=AJN3rzCS3cwFnGSP
	nML/5pd++eAelWEQEPJIKHdHdwPsI+g58MPBYbHggsVcdb/MO9sPwWYDNmmW2EIa
	X+fmI+N1/gDPCCal3HZjc5LRJJmhupfLL/bbtSWtkWck8JUpibn0Ugftwk9xsDti
	vmihmNbNaidxcxU28ZGW9O9O3fytzq/jbuNlfrCfp8F3p9I+63XdHGJGijU6MuZy
	r6oFvpw7RiPn334EFQtIEv7TDdb9V97aFJ7BI8ilolbsDXpWMXEP3DEWNqJNeSPk
	07ISru1IvH3lpsn+O9gAvFpkU6xNT/1pN65B8lRwpd/fOovaK9Bu6XwCcSu8Zz9m
	jvb8aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrga5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:49:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4cdcff1c0b1so48368961cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836998; x=1759441798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsE8hUNPrzXdS3krzD+9JlR/Fl7R5Lniz8rFMY5V+pU=;
        b=e6YUwe0pvw0Meve58QAZ1+Sq+Wr3OqITHuTS539hR/Z7UeI45DlHuGJ1iZLsPw+5AS
         2NKMhnzIxlu1ieIn79Zvg27eC1Hok5GZQ4BQz/vK6xs1nUmNNwN86CEAqJaGbGKs/VO7
         PMIb8VBoSzXYaEygIXDgcVqcUb3re71vS0CH7k0rsGPQAwZ/fadHvLCP9Njm6V5uzOTA
         DsHhEjjP3ALQtZXOcB8+ENYQJezKy/JRejUeJKQ3Jc+jw2pSHZLXz59CurBHHWnj3axq
         DkH94S/tFxlmgcMJIFG6S+VuxeToXLxP0PvtB8RcRRhIYiKasO3FagMqXN8Z+Y7SDMDD
         RX1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2iXX1it+fyaHaNgr6ZKMXudb7m4f9Rehkro230jE5kN/pl2f5wg4PSVR0RPts5F1IZ8IgT/CQaO4dBFWT@vger.kernel.org
X-Gm-Message-State: AOJu0YxRLJZFlZK1VscXQENIg5sq5v9Mn/ZbLhPbg927kHbP30umNED6
	z3j+Zjr5fa22HOBZyGpH0dDhSgQusFyey21TI4ldxB17J65nCm/d0gP4R+8ZD352gtNU/xbWihc
	/jAugJGrk8th5MUZozykbDsiYsqfG1KEPQ3uKGRjX0CxG5TkrLKXSZUeEbD2iOOrccD6l
X-Gm-Gg: ASbGncuzmEqKG7vxVHfaVtgrZcOtp67iZ1u60n80TEjjYvKqwcUdTok1x2fenpkzLs9
	KU/iOK80I8Pqb6U3r2dx6jML6QbhIFuj/AEjO0PE1jRAXkSsmBtqSlInufTZhhiBuuQDp8qonz5
	u5x9vp/nSh0QOalKMbvQ6z0lyC8vIwZXuQSyrPXu/4rqs6v5Z/qXHwUNbsI3AKfJoJixNjizh0m
	r+fCLUE3Bgitursd6MJ6xJrIWiN1WD3NtOwpFnluQmIA9N9a5JaoLwxwHJX4Oj+C0Opqs/zJ3+A
	fAAend/t/ElWdvEaypF0jIki3ruzFsT5FC4yl9v0THQZEuwfn99Mo0hEVXqn4xAi7f1x1YO+MYD
	Dwbi8+1DS7Pg4QqdQa/4l7/lNCioL1LCovKXBg8ZIYCOIuKW53Egd
X-Received: by 2002:ac8:570b:0:b0:4d1:f8e7:e468 with SMTP id d75a77b69052e-4da4d3161e4mr68602661cf.69.1758836997955;
        Thu, 25 Sep 2025 14:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV0QG5LOeu0iFHR+g6EDyvJ7468+R0ZRvi5JA5JE2Ojk3+XlsYVWWCMEwvumnpcEUb/6SRhQ==
X-Received: by 2002:ac8:570b:0:b0:4d1:f8e7:e468 with SMTP id d75a77b69052e-4da4d3161e4mr68602381cf.69.1758836997348;
        Thu, 25 Sep 2025 14:49:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665782csm1153941e87.86.2025.09.25.14.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:49:56 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:49:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <gmtcfmanngfrap5fl5622a46nstx662e7kfgvcf3jx7eqrm6qs@tpxarssvehkd>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
 <20250924-dsi-dual-panel-upstream-v3-3-6927284f1098@linaro.org>
 <v3tfzspjck2oqppelx7bmi5uflhs47ixw6tjmq2d7inauzfo7k@gxebj3buyuni>
 <CABymUCMvczXHM-cOXNko77xDVxX8Q6MA2AEZcGx_Yg6TWosMAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMvczXHM-cOXNko77xDVxX8Q6MA2AEZcGx_Yg6TWosMAg@mail.gmail.com>
X-Proofpoint-GUID: Za8pefw2L185OmMyTjXzPMQObL7tlkf0
X-Proofpoint-ORIG-GUID: Za8pefw2L185OmMyTjXzPMQObL7tlkf0
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5b907 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qXU7j4J-Xa07SXBApZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0U0fFuC8wRnG
 A87rZdTCpn2TzpVcolmFDtXAySC5m8CRAgEohpqDa6A7QbeR9TfnSApPT+TLFD2FOvm/Pml1YaV
 jC4B//quCu52WDN4QpzjlHOmrc0W9z2X5PrQn/do8DLyUJjIvPmOHtKWalfn2jfZ1gRbZepXZCV
 01DLAzub0woI16UHMZWO4wEsqbUjCUA5uR1UUJzkI4qK5dkRA1FA5ejSv++r4s+7kBEQNmN/FTV
 RWDViFm97fk58ogTOz8Q4jlKvVeoVFTnpOMC10seOaWV0YT9Sj7JW06j3bjF/e/S6Mu0EQ/XhzS
 JUgm69i0K1Pr5INMfzP/6JAa/U7bgpZDUHLggN5O7ZjjBxbr+TJul/gGtK9OLZbLY0vpSODOEcy
 bhpf/mWjkgr2JRNzYvg0vYF4DuD9Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 12:43:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月25日周四 03:21写道：
> >
> > On Wed, Sep 24, 2025 at 11:08:12PM +0800, Jun Nie wrote:
> > > Support a hardware configuration where two independent DSI panels are
> > > driven by a single, synchronous CRTC. This configuration uses a bonded
> > > DSI link to provide a unified vblank for both displays.
> > >
> > > This allows application software to treat the two displays as a single,
> > > wide framebuffer with a synchronized refresh cycle, simplifying rendering
> > > logic for side-by-side panel arrangements.
> >
> > I'd like to understand how is it framed on the overall system design
> > level. If it's a panel controlled over the DSI interface, it's fine
> > since we can broadcast commands over two DSI links. What if the panel
> > (or bridge) is controlled via I2C / SPI?
> 
> You mean there is only DSI data and all configuration is done via I2C/SPI,
> right? I do not have a real use case so far, but it can be supported in the
> same way. Panel driver finds the sibling panel via device tree to get the
> peer I2C/SPI first. All commands are send to every bus in panel driver.

Not quite, because why and how should a normal DSI bridge driver know
and care about the 'peer' device? How would you describe that in DT and
in the DRM bridge chains framework?

> 
> >
> > >
> > > At the DSI host level, the frame width for each link must be that of an
> > > individual panel. The driver therefore halves the CRTC's horizontal
> > > resolution before configuring the DSI host and any DSC encoders, ensuring
> > > each panel receives the correct half of the framebuffer.
> >
> > >
> > > While the DSI panel driver should manage two panels togehter.
> > > 1. During probe, the driver finds the sibling dsi host via device tree
> > > phandle and register the 2nd panel to get another mipi_dsi_device.
> > > 2. Set dual_panel flag on both mipi_dsi_device.
> > > 3. Prepare DSC data per requirement from single panel.
> > > 4. All DSI commands should be send on every DSI link.
> > > 5. Handle power supply for 2 panels in one shot, the same is true to
> > >    brightness.
> > > 6. From the CRTC's perspective, the two panels appear as one wide display.
> > >    The driver exposes a DRM mode where the horizontal timings (hdisplay,
> > >    hsync_start, etc.) are doubled, while the vertical timings remain those
> > >    of a single panel. Because 2 panels are expected to be mounted in
> > >    left/right position.
> > >
> > > To maintain synchronization, both DSI links are configured to share a
> > > single clock source, with the DSI1 controller using the clock provided
> > > to DSI0 as below.
> > >
> > > &mdss_dsi1 {
> > >    assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> > >                    <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> > >    assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> > > }
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index de51cb02f267205320c5a94fc4188413e05907e6..1fddcea7f86547258be18a51a0a3e3f96f6c3838 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -177,6 +177,7 @@ struct msm_dsi_host {
> > >       bool registered;
> > >       bool power_on;
> > >       bool enabled;
> > > +     bool is_dual_panel;
> > >       int irq;
> > >  };
> > >
> > > @@ -935,7 +936,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >                       return;
> > >               }
> > >
> > > -             dsc->pic_width = mode->hdisplay;
> > > +             if (msm_host->is_dual_panel)
> > > +                     dsc->pic_width = hdisplay;
> > > +             else
> > > +                     dsc->pic_width = mode->hdisplay;
> > >               dsc->pic_height = mode->vdisplay;
> > >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> > >
> > > @@ -1609,6 +1613,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
> > >       if (dsi->lanes > msm_host->num_data_lanes)
> > >               return -EINVAL;
> > >
> > > +     msm_host->is_dual_panel = dsi->dual_panel;
> > >       msm_host->channel = dsi->channel;
> > >       msm_host->lanes = dsi->lanes;
> > >       msm_host->format = dsi->format;
> > > @@ -2492,6 +2497,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> > >       if (!msm_host->dsc)
> > >               return MODE_OK;
> > >
> > > +     if (msm_host->is_dual_panel)
> > > +             pic_width = mode->hdisplay / 2;
> > > +
> > >       if (pic_width % dsc->slice_width) {
> > >               pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
> > >                      pic_width, dsc->slice_width);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

