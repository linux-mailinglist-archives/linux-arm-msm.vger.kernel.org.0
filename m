Return-Path: <linux-arm-msm+bounces-102833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFNYKGPi2mnj6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AF3E20E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 674B53007F64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47551D5CC9;
	Sun, 12 Apr 2026 00:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd6ytraz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqybY1tw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE60724EA90
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952480; cv=none; b=JKKsQe/z2yyertEfsUxKwEZK45K536g7YVxvgZczyoXmIqxGG4fnQXNTG9HTAhW0rlqgRCY2jJEFI4bGRGuCMvCYERxqqVwXOcmCPz8szAU0bN5PiuXieEoJafoyibQ6XpeM0fzMBkh8Vkjle9s8FkeebqJ6ZBh4F2rrLNU3Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952480; c=relaxed/simple;
	bh=gs72OKSer8xggam3Boz61c4BtE6KLPoEYaQaBWIfiMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3aFopMOvm4HqaixI6hfAkBkHg1ue/jdyf4FdTTcQITT/aTUBFUHW84KQGuXDobTjH7Ry+LT6c7WkACjmtBlFvUbrwvjYpNDrJZH7r8HntT4gmiGzeSdFUqLUNEmVSzCXNRbqwKFGThtSKQQdXZ996GsXbXpDGB3uYxqYrbKFbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd6ytraz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqybY1tw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BLWhgC794215
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=61pis85xYux4db1AOderVe8V
	3hNhtxgvOnRxs24pQLc=; b=dd6ytrazfHKcXWqXnzg5e2SUmbI9ayLneRhzijeF
	7fkLJkNjP1a04EpFhGaJLdwyRy+jTm0U+6l2hNaVLjzERShgKruaqO9Bg4Dr7A8O
	5ZmkF4Qi9tYSc42JQr2PHHWpYauIUHUSXRQJu//HmBRV42z9i65rnGHCXrkqdAXe
	V/c27k6DW0xqiTiIn99ZryvUkPCk7S/RvMcQTiIoPB34zSjrWXwkpNqUkG5oX6f0
	Pj+1Q43XgefLfdB7J24xgumJPo5EygyFgbe+pCc67nsy3SfBs8q/NkrO/9jpsGOs
	XkGtt4lu39q4hixoTyMiJwMEHTJ84b1LnsMijE9e5WjyTg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp97v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:07:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89fd9daa423so65189986d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952475; x=1776557275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61pis85xYux4db1AOderVe8V3hNhtxgvOnRxs24pQLc=;
        b=RqybY1twnwxPuzjctWga3Ke1Pn2aBG94WL2CaiLYOUI1bEtQ2fAE54dExSkDBMuymS
         1k0aDMlVksbZn+tBbWt+HShK7ZQnU6pANfRN06CH5e5NFlcTCpzXQGnrliiMfXNGgfgf
         iX8On+SMTwvFlOPRPDW9fkW3gika+DApYcR4H61sD+jxNFrVHbcE1iYKv964mvkhPqGG
         EV9L9b8S5PoY+kjX7/9jITAa41f075Capg7CBYp81bFvfzxG3a3SERD5ZaMFG4coS/LJ
         VCXI1syAyIvAkncywUPYP7eEP2KctwnA7q4tBFRdmEHCdsve86aHfyccVGywHBXdUaHY
         ZwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952475; x=1776557275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61pis85xYux4db1AOderVe8V3hNhtxgvOnRxs24pQLc=;
        b=s8eA+DTgECWLxzpeoV7DTgmbnfmMusKmtYjOPB28iCyDQ5K475JHOOEhMJmomBgH+4
         N8ndllkuoPHOdczxm6Lmu3yvM7U85VHGJXrQ4UMQ8n9baamjaukexY0eO20pJ7ZMEuCr
         VkxLk1PAk+DLXHNNxVVtZxefAFeP93vRQN8YgpdZEPvt2Wg6tVP71Y+kpGGmtLqUoRXG
         hqo0zOGLZLYaztn028IwCkR5QjDIP2aJIhXIoV40ts3fg7CMrlPvJuDIGdY3tEmZXj9K
         jxXItIqyZcCGJFCMV0pzEVNXsc6Vn+6Hnsfj8tAqJBDDcqKE6phUDC8LC1e0RZlh+vVu
         ksMA==
