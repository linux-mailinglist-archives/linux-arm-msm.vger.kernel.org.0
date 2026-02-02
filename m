Return-Path: <linux-arm-msm+bounces-91422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGZFKatMgGlQ6AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:05:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A8C9091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A0133002B43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91590274B35;
	Mon,  2 Feb 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMmRXDw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caTU4F37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087F330DEB2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770015911; cv=none; b=mnzi/ekWqmyuA9jLzSfBLWBsnmmvoSX+mqtFDQH9cbBSyRWmHUdecSIp7zvjjji+FVvsY2IDReh9DFoEnnzd4A4i9zErQUwo//tlC4n8BdHK/N/ZOZfdXJgRlUEi82AebdFileskIO8/4ma8jgi/eWZk0VuS+OSR6Mobr5fN6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770015911; c=relaxed/simple;
	bh=3Vlh/wEMy9eDkqBMsg2jYYTeqLnwmRfyawhNhEpUUW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EffUBuFLGGlCviv7Zym3nak10U1bIrdJ5lmwzN9cNnfhHNvl9GrZEimw6UpIA3gilASiuZ7iFNsdY/OH4tVLU1gEc6z5dNa8SU20KddEnSPtDMTUn/Dve/IFap40/SHi54+5gLizn294cTD/iCy2N8XnmIp32fzFoIODD5k6FaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMmRXDw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caTU4F37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LGJwK508286
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=; b=pMmRXDw2gXuuF2EZ
	QV+vjfNBpCK772+V5cH4ugHjTlDyP8g9bJ7KlA3wSTmxC5uV2Rc8Fvb/ZqoA4LL6
	PXszstMnyBu/tca7M5P+kAFWZWp5AYe6+0RJdjZK7DOcmkvbXISRhureBzeAfXyO
	0xJDgX3AuJPrZVK5gO9wtmgzu1fFDfySmm4DblS20HDHlEyW+XcRJ0nv1DWsNk0/
	+pZgC1qTFE5pFOTb68SDj6jxex8XuP6mvVes3TDHGqepSRuMK/UFOt3T7355OY3f
	MiFsOKS9+526Sn+7aSgBg74U2S1UE7TmUCp+MeZINnYyVI8fZto+mxiXGwaLgT7i
	gVZWFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4964-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:05:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352c79abf36so3646748a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770015908; x=1770620708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=;
        b=caTU4F37xPUT7zJvq1aNJjQ4Ei4kz6pbzWdoNy9Dby2QvsygnQO7ajRlx9f2bHMVgZ
         /FtpAR/+wUrUiT/fOwvxKKH6rT3vxvmtZ5jBm9LfyWslAJbqgRqbDBhJUrnSdsQO+Ysw
         dY7Uk4CUho3vAMnElvQqCrVOpVjeh2uh/JUcUfOOMiS3xOpeZm4E+EpRsE1PFYoAhmqa
         3y5n6651guPKIKkKTfKyVdH05SJ5/SdT55gZmjC2Q20pFwslq1e2y66rWfAy9I4ixKvQ
         NBz7U2Qx92NFvpOtaT7CbC2+7gZRqMYtfZgT/UWzquyoSyrzcuP3YmeCSrdCUEB/F/uy
         77Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770015908; x=1770620708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhcjZlCEdnhukA6M7eYg9sdCZm9yQULKNjnZ4xyk89Y=;
        b=R0bG7ASP+lkfSlqPZQIHQwiEez0q6yICdA7Luw5+oFaEgUl4H7hxzBgFuyBLeGP09b
         2MPacMz3Wq9Pd+wkS5Bk+BA0FRmCBUANmLnN4lZsHVZErU/rlbIkg6oLTyaDkWuZg66c
         bQtbP8Md10Jg/E4VzDhAbWKl3zs5yqfsbKvJjSfjALrIP/ej7Wjm5h3YGbT0R5X5KwuR
         +rct7Ob/XeEO5pPM2CtN3Le53zRdI7fhzqJ+h0VRjWVJgWcR3aL4JDj5Kx/5x9a1tDrd
         9wIhxbNAamhOrpWCsyL0oROjBryp44AXNG3DAx/Ltpnn1wkRc15ojh0XKw2B4qRiZa1R
         Yj9w==
X-Gm-Message-State: AOJu0YzevPIP03owGhCqIloWHzjNcP2qNBSR1OIvSr69+tkG9ozmZ9ht
	eEkHOtuWW6CelMwXUYBwuM8r6kA3uXTDpaHKTAYWuX5EPmcIM3PybUnAUABSCB8fxKodXECvdvQ
	jhaN9EjM+I3n6oWI6oAE3h3/IVkE8HsZCw3yGjaWz6Zyz7rdKtUb5638wtwIwJc5erE7l
X-Gm-Gg: AZuq6aKOhJSHqMz8YqRrQUjJCy3TMLaMeaEKAobefEQKb3HIE1Tzw3GYjIVflQDJ3Rr
	rbt6f8gx2Mwbo+8wmf72gTIYnJj5hnly0KSSmPbXWyCnP0gOOaebKREfI69vFpJR9n+jicqH3iz
	ECoslX/2cT15IRiLfixerL+rEsuzfahknMzp25JqimVdmjEyQ5XZUKvvto/i9Gl3focmzWWiyNa
	Bhi9KK4ZWoMDRZ0yURU4evGIDSVbNSh4EKpCb2eBQY5e/9HwU+f69nhsLyoSMwu7sxswCg52nre
	mYDr1JjjTpUWmEEmoJcFKw98v0tTrLIsDYbwGxbfnFsaPiDV0GtAlMlCkDbTYB/0qmI6ClDMlzk
	mKfbE+R9u2DH8VqjJKMLctSCto3m8IULydrQwlrXloP8BP7BtI9D8AD7SGkUvFwwWfoXI6YRoX4
	tC4CJFQg==
