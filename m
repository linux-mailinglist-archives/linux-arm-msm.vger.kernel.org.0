Return-Path: <linux-arm-msm+bounces-15652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8B891086
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 02:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B805628AC4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 01:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C7B10A26;
	Fri, 29 Mar 2024 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SzaX/4y5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909524404;
	Fri, 29 Mar 2024 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711676834; cv=none; b=esh3zl54SiTwMcfh1tPQ2jyc/MteYNye/070C/oe7CV8rtihuhPzRmj+14UUJjyMGISc6vZ7d13B1dZThLueBE6M+hk1p6mHRGa+ZcC1IaJ4hKJokkrUd4uv3Qioh7CcIMU/zw8Auhr051Dq5PFiUNML1pDHVfKbHAXKerND4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711676834; c=relaxed/simple;
	bh=F/sT9vaXPLUPwUeBzt5/uud/lk3lyS5/k6aWahlMOCI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpHzGeyBFwyM48Vw4VbYe97BAIiWYfgzfOHG2Ca2tQ1VR+HpyGMh1Itgrey6QfVD7LGWoz+C+emS8+SzT9SYzPGz3szr1Vw07/mDzIPmvQTRCN5dpGbH2p3onckktrMyR48i8sjiXWoBm9i+aCL/We0GXd+NvhIfXbklh9AdzKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SzaX/4y5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T0Ym6D013197;
	Fri, 29 Mar 2024 01:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=Qm1gZFAKo7P2AmUjvUjLL
	//GeY28er1Yk8y2KajYbD0=; b=SzaX/4y5lVN6F8A1QkBk9qkCTVLzooZ42qcK9
	9nE6o/OsWfkQ9QZ8+FHnyatHc3zDki8huP1CoViAI1ft8rs0Zi6a/NfjYKQJwKaa
	5O1ubtePcZa3rMoQybLumcteycKQ7qhi7sqBpirMaBxdT1atblN6sGgVbD0uN4e9
	EE72n/7AhRe/oQ3djjvxrnVjJ0hDyF4ZRyOu9nMgGxG+9wXelc80veKDnRSqRe2E
	wExJE/+LM1iyaadOg1PwhWvU5xFJFMW4VdkHiTy5/RIvgdxV8tMaxMXWelhwYN7r
	x3bF8Gk1Igod6n6b301Bw1bNaVjj76yaVM3Gi8mVpf7kPLmSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5fs88fqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:47:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T1l0VY007397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:47:00 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 18:47:00 -0700
Date: Thu, 28 Mar 2024 18:46:59 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>, <abel.vesa@linaro.org>,
        <agross@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <vkoul@kernel.org>, <quic_jesszhan@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
Message-ID: <20240329014659.GA3478031@hu-bjorande-lv.qualcomm.com>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mvc90LBEJ9wz1w-GwCBhTGUkO7Uz7eFJ
X-Proofpoint-ORIG-GUID: Mvc90LBEJ9wz1w-GwCBhTGUkO7Uz7eFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_19,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=970 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290012

On Thu, Mar 28, 2024 at 02:21:14PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-03-28 13:24:34)
> > > + Johan and Bjorn for FYI
> > > 
> > > On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> > > > For internal HPD case, hpd_event_thread is created to handle HPD
> > > > interrupts generated by HPD block of DP controller. It converts
> > > > HPD interrupts into events and executed them under hpd_event_thread
> > > > context. For external HPD case, HPD events is delivered by way of
> > > > dp_bridge_hpd_notify() under thread context. Since they are executed
> > > > under thread context already, there is no reason to hand over those
> > > > events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> > > > dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> > > > 
> > > > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > > > ---
> > > >    drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> > > >    1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > 
> > > Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> > 
> > Is this a bug fix or an optimization? The commit text doesn't tell me.
> > 
> 
> I would say both.
> 
> optimization as it avoids the need to go through the hpd_event thread
> processing.
> 
> bug fix because once you go through the hpd event thread processing it
> exposes and often breaks the already fragile hpd handling state machine
> which can be avoided in this case.
> 

It removes the main users of the thread, but there's still code paths
which will post events on the thread.

I think I like the direction this is taking, but does it really fix the
whole problem, or just patch one case?


PS. Please read go/upstream and switch to b4, to avoid some practical
issues with the way you posted this patch.

Thanks,
Bjorn

> > > 
> > > Looks right to me,
> > > 
> > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

