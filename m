Return-Path: <linux-arm-msm+bounces-44957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3856A1001F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEC71888549
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD4623C6FA;
	Tue, 14 Jan 2025 05:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k69kXcRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C523497C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831154; cv=none; b=gTr3eKCc6K2QhObhdB1K2E91XDDjIs52W61atiwoD1IY7QgsHlsOVHxuN7zuLUwUVO9AnAsigG2bIzgP2AmlzVIcPd5bf5EowWic7plu/gB4KVZWQM/izPY4aVNwbldoUjPBTg/rlQsf8Yg4x92v+8DjIUYk3sTLsOuGhhRiack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831154; c=relaxed/simple;
	bh=+7T+W0npzIsClEByBimGQWCrPRhW5Rfaa7ea0jwJn8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dT/4z+MiWLKk/VrWEUbz72pG//A8AXinqaAHWBGFZuMsJaLPNNn1zKz4xcxf3OWLCR5p0bbWS/fSxGcVVbeTOTfsEGmNIcsH+Tr4XsQiz3PwlzFsEYiX+p/srgsdcogUyiQcY+AQicGnUKBoeQNHM88wo/b4yNIUBe8suK/f9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k69kXcRx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKsOmB026165
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+2fy3/LK/7hee4NhdhsAUZpisJu9Q29FyDFunFTLIA=; b=k69kXcRxfiRRI5Nc
	RpNKXv1rXYeBjOR2vHl9buk0+l7fhlwMXY0HPW86wCSPJtTUqBNrKjeE0VSgu0/U
	HW0KrLbRKQzky0SVy0VckqE7YgLtlkEuLvBaWsQ5GCb9yCvDrASczpfpNXoXRY3B
	WNdt2vDrdgLxRaetk7dTUNly9RHiZKYIfGWDKIfmvygDwJNXfDuHueK2ExOoEWWr
	KQ2gQCLhs0PRpXxbxKekApx/GQR9eRocbg3HyhEzF2fXV7kLy+CT1IMG3QdXHysf
	zfqkCUib5I2hlyfY7sCD0WGN/ubU9j3CMCjmllX+IWJUey/FGm6c3RCb97Hmvynk
	OSWotw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a928v6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:05:49 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-71fc1df4bb5so3044219a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831148; x=1737435948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+2fy3/LK/7hee4NhdhsAUZpisJu9Q29FyDFunFTLIA=;
        b=WxpJFCGqWFOPksc62284nDQ6fBEu2rXyf0byiRxCwb9MruBm4EfV+5FDzdHUorPk6v
         xqXAOADCU2zJ9s4uhZpp42RYf/zttey1m8j9kSHdyxkiD2IHlu0RJNJeBmV7E4pwCeDk
         xarrSE3fOPnhtWKlCvm3ZCyL46MmDrnDu3N+/NfKVLJnZ9OXcLCa3dWV7IMEZOAACZvu
         FIwdAI6tHmyv03AVQYduBoa9SIYG7j8MLJ4dIVfWxbxoQuIsJlr061Htk+EUsR8QQ2dz
         dYrfiElOmiidgupypbjeXI1L5uz1PFhjjMfKMZYhsdGFrTQTTgrBzDuwO/6SaUBr9ovB
         i5jA==
X-Gm-Message-State: AOJu0YyreOjruspPJC5UU/FlsKRviqNlqPKFzXCMCVe/olTieiu9BN7L
	RuJOQyJZor7xGLnqEzmjQYWk+D/hVWoSSeqRHbuK9qnyk23tw9/EeMfKt6pXeJ5lKZPlnmkk75/
	j6tER4Wfn0+BkvrITo7jz6KiFfawoXhRpubvuBBUC+GAdrUvnvRcvtxaV4/xBMK6I
X-Gm-Gg: ASbGncu4Ex+QzCSvSn6Gf8YDVre/0EtrtDNPLpgG2a0tXf+fn0hcMK/s9RVzINDUJ2N
	W9WmF+4DmNEfYRUlHNyTd8Bn8CiJZC/+hK8tES4tJyksQ751p5eyjypYxBa8KTBw4FhMYzFTWzm
	9UtC0TeX1EATGkB67Jg9vB+Hm6zrWy657e9xdVbDkqjOP7M+Midw/5l0APqAAAJcG1r1aYkN9wJ
	y3578uAuCYgS+75648v4PI4h0eMEYxYH/2oFq0qfH0/jl8L1N3KW/ng+yCTvnpFj+sAk4udFFAG
	CHCvlEABQI1k6fErH1kL56zuFSBOFcFDiSr44+IlLlCnqNcuWE2l5AcP
