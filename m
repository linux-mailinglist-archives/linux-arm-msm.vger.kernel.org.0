Return-Path: <linux-arm-msm+bounces-69933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E1B2D8A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52998B601D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1192E2DEE;
	Wed, 20 Aug 2025 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHfvRoyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17342E2DF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682609; cv=none; b=g+z2tWRSwFxcdWTbDqx+JrXbTefkS2VWwh7vgsdth8CqPmlg6qxLUZQ7NW3MJ2rWyVCxDbWMY2Fc/j7LN9TylBMuyx2qjsuzyBHTU2DRY0ccSvEdkRooFqi2AxAYRQ8VJwoMPiaGvTWnjf3IMQXbCus8abnj9LOZXgYBpxtGfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682609; c=relaxed/simple;
	bh=MA02P7ToNuvVIaZfkK2UxK8YE+l2KzZCvXz7pjmIzh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgwiMFJ3X5jk+1irhyBTTj+F9G1usjiFkMGHC4w6c6EKBBxKTirrB7PgED2VopfWJA66X3xNj5C4u6UsCeobqpHyyvyDTpV+okOTP6HlK/ukd59uOEbHAipjEx1c828TDn10eim8fCNT5kasovFqPyc04ioPPExd5PqxwFPhIXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHfvRoyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ofbi020040
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrkMy5L7tD6QVTxF1NEKKWbi4e+hmDyRQI1J1n+A2q4=; b=VHfvRoyy68K37/my
	7ea+5gHfMClctLI5d7snSYwOJQ0tL343Gq8YlRkk9B3owhk5w2mZ2DTzs+vrdqIh
	JkHDwo3Ej0VaG6uxmxF8CeDAwCJrYm49tMopWqJGCdzQiz7KCOfrxYFrb3aV2jeA
	LMEYumS6Ewtibw0EXdfy48za5Rlp5E7xNejIe7EQEvyskCf8iIV25nWmnvXbQKjX
	YO+jb0zVNRLSIf3BADrciQ44/hoBf4XTjsvfoWlnocIWgZjJU+vqnIfoloIjG3yd
	SSoDkOFMg520r/EP045rNiHtqp7WZZmxNIR6i91NrlnZweJOOfJBV9Av0Z0HZMRl
	UGrPKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529174w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244580538c3so16661475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682606; x=1756287406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrkMy5L7tD6QVTxF1NEKKWbi4e+hmDyRQI1J1n+A2q4=;
        b=OgpydI9mt2aDgSRPZ839mAwGqQ1kiafrhNpcq9vnY+/9swktFDF+cH/oATb7ey7HMO
         HuIh/XGYQNvJCYQWeAJSUNH2fDU6txRz0Mjbzxj61hB8VNUQCG4ESSg6oef733P6FTUZ
         HsxOt7ByFEuFS0ZK2xUswLFiMTHW8Ka7PFHGS7wUljo5XE6plKmkDKcnWD2P+zkBb+37
         P2HxMBOslztlNE0I/pE4hkyYFyROW0QT1I/s+QNBIsgQN4N6HqM06qx4OqbEoAnv78yJ
         vR/m9mrAk31QVYrFE/bxNZzTpDVYHx31JR76TOY4E7h6cjAiEKGm6Q7vsFTlgtMFLfde
         ukOQ==
X-Gm-Message-State: AOJu0YxbJ+rV9lsyFYN+vg8saGmVkfxn0E7ouDERGk/jcxeY5swb7HS0
	IYqiZ43oTstm6L+uxm7i0jSHul3IOAxVNH+MHVv0V+edK9xQeu5ZNI81/UHq7KAcLkxpFdPXNMk
	Szqm4CxhlhoK2E5D/GALKjko7KRY5ztmjK7mlHGVCCfyZVHWsdtyl6wl0vhyjxvzBmJWyM911Kw
	Eo
X-Gm-Gg: ASbGnctqee5YVmgol+OMLaAuiJMEiVkgDZcAseo6qXFoukaSAsw9YidNznDzcKG58kS
	Y6xCpC/z9xhVs/XQfwh0Tslq57akc5A4vZO+gSoph8vJhN0uwGoe6uQ+GxIhjy3GpM3PJkO50zd
	FSVSJknuVDL4U4I2183DatX2eP9giH9Antfzp7fTnksuDOWa2VHV/aiPjEL9Jzt6/Vn1Bt/rDl4
	PlCzIN4+oozEg3AgdwvWgJblXJiCJGUdfXgtd9nxw/LntdLCNh+7WJghjJ8IlPs3XU/VEGh4jfy
	/ls5Ay29EIn1B0Vv+LgYoyrdxSONW2onr5l4WXM5WkMWgH0GxJsdRj7O3C6PWNPrKkgNeypixuK
	2tfrw2lNgMbhfg4zn5OHK0JbOGVNQwfyAyv+H2Cq3RP+uNx3aWchdWvgI
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id d9443c01a7336-245f85c8f03mr897395ad.3.1755682605667;
        Wed, 20 Aug 2025 02:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuqv0P/Rn8ScCOne0RSW/g1R4MWiSbtsdqocz2z7Sl3Z/tnXkAEbGml6AHCTkyZG68qndwIQ==
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id d9443c01a7336-245f85c8f03mr897265ad.3.1755682605205;
        Wed, 20 Aug 2025 02:36:45 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:36:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:51 +0800
