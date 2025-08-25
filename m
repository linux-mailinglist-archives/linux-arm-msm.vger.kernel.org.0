Return-Path: <linux-arm-msm+bounces-70707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5540B34399
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2AD5E74B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D297302775;
	Mon, 25 Aug 2025 14:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLfLV2Q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DED301494
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131542; cv=none; b=ZbhmmeofkP/8U850VmXUk8oHtpJug4Mdr2bH/Ar6k4XslRHW8SiGec30apqddxZwweeBQ3UJ0pB3zPh5osBPoZIhYmgeqwv8FleH1cqWOelXJ6Aww+djkHajfbbom/8eRVjX9/vWdBc0ss7QkMOw2pUgI775Dk29JCizA/zpuqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131542; c=relaxed/simple;
	bh=09dlpQFv1ezXWuJr098HED8/TB54QMuuNRmjzT3slmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlXbEOh4TZL4t95GS3Cu94A/K3Y3SFDf3lTCP6DU2jS8YoDD7gLhwvpC5J/Lj9zcxR1krqSbyO9gqADid2tvtvzm2t2VNzFDbpNvmMBBLFCO1c5gsyklJEfjFuh3HM61vXfkWeWMLooHgDolbkzO+UL7lwWSAGCN90GEpx/v0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLfLV2Q7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PDNrgx018862
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=; b=hLfLV2Q7e/tX9PDH
	8tY9n7qGH4XqYK9E8CLSsndvGf9zENYtnZzQY/sH8GrYKCo1RN0M0r7PKNvOj6iq
	lQED+8goMLEL9awCENLCbdqJRXyjOkHAu3yk202ibX9y4GrqEBc9vZykHlS3lTbO
	xIxlqL6tqynqZZCQzGjkLmp0ILEhw+JdRVtfIIUydoB7PDIYzwN4MRruIJqMsTIr
	/lx+1wX/d6sTa4nKAfv8pcyneW59p6uIfbvnchgDUKDX0XYUGGP4WjCVnuETVuRD
	16YQAvL5jfxIrjVnF1owZvm2Ro1WVTJ+xNgHtuXcJdb+rLqXMqKFW/qMy7VF/6dm
	m6rwKg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpneu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e60221fso8836641b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131538; x=1756736338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4em/xcDonNf4m1zVAyxC0QlLlKFxyiAEUK6Ca1lpXA=;
        b=QSRblzEvgVZT+iFn+P6k6c27copKY18ReTnYvHQCPF80bB5rPrIWFXX2ak5TVIxuHm
         iOSWjGHwqGC+3dG9wRp5kw8iVukr7cVpTkSwABqIJrlkP4Dk/VxoUyLecs6nqvjXiuB/
         F2eLYFSF44OP/GsUUFe5g5ViokHNaNIonboAZGs+O4mqktG11V2rI7bxMejM+PM1TEuZ
         rHPtHgVMTnCio20NLob4IxpcQmQ9KcxOKK6Ph9jar3xBhFrUfi1rddthVymElcp+M7PF
         RwVF6Bu2KSDC71N0sYkdnQtlnpjrMcmpivxtgiEl0VBAQVUe680kbI+60qIU5+LNjXlk
         8quA==
X-Gm-Message-State: AOJu0Ywc6Eom1usPltnsTh/HFwqJrk6eGSmllwdku/FbW1KuPTSoyR1X
	TH4fDynt111iCDlKDzojhPkBLmrBZbbPI+9buC26oXKFWJXRODSrFdmZMpd5K8TZcBP2JGSwdU4
	CM9GimAxyYSeUMBWg0InBO90lJOvmd6lgKPSc9cbgDf7HitF9rUx3mkCDXexqzUG2Xnoz
X-Gm-Gg: ASbGncsUA74zoOH1fQ4859dxXsWG4xoqJ4bYIi9iX1wWFslkAWg7xiuKkyXB1YXq2vm
	yh1JKspnu19GiBvbBMMZK69p2VKllpNOJHvQcD8IGnlIx0b+it5DzE/bSOOC1Hd7HAItJizrPr1
	O/z5mTTplAxYUveS8z0gzkNU8dlEAjf1eC6b85QXQKy4lDCWbHi5h0Wlw+xcHaS/Sa9TRMa0SMQ
	yddAmtTNItTamyO/tig3RThQdtGqdNpqyYvI0dZOZXl5Muol9W6A/peklH3EH3qjrO+Ri0eLgAO
	YwJQp7USiJU78myd4m9k2KXIJxkxR84bFcMqjiaBrn5F9JMqMBeUpmVhcLOLpBc4MKjhkWY=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7702fa048d1mr16349138b3a.9.1756131538015;
        Mon, 25 Aug 2025 07:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcONK9QkiksV2iPZcOMhRszPAf8sw61weQPpzMqGsQNFrglfJdpF3Bk+hpt3laf8w+p1QW4A==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id d2e1a72fcca58-7702fa048d1mr16349105b3a.9.1756131537494;
        Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:12 +0800
Subject: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on sink
 side
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=3420;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=5rW/DfearqD7fwWZSsWrOun0WURd1EIi5z5yGV9n+1M=;
 b=EY7yhkz4fOACWjsghjS0efOMUzJwNpOWAwybbpu4RG1f01cD4hxc0M9fMrEN+mSjA4a4SCHrw
 JVNssBx1X0eCD1oIrpidZaR33X6TqT23B7AphT/54EqCJIX9ahQgaep
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ac70d3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vCCEq3Mv4WXTdc8uXsoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ohftmxh6pwaAxuHxMal8m2UbD362Qrh3
X-Proofpoint-ORIG-GUID: Ohftmxh6pwaAxuHxMal8m2UbD362Qrh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8fZG6htZSx9w
 VWezmUwHfByyVMYuBsaITQcjZfyacSptxKPztH2u2+aF2GMj5EV7FbytzU1myMv3GARKIKCVRZQ
 IKt/JdlqjANrGqJVLm/E+AlZGsi2aH6o9OC2ViJMKhUHXyGkLP2F6lW0OqhAQWSAuHamvB+aqfr
 ELvKQs2TJJIwtmRVzdk/vm0oeKzn8lmfn1/2lNpFlGddCH6EmiWgmyoxTZV5oOT/4DA7HHCSlbJ
 7k66aIWqEo4fmCUhqxBKPsVELoHkQgWOl+pBRcEMgzOZWSkcvtu0HM+C89Lhl4Njrb9lMLrRM7S
 OzmLdLyqFReZGwTWoZ8ytoHWRC3iberdZJAdAAGV7PUQUrBd5h6M1GSIYLMhTKDpOfj0LWJuC2K
 /424MUVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

If the DP controller is capable of supporting multiple streams
then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
DPCD register to enable MST mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
+{
+	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
+	u8 old_mstm_ctrl;
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* clear sink mst state */
+	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
+	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
+
+	/* add extra delay if MST old state is on*/
+	if (old_mstm_ctrl) {
+		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
+			   clear_mstm_ctrl_timeout_us);
+		usleep_range(clear_mstm_ctrl_timeout_us,
+			     clear_mstm_ctrl_timeout_us + 1000);
+	}
+
+	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
+				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink mst enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
-	}
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 
-	if (rc)
-		goto end;
+		if (rc)
+			goto end;
+	}
 
 	msm_dp_link_process_request(dp->link);
 
@@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_init(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 	if (!dp->msm_dp_display.internal_hpd)

-- 
2.34.1