X-Received: by 2002:a05:6830:678e:b0:71d:fc52:1ab6 with SMTP id 46e09a7af769-721e2e9b660mr15257970a34.23.1736831148571;
        Mon, 13 Jan 2025 21:05:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/kSyD1OtHatXV7bU0pa748PZBDxc+nss+I9GrvkOdP+CQM86cfz3KVsLY33vBqQgvSikgPw==
X-Received: by 2002:a05:6830:678e:b0:71d:fc52:1ab6 with SMTP id 46e09a7af769-721e2e9b660mr15257954a34.23.1736831148185;
        Mon, 13 Jan 2025 21:05:48 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:47 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:37 -0800
Subject: [PATCH v3 04/12] of: overlays: Introduce dwc3 flattening overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-4-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9764;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=+7T+W0npzIsClEByBimGQWCrPRhW5Rfaa7ea0jwJn8U=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVTsZSh8RjRlN+dbQqiOg8NYoBdj/N1uddm
 jbR50VoHwWJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWHBw//ToyOtUUtb89CwegfxOWVuB3g+E27cz2uh5LRfq/
 W3xB+SzgrbG8yeSAl+y/l0zKHBuxm534IzO/umvAees0CkjG+MFCc1QUhmrmRxBTw+5i8O4EB4Q
 9oLJknrVo71huV0QY6lJCxDtrvDm5u7UvF2Vn0OPQfiEh3c/uRIXFZrYffIZiazcxDrk3TlD51U
 52iXw8MHk2v0QKFpm6NjgpaKVey4xV1xizq1mxueIh04GJBRG0eswPtLE5OCiSVetq2p+ZmBEfu
 fjic6gptxZF5QEW9K7j1LQR/hEhFc7MZP7foxTGoMinZYOWjXoXnMbxtodT3P2aCPAZRFn0ISTy
 LraSnhaJjb1fhxlxob5w5LZvjT48iJ2BP1OGPe2BU2FN4HLeN3OCwEwdO1gU6bL+UpDwKFlatlm
 FeCePzfKI5egz+CqaRhQvWHMGOYiYiX90r5TJl/5/wsviybgakCEOYk8LGZpfSZOFKCHvv93gFw
 s7i7iKEEZbAAFDMzl1zA+D2l/RMqBQqAT3YKa4/u/ydmqyoe/nH7IEV09n5uLyZNsZGnfljyWO5
 Zv+EQP1EqMpolFfJ3NWP3wg6bGEEMdVv+XDkTBy8pchMDkuqRajAhijJjJksxpTmBSdc2IHTIu5
 Uzu9oFQdayCp3d/QYNUL7NSKuxUgoRSWYvorsoGultIA=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: C2p0cwzNi6Lnxmcc4DLJ6DN1LEisW9Tl
X-Proofpoint-ORIG-GUID: C2p0cwzNi6Lnxmcc4DLJ6DN1LEisW9Tl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140039

The Synopsys DWC3 core is often found together with vendor glue logic.
While being a single piece of hardware this has been expressed as two
independent (although with parent/child relationship) nodes in
DeviceTree - but they are not separate components, and the separation
prevents implementation of certain features (such as role switching,
when this involved both parts).

The newly introduced qcom,snps-dwc3 binding changes this representation
of the Qualcomm implementation to a single node, and in an upcoming
change the implementation follows suite - combining the two separate
drivers into a single device instance.

In order to avoid two separate implementations of the Qualcomm DWC3 glue
driver, and/or continue to live with the documented race conditions in
the driver, the driver will be changed to only operate on the new -
flattened - DeviceTree binding.

As both the Qualcomm glue driver and the dwc3 core driver is parsing
DeviceTree, the only sensible way to handle this - while maintaining
backwards compatibility with exiting DeviceTree blobs, is to convert the
representation at runtime.

