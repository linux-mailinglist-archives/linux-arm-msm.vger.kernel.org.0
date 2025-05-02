Return-Path: <linux-arm-msm+bounces-56507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D7AA7344
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA88986C67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C00255238;
	Fri,  2 May 2025 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fq2bSkYM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1B2561AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191909; cv=none; b=U+hU/XLrQCl4UqzXLwEfsnreXXFAzxx4Ru7QNtIyeQcxBGUNqNf0vrpm10UFvUi8/ea/edTQUfVSsxYf8e1oUbH7QulNzIG3aw3WaEVYdG3fL18HA4BOApUJ7FyFehjohe3oyCy9rfDoYVt9ZWTpBElcAx3u5mYNIScexfdXwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191909; c=relaxed/simple;
	bh=X/UXMHXf/RhMlrDKgR4/ge5TpOg8I3dflZnq+YhC0gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CO5ZXA55W/RCL2ViEM7zRyS3Lpzey/gl+OyRMbeIVje6YXcgLSwQOmi/rGlQC9Esl/V8LB+q+wxNWh+Yu98trCNchG5/LCKAnnkqu3YlbzcKB40rBPEEPQ7J0nAsVl1NJ4fWuZ0JAz1jhQpvEpbLn3XzT02KgTQpEroW5ah1ESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fq2bSkYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N194001436
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 13:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slRaTmGfvy9G5pnb2zsQsGNa8ozzrVBB4Ulmgs5zT0c=; b=fq2bSkYMyE5XOc2C
	sruvyiDJRJnK5lXHhgziF+2AWu7zpi4mlShNh+gsO/YM557etnfUgbqGMspxBePa
	71xcMskhUJRWwaBdYUvsiGWUj6duBmFwGs7iLhqTdkqa8Piwi5hA8IveD3bes7x4
	GRZ6GnuAZNx7C44hUnW0fKSSI0FNlM8U8Oa9TualmZj8herJ0NlZ7fpbtVYN/Orq
	856V/ciu02h84Xia1L9M4oV1gKhfEX8bwgZHMQ2+m5nPfX+Yv1wq/w6u3QJZOQJq
	Wvm6y2KcK4sJBfGtMxGyaiWDgpFJFErTcbco3GlkJ8tnAlTfVSuxhIMFn8uJOuz4
	HU3/mA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2genw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:18:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736b5f9279cso1871842b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 06:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191905; x=1746796705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slRaTmGfvy9G5pnb2zsQsGNa8ozzrVBB4Ulmgs5zT0c=;
        b=RPzasD6qSWDKIxicXYUa5WC0HK1jKTmD8kiqnVCEwW/hBQCtIml6fKUW6Y8EyAMn8u
         MTT+Q8IU98FmcHA7J4A/weVwVbs5PV2Cs/mmf7VSUcFZpCugM9vQ3MYOpr8WiyCUXkBn
         8g7ieyIDcmcUhVR5CSOh0w9bvfBOFucppTLWpi0V9c7VX5AGuAM742K5Pr0eNpQ1i9Q0
         eqi9bRlYLKTSTWDfUbsdiJEFsz/FM2avz92mYMY7JFyA0EJ6GpRcPWNQGtUGMyZdZzzI
         x91FwxG1Ph01XoA6GgUUVBympWCV0T1tj54JFrJgecNBG9n1Hl38llOKcJFQL2vKIYo9
         O0/g==
X-Gm-Message-State: AOJu0YwzZYFsMazJaaM3T2k4hN7ty3laHT7BzZjKyshca8Uitla6VTa+
	0ZcZkqbuWpMayFUS4kyhNgWp69/N4zD3b+U6TYk/N9i2lNHFnda9p0Huywh36oTnj9YOj3AuCWm
	SzZDMqQ7apuXyW05ySyuy9PMXWPk8uU2sAxufCmnWAPWi9p4qzKIkICYesv0A/yEt
X-Gm-Gg: ASbGncvwOuJGl6+nohP/94NkHgytefEVjt7OamzOjFd2JISXlFhhQgFnNhYZxDP06Qz
	BSnG53xDoGNYyiTT+6+2oMIvR/CSCM2Hoy31uhUeZ3tnaotcrGnPW8lYhdTF0WxArjaUD+Qmm1S
	PHXO6jGQBpbuanFCUMebgBYCvcpWfCTUG4cmASjw7TZuapU49RCMT762WWoUQB3PmGV7ZnxSEge
	eCm9SMQnovvppgbo2j4ed3JxCaRifZC4wflGNexXjwggkeQBdWQVO9Vcw/p4NqI6yaKBNDFKqpA
	bCwigzC7mTVVZ84eZ2uEPnsYEUnQ4b1dzAS26xjbjgWSrVasN+oVqWB3jFhNIoNgl0QbEN+bYWS
	8SdVvb/rVChidx1T2qnS85KUuT68ATmpBB8EWTQ/7u0NGOEI=
