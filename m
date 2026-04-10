Return-Path: <linux-arm-msm+bounces-102659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBjgNvDG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C193D526B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47B073045665
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D813BD22D;
	Fri, 10 Apr 2026 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/h0MwBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi43bMTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137B3C873A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813816; cv=none; b=i1cF6uoWWctF1didYXbmJwsAIMjMqsUC3B11NZdHAq2z3cps0w056mBZ1kJgVx2oHG0Ea8xzAGczqRYcXD5gT1RWivRYN8tJRNG75n/foePhB2Gd+biJ8YMvw/j+KUt1ZPOd4JO8unU3/LACkkM6+SQWGC+zhVaF4pI0R2QNPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813816; c=relaxed/simple;
	bh=J5usUXEa5V0R+wY+3ZMkYBdyXaNuLODtmOCHVXuNsh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHRYYrjqrPnT8aVtAQlo+cRk4Tt1uPR+h8r0+Xl7lVb4c9pkzJToC6mTiG6WmoPpAFj+2J10bXC8w+7nWNYZMeDufXLG5aeb84GOlGIzl+Gnj7zNCFGeWIgvbAeQ9zqm/X/z+k77/9IzqYLpgtKTLBzH3as+QdHE3/0KyeBzHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/h0MwBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi43bMTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oLni709079
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1R6enKwcmUC8y8abux5tSNxu61FuxKm7MbCospVBVrs=; b=Y/h0MwBYYHcNxWrK
	/Qc8tpcSNyeU4eWpYziFc/imAst2mKisIYTcHNrvHw89SYowjGHvpyR3n9eZHzjO
	ZUHX2OyVYNBBQBF2gyy6VcT7+r2FiUMm3wwkKKED23VPQ2clV9rjti0XaOoHsSE9
	Mb33AsBquyWxyGQZKYXVDHzo4OJr505ax+xijy0D2CkIsYNp/t40uYeRAjNmHqDk
	TzxLEcNgjs6wlow8FEKKSVwi9EsKdwzOLt1tv2AG0vREiAIzEKamYX8lQwp1nwWH
	UZR+ISwZoaeVXJfJGzqndyr+bkUnzbHWSl+Vye8BjfeX1aujoNinv0qB4qWoOLNA
	dKtXNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso49464791cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813813; x=1776418613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R6enKwcmUC8y8abux5tSNxu61FuxKm7MbCospVBVrs=;
        b=Oi43bMTq0DYuqPZ1kcMOJgh7czPifC0ump6u8GI8cggOUUGxr+HhDfK0jyzWJwKHrP
         fl5PpzYrH1kp6NtsaWxj1DfxMYRr/Iwot9ZmQwKtA91CS9G83PzeXD6pLqWm1FasKsKZ
         j0dQfNpMpLsZ3pnIff5OU4rikWWyEmO3UWtqE9IpG9tZadOgPejaWuTmikDDiXdlUNIx
         PocALu0DtduSEoPm2Q4xmeZXvuTbOH53lWAm/XdZ56vhEUnVJZ8qLJQxMvQzAVA1SjZ2
         te8atm6zTKuSjCeTPERDFAvtLUJUu5RXytKcbDy5XBizNQLWgkCuRJydJVjtRqGoboz7
         Sp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813813; x=1776418613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1R6enKwcmUC8y8abux5tSNxu61FuxKm7MbCospVBVrs=;
        b=j41U4DDktvLx28u2qmIDUND0m1ZZG6RygWaywwQin2djEZvgnbr6xoODoOz0JvXgdg
         bUHLzCP/dn33H8Rrt2+dDYAEKZblyTn12jbFAWQ6s0YBWBi2p23EkdfkRWYWAt4f8ku/
         bonGcm9F28J7I+jkWB0JAjxxHmDhWQedVB0WP8avHyhCfb9LM2yY2dImkam8P9yBm8YQ
         KpB2RiWz4/yhGHKuwFUD5/EmXd3wATgXvmp92PkpBsvvXGjHSfOl/imRPr70Q7jpt9yC
         nV1Ad3E3Q8HE47ApAZTJiI8S2cE7oPC/KW6cfkDwynKXVvyEurVsZrNYltwCHpLkycMm
         e77g==
X-Gm-Message-State: AOJu0Yw7I/rLLAm5A3zFve3MWYhX5zmmeONfeAOA1sc+XEAUSX/iukXO
	/ttD5rnzhSCGvnJIfxlIRNB7iK//bEXdnNerVjiEc1++CTRSEe13ZGl0GJi7C/dXiCzPPZ/u9xf
	ohxhBRvyz9J7VKCdj04Zkcca+fWsQswAQtdCbb+zU+YaZ/8sNAuJGA5KqYDt3LQnCz3GQ0aCwJq
	dBiw4l1Q==
