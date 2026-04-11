Return-Path: <linux-arm-msm+bounces-102814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMV0IpiZ2mkC4QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:57:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794A3E15EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3669F300BC9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8633A9D96;
	Sat, 11 Apr 2026 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcu7kLXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnXborqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20C3A8757
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775933843; cv=none; b=gyeUW/jBa9vjsVJlI60TCwkztwofNBwOGuNRVoNpBs4OoyvuzHCd3tCTiecqLPeEG8ROCxQa8om1CyEHUeMErvfCzJoaLcatGSRmnEBbfyrIp5rCezvaxV3fhXYba8PZsCPQhbc7z4vOoP4XPs4dK7/TVqYue24l4YpBIuo8g8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775933843; c=relaxed/simple;
	bh=zRLR4E3+S00fjhKfaet70pfs20CLiQI/HIA0PBLvGpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug8CBM2mKrKWDkkC9YlBEiPVVw7xLrrQnz9UoNlG17fm26lcTMwtjC7jGIko4B5FaAPK8If/spoW3nFGRZSyG/wNzI5iHlM/T0wfpwNjx1ivYWLsTxNqbPAKU42o03OEcjsrGtH931IcztWmnubV/liB8Npbz1yBPqjaAJx+wV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcu7kLXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnXborqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B9uuYY1235857
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=85AJ+PtbhQtD31fE8g9VZOBw
	qviQ452IKAr9YcKM+ow=; b=jcu7kLXTf2K+ih1CxS23GYIROdQYN2rwUIQcbl4M
	b4GaagzavWBUWQNCkT5JgJuQEiygTl3yE/BjV4vjtpB2qMELNhMsB5sVCplvU4zh
	jAKN2j3czxthRt12nPWjMxbi6wQZeI3y5MpyGbeSjew05mJ6rsc9sIUVRewACJqV
	v9wFd8K4Rw3WHjBaqITm2pj6Wh20567tu1xPWJy0BQ4UZU/SA//BU72Qr9bT+/Sd
	Mba0+bCSDQ4KwVCpgl+6O5h8WMFEdaMtaIQ0NHd78ybmMQXcLO7MYkdfVlc+X4uv
	L483iO3MWFvHksN2R73t/VVA0wAmD49GWlpCoG0ci8miCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevth8aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:57:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so85851171cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775933839; x=1776538639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=85AJ+PtbhQtD31fE8g9VZOBwqviQ452IKAr9YcKM+ow=;
        b=hnXborqCJW4F1BQWRZgVCbKG86/6YrI5Yz2FINmN0jTxxWNvPnw9udNMhwDp7JcjOh
         HNySYkQUXAqOqW222TUdv61zFffnghVJN+1aHLy1NWvjiXZwkXZfXPcdcOn9+bWzi78l
         2GXbGFeud+GPE/gug+4JDDvaaoLL53AKZvcHYm+Vcje+PQkwUCljphv0dU5j3H35wZ9t
         zPEdh2gvejKmBPomG7fje8BmprYezZcXyIFZd180niAzKSff035jlMml5IBKZZzbO0Pi
         FtKvIFc1u4ZTvrK40ovjCHXdUvnh4fHxVxithYgWPFVyDCyW9I9PNMpEa9o2HP4oDWcN
         Fqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775933839; x=1776538639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85AJ+PtbhQtD31fE8g9VZOBwqviQ452IKAr9YcKM+ow=;
        b=KcQKZI44PyrGLl9xh5xzC0hythTqI3PGq9ajxMBk9vvG+B1Oqaqd6E+FxLpMq4s5Qe
         AZdHCyqjaJ5SvPE3eSDQckUw3nZOLKxSCyojc8rspKRQeAvA4LYyq7wN2xFypjVI4Ip6
         PCGXkRtBOmmbQt6vEq2gwGlxBK+gL7iXEy7yqG8Qu0NnYHXfsiWKlnSW5uGMEQ4dPeno
         hao8MWelKu5/mzYKQ+8sKQFX+fRNRnM39oyNKcIA5N1JEXGen6e7psdyY9md1mvN69RI
         Dn8iK6zr+TGE6jOCilrA7GuKXZ81guJjn60U5dlf3QAwdKgp2HhTvvgwjULR7V7/Y073
         2y4w==
X-Forwarded-Encrypted: i=1; AJvYcCV4+VZxCofGQ4J0NbpG35jVuJNPcuS/rpPOI15CcDMRJlhhm9HOAYFL4FLiKt8GLnnECd7OmjD9jzoH0iup@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMu3Ryg4TcUsDq1yL99nAaAgyJQPSN5A62485sxaHYyAPEsMc
	viVE4ejpFBHrTV7T+x8UySJEamCFxGzpf5y8W704U+FJHH6apAX3YWNziQlwT3T2/HY+I2OBrf/
	hkfIVA/nUAqggl1q+/Zipjep+tv6t6s2CK/K+2kjYvcuSUZQRFCCPp+oImHNJsSmXNTMn
X-Gm-Gg: AeBDievemk0Hdlsv3DgpOe1IcclPDbn8wh6YL24VabjI/H8mGbiinu6bySbL7PLhB+y
	JoHuEqKvTE+2JzkBJvaftFRT3n6qD6x2/6UjgYGv3bCAdz4oypOif2xxIt7ztMRoQgDffR7hckA
	hZuMuX7OqdheM/zXsOMUMs8D+iMx6fvA0NDkHXRKjh6sBCwI1xE6kjy0o3EYTTijt/gtdl2YpML
	fdyy3dvbUTtOc3ltvD8IwKMqMn6xKYE2NjgHshwI3Ao9ny8EnrFFQ13L332Tcyr0TPCTHxKgcHB
	OCr7bDkMs3tgqj+snownh7acybpU+A63NEDdHVXZlWEMHonXvetzR0DuN2C99/SUiKi+1HCFn8B
	DEKQOm9MpjNHXmc12KE0H82BFPY/Yb1BF+oky+8Ade1ngr9wZvxT8C3/POSH80OjdiRmL3oknFu
	ePHzKNx1ycaxcIeLFhBLJ6CW4r4HqFQJev6PI=