The conversion between qcom,dwc3 and qcom,snps-dwc3 is performed here in
the form of an independent overlay-based mechanism, to avoid sprinkling
DeviceTree-translation code into the glue driver, which over time is
expected to allow hiding some internals of the OF-code. But this should
also make it suitable for other (than Qualcomm) vendors to reuse the
translation logic as they flatten their glue/dwc3 implementations.

The migration is implemented using two steps:
1) SoC/board integration is migrated using embedded overlays, which are
   applied based on machine compatible matching. This handles the
   complex cases such as merging "reg" and "interrupt" properties.
2) Standard snps properties, which might be board-specific, are migrated
   using of_changeset logic. Notably the of_graph is migrated this way,
   to avoid having to provide overlays for every single board dtb out
   there.

The migration code can only be enabled once the dwc3 glue driver
supports the new binding, but in order to avoid having to support both
bindings in the dwc3 glue a kill-switch is left in place, to be removed
at the instant the driver is converted.

The newly introduced Kconfig option is defaulted to follow USB_DWC3_QCOM
in order to maximize the chances of people not losing USB functionality
in defconfig or distro builds. Over time this can probably be phased
out, followed by the overlay solution itself.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/of/Kconfig                                 |   2 +
 drivers/of/Makefile                                |   2 +
 drivers/of/overlays/Kconfig                        |  15 ++
 drivers/of/overlays/Makefile                       |   3 +
 drivers/of/overlays/dwc3-flattening/Makefile       |   4 +
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 160 +++++++++++++++++++++
 .../of/overlays/dwc3-flattening/dwc3-flattening.h  |   7 +
 7 files changed, 193 insertions(+)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 50697cc3b07e..b5f3cd69bad9 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -126,4 +126,6 @@ config OF_OVERLAY_KUNIT_TEST
 config OF_NUMA
 	bool
 
