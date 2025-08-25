Return-Path: <linux-arm-msm+bounces-70711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00DB3438F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BF5E189AFB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB8730499A;
	Mon, 25 Aug 2025 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NV+TkBEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27936304993
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131560; cv=none; b=Up+rgafbsAdH+1MZZ5YC6Vf5iTsPLSRX+ycbWid5QSV+YUoxlT0NyAc8hZAChPRrLJs7fA0Ww+z2ZdKJVjp0TfphEP5Qxpif76Lglwzok7EsE2ddKhmEKoc8MYX0fu5h5Ezy7Ey8lDnqTRztfVnJo/eho2DROtbdJNjQ+7qMf3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131560; c=relaxed/simple;
	bh=R8Qvt/1wIhnHTzuCi/8fKBsW0ElQJI2MDV8Upw6VQV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXYhTC5RlEdadlcKQoDD1dkCYI2pLR65BvPP1lxxombQCFX9qjydwaO/OPKtLNjJpiCG1i7oawD/VyFTEXB57SxAWCj6n5o0lwp6eNXttdvHpeK048Zmo1f6gJgSePG7tCSmnLTGfxUDhHYGPy5qXXqfaEjC/KlPyqZRhDt8iGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NV+TkBEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P84vmf030210
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WJ4BlqLXPp7F2iwhQpe21FP0uxGj+P4OnJHO5ViY/k=; b=NV+TkBEXIhwARjye
	oucYPGMaYM+NKtm7NvSq5/+GJhLsnnrzFv+fPjIpwAeq7oVS369WSDQVO7/+rjsq
	POaBoiatuopbER8sgxH89cjyxxaz2uPsHuoCVyRuVc1TO+smVaDHrNH1CUjwKAP+
	HO5OZ214KzbI07fv/YSYQnYDPMXT8WmvSSdZ/i42JgABth9dMReS+GqclieJOW6v
	ww/fQeS+pa35g8d4fRvMgQKRx0fkL0XbLAxHAnYB/nRCv1puywlwV6fLvX3ZHGfP
	J0lRWQ+RgUks5VXdvpEO6P5fVfX9enPP2wVBJKYultE9PsgWdfvshcnIRrjGt5A+
	ea2QUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b49da0156bdso2390005a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131555; x=1756736355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WJ4BlqLXPp7F2iwhQpe21FP0uxGj+P4OnJHO5ViY/k=;
        b=DpgCasjIqV23OnklfnEhjowYW8QXkKLQWSXEVu2zfOQv5o2SnuN+20jM5ghJk3Gka7
         fNYdCEbINRFkOJEDMtHa2fDPcs9aVhaUE6YZyDFHd9LaaW1AJXmtqOBtCe9K26PGaV+q
         EWfBd91Wwgkhu6KUK2rnBM7VzjAqkJwPIKtlumlJhryBxrxnzUjthfQpk/DVlnrgWXts
         k0NeDpUz03Ah0IOALyzNfrAlNym6j0kiKwkyASY6/vVpnbUN6GTipo2ORgjczCsh2hxr
         EmseUeEApbL9tF/Grz9CyhwcGbn/pnCgLyoZH8AM947bj8X7gyx291QeJfeyfd2ngj08
         wGbg==
X-Gm-Message-State: AOJu0YyyVCA2SsD3thMtxQGTecvORzkoyBh4FW1kZefYu5dit8sGgitJ
	w58+zKlDrcEBi9/xtJMwsyYKWif28WF5oZ0gOc2IlAlGUe8LiVrMGeJQGpiqVqNZRIjVYN44xwt
	ckNzfaHYy1YfCgsgXAl1Bzf4xXa96Hibz9GKZm52XsJWMUOeYEoz2M3zEtgQnq/DkfJVh
X-Gm-Gg: ASbGncvSNwFmI5JR3Nzg0r1Vu6lTwFh1rHcl3N1dqcwrvFotkikbgVORIHLZK3VR4oJ
	Qm74NE+lGZTd8hx9zFvVQ5RsPuSOu11LMkqR2ZfA1MawFtqR+n9Ly/Rz0WHVH6fwvKi3jr+2AhE
	j69qZjnsS5y7817fyVer1uxXK1zao/b9hT1Izn+Jbn5wfSEl427J9FpsXbXmXUpdWy4PcBYcxV2
	WLoWXR3MkbHrQ/27OT/Z/cd0ZUUTOplEgIvnWrwV53HDVZzteAB2KUFbrx7KSTdl1z7IlMKg5lz
	Ue7LT5tO9Kln8SGBl5zrivPCPclPKoD5xwINcJ0//Z6bw49Ecx631xbxKe9+Mf1u2hh3EMc=
X-Received: by 2002:a05:6a20:7488:b0:240:aa15:70ac with SMTP id adf61e73a8af0-24340b0172amr18371902637.16.1756131555211;
        Mon, 25 Aug 2025 07:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeU+02j+wQcl3rkc3hXYmvc8xoNJ5oG4NmhwiMVHRZETCnc9AMkDvpWH4MWsaRWEGaSs9ydw==
