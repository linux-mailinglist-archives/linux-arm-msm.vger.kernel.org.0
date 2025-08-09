Return-Path: <linux-arm-msm+bounces-68141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F3B1F19D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6356CA04FFD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA2D241662;
	Sat,  9 Aug 2025 00:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFkS5kGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1F23814A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699746; cv=none; b=sW0gA90geiNutpdXhg3iWY+ztW+JlsbJWUkuK4IIRl+hm+o+S/wyzltFeuPanyNhD94s/3Ez5RC0lQSGZG+JrXvBLvfc/QYrsja70MKzOU0AkbR1sLe3xKC5zb/vHQ7+eMn/Ph0KXfq5fs1zYi7gMRUhmYC/ozkPOPlYWfBt794=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699746; c=relaxed/simple;
	bh=0luC8UsEHN9fWfXH6p1zip80kT4QBQaB8aTLon8BdOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKjiD8r1Vz9Bpsh95b4BNtUqxcVTxq8+JhDFsPpM0hjnlavHvOntyN/f9A51Uy/Z4QYleWNp54B6mQ/rROr7BUh1l32dlO9Gl7nRRe2Z/qXavyDqtS9ePvgGFrHKeZDgcaWUsMHqTKZG8vmgdy6McRiykJEhZBk2jsxs6xj1DUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFkS5kGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578HUOV2007705
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=; b=KFkS5kGJwoLDxjp8
	bC3AjVCcdw/tfdFuNHCF+IhBgmBBehYl/9I6Aa2o9maWBN3eXY+tZhfVzIwaDuRE
	zJHZ6ZlMk4YgKGGzmiVpo0wo7D+gZYL51sPqdj37qzE7GIAJiOt69limnIx8k8FH
	L/ZReglf9rxUYsV8y5tFGqlOVBDTeoJnz/QMDzSMHrXrTCa1ssX7z6sxASFsDC5s
	9QA7Jxaa5cVkW+t2vU2IvbcTvkjNCSdzH8r3c/06QPHhlWQpSjUHzOGSTSLX05wN
	6B7WikKnFbqAwnMkLloSdKDK48NU961+pWBd/CCDlDDp6Umo0u9pD2+6jwyXWNJw
	nTfPHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt5qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-242aa2e4887so58314905ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699743; x=1755304543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=;
        b=DWqgaLyCvqlm1cTswrG0yx5w7F6L7ShcMAWpFeLOizvI5ekKQ+GTmk0upnbqRND4A6
         e3CRfGOO1yd+Y3OetQHxSTN7q4frdhbQrCuDFmuL2FFVygfJuNRdp/FMpw7V2ht1tIuy
         Ip1cMD9dy0kwSSvSMH4brNWo40/dAA4c3Wf4CxIrMD3CK9O3sO5XOXWWdarWVJM3Nm/O
         5ACWv2NDoiwIupj/gF9lQFimL62zGfrZii6ikn5kK2uEPzKDe3B+AO3jQ5u6bDBDPED7
         /tN07EXMoP5FlezaxAe8IbJqd7iNXn2y6yO9saz7CLCcSDqYShrnO0N4OAK/4Rj8NWH8
         8/LA==
X-Gm-Message-State: AOJu0Yy6n9YErKl0ISPmMOdviYowKwim/5eXvwlWjpG/RdAQHHbr81Wq
	dQgwpmxk/MLs4NKGuhKNSxzj679dWQFtYaYExNSkYQxEICqe86BXVc0Rihlclcjmv/3wCTE5fnU
	xh85oAxiBZnaY2xsUvWAeKLam+X20Gmo21g/cJerj+nfRsRQgzEaYiDpFMq+PFDLBY7nmN6mqNT
	M2
X-Gm-Gg: ASbGncvfDmTzdjfx7z9RKoEIv7IsMINZEmlO9AFYJFLVJ+hK4Bi0LK+KyiSusPFmmUy
	NfeN4WaV50FEqC0VNf3Y1OlXOakTmSi5mBEia8tnaCGepurdIpcRrvnOMlm93Wl253ExL4k2zm0
	xjndds2HzEJQYwLJUtH2X8arc6iNl5yn5ihUn+UOMD+ER8BbbspKGfBPemsCvSy/em0OMOOILnu
	lRsFFdERA25Ie7mTHAGfPspv0ft/KHUrWKwlsAUQQso1zn8qP/gFQsoFqSkY0SauWfECc6PJdwY
	fbVsy2Qy3cxzWcNzs/6wSh/wIR2GTobAqpOXX3iUNcOiPJW20UB7DFqyIIxjJUDiGUjAWh9wK3c
	IFQPkvfwd3YuI44w1s6GvpzKj
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id d9443c01a7336-242c224116cmr68534845ad.41.1754699742718;
        Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAEqIzA4w/9X4in72ZzPva96ldMzCraSZJQFVFPIFyVWnAUhCwow2pLKBe5AzUihPqywBT1w==
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id d9443c01a7336-242c224116cmr68534535ad.41.1754699742334;
        Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:17 -0700
Subject: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2134;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=0luC8UsEHN9fWfXH6p1zip80kT4QBQaB8aTLon8BdOg=;
 b=KNHcay1Gz47I5v9s9LO4RakqENVxCn6/IpqtvSmuQPh6gYrJ4N3079g2LhjPpuzGoc1HhXkfJ
 VeSdBpztAebC7a6u6j0IrGagrIck7UzQwpogYuVlmzDmeeGdRJ5o8hg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfXyYJcHlPCVte3
 Bo87HHwDcheloKY9/FjkxObe3PBafwsaR/T2zEA6TvjPOhXQ/MPF6JjgfsQKz1x87fIQPQma20Q
 2ygL77rW6w5u42oEsOeMON27GNeI+ONavwPrYxqDIYGcsbnmSKYL7d0mmmQrq5nuae0bVR2fjEd
 1Ziq9iCaQwVRnyTOP6DsaY5QWwOxJ3FpIynaHmv8dik8SS/puCtEP9QjcqqHNzeYTLhqSYbe561
 ZM1NSZ49WS1crC2Vwxs8J7mApvzuX+DUfs4pfMFHSjhmfNOyGaFtndggnOS5bLeNDMs7DKmUOAx
 PrymbDTRXnr5t1zJ7k/lTDCG9Vy+Fxel+0Vhjsh/m918r5j5bAjizdgMFpYGIkJPAr2bHlgU9zk
 oqTZUgIY
X-Proofpoint-GUID: auO8U6catCj9ZcNoEdLA42T4PTJaP8vk
X-Proofpoint-ORIG-GUID: auO8U6catCj9ZcNoEdLA42T4PTJaP8vk
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=689697e0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=isfJdaZdMnE_RitM90UA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c849befe58f0..55fe8c95657e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -428,7 +427,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -497,7 +496,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -518,7 +517,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1112,10 +1111,6 @@ static int hpd_event_thread(void *data)
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

-- 
2.50.1


