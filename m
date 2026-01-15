Return-Path: <linux-arm-msm+bounces-89250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0DD27C75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D72C30617DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190FB3C1FE2;
	Thu, 15 Jan 2026 18:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dm3pWua8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyxmYJR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04F93C1FCF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502914; cv=none; b=gY6C7w2ZDDZE/GTPcHwmbd80FY18qe6yiefxQhvmbYVzfpdviGg63LG/Uivl7p9G1mm8rdTr7huMBtzIu2APOhcGE1+185YB6lOW+Bso7But95AYdYu78489Nv0ygNvAeGuoTIaDYCz5GuWe6S0YKDjsziVwSXZPTnqD5U4+Qes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502914; c=relaxed/simple;
	bh=J1mcagV5yjlB2m/7+OGhLoRApMPi4RPXQmJ+eX/zlCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hw674zpOZZVBpfefqxr4/50/1qPh6sWMM/9w1QVuo4X4iWNVpMic5VwLORSR4xQQEcSRaWEQAkg+50n6FqnPxcAL/iYPPLSdQzEsisoWFk+Yuv9qd+pd5mt5Tq0tD127m6e7GwLpVk32RHwWvn3jZFqXiyc7dWojDqDBgVrgrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dm3pWua8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyxmYJR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYBiP1910032
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+kGULx0ZlJNIEVEzx9Xsp+W
	0l+4aWGW2n5tMCnSgWU=; b=dm3pWua8XpugZzSe1qTqjLw+5mct/HlK65nv92jl
	YwVrKJOAmQxvI0qkWoSoC0BbHBVfweHmRDZ1JgRAzB6iaCiBLhT6iwHHX6n+c7Ny
	c/RBJuPpGks9BvP2SKDwQPDLfIR2DOOfAaYXZwNxP2TkQiYSsrDib6S83roLYE79
	FNzwYGdDUW+c69AkU1lxKvFC0EKtNkyFCJF1gywp69x0EpJPBcabDI1VBlcDoCvg
	WdmPeQGz6LAwHY/sW3UdT1W7agdo/hsOKEUb1Hwv8lrrtRjW9A+dIa3cEipbUdwb
	EE2zFjc8dBA3/btrxzYS32elokI7MFIvhdCxoLqRIAM+VQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1dac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:48:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a4c50fe5so170923585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502907; x=1769107707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+kGULx0ZlJNIEVEzx9Xsp+W0l+4aWGW2n5tMCnSgWU=;
        b=QyxmYJR8hSEdN0eA5/E3Axvg4LhndRAZTnTrPIQinx0UCHMJz/MTwp+4c4CS+1DoxA
         CZpGo7n7AVBhROu4Q/tz8Me6EqEyNmYnl9wA1itTXJVj5WRqSBkxktW9ObYCcgpnQNap
         +N4L/WlqhWt6pJHiC0/FpDH+QW9j6QArSMN8fcAZcitccSPwipOVwEYKM1qX2r33abk2
         GR+8C4SOvgyl+VNcFcGIeoD45yfQakWnrA9yPHy/9xw/+uH1qcR02xFyGeZ5fp/vTDdh
         w0uhGrdkRByga7crirMHOuf7J6B7I60xNu0x8sTp+RNMfVUcjmjSpCGOPJPneC6AlL0N
         BPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502907; x=1769107707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+kGULx0ZlJNIEVEzx9Xsp+W0l+4aWGW2n5tMCnSgWU=;
        b=lAsR9mnaKl2rY3S5lFTFsK0PRYLz7aZdqSLFEy808mJOiA8bvGlAVEfl/7oXXJvBJt
         4QXkjBaBHTTMruMYMj4MgBQzuveFZMPM45gD8IEiYC4jFIC/LRupH3ab8qKTK3YCeKot
         R2H935QUfOSmLWSnw994knsqrOwOPc+ctwyIkkz4kzD7M6+NOyfjLeoPHqc9YPo11IWT
         jTkkQoe4o1051JDXL1S7pGP6CAMj2FIMHVnzoRLLtLAqKg9lr1h6+opSgO69SsxH8R+7
         y2eQTUX+5Zv40rZXR+TonLhACaNVvkD/K0ZGnKfD2RV5Z6CRFAMdrsmpMOaNGd5Ga7S5
         59cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz1shzc1rZU1vSeP+oM1XhGg2+NAMfBl9R+sWq/jBZQzSGy4M0JSnExmtAeMnJiaMBtmr0ST8RskejQVXF@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcXuIVJZaLvd75UUzdUEYZXb4SbrvWGL6xjCHcKgbhVMBke7h
	IlN8GzLDdObq4z5NNir1upEyWfBKkDWedMy1bmy9RKBayzKKa4RPRyk8OvSoZiq1TsO8eDQqQsU
	StOKVq0UwmqRKc/N3tzd+lW6/NgU8RQYUFHqvTci46WjvkNL5ekpAjPdiyIeybkhw8+xb
