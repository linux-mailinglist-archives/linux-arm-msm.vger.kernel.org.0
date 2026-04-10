Return-Path: <linux-arm-msm+bounces-102625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAEpGjvE2GnxhwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:34:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A28D3D4DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3C2A3012BE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EDC367F39;
	Fri, 10 Apr 2026 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSyw+UXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mzjl/ppG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E409372685
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813647; cv=none; b=ErBOKZACZbPbaLWm9WM5mYelwoxQWyFcFErquBbo+hvuyTkjRZTSApIX+9Um69nMtHpnLxBvNOoyJ39cG6okDSMFZqGUbZZBmE27CmC2Va+zX/iCl/j0nK5dWdrV5VqmYrR8xQqQDwuRRkQsT3bWPMRVrMaIcyczfwCdnbSHbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813647; c=relaxed/simple;
	bh=/8I1D20k5pe6RwV9Jpppj+obqELe9VfhV15Tbm4kzzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5N4qxdBm+DOaC5i2MRw/7aiMjxGjr+p0IX7s7REbeH1cKeah2ShziSu1V2CmX3NkTK8WfKRp8vA+foGZVitOZr/gjU5Vi24shLfB076Y4gQ8k4BV1cwMCYMl5RlFhQD4k4JWJyMFZE4/c1SD1T0DUhVtp2fCTRniBGu+ws2F/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSyw+UXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mzjl/ppG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5kkV03352614
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg70xtusfN77l4edYTdi7IRcKoTkvyoEWLzCZzOuv8g=; b=OSyw+UXJZ6GcMaOW
	9Vo9HJ7bnW0K2/1T3tLvhcsNefPeVFPPQkS0LUh84c7feoSijUL+WTeoQyffjrwj
	haT3/c2Ve142fyTkz1gu1zr//spUIoYdkvm3lnTvAbcsUiXhBlmyf8bSFlduCoyR
	nlmkNFkdoohKFJea0yYVtGx+NW7xJDCrtnztJ9/XETEMd4O36mPSR8JM3FS8FtIs
	VkN+Bv/5GPu+7HYd6QC8rPiQnaB8y8wG9pa51+5rVi8J+f2hJ0jvz0LailEa5xrN
	a75WDNnLD4SJgEmEDuQICWrpmV18haifKg2egSoIXz2xKI2pMYsRz4OBQvzKZ32W
	/BeJTw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1quv32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89463017976so46577806d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813644; x=1776418444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fg70xtusfN77l4edYTdi7IRcKoTkvyoEWLzCZzOuv8g=;
        b=Mzjl/ppGDSvYZxHTUuUcpVcej7tEmp7eUbw+pwcXcuITyekUgWkLfNw+k6aELPRShN
         EiLF8/a2XMtvuFhL0wQBQiMVfkemvcg6hzVZ8E9ItHPbxMNFmzcWj0WrpxiNMG08SSQi
         fPe7atzNuUmzxoP95iRN8To2sd5NsVhL0BgnXN5SvYYxWDFN4/swCfokNzie9i5UyE0H
         SUbbAO0wxrcnVJPkq/uE9mPfg7NVBQiEnWdKZx5Vfh/eJu8pSPhReS6n+LgkSNtj9+Vq
         SGcftYgBuO+qeWIncGdthASd5SfiLCE1jchQZl5hNeU9MFWQXd5plOEfKf2EPs/mMtts
         cFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813644; x=1776418444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fg70xtusfN77l4edYTdi7IRcKoTkvyoEWLzCZzOuv8g=;
        b=dFXFVsSy9k2tuSj6/g9z8C2SmUEU7dWYwlVi8Uc3cWFHPqZabX7aVK+t4fFj2G6YqJ
         HiRJEL4JSqsodqJWhREpsb4WHnLqZV6gRUnuiWP9eic3jLJ51bjTvO4FrtqIYl0MtRrd
         bSnmhTvpKxdxTMKhgaPZmtn/Eep+0BAST8loo/fPGcWY3JJ0vIy/GBVr2a30mykKsv7T
         4pCkERPzUDylXFFHflUQ6cs96SqpOgVq07hdCZfS+5YZ0ll/VDzfsBZktL1egv8xbNux
         xCZts0O6z3b3pF3q4Iad2C82PnxwnegmbmrzlzbC28ecwb4+ZNVylK/+DieiLwzBaEnY
         lMhQ==
