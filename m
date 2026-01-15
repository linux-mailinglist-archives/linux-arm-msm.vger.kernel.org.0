Return-Path: <linux-arm-msm+bounces-89251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEDD27C72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 064FD300A514
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEA03C1FF7;
	Thu, 15 Jan 2026 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWOQR84e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLbJdVGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CC3C199D
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503061; cv=none; b=nM+ZGsRizO+FlFfgsTgy3mxcq7wC5gpEZP83P/aFxndD7/uB8PMwd3avVLh3m1908E8zrG+MxCEHQ+x2oDK6cICsuyS1DFqtB73K5u7ZBjTvdnMT7ksRFF9kRBCaGBDyEMATsfHgAgw/MTrVjOyMU+oc0IC8U0jcD54celGOgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503061; c=relaxed/simple;
	bh=i2b2Tmh3QBKB8lnMjy8wbVFD+3DKDGRT24dTjVHC1gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR6VFeWXR69dGN40pmB0/uDW031sX3BN5xpfSKLbeyP0l8XMQ4xhmc2E7SVP9JmP1VM2Y0jnG5HNKW2am51WBBvsJqpidFRj4g3ZcHfBvLpKJuYQmUCrk3JQBLax5vx7cvEOMYyqCNHpjsLvZD1loxeYUFYv3hNZalmtaG8BldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWOQR84e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLbJdVGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYBHw3202157
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JTDQ8EZQyOUY5F7DTRAbDbUi
	E/JxgTUqlUKictmW1Sc=; b=TWOQR84eZh365MSByIFKohPlhylJL/6ZlMf9ykoU
	BWHTI0fPZexY3/bM5SH+09khdKH0w3MJJ69dhPbePUAlAQ49TW+QeWpzlDDOofTx
	b+nm581QF4v8D55wJww87SxKdCzNumYhgcwwZgIF1KsXW7l3iJcejNZAH4Quyuum
	I+EAq3Ot6rdPFO9P+92ZObrkg6HQOYMa7eHfDQUCzWvWQk+gKWkuRjpTx19UKhvb
	Fu2xvNsAKTCj//4kQagsDcm/Ai8Jwduqjhj4XUZ2Cyh7Y+3fDPKdFeRBza+ajp8h
	ZtNCc0W3lVHMzi+/3PyaLua8N25rc+SoLU+msSyzjNWhHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9fdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:50:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c530da0691so274889085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768503055; x=1769107855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
        b=JLbJdVGIZzRaykUApK1+N0yEUdhX3aVnLzJg30HddZFk0Dn6Esjn+MUcynAQKREosB
         UdwU/WC6v1fKVE0ZMcmU2d8GYLi1K+cPDKUPPUUg2kShumaBlfVSPc183m+qkl91lLsA
         lQvuUIsSdkrqqu/RB3lNRZw3RGLPwEVe9ljjl8mI2fHmKsIu7aMEBRx3E6m/H8IERRFS
         8gCgtALXrSxFkLr+AP4zlNbW9WXwzhoq/vmp85fTcl+btVq19X4nLWJOAiXQ1OAUKNHw
         sVZr3zByf8rVo2f83frgvfCwiSMbI+kbkNFq2AWTF4uHITCCMttrL4vbRwc7yOHXaa3f
         SGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503055; x=1769107855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
        b=ohVuMrmBsGEW9RLpfscoswduBbKuC5VpeTZ/VhCI7i17hv9Uv1H/Mj48lf1K78H306
         xlSUS7a1fXusNQSbSyoUEpqT5xQBfanOtfhRXSZBsJTOcR3H5bSgHCK6E5CQ7684jmtO
         VO6S739jbsUYofAMe1hkLdWzPjPwkj4nAkMIZINXIfMaY9EP/d5PJP2DmeFEW7Zvl8XS
         XuP7FCTCewiOJev9AA3EUJ5yF9YVhm+UPcaxIjGVASmk+m3AMsIU6lg7YRhHSgiJbMFj
         anqZIUYCPuzhAJnBwcblLgq4eGBVD5dbBSodB9ZpftZf7oJA0XjvO8p2aLUhf4ao2GMw
         xMzw==
X-Forwarded-Encrypted: i=1; AJvYcCU4iYjNOCFW11qmV+tSr0d3eT1UFP3waFO9kxmoow0mzNygzujZzg9LZ7dPlPRskwqmUKwYlayxdUbWPAyt@vger.kernel.org
X-Gm-Message-State: AOJu0YwD7vgSMPzLRJNM1HF7+E9A9mHL//p+3Otfj/7s7vW4hBr70AJt
	T4EVQrkejdFZrfmj1fr1YmLUAVInY/Bf/vTNM9GnSzepEAj1ZBxXVhlzKXn6wrki3PpWMmjmYO/
	EUvSrKso+fBLOf6fKWsD+VWf1xA9Hi2qxorY1cwWN9Fc5FOk3kM0EKPr7YTOH383hhxo6
