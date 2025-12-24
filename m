Return-Path: <linux-arm-msm+bounces-86442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB2CDB0A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABC7307CE7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D62262808;
	Wed, 24 Dec 2025 01:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Esi0DjvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZ5FEz3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AC221C175
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538228; cv=none; b=ayp+v6Xv5DJwfASSpcTS2uUxRA3g9O8fzm1fjzNymQZkEE+ye5Wt7C+b4G3Pj+wvv7SmyFUwJ+Xu03Gm9vwOwct14HdEtTQ4+tksb8vokZvUkVfaNewFa0Ol9wXEsE6LMH37Kp118JP0nAiCEZ3hTlezZl8lcipiUnVlI3Gbhno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538228; c=relaxed/simple;
	bh=nzElO3qrN1ngMVHhZahBd7pKCsEHzR84mn0cPkFgNGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bulh1jbTZimuuuFI0xdk0/aQVX6nYXdGoYd2bhUokuUss2bqvtHAP++xbdF+YOsnviuxEB9tK4921xs08qOgE18N+/XAcXXAoRnPqoNeKBeLieQx89oXp/PMhBtilhqTj48ilFogoevk7IJBZoM8+hauMGuOj2azZ+YPHHvO3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Esi0DjvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZ5FEz3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO0gUXJ561247
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=; b=Esi0DjvAzJhxorsi
	g/+0CqqpWMMGETBCdKGbWAK6+wNpcpUgTsjDU9DlpBhFnx5A2q/r6vi44H6iJUXd
	rPPoPBKv2ob/TY6coqKmULhrTq2Ws6j+f1M5oSTqqnWsgVyacZy7WUZUBsb+QMhe
	sVf7WTTTDaZPKrSeFvRIcvrsmY9LL6x5U1DHtvybghVoCFvFFqxVCZzkgRnOiIYx
	H35A0mjZyRosZPZTj7L+ZI3MajMOghue3ZY7KIoamPv5jAAt1K1TE602mnIix5mB
	USOF+TIqUZJyVRx1gM9WdnGaDLRzkPzwjk6ea6N96EV/KiLzbxuB8eejkGQj0J+I
	X+d4Eg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9csxne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so141124651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538224; x=1767143024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
        b=IZ5FEz3+0DPobY1v/khXC56u1loAmRl5Fmxl5I/+nVdExSaMWyhdMvaYRu0+qBykG/
         Lzb7txIlgdvPOFr+rn1NKnJVr0eyVPPY+j1FTYuOucCPlYOnCc3ooWI1p5FOHx2VQejG
         /JO2iDSCx+5d9/TsK9T0ryJ4Lc1pJfNuclqmUSCqhK+IayRxDzN0jJlK9uY9U51sKIOS
         vE7AixroICSwORJyOc4a/Gxd9BM+8eYvXrYgHDi7wz1Tol2aA2DgEV3mCozKgA/KXpsQ
         3rnx6Ul3itNYvGc/rPUsl2XZ121IFaYQ/xW9nF6LZ7ASOWDI/VWBHZyUs/pMTkLnSAa6
         I2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538224; x=1767143024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+SBTDTtGkE8RnKwaj4dcEp5VbeaO6x7ZVfHg3H5ESs=;
        b=J3SjI+bPXUSnRmI4fuOu/9R7iPpQfCYoeLzb7zVAhqBRF88kxxhnGlQ/XCGQ7WAvcP
         ZthXzZ1NEdPt6to90HYYlQLiOe+efOOU/rw47DQtPcGzzB9dJCCqn1/uNWY3TR2HiTaD
         E8t9NvrL9oMqiCfiJBZWrFS4627k4Iet/X9vA6/Nahw5uk2JoDhu3Bi04yR869xAH9GY
         EK5ZZeF/cT6v3zwvGtMRmCToypnFvleTx3/gCRMvW+3Pz/eTwbk5obulMsnYos+TpHGx
         o95wORao84JF2xyKcT1LvSvcHDS3wTiDGC0tFHIjaU1Fqt5hgzR3dUfquy+oq65B705a
         r82A==
X-Forwarded-Encrypted: i=1; AJvYcCX6sgXIgPcNQDrP2QHpCLESGvUzaOycIxcrn8Ft4KRmxssIA/kExsDXIJIA3BWGRFGAog9qPekGf/W/ytIe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe8a/rLxkbpR3P85OnvfdXuvJ/Z/ZPJm3uMMFifOFojedUFuwY
	3W3nMu+Y5rNCtk0XK81qU0i/uq8DBH0/eNhHM/TcGWamzgvAiNzSH7qcj2a4NfLpbo5ugxtIdnj
	dFbvoWC4geZx6ss4U4+vPKZcewPxJDmLWCgyjSoxdNV/IXTdZFlo6dgH1Sm2h1DIDol56
