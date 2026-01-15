Return-Path: <linux-arm-msm+bounces-89146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08156D22DC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0ACF304172C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C4833A6F1;
	Thu, 15 Jan 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWyVbAjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqY9E2vB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808933A02B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462167; cv=none; b=Ir6Sswu9KNISJNYa3toouny+EX+ms82S4DRAClU8PbhOCONvydD7uxSMTeTnnOp/1K5oSDOn0NmMH9kRUAVv6wUT6uNAXQMyS0cogLxraJkG7Tmitahs2N7IVs+5qVfXA0+KMm2MM/GemB3KkJjkdcPBq4PE3d8dDWjCQkF+3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462167; c=relaxed/simple;
	bh=fkLuhNQ1Vt8dWv6i9Z6C6J9iVHkfa49Wb/eiZ3Z5MVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ItHAg7eU6/HW4o/UabTK2Rvi6VfP0uoVxlL4UPp+h4YmaO5ulZkLXF14ZiiSwtRDXApa+faNHFvnd6Kzsc0kGMLOfQNaZuBvKJ85K+EMgCaNpBag1nu5bYEFA6C9e/kScyt0exq0ScKClvnkumWkthMUS0xKRhu8Cu309mKdC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWyVbAjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqY9E2vB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1oD783422
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=; b=NWyVbAjrtsNJCHmM
	mi6NeUKCKhMGnRMs/hTdVzKG7x0AU2LDKjbjnzyk+0vf6Pf/XOTBfie5fJ+9eOBC
	yDsJPjqwz1jQOeaPuugmb6N02SFsEFBsl+BVJxLhlXP0eXKyhq/DgNZS3TaqBbUN
	PCNL930ysdWtvKl3uP+fBMMqJdmGjk5CTDR3wr4ElQ5kOFNKAhalJaTpME4A9y5y
	ZCYjrckUhBhuzXzhJzkhAwDDxjU3cQpIaLSfx/lzmekrqT8yOE2o95lvNeshoEy9
	8SZKx0IubjEIRzfFqTuT1rZBp9Sv89NmU0OQ62ncOZPOBGY9Y3t88KGrHa6LxciU
	jmj0LA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5k006-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2dbd36752so172232685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462164; x=1769066964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=;
        b=RqY9E2vBOrRMYTc+d28zcpbjDitM8ev854IR2jK7aI8zRBkboRmalSanlN5zwL0e4W
         R/nmTQxzUkLN37NGoXzP+WiLQx+IbDDvQ96by34YZwulXRyTb7IaQLjsotyl/cw/2KsI
         EJ1zNjdo+vgVocx4kTZHtGU2q9D6YxLPDAEmQmVm62Cv4dV/6TW4XZZ66vbX9mg3DBDi
         K/9u8AAcnWYXYKnYvBbQvx+F0fK0hRH8cqdyS5qd643W3qCltyvz16GDiWt6EJjILMuS
         ZldwPSHfT6QvdzNK02JsOSdDC3f29BCu0q3X9PB9leoVV1bFYgGfee3GaEt5uY3AWw4F
         a1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462164; x=1769066964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5ndWq2+SOonrUyTb4YVdVJvwIrb9Y/Y+iuQpW2fdps=;
        b=ijZ6EOqp+JcLWvYmDVXWWl9WT1Cm0MNx+j+xZcfliwglGxHXIO662FDPZuSoBjPWux
         2ocTJfsSMbz+fH8hkRYNH68SeE0NnOWiUs4XLjHfM7hniz4dgCTBLNTGglabdp6I23tD
         Ao3g3OLi4B5PEaAHSLtKrM7vASfWTo+bGolftjjJdAzP1WuFrQ2iqxR2qLQz+RhdZ2F/
         p9jT0itjVJX+aWIWKvPmIFpSd6LGYBrYHKn0Z936eMIWRhWW9NDCWDiQ68crPCa+ZnsE
         f7np2h6zfZMkuUrfYPBX9Bg5xI5Vnmx2rkmV+lhDA4zSKAhPSCwQMAbs0in8GZcm0KTT
         db2A==
X-Gm-Message-State: AOJu0YwwVoVwMN0BCOKqcIpsZpOEcoTnx034twlfAjyOOUbKSdFqZHMM
	gvJsj+h5dwXG3Q1zw2VbrZ3vwbc3Ss51ZHgEKmw7YJybrELnF0SikmOptfsLSBC4OPmBMDt9Wic
	P+peGe/WTwFEhG+FAItotrDZUjSd4keoRPHAYFbexX30RJ9g1i0RR90Yevr+d8u/h/lk4
