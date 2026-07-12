Return-Path: <linux-arm-msm+bounces-118602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LcA7KMYIVGrihAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:36:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86C746087
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oFtkCmE6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MrmpH7+l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9277A300953F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA52472B6;
	Sun, 12 Jul 2026 21:36:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF464222582
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892164; cv=none; b=UEP1s/BCZGVOv+6L4GuvqQaHhuAKa1H8zi4QSpDF80Fwtxt6ezMYoWfHJQh32g7zYICT1dt8bpaR5s7raLqaQgIqsF/zC7pjr2B/tLv6byqFrNtUTyr1kh7psxVJj/LH653ad6fjC0CKRkiTyFIir0x3/ceFUxCuvH4jsEIr+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892164; c=relaxed/simple;
	bh=gQQ4Vyoqtq2vKLTPmYO2EJ0yfREEdpzHmCjg9zvfE2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm2q8u4Avh/N9U9x2XgaVgAddeXG0x1KUJLkHrZIcxq7k5OODkVmpvuq+853D+2ywsd00aLX9IoH5AqCLtaXoG2RMfBvKG0GpJEGTjLE3sthF7gtxpX71RPe41kgpL+ktOF3IP1FKutLu78FC+lvDwkzkvTbmE1+16QAG6NdcrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFtkCmE6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrmpH7+l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CK8c5t3556713
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DbX44780az2Dh7hJRLP+co5T
	vYgmS7V+sl8d/t55O3E=; b=oFtkCmE6OzOxiNxP2mDHKBkbAn2NyrSZY9/Gps9w
	48Oof23c4iYB7OazkryklnDsyw50oc8gdrBp4a5xLi9JVsrEQio5MuztCjMTxrZr
	voMa9UR0Z9cInimombSn2Cjvt6KSK6gDu+8yBc6d1cEpXyX7JnCr0smuAFjPnu3/
	ShgFJ32aFhNy2d73s/Uv+sReYwnEYwX6ag7XHWz7ErqP5SXHZE+rV84B16xcdBQK
	JX8pviD9it++P5PKFiPG8U8o+mCfWeYMCrOGWe4LhdSYJ/u2nbbg7AhOuGbZdp8L
	l6IzKx0Rlghb9J6RU07O8V8QEjT/zopYnHpcMtWH7a4r6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgkkh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:36:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2af04aeeso35872741cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783892161; x=1784496961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbX44780az2Dh7hJRLP+co5TvYgmS7V+sl8d/t55O3E=;
        b=MrmpH7+lneOetGZEdGJxr9VpkpDAMknH0uKJFvjSBIu72PZYvpzu3NBjwafqHvIze7
         PDa1SRsYt5v7JBOFmq4bhaE49gU+fgsMCQrzC19+/D+T3d9E76ZaiU5wHjTtKE7W878h
         bbYiHiDTLJGyXFTZU5ebdS34upC1eOKvANemc07kwzw3B2mjcEq7mlHCF+vMHg2EVKc+
         YinFiBcTbmXJabFkR20XzxIfVZ337v9Y2eqvf1blQopcgrlgbJBzlTq66mTeYiHubYRZ
         9EjY64Ugh3wd4eL/4Qa4YWrHYkEToPqVReKzDH8fhGrj3O4laCod2810+QATaQmCvKoL
         4zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892161; x=1784496961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbX44780az2Dh7hJRLP+co5TvYgmS7V+sl8d/t55O3E=;
        b=DNJmTCx67CeD/+Rd3z2SzUW9/rLpXiytfM3xSLCKO3HMzMoYvm1mJhG/DcN96HsTyK
         rb9RBIlAKWGkCuMWWCZtmtIhQHvqLej4OWWYgF1ANsMkP0unUisUMt3U0tpESjMFRrBe
         ZOTDfDPBJCuqzpu9QF4Z/X02o/+EeuMQbZutbEhU6Hv0mySajl0E8iYvymqHMOdmXtCp
         1RUyCPQekdBtRymW77QGOhNYxvpWdGvR/gnr2wSMlKtEGhh4KhxXi5gJkvQOL8Vh/JxL
         YZGOrrJZw4qCDO/Ady0FBuHipMmApfTjkeOmLkUgnPr5ZP5sXpg482Pgpplq9bj2YkcI
         OCyw==
X-Forwarded-Encrypted: i=1; AHgh+RrpKGwo6pg4DC0OzyNMWNO+uSuOeulndsCB0K/iMVU/W9CVvl1G0Y4dRh2M+/70+h0fFGA73rCrD20HinuC@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6CouaMA0wi4ct09J13zePiaqVIrNIqSXQm41/4sI0ooCwQcx
	lAKreaBl021sJRc7jYVM04P7L8Yc3K7O92kRqcj4AcQWw4PHKjSc6cMLFI7WPuF9x4nWW+dWmZG
	pExUr/bKt2NmYpgewjLgQ2zxRQP3uxO6yTc3aQQp1O5Z+5AMEhond3euBVoCcwBCTLHVE
