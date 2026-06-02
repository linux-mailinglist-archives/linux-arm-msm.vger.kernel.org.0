Return-Path: <linux-arm-msm+bounces-110778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL/vAOOgHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:22:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13362B5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA82313B3C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4C63D3D18;
	Tue,  2 Jun 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhQ+nnwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+ocnsdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F53D3D02
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391498; cv=none; b=VMER5lNs42JMQu95jyhpGBwsHYszlePOI9M1voiwfslKoLPmnm2mW0wn/qV9BjGD4aaL6fzrRbmwsV/HGq+05GyR5PzY66m/axpGG2ueSo2B1LohAnmaAdWGazPBdzt/xZ2XOKDpqeqjFkdB/fJ4zaCZDqN+LFxjC7fYmucnPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391498; c=relaxed/simple;
	bh=utX2rWcnEK7sp26OqAqarcDBJ0uE50FzNeV/RPRB27I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAjtvTptcAmDdwqT18ws0jYozT7GfP+isr6c5q1HRSYTyBcKXCMGuQuYD1abddPEzfvVgOOwOYKpqXzlaI4tk7zLDnHY5RaDqaTElthbTPIjMYQ0iowfDpkFPk00XIU8zeR6VkR09f9rNz2VkX1XbK9PdYQzIyPuQ+c9Aj2f+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhQ+nnwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+ocnsdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525ios11316218
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=; b=NhQ+nnwFQIqLvsxK
	usM8NbLj3GXXjVo4WCpjg0VtXp6DyrpbRjRjtqzFR5HD0J0TiCOiyr1LjeS4tK+n
	g/Ia/ZNvBh4qkVaYkgfU+nzH72IDBZZ7FwCZh74q0cvyL4rN5xLYb3B6Z1FytBK3
	hRwCQGtoQjD2NLeV6i8dmg/5uOOkaxEXSaE0yJk2bJxnBfFyalolAbFFvATM4u+7
	LP2sq846VdAkUYYme4Xc+Y8xrJIWoAXorNuu6yj5plyWkT5qSB8PYTYzQH4U3LVP
	gwAOE1EeUw3dFHHkhZvqz/ClPvjDx00ccsOa0UFZoZ/v3SRyAiFxQ8NPdWlMbVsm
	JzkZCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vruc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517600719a9so21785601cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391496; x=1780996296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=;
        b=N+ocnsdkedZvhwMsYMfvKk1gIeaVgVp/o+LM7Ijp0qZQEoCNwekEiU7eLiwL0HhRMS
         CKEgChT8A11+MXe7PY+jrXgx/iDQyUirfjkw6pYSjYerMKVdkp/Mqp+kw2Plp3s+WsBk
         bGHBvTHfLvcj5ZI4ajeF8GQHz1rETC2h33nycLSvjwiP//UDErxlByqUfK661zgAlmKQ
         4StqH30nzcWjB6w8T7s8CzFOSBox267bTUvf0ggXna8u6IUZH/g8hlwGeW3gn154Urpu
         UuE+Da1Dj9KbWUE92ZCl320ytXczieo7LuhE2mRrAplzSY95fQebLFN7IvFaImLGqpyB
         0cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391496; x=1780996296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gsb2m0YYMxi0oazQhslfYqgxjuHbp4QxtyHnC/SdYhY=;
        b=fTRDPF5UqyYVI2qYfJKPybuk9emGWt89ez8Hky+oZ+ptKsRhg4xWK11wnRI/KSF5hs
         P+yfLeaRyvbn1C26gzJ38xbA5Qr3jc45El2yX91JrcMDNi2MyLqIYJ9kzZZaxpGUvxgL
         +PgqTvRban41NlAO4+0Zoj1cL9S0OP9pObVSTm3w01atD4BuvK3BHjoqr4fsXUCGWOWo
         m44F9xPSmqtyPbeKg0RCdEF+zY+besMdCK3MSbZZHTBzX4Z3tjiuT13SdnfDw5po/7Uz
         md/Zr3AVAwo2T/eXy8V46Q7VE7CHJfDf9cnQGptfnEUkIUEjUJMROQ3fbDWh/YJXBgRI
         M6kQ==
X-Gm-Message-State: AOJu0Yzx1oozliD61CtjPq4qE9HxjwFmhlPruUn2Aifw4RKvM4EJo4mq
	lx6T58rM2eOB/qpJl9BNP2cOT8Og1wAoSR2msdXjB0BALq6lTSorY60NH3Foe+qqknViHTKDWkY
	5l8qRCCdPqIjNbvA/nDVGtde1icjAchg95xiMeGXHOgHu5vIG+w5IpZzbtSzgI0Nymai0
