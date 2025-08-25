Return-Path: <linux-arm-msm+bounces-70688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3CB3433C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14602189DD96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E642FD7A8;
	Mon, 25 Aug 2025 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YgalJd0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962382FAC06
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131462; cv=none; b=m0xxPm7GtaGpFclovxPLl2HTU3S1bhJuEPC6DXxCxXvGjU/iHOJZLZBqvruRlhkn6/OBSMIdKRrKrroGEhOCmbiggBT7c+9O12mxO8QtrBSEsmLqmiwmvp5WGeaaj0IV7jPc8Ri6sLrfl8zI/5pRUUmL+JXc2DtPXjKYFCs8CZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131462; c=relaxed/simple;
	bh=7INxLvbdAwotD1cFgbHypSZRRIPzoZucy0ELHCfSkgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5Pvwyu97iQB+kzgDULphjFha6pbhr+IDOUxIt3lMVpzGhKE6ph5zNFW+LlnKGnqKokKU5eWT1a4EdBkLEHn4ur+cktOqKn/qM4yi9hHiKHV8NcAGnif2pKvnMOkL9kGXDdVNrOZn1NWg5DLJNUWSJ6oAwfr/AF15Y2sy01GCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YgalJd0x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8TCKd000483
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wrKjdpoxycp4zwQBuyFtLrpN7EB/eov61YjzQV3qsaY=; b=YgalJd0xo2V2c+CZ
	Tn8HjV3KRBF6crBV2LkayDXvEjzV52RQvwNsgikQ5S9XvztHq9nQg9YkOoW5Vp/3
	bRzZ8wd0U7VirlN9MREXCllkdRL5D8MguhhFjnUYOfL/GeIGRD1ZZn7uynVwFBUT
	/86a/vnAcS1IOYCFvE/IZRH1MtHk2GE+KWwHJDm3vpnRYZvHCCgNx0X+WoIR7lNi
	3jXhO0RKEEz2EW+XO01lzMplxBija9itq+8njVtzLoUCTnraq5RIP7JL2lCH1R26
	y+bVYhYz5YAKghH9EJSUdybC4OgYaHYb8Dw2epSSp0EcrO0+bFZ0+FLQRFcc0omT
	T0C6qA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc57fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-771e331f0fcso848027b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131458; x=1756736258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrKjdpoxycp4zwQBuyFtLrpN7EB/eov61YjzQV3qsaY=;
        b=Asab+F0pIBrBzNA+kAbKtZ8w24t6WXZFCuAXrqIDasPrSyYX8vQJpd6WdBmH5jjDCN
         GxfEx7DhGCJpSr67Z0exJdv+g5yjvNs593YN9hMjPJNuqGGgALGaX0Y6C9KkNAlS+G5f
         SsEgqMsWtcuyWRvpDBToXJHvIJQzkjyixxZbe3dcEe565/hJjRqVA9YH6kAhYIzK3HKH
         HSepTzG8E2nckWrKc66ysjHp7LYLs00n8ZtbB/Bf8cARrpgfJt/LxCcdu/GdTG98a9p7
         6hsaq4qzbqUbzQwdOuUPjGnfX8VaY0ne1CFQiuQTt5Q8RqV3j5Bb6F7ClpDEj+BDz0iq
         H7hw==
X-Gm-Message-State: AOJu0YwXvjc5ObG/sMl+SzeMUPHsP6sKmu+LYHxMSMnK5Ch3sLMyjBEc
	0Chquj8RAw4trH8DWEsi4nSCBvJyZbX3yp6piutHG2ranLagbyTngArFQDfpmD503iEZ56aAh3K
	LmpS11flnwFX413oqKa4x4Kqm4GgSsl2lFPlq5YFHYNmwNNwXvlkMm/BNKB8jGgMTF0c0
