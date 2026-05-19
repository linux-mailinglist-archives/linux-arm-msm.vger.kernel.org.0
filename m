Return-Path: <linux-arm-msm+bounces-108461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ks+/JqdCDGr/cAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:59:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3A57D0C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3A5032568AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C913F4DD4;
	Tue, 19 May 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYM8hqY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvW8Qv81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99F3F1AD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187830; cv=none; b=IzmIo1wyUgON18DpvKUOG1fbNM/RG5aqdQ9ZXnVBnwcHNG/0+bJFYwC4iVPXYlE7aI2r9vtR68dh9CdR+ukbpzrYmTV7fCvdMx3gThaJ+rOJFbePpPltmQ+tG2GKLMllmKq4reCQEksmlj3SW1lRwV8kCaiT2NIfDVBW6y1Qz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187830; c=relaxed/simple;
	bh=xhw0n2H0Ogr+XnpwObolDrQSmi6BKJK6KkfSM4an7WY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lirDrW69VLWQ/qS/ObQdrwQkYlImu/sz+HtGC61/Ll3AugWu7pFwuzRMKngHYwl3tLhiV2aN8KT74AV0rWrN5iA5gbznQhvQuWscMEaDw9mymt+oZgtT6WNIEY4XMsv62nQNXXwrg+YDDobTpukll4jr72pkQTNeSQm/vByUtrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYM8hqY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvW8Qv81; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA3CON1393139
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V7T5CBk0nxF6/mjhsou1VVPhQADaS6NTxrViWTKFrq0=; b=TYM8hqY2yZXiMZee
	nLDqz1tEExBtPkJqqcUHMC0afRCg6LuPralfc4xxJdU4uwP6UhDNKu+F7AYJ8BNY
	AYaQZiEXsSYfaiI8DfiU7oa81r67VXaZCetP9C9/IT2NcAGsmRKmt6zwe4rmI1UP
	SNgcFypneqWocdi9AqBw+CfJ9VN5ji1lTc18Uo21NOsHnG5FenuROewTESydtlK8
	3SgPtZxHmOUvx33+8rDraad6gS/CDxZNQGeI0My/kaZzmoMwZXxh7sO0igpouObY
	6i1A9XMREPxHY2/ZYPCwRAwywbjV/1C5WcAvcSKrey+BxpwLV/YUkd0A7huDWuNQ
	SqhGvQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns4861a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:50:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso2152311b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187826; x=1779792626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7T5CBk0nxF6/mjhsou1VVPhQADaS6NTxrViWTKFrq0=;
        b=GvW8Qv818zKnCP4JuJUhApyMG8Ay0qJrjdZ0E1ssfG/XtnB2cV0Tqknq1FLXso1N2A
         P/NbpOdybRdcNUb700rPCSxxYWZaU2TT92659e5TJT9F1EhvNfl2O+OGatIolypj29qz
         2Rg4GTRAapAtv4z2I70dWllsrX/044kTS5gREejWaNuyuICbHPeUOb2hu7+1Ynfo7V5c
         7xo/8M2PNaldjgWyP1ZvAQvlpT5lbUdi/9qZ3cCb1M8Xlb12IcAUXU2mryeyEJnpri9g
         wjgEhVwyYkY+Pz7AapG0FwzqDDsGD2XCKIjM4aHOGpodPuVWoag/bBOiQkOdKbZuLbzl
         XAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187826; x=1779792626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V7T5CBk0nxF6/mjhsou1VVPhQADaS6NTxrViWTKFrq0=;
        b=Eg5dhs8NHObIskmDN/nhemnHYFq4YENFCKldq2WvOWYqcvpSi7H7rRorvtfEdqtJV9
         YfrNpuqlUBZnnAlheJvreGIZ8nFvFVw4j2swzUlPpH3XeESA20rainu3PqGJrUGSAXPC
         +KazWcFYxDUYx4UPhMHxJ6VX+P8Ezxogx4KJvYCU7j21a9WcKdQ5QJzuNO3jT9716+mB
         BzfUHvseAV8ZHH+fGb0oa4JPVV8ZqPgiXWqeQF4OWAl388TL/o1FAp+D2oY4oOwkM0eJ
         fSVxwmOk0is5U6w+n5aDfaqiTwK9vRUUgI+SIiUmNIDaeiSLjYfO8/Oq0XBYwi/qWDJd
         0bhg==