X-Gm-Gg: Acq92OGvfmQrPm1CdfgKuJAE0iUUxqQ2hm9klOvxRPYbBp2vTNMxmvBMOqRPsuo/b5W
	ZB/hfvd/neZGcq5jHiiSqvZ+YQjYk8egFMrYK9dFsgvFX1OFAlJxoFyVXddWHLEwFGE7SzNihG9
	mPdSp/tM1Iqcxmq4AuUX3DtfnfiKCrU8oX1vjGkVgdKgSv9Vp7ky4+yhSN4fUjGxFxYG5KcNEKo
	IohrQQ/hRg4+wSaU9ihcxLqHeGmEdublivDbjFrr1eOXuXqbtNWkkGc2OFaIXcmMq9PuUTJPLQU
	ch0uwmvIzclk0+z2LX0YaOn6Ws5t3hRonT7cME1IuQVK+IHFgbKSeuWG0mLJpi44DEcUPVn1LXw
	ndi/ikGtYIsmtil8o9NhRzJG/6U7XhbwSEtxA3/HcnsodsJx+I/M2DvwXFy6B573Gz0L6HL4gWQ
	xIQwgskzHP3wwOMS+gcQ==
X-Received: by 2002:a05:622a:1802:b0:516:d84a:9f54 with SMTP id d75a77b69052e-5173a92542dmr191551871cf.38.1780391495867;
        Tue, 02 Jun 2026 02:11:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1802:b0:516:d84a:9f54 with SMTP id d75a77b69052e-5173a92542dmr191551491cf.38.1780391495356;
        Tue, 02 Jun 2026 02:11:35 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:15 +0800
Subject: [PATCH v6 03/15] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-3-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=4086;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=utX2rWcnEK7sp26OqAqarcDBJ0uE50FzNeV/RPRB27I=;
 b=ag5SVemMbeu4yqDiCnBBxzstPdazchSBZyEVVnFxjr7GQDKrJBa+ZSo/vkMKzp4XCF+WVC/Es
 9Onj1rVceKHA+PvOr+gcCfs9ZoABWs6BqlU59zD+QW9fHZGn0M09lev
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: wYF9ZQNFUPoO3fRkB0rXHa2-jxrn2q6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX3wRNp3e21fl8
 ZUndRTPr586MrFC/UfH1W74AOlln4cPOLe7nyaNvfVjDJPTqPIuDsOLWEjpC+9NQetDxk8TbJp+
 lSsNLpJjnVmeeEB64kH2BaBzHzwX/iylh99HvQsNBBrD4OCs0xVVjhWrwT6y5lLlsYcDNu+8SH5
 RAoo31ILJd4JYHt4nwsjpF0dTEImQqtsUSfDUOokXEsiic/SLQpeWS1ITrq69aRU3C5d/P5LUFr
 RPcS6gWz5eekgoDD12JusdVxpABEKXZPGdaty+LCIHq6OWi36dhZ62WwjFtxWTb9OyvQtTi7urh
 6o2yopDGvQehQUnDbCvwtcEbnDF89oj0VSWBRCyiGKIesCUXLbaxokjKb3f0sqvjia8bmDjisEH
 RALR2sMs6HWrjOpa+AxzPucrBfrEqhUG3ZjghCIlDQf7uzEbu55mVfBCCrJAPDiIsXHee7Eepos
 RsvEk5UwfdIOTLFd8Gw==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e9e48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RRF978PcF5p4qF5CYGQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wYF9ZQNFUPoO3fRkB0rXHa2-jxrn2q6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 7F13362B5DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110778-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The display layer directly assigns msm_dp_panel mode fields (bpp,
sync polarity, yuv420 flag) instead of letting the panel manage its
own state. Pass adjusted_mode and bpp as parameters to
msm_dp_panel_init_panel_info() and move the assignments inside it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 181d238addfc..f33c754b83c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -604,21 +604,12 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
 		bpp = msm_dp_panel->connector->display_info.bpc * 3;
 
-	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
-	msm_dp_panel->msm_dp_mode.v_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
-	msm_dp_panel->msm_dp_mode.h_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
-	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-	msm_dp_panel_init_panel_info(msm_dp_panel);
+	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
 	dp->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..e76dad0f6663 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -647,15 +647,27 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp)
 {
 	struct drm_display_mode *drm_mode;
 	struct msm_dp_panel_private *panel;
 
-	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
-
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	msm_dp_panel->msm_dp_mode.bpp = bpp;
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
+
 	/*
 	 * print resolution info as this is a result
 	 * of user initiated action of cable connection
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..4519ac374220 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -43,7 +43,9 @@ struct msm_dp_panel {
 	u32 max_bw_code;
 };
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,

-- 
2.43.0


