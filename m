Return-Path: <linux-arm-msm+bounces-58343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C43ABB004
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8337A17783E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9304D21D3EF;
	Sun, 18 May 2025 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUG4CkWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB8219A7A
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567320; cv=none; b=GFlskI+NIY7nnbh2stZ0XCnXUWYZTIIRHPEPk9P205l2A8WN/LaPON0uifT9M50WK+RHlHkqFwzSkBVOmbH1nPLGzDvVgim0yzo48UNKjCMMA5Up+kEzM0H7mssFhXjB/H2XQwH5l5JqHYnS8I2taN53NubASkxcgLV3Xl2X5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567320; c=relaxed/simple;
	bh=d1IVWU8pXHo8IFEIlW/NLyODZmq5amM4Oy5kL8uRqJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9pGKRJnZO8LUFy3P42wMaWwHwOfHiAn4zKHjWAsH6xY6Z5OuCBd2CWDDphWaUQFOHL8H1vm3jjqqlpFIZa8vIIQiAvGzThUQpPebzngocLL8AIJkrYHCJsAeUxakcqe3o2HJYzPYzLaj3O+D+o4PPqsuaeqHiHwYXSgqVD5+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUG4CkWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IB3qmt007669
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qXHlEFNJZ2WBlmaXWVmmmhrjpF+pfub8DLPwnnN/TOg=; b=FUG4CkWzm6LR8Bn/
	sVS6AfnQGYHmygmFe02lAOYJ98uz0rNxOzk+QFlK/JbD84R1iz8wjs6GSZT8DoFR
	oqH/XlhOHm0QAO+yoXafAkqd7Wgzdgced4osh4iemAvEXEw9MFA79DSNCSXQMJav
	98f8xTS1Gv2cGXdr4bGwthgN1/E/EkD8BeVecg0DYJ8gv9YE2MnzeBifsY3Y1Ix5
	eSJa3QTet+wT0isZhFfb6oGmm/uoFgfbPBkEBXxbLLfRb7sQzwBokpR/i340NbnN
	NpaNjMzHyLAM/BHRbe0wosGGg60hc3AwNQG8NIu+/pgy1gbbgD+R6bZtKahXtnTr
	YN0uIg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9twx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 11:21:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d47383f3so4716386d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 04:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567314; x=1748172114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXHlEFNJZ2WBlmaXWVmmmhrjpF+pfub8DLPwnnN/TOg=;
        b=sr6dw/MRCUVB788cjOdob7dIPralCUifthgJ4F4zZeJtK6sEosq6UeRfsGUjNBkryy
         7BJSpB8luLvFAOX7nETmReOMnqKwIrkTNmBqVDEtgcyy57i4S5qHuEBWcaMLxUgfFMza
         eSX4qJhjYsWfLYq7EfmPwF46J4ASiDKmiJp5RZQc6Y9qxO1MzDjCLiOroHluuhkg5T7Q
         wiwJSFdfn7HGqSn4FAst6nwHW3rMLodvPVZ+KhuQ+uFHZVqS1sojTgalzt/mXCLZu/x9
         +OR/h3eJq+T357HKnfVIbGl5eO9DRHxgw12gdA/cSWaLpYS4IC86y7IY7zfN8mpigWue
         D2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEw9rAxigCOUzzlFuO7S3Y1sNqtp467bqjYKfVRg5u94oIREY2jMZOiF62Cn4WeeFTEaar1RnVp7P/qhNR@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyYmH4Z2pg1VWSwxqtPlXNhxDXhbuGFggoU47bu+Q+MYyh3N7
	yD9+sw2FCcMLDeEJZYTpVs4DAhBKE0sEBAOaRRnm2v8KaRojChnnUiruetYcKoTxnvnifqGGS0b
	l3U6BamskCvZ9H4I9gg/MttYhQVnfrJSGzCXtvhIPBZ2o3eZv9+F1+p3qaTJpQ1Bg+jko
