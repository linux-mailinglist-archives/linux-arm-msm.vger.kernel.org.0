Return-Path: <linux-arm-msm+bounces-58337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9DABAFF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD696189770B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76094136A;
	Sun, 18 May 2025 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTgAYCLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB9219A8C
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567306; cv=none; b=sfeHrsX0Ec3fBPbk6ViQvdZ8oM4LIKRI2evn2Gus9KhIPukmEkQi9cWObz86XDUu7rPf7mIf+A/cpHj4FVTHKtU1RegiWHiw9SGA7IJRduI52ecqlVeTb2pySzyXX0x4f7ff90SXMPXDxRtfsRQObftS+KqIoLpZ7QNEro3DMas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567306; c=relaxed/simple;
	bh=o89jvTXWsBQe3mxYOfZNmfZPFRj+srNNnegV+rGxe20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkcC1dxGkWO/w8r3WouDreVTgW+dDFmZk1l17xAFXNLdJO+ecAcGJl+qtImq6EsLFDfQnAt0ZDIaSo9240vw3yh08NOp0n/o2qIyRcMdwNGRsORGYPfNn4EHpBHNEpEsQoRPuwLZraCZmjJs/vJej62sKtRY71sCoklpO85w+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTgAYCLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9FGKk013479
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=; b=TTgAYCLlz/kO/wwe
	Nk8QxwWduSD8FtVPhADU3xKw+PeGjNMfFAc16tNogkkv1MVi0lZeMdnGBLbhlgtW
	Za22ro4hKMkUVB53Xn4zTmRUlrQPm07/tQEpo6ukqKbLoesKz9Xt8YWcnf4C8dae
	YysG3kizyf5BQdGeeubxyc8vqRYfn86MyXDVVgqDazxU+0BRwqJ5Zj+XF8rePVo6
	zQ5y2pxjswkkah1xgPNpupC8H9jNEhBKMnuwrPJwSXpTUpxJZ6U8FRgfOFJzhddH
	ZBalYLs0om9a5ZQqu5GIyC/5KAwV9Wp2pniC6i1TB1rjULVHnjMgWIDI5FjTc+MS
	eXBLJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9tvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6f06890e2so112098236d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 04:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567303; x=1748172103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=;
        b=A5ZTgfqykRejJbrWkZyES25HuaL9Ec1Hd06XhtQjxYGiGPh4xTDlVVC0AefMBjBs33
         FIK5ICTgGfhbRpnqd1GbnK4dL3ogIjwE0mhJ20sbM55QIGuiWNvFv6FtIu2SM4j7/FSD
         Fsnmvcoa+3kzVWEmnJIcM+IjL+5lt6NbIQIphcqV69CHbjYQF0nYsKSbFoV/gl34RBGJ
         hZGLBq9/juEy/rkYGKtxqWgxLPzwxlUs3eN7i0kAgKCRTyUDO1lIHE8z4g37O5UFG1WB
         WEIiT8tfYUAkKQU0BSVor+KntdSr6C8BLdkW/23cjyWRHrCM8IocFTnM5UUV5Rkzkpwd
         9Pbg==
X-Forwarded-Encrypted: i=1; AJvYcCXEePou0XFSdSvTc5dD9B8j4omdttpLWgqL/jUIitUavoaz0OHe5ebGmY0+Rlljlz2dNPvOCga0Mtuew/ft@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RxaS74OKRmKCVZmm6Djg4/g/1ON2yXheqavxTd4jJV+n0IWx
	X0A3QECapbHFi3aNBplE181T2ViNKtJe8SDWa1NhCMg/q8dc7Z+mnGHRF2zEl59Al0Wrg/OKSXt
	Eg4aRZzoR0mphVRSrWv5/Zo9t0iR01M7XfIG8rtxx0RRJjMsp+whD7oktVVbGjmDfdPvZ
X-Gm-Gg: ASbGncsj/B9L/hXi3uid2O46SmogEf2UkqQc9Gnhqrcbrn5kLxKZhTNJSo8pJbN4S87
	ezNs4CaEu995h0lmLLO08z7COxMVs6HMZyMZtHR9rCuCO1n8xENhXSVpZmbLL9cGnp0He6k8D4t
	+kuck+2hkRoIHGttyQhn8/NVtIfP0c7XwWBxKvBYK+K4ueDQKZlmqDiXNS1vlhO6M6liKB+1cI2
	6C+Qx1W1LMczbE9ueTasgCRA5fcV7CgZjDqyLQmQL06J1fEW7/9XiRPoCQHlAvzQlGrT8kGCGV3
	uED2M/aUTuhaFuWyKaiEhNwzfReoGrzCPaP1SqUZ/FBYPZza9SmpWcDLxqlsfexrgBGnW/EAKd6
	OcFU4RDoWr8/YTR91ZBQU23PQ
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6f8b2d15198mr130437596d6.30.1747567302873;
        Sun, 18 May 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHom7w+/F5VHLvfNBFeNm/lt02SI6nyFasMUbdwz0mFjeIJfWFMkSxTZc6WbCqk9JLZN2F5sg==
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6f8b2d15198mr130437346d6.30.1747567302505;
        Sun, 18 May 2025 04:21:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:35 +0300
Subject: [PATCH v6 02/11] drm/msm/dp: read hw revision only once
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-2-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/Hs1HGodxey0UOVjoJO2Kl/jlINR9/hl6O
 1fkgwO0m2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1bqIB/0eR7M7/nrB8bKHxc+BHj/vguTWWbNuciMREsFKLdHnJ/NIus2916NlmOCHfEJPEvfVJar
 C/pV5dShhMJjpHX39OlauTv7EZQZ7UIm44O65CFA9sEC8B9JHHOhCvXlb0xlMeyPWLW8Wx66iRw
 apc6bhIUYJEHeGULbtNEjYYQosy9kByMe8om9Q5U301UhXL7T0Xs78xe803YpHUMNvPTfkNHqTe
 edgTO/2iqUEtZcKixGT8AhmZtvxHEjc0wpEUiKQDeDZ94KzhB4GvYTvJmtQAfnSOOsQEjhdSwkT
 EtlO3kZhj4hBiHirJscN9TtudorIJw5Zc0SEEnX2e/79S5Ak
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX31X/0bsna8hN
 fWVdjkVCrHvkzPaV/bCXwOLjZ2JONzZAjzgqD0c2B3Qf/be8fpHpCgpQdb8ui1ZyBfcQt4kj0bf
 bl7oxF7DsA/XB8+tAo8q6YhAgtHQI4Qu4D7RRhtk1Q6nvZFKJ4/6LHAirhNv/doYUzTZdilpBbJ
 Yz6Y4YThsN0NJoqiuOK1IdopQbsfDRnIffG8q7TXEf2JUfQiBG+j/+j6gkjWQFRP/vnySIqb2pW
 Qns9v9GPpo5ZQmNZV25W6Hc4qEFBejBYWwusfUEBQOBQFyjn5qnCdar4UFPAG8XEByz12CiPhCC
 A1OXbB8YT2105sG8zmKM3JGSPCWug3HJCB+1I6WSnGYr5Mrbrqo6dbOHpeTqH9ixDTly1mtXOiu
 1ctF0VMBaMyrmJJuwsQuWpfPxFPgRbLBJvs0k6FAfzDmNGQNVYioRuI3yuN1SUV4MbJ8uKqB
X-Proofpoint-ORIG-GUID: wH2o_KWPOOU_S1OdCv4YY_ISPGizkAVr
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829c2c8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=pC6Btxr2GG0oDPZGBtIA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wH2o_KWPOOU_S1OdCv4YY_ISPGizkAVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5