X-Gm-Message-State: AOJu0Yw1iLv2/v4z5A+Ab83d5sjjLXbrGMsME63w0IzQVPaz+NLVaqlX
	AW7HToI51pdEwqHZZcslu+VXGJqWrf+PbQ8KioZdi+L1mua2eNFMKE3Picr1SsXYYA5o9CFWx5h
	nLg1YakJDi7TbLQ9i0p6yOgl26gsHfHamZ7IhbC8vQJlJphD02kNBWKTdbRyibj1/NQt0MTefB4
	YV
X-Gm-Gg: Acq92OFEgzmmeoLpQdkP9Olu40xlnhqo7eEIJFIS/QA7W+GHh0P+u6qw6Z6qaSOWFYz
	x/kGsHecyhCBD3NkPK8ZPM4z0+j7YMawa8zkY9cH9jHimiJUv1MJfwqPeEXfXQiG/+1mQLCLlS5
	7zP5hbnbTn1znUhDTyjbhSUNXZet/9TuMhAot1Kis6HP1hIOSS6A6/CecBXU3B5t4t/WD7n3+sm
	Pju3KB7sjkRtA4rF4P9RQ1qWG6quT0lEmHHyXwSpMcr+U4FRXYsaaiXVZgdHfF8MjVuJpnTJ6Kj
	qcCpDWBqHHmpuVfB4xGbQ+dIC9rnIhBjTVI7Jy9HiwQrRDHm/6tE5zMBx7NOa/0Yib008cXXAVq
	kEzZD8qtE2KVi3GBleD7IT60ArR1LQ1nZm+zZ4GQ0963eJTXyS/jfbHnF
X-Received: by 2002:a05:6a00:a203:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-83f33d9de2dmr18978509b3a.25.1779187826072;
        Tue, 19 May 2026 03:50:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-83f33d9de2dmr18978463b3a.25.1779187825263;
        Tue, 19 May 2026 03:50:25 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm20877879b3a.61.2026.05.19.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:50:24 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:19:50 +0530
Subject: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187810; l=23185;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=xhw0n2H0Ogr+XnpwObolDrQSmi6BKJK6KkfSM4an7WY=;
 b=upVBkGmk6KILkog95QPtcpBtHGHbFbY68UikQvYkLhz9wJGFxPH5+ymnK70MlqzZSk0qwj6oW
 W2EgM7hVQ4iAyxGkkAVduLczyUpq/NIb8SIInXpQ+vvghbVJkXOdeyK
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNSBTYWx0ZWRfX7VOAyf6oEzd/
 mYu3/Xt/HsgNvIL9/KOBX2edXYXngD6B+ty32gzfg5npeSxmLnQ0KMVCN/XvblSv6aZc+GGXJmt
 +W5g5ybWjVphuiyLX5ieDe/+jmczVBtbui0Eh05eNNKUaab3+LJ8ZyMTzBaXNvSCYX7wuQOFDxo
 AUoyTJfv/3vwo/Y7MTFiI39RIR9o06Bn2JunPunWwiVMRfRXvfw3bbK2ZSITJXDZb9YaugPbix2
 9QXls+1pBDohIRXqz3U+dfy4SAJkoQEQXhzh74g2mmJUaWIOLlChXaYIiXIhCvOsd8a71xy36O9
 NOnWkOBI7Yqmj48/aoTNc/IygZZh/TEzKcJMansXWOqIdfg0C7bAE69Ayx+5bo3mNZ6KVGu2Vpc
 3a4KktLMVtsPG4gzYCf5Ma1tLTJ83TxnSQLbIWhepPDeQZ4GU1+sXOo+LDjOoP6839K6pk7X/Qq
 rvnnUPoKvtWw1YoxgBw==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c4073 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KhCOZ2j7RViXKUWDOLQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7usva__NfEBcR8KjaR_JB4A5MHlHCyhB
X-Proofpoint-ORIG-GUID: 7usva__NfEBcR8KjaR_JB4A5MHlHCyhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108461-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F2C3A57D0C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems.