X-Gm-Gg: ASbGncsiHSAiDAtUrh0KB9ceMrsdhhuJsovU/cDo0vyr3izd+splX2dDxIWS6ei14Jf
	ChG3q7LdO/+zOHseGDXVVUV4VU13KlNqz60k7W+l39GW2MtAOAtuyenTwQ177NmwL3nozQxZ+D2
	HjqAfkIGsgKHH7YUIck3DEFLHMrknB28jpYaLFGys8F1F0tZJzCWBbLnat8UzLF6aPrZo+ozvR8
	es5DjTehbscO78CPTrRnrOdOU+2lFfM5OhZcOaisSvG2vzW42daqAvRIKgwpazKwEO1biYSwF6B
	JncQSBEs2OueQYoYKPaQsIfmVamcXlRA/Ji9yvUHDlimR+0WZFwstrDKX0VRRGbOutRcRzZVTBr
	+4ynBTpQOeNjFzR8rTSCUE+Bg
X-Received: by 2002:a05:6214:1cc7:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f8b085282emr159912686d6.34.1747567314184;
        Sun, 18 May 2025 04:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj8nGux2StwxzQPkOeLSeLDNnSspsYDHAMPPiGqvnZIRAvavbrwKbInXIsYlDuYjKEpgmFYQ==
X-Received: by 2002:a05:6214:1cc7:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f8b085282emr159912336d6.34.1747567313643;
        Sun, 18 May 2025 04:21:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:41 +0300
Subject: [PATCH v6 08/11] drm/msm/dp: move/inline ctrl register functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-8-2f0ec3ec000d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=43871;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwhsHneNQTu8supzxdj78yr4Szh4oaAt7mcQfCiZ8Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLAlt9rCN0HO6ZqRHUUiuWUy3rllIbi1kJeu
 9Zj65i+ndyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1T8yCACwn7kyn82UnZ8vR0uZjMdZBptWGzndOB5UOCTu5z7vEfm08XnBCfIpBVvTwfcZ5uvK4aI
 sg9o4iyquJGHFYqaMyu8GY5AOUXvgoTT24gst1mQYhrhW3HNMu3G9DwVLW32ZXgnkIPIHh1hqKA
 73MYDZyxNRbNvAWnFsy6DJ8HKVng1cwcLuZ+4X8Ug7tSAgMpt56a8dMEDj7KwjsspCBx71+A5Sl
 WY6eudpdgdjXvZgFQZx1fdpd2njOkzeHIBuNFI5zKYQAYQph+6GwyDBInlqGtj1lWLnnRdpnFIH
 9n0A2T888l3ST/zr3q6BR6hUG2GWvPoDQP7MlGurqy5nAoaa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX/lPUpMUCWnYs
 DAnJwdt8yR8CEWzkbCKifebVCUgVxl7IeC6jU+xEThSCjglfXE58PxW+x1z/91fJa2q2Mipe7VV
 8z6EVlslfSnI2bRc1LMLXkY4qjfaIINrmLDkYam0Hk9/iIhxt7KTqiMZi536ykkg1StHFhoy6RQ
 rvnwdfZWhPm5p8Yn8jrI6YhbIgmEZroWartpGvp1UIKCGMWlIzC3Y2FwgHoW9gR1Db4BCK0WtXC
 S4vKQjdbUUV+Np9nvuUCCAiQ31LAq1h7dccUeX8Ka9r9SWQeELCzxFiv/+sZ6xoWlae48B3IsSu
 nzmuV4yH4gp0nD7PbazKHoR6GqWt63QeqEAocsDL2QXiIVRvTKmMkmHwjIXIB6htIpfveHjKdBd
 jScNvKoFS4Tk8F/1jmQhJoVf6nD6uK+MvpD1VbYAp1r2ihoSX/bfpPXOxws1Zf9iOchvqsoy
X-Proofpoint-ORIG-GUID: J-JXClDl6zVPjaXqrCZeYAZf7Qj0Aauf
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829c2d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=xPgWn8XnZaCAmy7UnEMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J-JXClDl6zVPjaXqrCZeYAZf7Qj0Aauf
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