X-Received: by 2002:a17:90b:2883:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-3543b3253d9mr11688127a91.15.1770015907319;
        Sun, 01 Feb 2026 23:05:07 -0800 (PST)
X-Received: by 2002:a17:90b:2883:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-3543b3253d9mr11688082a91.15.1770015906802;
        Sun, 01 Feb 2026 23:05:06 -0800 (PST)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm136327385ad.64.2026.02.01.23.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 23:05:06 -0800 (PST)
Message-ID: <0fed5dd8-daa8-4956-9170-d824aaf416d6@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:04:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 21ynYboFnF7OgTDMXOMN6NP22CQ4dpEK
X-Proofpoint-GUID: 21ynYboFnF7OgTDMXOMN6NP22CQ4dpEK
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69804ca4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TJdMcaj38x47FP8pHAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1OSBTYWx0ZWRfX/mPkGyMSBey+
 Ln3/HX66SNmTMciF64yg7ro0hYj6VZPsjXh/bVNQpbIU8AQ59kj9iKAPLnkkWlLu5cK3ptsggo9
 KCGcYV+vu+RHMKSDpH52YuUwvpzE5Z1fP1iueRGQsmvkAUI3SdiM6jldltlHx1VR+hRtcLjy/xO
 ZfK14wzyLWBoOJrMNYKNRAWYzgzkE1beqSBnUGkdVpQ/NiGQCiD/sqbmsXufihKC12fB2JpXfYp
 PhDw7q2kRkb+/gGyjW94FxWEvAZkhAuGjumecyNDNy5VC7+zOogrpwyrH9ePFsizS4wsvryI+vf
 xVD0JakOMyAKFiqVGDTTRflip82kRKHaIn9kbTPeUbN/CXwq+iRGQbszzBTXRI0kHKOJxrxFdyh
 Ey0LC2eukG8TaCwGbiSsLz3YkWfzLevHYz2tFK386Wd3lfOq/4DxfZRm1wsi6NoQ7LlEdM5yLAy
 IFwbHcahSMnVoQ6m8+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE4A8C9091
X-Rspamd-Action: no action



On 1/15/2026 3:29 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Instead of relying on the link_ready flag to specify if DP is connected,
> read the DPCD bits and get the sink count to accurately detect if DP is
> connected.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>   3 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5997cd28ba11..a05144de3b93 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
>   	return 0;
>   }
>   
> +/**
> + * msm_dp_bridge_detect - callback to determine if connector is connected
> + * @bridge: Pointer to drm bridge structure
> + * @connector: Pointer to drm connector structure
> + * Returns: Bridge's 'is connected' status
> + */
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector)
> +{
> +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct msm_dp_display_private *priv;
> +	int ret = 0;
> +	int status = connector_status_disconnected;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct drm_dp_desc desc;
> +
> +	dp = to_dp_bridge(bridge)->msm_dp_display;
> +
> +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!dp->link_ready)
> +		return status;
> +
> +	msm_dp_aux_enable_xfers(priv->aux, true);
> +
> +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> +	if (ret) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		msm_dp_aux_enable_xfers(priv->aux, false);
> +		return status;
> +	}
> +
> +	ret = msm_dp_aux_is_link_connected(priv->aux);
> +	if (dp->internal_hpd && !ret)
> +		goto end;
> +
> +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> +	if (ret)
> +		goto end;
> +
> +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> +	if (ret)
> +		goto end;
> +
> +	status = connector_status_connected;
> +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> +		int sink_count = drm_dp_read_sink_count(priv->aux);
> +
> +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> +
> +		if (sink_count <= 0)
> +			status = connector_status_disconnected;
> +	}
> +
> +end:
> +	pm_runtime_put_sync(&dp->pdev->dev);
> +	return status;
> +}
> +
>   static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct msm_dp_display_private *dp = dev_id;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index fd6443d2b6ce..e4622c85fb66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -15,26 +15,6 @@
>   #include "dp_audio.h"
>   #include "dp_drm.h"
>   
> -/**
> - * msm_dp_bridge_detect - callback to determine if connector is connected
> - * @bridge: Pointer to drm bridge structure
> - * @connector: Pointer to drm connector structure
> - * Returns: Bridge's 'is connected' status
> - */
> -static enum drm_connector_status
> -msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> -{
> -	struct msm_dp *dp;
> -
> -	dp = to_dp_bridge(bridge)->msm_dp_display;
> -
> -	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
> -		str_true_false(dp->link_ready));
> -
> -	return (dp->link_ready) ? connector_status_connected :
> -					connector_status_disconnected;
> -}
> -
>   static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
>   			    struct drm_bridge_state *bridge_state,
>   			    struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 9eb3431dd93a..6c0426803d78 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>   		   struct drm_encoder *encoder,
>   		   bool yuv_supported);
>   
> +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> +					       struct drm_connector *connector);
>   void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   				 struct drm_atomic_state *state);
>   void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> 
Hi, Dmitry, i want to ask a question about the .detect() here.

https://lore.kernel.org/all/20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com/ 

In this change, we moved the hpd-gpios detect logic into the MSM DP 
driver, but it seems like the current detect flow doesn’t really handle 
this setup. what i'm seeing is:

1.On platforms using hpd-gpios, booting the system with the DP cable 
already plugged in doesn’t work. The msm DP driver can’t detect when 
link_ready = false.

2.For hot‑plug cases, it looks like detection is still handled by 
display_connector_detect() instead of the MSM DP driver.

Could you please comment about this? thanks..

