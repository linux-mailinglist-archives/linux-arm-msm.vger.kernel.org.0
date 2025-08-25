Return-Path: <linux-arm-msm+bounces-70713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE99B34393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DAE11881AD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AA7306D52;
	Mon, 25 Aug 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1N9EP1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004252FDC4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131566; cv=none; b=omKH79w4y9uldCZxyWqqdwiqwvCT51eeLAskLhPGc9brct3UsgaHHnfoz51h1HD0/0rrgryRuiL6WU6kwHGoF3MBDlvJylaYrLZL0mO1nw8vge/A52ebDYPNRqhm4npt2Y7ShrLYQ7IatmNqWmINbPLRhex+wArZAkZY5pvARzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131566; c=relaxed/simple;
	bh=Lq0MtIPay+yjPJuGDAZ+6ZARtIebH7XslPSHc3Frkes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtWXrmBcrhMJQPzr9Ne/CnzyrNkJfCG3IkVIQ0DFVYm6RmEKU7PjVPuJUHXYRXQLKZ8IPxUmz/xuNMbp8chbeLndOl3X48+wmTjvdJNH+qq7DBwM+eqHbAiRKVAZ7znrvbEgflnuqYktYi+ki0lEL/XitooFtn11QPKZsDEfN3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1N9EP1g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8XKN6007281
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEPgIOih29SfXqUD6GD70/nkYYFDZqCIEVkDEY8y1R0=; b=k1N9EP1gt6iwPhNj
	25fvbPhO9rivKyVGtAra6vy9gwHtbBkActx3a0D4O6d+hNOgAnj52cOlZni8hEUw
	bL9sw463f9EDG4M01mrQrtmibag5QBhjgapmaWP9DZsRTo8xsW6A5OyH16TcrFa0
	iDJX6Rw8Pv2fTB2dGDF/YouV+wThiWCfxEuzmz1iGGpHJO/VE40HP3WJgHQ7c7Ns
	Thg5jDC3Ua1Tz4p6MhThbPblAAV0bnHYfN5ZxOoluoym7iICVZ3yBntaajUUZr68
	S5EPEkfqcKWlfZLPz5PwivFu6zuD+L2ZQwDc1brEnDcRfPwkpqOqn5pwX6gD08R0
	CUsZJQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47156acca5so3614577a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131563; x=1756736363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEPgIOih29SfXqUD6GD70/nkYYFDZqCIEVkDEY8y1R0=;
        b=NSabXp6tNzC4xtbQ6UMgfzWuulfDuazfYjSO1XwLwE6h12sV5OOBIjzhHgNhIpL+wR
         WxsqB1iSp8HqYSGR3clU+qfWYdoHasIMh4D7csuQER9o3c8u3PRgam+F4J0RvqyDRjuA
         I/d/tid55EhDm9cw2feOEl90g20+RHxf9RKpvcNp7P9ZwouXXhO7BBfLSIaZEbDAPXkr
         eP9iQzENPluD+DdQRINxVrfZ7UlDE5o5GZazGNoH3ZnX98qT1Y4fkHav4pvyZ3eYu1Dq
         nKOaVR6yS73tI2OYK/xhQSDCMn8wziSAMXuDnQ6XALikcUoOG0uPwe2kPeAHUc8FZ8m4
         S9JQ==
X-Gm-Message-State: AOJu0YxVXCgP80tllB8chTaRKq34TIbBwWRk4yDA4TXMFJ1n1NF0K0MD
	ImrV+/yxYMdLrLPyKwthP1nJADidR9QKo19+xQS87gYjxI7edXk5ZVeO6127dRCsYXi5qtYj5iM
	V5C2VVoXMm4C3FwmgoLnoeclLryjNQYPgc4vH2towgdBndVG4T54mCrKeqL6/KPDT1Zf6
