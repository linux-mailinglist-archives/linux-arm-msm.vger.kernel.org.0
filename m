Return-Path: <linux-arm-msm+bounces-70692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE1B34371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35FD95E0BDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCF22FB610;
	Mon, 25 Aug 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0JUGXEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C12FE59B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131483; cv=none; b=TZdNmgrC1KCo69zu0rGwfzxaMJYozScZtVGEnS8RV1LFFVzFPcSm+m0F61hbQ8enpOLKT3U3Zqf76OaCJ5peTiZQIMdv18EyxhLSdEoyQbQ2uMOYfpSvsH6fWoSB51sG/HhZv3ipNAFMlVSyeSbu8p9E+R4ah9TrMpn3IOWQ8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131483; c=relaxed/simple;
	bh=yO4TP9bTTSUkOc3o9OOvQDjpv1a0kNNORavwEwWbgcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxEkew4K6VvSgc3cejLiI+BNQC2GDY56zHXUvN/BBhk3y9GXZlSfXA2E79pSGJKbKBKAUSIz6DS+b3jtMBnUQHzqJGLwej7iXUm5II3rWlO9dv7rIvnL+WcSXffLkMxQVq6mEOdfH+Sx91vGaNZh9wy4y35++gWkrJOqp+PL3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0JUGXEJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8GAli006427
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	huRxjuGSYoNfgxEXLoAk2rOpoM2exNn/wvkUX2Zgx7o=; b=I0JUGXEJpQRR8ehU
	vKNTgl4YpCdca2oUs9JoldUj/Uj0KF4HyBjxQcM8CEsDG78N8EMbfV2Ykl+vgw9B
	Uvs0t3larPvHrtzAGAonngGKDnmuz4lV2BYGEQXQo5U/WTQN0uiRVHnnYYLUYWO/
	BEa3s2zORQ0H/6B1/yogatS1JXwwWwAJJQX7V+/pdRuME50YB7E7hhxGFauIMoHv
	VWU0mk9BGNMG0S9b+vtMvldIV9zb226vT85kefbRwXdLP0EkJ/K4EG/yfOJvLnIq
	NzD2ShE0dEs1kQ1Twzsyr44FplQCVRpdO3WCKVnW4jWZ+LEZaI+Rk6Y8cuwH7EBJ
	Zk55/w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so4623033b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131479; x=1756736279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huRxjuGSYoNfgxEXLoAk2rOpoM2exNn/wvkUX2Zgx7o=;
        b=HMkM9m82nmz1PhzYRoDiWMa/jDFYL5bJkZdXoQU6DrsGt/OdIxeWPMOAi2dq4ZGUFY
         k4fGKEqCq5xLRrt+y5bIa8BjdGuEJMGAtOvDG5UhUa5+hLLGplNhqDDNbCvoBxjGANyQ
         eoNIqjIPclgfN7yLz853Gdg61smEbP4gV+vEUQJvnmYPsZMrhhB4bxc8QYa4CFGqFCwq
         6as28OlP/8ylCEFENgy8ra8aWn5TnF3j4cZNLZFWlFQY+y4Gi/AWuH1tIKhWJB+6Ypfz
         S0/MGe7UoXv19ydioEfInYTPUIAYhXXJFhit/X5aHWAq9SD0qPl2Dh+wKmjszj5CCBxM
         fm2Q==
X-Gm-Message-State: AOJu0Ywz58fEYNiuKNPShrl6FBh0F1trX7Cf6TYNtr6JxmI+lvEpHtGQ
	kQ/nL3i7sxaEfzIR+2tcIsNon/7tJoSLTOxV3UOvtep+XrFPE1HyBmnWcyVVejYdUSFAPhylzot
	tOkVL6aEpO6b7W8rxn9VI1ot6Bc5kJo2q9pC+/xgNlaLx+Iq/qYSHNUyEyFY855eGQbqv
X-Gm-Gg: ASbGnct01UwC0+U5NsyXFZo+WRDtDWUnKgS5ouEv9pSpqRxW2AymvhwW+qiSit5pm9i
	bYu5uN67vXL7eKEtQZZ6KhsCI2nPL3BrFLeYeLBDzNJWPq9VYutY7MEzlqLhBW7P+AOLe54wwQR
	dO2Og3FK6kxqTthGWTWy8xpQ1U/h7PKT6CTT77+Uqhhd3aJW1pjo6MhS/ur1KYfCaY6BMIN1MJS
	6nbF7bRe2mNcDeuzHC+3yDO8a1Ab8M4qNz2AjWTr8hQdAeLLm5WALHp96joRqtU3/ncvPhrMaAp
	iLvsLmW18DHBKbPoxXvXgjpZMPhFlA7BDuwHwe1AzBa2/Zh/5Ukyo9I2pPjiOn0k/wJkjfc=
