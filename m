Return-Path: <linux-arm-msm+bounces-102650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM7RCh3J2GmkiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:55:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192E3D5470
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE2630D0F34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB463C3BE4;
	Fri, 10 Apr 2026 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcszaN9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEs4mLAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7E73C3BE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813771; cv=none; b=nRYE/ByNVKsBoxeve1SAp4OWbAZa4nZmlOE2elBKbOd2k8EJlY2CkPk/RI0pzOfy59Hy8wPLSgeMdm+DW5cXC/mii8Va0T6bkiGgIxfeQ+W8mTQFm0dQGhQ+b3xPnlE7GmtnALNWlkWBFCaXl0Y4eQ46vDbYTR/LNwPM8eZ/0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813771; c=relaxed/simple;
	bh=hdQRiP4RpTG/O+m0Jo4p1hYZ7i7PXdwl87s3cxyUH2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDivnI2Ql/VADISR3iG5WD6RUsOWb/Zx2v8W9PVN85juk/TGxtYoxxtkB4gzk+OJVjB4nJGki+fa70ZqURX+EraEBAYkU574Bybev1+sDgv8CRD1F/SEwCjRJSdaWJyKaphhxqFTnGghKdJQBp/CMpDklvcrwYCvCloHNgqZRxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcszaN9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEs4mLAl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oKjG708994
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFueMn+8HWN8x0UHaMCVey0IAB+cckhf9QVqLC5vzOY=; b=OcszaN9yhwAtA1/t
	1s+PfCVhzgSha5JUzZ3iUG81jlOiNkQN2/mlElhUVQzSeNkPdUkbITl/VowIHZxs
	6fTqmh8cAeqbtTgTcLbgGowIuclUDavqG8hKcjTtLsyRJy5elTWHrgy6BxDZ9pxP
	5dAQMUPeOgFie0cthsVbiNgi2pM+WSy0dJ1O1JFenC1GJcjcvEb51Fnf0FVSXOjO
	0xtFTNOOmkfZg8DaEj+yfmckieKO+5sm+ElLzuWmSDXwGhjklgc/R2Qp1qmbISKT
	iErsCi5EUmwtW4CnqRFGfWxevii/kx4KaEjZ0v+D5Xixl+7oPDU2MSuTSv89JQrC
	QxJvuQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a965acd0b3so54764166d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813768; x=1776418568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFueMn+8HWN8x0UHaMCVey0IAB+cckhf9QVqLC5vzOY=;
        b=iEs4mLAlrn/AA2tEAmmUuxC7/YaGQKMFWADQEABPehxClB0a7hHOy29hi2VaRf/vAa
         yPmtFyh5bCxXjGj7QmtVQQ4qTJFSOIIsQPZkgbm8tlzCld9+G8AUwBhIXBD7Mi2S/7Er
         hJza1SbW8NOAAWw4DD74Ivz7BvyEk561/5otJa5YYQRSPuCu3vjw6eK7Q47IptFFAdUy
         3tu9hv0VFqYes6rMT26BuNUzqSDWu9dQt4yFsagWZgMU0KaJkSxdDQs1zYNoPzJ6F/cD
         qPc1XqgeS6Z2QwZNqoEMy5XcvTp3LMsTs0jYQ5Qs+iPfIMnGPCBdYIwFIdebZZS7udWy
         SiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813768; x=1776418568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFueMn+8HWN8x0UHaMCVey0IAB+cckhf9QVqLC5vzOY=;
        b=O36TfcDxg/BAi0RUA584xuOrbCT+8YqPcXlO+wC8m404XK0XGiH5hWr4pAnRNJatuM
         FVfsHoZONZkJkUTiHUQSNmJJTwPRh849ny2LxOwV4Jqh2Dh8GTIXMzMsp9347owI5LZ3
         bdgaz6HS48Ziv3Rwwc162SnJbVZIDZ2XwElpc+4Qelt7ze8v2bXiiTLvNADMkNvGcm3F
         sUj+Jt9Md992AZ7qYlbKWtr58R9czeY4QdLsxlHJRZNi8nPp+e4k2xcFuMMiuO+usoWU
         eepjILfDZ8hE6vGIaNmv7LdMSD0u2hAFH8o69R5hhTc3HXPZUsYO0ICYgkKma9R9kXp3
         /8HQ==
X-Gm-Message-State: AOJu0YzgY2UgCKgzWr20EaGMpNW1WPBfb9YNwtADgmLZeSaq1207bb10
	2rfpPRj3gl8PgDOVR+eU8VPjn1lXxRBhze2yfo9g9RrRmlHqgJRgfawcxzhVoqUc7sCVYWu6eXA
	KVCPlsFq19U5Q6IfW0523X87ZcwFaXsLhzkXu1ukRMoG4hjwMA807XqvKk6EYGCEgzu1NqOVdmi
	cRZliddw==
