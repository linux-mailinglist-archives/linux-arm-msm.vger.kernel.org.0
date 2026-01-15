Return-Path: <linux-arm-msm+bounces-89147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F9D22E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B849A30533FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7321C32B98D;
	Thu, 15 Jan 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7zNLmwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpdLcyTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75AF32ABF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462168; cv=none; b=hJPGp4IgYJ4RYGDkazFf+si45jfc78uSk/r3hyfxEHpPs3N+bayhxshklwYHt6CQmCGWpA/TF0y1Ba4idTlCsg2Ky/joFzQLCT8bWIIwaGUBhsmD8z5KV9EPjS0O70JvvABwph7Rk3akekThEi8wk+17LL+cGYnvTOByh9qy584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462168; c=relaxed/simple;
	bh=ZtwLsg6p0b8AfSzbDB138yGAcIa8HoM5WjV12Fcz6EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7sjoMI54tw6wA0mO4laxTpJqoe0sS6Dvu9n82FL5CP7ZZm8aYzTh5O5ny4QnPfUirgJ6md6wr96fpFMTBBuajmFShugHQiK7QWk3fBqlCvL1/7Z6Lv99WDO1Hb0a7hQ2aEZOu5ZGI6mQBh+KX8vWz88hncbFHjVXSASlCephi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7zNLmwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpdLcyTC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g8LO1554462
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=; b=N7zNLmwI7Cx41IjL
	n4cg7c19upZ6A9n0FvqXM7ZeALZiZIbAMs70a6vmu0z+pmfzkzi9kkdINaoXdB3z
	Qrd56b812WU0dk/00fOC//E7K+v6Cx+04Sz3PNuW17OGbTvkf/dCxIW+tAr6kpnB
	1K8LLUNdzYML5uaaAJXKG9OLd+PzOaUcZ0qNAqSLXA88FVv59hTvPsBRMPTf9eJg
	ld8c138fb8vKAyMFNggMXTTJZLJNVfaULE6cO9Yf94CDidcpuy7D3KbrOB5WZ8G6
	h1XiZwTU16GeALjej/z+qy3FvovXaC8OU6YvA6GEUyXi+Tx7OTWP9SFjGdE2tgkz
	yV+AiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8udcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so160799085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462165; x=1769066965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=;
        b=HpdLcyTCWAxrcBVL+fGM3U9Gy/sE0WtwfqYTqJ//9F5ZSxHYSxPGYf+pB5WCbIb8Mm
         hv6RuzYVCvYaRLBgfVZdIOrU3IdYpr5OHAhJzubhI0Hp5G9M8igOownWT6z2+l31zQZK
         tcQnv+VokXOMVwR/QcRIgpXiEC2rK5eWRgSZIyf6gR8w0bPlwjQR/UuxM2jSG/VSUlB4
         HpieywqChNoZMkrUfDEGCeYRcqCS+sQGiEIjE86Vc2mFV9RSXgtncjlHsIUIjmke/R6c
         Fc8O/ma0rtjX/DjgAOlB2YwpPAtJHrT2FYpK+oxWg1zd3e/pwlbBbuHtJRo1HNn/Spx5
         CLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462165; x=1769066965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLSj/TWpVJxmGvdBCFFcBev9pg9q/iSGm2XdYaBUr2g=;
        b=WMTNm6BITsD1OLUAOOx4VZ0DU2u1VXM+VlpmyGEHeaw5EhVMZ6hIxgdP5D2fQSc2Td
         2k6aMTpGq3c8V22kYQKsZuqlmpjWCkrmeq/FtRLg2NXPx9QlVP88wMFq+UkayAGuvgBV
         Yd3p1LgeY2z7s5Q8ZjKbgKxvMxG4NKrW+ONgxpPseKiw3JCuf3NlxwfDR10HGDXb9kHO
         kXHWsX2Dfzl6tyz35QH3enC00jZZWa3GnauXXwM/Q1aVMv98FWQi1N31LgdQPwYt/kSJ
         1LUfqtNfB+w980P/3aqMqH6wIFggq6okn6c+VM1RXiH89T4Pw7ejszNqBOOAMx8EbVT9
         64uA==
X-Gm-Message-State: AOJu0Ywc87AyKNKJHrDi29udIbhd+sA3O1GUVMvYMQvy3o0jCwJh4GGa
	beFXIpb5ZGsILrzAtiR4JAuqZeLlFmtGcIvGpAilu4ofUDkU9+GP6SeV3NG+Vphded2SJYafp/a
	jx6UdW6YVEzgoNb3k6e9ZJSNxxjMp31V0thvA94fDfvwwClKHuHvEGINGzlr49attLVFz