Move CTRL-related functions to dp_ctrl.c, inlining one line wrappers
during this process. The enable/disable functions have been split to the
enable/disable or enter/exit pairs. The IRQ and HPD related functions
are left in dp_catalog.c, pending later cleanup.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 390 +------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  23 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 450 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_panel.c   |   2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
 5 files changed, 415 insertions(+), 451 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 332d168811c28f5c54069db9754ecf69904d5b24..7021effc7020073b8b7f633b96286e3996d78d6e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -18,8 +18,6 @@
 #define POLLING_SLEEP_US			1000
 #define POLLING_TIMEOUT_US			10000
 
-#define SCRAMBLER_RESET_COUNT_VALUE		0xFC
-
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
@@ -94,262 +92,6 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 
 }
 
-/* controller related catalog functions */
-void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
-				u32 msm_dp_tu, u32 valid_boundary,
-				u32 valid_boundary2)
-{
-	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
-}
-
-void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state)
-{
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, state);
-}
-
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_CONFIGURATION_CTRL, cfg);
-}
-
-void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
-	u32 ln_mapping;
-
-	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
-	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
-	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
-	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
-			ln_mapping);
-}
-
-void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	u32 val;
-
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-	if (enable)
-		val |= DP_MAINLINK_CTRL_ENABLE;
-	else
-		val &= ~DP_MAINLINK_CTRL_ENABLE;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
-}
-
-void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	u32 mainlink_ctrl;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	drm_dbg_dp(catalog->drm_dev, "enable=%d\n", enable);
-	if (enable) {
-		/*
-		 * To make sure link reg writes happens before other operation,
-		 * msm_dp_write_link() function uses writel()
-		 */
-		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-		mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
-						DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-
-		mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
-					DP_MAINLINK_FB_BOUNDARY_SEL);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-	} else {
-		mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-	}
-}
-
-void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
-					u32 colorimetry_cfg,
-					u32 test_bits_depth)
-{
-	u32 misc_val;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	misc_val = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	/* clear bpp bits */
-	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
-	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
-	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
-	/* Configure clock to synchronous mode */
-	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
-
-	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc_val);
-}
-
-void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 mainlink_ctrl;
-
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-
-	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
-		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
-	else
-		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
-}
-
-void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
-					u32 rate, u32 stream_rate_khz,
-					bool is_ycbcr_420)
-{
-	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
-	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
-	u32 const link_rate_hbr2 = 540000;
-	u32 const link_rate_hbr3 = 810000;
-	unsigned long den, num;
-
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	if (rate == link_rate_hbr3)
-		pixel_div = 6;
-	else if (rate == 162000 || rate == 270000)
-		pixel_div = 2;
-	else if (rate == link_rate_hbr2)
-		pixel_div = 4;
-	else
-		DRM_ERROR("Invalid pixel mux divider\n");
-
-	dispcc_input_rate = (rate * 10) / pixel_div;
-
-	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
-			(unsigned long)(1 << 16) - 1,
-			(unsigned long)(1 << 16) - 1, &den, &num);
-
-	den = ~(den - num);
-	den = den & 0xFFFF;
-	pixel_m = num;
-	pixel_n = den;
-
-	mvid = (pixel_m & 0xFFFF) * 5;
-	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
-
-	if (nvid < nvid_fixed) {
-		u32 temp;
-
-		temp = (nvid_fixed / nvid) * nvid;
-		mvid = (nvid_fixed / nvid) * mvid;
-		nvid = temp;
-	}
-
-	if (is_ycbcr_420)
-		mvid /= 2;
-
-	if (link_rate_hbr2 == rate)
-		nvid *= 2;
-
-	if (link_rate_hbr3 == rate)
-		nvid *= 3;
-
-	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_SOFTWARE_NVID, nvid);
-}
-
-int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
-					u32 state_bit)
-{
-	int bit, ret;
-	u32 data;
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	bit = BIT(state_bit - 1);
-	drm_dbg_dp(catalog->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
-	msm_dp_catalog_ctrl_state_ctrl(msm_dp_catalog, bit);
-
-	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
-
-	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, msm_dp_catalog->link_base +
-					REG_DP_MAINLINK_READY,
-					data, data & bit,
-					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
-	if (ret < 0) {
-		DRM_ERROR("set state_bit for link_train=%d failed\n", state_bit);
-		return ret;
-	}
-	return 0;
-}
-
-/**
- * msm_dp_catalog_ctrl_reset() - reset DP controller
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * return: void
- *
- * This function reset the DP controller
- *
- * NOTE: reset DP controller will also clear any pending HPD related interrupts
- * 
- */
-void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 sw_reset;
-
-	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
-
-	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-
-	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
-
-	if (!msm_dp_catalog->hw_revision)
-		msm_dp_catalog->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
-}
-
-bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 data;
-	int ret;
-
-	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(msm_dp_catalog->link_base +
-				REG_DP_MAINLINK_READY,
-				data, data & DP_MAINLINK_READY_FOR_VIDEO,
-				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
-	if (ret < 0) {
-		DRM_ERROR("mainlink not ready\n");
-		return false;
-	}
-
-	return true;
-}
-
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
@@ -402,43 +144,6 @@ void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
 }
 