X-Gm-Gg: AY/fxX7idOA5hPC8BQaSCXKbnYhRLsYkwmBGIyVlRVd/ge3s/qANYS90ugFkwmzuB4Q
	uqjqdihaO4QDqWFJKscdsv95VOlQPwlxgyPgTVguyIowKswy9j1wy9ULca0gOUgKGGtrcK8dKRR
	pFKRRj6ab5AOx7l1P9VIX4yteraIM7SqCs/Nu0P/SBcKtFrWMx/3iT/+PCalWdYGTYsEy5ApEHZ
	EHxJC2HTwkDA3/+NWe3CifrfO80dANc/Qez/QK5Pk6wnX8sdX5IQkTF9Ha3KN4+cIzfrYfXON+U
	jw4K0zo2EiWQ0/p6SxBkNdXKfbl0Ax6a6mlTpFDvfSyWK+QNH3uA88v986IWM37haRL0YdkpyeE
	8jSCaxwW+9bd20e8UuHojRyQYdwyzOFMu8tQ5hvW2n3/t1InTm3optb6i7egtJ1VpqOMle/B/u/
	2fZgqa89pMup/zcHioD/axWAc=
X-Received: by 2002:a05:620a:1789:b0:8c6:a3b4:cece with SMTP id af79cd13be357-8c6a690638cmr54970085a.38.1768502907334;
        Thu, 15 Jan 2026 10:48:27 -0800 (PST)
X-Received: by 2002:a05:620a:1789:b0:8c6:a3b4:cece with SMTP id af79cd13be357-8c6a690638cmr54966485a.38.1768502906838;
        Thu, 15 Jan 2026 10:48:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8b25sm876551fa.47.2026.01.15.10.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:48:26 -0800 (PST)
Date: Thu, 15 Jan 2026 20:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <35swyvpxv6xf64lgl2o6hy363ahjyv6gcrfnv76vcgec5qxmb2@etujn65vcwho>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
 <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
X-Proofpoint-GUID: QUUatyjpdHGPy-lSMe7i9Z_lt2vbHsoN
X-Proofpoint-ORIG-GUID: QUUatyjpdHGPy-lSMe7i9Z_lt2vbHsoN
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=6969367b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ttbCVT-mbSeCTn1l7fcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX5Gn3nwOK1KN1
 RrrQGfUiRSdwDAzozHxZf5xMLD2K35oLbYOdQvkNXu5+HMFRyS5q09ehJDi6BP2pYKtEew6WmCa
 s1ImUNehkHUrBh4srn42wBY41bEBJ0E01YKqErc/azJFV2IYqrCvuvu4tQmiRTFP7BYX2RI46wN
 51TA0CZKI9cJ+/+8ZFORJyLI8HMywxDwZ/9fz08zw/wNcAOKQ6q/0Ah4nbf2ZrdZ4dvgxBq78vu
 9R0fF41gwkFHEcWXVtEkIgoTBxTEVuqO0J4P6+lvvTEeQd7OZoewVr8KkbvUiihPvov6GOk9Llv
 OK3hi1Djd3RsjYMJL/lpHI/DJBZco/cyGqDmuiOH7VUydPj1NZjlkGlPo9KoU+2SUw6PXY2tL+4
 Dhg6bBcoFRrEjbYxbZEPFYDUVaAuilezyMKGqZyn1D4wu+gw+dclSNxwclJKwlEHYGD7tP/U0Gm
 V+eEje4+uBtEmreFvvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

On Thu, Jan 15, 2026 at 08:57:24AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 09:29:08AM +0200, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Instead of relying on the link_ready flag to specify if DP is connected,
> > read the DPCD bits and get the sink count to accurately detect if DP is
> > connected.
> 
> This makes it sounds like the two options are equal, but they most
> definitely aren't.
> 
> I think this commit message should capture the fact that "link_ready"
> not only says that the cable is connected, but that we've managed to
> bring up the main link - which is a source of race conditions in the hot
> plug detection logic, as well as making it impossible to move link
> management to the enable/disable calls.
> 
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
> >  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> >  3 files changed, 62 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 5997cd28ba11..a05144de3b93 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
> >  	return 0;
> >  }
> >  
> > +/**
> > + * msm_dp_bridge_detect - callback to determine if connector is connected
> > + * @bridge: Pointer to drm bridge structure
> > + * @connector: Pointer to drm connector structure
> > + * Returns: Bridge's 'is connected' status
> 
> Could you please rewrite the return definition, to capture what the
> value really refers to.
> 
> > + */
> > +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> > +					       struct drm_connector *connector)
> > +{
> > +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> > +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> > +	struct msm_dp_display_private *priv;
> > +	int ret = 0;
> 
> First usage is an assignment, so no need for the zero-initialization.
> 
> > +	int status = connector_status_disconnected;
> > +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > +	struct drm_dp_desc desc;
> > +
> > +	dp = to_dp_bridge(bridge)->msm_dp_display;
> > +
> > +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > +
> > +	if (!dp->link_ready)
> > +		return status;
> 
> So despite the commit message, we're still relying on the link_ready
> flag? (With the improvement that even if the code thinks we've trained
> the link, we can still determine that we should report it as
> disconnected)
> 
> Perhaps I'm missing something here? Did we change the meaning of
> "link_ready"?

Not yet. It changes in the next commit (and I should probably add a
commit renaming it). Note, before the next commit (moving link training)
we can't completely change detect() definition, but we also can't move
link training if we don'g have a proper detect() at that time. I agree
with Jessica's decision here to have two separate commits: this one adds
(imperfect) detect(), the next one moves link training.

> Other than this part, this looks quite familiar to my experiments. Very
> happy to see you continue this work!!!

It has been on my plate for quite a while. Let's finally get it done.

-- 
With best wishes
Dmitry