X-Gm-Gg: AY/fxX4sCkzffcKsV9PWJD4lLVtvgX5irvVEffW8ijclXAOB0cKOdU1ZjFlR/dGR0P+
	4WplnLBcHM1loXOdKTF98mAVkzMLCbt9i7zz0zGIrm0alaG9yxg5Y+0b+I/Prmatjbh5QKPqVya
	+zvKIoGWYbnQmmrCYQSZt1HjxiCHM1H5YJl3F8DQhiWt5TjAMCIuS0WKLTy8Op868VFE1NpC7/c
	sI9XXpxbBvmUdFNt89lrCtJajkh90e9BTQTgP2YDEHRnev9uPRmCoCUbvf+F0gEPpqzmqUgtp6P
	q3wQBK1ZsBDZPV8KGeZ8iJz6a68NPsnCvLJEk+G8FTLvP/HAG9uF/7rMNt5/kj0B3FXcrOwCAZ3
	QWN9EQXGzk1nC+ohBkxaoWNSoKY+obTvuUGXq3VTCsO0O6Vxp45opX5kenAOvj5OfqbWoZ1khjr
	MZ6RKVGIjquQUHkCliduJZgGo=
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id af79cd13be357-8c6a6948169mr44165585a.63.1768503054543;
        Thu, 15 Jan 2026 10:50:54 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id af79cd13be357-8c6a6948169mr44161785a.63.1768503053988;
        Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3ded3sm1016811fa.9.2026.01.15.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Date: Thu, 15 Jan 2026 20:50:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <i2cjyphx5olz4l25pdbt2yso7ryoc4usbnl27ovrou3ih6rptl@prp5lhv56bt7>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
 <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=6969370f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hGIm1wR9W1a6VHt1PZMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3KZamM6bV6gxHk26SV8hE2M5QT06mgIz
X-Proofpoint-ORIG-GUID: 3KZamM6bV6gxHk26SV8hE2M5QT06mgIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX8lCOwD9OhC44
 RZHlVxm/AfFkH4yD+Z+mUiApFn/Rnn2cykuEoPbsNgEfLlYYaajZ5e632cBkHfa2DlpytisW2QZ
 GZ263O1gIfNDVRwxL/ALnBoQ5eL+3rLzP9piUmJyi6LkZCro1Okj8Ai+UeQ3CQP2kpLYVSlYhcg
 DokWQRJPEZ5v0314zwW1BEkU9nKa/UsZ380keYNgb4p3lJyKFWFpX0K5q5KxfbhXCUy4AOixu55
 ZAuVHCW5/Tefalr0lgO/J52N/gPGuKxwdE2YHFPxO/N+7P0sZwlyrAyOP1gImdkXjoC0PBQqAey
 M1Phq/sU0jVtS1GW5tX3XQPS8H9oqiDELKDOqadNWnFI2MP0Ub/lrFVq5unVHM4HkrcakFtVxBr
 kbwwQAEvP2w8dHNDs65lYu4IAgxOyN8W93cyzh4ykAl6mYyKnaVG025SWYf0GlS3G8SAd10ksB1
 WbVxuQfjkcdRcOKvftQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

On Thu, Jan 15, 2026 at 09:39:29AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 10:30:49AM +0100, Konrad Dybcio wrote:
> > On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > 
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > Link disabling is already done in atomic_post_disable() (as part of the
> > > dp_ctrl_off_link_stream() helper).
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > 
> > I think this part of the commit message no longer applies 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index a05144de3b93..3184066adb15 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >  
> > >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >  
> > >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > >  
> > > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >  		force_link_train = true;
> > >  	}
> > >  
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > > +	}
> > 
> > Previously failure in this call would have propagated an error
> > 
> > msm_dp_ctrl_on_link() enables mainlink clocks, so 
> > 
> 
> Missed that one. I guess in practice it's not much difference from the
> previous behavior - where the display just wouldn't work either, except
> for the crash you point out below.
> 
> It seems to be that it would make sense to return an error to userspace
> when this happens, but the kernel-doc says:
> 
> """
> The bridge can assume that the display pipe (i.e. clocks and timing
> signals) feeding it is running when this callback is called.
> """
> 
> What's the expected error path here?

None. The only thing we can do in atomic paths is to set the bad
link_status and be ready not to crash (especially at the disable()
path).

> 
> Regards,
> Bjorn
> 
> > > +
> > >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> > 
> > IIUC this will crash the machine if the above fails
> > 
> > Konrad
> > 

-- 
With best wishes
Dmitry

