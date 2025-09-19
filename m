Return-Path: <linux-arm-msm+bounces-74205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FEB89F2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3000A073FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC73313541;
	Fri, 19 Sep 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYn5Onil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F353313D65
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291971; cv=none; b=aF145aW8+NcBuawhbeEBQN7Gso43wMYFW0hqfv3r2VYP+oT9VkA1kI3PuOwydZfhziaPyScCc+CGCdZn/BqcrhMVY9b9OEYA+3KSEt49Kd2k9djvBVoSe1gKVEurW1y0lLQrV8B40oQHeLszBmKR0Z3y8TtbQBVSF0BQpspvefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291971; c=relaxed/simple;
	bh=GCe+y+ihdduBCycjVbFmGe//h71+pv3uLemlzIyg5DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAviZVp4ekJrQWrZ5H3CCUcgIkJVheEkhk/b9qeGkPrlfecnBqAE4t1BfRRy5CqmR9cNagyoM8/uBp/K5FyS0wffvaiVK6AScHJRNlYAe/U01B6gVHsCNTTItLaXqUhxAcNZDG4Gfl5O0/g/+XTr1qe4I8r9x4SJBUQRhuFVVxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYn5Onil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J8tfP9022858
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5aiRCCE9ocbA/hLxwlTICCbBNjV8GTxNbYTql/HA9AY=; b=cYn5Onilx02UziOR
	ieo1krNIgxSDaCAw5KRrwuJ2emGei5yJgBVM5gD834uC6pq/TkM+dKJY9NL8hZxp
	tekWIa2M63Q9Dct5FFW/2PVMcIu+dV06Qw0PFiZs13o8+wEDKd3HoKWXeEeuA4o4
	z+KDHE55DwZ6ZKDeH7uunrCAbbClRiZjFEokbchkyYCwWXXVE1GtuhlbBFcWpdw2
	o02+Fqyz7m5nq34eNydnE60nx8NAeExAs+F5ySsZmmmMqddV83LQgqdyrZYO8DoH
	BLURuzoUMHLpbDoHQ1QWfKAUZz9ZDUuD07A5zZdtJ4VdU6TXBnPd6BgerQOUGFGQ
	GPU6lg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2npp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269b2d8af0cso2826775ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291968; x=1758896768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aiRCCE9ocbA/hLxwlTICCbBNjV8GTxNbYTql/HA9AY=;
        b=QpsjBPAqKwYCeAFPgSsfOSnWcYeFuizKojN8j6zGMVEo7D1WdwCt9SPTd6+PIREKyf
         gkhpN3Uckh28Y7DE+/U7rGNpRNUILdgMvbatFHxQiJSSGjgQJCEMs8vpXaqsItMgagjI
         QmXYDThLq+MD/tfs87ZUcDa1FDddN+PYzHfUDT8VvCClwczCFWKqVRjJ+a8ay6gu4CW5
         368yp75EeLYNk7y05oCHK7mBKB7qhzH2+3Xhag9qct66UjUoSxe0C4xgLdhz1+y3OpsS
         FOFU8GTb7Q4SEWT1k7M/LHbE8mb2jlzwcKanxFCcnngEfE/efEbCknW+2hh9QRjKXehc
         O0bg==
X-Gm-Message-State: AOJu0YwqFLncsgvRAueRHvSLSay977hgeaUaPz/CUPMzPIug35j0V3Vs
	5s+4veWIPjYCTc8ze9g35OGQGbYeso5yTYU7WGda5mqQb4jrJNyxR5Ml5psuyvEHvrHFJzKiSRr
	Il9Z9cHp695dPz0jnisdzvFI8ZL2smNqjCOZZlwldkfMkwT1pjbUT9pJ29YcBNENko3oD
