Return-Path: <linux-arm-msm+bounces-67503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521FB18DF0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 12:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5852A176FB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 10:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9A721146C;
	Sat,  2 Aug 2025 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8IKCKUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF631F8728
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754129941; cv=none; b=ndvatvhoFI4VO8ann0sF+Yop1cVWgn25InBx9PJGO84/3+3030OrNSE+F87vLd1oNL8bajaeYynl+B8Y6xPBPH4PIOC2tbpxHLc9d7LnnfBcOV2PjxCc9S+GZnDxCfr5NIAIO08v9UJk9ps6EoFmaA5vuyfFdOV+ZmogAs1Nxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754129941; c=relaxed/simple;
	bh=Ty1Aj8UW1lb41nlnRREZ4XSqRuhEMNXjZ+eJbc2HABc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOzVXYBSfN9ldu1eLSvtECPv6HisHOn17f3ESxeDt7x/3oUWGt7XBmdKIWWpvPHPKemKpmO6IQn+uefe8uVy1NMopgeW5Cr2zV0eARKDjZqW1TRPYhV+koZc/uk+PN+AHTtMXQqYrVrIR3EHTSwawohUPyuOtNPF+XWxNkYOJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8IKCKUD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fbX3010327
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 Aug 2025 10:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jx+kGc1/RtPDFH2kU0Zb9HbE
	qcdsxBgONzyUhmEa04Q=; b=M8IKCKUDEC+Bd7QZtmEsqmYVwRAdDw/7z3Lfae+m
	uSnhCG4cChirryJxvVQGcObJPaHmBNSxKmt5xFy95jUK8OH1c3hkCCETqnEDaVUb
	gNzM7e+qacgNXr4mIyeu1ttimWpDBxqOeVRVXewtT7w8jmX+9ThOzUerngFF8frX
	kwenYUebvafcly5XthVInTotUAO8FRpCnrE/J6CGRUyRk17WbCcd6KytPLrfHMXT
	Fxbye/W9+xQVto+0xrQ+DVdTxCEnyogYo777Xxvu0KObV+2aH9z+ugb6fR3zHm+a
	xHZIP3IX0WFPDvkx3XvNh0YigwyME2cTsU7hcoJ2AmF+Sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a91rp66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 10:18:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e665a0cddcso288638985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Aug 2025 03:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754129937; x=1754734737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx+kGc1/RtPDFH2kU0Zb9HbEqcdsxBgONzyUhmEa04Q=;
        b=T8kGJCjOHHmCORZ9+YIePkwx4+XvEQuNagYAwMCmeIX4nqXmBJ5mD5bVNMnwJwMkD+
         0Y4/RcdyYR5R8o4JHB7rfx30dF8s2efr2zZUByEo3znf0Pe5peEl4UP/nKgF89vVc5sX
         r/GZvjGrhX6+TpRgdyhiXvA7U8RruKK55u+1CC01vAaRWggNv4vFPx6u3cbPK085V8gg
         wuM9JjuwUJ2rLwMEOEfAsEe1iMQRtBpoiIRHAWbm5eDZ4oovZAC2qriOgxBYGXB0p735
         99UwbS0g5eFnV5TeMyOGNkx5Wy2i3YbiUJIjTcwd6eBd2NEZCPKLTCZ4QkGQ1OSA3PTQ
         IXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2zPaTcm46TWa/RAKXPbEYCMEHcLz0IZPG8hdNmYkJyaxTFxlVgUymrVXHZU5fwRXU9oRdU948vlM4J/DB@vger.kernel.org
X-Gm-Message-State: AOJu0YyO5YV01LlqkFpASl8ydZNSghRFf83txwybIAuJK4QskPlm1DKV
	DcNRs/94j9NgUHaTP2FExFrWLqVv13d7iJeNRQz8dSFDdfmjfa5aMI36koN2Ib5oO9ggH7crDqg
	yeXNR8ZRfSkPLvroXwKJJBPhz33dtc4HWvSaeEGEoLWidMJ6kvzCzALTd3hD7tMkwRWP0
