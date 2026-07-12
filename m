Return-Path: <linux-arm-msm+bounces-118579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o+gBAmGdU2o5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:57:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE1744E90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:57:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ldf9EwfD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SPOd14tC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 209F8300CE7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14EA39EB40;
	Sun, 12 Jul 2026 13:56:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0173AA4F7
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:56:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783864608; cv=none; b=EUGdSqyjFi8OoL96UWpRcvuSNORWxCTkeHxM4mxxb8E7eFArVvn0/yS2UtNLHtbnvhwYTR9kd4biAYBvuTtBaDNryPaNFCBPQDB2eWQv7nD0+66mMIOUxZP05xidMd/+Fq01ejOnKD3kmxATy1QaUDmINDBcw7Pygxj+B/Y2As8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783864608; c=relaxed/simple;
	bh=d2c31JhJlZ5l1dJgIbpUW/LOXuhTJTC920RIjbAHcq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkFEMMABTyeqWREodf3oY/Nqnd3/4Tir2TANZChvtbBvrA9rGhO8mE+F9fwbYHKor+d9+/qlCZ/EBAm82duDS7rKgcn8+RUFayMfyrG8QEG/ctI/7cRFFvdM4ui0Z/731u7ktUBDwfqTsJKC2Plh45BddGoDAr3k8h+dd8A9YuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldf9EwfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPOd14tC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZhAc2649259
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vj30YTOjkM+90gThnC3K2ENN
	keFiZ0gtgxaGsvN7hRY=; b=ldf9EwfDkH6ekhEKCcUvC2HkTjfXi8jNKkC5RrHo
	717JihnFsj3zyVVByFl0jwlVvVAKYfG0WqiD8IUH3cYqz1JWpG8yeR7juyylU4gc
	z6ANMVNjdsmcTYXNVSX0gdhebzkwOnN39C474H9MCWhfldEinDvwx4A+0SLwcdOm
	FVy3Ztru+davNw8r8vWoegHrhDjqoac7gzPDu+YWfnYm+4cAi46GJeT0eCzoxQVU
	GCAdndqGDmKl8zPRAoBCM4s/XCZl7OdgjF4nVsbK8OYTTeZKSG3vySXHSatL7hPP
	Bybc9nX0KX6Iy9IiJ00unL8SPhQXMpZxsmOV3XaH2vFC+A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe912vup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 13:56:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so29603341cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783864605; x=1784469405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vj30YTOjkM+90gThnC3K2ENNkeFiZ0gtgxaGsvN7hRY=;
        b=SPOd14tCtpNxGRAG0BZO5vqvA8i0nyWUXAAXY5JgWSz4BvmvPRWK5ogkLg8iwe5o+S
         Uh1HJ38mYFTd3RtPfg956mRu05O7WctQjw3RBbuOpeZmvlMneFfpUDsl8ulcgUaldgyJ
         bKhNJwcj7Sp+5GeGHgxkkYw5GZSsbzO+Vcx3GrnJQQuyXnJlYQgB2UbpDS+FIXquT6fK
         LMJzJcSN7NCeOq2IOdkyDyvG41jBGoSrUe1HkAkUU0KrUcklcnWerQq4ljqfLVvKmZyU
         AJjNS4KJ/omwmtMPA7Gr8McpCsBkXx0hBV/J0FcXWZzmquW0x72zN0jKDghJs8opQcPd
         lQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783864605; x=1784469405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vj30YTOjkM+90gThnC3K2ENNkeFiZ0gtgxaGsvN7hRY=;
        b=ZfoIUdeRCAg15VYC+nlfrNhL85qbg2cIUHZ1OXffRcpwQful0nqs7fN/+44u3RwY63
         KnizvlKt2PtLNk2HtFmaNaCCGoafohBrSW820aAxHEUJuJi5k0Wr8XDnz5OP2zjt3wMb
         0jvbO8vJtW3i/UiY612izTzaNFT4PHr4SUIXrdFIOeL15g+QVeXHP0P0pD06oqVRPyc2
         7R3r/b2juzy06VTgHgooUidi46mvhgQvgw953fSoCUTaGvZg2bKcommrZEuK4CAN2fzf
         KV/a6aamfvRf7PUXYP4lW1Pq8mgKNV2A2jLUqObeOA011O/Cv8KQrLyMvQH2Dtrbz5xa
         carw==
X-Forwarded-Encrypted: i=1; AHgh+RpWhzEglEC4rdzLR3//De8zptY5cQrced8/YD78I17U8zUG3jJ/1mTmtPZRyiAohQzze3NxkSK1c4ILGpFM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcxhdk/9A+EPEAVexR+YILNlvfn0N6m9cvA9TGtLzOsYw+xgon
	ONbiWZ0Dxa/kxXb6LVzIus9QKq+KMiHOYAsVqHNqhdmzZ2HKBuKlJZTB+24aX6SPPVKU/MjcgHQ
	a2H9BFrpcZZuDAJ5d+Ei57CmLn+ul0P/DkOHZMSWIzF9I2FkecdpQpa2klFgP0UuDlj/q