X-Received: by 2002:a05:6a21:a4c1:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20cded42f75mr4269945637.21.1746191905030;
        Fri, 02 May 2025 06:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIFfSud8d4mhQtZmSV13r5D5SAuSAGajEnvH4vksJceLIMOcleS8DtsqVRRObuGzRFbXdvnQ==
X-Received: by 2002:a05:6a21:a4c1:b0:1f5:7d57:8309 with SMTP id adf61e73a8af0-20cded42f75mr4269912637.21.1746191904673;
        Fri, 02 May 2025 06:18:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 May 2025 18:47:52 +0530
Subject: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=3927;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=X/UXMHXf/RhMlrDKgR4/ge5TpOg8I3dflZnq+YhC0gg=;
 b=mat02aZTLGdQNdCaBVC5tsHJnRdKr/A8cgsxGVrffovzn5TYZj1m196gCiS+pmpV/7Lm7akLK
 +6a9BrRnogFCzDFNO43HFJOq6dSKkWmVH1Tx5Pl8FAlmjil6oY1ehtD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 2x86vjyXa4-yTWhV1UW3zfSU-4SItiue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfXz2G7Yb76QxpB 8MQbPO7PVed4uwK+qqcOrMDx9YD+V1U5CGBgTryCgtYrrZ8C1KYx6pflIMYbahrPKi1dEbC3Aa5 1NclkDsty2C5nXxMeBpShfclZjOiUogubq1QhL8GzFdCgLeAhXvnlVHX1XcYKqnrXcujHHlpFh8
 AVm0A7XIK3zHfEEznKCz9Tzd5XoiW4LibxFNmPPusID77tLlYi4WFBnmEIDXgRoiQMP+wAMzbZq 7J4OgxCfItWBTjCXbyNPW5x5ePBZIskQUEWee33ppYdVnUOXvPWDp7rY0XvufmGgXnHqxOWEwpm 4M/INRuTXHz0UYJLxYeP9yc/peg3gUhtNHeAHnQ+VnClpdCExQmd+q5ufZktTM3IybuS1Trwxbi
 DgPJupjYiH4CPLkfdC9Wvap91a28JGufH0Se8WYBX9E6+MALE4Ie7aERRkGqZeIjb9v1Qk1f
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6814c622 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=sQLmF_3sjJ1lx0YqgBUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 2x86vjyXa4-yTWhV1UW3zfSU-4SItiue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
in the WDT_STS register is cleared. To identify if the system was
restarted due to WDT expiry, XBL update the information in the IMEM region.
Update the driver to read the restart reason from IMEM and populate the
bootstatus accordingly.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
function qcom_wdt_get_restart_reason() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
	- Split the introduction of device data into separate patch
	- s/bootloaders/XBL - for clarity of which bootloader is
	  involved
	- Mention the sysfs path on to extract this information
	- s/compatible/imem_compatible in the device data structure to
	  avoid the confusion / better naming
Changes in v2:
	- Use the syscon API to access the IMEM region
	- Handle the error cases returned by qcom_wdt_get_restart_reason
	- Define device specific data to retrieve the IMEM compatible,
	  offset and the value for non secure WDT, which allows to
	  extend the support for other SoCs
---
 drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -7,9 +7,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/watchdog.h>
 
 enum wdt_reg {
@@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
 	const u32 *offset;
 	bool pretimeout;
 	u32 max_tick_count;
+	const char *imem_compatible;
+	unsigned int restart_reason_offset;
+	unsigned int non_secure_wdt_val;
 };
 
 struct qcom_wdt {
@@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
 	.offset = reg_offset_data_kpss,
 	.pretimeout = true,
 	.max_tick_count = 0xFFFFFU,
+	.imem_compatible = "qcom,ipq5424-imem",
+	.restart_reason_offset = 0x7b0,
+	.non_secure_wdt_val = 0x5,
 };
 
 static const struct qcom_wdt_match_data match_data_kpss = {
@@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
+					const struct qcom_wdt_match_data *data)
+{
+	struct regmap *imem;
+	unsigned int val;
+	int ret;
+
+	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
+	if (IS_ERR(imem))
+		return PTR_ERR(imem);
+
+	ret = regmap_read(imem, data->restart_reason_offset, &val);
+	if (ret) {
+		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
+		return ret;
+	}
+
+	if (val == data->non_secure_wdt_val)
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_restart_reason(wdt, data);
+	if (ret == -ENODEV) {
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	} else if (ret) {
+		return ret;
+	}
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


