Return-Path: <linux-arm-msm+bounces-102801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EZqDoeD2mnI3QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35B3E1011
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AEAE3018409
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59A21D6BB;
	Sat, 11 Apr 2026 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/wIHT7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXhOe6UQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037D266565
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928196; cv=none; b=fgwSVOVFwaut5vdbSXJtuSU6WMhL5EPV+QaeXHAOsLVaJD78C8yPq3OJ06hW/496K1ExhbERXS+9I9/16ER6XEmW/xh5hmBau/cFMd0nsH2yqD2KaGBepbVLe+gA16UzmfPRfQOx1SbFMlJOLZmDsVtfvryPftp1tEDQOxIuef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928196; c=relaxed/simple;
	bh=4R5otZu6qljn/L0cev0qtoc1uxyzpKge9OSGQF6Qst4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDwYw/XoypYeVbmEOM3WI+aag4Ab92A/bwkOxtn1T0+KiAdn38oWqC/9SGzAiaa9DHI1vzDDKAFITBYi/rhXfnj5gmSuhSXrAX5Kr3UE3xXBbGVvLOOSCevRr9AvQRzItKNr50t4VQ+zN8xa6hTcBfWYv/ZMebO1ySmOGxQsSpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/wIHT7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXhOe6UQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B41M0S3377139
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6kPVbXNnQQwRrBlwHiRqi+h
	dgEu8F6PUX4I0bxwbO4=; b=b/wIHT7iOygcOhWXCW+PsQJ2NKRtBEMMntWVzFZQ
	iC9EjZJ4etULvFH0MRQmleUi/ewkr8A7s3Ci2SIqMjQwLvH6SZYCiKZUvrkinU5v
	EMZd1AQz2OSLs3rmjID04WlOxEmVzAsE/VusaFoL8eglaaWCaA9X5UfVkUh3vUsC
	IhQNKpeYJPA7EmAfDt9VKBPiEUJHFSiRQ1ADAs54vxBZ36tKDVyegXVrsUJ2r9/y
	KyIzlWyY7R9jX7B2aOBlp3jssEEJvMXD313pfTH5SMVtMvDexp8Yyvm/J1l55Wzx
	3ZkqfORcuaJ6X1VzLm4fdEcgXwy3OsneKGoBb9Ijef/08Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewks4g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:23:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso77665541cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775928193; x=1776532993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6kPVbXNnQQwRrBlwHiRqi+hdgEu8F6PUX4I0bxwbO4=;
        b=CXhOe6UQsFsFiP25AsIL5KS8iUMPDNiYYz16/MbeZ7wJNamQ/xSleVcIBqSsoKVCH1
         q6gtbPF6orFsZSOARANDBf53pQVv9HKAafxOe5rqBmauhuyQYfulwcVG7XfHMMzBfPbp
         T4Ezxr6n8LZEJ2KPw7pIKUSZUoxeLGSFtwky+HSC6XWgx9u9Bb3+hIFy6ur1gsKB3v0N
         kC2zI6cXcGFFXn/1o3+5ZRhRKUHzF52vErwfqI8udElO8ry750WmHKfjCr19QSlIj+Iz
         sEVdubC6t8r6ZtKxbPB82trcCYfGcOcgZvkTZTmRStn310kcLFBAu7J776fIDCKU9stp
         lO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928193; x=1776532993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6kPVbXNnQQwRrBlwHiRqi+hdgEu8F6PUX4I0bxwbO4=;
        b=gY3+unGv1K+NMfGQQ/OT3lg4II3rijED8bM9PvZJGAey13yI7BzFbeOfoYBbLuNw3R
         SIk5+a7s6eLDmWtMcbOtdGnD+nxx0QahQXsxqzwaKEWyTCqHQemlRIcSgWAsIJtSqfQN
         VcC+0c+YnxLyOzDJbBz1m6Jq7nFJjV07dK+RbICLfTKrU9bfdM9MSf3l4r+nlYXH5K+d
         OBFKfUCrXifdAi6IXhPxPy3U455UWZG+Db9Lrw8sCW7dRiRvuGbSSZsVsfnPx1PCVBbT
         twwPYoKMN2pawWxjRqyHl4/y1+rCDVyTMtHqIahgokWS3xVoZE3S+L06sr2f2dRJNkDS
         XIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpOB8zzJtebMBh6vxhjC7w7HtHcjMcixRwQlaOBWrVx1RQpviKdsARgx8e/DpxSbUimKpZHw2DxM0lWtmu@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9wkqvUzJqhSgkQNkWhAItXY2d/rzghwNSdZTQAC19lLeZHJB
	gXjIOikyhm5DlO7ZZBaiHmzxKRfkhuzX1pSrwZ8z59IYTif62ANBsZ8e8w/knTrkNAUOppUnj+O
	axecwU/OOL2BAKwpIVwAx6LO2V36luQvHFwdRdoFjZ7gLU6jZSU3wy+ihOH/FLMrJ0DD4
