Return-Path: <linux-arm-msm+bounces-61444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B086CADB275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC5E1881E97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C332BF001;
	Mon, 16 Jun 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKxODzvU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56746285C9F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081695; cv=none; b=YLeEeSo4SEMaC2IFt1KzxJPkrxU+dTfKzWfT1hJHn2ic86Dlccn67A5TmDM9l3UBnsSA75F911r8W+U6CHqRi6h3rOG56d8lYgwH3RBmy9+4PE5jABW4S8ubZIB8Pcy2d/Yqo7C+VNlhkvCr1dmf5ZH2VOr3XvJVib4UlpUFUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081695; c=relaxed/simple;
	bh=GzgbkQhkxGKkIQaYd3TxcpGQW2BoX1t9v+87GbmUuoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH9Kl0uxAqEenk44MBlGrdlYCu/HEt3fZFuBAqt8k/14YJLQvkTxZg0Ph/+vYCLbl+ACj/6Q199072tgwc7F2Q0PlDlxvOvcKiEbWnPyZTS3GeW5WWka9A9QTPwOIQDSEV+RTxwSovU5dB3mEfBvME9fj/hTE0uVoRdKLnN9bGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKxODzvU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8RBCN019132
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BIIY/fRKWsQgNmG2HbZPcw1m
	+aSAr4IzJ2LTNf0iuZ4=; b=fKxODzvUyXzYkNWXxcEuVXnKnKWE8tgplu93rLqn
	/jt8j6bVg/62lB45+YRYEslrCh0UJFCfNy/0iPTqqYVpTZt8RkbqF5hbR3hwWV4c
	15r7sqSM6oPhcJgHnFdJCP9W1B0KtISa+9xjsSEudS/7DlI9pReP/8mvyKs5D+Qd
	cd0WJ82x27xZ7v2OizMGkXUyf6zPuzksfCw5qDcJMLPTQwilKyYGK04rxswHGu+c
	Ki8UNWfgVjWinIWkO93K+hf5UDFDATIFUriAqAKfoFqs3youqo6wo8CbZXk4Kxpr
	sgxjo31Ow/tBqp3j0/hM/vMKUSX3APZRu4FZOeGN0M3wWA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791encppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 13:48:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso58495196d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 06:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081691; x=1750686491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIIY/fRKWsQgNmG2HbZPcw1m+aSAr4IzJ2LTNf0iuZ4=;
        b=t+UnzuGjZLykH5GjrgF1CS5vfBUm8KufmSvJGZBw32d42yQxOIcpWYqhs6DI//YBSN
         fdoFeiYtDW+8gXljRo/4rrSuNkcF/d5Q5ISAaHbPLQwAcNU6oy7PGzTGGf4xV0BYQVpG
         Q9zKBo80fdfWWXHfHOmNTDx6mVL/H+DYUXfBUyjIVURBQKPfzsuCpQYkFfPLuAlaabNq
         LbciTfQk7YNKMxwWXS9oYlOBqZHLrWTaosh/c+1rFi7Anzq1ddNy6WaCvxjfV7UBc1fn
         g0Eo8hXMwQZM6Syb4iJMXeMoXpzZKiuxorxPC4Out2qt/wK2gtcKb8rhpoMOtUsCRVYX
         5Www==
X-Forwarded-Encrypted: i=1; AJvYcCU/E9M1A0NHHlC8gjnJ8L+5yLVr9BB7fg04It/4+GbG1eHvs6ocIJXbJjkvzgum6TZH5kYbwttTnglTuoVM@vger.kernel.org
X-Gm-Message-State: AOJu0YykGOrEbUyChxrlhumViyQNTnNElB7nyD5EYSuqxs4WLD6b18Wu
	h5C3ECS5ZTeYT1mAMtFGqhaEaHfzqfySFFX8l36r98Sj8kKaDmUWcYzWHmehBAPcH52kq1Ynm5a
	MSvkyOSzegmGH+xkPpMitOo6SwuzCLdqlRsnlNRqmSXF19TmcIXvc0/c1Vu4ISBC0+lvp
X-Gm-Gg: ASbGncu0xUX/rXG+ijVysPUBtCiWPbdzhvqbxaZHtmmb3auLo81SzXdHGmEQYldKVD0
	KO0RlvvbxHzP0OEMvRFW46aDRMs0GIAyq7f8RGHoJ7eOpWLMqWo6epOlj0gNRjtL8/BQA9VGIi9
	JLNtz7N3Q4Wf9BC7MMeYiTb3j0bj/XsMHo8jD6tpinjTv8RafpiC7lPQ8QXDFI6n8EF5fkT2mME
	50Qyv4pxSrorRRpX+G/pUyy6O7RZvflETLWr5Spxi2P6bRhujMO2ii/q48pZyO1wj+mf9zAUoC5
	jF0i6axq4tUYJRqZw7WaCqA47Y+o8TNLyI7cNjRs/7O4cMsA6Fnd8JOwxnmDPssGx/eILIcH6/3
	Cax2pkQ/edR5KJV3hFdY+nBxZ4zOWGGyaYmc=
X-Received: by 2002:a05:6214:252d:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb47729df2mr137837806d6.12.1750081691121;
        Mon, 16 Jun 2025 06:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4hLKRzzWBZMauvEObY3mOqYUuEjkBCcDNkBKkaRNoOK6orlQCG9s5Zi1kcaeGYrzQFeU1Ug==