X-Gm-Gg: AeBDievOezuV8MxeBTXQq30ySjU4/Wiu3U0mD9gusKhxJ1iGXcH935MZL2lp8lZJ7ZI
	IbJp93VWaGIQtaRzgZoalINhH2sh9kGGhEQimLN/FRPjSHjzSNXGEF37siVy69btiMcUJWLML02
	AXk09Jc+vs1ZZOPPp2hJcTde2Q5Yz1mQhoI9ozgRTd+ulzt5urGtQ4tM3qvlaxAglvLrMlD+ozA
	2SB97KzxbUNg7AeMQNRlKERkBUaYb1Hgv7D8IaHdQIR48HFJoKUykPvpP0ILMLJDBo7SS/iUzjE
	IUg37veuF0CC5iFLKPTsGlldb69LuWIMxnapDXi/WDawcMUDSqUluUtSdnuMBIr6uaKEU6TFP7G
	RDS7JFx/0WAgdUudfbPlUEX3Fe9/n1GHFnR0HHVTCaZXVUPyrVOwEAKwl56vTEJECSDRuzLhvPi
	3vjleBirI=
X-Received: by 2002:ac8:5a88:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50dd5c3d98emr35009221cf.41.1775813812783;
        Fri, 10 Apr 2026 02:36:52 -0700 (PDT)
X-Received: by 2002:ac8:5a88:0:b0:50d:6ab3:1acb with SMTP id d75a77b69052e-50dd5c3d98emr35008931cf.41.1775813812264;
        Fri, 10 Apr 2026 02:36:52 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:52 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:11 +0800
Subject: [PATCH v4 36/39] drm/msm/dp: add connector abstraction for DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-36-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=8841;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=GA/AMqPL0koimahEeSAV8q/L+lqTP+GhAjTWb43a69s=;
 b=qzFexBGjAGZrbtPmbmXcDvS06ZyD4s4ja3ywxVZ69KNtGkh3bLrxlf13Wsc1tL4aZN5tD19Zu
 2LgiEmDHXmBD5xGpL0oJWdpd+/tjQmVAUzs7fFGzCD2hsFm3mUQ4/E1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: r1RDo4owYa4vF3fFud1fVcdCUkcKQwjP
X-Proofpoint-GUID: r1RDo4owYa4vF3fFud1fVcdCUkcKQwjP
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c4b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mVHCav_IkjWnAo0-rBcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXyb+ldxzHlLNT
 w6vx5sHU5OtrkBml10JaCPNC1UsP88E0BFcFuiRFPaMKaD6dFURU9Z7y/RfOPGPcF8qRTSFEsa4
 kAiO1xdff5c8jNXsIrC56T+dacsXCSot4O4drxVoHKORY/3NMWsgqZSA2lje9clTBrY7Djx8Kda
 JGvaJ1pOUSvJXbKw4YBiH0OkF/Ww8XeCGvEpfVOmAp65P/YIEuuahE00WPJVa7X0dGvscyHy60Y
 wgvYejGz4qEnVB520Oq2YzZI5duIUbUCbStR0mR2APZsalWzKtgZNagNfG8D7s3M0cieJRpShSk
 CPqSQZXf0yMtqA6Mw+HpNkzQxMWvgo8MWN6YA0fsnVA+lAElwkg/k5EaJ6BbWAnu3AGwuqmgUrx
 wsP3Db+plhepi5LQXdfg2N7kwcCq4wVSPBVFYRh+7BP/6kPZVq/holJAVcRvAnoI//SboNgTNTC
 NnDtN5tYTW1NUrMKbUA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53C193D526B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce an MST connector abstraction for DP MST, with each MST
connector associated with a DP panel and connected through a DRM bridge
to an MST encoder.