X-Gm-Gg: AeBDiesQacFEiejUG0LTUUZOTH+SdkV+VViYK9vjqLOk/Wdg0q/ADzAow6pjGK/VV/Z
	WGpSlCwkFLsPueakFIM4dRpHa4ziWg/xqENuTtkYDLQa88/AR1OSGLyW22RFV/HI0ZfgwhfVoeL
	rzGOqjIcvFxa/TwWjkAMgD6qUidnhdajxkvEJ/3h4oNv07KCBeXPBudjX2dgNFvLmtu/B6TSWE2
	wZmABkwWFjuMbhSAmnYvP8tP68+Hbcd7Q2tYKjBiNaiwcKK7pVkQOWcrqI6Z/ZUigh2RPehbiOz
	il2vFuCuNo7vZaPNRTWb84TczmB9zawfAXGo5BHKhxsPclFytZMi3bOnjNmzicbwag1CR8SXTYt
	HBenu7H130clY9gEIw/9wpVlVJDGnCE6Vgm7JK083L6H+iZS4rPOpZegIvaxo1ljIo2eUZj1ePG
	AJYovvKhOcqrHFDGV0lRpxHwmuxUtuIUc870Q=
X-Received: by 2002:a05:622a:24c:b0:50b:4c64:4730 with SMTP id d75a77b69052e-50dd5abce85mr112321301cf.15.1775928193499;
        Sat, 11 Apr 2026 10:23:13 -0700 (PDT)
X-Received: by 2002:a05:622a:24c:b0:50b:4c64:4730 with SMTP id d75a77b69052e-50dd5abce85mr112320951cf.15.1775928193027;
        Sat, 11 Apr 2026 10:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb1esm13440051fa.35.2026.04.11.10.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:23:10 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:23:08 +0300
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
Subject: Re: [PATCH v4 02/39] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Message-ID: <lavty23n26lx6rqsmue3nljvsgrpwiyarkwosmqcqqgogqmybm@pgid7zsnpqk7>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-2-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-2-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69da8382 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=xvVyhEcr_FJfiUna9c4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1MyBTYWx0ZWRfX+eEDlwxaNWMx
 TCiPWq8IWxXKu7mzSRnB9yLo+agnRDkPMwJzUcNJW5tadLOQIX+yiU3z+bXwEDcMEX6RJFUmEwd
 yTFPK3YqzTTtS6HTgDKkiSBMBjlqbPDzCN5s2etozvYCVP9DfR7NC8TpsKiJUvLltfaDvtAjHP4
 33QH97IG7uP391jLXKGgBN6+l7WZM/ezJ6ApZLIwWG3pGZ2ZFvIyfsYw/j0ME7Oz15ssEbJ6J3D
 xxHmIC3pndCeuN2w8tMw0eFKheDzzfE3uDYYoAnrQ+vOAPrcFywHTaV7K7gud9zBBpdb64MiCPb
 XwA48ZO0rC2cCfEEn4hyJju4N51WTcsBSiMfdbz5uG+ZEvsuxqFGsHkyTFeI450J6MA+/vaQMYk
 JA1HPJ67xZE1k1I3g09UwlXUd/ZfTpal5ek3goLq9eUckqh/6IDlvdsKHA055sg4n4ZkMxBLB3e
 aPZ8vRhbFhr0CbqUIsw==