X-Received: by 2002:a05:6a00:2d0c:b0:771:f393:ceb3 with SMTP id d2e1a72fcca58-771f3a31abcmr437966b3a.16.1756131479107;
        Mon, 25 Aug 2025 07:17:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJsOmXNhwX63on0xU1DsYN40lgyzw/dL6vS5YmZaJ0hGEF583+eIJJtoP+AY+QPELB5iH5BA==
X-Received: by 2002:a05:6a00:2d0c:b0:771:f393:ceb3 with SMTP id d2e1a72fcca58-771f3a31abcmr437920b3a.16.1756131478463;
        Mon, 25 Aug 2025 07:17:58 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:58 +0800
Subject: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=3160;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jNotEQRdopUDHm8VHZLe0hqvZPdErfXQINvaMylJ1eg=;
 b=rRhkZu50pV6fu1EpF+zr7aOXaRqpdTaOjqvGJlU98YLkjtreL9dZYLPEkr16xi3E02djQZTDJ
 MLevMFHugj0CA8wGPhfesX1gt+mrDMhAMCPiBR97aVU4iuzv0vLqix7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac7098 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=H3QdGSpFPA7PV-mxWtkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/A3OTvyw2EhK
 FJbBJg28JFAYjTXiNcg1nTJVYIHZ4kTgz2xn6jY4U0rHQnZm3KkG8BqpB8y/wSDTt0vGmHtcgRu
 vXETupzi9fQeBZ5vYDe6yJ29z08xTezbWXBcRsCiArO/5YxiOqYTc7spbGmhrClSN8lc3h57s2f
 qzcUZCmNAg9h+4cwz0xY32RgpvRXoNUVyso4lHEY2teAoI8A0q1wToGzUp1hMSA+2SIBeoOOMd2
 F/oAP8N7ssAqp/cOzRZL+ELUVk6ZixmFs+dYdsxtoUyn93Gn/JOsEDycF6AlxN7pRJ9WyDlpd1+
 mf4aHBSUxyqwh0/OvlSoTh0R3kaWHh6i5IHdi0QTHOOQCAqQikM72OWy7yl/9NVSKHmPBt5y1Je
 q1s6vA0V
X-Proofpoint-GUID: bWXJGszqomfPTy0q1AX99PNRxodXtHUd
X-Proofpoint-ORIG-GUID: bWXJGszqomfPTy0q1AX99PNRxodXtHUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce the `mst_streams` field in each DP controller descriptor to
specify the number of supported MST streams. Most platforms support 2 or
4 MST streams, while platforms without MST support default to a single
stream (`DEFAULT_STREAM_COUNT = 1`).

This change also accounts for platforms with asymmetric stream support,
e.g., DP0 supporting 4 streams and DP1 supporting 2.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
 MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
 
 #define HPD_STRING_SIZE 30
+#define DEFAULT_STREAM_COUNT 1
 
 enum {
 	ISR_DISCONNECTED,
@@ -52,6 +53,7 @@ struct msm_dp_display_private {
 	bool core_initialized;
 	bool phy_initialized;
 	bool audio_supported;
+	bool mst_supported;
 
 	struct drm_device *drm_dev;
 
@@ -84,12 +86,15 @@ struct msm_dp_display_private {
 
 	void __iomem *p0_base;
 	size_t p0_len;
+
+	int max_stream;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	bool wide_bus_supported;
+	int mst_streams;
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
@@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->max_stream;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 	dp->hpd_isr_status = 0;
+	dp->max_stream = DEFAULT_STREAM_COUNT;
+	dp->mst_supported = FALSE;
+
+	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
+		dp->max_stream = desc->mst_streams;
+		dp->mst_supported = TRUE;
+	}
 
 	rc = msm_dp_display_get_io(dp);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -29,6 +29,7 @@ struct msm_dp {
 	bool psr_supported;
 };
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);

-- 
2.34.1


