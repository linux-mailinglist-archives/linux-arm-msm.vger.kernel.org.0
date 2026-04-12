Return-Path: <linux-arm-msm+bounces-102834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Mo6JVrj2mnp6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A50353E214E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5852F300E68D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9A1991D4;
	Sun, 12 Apr 2026 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSub15ed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb7nd35p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7818FC97
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952667; cv=none; b=UZX6jo8hqHL3rFSThFVf+cqJYMVhZGYZfv+cABHKFAel9cqGkRTWTxpGAJtGA9pnmAn2CHkvLKhlzsUbenFA/1a6d0zrYefC8sOxdz16q+urrgUckLSwZCGQgopd2B3UTS1jOwoCYFpDXfmRK3hUGIXX0jlylVzPv09RVkomQBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952667; c=relaxed/simple;
	bh=tPEHlh2Moqb5YefL+bn0c11cwmKpypJ6FdRs+Xc9ZoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DytFVyZaydGRjhyOklplX7l9et6dR3Y/nJ8ZcYJ13avn8KPBEKZjC6+moPjCfiaCC673H71eRdjHy7cixj4FNlR3EDiTu28FDfW4iDY+8zjt5aZmbfTwaJewxo5Rh4VFi5jaEIp4H0gliRAHUHzGepiMVCoi/3P0IQdMLMmkOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSub15ed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb7nd35p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNqSZs2918751
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PfCuThIzy1DAWtkxvSufJcbv
	iZnleEUkWpVjjUK8iQE=; b=cSub15edOvLTnuYDadP4533Gg5Weom5FOCJtX1bo
	MMp6HubsEYMgtXUfYkQV7qYknKX2ByHH+3dRU+1sw6X8mwZ0M5HpJGHwPMSLsXsd
	xtmVcEKemNznzej61XcSvOJcmQWkQRv5lZKNyWSDA/AKRBGD3M8P0nV9eHV8U1XS
	HjqdXytozpzA4pKN7RSXHrR7AaaMZt+pGKIosFLkUSztm50spMrXxOFusSI9nZcX
	LC24mT8zeg7f7mY+xq4knKc1+XAkPDFTVTFDL9IetPeT9Zc/BpLLw+/h8BXY0sKU
	1bGkfLktdu9B0t6cnq0AHS9I0+h1VLk+kgBnjiGSpU7bZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthjaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:11:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c192b3fso61416201cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952664; x=1776557464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PfCuThIzy1DAWtkxvSufJcbviZnleEUkWpVjjUK8iQE=;
        b=Wb7nd35p0fLHp11+B4fItJzp3r2RovGinZTkyv8uLkrYs5QvT9NAHS72UWZO+JyFHz
         nLOTonqAjwXO6QHVzbduDapVmMhdI08i2lBrP7+L804pqh5BJmFPRcTzgSdxouFdIMKZ
         otBKMGbUK4fg5KWbf0nnv8kms9DwiQnSe4rXoHIxP5NCBZ9VWJoEvdsVKS8MGJSCgvFL
         v6UKosJCaXrO5eZAt3z/v//80OBj4yAyEpm0O0I+no0yTJkJlMZwLP6+oz6qFWRb+NgX
         1KHrnrARlDsBl/1A6whEnHI3Dyy6Q1vOAmQFT/HYVeD4w714eMiXu4QPK3Ouf9wHWpjY
         3iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952664; x=1776557464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfCuThIzy1DAWtkxvSufJcbviZnleEUkWpVjjUK8iQE=;
        b=tEWRombGsSx3hVnoMEEbF07TVtTLlHYr7Iynp+49GqohFXs6HhpePE0PQAwN/YxWPb
         rfEYDBa0cZBsZG/6ztdP4ZVxYPCd7tuKr794q7BfkJyUxxa82Yp2EqKxG8Tjwg2oX1Of
         RlbhAQIHt0jDY0rEERLeo/AKOKA4KZOlzXhSwox6s2foRCwXnDoat4YoxGE9bNRWVpcW
         c6z/yQevPERoXKaWaWsdqSZmouotfCseGSUKh1NPsPwk9/ahbzgk8Jv2wwVQUVdiCBI2
         79uj/Tv20b0lKsuOqIShSqgo9au6+8rJ+mxuQfoNake8v3UkjgBVx6PLI1XxHRhBZqSW
         Dupg==
X-Forwarded-Encrypted: i=1; AJvYcCV7xR7Ph82+kXNGfyqxLqeSaQ/Liess5Aq/k+mOrROAW3Hh5+0GmX52yitsN9ZIr//sqis5c+3CMV+DG+nF@vger.kernel.org
X-Gm-Message-State: AOJu0YweyS/92GRuhZEpG/91co+M4/1mLm/X8xgy/4k5B8ActtUMqGas
	9q1UZrDQQvv9YgGV724gL8A/MDOnq33LQmX0osjdsgQP/TjJeZY3mEXz3jVcCzqPC544tLWtxVj
	DRjxVha7yEcCAHexxRVUxbyk0KQxCg8SLR3iay9HHSd57J8xyFrVs8uIJK+K4KR7nBCFZ
