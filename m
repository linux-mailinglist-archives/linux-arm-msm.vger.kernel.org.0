Return-Path: <linux-arm-msm+bounces-55597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B7A9C45D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5345F16A604
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DD92451F3;
	Fri, 25 Apr 2025 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/vqPwgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6DF244196
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574730; cv=none; b=kpQuRdRx+AHlQbgcnu8YMj4Y3vKs3WZGTW+SHnU2nBHX1qh1E/Ujs6pVEmVs94EttJQgxbpUlXlY+B1woFdks06WEo4VGYJX0LvBkNFYPmBDwqcBp/Mr+aa+LsE5B3Yfl1nGefRbS0nYhqMKitB0rdTyiTkIzt20neGQKAi3U3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574730; c=relaxed/simple;
	bh=VPdSvEDPiP5nJqqimsvsHJ3lJjjDFvVrzXMRBy049zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATguV6PEgpvQIyHHLYoT6uNHTtSf11bXP6ZgT+NRmLem65djDqc8TtQJa+le4jp/OIs4HZ0u5ClgWjMcy+aMg4XJT5IsdiZ6ORm3YRg0TYj0OjbG9BfJxXfqwqxgpsII4XaSFgs6HbAqDn9Htt5n8XKpUOuP70u1xbfPfQFnOj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/vqPwgp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TGQQ008750
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=; b=i/vqPwgpSUlhVzrp
	bL0NIDzAcykLSIAA0KhJpA7nIZlBF1U0mj864gs+xAomimCbDsyBYG4038Vv7WfL
	YK5sg5hW5qd2HxIluNNtHS3fAhch8SyMmssCszQNVyZY/iqP/lwEuoWwaOfXW7TG
	8WFtVYGilE9ACORLbiQRFtsQaFCwPdecB5W/KJzquQT0BahzZeA7wFlfZusYdgac
	LKOzxz1CcdFM+Iw8135ASNxEDD9LmHaD5HZwrYisBd8qOzf/mUq8JvtJik37+se2
	elLs2wqVOo7Y2HgzW8nWIMHdcVWAao7YErPYBBod/6DZNzEkKTeaYYMS1dj7RH3E
	BldwpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8gxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so353611185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574726; x=1746179526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=;
        b=MfSl4M62Z3PWWxsBmFUhJNBXjDOPD2o3lxlCZUWrSkFU3CsH83cxxIHQuVRrjJz0Tv
         wTlCgqf+KgBSv7j7wT+XNCWpjjaey469ydeW1W1rnPPwk/DG1WQtGWgZ07KdH1hdPiSW
         Y55UpF/b+x0/ImOzHHr/+pV8a4qyR3up6dPVWUqqCe8Z2WSkGmF2S6OaP4zxhutvFvpw
         BnrHw2NuDZLeFe56UGygouI9nkijWCadS14gfWwctoslIqtdCpoa9unPfJMVZoNafH36
         41H4MiqRBf2U21qHbCuOpSSq7IlI0detH0e9TjTqththETvAswDY7EzDx9UffjFUNlU9
         pWvg==
X-Gm-Message-State: AOJu0YzJy3PYG4y4EcJPWdyBbRxbswTkmbB+06IUa3HEG1Uxk3AwGP7L
	8qThTDtK1XD+QX+MVEmt1UfY0/vxrUuCdEoJFFaMAm+s8H/oC+w15gJ8LblukajAOcS4DGJzEY5
	D7lSMahjIcZLKGbqDNTUHBTs9GIw7H8jwWoOilrU4LBfktgtmh31aH4I3LFWe25//