X-Received: by 2002:a05:622a:3d4:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50dc1b9a1f4mr162905921cf.42.1775933839108;
        Sat, 11 Apr 2026 11:57:19 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50dc1b9a1f4mr162905711cf.42.1775933838613;
        Sat, 11 Apr 2026 11:57:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49546655sm13187071fa.20.2026.04.11.11.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:57:17 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:57:15 +0300
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
Subject: Re: [PATCH v4 18/39] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <6jkqen322yklhb4zzoj2kcgwayhcqm3mhnbrkgimr7zubwewao@gmuopu6uxakq>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da998f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xirQvcjanROXNmDBG14A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UaXa4qNWwVV3iUb5xyBwCRofRimW4xvK
X-Proofpoint-ORIG-GUID: UaXa4qNWwVV3iUb5xyBwCRofRimW4xvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2OSBTYWx0ZWRfX5EW6YmAncGC9
 /hmMmI4WUenIQVS5pKGTgORUYg8POxoAHeODDky3Jg2OtcCCnmnuuzTVlLcx7195/E/RAuDriKM
 ZwbAQf//uv3kpJ8W6ACn72PqBixt2VR2qeVm9TgIvZvKXCvPmoo7se1kg0YpFFp6qiS1ZOtcPt3
 QV5xb86AhHKaS0ipcUNppBtfC84SEYiUTO2V9GwIq36wHkOienNSMJB72GhC6AHccsvAGzvNgWt
 9rjPGWHAuFL1a5E+RMstfqCTfAlFRgMjGsc2DHzkHsmyjPSj3kTuWi0KuVrn/wvXeHdC3LJDohC
 H2Hbp182z4rTujYbtkiSpwcrr97Fip37UkPNYLOhdm99Sri3sX2agR8OFOZ+0qrwDbADs/8NtmK
 he9BdxWRIkgu91D388asOm4WgMYGt9023/Q5gIf9OR5a4jJWmh+MjEEPL9UkpeWd9a28XZOu0i9
 ErBrvWuRR2NsnOhpsBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110169
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102814-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 7794A3E15EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:53PM +0800, Yongxing Mou wrote:
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
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 43 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  5 files changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1109b2df21be..6f25145ef214 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -143,6 +143,7 @@ struct msm_dp_ctrl_private {
>  	bool core_clks_on;
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +	bool mst_active;
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -228,6 +229,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  	return err;
>  }
>  
> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	bool act_complete;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (!ctrl->mst_active)
> +		return 0;
> +
> +	msm_dp_write_link(ctrl, 0, REG_DP_MST_ACT, 0x1);
> +	/* make sure ACT signal is performed */
> +	wmb();
> +
> +	msleep(20); /* needs 1 frame time */

20 ms is 50fps. What if we have 30 or 25 fps?

> +
> +	act_complete = msm_dp_read_link(ctrl, 0, REG_DP_MST_ACT);
> +

Nit: drop empty line.

> +	if (!act_complete) {
> +		drm_dbg_dp(ctrl->drm_dev, "MST ACT trigger complete failed\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>   */
> @@ -2081,6 +2108,10 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  
>  	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	ret = msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
> +	if (ret)
> +		return ret;
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  end:
>  	return ret;
> @@ -2277,7 +2308,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
>  	if (ret) {
>  		DRM_ERROR("failed to enable DP link controller\n");
>  		return ret;
> @@ -2357,7 +2388,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>  	return drm_dp_channel_eq_ok(link_status, num_lanes);
>  }
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>  {
>  	int rc = 0;
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -2375,6 +2406,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	rate = ctrl->panel->link_info.rate;
>  	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	ctrl->mst_active = mst_active;

Should it be set to active only when you actually activate the MST?

>  
>  	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>  
> @@ -2654,6 +2686,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  

I'd rather have the `if mst_active` here rather than in the function.

> +	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
> +	if (ret)
> +		return ret;
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
>  		return ret;
> @@ -2693,6 +2729,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
>  
> +	ctrl->mst_active = false;
> +
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>  
> @@ -2876,6 +2914,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  	ctrl->link_base = link_base;
>  	ctrl->mst2link_base = mst2link_base;
>  	ctrl->mst3link_base = mst3link_base;
> +	ctrl->mst_active = false;
>  
>  	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index e72d501ac1ce..f82fd96e412a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -16,7 +16,7 @@ struct msm_dp_ctrl {
>  
>  struct phy;
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -51,4 +51,5 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a924fbd825f7..80bb5fc4003f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -660,7 +660,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  		force_link_train = true;
>  	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> +	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>  	if (rc)
>  		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>  	// TODO: schedule drm_connector_set_link_status_property()
> @@ -1547,6 +1547,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index b0cfdf215970..fdbe6e4871d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -19,6 +19,7 @@ struct msm_dp {
>  	struct drm_bridge *bridge;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 1c2d3d8d029d..237325d52dbd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -156,6 +156,8 @@
>  #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>  #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>  
> +#define REG_DP_MST_ACT				(0x00000500)
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

