Return-Path: <linux-arm-msm+bounces-60800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2DAD39BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAF116B1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F71229C34E;
	Tue, 10 Jun 2025 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omTnmL4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8329C33B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563146; cv=none; b=tFB/Uop5jFnUGY3bNGnujtLtEyW0sDxfV7D4KWhrgXw3kVnfWF8l43AhjgrhsFQvjzyp1fua6YGm5HEUueJp2Vfuh6PJ9qNN83x+RQ3q2iJAiL01T51tziHAgZurRA9EhcV74ubkLOjUsRH1zYuBuCkUm4sm9DqXmZ3qfFo/Kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563146; c=relaxed/simple;
	bh=qodg/qJgptXiBp36gN6zPzfmpF/ldoJtnRNBNm4szJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8irSUxTJlHDN4v4vT09XKDonuMCZLH63gM/0hepqgkkyCtBnBShPxUEsd15zLxZMGx1MCR/OBTEttcLM03X9doWfQGMynh1vYY8iqoUWJY2p9ynsnUCInDi2afwxAaJv3IJHa09pObRZ+tuL1A6lszcRft0PT8ELCXQY46g/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omTnmL4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8AYrB009809
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mIEeWqs0Eroebgunj8ZpmJbv/vEwYm2mCE1jLGUifA=; b=omTnmL4bq0zxc++M
	c7BHD3US+kpzfMj6Jf+egd/uyOgki87MPJSvz/6wYhWjyqvy+3C/fX6l06aak5CB
	+eu40BLeQKGgIxT49On56I2h87NdIzlwuPoLtNFlyxaWQj/4FuI/JmprkzMkJ9O6
	DBYe5eqYNfHsGRjxbywPVN3y8fhpQ8UGLe4V6lydnOskQdIVK0j/DJYOiY9plOFP
	NYAwmeNbsh5B42AFXQfvSzPEKQRu+OGkeesHvkfm4lFQvfM5UZ7lRccRyKHX0S8Q
	cqeEPTlzbSgtK58qdch+7kOVc7iPu/lPh2/PNLmC8poLFvgMbZGpWooVP5rAVCLW
	KEMe7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqchh1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:45:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74834bc5d37so5342048b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563143; x=1750167943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mIEeWqs0Eroebgunj8ZpmJbv/vEwYm2mCE1jLGUifA=;
        b=VJyctT/x+zRce/NZSijZJTRMvgqSV6vN3YA2eXvSL5MzE5BFAPuw4+o+Vcw//FnVvs
         g+7N9z+N+Qlm+Ze5HcafPlSuFq6H9WPbvEgh3F1xskDFaqK96w3Y/8PXOrzT1bg6msEg
         fCHeWBL4w0rhBH3hwZhro/Epi+PV2/9VElRqgx3L5Cp+lnlcsEdij6TC0YQOkef55C6u
         +S8nVgh8n6dVs1YJaCXBmiJdLwyJ7khMI9zk9Bqw94WcK7pPkNg9Zvk657bdggm10DN2
         ANW4Rm6H/vvS3GQ1W6MenC7d/XVBjgpti3AnsGckSqVoufnxz1uS3f2HEFeoF0xc+U9F
         Nmyw==
X-Gm-Message-State: AOJu0Yzbd2709y47hign2UBH9em2Ogpxb1QQaVlbE3cDebPFu650q6gb
	LmVx2tYhAE6jBHnwuMey5q/JqiOpMC4CM/bA+/jJxCMyjDwXQl12ylNjAvxEgH7XPlWzssU+rDf
	uEvnNr6kHcMQ1PrgK9iUGTYwKyd7GtZkfcb+b6Leh7JuwljGWkldbb+BVAv81aYGdOYMN
X-Gm-Gg: ASbGncvAGDr5LLVdnvALeNTvF8A0Nvp/YLtt+4amijAvJsQn3HQ/8vMyishtFUuWPQt
	m2IyKYNfg8r0whiq9t4gip7CuI5ZhdaFiYa2FlCDVz37CCUmnRsQw9ttuv9vhRM1DCJNOsLFDP7
	+YdWt+d+G60vd5JYxA7MNVlQx4TiUqPWqMCFd2sYk/Bmtr0RPeSaxwDN11+VEHnvnxvdrI9DSTU
	CotxQa+kgadhvZs8tHTziw3osvWENk+oTpjCuCQA/HlTchqnQI4vU6eh8/taHcL4Jv0Y1gopleN
	eT58sSe9rrP++dQ76etMsGZ1D5JCh1Knh/sA2fh5XEhIlTmbok8BbVvEf8tvcceB8QGRE/EPjB5
	X9OQvE5DCLfBX7tk61OluxUK8EgN/UcAFhgFVl61WDHBet5/pKIpwB6PHTg==