-static void msm_dp_catalog_enable_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	/* trigger sdp */
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
-}
-
-void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 config;
-
-	/* enable PSR1 function */
-	config = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
-	config |= PSR1_SUPPORTED;
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, config);
-
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-	msm_dp_catalog_enable_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter)
-{
-	u32 cmd;
-
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
-
-	cmd &= ~(PSR_ENTER | PSR_EXIT);
-
-	if (enter)
-		cmd |= PSR_ENTER;
-	else
-		cmd |= PSR_EXIT;
-
-	msm_dp_catalog_enable_sdp(msm_dp_catalog);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
-}
-
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
@@ -484,6 +189,11 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 	return intr;
 }
 
+void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog)
+{
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+}
+
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
@@ -498,96 +208,6 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 	return intr;
 }
 
-void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL,
-			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_PHY_CTRL, 0x0);
-}
-
-void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
-			u32 pattern)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 value = 0x0;
-
-	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
-
-	drm_dbg_dp(catalog->drm_dev, "pattern: %#x\n", pattern);
-	switch (pattern) {
-	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
-		break;
-	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
-		value &= ~(1 << 16);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
-					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		break;
-	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_PRBS7);
-		break;
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
-		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
-				0x3E0F83E0);
-		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
-				0x0F83E0F8);
-		/* 1111100000111110 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
-				0x0000F83E);
-		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
-
-		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-				value);
-		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
-					value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
-					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
-		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
-		break;
-	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
-				DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
-				DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
-		break;
-	default:
-		drm_dbg_dp(catalog->drm_dev,
-				"No valid test pattern requested: %#x\n", pattern);
-		break;
-	}
-}
-
-u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 9ebdc9bd865c566efb97cf0edbdcd809e5a713e7..a7b11fc08ea595aad50f09ca8d49696404514bad 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,7 +33,6 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
-	u32 hw_revision;
 
 	void __iomem *ahb_base;
 	size_t ahb_len;
@@ -117,36 +116,16 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
-void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 config);
-void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32 cc, u32 tb);
-void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool is_ycbcr_420);
-int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
-bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
 void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
 			u32 intr_mask, bool en);
 void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_set_psr(struct msm_dp_catalog *msm_dp_catalog, bool enter);
 u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
-				u32 msm_dp_tu, u32 valid_boundary,
-				u32 valid_boundary2);
-void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
-				u32 pattern);
-u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 17f645495c4a3e6603fee688090a6ffb3f263cf0..7f676e53d098a11901ef4bcee323d3ea79e53760 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -8,9 +8,11 @@
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/pm_opp.h>
+#include <linux/rational.h>
 #include <linux/string_choices.h>
 
 #include <drm/display/drm_dp_helper.h>
@@ -21,6 +23,9 @@
 #include "dp_ctrl.h"
 #include "dp_link.h"
 
+#define POLLING_SLEEP_US			1000
+#define POLLING_TIMEOUT_US			10000
+
 #define DP_KHZ_TO_HZ 1000
 #define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
 #define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
@@ -95,6 +100,8 @@ struct msm_dp_ctrl_private {
 	struct completion psr_op_comp;
 	struct completion video_comp;
 
+	u32 hw_revision;
+
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on;
@@ -119,6 +126,118 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 	return 0;
 }
 
+/*
+ * NOTE: resetting DP controller will also clear any pending HPD related interrupts
+ */
+static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 sw_reset;
+
+	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
+
+	sw_reset |= DP_SW_RESET;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	sw_reset &= ~DP_SW_RESET;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!ctrl->hw_revision) {
+		ctrl->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
+		ctrl->panel->hw_revision = ctrl->hw_revision;
+	}
+}
+
+static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 val;
+
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val |= DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
+static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 val;
+
+	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val &= ~DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+}
+
+static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl;
+
+	drm_dbg_dp(ctrl->drm_dev, "enable\n");
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+
+	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
+					DP_MAINLINK_CTRL_ENABLE);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+
+	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
+				DP_MAINLINK_FB_BOUNDARY_SEL);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl;
+
+	drm_dbg_dp(ctrl->drm_dev, "disable\n");
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+
+	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
+	else
+		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
+
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
+static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 data;
+	int ret;
+
+	/* Poll for mainlink ready status */
+	ret = readl_poll_timeout(msm_dp_catalog->link_base + REG_DP_MAINLINK_READY,
+				data, data & DP_MAINLINK_READY_FOR_VIDEO,
+				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("mainlink not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -126,7 +245,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -171,22 +290,50 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	if (ctrl->panel->psr_cap.version)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
-	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
+	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl->catalog, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
+	u32 ln_mapping;
+
+	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
+	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
+	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
+	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
+
+	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+			ln_mapping);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	u32 cc, tb;
+	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
-	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
 
 	msm_dp_ctrl_config_ctrl(ctrl);
 
-	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
-		ctrl->panel->msm_dp_mode.bpp);
-	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
-	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
+
+	misc_val = msm_dp_read_link(ctrl->catalog, REG_DP_MISC1_MISC0);
+
+	/* clear bpp bits */
+	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
+	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
+	/* Configure clock to synchronous mode */
+	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
+
+	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
+	msm_dp_write_link(ctrl->catalog, REG_DP_MISC1_MISC0, misc_val);
+
 	msm_dp_panel_timing_cfg(ctrl->panel);
 }
 