X-Gm-Gg: AY/fxX7WE20WZXaSKp6l0omn8kOW0EQNos146NyQu5Kv7V6Rtplrm0TA1+G6MkhGpdy
	zCdpjIuH3AaQPPlnMEKSXd5ykEtglEk5SmVRlXpNVmoK++w2hM3PDdkjal0Twj/nBP9lpMgqpol
	2oPBnTiR4kPzS4ExJBJw0IAM5o2Bs+3pHY4+H/fWOLFiVNMSEsekhuewv3fGn1yzpaDeg1wq8eH
	zhsYFI5q7UKPmAPszFNdNQhvalhOdLsUS8oFNs6oGMR2FBU2poUNmDPpShcMmnniMt0w2RtHtKv
	SMv89/g6Dm+nXhWPgkTIvwP2nkXUoS5smfJKcOX69pgcli0TXW6fZPM6QXwbJri/ju76b/N5fzC
	haheiL2HWTinHwpfS/pKJ4acG6BSiFzEV7MJm3EC/dkOJKJsCTCCUsseGgQ83jbzyJE8ji43FzW
	dhEqRx+bhVtkYY3zPp0b2QQas=
X-Received: by 2002:a05:620a:8a84:b0:8c5:33bf:524f with SMTP id af79cd13be357-8c533bf5487mr387330785a.59.1768462165006;
        Wed, 14 Jan 2026 23:29:25 -0800 (PST)
X-Received: by 2002:a05:620a:8a84:b0:8c5:33bf:524f with SMTP id af79cd13be357-8c533bf5487mr387328685a.59.1768462164573;
        Wed, 14 Jan 2026 23:29:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:11 +0200
Subject: [PATCH v3 6/8] drm/msm/dp: drop event data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZtwLsg6p0b8AfSzbDB138yGAcIa8HoM5WjV12Fcz6EQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdDlEGZrfhfWSXwbEfq2QgFK1z+KIppQqfx1
 RD1Hou6Sf2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQwAKCRCLPIo+Aiko
 1SU8B/97FtUsLseqjWjW6wU6ORL+a7MT0QOnljI3PsP3jprvkuXxu5bRHWzDrPS5h/I/gu/YSQO
 hLKjbJkE9tdfuQJ23itEvzdVDiKUZNv5lJm5JeF9CHmCPv2TKTOKO1sZPli8FdL/GfP00aBK1kJ
 wx2u9qmnDE078vg9HUBdGNxBqYEszXLMaeDqDQgk+wKgzOTjCdRNZ+908SiwZmj5SmFcqoBgzgn
 V2XTzKI9xqxq7zigBeyaJSeWqiyGe6URL/1CknXDKw6IAVPpkZsX9cLJpcUD6WH18qdV37ifO9N
 zAkPtRR3rngLh5Yy8GLBbHnAS96JvyxHEiQVb0QryuPskR1+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1cQa2X_bmp2_S6oChV5SC4tfMhcJJsZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX1TcOfzSi8iDR
 DY2l4+TZl505IFJgW7tc603IVtFy/NH4liOLFB3b+zcHinjaiZ4zZ5MJeFephyB3kaGQz8+ugiK
 7OjekQk7Wc6vTj0t7pAWCPFhboBIvddnTINCktcqNqkDkHqOPINzsDw9ot7+oc5fTby59hz8Xc5
 z8PcKM/KvD3XedrFzg3M4IBXVH4ocUlv5QIUwcbMK1RlGvJ8BVUoEBNCau6IWze5sAwYSlzWA/M
 UQpWRtjfVWdrskCxLGnrKbQMT+wXAhGK81IahM2qY9NYqqRS2wUbMrPFR09WzKqcrBSUWyKA504
 Z0RQy7nuGfUBuTmZ5OZOMtJF2A7OHrk/tMRipTW+7NxiwAQuhE5Wg7IqVM0H3c8AGwW5uh8WaxM
 zRSLjODVDrvFG46GfP/sHRddM4encis5Xfe0jNnxnswRKElFLKvHk+m63jcvC6aFCrF3OyM+U/+
 FGjTpycyveIB/EPxgvQ==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69689755 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1cQa2X_bmp2_S6oChV5SC4tfMhcJJsZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e0b424ac861a..e93de362dd39 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1722,7 +1719,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1844,7 +1841,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3


