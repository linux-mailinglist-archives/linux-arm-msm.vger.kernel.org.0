Return-Path: <linux-arm-msm+bounces-35428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35F9AB09E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7E128451B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5E5199EA2;
	Tue, 22 Oct 2024 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+Emv4yE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1319D88F;
	Tue, 22 Oct 2024 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606649; cv=none; b=thy6SDTIxoufl92lniL1DZD2+v0MXXdVPjw+62iicVr+v/3SdRpS9dN/Fq1oKiKAA8ddV3fzm2jI0mdwJwINhhpCLPLcGquRIcySqJV00HBjiN+qrGRJhpVSiwrB0oddxBflBnkVGroPUJeTQNNjtzkwXmKXnAzA6fMwnC7E/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606649; c=relaxed/simple;
	bh=ekA/emXkLZ5tc9Burp4oozETaIzuCtLOps/vxN+0/7s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UlE5Ki7p/63Olq252T4x38mwUa2j5VuN/Qg+mGiX6w7eeI6a2Sr3oTQi1xZFl2fL2VJTj8I7xBFHxwoFRWz8+giVIBa92BN0w5PmTQEwm1WjTsUHl22eNuiJUI1lXNz2RMKcYWrdCc7YQDOZBCTFQQH4ZYWQxGYH+aAJr34LYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+Emv4yE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBpE6K029670;
	Tue, 22 Oct 2024 14:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=LT/CYtCU7giMPvIvEl+vKtN0/5DN9R4S77AiJrAMNkA=; b=H+
	Emv4yE7eRAj1xdA3VOEEhHrsgDwGwX4bKEVD5TOxRm2SCXx28UTTA2ncqU+FdRP+
	EqR3aBvOGsIf//sxXjgE336T3iMLmDVglCKsCrG6QOVnWXJytryqpltc27j+zJTU
	+srWMvtIQRm4tex8phQm23/rz9pDhQxlh8Wkx+PavTBvzdXs4TzTR7HQZgmLN4VZ
	2TUaCDUADCz8msbIWdOTIm7jWx7cIcBEkRxH4WX7RferUA3TlVcOb12i7K3pfpZf
	j6xmuinyRFFTGkwgP6qqQFqsdubwLb02PDcRm7KkuSkf8fVdpFN5sKzOMUk7BSI1
	wm2olNceFt2Pc6gIwB7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ebhercvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:17:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MEHJpv004743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 14:17:19 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 07:17:15 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH] mmc: sdhci-msm: Add sysfs attribute for error state in SDHCI MSM driver
Date: Tue, 22 Oct 2024 19:46:59 +0530
Message-ID: <20241022141659.18764-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LhSU-FRjPHf8gKyKUccTkfTVQ1mFhdQP
X-Proofpoint-ORIG-GUID: LhSU-FRjPHf8gKyKUccTkfTVQ1mFhdQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220091

Introduce a new sysfs attribute err_state to the SDHCI MSM driver.
The attribute allows users to query the error state of the SDHCI host controller.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index e113b99a3eab..a256e3569a92 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -290,6 +290,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool err_occurred;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2255,6 +2256,8 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
 	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
 
+	msm_host->err_occurred = true;
+
 	SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
 
 	SDHCI_MSM_DUMP(
@@ -2398,6 +2401,41 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	return ret;
 }
 
+static ssize_t err_state_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!host || !host->mmc)
+		return -EINVAL;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", !!msm_host->err_occurred);
+}
+
+static DEVICE_ATTR_RO(err_state);
+
+static struct attribute *sdhci_msm_sysfs_attrs[] = {
+	&dev_attr_err_state.attr,
+	NULL
+};
+
+static const struct attribute_group sdhci_msm_sysfs_group = {
+	.name = "qcom",
+	.attrs = sdhci_msm_sysfs_attrs,
+};
+
+static void sdhci_msm_init_sysfs(struct device *dev)
+{
+	int ret;
+
+	ret = sysfs_create_group(&dev->kobj, &sdhci_msm_sysfs_group);
+	if (ret)
+		dev_err(dev, "%s: Failed to create qcom sysfs group (err = %d)\n",
+				__func__, ret);
+}
+
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
@@ -2442,6 +2480,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	sdhci_get_of_property(pdev);
 	sdhci_msm_get_of_property(pdev, host);
 
+	sdhci_msm_init_sysfs(&pdev->dev);
+
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
 	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
-- 
2.17.1