X-Proofpoint-ORIG-GUID: VvVs7kAw5gIrnR3_bK7fFys--WIcEjl5
X-Proofpoint-GUID: VvVs7kAw5gIrnR3_bK7fFys--WIcEjl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110153
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102801-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,quicinc.com:server fail,oss.qualcomm.com:server fail,tor.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C35B3E1011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:37PM +0800, Yongxing Mou wrote:
> The bridge .mode_set() callback is deprecated. Remove it and move all
> mode setup logic to .atomic_enable(), where the adjusted_mode is
> available from the atomic CRTC state.
> 
> Drop msm_dp_mode from msm_dp_display_private and store the mode directly
> in the panel, as it was only used as a temporary cache. Both changes are
> limited to msm_dp_display_set_mode and are kept in a single patch.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 81 ++++++++++++++-----------------------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 -
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  3 --
>  3 files changed, 31 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e28cc1bbb5b1..e9f0b96c3ebd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -63,7 +63,6 @@ struct msm_dp_display_private {
>  	struct msm_dp_panel   *panel;
>  	struct msm_dp_ctrl    *ctrl;
>  
> -	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp msm_dp_display;
>  
>  	/* wait for audio signaling */
> @@ -593,16 +592,33 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  }
>  
>  static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> -			       struct msm_dp_display_mode *mode)
> +				   const struct drm_display_mode *adjusted_mode,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_display_private *dp;
> +	u32 bpp;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> -	msm_dp_panel_init_panel_info(dp->panel);
> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
> +	if (msm_dp_display_check_video_test(msm_dp_display))
> +		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> +	else
> +		bpp = msm_dp_panel->connector->display_info.bpc * 3;
> +
> +	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
> +	msm_dp_panel->msm_dp_mode.v_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
> +	msm_dp_panel->msm_dp_mode.h_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
> +		msm_dp_panel->vsc_sdp_supported;

We need to stop poking into the msm_dp_panel internals. would you mind
changing the code to pass the mode to msm_dp_panel_init_panel_info()? It
can be the next patch in the series.

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +	msm_dp_panel_init_panel_info(msm_dp_panel);
> +
> +	/* populate wide_bus_support to different layers */
> +	dp->ctrl->wide_bus_en =
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : dp->wide_bus_supported;
>  	return 0;
>  }
>  
> @@ -1305,7 +1321,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		return false;
>  
>  	return dp->wide_bus_supported;
> @@ -1361,15 +1377,19 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  {
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
>  	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
>  	int rc = 0;
>  	struct msm_dp_display_private *msm_dp_display;
>  	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
> -		DRM_ERROR("invalid params\n");
> +
> +	crtc = drm_atomic_get_new_crtc_for_encoder(state,
> +						   drm_bridge->encoder);
> +	if (!crtc)
>  		return;
> -	}
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>  
>  	if (dp->is_edp)
>  		msm_dp_hpd_plug_handle(msm_dp_display);
> @@ -1382,7 +1402,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	if (msm_dp_display->link->sink_count == 0)
>  		return;
>  
> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
>  	if (rc) {
>  		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>  		return;
> @@ -1440,45 +1460,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	pm_runtime_put_sync(&dp->pdev->dev);
>  }
>  
> -void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> -			const struct drm_display_mode *mode,
> -			const struct drm_display_mode *adjusted_mode)
> -{
> -	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
> -	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> -	struct msm_dp_display_private *msm_dp_display;
> -	struct msm_dp_panel *msm_dp_panel;
> -
> -	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	msm_dp_panel = msm_dp_display->panel;
> -
> -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> -
> -	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> -	else /* Default num_components per pixel = 3 */
> -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> -
> -	if (!msm_dp_display->msm_dp_mode.bpp)
> -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
> -
> -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
> -
> -	msm_dp_display->msm_dp_mode.v_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> -
> -	msm_dp_display->msm_dp_mode.h_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> -
> -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> -		msm_dp_panel->vsc_sdp_supported;
> -
> -	/* populate wide_bus_support to different layers */
> -	msm_dp_display->ctrl->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> -}
> -
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  {
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 8dc0dabd275c..af3d3e3a2d84 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -56,7 +56,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
>  	.atomic_enable          = msm_dp_bridge_atomic_enable,
>  	.atomic_disable         = msm_dp_bridge_atomic_disable,
>  	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
> -	.mode_set     = msm_dp_bridge_mode_set,
>  	.mode_valid   = msm_dp_bridge_mode_valid,
>  	.get_modes    = msm_dp_bridge_get_modes,
>  	.detect       = msm_dp_bridge_detect,
> @@ -233,7 +232,6 @@ static const struct drm_bridge_funcs msm_edp_bridge_ops = {
>  	.atomic_enable = msm_edp_bridge_atomic_enable,
>  	.atomic_disable = msm_edp_bridge_atomic_disable,
>  	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
> -	.mode_set = msm_dp_bridge_mode_set,
>  	.mode_valid = msm_edp_bridge_mode_valid,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 6c0426803d78..6d4cbb9f3918 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -36,9 +36,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>  					  const struct drm_display_info *info,
>  					  const struct drm_display_mode *mode);
> -void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> -			const struct drm_display_mode *mode,
> -			const struct drm_display_mode *adjusted_mode);
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