X-Gm-Gg: ASbGncvX9ABzBUdb0H/YfEjlvaKzOpnUzJuQKLdN1aI8nvG61J+q2VYm+5aEqYiptIa
	buXBBVH7qidxelWZlIZPAzdLU4WUZGnYUJ4uXULn2JMOZwKZuJrJZ4gK6demFx2qh8br/Ym20UP
	hUzItkP1zavapx5ob31xkJmR5lZNrKpY8nlpOcrL8zmws4DxSo9medrILjUhPY56VAgxzU4NJGo
	2++ef+wxRieBaXgTQ2QfbeICm1d22id4ibVBkq8UhzhRwLTIVNqT+keZVLZo0qcihtcd5aige57
	UTZIPw1rOcvmUr0oPGisg1Vlgk97qAXsSuyOT0TaRBDj/pxI9Y91WfVTP0C4Qcvc6ybDshM=
X-Received: by 2002:a05:6a00:3912:b0:748:e5a0:aa77 with SMTP id d2e1a72fcca58-7702f9f153fmr18042110b3a.13.1756131458052;
        Mon, 25 Aug 2025 07:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoeoIYD7IX4d2D6LwWN4xg7TGBlsCBJRgR2BV3sGR9tz7vWmXqFytzXB5A1yuns22KYfx06g==
X-Received: by 2002:a05:6a00:3912:b0:748:e5a0:aa77 with SMTP id d2e1a72fcca58-7702f9f153fmr18042070b3a.13.1756131457522;
        Mon, 25 Aug 2025 07:17:37 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:53 +0800
Subject: [PATCH v3 07/38] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=4541;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=laPtcJI1sC3fX2ycQzzsK05nYl2YDFvhgopjq1iL0Jg=;
 b=u/fLY+q++RSsxq/mnLG9orc/hcrk3nh6rXINegH8Oo5ZOJGMugsoi7pjWq0MvAkr2r9zpSHFB
 ROXDbGf5voYCQYZQq5uqi8gsO2eSShoJ1IFNK38zr9hhYhVYVuAtZI5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5DrIXiC1fgt1
 XWgqaz0S0bctYDF82nU9qsUbYGJfPHyYJReXsPma3MUAEOYej6kcbQgghr45ldC46lZnNIEWmGD
 TbBnOlOwCLrlC7TRhzJ+5hE+kp7egT8P7RXH8af1WkgV5IVM2bYwIiSxRHEuTsHOcAbe8V9HABf
 +En5NUbJi8uy6ahMjA12TlpRRCr4OLFM6xBEc20P3YMrG9l5DoRmBkc+mK6ALKCMc9IeGBx7OlW
 n7Gwm2gAlrNsi9NVkNvcbYbp43mdRoasu7Wy81ZM4yrkjNSPE/d9Gwdus0uPNnfNsFQZCN1Kh2n
 PKEz9Pdk20pKmWgwBHLkiKx7pAnt2liuG36viIuribhQ5ugG3qwj/BaZl/tNlttIFwqKclcbLM5
 FtGmZVQE
X-Proofpoint-ORIG-GUID: HpMEdZR6nfaEdY9O1P8YPQWk9_tT5mJt
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac7083 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=s_Xww9EJd3sp7u0t16cA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HpMEdZR6nfaEdY9O1P8YPQWk9_tT5mJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Currently, the dp_ctrl stream APIs operate on their own dp_panel
which is cached inside the dp_ctrl's private struct. However with MST,
the cached panel represents the fixed link and not the sinks which
are hotplugged. Allow the stream related APIs to work on the panel
which is passed to them rather than the cached one. For SST cases,
this shall continue to use the cached dp_panel.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bfb639c1ebd33f1103c5b68dfb40701738fa267..261907446135904a9e479f18051974f5fea88ef1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -469,13 +469,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *msm_dp_panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, msm_dp_panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -2497,7 +2498,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2510,9 +2511,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2544,14 +2545,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	msm_dp_setup_peripheral_flush(ctrl);
 	msm_dp_ctrl_config_ctrl_link(ctrl);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 93747c0a9b3f049bc877f347f05d42b66ad0dddf..78406c757eccf95e82f1a9d4437ebdbbc4f8ea46 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,7 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4c74eb2915fd620868f658ccafc32030b1c208c6..d07bb40f848e0e13a0fa32aa70ffb1621edca159 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -720,7 +720,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 

-- 
2.34.1