X-Received: by 2002:a05:6a20:7488:b0:240:aa15:70ac with SMTP id adf61e73a8af0-24340b0172amr18371820637.16.1756131554354;
        Mon, 25 Aug 2025 07:19:14 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:14 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:16 +0800
Subject: [PATCH v3 30/38] drm/msm/dp: add connector abstraction for DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=14405;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=0ID0mzRZnirHoL1z1XjzjUDSJWJKD0skVWe5kdwqv8A=;
 b=iZys9aqSRO+Yu3Ep4CrWXDrduE5IQlMLAq2U+8XcSqOy68GkCRBcwc3TThbPC+fPmQWqhkug8
 5U75UyqgbT3DfDeBm7LK2lF93GEsLiwb4I4n/PmPAAH4wBGHE8Tsb4t
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX2qWsn4Rj/e57
 WlecNrRU49FFnh9S+o1TJ4EXzpBp1K5mgeAOrnIrzIhUJb4qC72lXF1SCzQAFbucwhiOSrQXK9a
 k8c/KTNPmg/mWAGqeFAafsBgwtIKQRLzrs/biNuHA9gjQ03bRiy7JwBUetB3ezSvWm7w060rwU9
 p42OU6mnWHKO++vAzQolcsP1EAMhJ5hZMQImmkDGLX0DMvlmVaCdgz0+3kK3+Nq3hJB44Optyfc
 re8GJEK+/Y5srPUi7efDuby+NUD0lXsguh8Rdkp/HsiuWbUetSe+lTtnyPZCTmQ2Z0pY7UhtPSn
 tgd6jGuCH4JYWGJNmPxLO9Yh18/LMdTw+mWVG9Xj6TpypgiE//gMhwd0tLBqQHskHU4+B2Y118R
 i4catUzw
X-Proofpoint-ORIG-GUID: V7nvtlBUD2Sg5x-IjzF_WYXaweDfVu5j
X-Proofpoint-GUID: V7nvtlBUD2Sg5x-IjzF_WYXaweDfVu5j
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70e4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XtSBHPrO6b0zdWIi_jQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add connector abstraction for the DP MST. Each MST encoder
is connected through a DRM bridge to a MST connector and each
MST connector has a DP panel abstraction attached to it.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 391 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
 2 files changed, 393 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 73de29136801ef5f45e0b2d09280fe113021b68c..b4f640134af544c77ab262d2cbe0b67e1e2e1b3a 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -25,6 +25,8 @@
  * OF THIS SOFTWARE.
  */
 
+#include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include "dp_mst_drm.h"
 
 #define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
@@ -525,7 +527,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
 
 	dev = dp_display->drm_dev;
 	bridge->display = dp_display;
-	bridge->base.funcs = &msm_dp_mst_bridge_ops;
 	bridge->base.encoder = encoder;
 	bridge->base.type = dp_display->connector_type;
 	bridge->base.ops = DRM_BRIDGE_OP_MODES;
@@ -554,3 +555,391 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
 end:
 	return rc;
 }