X-Gm-Gg: AfdE7clIaGPWh+tQ10HEX1Nnalzkrmm7XfNg1KUVqgdZjHcZgQMd5nPvF64ePdQD0KU
	MZQR3jLbXQeqm1M0bUCyTsDq5ey/jD7g6EfnuaDNpwkhU1dEic9i1OGU9TX9FVWKm1W+yWJPVhR
	CPuxXmKi5woV7iMyAeSVmd657xnV+sNBQsUWpc3CJ8c7kQa9vGZrAU7CKQ59U93cYm/5NrSf77z
	qsle3FP+p81/gUG2JWD14enJtgtAjzi+JeXKrrCBJkIfEdX2ltCJ8z4h3piekjlH9DsvYtf0BXa
	cWUeYpOWuDXHV6ee6DMu7xbCI9YiJa8oItEOB5bNyv4LiICSaf7U+mRPxhsm9QmgFETbGFL0eDo
	bE2hOWkwPvXzllQm+hFiX5dUxkJVpWefFAf7Zpabxbzr9uQY1NV/InzJPRpshDhoMJxBcgDx4cc
	7hzen9yjvP4zS/kLOrNke5GagE
X-Received: by 2002:a05:622a:8c3:b0:51a:8c9c:7f3b with SMTP id d75a77b69052e-51cbf26c01emr59435431cf.62.1783864605443;
        Sun, 12 Jul 2026 06:56:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:51a:8c9c:7f3b with SMTP id d75a77b69052e-51cbf26c01emr59435291cf.62.1783864604924;
        Sun, 12 Jul 2026 06:56:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab1491sm2057788e87.82.2026.07.12.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:56:42 -0700 (PDT)
Date: Sun, 12 Jul 2026 16:56:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 05/25] drm/msm/dp: add support to send ACT
 packets for MST
Message-ID: <is5m5apuf3mujjm7y2edxbjjygc4w4wpp4i33vj2cyh4lzte73@heinwvrqnaur>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-5-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-5-2ed6aee1867a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a539d1e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Qdi8XrqBvsyCqcF2G-kA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0NyBTYWx0ZWRfXyC6YTIFMHHqt
 zUsdpIcLpUK/UiYPUZXivSZJAMDyTxI17pts8V9IcjC1JeHlRVQlGZVs2GsLksaOs5mCPrc8S+E
 YfB88swL569vAyXCywPGmMv+McNJ/4k=
X-Proofpoint-GUID: A6-MILv4X9qgHKI5Ducwqy8bvMRXpDyJ
X-Proofpoint-ORIG-GUID: A6-MILv4X9qgHKI5Ducwqy8bvMRXpDyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0NyBTYWx0ZWRfX988DuYNE5VAe
 5pTHiMixIN/pPyLHpc9oRudtAQukw5NP+99cZRyROQ+QpzmiP5x81WIIxr6emz+3f4EoNIb0cHd
 q2Gt/UFhgpbOidC9YzAOyuLOKLlUIKcdWkVWjdeF1cimjz1Db2996KxUjSIDuf+tBxC5/rUmBGJ
 P1BMM2x/JGI9dL+V0et9NkxMpP1Nxl6aNmOtXzHzJ6smPLvh/WamSWhEwhSIMiOxfzzZld2iZOu
 dvlQk3QNHXstAa7mAdUAQ5MbHAoN6fLe5aYwfyRwiLshaAwW7XtFNATGbF2flqkxojOPEcTKQzF
 mX9ac4aonW1PwUzh5qG6jY/WRRFt6VQvYnqgXOvd72+iq6wtZ6zEUz1mQ+O8DYZg6z+SF/7K2tE
 taTvQ4Q6J4wcIY75B4w9zscmL/ijg/qYFWxjxLYLJouNguG7alYE2fB9ti9myNZsUU0m97Br+dU
 fp8BGHQvy1yRl8205mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118579-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,heinwvrqnaur:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,quicinc.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FBE1744E90

On Mon, Jun 29, 2026 at 10:14:26PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  5 files changed, 52 insertions(+), 3 deletions(-)
> 
> @@ -2623,6 +2656,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> +	ctrl->mst_active = mst_active;
> +
>  	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
>  	pixel_rate = pixel_rate_orig;
>  
> @@ -2658,6 +2693,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
> +	if (ret)
> +		return ret;

Should not we mark mst_active only here?

> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 310e5a1cc934..6808965878d4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -156,6 +156,8 @@
>  #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>  #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>  
> +#define REG_DP_MST_ACT				(0x00000500)

It's not that it is a register in its own register space.

> +
>  #define REG_DP_SOFTWARE_MVID			(0x00000010)
>  #define REG_DP_SOFTWARE_NVID			(0x00000018)
>  #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