X-Gm-Gg: ASbGncsdjwqiG10ItNyHXw5Vd/5ePf3YiVuteu2Jj3qTQSNvLAl/a6XUOyvHxPYKQIW
	KYwSEdOzhDklO5w06rvYTDBAI8dDyxMn2eb0Jo2nD1ol7MAYQuFElVgKp0h0Plx5zAQYHaREMLo
	LG14wi32rlwrQKVTOeHYumCecA9r4Tm9qw4wA9xmCHbz6qgtqG1sre6MNSSLPqjmLOykoRBHJAP
	+MTacvj7T1V93L7gzp+DwSlb7GOT2qCAjXAoHIjn6BfCk+9ZF8Qs8QBKCJY7dLs0lwpLC1GOdKG
	XhyLG49YnjBIJMxCuvdzWXSa5ybddDqr8ifhmqn+vXWD4jrbuKsOxakN+7K4mjZfygtrLiwQNYR
	SOb/+0W6g2H/PlQ==
X-Received: by 2002:a17:902:f904:b0:261:500a:5742 with SMTP id d9443c01a7336-269ba547cc5mr18602575ad.10.1758291968425;
        Fri, 19 Sep 2025 07:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHadt6BN7UHxCs91ZL5/MN6Y/c2n9SW35yuaMVxqkLFd9EHXiFLAAcXdqXX+9UDIM2eiq4k+A==
X-Received: by 2002:a17:902:f904:b0:261:500a:5742 with SMTP id d9443c01a7336-269ba547cc5mr18602365ad.10.1758291967777;
        Fri, 19 Sep 2025 07:26:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:26:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:26 +0800
Subject: [PATCH v5 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=6380;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=GCe+y+ihdduBCycjVbFmGe//h71+pv3uLemlzIyg5DM=;
 b=3umBmQ8TuHOP5HpaoxXj1jkMkdQm1WdIzzpKNRdgsCfHfHddJZ9nxvUObk/m9vhZAFEYtFg51
 B7FRXBXwNP9AReKCbUCBh3/DVESKmfF8EzrpwXupfPYOEm5oD4bbYDw
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1E+9Fe3jPln4
 /F/N8/jyk3BlmzOasuS90Q/1ybK4akGvsWsMp+uQ6tczZTrLfiK9avjWuWvginDTCYqYELsw9Cn
 NR7g2Q4B63Eb4zPmsqYf2PDqMM6AJ8QN1noqfCN36aOnHT2kaCPTggUZZIKsZW+VoLfhAFpVoQg
 ImHnLVGYIupmlfNNJqqlyd0wc27gNeXaGZtO4QPdFpvdyxSHVqQERsn9aqBYCGVA6BCgufP+Tdf
 +4xbiQMMQFCvKQzdP7UHOS+QNB82P/bGLffcjTRKMRO2ZBa/MAcFNmaWJzCgw9qogvRqz4wOdWC
 yN9Uv8LycAMvJ0NM2rb3T4wPnLknYxxid00uYmLdxDon7mh/nZsbCecwNA0ZJtfYv2PSqGxOdyM
 B4YO6Np2
X-Proofpoint-ORIG-GUID: jGVl-gV4mdFbKTxC6_xjXbw95jxfFmwi
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd6801 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7rhxC6dmq8FdBza6woA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: jGVl-gV4mdFbKTxC6_xjXbw95jxfFmwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
 1 file changed, 193 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index cb0197538befa6e7a5408c8d2d45225aa9520e8b..74dcf954845bcf8209202b75e9db10c3f6bdebd9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -29,6 +29,8 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-dp-phy.h"
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
@@ -715,6 +717,159 @@ static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submod
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
+	qmp_usbc_set_phy_mode(qmp, true);
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
@@ -722,6 +877,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
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
@@ -1304,6 +1469,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+
+	if (args->args_count == 0)
+		return qmp->usb_phy;
+
+	switch (args->args[0]) {
+	case QMP_USB43DP_USB3_PHY:
+		return qmp->usb_phy;
+	case QMP_USB43DP_DP_PHY:
+		return qmp->dp_phy ?: ERR_PTR(-ENODEV);
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1374,9 +1556,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
+	if (qmp->dp_serdes != 0) {
+		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
+		if (IS_ERR(qmp->dp_phy)) {
+			ret = PTR_ERR(qmp->dp_phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
+		phy_set_drvdata(qmp->dp_phy, qmp);
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1