X-Gm-Gg: AY/fxX56IqcD9E3E0r34akZZsIgGvJ0Kuvpq7St02YVkRNXtTWXtPmnJSVYVrAzNuAC
	TJH+CzixVgYE98r59loUv4sZVJ8/IhsyUeHha86hBlIO7AeomuDXGfk9TfKewSPyW1zyocyOzdK
	kU7FZxU/mUN9WmniMa0AoMmx+ewNU3xhPOvDA9SmSwgHeLUtFfNLeLN8VPjxxhKfRRM7eY41vD5
	hirag9rKSFsgxZpgEEGn8DrKiUvn1CRpxmkfe884HV27DVFm3K05mvApYok7kwiP/rMLRfRNM+5
	IvnLE4FO2z0xtG/SQ8VYiLhv3pjMOpr9SzRKZaUzQeeblHzMIs8VTprW/pBIgk/cZ3mrjrLAnbB
	btCVd+OOGd8f77gEYcmrXn5cDPmXC7qOEBi5SxasmR20Jx8BMEqWGLJFHgB65t+BSPVi83dPn7L
	zqy4ZtIZl0OG68Yn8KVCF5PgM=
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f4abd79a65mr200344561cf.45.1766538223898;
        Tue, 23 Dec 2025 17:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3FPxruJlcg4sByZJPHlC6i+AJRJP3LWX/PRkxW+hSkPSJ4R06usLW/tOcstjoguUC6XxUXg==
X-Received: by 2002:ac8:5714:0:b0:4ed:b06b:d67d with SMTP id d75a77b69052e-4f4abd79a65mr200343621cf.45.1766538223198;
        Tue, 23 Dec 2025 17:03:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:53 +0200
Subject: [PATCH v3 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-4-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nzElO3qrN1ngMVHhZahBd7pKCsEHzR84mn0cPkFgNGc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY4okwjZ995SvLTt2suiGbzvPytcBxbUZoJ
 IPFjD2XFqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1VbaB/9msli7nDTqX+64qChKWsJQHzLJSmqJubE1UJ2Nf5Hi/AwpsU7hfYtfCl3WwKKmKfuuu8Q
 Lnl1Ig4EyHgBKD8apvy+9QiFbhlYaqL42IMOn+b4fFQG+1HPmsw4bhcy1pYeNPK2nWrNf4Iot+s
 sd3Qh5XwmI66qB1NAgelgo+ogMATAG/krn39azAVbzRMw8HrEzuws07zAM9ceLRCB1ggf6IEBFQ
 TFqvoA7DhLiuf8z1XlDYFdpss+zjWGa6X0rgks+Jb7dLupcHZqGP6X4NiZ6MxeJ8PeusTd6aEyy
 LwfXlcUtR0hby0mDACU1DWxjeEkPR22us8arufoAaAdFAFeo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: wDeuA7i2TkxRGmXxofla4W3GTyR7aoMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX5YrESguh94K1
 aPAeSmkzOw5MINteJ5PzDqL7FbgOTH3X3RQvCAwWJC9PFMEsX0D9d7T+SygJNwIbGtqru6oQemt
 RH39/D2356E0jVt2lTaE+qb3qtps90zqWRWTzhpiDk26ZIMBaCoiYhKPg5jFQ/vlnnmVLrKp9A1
 h56z7ldW4SbalcpyKUTwvoM+Y1RCS4OJHeIw3otx9LJxDIXZoW5PbberlwRd3CTjfJzUmFBai2G
 CAcIr6qFOOmxjf+iBzdjD5oJwprd5XJcV2Pi65rBMq61voysj9sSB2fAUEwP69z0LTpGzaL5Qhx
 2zXOI+/ttUbuVC8V/z4ZvaQjDmS0xjjjdTdJZt+5d4y6E0+rOcblt3YjEfU0N/nVSrBABv5Wjzm
 hz6bTANgLL0oQ+0abJT3PqlXjQoDsDVDBQONGHEGVksBp+tBYt8T1XxzJTFoJC/P4Ospq4X7nTl
 jtC3PEuou+50bnJ4RqQ==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694b3bf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: wDeuA7i2TkxRGmXxofla4W3GTyR7aoMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index bdf14a0623b2..915dcd106703 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -76,7 +76,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -89,6 +104,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -101,6 +118,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2419,6 +2438,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2500,6 +2520,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2685,6 +2706,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3