+
+static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
+								struct msm_dp_mst_bridge *bridge)
+{
+	struct drm_device *dev = bridge->base.dev;
+	struct drm_private_state *obj_state = drm_atomic_get_private_obj_state(st, &bridge->obj);
+
+	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
+
+	return to_msm_dp_mst_bridge_state_priv(obj_state);
+}
+
+/* DP MST Connector OPs */
+static int
+msm_dp_mst_connector_detect(struct drm_connector *connector,
+			    struct drm_modeset_acquire_ctx *ctx,
+			    bool force)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	enum drm_connector_status status = connector_status_disconnected;
+
+	if (drm_connector_is_unregistered(&mst_conn->connector))
+		return status;
+
+	if (dp_display->link_ready && dp_display->mst_active)
+		status = drm_dp_mst_detect_port(connector,
+						ctx, &mst->mst_mgr, mst_conn->mst_port);
+
+	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);
+
+	return status;
+}
+
+static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	const struct drm_edid *drm_edid;
+
+	if (drm_connector_is_unregistered(&mst_conn->connector))
+		return drm_edid_connector_update(connector, NULL);
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
+	struct msm_dp *dp_display;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_panel *dp_panel;
+	struct msm_dp_mst *mst;
+	struct msm_dp_mst_bridge_state *mst_bridge_state;
+	u16 full_pbn, required_pbn;
+	int i, active_enc_cnt = 0;
+
+	if (drm_connector_is_unregistered(connector))
+		return 0;
+
+	mst_conn = to_msm_dp_mst_connector(connector);
+	dp_display = mst_conn->msm_dp;
+	mst = dp_display->msm_dp_mst;
+	mst_port = mst_conn->mst_port;
+	dp_panel = mst_conn->dp_panel;
+
+	if (!dp_panel || !mst_port)
+		return MODE_ERROR;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		mst_bridge_state = to_msm_dp_mst_bridge_state(mst->mst_bridge[i]);
+		if (mst_bridge_state->connector &&
+		    mst_bridge_state->connector != connector)
+			active_enc_cnt++;
+	}
+
+	if (active_enc_cnt < DP_STREAM_MAX)
+		full_pbn = mst_port->full_pbn;
+	else {
+		DRM_ERROR("all MST streams are active\n");
+		return MODE_BAD;
+	}
+
+	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
+
+	if (required_pbn > full_pbn) {
+		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported. pbn %d vs %d\n",
+			   mode->name, required_pbn, full_pbn);
+		return MODE_BAD;
+	}
+
+	return msm_dp_display_mode_valid(dp_display, &dp_panel->connector->display_info, mode);
+}
+
+static struct drm_encoder *
+msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
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
+		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
+			   connector->base.id, i);
+	else
+		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
+			   connector->base.id);
+
+	return enc;
+}
+
+static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	int rc = 0, slots;
+	struct drm_connector_state *old_conn_state;
+	struct drm_connector_state *new_conn_state;
+	struct drm_crtc *old_crtc;
+	struct drm_crtc_state *crtc_state;
+	struct msm_dp_mst_bridge *bridge;
+	struct msm_dp_mst_bridge_state *mst_bridge_state;
+	struct drm_bridge *drm_bridge;
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
+	struct msm_dp *dp_display = mst_conn->msm_dp;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct drm_dp_mst_atomic_payload *payload;
+	struct drm_dp_mst_topology_state *mst_state;
+
+	if (!state)
+		return rc;
+
+	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!new_conn_state)
+		return rc;
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!old_conn_state)
+		goto end;
+
+	old_crtc = old_conn_state->crtc;
+	if (!old_crtc)
+		goto end;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
+
+	/* attempt to release vcpi slots on a modeset change for crtc state */
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		if (WARN_ON(!old_conn_state->best_encoder)) {
+			rc = -EINVAL;
+			goto end;
+		}
+
+		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
+		if (WARN_ON(!drm_bridge)) {
+			rc = -EINVAL;
+			goto end;
+		}
+		bridge = to_msm_dp_mst_bridge(drm_bridge);
+
+		mst_bridge_state = msm_dp_mst_br_priv_state(state, bridge);
+
+		mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
+	
+		payload = drm_atomic_get_mst_payload_state(mst_state, mst_conn->mst_port);
+
+		slots = payload->time_slots;
+		if (slots > 0) {
+			rc = drm_dp_atomic_release_time_slots(state,
+							      &mst->mst_mgr,
+							      mst_conn->mst_port);
+			if (rc) {
+				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
+				goto end;
+			}
+		}
+
+		if (!new_conn_state->crtc) {
+			/* for cases where crtc is not disabled the slots are not
+			 * freed by drm_dp_atomic_release_time_slots. this results
+			 * in subsequent atomic_check failing since internal slots
+			 * were freed but not the DP MST mgr's
+			 */
+			mst_bridge_state->num_slots = 0;
+			mst_bridge_state->connector = NULL;
+			mst_bridge_state->msm_dp_panel = NULL;
+
+			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
+		}
+	}
+
+end:
+	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
+		   connector->base.id, rc);
+	return rc;
+}
+
+static void dp_mst_connector_destroy(struct drm_connector *connector)
+{
+	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
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
+	mst_conn = kzalloc(sizeof(*mst_conn), GFP_KERNEL);
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
+	mst_conn->msm_dp = dp_display;
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
+
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
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
+{
+	struct drm_device *dev;
+	int conn_base_id = 0;
+	int ret;
+	struct msm_dp_mst *msm_dp_mst;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid params\n");
+		return 0;
+	}
+
+	dev = dp_display->drm_dev;
+
+	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
+	if (!msm_dp_mst)
+		return -ENOMEM;
+
+	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
+	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
+	conn_base_id = dp_display->connector->base.id;
+	msm_dp_mst->msm_dp = dp_display;
+	msm_dp_mst->max_streams = max_streams;
+
+	for (int i = 0; i < DP_STREAM_MAX; i++) {
+		msm_dp_mst->mst_bridge[i] = devm_drm_bridge_alloc(dev->dev,
+						struct msm_dp_mst_bridge, base,
+						&msm_dp_mst_bridge_ops);
+	}
+
+	msm_dp_mst->dp_aux = drm_aux;
+
+	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
+					   drm_aux,
+					   MAX_DPCD_TRANSACTION_BYTES,
+					   max_streams,
+					   conn_base_id);
+	if (ret) {
+		DRM_ERROR("DP DRM MST topology manager init failed\n");
+		return ret;
+	}
+
+	dp_display->msm_dp_mst = msm_dp_mst;
+
+	mutex_init(&msm_dp_mst->mst_lock);
+
+	drm_dbg_dp(dp_display->drm_dev, "DP DRM MST topology manager init completed\n");
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index d75731ca2e5870377026e8ad1057bdcc5f0d4c78..1484fabd92ad0075eac5369aac8ca462acbd3eda 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -70,6 +70,7 @@ struct msm_dp_mst {
 	struct drm_dp_mst_topology_mgr mst_mgr;
 	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
 	struct msm_dp *msm_dp;
+	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
 	struct mutex mst_lock;
 };
@@ -83,4 +84,6 @@ struct msm_dp_mst_connector {
 
 int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 
+int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1