X-Gm-Gg: ASbGnct/ZYF0t2PCAf3KcCieIguc5ddzWhjES6aIvBMvd9YBeJrd30NXPHSGB4tB0lJ
	RQwp+WihMpcWmTCMjh//GsNNMKdfqvWW4mNNJ40MENrO2zYjzB12IKoiYkbjh58/SigVp2hPCrI
	KzjUMkYqx3H8xTdDQEMykuBMT3VZ9TKXUXlYcq6uT5MJwmrUudGrmqRCioHr4RylflkSv63kqqG
	OL06D9ESdWFAxC7S1e7lg5uSDFi8bO9ebEU7WKK633sBTb1KKn5E92B811EHKTp1C7PmWpewekk
	rtuOzK/rRn7+eDc3TjO2slEgP7CqjipP3DBAJpSrCnT6r8gEV/XByZ8dNyylXXnzHPc2L3fvDkm
	6SL/YqQMjzjuL6HiwiCAgesGE4gU+DgYF5xtuGU/2XjDDYIEglgoj
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id af79cd13be357-7e696371059mr347569885a.49.1754129936727;
        Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkTnIMpLeKTQssFIE7XgfKnhYV45kHZ+Dp3zZITljw76FcrvhI8dE+FJ/ar1u/0l7+mkctwQ==
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id af79cd13be357-7e696371059mr347568285a.49.1754129936298;
        Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898c2e9sm918063e87.4.2025.08.02.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 03:18:55 -0700 (PDT)
Date: Sat, 2 Aug 2025 13:18:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <qz725rrbpae5iw6tmx2s2pbaxl7pliyxf7dd3gyev64zqrbq5t@aeacyijbswl3>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
 <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XDnnTChujtg78ovyKmujQZw9v9Tc2hFF
X-Proofpoint-GUID: XDnnTChujtg78ovyKmujQZw9v9Tc2hFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4NiBTYWx0ZWRfXxEt3loiS4tth
 HKtskQfDjHjFHwAKCcz6lTVvx1kP3rGh60L0apYf/TMSiqEUeWBTOzPrKnK7DKTxjMoCL7H6iBO
 gC31SQW6cw5yGAj4yD/m8//nclJt/cGZl/jDsyvYTIUUxrcT7cO74B7cGPjmCo/V6H7A84NtUcQ
 PBD3dZO3Da8QDoLUtlbvJnDFL6O4lvB/MP1x6AYOmDW9bXJuxuoLDlxTEeZ6Cr0OcQks1B35zZM
 IvD58tWBoqV28fx9z7yiF/h99LVDXfb8Dw2JzirMBlwOZAc/D/Fwmnedk5JM5hPsuTnpWVsdbYE
 2jldaF2JOrucy5DkZ1G1uWwVN2U4LxBFoXyhDRMzkwrLt8b2YCVynff2G2T00lgxXrMS9Kk8A2G
 mDHrPz+sF9GlCAaDSIoQ5Plro4/FXM2MjUsSo+v93tu3FJIPR1fVULyOqMD7u3z01hIOnJKx
X-Authority-Analysis: v=2.4 cv=UdpRSLSN c=1 sm=1 tr=0 ts=688de611 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=alj5FwM-wW7eLBos5QIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020086

On Fri, Aug 01, 2025 at 04:58:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > In addition, don't disable the link until atomic_post_disable() (as part
> > > of the dp_ctrl_off[_link_stream]() helpers).
> > > 
> > > Since the link training is moved to a later part of the enable sequence,
> > > change the bridge detect() to return true when the display is physically
> > > connected instead of when the link is ready.
> > 
> > These two parts should be patch #2 in the series.
> > 
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
> > >   2 files changed, 11 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 87f2750a99ca..32e1ee40c2c3 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > > @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		force_link_train = true;
> > >   	}
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> > > +	}
> > > +
> > >   	msm_dp_display_enable(msm_dp_display, force_link_train);
> > >   	rc = msm_dp_display_post_enable(dp);
> > > @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   		return;
> > >   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> > > -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> > > +		msm_dp_hpd_plug_handle(dp, 0);
> > >   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> > > -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> > > +		msm_dp_hpd_unplug_handle(dp, 0);
> > 
> > This chunk should be separated from this patch. I'd ask to drop
> > EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> > all over the place instead. You can do it in a single patch, which comes
> > after this one.
> 
> Hi Dmitry,
> 
> Sure I can split this into a separate patch.
> 
> Is the goal here to remove the event queue entirely?

I think so.

> 
> I can drop EV_USER_NOTIFICATION,

With the link training being moved to atomic_enable, there should be no
need for an extra event here, I agree.

> but I'm not sure if I can completely drop
> EV_HPD_[UN]PLUG_INT entirely without major refactor of the plug/unplug
> handlers since they are used for the HPD IRQ handling.

And one of the pieces of the problem is that it's not doing its job
correctly.

The code flow should be:
- Inside the IRQ handler notify DRM core about HPD events from the
  bridge, don't do anything else.
- Inside detect() callback read DPCD bits and identify if there is a
  valid branch device.
- Inside hpd_notify() check if DPRX has sent IRQ_HPD pulse, handle the
  rest of the tasks: link events, etc.

Note: we might want to duplicate DPCD reading between detect() and
hpd_notify() in order to relieve detect from updating the DP structures.

-- 
With best wishes
Dmitry