X-Forwarded-Encrypted: i=1; AJvYcCWXiHxGI1vAwfHTePHcyR2GuEdhuxFyDaIKP5kZU0dhXG+IZfpBR9FbzuApBQ+Pitoo69qWKDFAx3NAeD8u@vger.kernel.org
X-Gm-Message-State: AOJu0YxSJ9m1aO8wSxhTbWLIgo9Wg8mpxxXsDoZ22vwbZ3K6xohfzxZ6
	z7iHDsjeKpL9/ebdK2bcIaMPYU7duf/B3AtVGeidQOtCN8CVCJ72dtEfzBtey8JRpPRXr6E9VZa
	iWvcGmOYNqybPF9yXZpQJWcZy/ST48qvTijkL3Yu7FgarDLfz5kTaSTZyOX49xoIIJZqZ5xiWBt
	Wb
X-Gm-Gg: AeBDievN2PJE5E9VkVSvjDhzNK1kwlN6gN0xfaXURgDGocQ8L8ffJDE4RrgB3cWkYbb
	GSM658JQ5DcmGF/C1HH2mjFfLN5iUJWwLUl6oCaM47VCAynX4RLp+YHBpUPInAmHjxGXniDB0tp
	08RVoWBLergIhtR/blBMeBx09ZaXVS4mNQzmiMf/Q+NI9JKd2RbjtFaI3oHvGQdcTCkj64BR7cj
	5GAllIvJJ2Jlnkq8Zx2saI4xx3mfTdckAv9v6lI8eyXSgbLJr818M0dMd4sGt6qOOhkDCh2gzx/
	AwtUYxcg+JStVY+OUzLum47tK/k2OFGdh75baG22wU57z6tWv6nwUBIzdiVsmNZWtXQp5Yyrom7
	oujMIPbBZlpvoA9CyOKz6+ObUhraTyxxOCYCr/r0bHkpO+Nfkudml35Zkvr8DuM3iCe6N/EfNQN
	gr4TiFDYeDG0BSmgBTdsC4blclRqkwUkJU29c=
X-Received: by 2002:a05:622a:1f86:b0:50d:f05a:9eb9 with SMTP id d75a77b69052e-50df05addebmr27415181cf.36.1775952475366;
        Sat, 11 Apr 2026 17:07:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1f86:b0:50d:f05a:9eb9 with SMTP id d75a77b69052e-50df05addebmr27414861cf.36.1775952474835;
        Sat, 11 Apr 2026 17:07:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee12fesm1655842e87.40.2026.04.11.17.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:07:53 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:07:52 +0300
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
Subject: Re: [PATCH v4 26/39] drm/msm/dp: abstract out the dp_display stream
 helpers to accept a panel
Message-ID: <xvhrwq6j3bfxd5ya3wrzmjenxbb5t5qhit3nc2r3ssh7to3sqq@qefwpzhiroip>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-26-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-26-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dae25c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8K8LDW8wUMBAfiAu:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=INMUEtwSgdcI4kMDNXEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: N5nVsHvaHDIb0gXCsTDEmtzjiF2b1N5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMSBTYWx0ZWRfXylWBAzcda30n
 xdG5gVW0AgTrfVSTP0BWsHjd4xxDMUYzGAvfoCw7+0V11+menj0BSo6R2w86MiL3qMWZqI27Pjv
 Y0bhIpcrq6PCp/opRSg6bnHwlhR5tDr9a1+gisTDl66T1+xkGYJ91zq208on3weaaa62IdcN8Yl
 drIGLtcGW7c+TIvPjzdRlO8YzXf5sUgfrl4uLX2hrg0o/Viso8mRDG6Wc7V+7X/feBAsu+vtsTt
 46A1Y6egwNCxcgw0CZa1+87WewAUkOEeiP5BetGaDh93Rw8Lgtl8NS9VbgPehCPMtFJc9xuoCUW
 ljGYT2YVDrKw1m0q0+vKDS3JFKdZ2Z/nax9MkFC2AGlZrUpIqG8g+baTSPy7chtaun3KYhwCGSi
 8IPicHXrBxYyRMiiOLcmBU6k35649DtzjPYEOCRhUf3HsE/N8M0sEdMPlmfD5ZTPErx/7lLRWcR
 OX1sno1gmQFJRzNrPlw==
X-Proofpoint-GUID: N5nVsHvaHDIb0gXCsTDEmtzjiF2b1N5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110221
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102833-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A3AF3E20E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:01PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently the dp_display bridge helpers, in particular the
> dp_display_enable()/dp_display_disable() use the cached panel.
> To be able to re-use these helpers for MST use-case abstract the
> helpers to use the panel which is passed in to them.