X-Gm-Message-State: AOJu0YyYnnR2edRUxal+Q7x8NN79dQa8V9hhWpf1Ld1f5nHlHfDBIA+z
	pm3OQMS+XEwKtEcK3Usrfpn6EgXdArWEUuM18dXlBwoLuStSrtz6fv3TsqiquIHqo5v7B+6DW4a
	Fx8OAb7pg1dkOGi5y+ZyVSm4LRTbgucac6f3NLnbE5JW0olJfTthsR7jDSWqjgjk/gd5/t5DIEn
	Uga8Rm2g==
X-Gm-Gg: AeBDievfiw3IW8vJ5YHfB//KKCbIlRsLq2fF6g5Dclnf/8kzr1umH4z8c2/iWGPSxki
	foa8Z92dwQ9O92JmpfOgCC18ffXEouiGqU7mRTOlboSE3Pdc/c99MmqdCvwMYjBgQK4y0BHmEXH
	fCmeU3LjQShqqyr7Jh4E3tmvNNWM8BazfHDdO8gPSGi+EGAwxHYTtMr8mw9RKlcEjcHaCTbORbE
	v9BSUKzNJvzhzjy0eONYzsjq3mf2JD5FEClRKEk7RNA0e09jc/FSoXZLkUQZ9MSZf1VZ4Fr/wZp
	ALsC6+R+i7iG3I/Pp1goHocims0aJi6T+7uUFJmuXTs9rjEAhWqEA81LBJFjI8R2byvk6IcW30R
	UHqKZSJ4mumSmK2pt1ZdYN/9bbGrcUXwjgqq6pyhiN1VPJtgmPMZbuWbrGvqBcbOTnd6Fkx/K6d
	K/R4LinU0=
X-Received: by 2002:a05:6214:590a:b0:8a0:f8b7:3921 with SMTP id 6a1803df08f44-8ac862b616fmr37621666d6.41.1775813643772;
        Fri, 10 Apr 2026 02:34:03 -0700 (PDT)
X-Received: by 2002:a05:6214:590a:b0:8a0:f8b7:3921 with SMTP id 6a1803df08f44-8ac862b616fmr37621316d6.41.1775813643326;
        Fri, 10 Apr 2026 02:34:03 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:37 +0800
Subject: [PATCH v4 02/39] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-2-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=8088;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=/8I1D20k5pe6RwV9Jpppj+obqELe9VfhV15Tbm4kzzU=;
 b=pGsItULXtVsRnYvB8oGeS2J5jxWyb2f5WlOiVLDk6gaWnXrpfnOeitpPk3HH+2Qa8GRJAWG6P
 fFBe1n4Vdc5Axe3iudpNvrfMTWBjEx+T9C8qqGobkHyOBeUtekkJPkA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfXwTPer/IZdHZi
 M7vbdQSk5ABbXwsWxsx5S9gxu8V6ltyrJo+lF+ZnnNXx4r2xe3musAQbtMoZTbJVai2n+VS3HIV
 Ov3VZqjGwOMITbHKTTz3qKTbR/qntkC/6bnmmYlopOg1qjQEV8Qq0bUHDb+3lU8IYgylktfFIuI
 RgPeL9zk8vVX+/PCHqt+1+wm4q5FrMzv1g/VtGlICWi6kM+wTEa0yJEZO0HsLlIigxfHk4342Yi
 bDUVd3Rzd7kBiTy7E3arllOvbJT2o7ICorrnUVLZT/Y+v62+Fzc6ovZPmpIko9UhRF6caJQhQtL
 UxUJvnSEzpRRxP1fzfzsLJJdE0/OB/QrkRos1U7xfZwvdikrPPFQ66vc5TztN2/CgclvGXjx/VW
 Mt+UlpoQ5XxNz0jq4dvjPte7lfwhMB7JVgpUC9xq3L07ZCwNixo+RWsPr64mWecRcJnPF217zWl
 jlOdd3m+69bfkrYPrBA==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8c40c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ohAeICWEHyx3i1rom8gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xmd3BTT9LTehkvGKxHWyDCO7HBH6oOjf