The driver integrates with the Linux powercap framework, exposing SPEL
capabilities through powercap sysfs interfaces.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 MAINTAINERS                  |   1 +
 drivers/powercap/Kconfig     |  13 +
 drivers/powercap/Makefile    |   1 +
 drivers/powercap/qcom_spel.c | 787 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 802 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c63f147e8c54..5c7542754ab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22238,6 +22238,7 @@ M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
+F:	drivers/powercap/qcom_spel.c
 
 QUALCOMM PPE DRIVER
 M:	Luo Jie <quic_luoj@quicinc.com>
diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
index 03c4c796d993..e3a47c653499 100644
--- a/drivers/powercap/Kconfig
+++ b/drivers/powercap/Kconfig
@@ -93,4 +93,17 @@ config DTPM_DEVFREQ
 	help
 	  This enables support for device power limitation based on
 	  energy model.
+
+config QCOM_SPEL
+	tristate "Qualcomm SPEL Powercap driver"
+	depends on ARM64 || COMPILE_TEST
+	help
+	  This enables support for the Qualcomm SoC Power and Electrical
+	  Limits (SPEL) hardware, which allows power limits to be
+	  enforced and monitored on Qualcomm SoCs.
+
+	  SPEL provides energy monitoring and power capping for multiple
+	  domains including system, SoC, CPU clusters, GPU, and various
+	  other subsystems.
+
 endif
diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
index 5ab0dce565b9..8235fb9d3df6 100644
--- a/drivers/powercap/Makefile
+++ b/drivers/powercap/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_INTEL_RAPL) += intel_rapl_msr.o
 obj-$(CONFIG_INTEL_RAPL_TPMI) += intel_rapl_tpmi.o
 obj-$(CONFIG_IDLE_INJECT) += idle_inject.o
 obj-$(CONFIG_ARM_SCMI_POWERCAP) += arm_scmi_powercap.o
