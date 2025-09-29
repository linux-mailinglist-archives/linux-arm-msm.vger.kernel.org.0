Return-Path: <linux-arm-msm+bounces-75504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E0BA90B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B860168E56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC4F301482;
	Mon, 29 Sep 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jcHIunbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761D3009D5;
	Mon, 29 Sep 2025 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145757; cv=none; b=JoYeEVu1IVRAJUoHuBbl4NB2hyZneqfjkc2Ras7pcXvjYuUT9vfZ5MbgLbR+1u1nVDTgyzXM+CMAWfL4kJg/7JBMrRq2d/TKgOXWiQOhyfsu4qOdzhAsqy1gf3nSwO+/JGWca2VsglG9m6pilM3C85Ca/vbbUOXBBX4p0bqkPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145757; c=relaxed/simple;
	bh=f1ZhBPF5qBMf2Id3SmxXkRNYUpWgVtGREEwAkZtBDy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gdiZf0zmfnEzo24Slq8DW8QFYmRPv5p7aovXrX4TzyNQFQgUvO3j4hO0YKL/5RJg4x+eUN2tizFk5YmTounz88c2kTKYDJwjiH7TQ2x1ucwO8gfpmivclxMQYxViHVJSSVBbG/TnPk/61oor5+1Rg5AlyiB1sVGUikFKI4+9gaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jcHIunbx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAKTDD023427;
	Mon, 29 Sep 2025 11:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eWzx+0O3doY
	JWya5PgX1YWGiHPEu+jjac4PoaigUo/0=; b=jcHIunbxG3x5HfQK3XFeG5J0QQB
	D1ui3ZB+D0q9CTZNDe0QPBA6xBUwm8H5txmx9BNDde/nymfruUOCPlKsRpKj6LWR
	/vKDiOE5qaDY18JUiOQ4PGEnX5C0Yr/L8omO1hlL0iSBbAogSmZhfLD2PbCDHKoD
	idAVE63m/zMoQoxxd06eYryLf4pQiKkZ0Sj19Z99eCKt6NlC+fV4dXBmoFVGbqEb
	Kk8ThtiVkPL19Eio84Y2gU92ueVPpXIaLPDgEK/JIOx06Z+JKqIg912PZX5641eF
	fg1MQw7/LiQRCwcpwt80SWSFpvlUnaRd5IWTj0ng6n6dgladszz8CIb6AvQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdcs4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TBZnCP008930;
	Mon, 29 Sep 2025 11:35:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49e90kvy6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58TBZjnE008878;
	Mon, 29 Sep 2025 11:35:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58TBZmHU008920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 8CB4F5D0; Mon, 29 Sep 2025 17:05:47 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v4 3/4] mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
Date: Mon, 29 Sep 2025 17:05:14 +0530
Message-Id: <20250929113515.26752-4-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929113515.26752-1-quic_rampraka@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6FVdduj5Fo-cYjMXDV0HSSz97_epixMX
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da6f18 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=jXqgGYXXTYqZVwKfNlQA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 6FVdduj5Fo-cYjMXDV0HSSz97_epixMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX3n5f2udDz/9l
 xS9gJWR6yQ5iHn9T05i/UwXirj0lYIAwKLE272i5J1IfCjuNdVAqkwBHqEX+p6zWBTLtUpXyB1X
 7qbH1d5DqbefbpnvE3RyTJz5548FP5IpfP4RzGcUEMaViR+Nljx0RsTpF4KWPOsNOfssLnsV05X
 NjfXNJ2qyDQJO3YRdlqWr3jPCtR5sEEo+Dxso/HrlR2lNzZIoJ7y7gtJWbVz50VwT8cm6FfUNHZ
 GY8wPBU0XxVdsf/Esiy28CgJg1knIuhll+8LIqEjeWZFq13frG8UIfz1W9tsiIpQ6KgBJOaDx+w
 Mc2i7N1o3Z1AGW0xj/d93UmnSxShOx9rmuKb/1h/47FrYvYlxEiBIQbUebBuz0YJTwqjIS+W4xa
 IuOpypelOUEmcjO4I2XesUpjbjYyyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

From: Sachin Gupta <quic_sachgupt@quicinc.com>

This update introduces the capability to configure HS200
and HS400 DLL settings via the device tree and parsing it.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 91 ++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 36700735aa3e..d07f0105b733 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -265,6 +265,19 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+/*
+ * DLL registers which needs be programmed with HSR settings.
+ * Add any new register only at the end and don't change the
+ * sequence.
+ */
+struct sdhci_msm_dll {
+	u32 dll_config[2];
+	u32 dll_config_2[2];
+	u32 dll_config_3[2];
+	u32 dll_usr_ctl[2];
+	u32 ddr_config[2];
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -273,6 +286,7 @@ struct sdhci_msm_host {
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
 	/* core, iface, cal and sleep clocks */
 	struct clk_bulk_data bulk_clks[4];
+	struct sdhci_msm_dll dll;
 #ifdef CONFIG_MMC_CRYPTO
 	struct qcom_ice *ice;
 #endif
@@ -301,6 +315,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool artanis_dll;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2516,6 +2531,73 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	return ret;
 }
 
+static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
+				  u32 **dll_table, int *len)
+{
+	struct device_node *np = dev->of_node;
+	u32 *arr = NULL;
+	int ret = 0, sz = 0;
+
+	if (!np)
+		return -ENODEV;
+	if (!of_get_property(np, prop_name, &sz))
+		return -EINVAL;
+
+	sz = sz / sizeof(*arr);
+	if (sz <= 0)
+		return -EINVAL;
+
+	arr = kcalloc(sz,  sizeof(*arr), GFP_KERNEL);
+	if (!arr)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, prop_name, arr, sz);
+	if (ret) {
+		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
+		*len = 0;
+		return ret;
+	}
+
+	*dll_table = arr;
+	*len = sz;
+
+	return ret;
+}
+
+static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
+{
+	int dll_table_len, dll_reg_count;
+	u32 *dll_table = NULL;
+	int i, j;
+
+	msm_host->artanis_dll = false;
+
+	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
+				   &dll_table, &dll_table_len))
+		return -EINVAL;
+
+	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
+
+	if (dll_table_len != dll_reg_count) {
+		dev_err(dev, "Number of HSR entries are not matching\n");
+		return -EINVAL;
+	}
+
+	for (i = 0, j = 0; j < 2; i = i + 5, j++) {
+		msm_host->dll.dll_config[j] = dll_table[i];
+		msm_host->dll.dll_config_2[j] = dll_table[i + 1];
+		msm_host->dll.dll_config_3[j] = dll_table[i + 2];
+		msm_host->dll.dll_usr_ctl[j] = dll_table[i + 3];
+		msm_host->dll.ddr_config[j] = dll_table[i + 4];
+	}
+
+	msm_host->artanis_dll = true;
+
+	kfree(dll_table);
+
+	return 0;
+}
+
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
@@ -2562,6 +2644,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	/*
+	 * Parse HSR dll only when property is present in DT.
+	 */
+	if (of_find_property(node, "qcom,dll-hsr-list", NULL)) {
+		ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
+		if (ret)
+			return ret;
+	}
+
 	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
 	if (ret)
 		return ret;
-- 
2.34.1