This commit is doing more than just passing the panel. Please move
relevant parts to the previos one and write a proper commit message for
the rest of the changes.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 117 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  12 ++++
>  2 files changed, 91 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 88a078e53dc1..33d8539afee7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -635,12 +635,14 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> -static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> +int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
>  {
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	struct msm_dp_display_private *dp;
>  	int rc = 0;
>  	bool force_link_train = false;
>  
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>  
>  	if (msm_dp_display->is_edp)
> @@ -680,7 +682,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -738,18 +740,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  
>  	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
> -	/* dongle is still connected but sinks are disconnected */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
> -
> -	msm_dp_ctrl_off_link(dp->ctrl);
> -
> -	if (dp->link->sink_count == 0)
> -		/* re-init the PHY so that we can listen to Dongle disconnect */
> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
> -	else
> -		msm_dp_display_host_phy_exit(dp);
> -
>  	msm_dp_display->power_on = false;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
> @@ -1495,76 +1485,116 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> -void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
> -				   struct drm_atomic_state *state)
> +int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
> +				   struct drm_atomic_state *state,
> +				   struct drm_encoder *drm_encoder,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *crtc_state;
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(state, drm_encoder);
> +	if (!crtc)
> +		return 0;
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	return msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, msm_dp_panel);
> +}
> +
> +void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
> +				   struct drm_atomic_state *state)
> +{
>  	int rc = 0;
>  	struct msm_dp_display_private *dp;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	crtc = drm_atomic_get_new_crtc_for_encoder(state,
> -						   msm_dp_display->bridge->encoder);
> -	if (!crtc)
> -		return;
> -	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> -
> -	rc = msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
> +	rc = msm_dp_display_set_mode_helper(msm_dp_display, state,
> +					    msm_dp_display->bridge->encoder, dp->panel);
>  	if (rc) {
>  		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>  		return;
>  	}
>  
> -	rc = msm_dp_display_prepare(dp);
> +	rc = msm_dp_display_prepare(msm_dp_display);
>  	if (rc)
>  		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
>  }
>  
> -void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
> +void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_display_private *dp;
>  	int rc = 0;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
> -
> -	rc = msm_dp_display_enable(dp, dp->panel);
> +	rc = msm_dp_display_enable(dp, msm_dp_panel);
>  	if (rc)
>  		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>  
>  	rc = msm_dp_display_post_enable(msm_dp_display);
>  	if (rc) {
>  		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -		msm_dp_display_disable(dp, dp->panel);
> +		msm_dp_display_disable(dp, msm_dp_panel);
>  	}
>  
>  	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>  }
>  
> -void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
> +void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
> +
> +	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
> +}
> +
> +void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
> +				   struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>  	msm_dp_ctrl_mst_send_act(dp->ctrl);
>  }
>  
> -static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> +void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
>  {
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	struct msm_dp_display_private *dp;
>  
> -	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_display_disable_helper(msm_dp_display, dp->panel);
> +}
> +
> +void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
> +	/* dongle is still connected but sinks are disconnected */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> +
> +	msm_dp_ctrl_off_link(dp->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
> +	else
> +		msm_dp_display_host_phy_exit(dp);
> +
> +	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>  }
>  
> -void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
> +void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_display_private *msm_dp_display;
>  
> @@ -1575,7 +1605,18 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
>  
>  	msm_dp_display_audio_notify_disable(msm_dp_display);
>  
> -	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
> +	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
> +
> +	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +}
> +
> +void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
>  
>  	msm_dp_display_unprepare(msm_dp_display);
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 0ccdddb223c8..0ede5505be58 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -46,5 +46,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
>  				   enum msm_dp_stream_id stream_id,
>  				   u32 start_slot, u32 num_slots, u32 pbn);
> +void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
> +				  struct msm_dp_panel *msm_dp_panel);
> +void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
> +				   struct msm_dp_panel *msm_dp_panel);
> +void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
> +					       struct msm_dp_panel *msm_dp_panel);
> +int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
> +				   struct drm_atomic_state *state,
> +				   struct drm_encoder *drm_encoder,
> +				   struct msm_dp_panel *msm_dp_panel);
> +int msm_dp_display_prepare(struct msm_dp *msm_dp_display);
> +void msm_dp_display_unprepare(struct msm_dp *dp);
>  
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