X-Gm-Gg: ASbGncuOdYh3GeZBfp7TefE57eFpn/VE055VOfv5QKYKu9fedYVOgNle2TecCgUTWoM
	6AfLml+egSZILf9hfPeV37UC/yh4iEZQrAYs8lJqwHh84dfXONdzdWvydeBxGAbq5DCEKLZqbYX
	rFLf9jocWMueWFpg7vohC/ZJwqQVvX11PLTuZdDBnLTst4CfrRbqTZM5VSt0tDCK3Vh3kxZ5fMA
	37W5VtpZo9p9xRrDzEYiFcB/H6948v5T6VkjDAedHTvi65gHqwtNWuXpOiGEYWm0KMHQ0RcqJyM
	+81R65AK0p/EDjQwAhw+pKCHDKmpA3jR5MlxlHKnMAzoluWpwONrQNDW54UbStMKICdd/K0=
X-Received: by 2002:a05:6a20:12c7:b0:238:351a:f960 with SMTP id adf61e73a8af0-24340ddef22mr16065130637.23.1756131563315;
        Mon, 25 Aug 2025 07:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn/UQFw+QFZO7ZeEzYcaO43UKCC3B5zX/4Z//+93qCW2qAoRaZpQx7NZQp/wR6yGUsZE9cyg==
X-Received: by 2002:a05:6a20:12c7:b0:238:351a:f960 with SMTP id adf61e73a8af0-24340ddef22mr16065092637.23.1756131562810;
        Mon, 25 Aug 2025 07:19:22 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:18 +0800
Subject: [PATCH v3 32/38] drm/msm/dp: propagate MST state changes to dp mst
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=3583;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Lq0MtIPay+yjPJuGDAZ+6ZARtIebH7XslPSHc3Frkes=;
 b=6Rua6mrAFQFC4aqDHArUc8KL8d279NHxrdV8BPhkF8hRjzpFRngjpVLc2ONfWrtvF6Q9IgQpA
 +8cCNDXjaOABXaZBjw+L/8BDqhSGiAHRnq+vFgUd/2FqpbbrCAcLxCN
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XT7MnVG-IMvVsVpEgAUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXz6oKqhOkX0rv
 TX1JomFv7FlxMaoKnRYM/FMAYGdpquJFXjA3ah9iT18akhW62Jg3A0L2jgKkDGsHyjd7M6Pkyv4
 BB2Bk8psIp0HynroPJXjrNjW1xQ8P+ffoXxb4WIBpRt9fqjrLh9aR7m/uErW55ukW95rtCQ6IgF
 raqGr3VYmHU2bUG8gJ3OeynKSTJiF4yQTypvv1+RzNmd4NoOWz24WJy9DuhXwMcq1RrJEmsFXhy
 ei5oQFdT/nx8iE7Uvh5sXHPDBgilLq/d160tVproIzEX0K/At+ap2CEIm9ZryMNzh+Jk6VhH6ES
 77hHFEeEAOR7LMqP5KvKXmpTP5/m+zd1bFNRLiys0NdAyQA8V/r5vekz5A95ob80vWwzaw7xLCK
 Tx2VyRSY
X-Proofpoint-GUID: 1mtwWF-mMPUpSnMwxXRtphno_wstxar4
X-Proofpoint-ORIG-GUID: 1mtwWF-mMPUpSnMwxXRtphno_wstxar4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Introduce APIs to update the MST state change to MST framework when
device is plugged/unplugged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8..909c84a5c97f56138d0d62c5d856d2fd18d36b8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -28,6 +28,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -269,7 +270,6 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 		dp->panel->video_test = false;
 	}
 
-
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
 
@@ -386,6 +386,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
+	if (dp->msm_dp_display.mst_active)
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
+
 	if (!dp->msm_dp_display.internal_hpd)
 		msm_dp_display_send_hpd_notification(dp, true);
 
@@ -608,6 +611,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	if (!dp->msm_dp_display.internal_hpd)
 		msm_dp_display_send_hpd_notification(dp, false);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 331d08854049d9c74d49aa231f3507539986099e..ca654b1963467c8220dd7ee073f25216455d0490 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -924,6 +924,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return connector;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
+			  state, rc);
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a..8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -87,5 +87,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1