@@ -1003,8 +1150,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
 	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
 			msm_dp_tu, valid_boundary, valid_boundary2);
 
-	msm_dp_catalog_ctrl_update_transfer_unit(ctrl->catalog,
-				msm_dp_tu, valid_boundary, valid_boundary2);
+	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(ctrl->catalog, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
@@ -1113,6 +1261,30 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	return ret == 1;
 }
 
+static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
+					 u32 state_bit)
+{
+	int bit, ret;
+	u32 data;
+
+	bit = BIT(state_bit - 1);
+	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, bit);
+
+	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
+
+	/* Poll for mainlink ready status */
+	ret = readx_poll_timeout(readl, ctrl->catalog->link_base + REG_DP_MAINLINK_READY,
+				 data, data & bit,
+				 POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("set state_bit for link_train=%d failed\n", state_bit);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
@@ -1124,11 +1296,11 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
 						    ctrl->panel->dpcd, dp_phy, false);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_1;
 
-	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, 1);
+	ret = msm_dp_ctrl_set_pattern_state_bit(ctrl, 1);
 	if (ret)
 		return ret;
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
@@ -1242,7 +1414,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
 						ctrl->panel->dpcd, dp_phy, false);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
@@ -1257,7 +1429,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		state_ctrl_bit = 2;
 	}
 