X-Received: by 2002:a05:6214:252d:b0:6fa:ff79:2cfe with SMTP id 6a1803df08f44-6fb47729df2mr137837276d6.12.1750081690559;
        Mon, 16 Jun 2025 06:48:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c25d5sm1537270e87.166.2025.06.16.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:48:09 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:48:06 +0300
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
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
 <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
X-Proofpoint-ORIG-GUID: KSZi9qVJ3NzLkAzXDcISsnethrIBxUuh
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6850209c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xh06mepXuQVyf8XfyCsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KSZi9qVJ3NzLkAzXDcISsnethrIBxUuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4NyBTYWx0ZWRfXzj7nyJ9qGuFJ
 FZqlHbnmP1KMKcvAd61lq8bhZNazxRvTxWLV1X8CqU9zDdb6XQJ4cYB4T2eqK2w/ws8KvY7wIfD
 7Y9cS0SEz/7fGqqCoHKRo44XErUJ11Gmd6/7NLTHW/ahowOmewVxJOivJJOla2URslYC8wU9qK8
 H2F0s8SOgFHMaofHmpof9tzcik9LpNle1FBqQdhtLBbj0VBrmxx2g3rKnzelpQEbny66VDzIySl
 I+h66oklYDn4e37l7qBhvIF1byUYvaEdBnSMyHOjNPLmDoUICDwBoGT1Z3FhrTCyspuwOXi1j47
 GxfKzC0iM+sP04mIe4JyuLuNnewtSflsez97RW2aHOs0licrCEGwaFholAEXJYPaI+qrurEdYvd
 MMAv7hQw1tc/oIbyrRAXuF56IxvyBm70pRWHifGk+NzcNjJ7qRvd3qW147xIw2nhcDlcpnTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160087

On Mon, Jun 16, 2025 at 08:43:40PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 23:51, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add connector abstraction for the DP MST. Each MST encoder
> > > is connected through a DRM bridge to a MST connector and each
> > > MST connector has a DP panel abstraction attached to it.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
> > >   2 files changed, 518 insertions(+)
> > 
> > > +
> > > +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> > > +							    const struct drm_display_mode *mode)
> > > +{
> > > +	struct msm_dp_mst_connector *mst_conn;
> > > +	struct msm_dp *dp_display;
> > > +	struct drm_dp_mst_port *mst_port;
> > > +	struct msm_dp_panel *dp_panel;
> > > +	struct msm_dp_mst *mst;
> > > +	u16 full_pbn, required_pbn;
> > > +	int available_slots, required_slots;
> > > +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> > > +	int i, slots_in_use = 0, active_enc_cnt = 0;
> > > +	const u32 tot_slots = 63;
> > > +
> > > +	if (drm_connector_is_unregistered(connector))
> > > +		return 0;
> > > +
> > > +	mst_conn = to_msm_dp_mst_connector(connector);
> > > +	dp_display = mst_conn->msm_dp;
> > > +	mst = dp_display->msm_dp_mst;
> > > +	mst_port = mst_conn->mst_port;
> > > +	dp_panel = mst_conn->dp_panel;
> > > +
> > > +	if (!dp_panel || !mst_port)
> > > +		return MODE_ERROR;
> > > +
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> > > +		if (dp_bridge_state->connector &&
> > > +		    dp_bridge_state->connector != connector) {
> > > +			active_enc_cnt++;
> > > +			slots_in_use += dp_bridge_state->num_slots;
> > > +		}
> > > +	}
> > > +
> > > +	if (active_enc_cnt < DP_STREAM_MAX) {
> > > +		full_pbn = mst_port->full_pbn;
> > > +		available_slots = tot_slots - slots_in_use;
> > > +	} else {
> > > +		DRM_ERROR("all mst streams are active\n");
> > > +		return MODE_BAD;
> > > +	}
> > > +
> > > +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> > > +
> > > +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> > > +
> > > +	if (required_pbn > full_pbn || required_slots > available_slots) {
> > > +		drm_dbg_dp(dp_display->drm_dev,
> > > +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> > > +			   mode->name, required_pbn, full_pbn,
> > > +			   required_slots, available_slots);
> > > +		return MODE_BAD;
> > > +	}
> > 
> > I almost missed this. Could you please point me, do other drivers
> > perform mode_valid() check based on the current slots available or not?
> > Could you please point me to the relevant code in other drivers? Because
> > it doesn't look correct to me. The mode on the screen remains valid no
> > matter if I plug or unplug other devices. The atomic_check() should fail
> > if we don't have enough resources (which includes slots).
> > 
> Currently, I haven't found other drivers checking available slots during
> mode_valid(). Intel will check the PBN in here.

pointer? Also, what do AMD and nouveau do?

> This condition can help us
> in the following case:
> 
> Assume two downstream devices both support 4K 60Hz 10-bit. In MST mode, when
> the first device occupies the 4Kx60Hzx10bit mode, the remaining bandwidth is
> insufficient to support the same mode for the second device.
> 
> If we check the slots in mode_valid(), the second device will reject the
> 4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is done
> in atomic_check(), the second device will display a black screen (because
> 4Kx60Hzx10bit is considered valid in mode_valid() but failed in
> atomic_check()).

If we filter modes in mode_valid(), then consider the following
scenario: we plug monitor A, plug monitor B, then unplug monitor A. At
this point we only have monitor B, but it has all modes filtered when A
has been plugged. So, it is impossible to select 4k@60x10, even though
it is a perfectly valid mode now.

Also, with the check happening in the atomic_check() the user will not
get the black screen: the commit will get rejected, letting userspace to
lower the mode for the second monitor.

> > > +
> > > +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> > > +}
> > > +
> > 
> 

-- 
With best wishes
Dmitry