X-Gm-Gg: AY/fxX6KF31DMS0a8jxgQrqUjdvr2MtlEM6GfsLVhTpyEU0SSBjAxWEienNZRjP//hM
	DJt5GL3Y4DtNCcEZBgDc4mBoEfJafKFieRwof9xcB2ZZhOgqaKcEbQQznU5vb8GUBfmYOwwCs1k
	GRP8xoZMr8VziNqmO07+f00QqnUItjDGSBa+RBuvNAqInimHgcmEHeoOLE2ftsd+Xp4NPDRqe/y
	JA6MOtKXKYCsbdWbiEsPyphztyNSUtasxoYqg+uADd9I4MJYdfg8VzKBp6O6097h81lWQmUV3Mi
	fLxBgIhtIsJ/0bFZrA4dTL8H/RC7NKU6ij0D8oR50eBAHRADe3OLnQ5ZkgKpCnFo7eJ1MUjRPlc
	+16HwGQ2D4e0u80cI2BQS9nT6IPZvDkQ76UuN/2tbRWNM+ElM+GLlJARnqIcna7keDakrSCkHvJ
	LS33FEI6SbzbBeL/k77gVkPB4=
X-Received: by 2002:a05:620a:390d:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c52fb1cc8fmr788420685a.21.1768462163988;
        Wed, 14 Jan 2026 23:29:23 -0800 (PST)
X-Received: by 2002:a05:620a:390d:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c52fb1cc8fmr788417685a.21.1768462163391;
        Wed, 14 Jan 2026 23:29:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:10 +0200
Subject: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oivVKkrTSnZtWeuu1n/u5eqzgPzs0AehXaBFNGRZ8EM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdOcd97itRELfXJN0X8FeIsn/bdHfDHmzyk0S5l3u7
 9LZopU7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCR8AD2f3aBaWecIlnu3Usv
 E169dYLcxTar0gjjD7eDQxM1DII1dpo9Wsf00kNref4BR/3OOQFvuVs753AFam4zmxD0K0Xuy9b
 GJwJFm24cE1xwq/7igbBXqQtWi8y+HqKl/23vkobr19aK/563vay5KF1DaZulR79O427njMC8tP
 06m3rmyLl/9j1QszY2XF4x16iyTv3jole7t23mj1351Knp47GC5ZKHckwMHqq2z5X7xjbhQ+g/t
 jm9k+wsyibv2yzF9UfkpVKYpEN7+6u6TU+CZjipd1mKblrvanw2KSwv7ff77Kpv6inz1x8+tu/9
 LhHWjFnGXdWnRRNSHG03xTMnn7tj6dDO7yYWfICx7C87AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX6h/xl/oH9DI5
 RlSJyDtYXOCGfg+YCUlhA5Gq23PbTmW6gZsEwu6w4nesJTIO31pCz7ZwW57Kl5hRUCVao/WNs9Q
 Dyfp1vRxf7ohMF8gRIU6l231lhvKq/hxAnDtmOAhY7o+Q5nswuN4bswOzkZe/L8Bx6HB5UpTt0W
 ESSfx3Z1rV3RGVvXlxPYZNaCsBfzrnlr0ASDNyFfu8QwORvAiCIJPPwmwSXhM8f/RNP8KcXiho+
 BjXbtG7JJYCZY/vg2Wu1q+cN/W1JGayb6yjNfd8Qh2QoDl4Szvp4a6iUkDy2UfhC27D33KsXPuL
 UzZS8EJ5yGdfl4vRYO2Dd4M4+U5m5XGXENgC5khLCP4svznyfHeBFDFJaNcdCLMB0OdjmqaS+eK
 413O/zo3IUFnBt6bJBsyRy2JSKc4QYeya+UTSNiBjddHEU3d8WN7dqLj72keeBbiM5pZw1FgwOb
 GHISur+SOzeSdZN2Qyw==
X-Proofpoint-ORIG-GUID: WZyc3-hdUhVDrSL5cedry4yO2JgEqew4
X-Proofpoint-GUID: WZyc3-hdUhVDrSL5cedry4yO2JgEqew4
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69689754 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gW5k9mFOS1cgrKxYKbgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3184066adb15..e0b424ac861a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -343,17 +342,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -377,7 +365,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
@@ -437,7 +429,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -506,7 +498,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -527,7 +519,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1121,10 +1113,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.47.3