X-Gm-Gg: ASbGnctgvaR1rT9shK7l5J4Jl2jPSH7zDz/WiBexExk0LmwPQ55Kt2+EPZFiEetoWek
	KcB1GBWXbZ52v4USklqouXUGfkXusFGxh2r8j5Rvc0tx22BiWLRhZVv+7OuyguJeJJMng9Wcaa5
	opZ6FcZrc9ja/D0+RV07m2+mM2lEEzE3/52wvQGTNirtqyl8N9SDRHVc8N3RBg9qAOmjFk8/X4B
	odVBGtgSwEpJCzocPG/v+ON53NIdepHvOX/3EwaobvomeoX3zxljzDgrTBGIbNYHZam/17gKc+n
	Eqlo+qj4Z4zY82ON3oooMFBjMs2dp7PykTJobUnHfCawDH2dKGRX5sojEsSO8YEY3P0yKlIAJOF
	JjFHU8WaIY4rfFvY2g2oe/QbP
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id af79cd13be357-7c9607b24e8mr256005885a.56.1745574725875;
        Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECepdx3M8voxwdgIotc4jExjaEsT/aNU+/NJvxWGcXVKGq8zZgS2csyHQXp7J1OZcAB7cxMg==
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id af79cd13be357-7c9607b24e8mr256004185a.56.1745574725551;
        Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:55 +0300
Subject: [PATCH v4 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-5-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4386;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6zDfbr+Ff50cCHiOONUZ29i4X43jN3/ObgolYfFGR7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5Y0P8ukyZ1hYkilVgrYffYkcTvLpslNl2w
 sJplHwF+wWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1TaXB/0VGI/G1ISEDOkZaFT9pqBVkHDfekywPNWp5O2H7Z4FvVhu+yHLnRliZHkqzPgLLvuHOnW
 51ZW3cJpWWXK1v688XqY6G7cLyH08XzUAy/8fiEeknzCOzhyeoie+VkN2QQ72nr8vVJjUCgy2Qy
 E5HgCku6uLjfA2r7J6gc0tV5Q6PIGTIRO++sSF7yYagJtC6o/mKWAS5ajyk9MPSEQhm4GKhH89K
 R9Z253sD2HKp/IA5NZkE2gciW5iiTMnqMhB9b+nJzwJfCEvz9mh1u4z/lqsxwB89WbEKKZXI7L/
 HmrAJYr82dKvzyuSCNuqq7tl28rWs2v6wJkffxGi+CxV2Uce
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX0ghrmMSSv1/S CeG4fUjzyESv+78uL35Ct9+anOvLZG5WyPTx2w9eoxx20ipGSjJBbNy7qdAM48Vb1BkvvLOqol4 YFuxouyhArFaYb8aB998Uhs3cdwjenG0V+Bk/6sYAJ5IwdQQ8d4Ki679Sva0ZRHeGUGzRVuuKVp
 DN/Gx7qDLiH5GDBUjmwLMVB41rVye9n7O0O+yQp7B4zVYydv1e6prmr0+U6HlwmYnf2Cy0HLwQB iRnRmIQPsEG1kgfE/6qfcVhe0ZxdywrVEAq6hLufwpYi6+/SfAhttUeFm2oR3GdEwQsSDpfh53m 80jXkvxATHsozCd80hNFqxXtmcZFGTd4e11NJA6MG1jL/CJkpdFyiHmQISDTcibxBWmJ/2UfGr6
 5/79vxrlUmPF1dVdAb+eSQ6AxbgV7peXzenX3ixclxv0bSTUHiB0bp6H8H8NWYxEMRyVCBbX
X-Proofpoint-GUID: aHhzz1ROaqHYWNzm6fQqD5H9UwXI0rYl
X-Proofpoint-ORIG-GUID: aHhzz1ROaqHYWNzm6fQqD5H9UwXI0rYl
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b5b46 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=e5J9yQtEsebikEsHgo4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 3d7ffd874e0d234f450f6170e623f87572456757..66f5009fdf8aebcc543b5539d1c2d03075171001 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8694e5d7d3f012070c72214df063a6488b2ef707..7f4e8005bc4ae0bc82ec5b87a1fea0530301b427 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5


