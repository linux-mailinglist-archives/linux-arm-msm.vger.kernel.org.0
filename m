Return-Path: <linux-arm-msm+bounces-23852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8181E914155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 06:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADAE3B228F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E45B1401B;
	Mon, 24 Jun 2024 04:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UnHEdhFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081AD18C38;
	Mon, 24 Jun 2024 04:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719204589; cv=none; b=JCaaf6TknVLCLawRZCY6teKZqR4wHAiV7I8+eXCnNFI0HDY0PO3xEt8AeJ6U1EWALtSDiSt/sy/xT/rX9RzchmMGg1eWk2h9qyfHJnTi28q7GeL5mzn66NcvReZBGnbTrR4t0pkfj0t/c8drdfM6Crmg6jd8YYxAAb/GxBsqmpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719204589; c=relaxed/simple;
	bh=snyKfFhqIkPeNvLC9b5uZM7RvIXwrn80AKMydgiX1Tk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlQ9IIKN/JskRWlkPOABZsO3SeAjO6j4pDau4m0bExFJIO1k5Ep55VFtHTX/pSU16jc89OVtyLqYoNJj+DcG3hRo809TT8P/WujpwqELBtMnzYrJj3TjVP8Oj12+yz4uyW7qvFYU3q04gI+oDTjen0YyvZj3af2jp//CY742bgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UnHEdhFv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NKuDFa021259;
	Mon, 24 Jun 2024 04:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTQ7tdU5LPyWdZXKx4F/btOjz9+Ft9piuKQZ3RNj7js=; b=UnHEdhFv6GeD9tgG
	J7Kz8Mb/PknBbajPFgLEjM6iAdTCGLBrgSaKeuJORyFwZPjOgdQGDDeIlU3vzTY/
	0PbjWsbNYJv1eOR7x5b5xvAXqEjoL2PvWiJ/cfuOe913sZh93muf3o4KUg0qwzk3
	e4v0Gf9jYKpLXa1SOa7nKSEAdOGT8QM+tYiEhDKQWSEng03dER4ob9p4rFw7yKbF
	hE21DrHiOpfX6GvPUVZocaleuI5G4yTG/0NlfrfGVNI/GsXcAO6AEbXtPv5uG+TW
	2oIEkYtBsCBXa0WWtfO4pafonsJdm4PBgok9YH49+hp9zwOqWuA1+aOPcM9uqFJD
	9Axwyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrtss4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:49:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45O4ncNd025029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 04:49:38 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 21:49:30 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J .
 Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Pavel Machek
	<pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
CC: <linux-pm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>
Subject: [PATCH V7 3/5] clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
Date: Mon, 24 Jun 2024 10:18:07 +0530
Message-ID: <20240624044809.17751-4-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624044809.17751-1-quic_jkona@quicinc.com>
References: <20240624044809.17751-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yHIvCLIuRLgfioIpy31TRzCRomLLoAhX
X-Proofpoint-ORIG-GUID: yHIvCLIuRLgfioIpy31TRzCRomLLoAhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240036

Some GDSC client drivers require the GDSC mode to be switched dynamically
to HW mode at runtime to gain the power benefits. Typically such client
drivers require the GDSC to be brought up in SW mode initially to enable
the required dependent clocks and configure the hardware to proper state.
Once initial hardware set up is done, they switch the GDSC to HW mode to
save power. At the end of usecase, they switch the GDSC back to SW mode
and disable the GDSC.

Introduce HW_CTRL_TRIGGER flag to register the set_hwmode_dev and
get_hwmode_dev callbacks for GDSC's whose respective client drivers
require the GDSC mode to be switched dynamically at runtime using
dev_pm_genpd_set_hwmode() API.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gdsc.c | 41 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index df9618ab7eea..fa5fe4c2a2ee 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -363,6 +363,43 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 
+static int gdsc_set_hwmode(struct generic_pm_domain *domain, struct device *dev, bool mode)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	int ret;
+
+	ret = gdsc_hwctrl(sc, mode);
+	if (ret)
+		return ret;
+
+	/*
+	 * Wait for the GDSC to go through a power down and
+	 * up cycle. If we poll the status register before the
+	 * power cycle is finished we might read incorrect values.
+	 */
+	udelay(1);
+
+	/*
+	 * When the GDSC is switched to HW mode, HW can disable the GDSC.
+	 * When the GDSC is switched back to SW mode, the GDSC will be enabled
+	 * again, hence we need to poll for GDSC to complete the power up.
+	 */
+	if (!mode)
+		return gdsc_poll_status(sc, GDSC_ON);
+
+	return 0;
+}
+
+static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+	u32 val;
+
+	regmap_read(sc->regmap, sc->gdscr, &val);
+
+	return !!(val & HW_CONTROL_MASK);
+}
+
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
@@ -451,6 +488,10 @@ static int gdsc_init(struct gdsc *sc)
 		sc->pd.power_off = gdsc_disable;
 	if (!sc->pd.power_on)
 		sc->pd.power_on = gdsc_enable;
+	if (sc->flags & HW_CTRL_TRIGGER) {
+		sc->pd.set_hwmode_dev = gdsc_set_hwmode;
+		sc->pd.get_hwmode_dev = gdsc_get_hwmode;
+	}
 
 	ret = pm_genpd_init(&sc->pd, NULL, !on);
 	if (ret)
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 803512688336..1e2779b823d1 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -67,6 +67,7 @@ struct gdsc {
 #define ALWAYS_ON	BIT(6)
 #define RETAIN_FF_ENABLE	BIT(7)
 #define NO_RET_PERIPH	BIT(8)
+#define HW_CTRL_TRIGGER	BIT(9)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
2.43.0