X-Gm-Gg: AfdE7cn639ODmD5dvXYB/5ca3OGKM66VRyox/GWYuON7fhy5yVr+La2u+Dd5EGaJvi4
	xAS7rBaYVjEBslWSI9q0ycqhyZFsqiTKMrYsbtFwDTH4fWTsoe8/9hFg1mrR8AwWGJa8OI1zGcp
	vPsO8a3hcPF8YSZ5w0ijreaeTsi/2XYfYCdbwvwa5tkTB5Ax+WlNg2kgrbD+9Z5hxB6Brr6lNHk
	5emfXV7TFEfW0f0yEch8bD32dSMt90T29b5ltdtOgeMHugAyFNTpvUH17ZCzo28IwiF6Te/Annd
	jdQpNeF+niyZ5C/xqSo6WHT/a8KCxpB7zCcSe4x+3EaABFfx7qqwgIhX+in/UjJ+CTP4IWv7Eew
	WxYp6RSjg0mjyDsuOQKijvphGWA5sDCmyWOpmEP86B9hMJbODhrRC/3sMXY/U8znIvN1Jar6qTF
	LaPUT9iW1pkuflJgjUb46qzgdK
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr112302431cf.4.1783892160944;
        Sun, 12 Jul 2026 14:36:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2511:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-51caa02c6camr112302261cf.4.1783892160488;
        Sun, 12 Jul 2026 14:36:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f80esm2388024e87.24.2026.07.12.14.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:35:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:35:55 +0300
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
Subject: Re: [PATCH RESEND v5 15/25] drm/msm/dp: add an API to initialize MST
 on sink side
Message-ID: <esaigelvp2o7hw3z32mmtlmy4jzvb6v2uofmsvububwbn5oybt@hymmfbamhlki>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-15-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-15-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIzMiBTYWx0ZWRfXwMmyMmgd8eqp
 PhBvzmpgxqjpX5k+Q67RnBJJOyLzyaOe55jAKJlwx1aeEMSG90IhCT7Miuj5M83kDH89iKKzaqH
 pmsaSvVD5uFtWxAbL7qCJ2QEhFUFFS8=
X-Proofpoint-ORIG-GUID: C3xaKADGfOZLj6PDhYZpQH_ja3sQH8Q0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIzMiBTYWx0ZWRfX0ox430IS3Upi
 eyDEeZvM5TKjfzTMM4JU5a3nGhlY3RMNisrUHoaojTNZSZ7bh76TLEFk93n1+5cq8hTt7JYsDwJ
 5HE+XgUNmTQpESQS5IF7f5U2yZ3su4Y3Dg8anytDzKXu5aCAcyDVqw9NcsLCEKakzaMD1bgCSIN
 co4MovX1gEYScgorfhpHlOdHLHmD/I4JmUWZH8xVt4LvVSrYhpzzqbsA7DH1zjO4HGsdjaRO1a5
 pYSRshXNaDx/9KSScmuqzNkMVmKFLhVGZuzt+Hua7Xio9Pv3CzPGy+RNWOO1ZsYmTvMeaAWu9ew
 r5EdYXEU5RtwhkrV2jYl25FGik/ZEpzUBen5Ji2qyKr1lGH+8/4b9SbmhdmmRNWnWoGs0YuAsDD
 nrHQxE8/hzMaScUyf1CXQDOIX7CyHZ5wvOY7bIUrzF+SGpdUZWP3196RwvOk367/gzUsUX7uaE8
 Imo4ngWInaAytogpAKA==
X-Proofpoint-GUID: C3xaKADGfOZLj6PDhYZpQH_ja3sQH8Q0
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5408c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FHX0uZl4Zi1gEOnxAXAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120232
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
	TAGGED_FROM(0.00)[bounces-118602-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: EA86C746087

On Mon, Jun 29, 2026 at 10:14:36PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5786e598a406..c3be656f10ee 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,6 +14,7 @@
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
> @@ -270,6 +271,31 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>  	return lttpr_count;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink MST state */
> +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +
> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
> +		return;
> +	}

Is it not enough to write the new value? Please add a small comment,
why (reference DP standard in the commit message, please).

> +
> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
> +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> +	if (ret < 0) {
> +		DRM_ERROR("sink MST enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -288,14 +314,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> +	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!drm_edid) {
> -		DRM_ERROR("panel edid read failed\n");
> -		/* check edid read fail is due to unplug */
> -		if (!msm_dp_aux_is_link_connected(dp->aux))
> -			return -ETIMEDOUT;
> +		if (!drm_edid) {
> +			DRM_ERROR("panel edid read failed\n");
> +			/* check edid read fail is due to unplug */
> +			if (!msm_dp_aux_is_link_connected(dp->aux))
> +				return -ETIMEDOUT;
> +		}
> +
> +		if (rc)
> +			goto end;

This also is going to break DP. If you are using dp->max_streams as a
determining factor, rearrange commits so that max_streams are parseed
and set only after the rest of the commits are in place (and the driver
is ready for DP MST).

>  	}
>  
>  	msm_dp_link_process_request(dp->link);
> @@ -317,6 +348,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
>  end:
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