Subject: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=5080;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=MA02P7ToNuvVIaZfkK2UxK8YE+l2KzZCvXz7pjmIzh4=;
 b=3mIfCNECdOIGbPwnHgFAMuETdXD0fuBwSYatvAYqRaOBnHvToCc2rBpbbUBHZ4RDlv571OlVW
 x3dauhgXAbrAMwhNv6iLIBGh7yzaX8IiOTES9qZasdUtyz/4MOC8kON
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: wvGqHojagtqYKztgav3r-JgKr3ixbA3K
X-Proofpoint-ORIG-GUID: wvGqHojagtqYKztgav3r-JgKr3ixbA3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXx7g4bF1SCCkA
 KUKIBPrMy6/TADY3lwc0y8H5hSM5DysQpg87JWinia47mySQNY7RbipkrtyXPe+8ROghJUb69br
 uk3Yzw8dZcl6zIHLZ49Mm/o3meoZupzHQsQcF8k25SmXjZigrb4ft64dIrg0RvuTyZ876r6Nyr3
 M326UC+unZlJgBe2gPpBMljYxvHRJHDMyyNizs+ojnvOkFBuaxz5vT8zghxnyPYzrQ+HaLR92EX
 IDFqIsWYe8+xSrkprsSfWevRS34ZST1q2e6FF7LxZNYLYGjVtSfzPpqlc7uxRL02JnnBsIdXoXk
 3ySTTGutz/nTMoprVbMKa9RZxUSiDlcMQHTVgD5MebvghXmZYpBACsXpgmLR572U7sjAjNM0soT
 K7sDEN0Aab7RptjELpPGETArKCVNjQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5972f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=CY_kl0BFdDKtcBMMbFsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 1508a4a5f57aff85318485b79528325f28a825a4..a1495a2029cf038bb65c36e42d0a4f633e544558 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -22,6 +22,8 @@
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -1088,6 +1090,157 @@ static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submod
 	return 0;
 }
 
+static int qmp_usbc_dp_enable(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	if (qmp->dp_init_count) {
+		dev_err(qmp->dev, "DP already inited\n");
+		return 0;
+	}
+
+	mutex_lock(&qmp->phy_mutex);
+
+	ret = qmp_usbc_com_init(phy);
+	if (ret)
+		goto dp_init_unlock;
+
+	cfg->dp_aux_init(qmp);
+
+	qmp->dp_init_count++;
+
+dp_init_unlock:
+	mutex_unlock(&qmp->phy_mutex);
+	return ret;
+}
+
+static int qmp_usbc_dp_disable(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	qmp_usbc_com_exit(phy);
+
+	qmp->dp_init_count--;
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	memcpy(&qmp->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (qmp->dp_opts.set_voltages) {
+		cfg->configure_dp_tx(qmp);
+		qmp->dp_opts.set_voltages = 0;
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_calibrate(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret = 0;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	if (cfg->calibrate_dp_phy) {
+		ret = cfg->calibrate_dp_phy(qmp);
+		if (ret) {
+			dev_err(qmp->dev, "dp calibrate err(%d)\n", ret);
+			mutex_unlock(&qmp->phy_mutex);
+			return ret;
+		}
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+	return 0;
+}
+
+static int qmp_usbc_dp_serdes_init(struct qmp_usbc *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *serdes = qmp->dp_serdes;
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+
+	qmp_configure(qmp->dev, serdes, cfg->dp_serdes_tbl,
+		      cfg->dp_serdes_tbl_num);
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_rbr,
+			      cfg->serdes_tbl_rbr_num);
+		break;
+	case 2700:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr,
+			      cfg->serdes_tbl_hbr_num);
+		break;
+	case 5400:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr2,
+			      cfg->serdes_tbl_hbr2_num);
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qmp_usbc_dp_power_on(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	qmp_usbc_dp_serdes_init(qmp);
+
+	qmp_configure_lane(qmp->dev, tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
+
+	/* Configure special DP tx tunings */
+	cfg->configure_dp_tx(qmp);
+
+	/* Configure link rate, swing, etc. */
+	cfg->configure_dp_phy(qmp);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_power_off(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	/* Assert DP PHY power down */
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_usbc_usb_phy_ops = {
 	.init		= qmp_usbc_usb_enable,
 	.exit		= qmp_usbc_usb_disable,
@@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops qmp_usbc_dp_phy_ops = {
+	.init		= qmp_usbc_dp_enable,
+	.exit		= qmp_usbc_dp_disable,
+	.configure	= qmp_usbc_dp_configure,
+	.calibrate	= qmp_usbc_dp_calibrate,
+	.power_on	= qmp_usbc_dp_power_on,
+	.power_off	= qmp_usbc_dp_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;

-- 
2.34.1