-	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
+	ret = msm_dp_ctrl_set_pattern_state_bit(ctrl, state_ctrl_bit);
 	if (ret)
 		return ret;
 
@@ -1359,7 +1531,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	}
 
 end:
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
 	return ret;
 }
@@ -1369,7 +1541,7 @@ static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 {
 	int ret = 0;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+	msm_dp_ctrl_mainlink_enable(ctrl);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return ret;
@@ -1508,7 +1680,7 @@ void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	/*
 	 * all dp controller programmable registers will not
@@ -1519,16 +1691,60 @@ void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
 	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
 }
 
+static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	/* trigger sdp */
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
+}
+
+static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cmd;
+
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+	cmd |= PSR_ENTER;
+
+	msm_dp_ctrl_enable_sdp(ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+}
+
+static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cmd;
+
+	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+
+	cmd &= ~(PSR_ENTER | PSR_EXIT);
+	cmd |= PSR_EXIT;
+
+	msm_dp_ctrl_enable_sdp(ctrl);
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+}
+
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
-	u8 cfg;
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 cfg;
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
 
-	msm_dp_catalog_ctrl_config_psr(ctrl->catalog);
+	/* enable PSR1 function */
+	cfg = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
+	cfg |= PSR1_SUPPORTED;
+	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
+
+	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
@@ -1554,29 +1770,37 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 	 */
 	if (enter) {
 		reinit_completion(&ctrl->psr_op_comp);
-		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, true);
+		msm_dp_ctrl_psr_enter(ctrl);
 
 		if (!wait_for_completion_timeout(&ctrl->psr_op_comp,
 			PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES)) {
 			DRM_ERROR("PSR_ENTRY timedout\n");
-			msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
+			msm_dp_ctrl_psr_exit(ctrl);
 			return;
 		}
 
 		msm_dp_ctrl_push_idle(msm_dp_ctrl);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 
-		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, false);
+		msm_dp_ctrl_psr_mainlink_disable(ctrl);
 	} else {
-		msm_dp_catalog_ctrl_psr_mainlink_enable(ctrl->catalog, true);
+		msm_dp_ctrl_psr_mainlink_enable(ctrl);
 
-		msm_dp_catalog_ctrl_set_psr(ctrl->catalog, false);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+		msm_dp_ctrl_psr_exit(ctrl);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 		msm_dp_ctrl_wait4video_ready(ctrl);
-		msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
 	}
 }
 
+static void msm_dp_ctrl_phy_reset(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL,
+			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL, 0x0);
+}
+
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
@@ -1585,7 +1809,7 @@ void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_ctrl_phy_reset(ctrl);
 	phy_init(phy);
 
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
@@ -1600,7 +1824,7 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	msm_dp_ctrl_phy_reset(ctrl);
 	phy_exit(phy);
 	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
 			phy, phy->init_count, phy->power_count);
@@ -1611,7 +1835,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	phy_configure(phy, &ctrl->phy_opts);
 	/*
@@ -1642,9 +1866,9 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -1676,13 +1900,97 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
 	return ret;
 }
 
+#define SCRAMBLER_RESET_COUNT_VALUE		0xFC
+
+static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
+				     u32 pattern)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 value = 0x0;
+
+	/* Make sure to clear the current pattern before starting a new one */
+	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
+
+	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
+	switch (pattern) {
+	case DP_PHY_TEST_PATTERN_D10_2:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
+		break;
+
+	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+		value &= ~(1 << 16);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		break;
+
+	case DP_PHY_TEST_PATTERN_PRBS7:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_PRBS7);
+		break;
+
+	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
+		/* 00111110000011111000001111100000 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+			      0x3E0F83E0);
+		/* 00001111100000111110000011111000 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+			      0x0F83E0F8);
+		/* 1111100000111110 */
+		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+			      0x0000F83E);
+		break;
+
+	case DP_PHY_TEST_PATTERN_CP2520:
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+
+		value = DP_HBR2_ERM_PATTERN;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+			      value);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value |= DP_MAINLINK_CTRL_ENABLE;
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		break;
+
+	case DP_PHY_TEST_PATTERN_SEL_MASK:
+		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
+			      DP_MAINLINK_CTRL_ENABLE);
+		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
+		break;
+
+	default:
+		drm_dbg_dp(ctrl->drm_dev,
+			   "No valid test pattern requested: %#x\n", pattern);
+	break;
+	}
+}
+
 static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 {
 	bool success = false;
@@ -1697,11 +2005,11 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 		DRM_ERROR("Failed to set v/p levels\n");
 		return false;
 	}