X-Gm-Gg: AeBDieuZrACk7zlwqRAf0JvulPBGL5fj9hjDBeO8MeHvqSw8zcWexBppV0BkvWEU2ZF
	Ea2TSzvnplkCbf+H+qpo0bSOSD0GveqoPO8oGCip58miOsgfUFC1eKbriCl/a7jAtg5n711Vksk
	ihZxRKypLJS8D9TiEVJsbPavwYpDAYO9bc55A8d1C+CjBSsCkftt4D0zWjHv9VQDzfFWbU2YhB7
	4EKBFlPq3kHFdUe9UZVR0LceGSgwMsWLweyNG3ra4OuswLKXZbJjzwZsqyPC8cXR0XjrvAerrUa
	2i8n4rGzNgIde2mRPWddi6fdigxEzJpmK8fsG6uaZhUJvKB1gi1wnCu38Vc46MiGT/XBYu0Yu0S
	npuKFgECJfFo/37DS3Q4E23zZNBCj968CUjbpDpMOsXkHVbHFW9xRy7UA3I7/ePohOZx/+Hw6tT
	EKttuDVymMSUA/IEup8WHj91ke1z0pG0mb/7k=
X-Received: by 2002:ac8:7e88:0:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50dd5bd942bmr132960041cf.16.1775952664375;
        Sat, 11 Apr 2026 17:11:04 -0700 (PDT)
X-Received: by 2002:ac8:7e88:0:b0:50d:71fe:85aa with SMTP id d75a77b69052e-50dd5bd942bmr132959801cf.16.1775952663921;
        Sat, 11 Apr 2026 17:11:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8d9e4sm1672409e87.27.2026.04.11.17.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:11:02 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:11:01 +0300
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
Subject: Re: [PATCH v4 27/39] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <ezm6cz4lfzrh2a7ohwdc73qbn7gblqjhwtwcp72ds7u6cmizrx@qvh7vu6kis2k>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-27-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-27-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dae319 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=bNG_VgKFK3iIsOFNL9IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wgy1LBbn9yPBG3MivLUPQ8JF1NJRg9Ga
X-Proofpoint-ORIG-GUID: wgy1LBbn9yPBG3MivLUPQ8JF1NJRg9Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMSBTYWx0ZWRfX61RNGky1gmfo
 ZJre3p/sMc4wanti8yukOVsE7Iu4fvEHxlPqN7tFXbANymRaPyt/J8JV7Grxd2u1oXHxnWYo9TB
 8AWfCMD6OsOw+fDg0aPxFrwq2D+gsXsc7ZY+uGjM8tCBV/CK569vhi4MScrOPT3Ns2QAZ9Cc4bg
 wuJPWECvothr3yn7ULMaPe+mXAlcNKq689ndgqy5Lk+j296FSHJ0AdWZtZ61bhWbqPrQBk0PUut
 TGVQB4HrLLxo5OkdyFoDjfwG8C8QTFlyoSpsgMkoVzRb7pOf9t0dXs94MCSq+BBQRQwhr/kC2dt
 ItQcB+/vwGIpSw+Smt6hsXHEuf5ZPPtijj13PilwE8DQgqCXJiXmmNrH2PV4p9P89HUQr7gCWNf
 QGZ2U8w7ek/14mG+OtVZkbWL/zEuCWKn4d/pimV/yneaWGhKQSwnayvVR3MzntOZtPNjuIfXTYV
 nTAi1J0QfT35CbWKuQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110221
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102834-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A50353E214E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:02PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++------------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  3 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 41018e82efa1..035e230201fd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
>  	 * such cases check for connection status and bail out if not
>  	 * connected.
>  	 */
> -	if (!msm_dp_display->power_on) {
> +	if (!msm_dp_display->active_stream_cnt) {
>  		rc = -EINVAL;
>  		goto end;
>  	}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 33d8539afee7..e6ecbb3a688e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -657,15 +657,15 @@ int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
>  	if (dp->link->sink_count == 0)
>  		return rc;
>  
> -	if (!msm_dp_display->power_on) {
> +	if (!msm_dp_display->active_stream_cnt) {

Okay, I'm now being lost between the names. When is prepare being
called? Is it still part of the atomic_enable()? Or atomic_pre_enable()?

>  		msm_dp_display_host_phy_init(dp);
>  		force_link_train = true;
> -	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
> -	if (rc)
> -		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> -	// TODO: schedule drm_connector_set_link_status_property()
> +		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
> +		if (rc)
> +			DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		// TODO: schedule drm_connector_set_link_status_property()
> +	}

Again, this more than the scope of the commit message.

>  
>  	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>  }
> @@ -674,18 +674,12 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  				 struct msm_dp_panel *msm_dp_panel)
>  {
>  	int rc = 0;
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> -	if (msm_dp_display->power_on) {
> -		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> -		return 0;
> -	}
>  
>  	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
> -	if (!rc)
> -		msm_dp_display->power_on = true;
>  
> +	dp->msm_dp_display.active_stream_cnt++;
>  	return rc;
>  }
>  
> @@ -731,16 +725,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>  static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  				  struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> -
> -	if (!msm_dp_display->power_on)
> +	if (!dp->msm_dp_display.active_stream_cnt)
>  		return 0;
>  
>  	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>  
>  	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
> -	msm_dp_display->power_on = false;
> +	dp->msm_dp_display.active_stream_cnt--;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>  	return 0;
> @@ -876,7 +868,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  	 * power_on status before dumping DP registers to avoid crash due
>  	 * to unclocked access
>  	 */
> -	if (!dp->power_on)
> +	if (!dp->active_stream_cnt)
>  		return;
>  
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
> @@ -1559,6 +1551,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (!msm_dp_display->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "no active streams\n");
> +		return;
> +	}
> +
>  	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>  	msm_dp_ctrl_mst_send_act(dp->ctrl);
> @@ -1579,6 +1576,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (msm_dp_display->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
> +		return;
> +	}
> +
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
>  		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 0ede5505be58..2548f67cd441 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -18,7 +18,7 @@ struct msm_dp {
>  	struct drm_bridge *next_bridge;
>  	struct drm_bridge *bridge;
>  	bool audio_enabled;
> -	bool power_on;
> +	u32 active_stream_cnt;
>  	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