X-Proofpoint-ORIG-GUID: Xmd3BTT9LTehkvGKxHWyDCO7HBH6oOjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A28D3D4DA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The bridge .mode_set() callback is deprecated. Remove it and move all
mode setup logic to .atomic_enable(), where the adjusted_mode is
available from the atomic CRTC state.

Drop msm_dp_mode from msm_dp_display_private and store the mode directly
in the panel, as it was only used as a temporary cache. Both changes are
limited to msm_dp_display_set_mode and are kept in a single patch.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 81 ++++++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 -
 drivers/gpu/drm/msm/dp/dp_drm.h     |  3 --
 3 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e28cc1bbb5b1..e9f0b96c3ebd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -63,7 +63,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -593,16 +592,33 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 }
 
 static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
-			       struct msm_dp_display_mode *mode)
+				   const struct drm_display_mode *adjusted_mode,
+				   struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *dp;
+	u32 bpp;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
-	dp->panel->msm_dp_mode.bpp = mode->bpp;
-	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
-	msm_dp_panel_init_panel_info(dp->panel);
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	if (msm_dp_display_check_video_test(msm_dp_display))
+		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	else
+		bpp = msm_dp_panel->connector->display_info.bpc * 3;
+
+	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+	msm_dp_panel_init_panel_info(msm_dp_panel);
+
+	/* populate wide_bus_support to different layers */
+	dp->ctrl->wide_bus_en =
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : dp->wide_bus_supported;
 	return 0;
 }
 
@@ -1305,7 +1321,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1361,15 +1377,19 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(state,
+						   drm_bridge->encoder);
+	if (!crtc)
 		return;
-	}
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display);
@@ -1382,7 +1402,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	if (msm_dp_display->link->sink_count == 0)
 		return;
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
+	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
@@ -1440,45 +1460,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	pm_runtime_put_sync(&dp->pdev->dev);
 }
 
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode)
-{
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
-	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
-
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
-
-	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
-
-	if (msm_dp_display_check_video_test(dp))
-		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
-	else /* Default num_components per pixel = 3 */
-		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
-
-	if (!msm_dp_display->msm_dp_mode.bpp)
-		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
-
-	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
-
-	msm_dp_display->msm_dp_mode.v_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
-
-	msm_dp_display->msm_dp_mode.h_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
-
-	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-
-	/* populate wide_bus_support to different layers */
-	msm_dp_display->ctrl->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
-}
-
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 8dc0dabd275c..af3d3e3a2d84 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -56,7 +56,6 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_enable          = msm_dp_bridge_atomic_enable,
 	.atomic_disable         = msm_dp_bridge_atomic_disable,
 	.atomic_post_disable    = msm_dp_bridge_atomic_post_disable,
-	.mode_set     = msm_dp_bridge_mode_set,
 	.mode_valid   = msm_dp_bridge_mode_valid,
 	.get_modes    = msm_dp_bridge_get_modes,
 	.detect       = msm_dp_bridge_detect,
@@ -233,7 +232,6 @@ static const struct drm_bridge_funcs msm_edp_bridge_ops = {
 	.atomic_enable = msm_edp_bridge_atomic_enable,
 	.atomic_disable = msm_edp_bridge_atomic_disable,
 	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
-	.mode_set = msm_dp_bridge_mode_set,
 	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 6c0426803d78..6d4cbb9f3918 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -36,9 +36,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0