X-Gm-Gg: AeBDievYsXFWoQ1g6kvLwN+k6qRxCZdpWWXcX0ASiGYSIlRWknnRisSxKTWTR4XMbpL
	cPetOetMw7OQmuCRJJ4hFpmHxQcSaVBLcrAEDEyBRhCx1bpuyv3j+Q+/f5F8Dxkrz5cOPZbmAXw
	2FWCH5yrgyDjeRzoI1o6cYNfdStXnRUX9Fx/pM+ArVxTudmki4aBVutykEwBFX2CLZEtMC0nbui
	N6q5RCAPbweNv17yTJj1BgRhFM3x3ike9AHxPXXPmtpoSOQjmpfvT6j8NvNbJBKyuMio8F48K2p
	u0G8NVeXKAFZblOorCUPJk4UU3JU4+zC+mv6xa94XOnuQeqd9h5G/S2026bSL069IoN/2rWRZkM
	HqQGpH/bAGAMFdnLiwJTSlkxVQQYZi6vBV5CAR1oy34Ntaqm6D46SA4lEutEBdxKvk7TUScQVTj
	1uyHpznOo=
X-Received: by 2002:a05:6214:5bc2:b0:89c:6bc6:e4fd with SMTP id 6a1803df08f44-8ac861ad30dmr31320226d6.19.1775813768108;
        Fri, 10 Apr 2026 02:36:08 -0700 (PDT)
X-Received: by 2002:a05:6214:5bc2:b0:89c:6bc6:e4fd with SMTP id 6a1803df08f44-8ac861ad30dmr31319836d6.19.1775813767658;
        Fri, 10 Apr 2026 02:36:07 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:02 +0800
Subject: [PATCH v4 27/39] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-27-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=5086;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=T7AuGwM525jy9tPtlyOcI8WxJAFrYZ1AUQ93J0+g1t8=;
 b=l3Y2tAadTSRwKptwOTi2mlGRpIW8mjcGxaoQJv+A5SVxTTz9GD+aqQ98abL4nHYdz9/WyRIQT
 12Aw3V3ukKEAPWg2uHQFPPniYDwwPrKE9qCPRLqXTnR1l9JqsGYRy9r
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 0kCByjq-rZ5jIT4wwrmwFb--9jqJ6qIY
X-Proofpoint-GUID: 0kCByjq-rZ5jIT4wwrmwFb--9jqJ6qIY
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c489 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=viFl3JHUHTzxIaEVkEwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXzKez/bArSAex
 poCBzxXxtj6gCnEIj49oepDtQ/Wvcy/Xu92oXkwEnq7qnViU3TpOQE0Yfl9GDTEafSuugb7dCRD
 OAQya96qvaBfY3D1L4cA+9IPob8J3gFQtr9GJ7Qkg/DQ6uRFVTBq2gFh+ODycthY/+oMrsmOAZG
 K5AiC4UYNueEcd/FatOWomjLJu7X2YzPnfxhW/tEPRcSbqE2guaU9GDsGW+Zh8voR2NP7L62vwm
 zLcBF2mxtxEo6+VLnbIoZ98OmCa5s2RvoAuc+M/PJWUiqzesgeX8XXc859UIg8kbwS3yODXotn1
 dhwUvk4GmNkpfzm+e1nIPw9OqSfcZMnXRxGBj748cyHKGkyIvtDWUfCDTz1hZsDOFsPYv/CkKyv
 7xILMrZUmMM9hiEyj8EA0RBhNhtaAuUt1xWn3lOaCtaJdBh+r7eHvdDaauZZPRBJiXZ122mKdHQ
 iBSz2W20uiqz64cysRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102650-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8192E3D5470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For DP MST, the link clock and power domain resources stay on until
both streams have been disabled OR we receive hotplug. Introduce an
active_stream_cnt to track the number of active streams and necessary
state handling. Replace the power_on variable with active_stream_cnt
as power_on boolean works only for a single stream.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 41018e82efa1..035e230201fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		rc = -EINVAL;
 		goto end;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 33d8539afee7..e6ecbb3a688e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -657,15 +657,15 @@ int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
 	if (dp->link->sink_count == 0)
 		return rc;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
-	if (rc)
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-	// TODO: schedule drm_connector_set_link_status_property()
+		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
+		if (rc)
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
+	}
 
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
 }
@@ -674,18 +674,12 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
-	if (!rc)
-		msm_dp_display->power_on = true;
 
+	dp->msm_dp_display.active_stream_cnt++;
 	return rc;
 }
 
@@ -731,16 +725,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 				  struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
-
-	if (!msm_dp_display->power_on)
+	if (!dp->msm_dp_display.active_stream_cnt)
 		return 0;
 
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
-	msm_dp_display->power_on = false;
+	dp->msm_dp_display.active_stream_cnt--;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
@@ -876,7 +868,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * power_on status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1559,6 +1551,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "no active streams\n");
+		return;
+	}
+
 	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
 	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
 	msm_dp_ctrl_mst_send_act(dp->ctrl);
@@ -1579,6 +1576,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0ede5505be58..2548f67cd441 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_cnt;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0