The connector is only used for MST helper callbacks, such as detect,
get_modes, and get_encoder. Display enable/disable, hotplug handling,
and modeset sequencing continue to be handled by the bridge path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 231 ++++++++++++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 4df3ea5e36d0..bb3898b1f6b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_bridge.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <linux/pm_runtime.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
@@ -489,6 +490,235 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 	return rc;
 }
 
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct device *dev = dp_display->drm_dev->dev;
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return status;
+
+	if (dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	const struct drm_edid *drm_edid;
+
+	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
+	drm_edid_connector_update(connector, drm_edid);
+
+	return drm_edid_connector_add_modes(connector);
+}
+
+static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
+							    const struct drm_display_mode *mode)
+{
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp *dp_display;
+	int required_pbn;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_dp_mst_connector(connector);
+	mst_port = mst_conn->mst_port;
+	dp_display = mst_conn->dp_mst->msm_dp;
+
+	if (!mst_port)
+		return MODE_ERROR;
+
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
+
+	if (required_pbn > mst_port->full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct drm_encoder *enc = NULL;
+	struct msm_dp_mst_bridge_state *mst_bridge_state;
+	u32 i;
+	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
+										    connector);
+
+	if (conn_state && conn_state->best_encoder)
+		return conn_state->best_encoder;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
+		if (IS_ERR(mst_bridge_state))
+			goto end;
+
+		if (mst_bridge_state->connector == connector) {
+			enc = mst->mst_bridge[i]->encoder;
+			goto end;
+		}
+	}
+
+	for (i = 0; i < mst->max_streams; i++) {
+		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
+
+		if (!mst_bridge_state->connector) {
+			mst_bridge_state->connector = connector;
+			mst_bridge_state->msm_dp_panel = mst_conn->dp_panel;
+			enc = mst->mst_bridge[i]->encoder;
+			break;
+		}
+	}
+
+end:
+	if (enc)
+		drm_dbg_dp(dp_display->drm_dev, "MST connector:%d atomic best encoder:%d\n",
+			   connector->base.id, i);
+	else
+		drm_dbg_dp(dp_display->drm_dev, "MST connector:%d atomic best encoder failed\n",
+			   connector->base.id);
+
+	return enc;
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+
+	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
+}
+
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+
+	drm_connector_cleanup(connector);
+	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
+	kfree(mst_conn);
+}
+
+/* DRM MST callbacks */
+static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
+	.get_modes =    msm_dp_mst_connector_get_modes,
+	.detect_ctx =   msm_dp_mst_connector_detect,
+	.mode_valid =   msm_dp_mst_connector_mode_valid,
+	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
+	.atomic_check = msm_dp_mst_connector_atomic_check,
+};
+
+static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.destroy = dp_mst_connector_destroy,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static struct drm_connector *
+msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
+			 struct drm_dp_mst_port *port, const char *pathprop)
+{
+	struct msm_dp_mst *dp_mst;
+	struct drm_device *dev;
+	struct msm_dp *dp_display;
+	struct msm_dp_mst_connector *mst_conn;
+	struct drm_connector *connector;
+	int rc, i;
+
+	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
+
+	dp_display = dp_mst->msm_dp;
+	dev = dp_display->drm_dev;
+
+	mst_conn = kzalloc_obj(*mst_conn);
+
+	if (!mst_conn)
+		return NULL;
+
+	drm_modeset_lock_all(dev);
+
+	connector = &mst_conn->connector;
+	rc = drm_connector_dynamic_init(dev, connector,
+					&msm_dp_drm_mst_connector_funcs,
+					DRM_MODE_CONNECTOR_DisplayPort, NULL);
+	if (rc) {
+		kfree(mst_conn);
+		drm_modeset_unlock_all(dev);
+		return NULL;
+	}
+
+	mst_conn->dp_panel = msm_dp_display_get_panel(dp_display);
+	if (!mst_conn->dp_panel) {
+		DRM_ERROR("failed to get dp_panel for connector\n");
+		kfree(mst_conn);
+		drm_modeset_unlock_all(dev);
+		return NULL;
+	}
+
+	mst_conn->dp_panel->connector = connector;
+	mst_conn->dp_mst = dp_mst;
+
+	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
+
+	if (connector->funcs->reset)
+		connector->funcs->reset(connector);
+
+	/* add all encoders as possible encoders */
+	for (i = 0; i < dp_mst->max_streams; i++) {
+		rc = drm_connector_attach_encoder(connector, dp_mst->mst_bridge[i]->encoder);
+
+		if (rc) {
+			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
+			kfree(mst_conn);
+			drm_modeset_unlock_all(dev);
+			return NULL;
+		}
+	}
+
+	mst_conn->mst_port = port;
+	drm_dp_mst_get_port_malloc(mst_conn->mst_port);
+
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.path_property, 0);
+	drm_object_attach_property(&connector->base,
+				   dev->mode_config.tile_property, 0);
+	drm_connector_set_path_property(connector, pathprop);
+	drm_modeset_unlock_all(dev);
+
+	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
+
+	return connector;
+}
+
+static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
+	.add_connector = msm_dp_mst_add_connector,
+};
+
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
 {
 	struct drm_device *dev = dp_display->drm_dev;
@@ -501,6 +731,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 		return -ENOMEM;
 
 	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
+	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
 	conn_base_id = dp_display->connector->base.id;
 	msm_dp_mst->msm_dp = dp_display;
 	msm_dp_mst->max_streams = max_streams;

-- 
2.43.0