+obj-$(CONFIG_QCOM_SPEL) += qcom_spel.o
diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
new file mode 100644
index 000000000000..fed5647959a5
--- /dev/null
+++ b/drivers/powercap/qcom_spel.c
@@ -0,0 +1,787 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm SPEL (SoC Power and Electrical Limits) Driver
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/powercap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/* SPEL register bitmasks */
+#define ENERGY_STATUS_MASK		0xFFFFFFFF
+
+#define POWER_LIMIT_MASK		0x00007FFF
+#define POWER_LIMIT_ENABLE		BIT(31)
+
+#define TIME_WINDOW_MASK_L		0x00007FFF	/* bits [14:0] */
+#define TIME_WINDOW_MASK_H		0x007F0000	/* bits [22:16] */
+
+#define ENERGY_UNIT_OFFSET		16
+#define ENERGY_UNIT_MASK		0xF0000
+
+#define TIME_UNIT_OFFSET		8
+#define TIME_UNIT_MASK			0xF00
+
+#define POWER_UNIT_OFFSET		0
+#define POWER_UNIT_MASK			0x7
+
+#define LIMITS_CAPABILITY_OFFSET	0x20
+#define ENERGY_RPT_UNIT_OFFSET		0x04
+
+#define ENERGY_UNIT_SCALE		1000
+
+#define SPEL_DOMAIN_NAME_LENGTH		16
+
+/* Domain types */
+enum spel_domain_type {
+	SPEL_DOMAIN_SYS,
+	SPEL_DOMAIN_SOC,
+	SPEL_DOMAIN_CL0,
+	SPEL_DOMAIN_CL1,
+	SPEL_DOMAIN_CL2,
+	SPEL_DOMAIN_IGPU,
+	SPEL_DOMAIN_DGPU,
+	SPEL_DOMAIN_NSP,
+	SPEL_DOMAIN_MMCX,
+	SPEL_DOMAIN_INFRA,
+	SPEL_DOMAIN_DRAM,
+	SPEL_DOMAIN_MDM,
+	SPEL_DOMAIN_WLAN,
+	SPEL_DOMAIN_USB1,
+	SPEL_DOMAIN_USB2,
+	SPEL_DOMAIN_USB3,
+	SPEL_DOMAIN_MAX,
+};
+
+/* Power limit IDs */
+enum spel_power_limit_id {
+	POWER_LIMIT1,
+	POWER_LIMIT2,
+	POWER_LIMIT3,
+	POWER_LIMIT4,
+	NR_POWER_LIMITS,
+};
+
+/* Unit types for conversion */
+enum unit_type {
+	POWER_UNIT,
+	ENERGY_UNIT,
+	TIME_UNIT,
+};
+
+/* Power limit operation types */
+enum pl_ops_type {
+	PL_LIMIT,
+	PL_TIME_WINDOW,
+};
+
+static const char *pl_names[NR_POWER_LIMITS] = {
+	[POWER_LIMIT1] = "pl1",
+	[POWER_LIMIT2] = "pl2",
+	[POWER_LIMIT3] = "pl3",
+	[POWER_LIMIT4] = "pl4",
+};
+
+static const char *const spel_domain_names[] = {
+	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
+	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
+};
+
+/* Domain register offsets in node base */
+static const u32 domain_offsets[SPEL_DOMAIN_MAX] = {
+	[SPEL_DOMAIN_SYS]	= 0x40,
+	[SPEL_DOMAIN_SOC]	= 0x00,
+	[SPEL_DOMAIN_CL0]	= 0x5C,
+	[SPEL_DOMAIN_CL1]	= 0x60,
+	[SPEL_DOMAIN_CL2]	= 0x64,
+	[SPEL_DOMAIN_IGPU]	= 0x08,
+	[SPEL_DOMAIN_DGPU]	= 0x44,
+	[SPEL_DOMAIN_NSP]	= 0x0C,
+	[SPEL_DOMAIN_MMCX]	= 0x10,
+	[SPEL_DOMAIN_INFRA]	= 0x18,
+	[SPEL_DOMAIN_DRAM]	= 0x1C,
+	[SPEL_DOMAIN_MDM]	= 0x48,
+	[SPEL_DOMAIN_WLAN]	= 0x4C,
+	[SPEL_DOMAIN_USB1]	= 0x50,
+	[SPEL_DOMAIN_USB2]	= 0x54,
+	[SPEL_DOMAIN_USB3]	= 0x58,
+};
+
+/**
+ * struct spel_constraint_info - Power limit constraint information
+ * @limit_offset:	Register offset for power limit value
+ * @time_window_offset:	Register offset for time window
+ * @supported_mask:	Bit mask in capability register
+ * @domain_id:		Domain this constraint applies to
+ * @pl_id:		Power limit ID (PL1, PL2, etc.)
+ */
+struct spel_constraint_info {
+	u32 limit_offset;
+	u32 time_window_offset;
+	u32 supported_mask;
+	enum spel_domain_type domain_id;
+	int pl_id;
+};
+
+/* Constraint configuration */
+static struct spel_constraint_info constraints[] = {
+	/* SYS domain constraints */
+	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
+	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
+	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
+	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
+	/* SOC domain constraints */
+	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
+	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
+	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
+	{ 0x0C, 0x6C, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
+};
+
+struct spel_system;
+
+/**
+ * struct spel_domain - SPEL power domain
+ * @power_zone:		Powercap zone
+ * @lock:		Mutex protecting register access
+ * @sp:			Parent system
+ * @status_reg:		Energy counter register
+ * @pl_name:		Power limit names
+ * @name:		Domain name
+ * @id:			Domain type ID
+ */
+struct spel_domain {
+	struct powercap_zone power_zone;
+	struct mutex lock; /* Protects register read/write operations */
+	struct spel_system *sp;
+	void __iomem *status_reg;
+	const char *pl_name[NR_POWER_LIMITS];
+	char name[SPEL_DOMAIN_NAME_LENGTH];
+	enum spel_domain_type id;
+};
+
+/**
+ * struct spel_system -	SPEL system
+ * @domains:		Array of domains
+ * @power_zone:		Parent powercap zone
+ * @node_base:		Base address for node registers
+ * @constraint_base:	Base address for constraint registers
+ * @config_base:	Base address for config registers
+ * @control_type:	Powercap control type
+ * @dev:		Device pointer for logging
+ * @limits:		Supported power limits per domain
+ * @power_unit:		Power unit in microWatts (common for all domains)
+ * @energy_unit:	Energy unit in nanoJoules (common for all domains)
+ * @time_unit:		Time unit in microseconds (common for all domains)
+ */
+struct spel_system {
+	struct spel_domain *domains;
+	struct powercap_zone *power_zone;
+	void __iomem *node_base;
+	void __iomem *constraint_base;
+	void __iomem *config_base;
+	struct powercap_control_type *control_type;
+	struct device *dev;
+	int limits[SPEL_DOMAIN_MAX];
+	unsigned int power_unit;
+	unsigned int energy_unit;
+	unsigned int time_unit;
+};
+
+#define power_zone_to_spel_domain(_zone) \
+	container_of(_zone, struct spel_domain, power_zone)
+
+/* Helper functions */
+static bool is_pl_valid(struct spel_domain *sd, int pl)
+{
+	if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
+		return false;
+	return sd->pl_name[pl] ? true : false;
+}
+
+static int get_pl_ops_offset(struct spel_domain *sd, int pl, enum pl_ops_type pl_op)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(constraints); i++) {
+		struct spel_constraint_info *ci = &constraints[i];
+
+		if (ci->domain_id == sd->id && ci->pl_id == pl) {
+			switch (pl_op) {
+			case PL_LIMIT:
+				return ci->limit_offset;
+			case PL_TIME_WINDOW:
+				return ci->time_window_offset;
+			default:
+				return -EOPNOTSUPP;
+			}
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
+			   u64 value, int to_raw)
+{
+	struct spel_system *sp = sd->sp;
+	u64 units = 1;
+	u64 scale = 1;
+
+	switch (type) {
+	case POWER_UNIT:
+		units = sp->power_unit;
+		break;
+	case ENERGY_UNIT:
+		scale = ENERGY_UNIT_SCALE;
+		units = sp->energy_unit;
+		break;
+	case TIME_UNIT:
+		units = sp->time_unit;
+		break;
+	default:
+		return value;
+	}
+
+	if (to_raw)
+		return div64_u64(value * scale, units);
+
+	value *= units;
+	return div64_u64(value, scale);
+}
+
+/* Power limit data access */
+static int spel_read_pl_data(struct spel_domain *sd, int pl,
+			     enum pl_ops_type pl_op, bool xlate, u64 *data)
+{
+	struct spel_system *sp = sd->sp;
+	void __iomem *reg_addr;
+	u64 value;
+	int offset;
+
+	if (!is_pl_valid(sd, pl))
+		return -EINVAL;
+
+	offset = get_pl_ops_offset(sd, pl, pl_op);
+	if (offset < 0)
+		return offset;
+
+	guard(mutex)(&sd->lock);
+
+	reg_addr = sp->constraint_base + offset;
+	value = readl(reg_addr);
+
+	switch (pl_op) {
+	case PL_LIMIT:
+		value &= POWER_LIMIT_MASK;
+		if (xlate)
+			*data = spel_unit_xlate(sd, POWER_UNIT, value, 0);
+		else
+			*data = value;
+		break;
+	case PL_TIME_WINDOW:
+		/* Decode time window: bits [22:16] are upper 7 bits, [14:0] are lower 15 bits */
+		value = ((value & TIME_WINDOW_MASK_H) >> 16 << 15) |
+			(value & TIME_WINDOW_MASK_L);
+		if (xlate)
+			*data = spel_unit_xlate(sd, TIME_UNIT, value, 0);
+		else
+			*data = value;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int spel_write_pl_data(struct spel_domain *sd, int pl,
+			      enum pl_ops_type pl_op, unsigned long long value)
+{
+	struct spel_system *sp = sd->sp;
+	void __iomem *reg_addr;
+	u64 reg_val, new_val;
+	int offset;
+
+	if (!is_pl_valid(sd, pl))
+		return -EINVAL;
+
+	offset = get_pl_ops_offset(sd, pl, pl_op);
+	if (offset < 0)
+		return offset;
+
+	guard(mutex)(&sd->lock);
+
+	reg_addr = sp->constraint_base + offset;
+	reg_val = readl(reg_addr);
+
+	switch (pl_op) {
+	case PL_LIMIT:
+		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
+		if (new_val > POWER_LIMIT_MASK)
+			return -EINVAL;
+		reg_val = (reg_val & ~POWER_LIMIT_MASK) | new_val;
+
+		/*
+		 * Enable/Disable PL based on the value:
+		 * - If value is 0, disable the PL (clear enable bit)
+		 * - If value is non-zero, enable the PL (set enable bit)
+		 */
+		if (new_val == 0)
+			reg_val &= ~POWER_LIMIT_ENABLE;
+		else
+			reg_val |= POWER_LIMIT_ENABLE;
+		break;
+	case PL_TIME_WINDOW:
+		/*
+		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
+		 * Time window register is separate from limit register (different offset),
+		 * so we write only the time window bits without preserving any enable bit.
+		 */
+		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
+		reg_val = (((new_val >> 15) & 0x7F) << 16) |
+			  (new_val & 0x7FFF);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	writel(reg_val, reg_addr);
+	return 0;
+}
+
+/* Powercap zone operations */
+static int spel_get_energy_counter(struct powercap_zone *power_zone, u64 *energy_raw)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 value;
+
+	value = readl(sd->status_reg);
+	*energy_raw = spel_unit_xlate(sd, ENERGY_UNIT, value, 0);
+
+	return 0;
+}
+
+static int spel_get_max_energy_counter(struct powercap_zone *pcd_dev, u64 *energy)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(pcd_dev);
+
+	*energy = spel_unit_xlate(sd, ENERGY_UNIT, ENERGY_STATUS_MASK, 0);
+	return 0;
+}
+
+static int spel_release_zone(struct powercap_zone *power_zone)
+{
+	return 0;
+}
+
+static int spel_find_nr_power_limit(struct spel_domain *sd)
+{
+	int i, nr_pl = 0;
+
+	for (i = 0; i < NR_POWER_LIMITS; i++) {
+		if (is_pl_valid(sd, i))
+			nr_pl++;
+	}
+
+	return nr_pl;
+}
+
+static const struct powercap_zone_ops zone_ops = {
+	.get_energy_uj = spel_get_energy_counter,
+	.get_max_energy_range_uj = spel_get_max_energy_counter,
+	.release = spel_release_zone,
+};
+
+/* Constraint operations */
+static int spel_constraint_to_pl(struct spel_domain *sd, int cid)
+{
+	int i, j;
+
+	for (i = POWER_LIMIT1, j = 0; i < NR_POWER_LIMITS; i++) {
+		if (is_pl_valid(sd, i) && j++ == cid)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int spel_set_power_limit(struct powercap_zone *power_zone, int cid,
+				u64 power_limit)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	return spel_write_pl_data(sd, id, PL_LIMIT, power_limit);
+}
+
+static int spel_get_power_limit(struct powercap_zone *power_zone, int cid,
+				u64 *data)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 val;
+	int ret, id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	ret = spel_read_pl_data(sd, id, PL_LIMIT, true, &val);
+	if (!ret)
+		*data = val;
+
+	return ret;
+}
+
+static int spel_set_time_window(struct powercap_zone *power_zone, int cid,
+				u64 window)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	return spel_write_pl_data(sd, id, PL_TIME_WINDOW, window);
+}
+
+static int spel_get_time_window(struct powercap_zone *power_zone, int cid,
+				u64 *data)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	u64 val;
+	int ret, id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id < 0)
+		return id;
+
+	ret = spel_read_pl_data(sd, id, PL_TIME_WINDOW, true, &val);
+	if (!ret)
+		*data = val;
+
+	return ret;
+}
+
+static const char *spel_get_constraint_name(struct powercap_zone *power_zone,
+					    int cid)
+{
+	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
+	int id;
+
+	id = spel_constraint_to_pl(sd, cid);
+	if (id >= 0)
+		return sd->pl_name[id];
+
+	return NULL;
+}
+
+static const struct powercap_zone_constraint_ops constraint_ops = {
+	.set_power_limit_uw = spel_set_power_limit,
+	.get_power_limit_uw = spel_get_power_limit,
+	.set_time_window_us = spel_set_time_window,
+	.get_time_window_us = spel_get_time_window,
+	.get_name = spel_get_constraint_name,
+};
+
+static void spel_init_domains(struct spel_system *sp)
+{
+	unsigned int i;
+
+	for (i = 0; i < SPEL_DOMAIN_MAX; i++) {
+		struct spel_domain *sd = &sp->domains[i];
+
+		sd->sp = sp;
+		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
+			 spel_domain_names[i]);
+		sd->id = i;
+		sd->status_reg = sp->node_base + domain_offsets[i];
+
+		/* PL1 is always supported (required for powercap registration) */
+		sp->limits[i] = BIT(POWER_LIMIT1);
+		sd->pl_name[POWER_LIMIT1] = pl_names[POWER_LIMIT1];
+	}
+}
+
+static int spel_check_unit(struct spel_system *sp)
+{
+	u32 value, shift;
+
+	/* Read power_unit and time_unit from offset 0x0 */
+	value = readl(sp->config_base);
+
+	/*
+	 * Unit calculation: 1 / (2^shift)
+	 * Masks limit: TIME_UNIT (4 bits, max 15), POWER_UNIT (3 bits, max 7).
+	 */
+	shift = (value & POWER_UNIT_MASK) >> POWER_UNIT_OFFSET;
+	sp->power_unit = 1000000 / (1 << shift);
+
+	shift = (value & TIME_UNIT_MASK) >> TIME_UNIT_OFFSET;
+	sp->time_unit = 1000000 / (1 << shift);
+
+	/* Read energy_unit from ENERGY_RPT_UNIT_OFFSET */
+	value = readl(sp->config_base + ENERGY_RPT_UNIT_OFFSET);
+
+	/*
+	 * Unit calculation: 1 / (2^shift)
+	 * Masks limit: ENERGY_UNIT (4 bits, max 15).
+	 */
+	shift = (value & ENERGY_UNIT_MASK) >> ENERGY_UNIT_OFFSET;
+	sp->energy_unit = ENERGY_UNIT_SCALE * 1000000 / (1 << shift);
+
+	dev_dbg(sp->dev, "Units: energy=%dnJ, time=%dus, power=%duW\n",
+		sp->energy_unit, sp->time_unit, sp->power_unit);
+
+	return 0;
+}
+
+static void spel_detect_powerlimit(struct spel_domain *sd)
+{
+	struct spel_system *sp = sd->sp;
+	u32 capabilities;
+	int i, j;
+
+	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
+
+	/* Detect power limits from hardware capabilities */
+	for (i = POWER_LIMIT2; i < NR_POWER_LIMITS; i++) {
+		for (j = 0; j < ARRAY_SIZE(constraints); j++) {
+			struct spel_constraint_info *ci = &constraints[j];
+
+			if (ci->domain_id == sd->id && ci->pl_id == i) {
+				if (capabilities & ci->supported_mask) {
+					sp->limits[sd->id] |= BIT(i);
+					sd->pl_name[i] = pl_names[i];
+				}
+				break;
+			}
+		}
+	}
+}
+
+static int spel_init_system(struct spel_system *sp, struct device *dev)
+{
+	int i, ret;
+
+	/* Read unit configuration (common for all domains) */
+	ret = spel_check_unit(sp);
+	if (ret) {
+		dev_err(dev, "Failed to read unit config\n");
+		return ret;
+	}
+
+	sp->domains = devm_kcalloc(dev, SPEL_DOMAIN_MAX,
+				   sizeof(struct spel_domain), GFP_KERNEL);
+	if (!sp->domains)
+		return -ENOMEM;
+
+	spel_init_domains(sp);
+
+	for (i = 0; i < SPEL_DOMAIN_MAX; i++) {
+		struct spel_domain *sd = &sp->domains[i];
+
+		ret = devm_mutex_init(dev, &sd->lock);
+		if (ret) {
+			dev_err(dev, "Failed to initialize mutex for domain %s\n", sd->name);
+			return ret;
+		}
+
+		spel_detect_powerlimit(sd);
+	}
+
+	return 0;
+}
+
+static int spel_register_powercap(struct spel_system *sp)
+{
+	struct spel_domain *sd;
+	struct powercap_zone *power_zone = NULL;
+	int nr_pl, ret, i;
+
+	/* Register SYS domain as parent zone */
+	for (sd = sp->domains; sd < sp->domains + SPEL_DOMAIN_MAX; sd++) {
+		if (sd->id == SPEL_DOMAIN_SYS) {
+			nr_pl = spel_find_nr_power_limit(sd);
+
+			power_zone = powercap_register_zone(&sd->power_zone,
+							    sp->control_type, sd->name,
+					NULL, &zone_ops, nr_pl,
+					&constraint_ops);
+			if (IS_ERR(power_zone)) {
+				dev_err(sp->dev, "Failed to register power zone %s\n",
+					sd->name);
+				return PTR_ERR(power_zone);
+			}
+			sp->power_zone = power_zone;
+			break;
+		}
+	}
+
+	if (!power_zone) {
+		dev_err(sp->dev, "No SYS domain found\n");
+		return -ENODEV;
+	}
+
+	/* Register other domains as children */
+	for (sd = sp->domains; sd < sp->domains + SPEL_DOMAIN_MAX; sd++) {
+		struct powercap_zone *parent = sp->power_zone;
+
+		if (sd->id == SPEL_DOMAIN_SYS)
+			continue;
+
+		/* SOC is child of SYS, others are children of SOC */
+		if (sd->id != SPEL_DOMAIN_SOC) {
+			for (i = 0; i < SPEL_DOMAIN_MAX; i++) {
+				if (sp->domains[i].id == SPEL_DOMAIN_SOC) {
+					parent = &sp->domains[i].power_zone;
+					break;
+				}
+			}
+		}
+
+		nr_pl = spel_find_nr_power_limit(sd);
+		power_zone = powercap_register_zone(&sd->power_zone,
+						    sp->control_type,
+						    sd->name, parent,
+						    &zone_ops, nr_pl,
+						    &constraint_ops);
+
+		if (IS_ERR(power_zone)) {
+			dev_err(sp->dev, "Failed to register power_zone %s\n",
+				sd->name);
+			ret = PTR_ERR(power_zone);
+			goto err_cleanup;
+		}
+	}
+
+	return 0;
+
+err_cleanup:
+	/* Unregister in reverse order: children first, then SOC, then SYS */
+	for (i = (int)(sd - sp->domains) - 1; i >= 0; i--)
+		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
+
+	return ret;
+}
+
+static int spel_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spel_system *sp;
+	struct resource *res;
+	int ret;
+
+	sp = devm_kzalloc(dev, sizeof(*sp), GFP_KERNEL);
+	if (!sp)
+		return -ENOMEM;
+
+	sp->dev = dev;
+
+	/* Map spel domain registers (energy counters) */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nodes");
+	if (!res) {
+		dev_err(dev, "Failed to get nodes resource\n");
+		return -EINVAL;
+	}
+	sp->node_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(sp->node_base))
+		return PTR_ERR(sp->node_base);
+
+	/* Map constraint registers (power limits) */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "constraints");
+	if (!res) {
+		dev_err(dev, "Failed to get constraints resource\n");
+		return -EINVAL;
+	}
+	sp->constraint_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(sp->constraint_base))
+		return PTR_ERR(sp->constraint_base);
+
+	/* Map config registers (units, capabilities) */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
+	if (!res) {
+		dev_err(dev, "Failed to get config resource\n");
+		return -EINVAL;
+	}
+	sp->config_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(sp->config_base))
+		return PTR_ERR(sp->config_base);
+
+	sp->control_type = powercap_register_control_type(NULL, "qcom-spel",
+							  NULL);
+	if (IS_ERR(sp->control_type)) {
+		dev_err(dev, "Failed to register control type\n");
+		return PTR_ERR(sp->control_type);
+	}
+
+	/* Initialize system and domains */
+	ret = spel_init_system(sp, dev);
+	if (ret) {
+		dev_err(dev, "Failed to initialize system\n");
+		goto err_unregister_control;
+	}
+
+	ret = spel_register_powercap(sp);
+	if (ret) {
+		dev_err(dev, "Failed to register powercap zones\n");
+		goto err_unregister_control;
+	}
+
+	platform_set_drvdata(pdev, sp);
+
+	return 0;
+
+err_unregister_control:
+	powercap_unregister_control_type(sp->control_type);
+	return ret;
+}
+
+static void spel_remove(struct platform_device *pdev)
+{
+	struct spel_system *sp = platform_get_drvdata(pdev);
+	int i;
+
+	if (!sp)
+		return;
+
+	/* Unregister in reverse order: children first, then SOC, then SYS */
+	for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
+		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
+
+	powercap_unregister_control_type(sp->control_type);
+}
+
+static const struct of_device_id spel_of_match[] = {
+	{ .compatible = "qcom,spel" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spel_of_match);
+
+static struct platform_driver spel_driver = {
+	.probe = spel_probe,
+	.remove = spel_remove,
+	.driver = {
+		.name = "qcom_spel",
+		.of_match_table = spel_of_match,
+	},
+};
+
+module_platform_driver(spel_driver);
+
+MODULE_DESCRIPTION("Qualcomm SPEL Powercap Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