X-Received: by 2002:a05:6a20:729f:b0:21a:ec1c:5842 with SMTP id adf61e73a8af0-21ee6897fb7mr25631346637.32.1749563142925;
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXle56quYcGkL187PQrEfR1t2ZC0l/D9zmJLpQ87BsRlsZYNw5ms9DIz4OovX6axzP/0PQPA==
X-Received: by 2002:a05:6a20:729f:b0:21a:ec1c:5842 with SMTP id adf61e73a8af0-21ee6897fb7mr25631310637.32.1749563142543;
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:20 +0530
Subject: [PATCH v5 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-4-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=3796;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=qodg/qJgptXiBp36gN6zPzfmpF/ldoJtnRNBNm4szJw=;
 b=dzDC23v73Zw8FkncgGzm33P7WFmhs7dYkj4tln+4sd/97YIALm0eTFRNI0m1Vf6UZrP3JyaqB
 lNw2I+Z6kk0AxVCstl0NTPuRfMnpKSa8pnZmd8mIlPyyIt+deOONdT1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfX4qG3krs8D00s
 a1B25FyUNjGZCKpS06qfcCwHR3APleCqsXAgdNIln4nVh1XxjsCz8Vii5kvx/9GpArADWgFvCJt
 rtqIkQ9WS+OoDQj7Uk9VJns3YyvDLhZMGXZQA45kPArs8dRS+8xmdfiTI77hA8oSnE1wAue6uz0
 Zi5LHEGXHNrcowYJfJK1TARjtFsWPlR7uihAdLd7A4Dh5z+Euh4G+S84ACjYKlqS3EJiW/iF8nA
 mR5/wb5HBU2S5JGg0bcYh+79wTyaFtv2N+/I+T+EBpA6uRD4kHmrb5XPoNKYJXwn8YyfoKBi6Un
 CnOgSBZAqSxwzhCzFN+BPoBZVXNmSBZL8iN1LWC5rjS2r/u7sFqbSRQPMU/kPF9KV+++PdNxqXh
 n8qpEWQOpe/YcMJTOEg1Q6yt+vvE8QspUYaJdKk3SdnmjtGtcF7CjOOYda9QlIJubejEvUjX
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68483707 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tIxvoA3mxl7b6XSbyz0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: f7TIxrnNTUDCEMSCXnVA2TPJZN24JCI7
X-Proofpoint-ORIG-GUID: f7TIxrnNTUDCEMSCXnVA2TPJZN24JCI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

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
function qcom_wdt_get_bootstatus() to read the restart reason from
IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- Use dev_err_probe instead of dev_err

Changes in v4:
	- Kept only WDIOF_CARDRESET and dropped other codes
	- Renamed qcom_wdt_get_reason_reason() to
	  qcom_wdt_get_bootstatus()
	- Moved the existing check inside qcom_wdt_get_bootstatus()
	- Dropped the device data and put all the details in the DT node

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
 drivers/watchdog/qcom-wdt.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index dfaac5995c84c1f377023e6e62770c5548528a4c..795f409506c6bb1dfb26cd8af18bece3cc35aebf 100644
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
@@ -193,6 +195,42 @@ static const struct qcom_wdt_match_data match_data_kpss = {
 	.max_tick_count = 0xFFFFFU,
 };
 
+static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt)
+{
+	unsigned int args[2];
+	struct regmap *imem;
+	unsigned int val;
+	int ret;
+
+	imem = syscon_regmap_lookup_by_phandle_args(dev->of_node, "sram",
+						    ARRAY_SIZE(args), args);
+	if (IS_ERR(imem)) {
+		ret = PTR_ERR(imem);
+		if (ret != -ENOENT) {
+			dev_err_probe(dev, ret, "Failed to lookup syscon\n");
+			return ret;
+		}
+
+		/* Fallback to the existing check */
+		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
+			wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+		return 0;
+	}
+
+	ret = regmap_read(imem, args[0], &val);
+	if (ret) {
+		dev_err_probe(dev, ret,
+			      "Failed to read the restart reason info\n");
+		return ret;
+	}
+
+	if (val == args[1])
+		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+
+	return 0;
+}
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -273,8 +311,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.parent = dev;
 	wdt->layout = data->offset;
 
-	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
-		wdt->wdd.bootstatus = WDIOF_CARDRESET;
+	ret = qcom_wdt_get_bootstatus(dev, wdt);
+	if (ret)
+		return ret;
 
 	/*
 	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second

-- 
2.34.1