-	msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
+	msm_dp_ctrl_send_phy_pattern(ctrl, pattern_requested);
 	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
 	msm_dp_link_send_test_response(ctrl->link);
 
-	pattern_sent = msm_dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
+	pattern_sent = msm_dp_read_link(ctrl->catalog, REG_DP_MAINLINK_READY);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
@@ -1980,6 +2288,62 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
+static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+			       u32 rate, u32 stream_rate_khz,
+			       bool is_ycbcr_420)
+{
+	u32 pixel_m, pixel_n;
+	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
+	u32 const link_rate_hbr2 = 540000;
+	u32 const link_rate_hbr3 = 810000;
+	unsigned long den, num;
+
+	if (rate == link_rate_hbr3)
+		pixel_div = 6;
+	else if (rate == 162000 || rate == 270000)
+		pixel_div = 2;
+	else if (rate == link_rate_hbr2)
+		pixel_div = 4;
+	else
+		DRM_ERROR("Invalid pixel mux divider\n");
+
+	dispcc_input_rate = (rate * 10) / pixel_div;
+
+	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
+			(unsigned long)(1 << 16) - 1,
+			(unsigned long)(1 << 16) - 1, &den, &num);
+
+	den = ~(den - num);
+	den = den & 0xFFFF;
+	pixel_m = num;
+	pixel_n = den;
+
+	mvid = (pixel_m & 0xFFFF) * 5;
+	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
+
+	if (nvid < nvid_fixed) {
+		u32 temp;
+
+		temp = (nvid_fixed / nvid) * nvid;
+		mvid = (nvid_fixed / nvid) * mvid;
+		nvid = temp;
+	}
+
+	if (is_ycbcr_420)
+		mvid /= 2;
+
+	if (link_rate_hbr2 == rate)
+		nvid *= 2;
+
+	if (link_rate_hbr3 == rate)
+		nvid *= 3;
+
+	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
+	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_NVID, nvid);
+}
+
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
@@ -2045,7 +2409,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	msm_dp_ctrl_configure_source_params(ctrl);
 
-	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
+	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
@@ -2054,13 +2418,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
-	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
 		return ret;
 
-	mainlink_ready = msm_dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
+	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
@@ -2081,7 +2445,7 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	/* set dongle to D3 (power off) mode */
 	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2109,7 +2473,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2133,9 +2497,9 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
-	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_catalog_ctrl_reset(ctrl->catalog);
+	msm_dp_ctrl_reset(ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 53eaa9d3629ceae0bc127a605056419bdc4ac7a2..ce7e710a0ded1fc2703dc16b1fa3bd61d47714cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -390,7 +390,7 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
 
 static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 {
-	u32 hw_revision = panel->catalog->hw_revision;
+	u32 hw_revision = panel->msm_dp_panel.hw_revision;
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 8dde55b3a5ab64c0c12d69cb2dd5b5c733c83432..c348417bb07f33efdf1402a73c27ff99e394e5a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -38,6 +38,7 @@ struct msm_dp_panel {
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
 	bool vsc_sdp_supported;
+	u32 hw_revision;
 
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;

-- 
2.39.5