+source "drivers/of/overlays/Kconfig"
+
 endif # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 379a0afcbdc0..1ff9d0befb38 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -25,3 +25,5 @@ obj-$(CONFIG_OF_OVERLAY_KUNIT_TEST) += overlay-test.o
 overlay-test-y := overlay_test.o kunit_overlay_test.dtbo.o
 
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
+
+obj-y += overlays/
diff --git a/drivers/of/overlays/Kconfig b/drivers/of/overlays/Kconfig
new file mode 100644
index 000000000000..8f07e6db3dc3
--- /dev/null
+++ b/drivers/of/overlays/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config OF_OVERLAYS_DWC3_FLATTENING
+	bool "DeviceTree overlay for migrating DWC3 glue bindings"
+	depends on OF
+	select OF_DYNAMIC
+	select OF_OVERLAY
+	default USB_DWC3_QCOM
+	help
+	  This option enables the migration of the loaded DeviceTree from the
+	  binding that splits DWC3 representation in glue and core nodes (such
+	  as "qcom,dwc3"), to the unified binding ("qcom,snps-dwc3").
+
+	  Enable this if you intend to boot the Linux kernel on a system with a
+	  DeviceTree blob using the non-flattened binding.
diff --git a/drivers/of/overlays/Makefile b/drivers/of/overlays/Makefile
new file mode 100644
index 000000000000..44dd5c09ac8d
--- /dev/null
+++ b/drivers/of/overlays/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_OF_OVERLAYS_DWC3_FLATTENING) += dwc3-flattening/
diff --git a/drivers/of/overlays/dwc3-flattening/Makefile b/drivers/of/overlays/dwc3-flattening/Makefile
new file mode 100644
index 000000000000..78ed59517887
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_OF_OVERLAYS_DWC3_FLATTENING) += dwc3-flattening-overlay.o
+dwc3-flattening-overlay-y += dwc3-flattening.o
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
new file mode 100644
index 000000000000..fe8e42627fe3
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "dwc3-flattening: " fmt
+
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include "dwc3-flattening.h"
+
+struct dwc3_overlay_symbol {
+	const char *symbol;
+	const char *path;
+};
+
+struct dwc3_overlay_data {
+	const void *fdt;
+	const void *end;
+	const char *migrate_match;
+};
+
+static const struct of_device_id dwc3_flatten_of_match[] = {
+	{}
+};
+
+static int dwc3_flattening_copy_snps_properties(struct of_changeset *ocs,
+						struct device_node *np,
+						struct device_node *dwc3)
+{
+	struct property *prop;
+	int ret = 0;
+
+	for_each_property_of_node(dwc3, prop) {
+		if (strncmp(prop->name, "snps,", 5) &&
+		    strcmp(prop->name, "usb-role-switch") &&
+		    strcmp(prop->name, "dr_mode") &&
+		    strcmp(prop->name, "tx-fifo-resize") &&
+		    strcmp(prop->name, "maximum-speed"))
+			continue;
+
+		ret = of_changeset_add_prop_copy(ocs, np, prop);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int dwc3_flattening_copy_ports_tree(struct of_changeset *ocs,
+					   struct device_node *new_parent,
+					   struct device_node *old_node)
+{
+	struct device_node *new_node;
+	struct property *prop;
+	int ret;
+
+	new_node = of_changeset_create_node(ocs, new_parent, old_node->full_name);
+	if (!new_node)
+		return -ENOMEM;
+
+	for_each_property_of_node(old_node, prop) {
+		of_changeset_add_prop_copy(ocs, new_node, prop);
+	}
+
+	for_each_child_of_node_scoped(old_node, child) {
+		ret = dwc3_flattening_copy_ports_tree(ocs, new_node, child);
+		if (ret)
+			return ret;
+	}
+
+	return of_changeset_detach_node(ocs, old_node);
+}
+
+static int dwc3_flattening_migrate(struct of_changeset *ocs,
+				   struct device_node *np)
+{
+	struct device_node *ports;
+	struct device_node *dwc3;
+	int ret;
+
+	dwc3 = of_get_compatible_child(np, "snps,dwc3");
+	if (!dwc3)
+		return 0;
+
+	ret = dwc3_flattening_copy_snps_properties(ocs, np, dwc3);
+	if (ret) {
+		pr_err("failed to copy properties of %pOF", dwc3);
+		goto out;
+	}
+
+	ports = of_get_child_by_name(dwc3, "ports");
+	if (ports) {
+		ret = dwc3_flattening_copy_ports_tree(ocs, np, ports);
+		of_node_put(ports);
+		if (ret) {
+			pr_err("failed to clone ports child of %pOF", dwc3);
+			goto out;
+		}
+	}
+
+	ret = of_changeset_detach_node(ocs, dwc3);
+
+out:
+	of_node_put(dwc3);
+
+	return ret;
+}
+
+static int dwc3_flattening_init(void)
+{
+	const struct dwc3_overlay_data *data;
+	const struct of_device_id *match;
+	struct of_changeset migrate_ocs;
+	struct device_node *np;
+	int overlay_ovcs;
+	int ret;
+
+	/* TODO: Remove kill-switch as dwc3-qcom is migrated to qcom,snps-dwc */
+	return 0;
+
+	match = of_match_node(dwc3_flatten_of_match, of_root);
+	if (!match)
+		return 0;
+
+	data = match->data;
+
+	np = of_find_compatible_node(NULL, NULL, data->migrate_match);
+	if (!np) {
+		pr_debug("already applied\n");
+		return 0;
+	}
+	of_node_put(np);
+
+	of_changeset_init(&migrate_ocs);
+	for_each_compatible_node(np, NULL, data->migrate_match) {
+		ret = dwc3_flattening_migrate(&migrate_ocs, np);
+		if (ret < 0) {
+			of_node_put(np);
+			goto out_migrate_destroy;
+		}
+	}
+
+	ret = of_changeset_apply(&migrate_ocs);
+	if (ret < 0)
+		goto out_migrate_destroy;
+
+	ret = of_overlay_fdt_apply(data->fdt, data->end - data->fdt, &overlay_ovcs, NULL);
+	if (ret < 0) {
+		of_overlay_remove(&overlay_ovcs);
+		of_changeset_revert(&migrate_ocs);
+	}
+
+out_migrate_destroy:
+	of_changeset_destroy(&migrate_ocs);
+
+	return ret;
+}
+postcore_initcall(dwc3_flattening_init);
diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
new file mode 100644
index 000000000000..6147376d3c92
--- /dev/null
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DWC3_FLATTENING_H__
+#define __DWC3_FLATTENING_H__
+
+#include <linux/kernel.h>
+
+#endif

-- 
2.45.2


