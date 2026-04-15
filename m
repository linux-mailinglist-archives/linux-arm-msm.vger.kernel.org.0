Return-Path: <linux-arm-msm+bounces-103299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEnpMA2U32kiWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F334C404E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D41D3306A424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7A33AEF5F;
	Wed, 15 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8kv4spp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LU/dUpWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CFB3B3BEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260025; cv=none; b=DmNZplm/6joGucthJbuVa3UZYe9ty57PU/AU8TkqMYgUNHOX9DVGqxx3BcwjTQLsFfCnYh58PIFH8XCk8Mc5zzYpsYBCcxgjnBBQ1i/a8XDUOazsw5fiKAvxaqs4x1LIfjyG3tV07cAVzidjzHjowJv6ZtqlWqMx9HVVRx4jjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260025; c=relaxed/simple;
	bh=Ddk3JDuA5R/rCuM5HbVlaatI4l75memlW+oiKuJWHhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4YVkrE0hINkZNmbe+SMwoUfMacgPIJdRSt+dBcmb8NTSyju8UMv3+9G8+YV3zQrmRgIi4XkeGHsSr/jZ09TrOK1nw5rr0HWl22uerNKQZCC5aod/jqKYc05Qo8mjb2Fwmplyv53rfw7JN7ud/DNeT7SDflVzeLhn1Wp6aDq5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8kv4spp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LU/dUpWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F91VKM1778920
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xL5Z/lUeEnjjuS7/g2EfnEQuihjP8TuzEo5IZkTU/sA=; b=H8kv4sppnVMUSqZd
	4H5sDZqejADxcXm1mhZxWPNm9UzEedHlMxP2VDpf7QY+sBuXEKAEkOkmMX+vrFVm
	/WMqdIGdIvts6CmPJCe1w/PswdS5u+CdJ3yK2m4EoWkPBQyFa9KepToTWW0BmTLO
	As1fM6JU/vAOlEKWBurM11slO3PwlmyQU5mZ/tWgpLXrBuWcpiks6rNxdeD5lgif
	dJEO2r+Q5l6m/DqBhmxnvdSHsBaqJBFC6Min0JL34GksWzXG09y2az6AQJXyK4h0
	IfQ4E44bO3q8Qpg3VhMsIa1u/WYJSDSzBkoZ2mk4wsykiPMSvC1yQiFCLB4cmhyP
	Ns1Fcg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw03r8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:33:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so4027964b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776260018; x=1776864818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL5Z/lUeEnjjuS7/g2EfnEQuihjP8TuzEo5IZkTU/sA=;
        b=LU/dUpWXL2WzKVnCo6nobz5WtJYjkiL9PR6VMFLe+1dlbyN6ugbkKLQVHt0j9KlGyP
         9iXm/opmaVx5DpP/1nvk34PPB6qbePkOOJTLoaRT94o4B2n8YIrlhtlSUN7Oshuabj8G
         PgNtEo/sllUfAcv70GdO6Histz1jC7xiFZYwhzfPLeLtHZmDyyLNYlcNqnmWfFY+Puq6
         WhiRqgCusFx4of1AN2gbw4n/J3zo2rbeDc7w7BPN8RoI/j8zE+JyICG7lasPcTMkJfet
         Sxj1OfJcFKzU2hUsIxv3FTQVlI+lumkobx4f644XGV7u0jDqwBYdsbaH6GZmX3EaQtoP
         930A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260018; x=1776864818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xL5Z/lUeEnjjuS7/g2EfnEQuihjP8TuzEo5IZkTU/sA=;
        b=gBralJLEBIhEcTqjCXDc83Ytf7ufBU2CkGTYqQ9aMbE60cUlv85OUholfh8VK3uAAK
         YMOLeUGBAbKfOe3FF2b8yiE/GQPjx0BoS4Ybh7IqzBeD0ZIIPdwQMDHxsKISEhZ+U+92
         I6SG+L7o4Baubb6xQVNtHqfWMfTK+rm92lXMtfTIgUhEhRLDfkWMc+L5sKPS+LYYNlm4
         kx/wopHQjoF9kupA/JWPLIbQW1NeLEUQAlbWnO3Gnp278UDfWztVhYlzQvyTKzm0YgBR
         i5IS9+xDoCphYR6bDjwpRGDkDXt7UTxMUISnfOY7ubgYSG8Uu7+E52o4ywZXanvmvMQB
         tu+g==
X-Gm-Message-State: AOJu0Yw70oB5v9Z3RCFdFt7FtQl2NC4yHUmbktrKy3CI6GawQKFjvTO0
	A3kvkktl1ACGUaf6kOvaxNIixqAu+AEcP/XqOd8XXrX435Cw2ZREkxYnK1tfFRWMrGc+ihKrSxl
	Mu/LqaxunYAperhE/E4d+hcjhfOlwK4MfIPXqN/BnIJYFXWw0Zpta+kg5ewfqVFYP2e79
X-Gm-Gg: AeBDieu5Rp/4Dx0IaQ4IRF0Pc7vvcG6VQkk7r7B5Y6Vay2Ya+fsIcT5WiRX/aW64u+B
	VCKPeHG7p7hr+d9I/iQCPMtAzQ35kohG8ddWJ6JxyEubXXDPzK5XMkQECeR7M02mTRFZbx8hF0u
	DAGye9W8AieH1tQ3yV7vtn8fz4WokarWCV+ZfZlkcsJWllF2LOGEawGL2fxf9/4/eHQLEDCK7vT
	0yWZMuVNDe9gPHUK1SrhLqpeCa1ilruowyEbQAx6iMX5zQsjUZ2c1DF3WTKV3i1yxhaEHg5hZ+i
	AJ3e9FaZgBmw1XEMJATrGwND/B1ha5HXi98secmx3P6yLM38GpWCljW3UkOzCXDBxt4M/hltm+1
	Fe7nyoMmdiquPuMArWdD7CtBwY/pbOVFFoG3L06SIwXMEIwSBAtamXv9AcrBO4HMdFxCN+fzbnY
	3dF0RQMPdhQw2RmEBcV0gfeM6Ib/ylBbrdCkTx8Q7WRb0heCbqVaq3t/qP
X-Received: by 2002:a05:6a00:4fcf:b0:82c:9c4e:66ca with SMTP id d2e1a72fcca58-82f0d0d190dmr16866652b3a.2.1776260016481;
        Wed, 15 Apr 2026 06:33:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fcf:b0:82c:9c4e:66ca with SMTP id d2e1a72fcca58-82f0d0d190dmr16866590b3a.2.1776260015229;
        Wed, 15 Apr 2026 06:33:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6b95f222sm1602774b3a.29.2026.04.15.06.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:33:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 19:03:17 +0530
Subject: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776260000; l=113429;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Ddk3JDuA5R/rCuM5HbVlaatI4l75memlW+oiKuJWHhY=;
 b=k25S5wZe0GPH7QN8DDPDBRHMegvGg3eV1b3E2U8o+n1Gcz6MjD8aZ//rz26Uyq/06/ornVEyW
 0gdxps0XswHB8mg2SKcNMAEB0l8IYEKmNZhpOnNA8UBkrOGc+lATHwy
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: YacETiJpxA1w3JJFiJNGsl2brkxmMmE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfXxnX37q74cvrS
 qZ+dM/WMQvhMB3bXo/o+DXNgdxoNS7HuNpCUHptnPFk5Crx1quAa4XucTHzEbSTsRFZ+tygZ2mt
 hPy9DMaVt1ehdYJe8xnv6Z3sg5B+4jIKuncvrqn7qAoKO76w4jzX7FEo58W4kEMxWbeSB+dc38h
 wyU256YsAqvum9kF3Tfnhgy3YiU33Zs/ZnG/ElfZ4xYXspFp2sLSItwGxRG53yCdkdSdjhbMtl9
 h5Lggb2oDNb7Ut+bquXvHAOZA1om67lZXU2HVHNXKLmD0fH0DLcfe8w4Xvwm9f6f8PsczECRsKv
 SKbjODzMhEc4qumX+S1ewAxxsSp76Q9qL6PHMTpKR4rEX0+muy3JSTPafsA+1dToqx+Sb9w2iiQ
 +PW/Z++m//0kcC5Ia59CbVYbM9cv7yGY1ZstW7Qo6r01lajv1Kx1cH+HziLnICCidgdiZRFYK5/
 yDL7tJl3upKt8MOykDQ==
X-Proofpoint-ORIG-GUID: YacETiJpxA1w3JJFiJNGsl2brkxmMmE4
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df93b3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oHrhzBd6vu-Q_AiB_RQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103299-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F334C404E0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the global clock controller found on IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig       |    8 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/gcc-ipq9650.c | 3794 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 3803 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index df21ef5ffd68..ed4c5765557b 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -434,6 +434,14 @@ config IPQ_GCC_9574
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq9574.
 
+config IPQ_GCC_9650
+	tristate "IPQ9650 Global Clock Controller"
+	help
+	  Support for global clock controller on ipq9650 devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  i2c, USB, SD/eMMC, etc. Select this for the root clock
+	  of ipq9650.
+
 config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..ca04117371cf 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
 obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
+obj-$(CONFIG_IPQ_GCC_9650) += gcc-ipq9650.o
 obj-$(CONFIG_IPQ_NSSCC_5424) += nsscc-ipq5424.o
 obj-$(CONFIG_IPQ_NSSCC_9574)	+= nsscc-ipq9574.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
new file mode 100644
index 000000000000..8f5d368be0c5
--- /dev/null
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -0,0 +1,3794 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/reset/qcom,ipq9650-gcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
+#include "reset.h"
+
+enum {
+	DT_XO,
+	DT_SLEEP_CLK,
+	DT_PCIE30_PHY0_PIPE_CLK,
+	DT_PCIE30_PHY1_PIPE_CLK,
+	DT_PCIE30_PHY2_PIPE_CLK,
+	DT_PCIE30_PHY3_PIPE_CLK,
+	DT_PCIE30_PHY4_PIPE_CLK,
+	DT_USB3_PHY0_CC_PIPE_CLK,
+	DT_NSS_CMN_CLK,
+};
+
+enum {
+	P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_ODD,
+	P_GPLL2_OUT_AUX,
+	P_GPLL2_OUT_MAIN,
+	P_GPLL4_OUT_MAIN,
+	P_GPLL4_OUT_ODD,
+	P_NSS_CMN_CLK,
+	P_SLEEP_CLK,
+	P_XO,
+};
+
+static const struct clk_parent_data gcc_parent_data_xo = { .index = DT_XO };
+
+static struct clk_alpha_pll gpll0_main = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll0_main",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_lucid_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor gpll0_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0_div2",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gpll0_main.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll_postdiv gpll0 = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll0",
+		.parent_hws = (const struct clk_hw *[]) {
+			       &gpll0_main.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll2 = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll2",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpll2_out_main[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpll2_out_main = {
+	.offset = 0x21000,
+	.post_div_table = post_div_table_gpll2_out_main,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpll2_out_main),
+	.width = 2,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpll2_out_main",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_zonda_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll4 = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.enable_reg = 0xb000,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpll4",
+			.parent_data = &gcc_parent_data_xo,
+			.num_parents = 1,
+			/*
+			 * There are no consumers for this GPLL in kernel yet,
+			 * (will be added soon), so the clock framework
+			 * disables this source. But some of the clocks
+			 * initialized by boot loaders uses this source. So we
+			 * need to keep this clock ON. Add the
+			 * CLK_IGNORE_UNUSED flag so the clock will not be
+			 * disabled. Once the consumer in kernel is added, we
+			 * can get rid of this flag.
+			 */
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_alpha_pll_fixed_lucid_ops,
+		},
+	},
+};
+
+static const struct parent_map gcc_parent_map_xo[] = {
+	{ P_XO, 0 },
+};
+
+static const struct parent_map gcc_parent_map_0[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_XO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .index = DT_XO },
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+	{ P_GPLL0_OUT_ODD, 5 },
+};
+
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+	{ .hw = &gpll0.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_ODD, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_OUT_AUX, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_XO, 0 },
+	{ P_GPLL4_OUT_ODD, 1 },
+	{ P_GPLL0_OUT_MAIN, 3 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_7[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_XO, 0 },
+	{ P_NSS_CMN_CLK, 1 },
+	{ P_GPLL0_OUT_ODD, 2 },
+	{ P_GPLL2_OUT_AUX, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .index = DT_XO },
+	{ .index = DT_NSS_CMN_CLK },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2.clkr.hw },
+};
+
+static const struct parent_map gcc_parent_map_9[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_ODD, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_9[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_10[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_10[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll2_out_main.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_11[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 4 },
+};
+
+static const struct clk_parent_data gcc_parent_data_11[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct parent_map gcc_parent_map_12[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_ODD, 2 },
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_12[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_13[] = {
+	{ P_SLEEP_CLK, 6 },
+};
+
+static const struct clk_parent_data gcc_parent_data_13[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map gcc_parent_map_14[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 2 },
+	{ P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_14[] = {
+	{ .index = DT_XO },
+	{ .hw = &gpll0.clkr.hw },
+	{ .hw = &gpll4.clkr.hw },
+	{ .hw = &gpll0_div2.hw },
+};
+
+static const struct freq_tbl ftbl_gcc_adss_pwm_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_adss_pwm_clk_src = {
+	.cmd_rcgr = 0x1c004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_adss_pwm_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_apss_axi_clk_src[] = {
+	F(800000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_gcc_gemnoc_anoc_pcie_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_gcc_nss_ts_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_xo_clk_src = {
+	.cmd_rcgr = 0x34004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_xo,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_xo_clk_src",
+		.parent_data = &gcc_parent_data_xo,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_xo_div4_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_xo_div4_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gcc_xo_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_nss_ts_clk_src = {
+	.cmd_rcgr = 0x17088,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nss_ts_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_refgen_core_clk_src = {
+	.cmd_rcgr = 0x23004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_refgen_core_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src[] = {
+	F(462000000, P_NSS_CMN_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_nssnoc_memnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x17004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_gcc_nssnoc_memnoc_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_system_noc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266666667, P_GPLL4_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_system_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x2e004,
+	.freq_tbl = ftbl_gcc_system_noc_bfdcd_clk_src,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_14,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_system_noc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_14,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_14),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcnoc_bfdcd_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x31004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcnoc_bfdcd_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		/*
+		 * There are no consumers for this source in kernel yet,
+		 * (will be added soon), so the clock framework
+		 * disables this source. But some of the clocks
+		 * initialized by boot loaders uses this source. So we
+		 * need to keep this clock ON. Add the
+		 * CLK_IGNORE_UNUSED flag so the clock will not be
+		 * disabled. Once the consumer in kernel is added, we
+		 * can get rid of this flag.
+		 */
+		.flags = CLK_IS_CRITICAL,
+		.ops = &clk_rcg2_ops,
+	},
+};
+static const struct freq_tbl ftbl_gcc_pcie0_axi_m_clk_src[] = {
+	F(200000000, P_GPLL4_OUT_MAIN, 6, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie0_axi_m_clk_src = {
+	.cmd_rcgr = 0x28018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_axi_m_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie0_axi_s_clk_src = {
+	.cmd_rcgr = 0x28020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_axi_s_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie0_rchng_clk_src = {
+	.cmd_rcgr = 0x28028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie0_rchng_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie1_axi_m_clk_src[] = {
+	F(266666667, P_GPLL4_OUT_MAIN, 4.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie1_axi_m_clk_src = {
+	.cmd_rcgr = 0x29018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie1_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_axi_m_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie1_axi_s_clk_src = {
+	.cmd_rcgr = 0x29020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_axi_s_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie1_rchng_clk_src = {
+	.cmd_rcgr = 0x29028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie1_rchng_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie2_axi_m_clk_src = {
+	.cmd_rcgr = 0x2a018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie1_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie2_axi_m_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie2_axi_s_clk_src = {
+	.cmd_rcgr = 0x2a020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie2_axi_s_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie2_rchng_clk_src = {
+	.cmd_rcgr = 0x2a028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie2_rchng_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie3_axi_m_clk_src = {
+	.cmd_rcgr = 0x2b018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie1_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie3_axi_m_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie3_axi_s_clk_src = {
+	.cmd_rcgr = 0x2b020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie3_axi_s_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie3_rchng_clk_src = {
+	.cmd_rcgr = 0x2b028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie3_rchng_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie4_axi_m_clk_src = {
+	.cmd_rcgr = 0x25004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie4_axi_m_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie4_axi_s_clk_src = {
+	.cmd_rcgr = 0x2500c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_pcie0_axi_m_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie4_axi_s_clk_src",
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_pcie4_rchng_clk_src = {
+	.cmd_rcgr = 0x25014,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie4_rchng_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_pcie_aux_clk_src[] = {
+	F(20000000, P_GPLL0_OUT_MAIN, 10, 1, 4),
+	{ }
+};
+
+static struct clk_rcg2 gcc_pcie_aux_clk_src = {
+	.cmd_rcgr = 0x28004,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_9,
+	.freq_tbl = ftbl_gcc_pcie_aux_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pcie_aux_clk_src",
+		.parent_data = gcc_parent_data_9,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_primess_ahbm_clk_src = {
+	.cmd_rcgr = 0x2601c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_gcc_adss_pwm_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_primess_ahbm_clk_src",
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_primess_axim_clk_src = {
+	.cmd_rcgr = 0x26014,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_gemnoc_anoc_pcie_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_primess_axim_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_primess_clk_src = {
+	.cmd_rcgr = 0x2600c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_gcc_apss_axi_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_primess_clk_src",
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qdss_at_clk_src[] = {
+	F(240000000, P_GPLL4_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qdss_at_clk_src = {
+	.cmd_rcgr = 0x2d004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_qdss_at_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qdss_at_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_eud_at_div_clk_src = {
+	.mult = 1,
+	.div = 6,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_eud_at_div_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gcc_qdss_at_clk_src.clkr.hw },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qdss_tsctr_clk_src[] = {
+	F(600000000, P_GPLL4_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qdss_tsctr_clk_src = {
+	.cmd_rcgr = 0x2d01c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_gcc_qdss_tsctr_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qdss_tsctr_clk_src",
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_fixed_factor gcc_qdss_dap_sync_clk_src = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qdss_dap_sync_clk_src",
+		.parent_hws = (const struct clk_hw *[]) {
+			&gcc_qdss_tsctr_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sleep_clk_src = {
+	.cmd_rcgr = 0x3400c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_13,
+	.freq_tbl = ftbl_gcc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sleep_clk_src",
+		.parent_data = gcc_parent_data_13,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_13),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qpic_io_macro_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qpic_clk_src = {
+	.cmd_rcgr = 0x32020,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_qpic_io_macro_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qpic_clk_src",
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qpic_io_macro_clk_src = {
+	.cmd_rcgr = 0x32004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_gcc_qpic_io_macro_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qpic_io_macro_clk_src",
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_2x_core_clk_src = {
+	.cmd_rcgr = 0x100c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_gemnoc_anoc_pcie_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_2x_core_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap_se0_clk_src[] = {
+	F(960000, P_XO, 10, 2, 5),
+	F(3686636, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 2, 217),
+	F(4800000, P_XO, 5, 0, 0),
+	F(7373272, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 4, 217),
+	F(9600000, P_XO, 2.5, 0, 0),
+	F(14746544, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 8, 217),
+	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
+	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
+	F(46400000, P_GPLL0_OUT_MAIN, 2, 29, 250),
+	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
+	F(58986175, P_GPLL0_OUT_MAIN, 1, 16, 217),
+	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
+	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se0_clk_src = {
+	.cmd_rcgr = 0x2018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se0_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se1_clk_src = {
+	.cmd_rcgr = 0x3018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se1_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se2_clk_src = {
+	.cmd_rcgr = 0x3034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se2_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se3_clk_src = {
+	.cmd_rcgr = 0x3050,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se3_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_qupv3_wrap_se4_clk_src[] = {
+	F(960000, P_XO, 10, 2, 5),
+	F(3686636, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 2, 217),
+	F(4800000, P_XO, 5, 0, 0),
+	F(7373272, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 4, 217),
+	F(9600000, P_XO, 2.5, 0, 0),
+	F(14746544, P_GCC_GPLL0_OUT_MAIN_DIV_CLK_SRC, 1, 8, 217),
+	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(24000000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
+	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
+	F(46400000, P_GPLL0_OUT_MAIN, 2, 29, 250),
+	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
+	F(58986175, P_GPLL0_OUT_MAIN, 1, 16, 217),
+	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
+	F(64000000, P_GPLL0_OUT_MAIN, 12.5, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se4_clk_src = {
+	.cmd_rcgr = 0x306c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se4_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se4_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se5_clk_src = {
+	.cmd_rcgr = 0x3090,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se4_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se5_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se6_clk_src = {
+	.cmd_rcgr = 0x4004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se6_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap_se7_clk_src = {
+	.cmd_rcgr = 0x4020,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_qupv3_wrap_se0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap_se7_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
+	F(144000, P_XO, 16, 12, 125),
+	F(400000, P_XO, 12, 1, 5),
+	F(24000000, P_GPLL2_OUT_MAIN, 12, 1, 2),
+	F(48000000, P_GPLL2_OUT_MAIN, 12, 0, 0),
+	F(96000000, P_GPLL2_OUT_MAIN, 6, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
+	F(192000000, P_GPLL2_OUT_MAIN, 3, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x33004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_apps_clk_src",
+		.parent_data = gcc_parent_data_10,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
+	F(300000000, P_GPLL4_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x33018,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_11,
+	.freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_sdcc1_ice_core_clk_src",
+		.parent_data = gcc_parent_data_11,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
+		.ops = &clk_rcg2_floor_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_uniphy_sys_clk_src = {
+	.cmd_rcgr = 0x17090,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_uniphy_sys_clk_src",
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb0_aux_clk_src = {
+	.cmd_rcgr = 0x2c018,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_12,
+	.freq_tbl = ftbl_gcc_nss_ts_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_aux_clk_src",
+		.parent_data = gcc_parent_data_12,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_12),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb0_master_clk_src = {
+	.cmd_rcgr = 0x2c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_gcc_gemnoc_anoc_pcie_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_master_clk_src",
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_usb0_mock_utmi_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(60000000, P_GPLL4_OUT_ODD, 10, 1, 2),
+	{ }
+};
+
+static struct clk_rcg2 gcc_usb0_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x2c02c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_usb0_mock_utmi_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 gcc_usb1_mock_utmi_clk_src = {
+	.cmd_rcgr = 0x3c004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_gcc_usb0_mock_utmi_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb1_mock_utmi_clk_src",
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_nssnoc_memnoc_div_clk_src = {
+	.reg = 0x1700c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_nssnoc_memnoc_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_nssnoc_memnoc_bfdcd_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb0_mock_utmi_div_clk_src = {
+	.reg = 0x2c040,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb0_mock_utmi_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb0_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div gcc_usb1_mock_utmi_div_clk_src = {
+	.reg = 0x3c018,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_usb1_mock_utmi_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_usb1_mock_utmi_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gcc_adss_pwm_clk = {
+	.halt_reg = 0x1c00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1c00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_adss_pwm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_adss_pwm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie0_1lane_m_clk = {
+	.halt_reg = 0x2e07c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e07c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie0_1lane_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie0_1lane_s_clk = {
+	.halt_reg = 0x2e0cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie0_1lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie1_2lane_m_clk = {
+	.halt_reg = 0x2e084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie1_2lane_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie1_2lane_s_clk = {
+	.halt_reg = 0x2e0d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie1_2lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie2_2lane_m_clk = {
+	.halt_reg = 0x2e080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie2_2lane_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie2_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie2_2lane_s_clk = {
+	.halt_reg = 0x2e0d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie2_2lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie2_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie3_2lane_m_clk = {
+	.halt_reg = 0x2e0bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie3_2lane_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie3_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie3_2lane_s_clk = {
+	.halt_reg = 0x2e0d8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie3_2lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie3_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie4_1lane_m_clk = {
+	.halt_reg = 0x2e0c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie4_1lane_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie4_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_pcie4_1lane_s_clk = {
+	.halt_reg = 0x2e0dc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0dc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_pcie4_1lane_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie4_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_ahb_clk = {
+	.halt_reg = 0x3a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cmn_12gpll_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cmn_12gpll_sys_clk = {
+	.halt_reg = 0x3a008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x3a008,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_cmn_12gpll_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio_ahb_clk = {
+	.halt_reg = 0x17040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mdio_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nss_ts_clk = {
+	.halt_reg = 0x17018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x17018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nss_ts_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nss_ts_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nsscc_clk = {
+	.halt_reg = 0x17034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nsscc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nsscfg_clk = {
+	.halt_reg = 0x1702c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1702c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nsscfg_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_atb_clk = {
+	.halt_reg = 0x17014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x17014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_at_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_memnoc_1_clk = {
+	.halt_reg = 0x17084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_memnoc_clk = {
+	.halt_reg = 0x17024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_memnoc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_nssnoc_memnoc_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_nsscc_clk = {
+	.halt_reg = 0x17030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_nsscc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_pcnoc_1_clk = {
+	.halt_reg = 0x17080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_pcnoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_qosgen_ref_clk = {
+	.halt_reg = 0x1701c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1701c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_qosgen_ref_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_xo_div4_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_1_clk = {
+	.halt_reg = 0x1707c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1707c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_snoc_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_system_noc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_snoc_clk = {
+	.halt_reg = 0x17028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_snoc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_system_noc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_timeout_ref_clk = {
+	.halt_reg = 0x17020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_timeout_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_div4_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_nssnoc_xo_dcd_clk = {
+	.halt_reg = 0x17074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x17074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_nssnoc_xo_dcd_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_ahb_clk = {
+	.halt_reg = 0x28030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_aux_clk = {
+	.halt_reg = 0x28070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_m_clk = {
+	.halt_reg = 0x28038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
+	.halt_reg = 0x28048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_axi_s_clk = {
+	.halt_reg = 0x28040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x28040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie0_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie0_pipe_clk_src = {
+	.reg = 0x28064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY0_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_pipe_clk = {
+	.halt_reg = 0x28068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x28068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie0_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_ahb_clk = {
+	.halt_reg = 0x29030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_aux_clk = {
+	.halt_reg = 0x29074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_m_clk = {
+	.halt_reg = 0x29038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_bridge_clk = {
+	.halt_reg = 0x29048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_axi_s_clk = {
+	.halt_reg = 0x29040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x29040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie1_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie1_pipe_clk_src = {
+	.reg = 0x29064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie1_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY1_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_pipe_clk = {
+	.halt_reg = 0x29068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x29068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie1_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_ahb_clk = {
+	.halt_reg = 0x2a030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_aux_clk = {
+	.halt_reg = 0x2a078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_axi_m_clk = {
+	.halt_reg = 0x2a038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie2_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_axi_s_bridge_clk = {
+	.halt_reg = 0x2a048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie2_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_axi_s_clk = {
+	.halt_reg = 0x2a040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2a040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie2_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie2_pipe_clk_src = {
+	.reg = 0x2a064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie2_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY2_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_pipe_clk = {
+	.halt_reg = 0x2a068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2a068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie2_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_ahb_clk = {
+	.halt_reg = 0x2b030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_aux_clk = {
+	.halt_reg = 0x2b07c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b07c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_axi_m_clk = {
+	.halt_reg = 0x2b038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie3_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_axi_s_bridge_clk = {
+	.halt_reg = 0x2b048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie3_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_axi_s_clk = {
+	.halt_reg = 0x2b040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2b040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie3_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie3_pipe_clk_src = {
+	.reg = 0x2b064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie3_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY3_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_pipe_clk = {
+	.halt_reg = 0x2b068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2b068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie3_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_ahb_clk = {
+	.halt_reg = 0x2501c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_aux_clk = {
+	.halt_reg = 0x25020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_axi_m_clk = {
+	.halt_reg = 0x25028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_axi_m_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie4_axi_m_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_axi_s_bridge_clk = {
+	.halt_reg = 0x25038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_axi_s_bridge_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie4_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_axi_s_clk = {
+	.halt_reg = 0x25030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x25030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_axi_s_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcie4_axi_s_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_pcie4_pipe_clk_src = {
+	.reg = 0x25058,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "pcie4_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_PCIE30_PHY4_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_pipe_clk = {
+	.halt_reg = 0x2503c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2503c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie4_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie0_rchng_clk = {
+	.halt_reg = 0x28028,
+	.clkr = {
+		.enable_reg = 0x28028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie0_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie0_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie1_rchng_clk = {
+	.halt_reg = 0x29028,
+	.clkr = {
+		.enable_reg = 0x29028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie1_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie1_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie2_rchng_clk = {
+	.halt_reg = 0x2a028,
+	.clkr = {
+		.enable_reg = 0x2a028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie2_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie2_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie3_rchng_clk = {
+	.halt_reg = 0x2b028,
+	.clkr = {
+		.enable_reg = 0x2b028,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie3_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie3_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie4_rchng_clk = {
+	.halt_reg = 0x25014,
+	.clkr = {
+		.enable_reg = 0x25014,
+		.enable_mask = BIT(1),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie4_rchng_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_pcie4_rchng_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_cmn_hclk = {
+	.halt_reg = 0x23030,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_cmn_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pcie_cmn_ldo_clk = {
+	.halt_reg = 0x2302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_pcie_cmn_ldo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_ahbm_clk = {
+	.halt_reg = 0x26038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x26038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_ahbm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_primess_ahbm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_ahbm_partial_clk = {
+	.halt_reg = 0x26040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x26040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_ahbm_partial_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_primess_ahbm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_ahbs_clk = {
+	.halt_reg = 0x26034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_ahbs_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_atb_clk = {
+	.halt_reg = 0x26030,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x26030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_atb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_at_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_axim_clk = {
+	.halt_reg = 0x2602c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2602c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_axim_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_primess_axim_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_axim_partial_clk = {
+	.halt_reg = 0x2603c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2603c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_axim_partial_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_primess_axim_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_clk = {
+	.halt_reg = 0x26028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x26028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_primess_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_primess_xo_clk = {
+	.halt_reg = 0x26024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x26024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_primess_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_at_clk = {
+	.halt_reg = 0x2d034,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2d034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qdss_at_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_at_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qdss_dap_clk = {
+	.halt_reg = 0x2d058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(2),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qdss_dap_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qdss_dap_sync_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_ahb_clk = {
+	.halt_reg = 0x32010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x32010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_clk = {
+	.halt_reg = 0x32028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x32028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qpic_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_io_macro_clk = {
+	.halt_reg = 0x3200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_io_macro_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qpic_io_macro_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qpic_sleep_clk = {
+	.halt_reg = 0x32018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x32018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qpic_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_ahb_mst_clk = {
+	.halt_reg = 0x1014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_ahb_mst_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_ahb_slv_clk = {
+	.halt_reg = 0x102c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(4),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_ahb_slv_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se0_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se1_clk = {
+	.halt_reg = 0x302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se2_clk = {
+	.halt_reg = 0x3048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se3_clk = {
+	.halt_reg = 0x3064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se4_clk = {
+	.halt_reg = 0x3080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se5_clk = {
+	.halt_reg = 0x30a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x30a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se5_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se5_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se6_clk = {
+	.halt_reg = 0x4018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se6_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se6_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_se7_clk = {
+	.halt_reg = 0x4034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_se7_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap_se7_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_core_clk = {
+	.halt_reg = 0x23020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_refgen_pcie_hclk = {
+	.halt_reg = 0x23024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x23024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_refgen_pcie_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x3303c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3303c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x3302c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3302c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x33034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x33034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_snoc_usb_clk = {
+	.halt_reg = 0x2e0c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2e0c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_snoc_usb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_ahb_clk = {
+	.halt_reg = 0x1704c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1704c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy0_sys_clk = {
+	.halt_reg = 0x17048,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x17048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy0_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_ahb_clk = {
+	.halt_reg = 0x1705c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1705c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy1_sys_clk = {
+	.halt_reg = 0x17058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x17058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy1_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_ahb_clk = {
+	.halt_reg = 0x1706c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1706c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy2_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_uniphy2_sys_clk = {
+	.halt_reg = 0x17068,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x17068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_uniphy2_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_uniphy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_aux_clk = {
+	.halt_reg = 0x2c04c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_aux_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_eud_at_clk = {
+	.halt_reg = 0x30004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x30004,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_eud_at_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_eud_at_div_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_master_clk = {
+	.halt_reg = 0x2c044,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_master_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_mock_utmi_clk = {
+	.halt_reg = 0x2c050,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb0_mock_utmi_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_phy_cfg_ahb_clk = {
+	.halt_reg = 0x2c05c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c05c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_phy_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb0_pipe_clk_src = {
+	.reg = 0x2c074,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_pipe_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_USB3_PHY0_CC_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_pipe_clk = {
+	.halt_reg = 0x2c054,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x2c054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_pipe_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gcc_usb0_pipe_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb0_sleep_clk = {
+	.halt_reg = 0x2c058,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x2c058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb0_sleep_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_master_clk = {
+	.halt_reg = 0x3c028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb1_master_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_mock_utmi_clk = {
+	.halt_reg = 0x3c024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb1_mock_utmi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb1_mock_utmi_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_phy_cfg_ahb_clk = {
+	.halt_reg = 0x3c01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x3c01c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb1_phy_cfg_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb1_sleep_clk = {
+	.halt_reg = 0x3c020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3c020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb1_sleep_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_sleep_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_cmn_hclk = {
+	.halt_reg = 0x2303c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2303c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb_cmn_hclk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pcnoc_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_cmn_ldo_clk = {
+	.halt_reg = 0x23038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x23038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb_cmn_ldo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_refgen_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *gcc_ipq9650_clocks[] = {
+	[GCC_ADSS_PWM_CLK] = &gcc_adss_pwm_clk.clkr,
+	[GCC_ADSS_PWM_CLK_SRC] = &gcc_adss_pwm_clk_src.clkr,
+	[GCC_ANOC_PCIE0_1LANE_M_CLK] = &gcc_anoc_pcie0_1lane_m_clk.clkr,
+	[GCC_ANOC_PCIE0_1LANE_S_CLK] = &gcc_anoc_pcie0_1lane_s_clk.clkr,
+	[GCC_ANOC_PCIE1_2LANE_M_CLK] = &gcc_anoc_pcie1_2lane_m_clk.clkr,
+	[GCC_ANOC_PCIE1_2LANE_S_CLK] = &gcc_anoc_pcie1_2lane_s_clk.clkr,
+	[GCC_ANOC_PCIE2_2LANE_M_CLK] = &gcc_anoc_pcie2_2lane_m_clk.clkr,
+	[GCC_ANOC_PCIE2_2LANE_S_CLK] = &gcc_anoc_pcie2_2lane_s_clk.clkr,
+	[GCC_ANOC_PCIE3_2LANE_M_CLK] = &gcc_anoc_pcie3_2lane_m_clk.clkr,
+	[GCC_ANOC_PCIE3_2LANE_S_CLK] = &gcc_anoc_pcie3_2lane_s_clk.clkr,
+	[GCC_ANOC_PCIE4_1LANE_M_CLK] = &gcc_anoc_pcie4_1lane_m_clk.clkr,
+	[GCC_ANOC_PCIE4_1LANE_S_CLK] = &gcc_anoc_pcie4_1lane_s_clk.clkr,
+	[GCC_CMN_12GPLL_AHB_CLK] = &gcc_cmn_12gpll_ahb_clk.clkr,
+	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
+	[GCC_MDIO_AHB_CLK] = &gcc_mdio_ahb_clk.clkr,
+	[GCC_NSS_TS_CLK] = &gcc_nss_ts_clk.clkr,
+	[GCC_NSS_TS_CLK_SRC] = &gcc_nss_ts_clk_src.clkr,
+	[GCC_NSSCC_CLK] = &gcc_nsscc_clk.clkr,
+	[GCC_NSSCFG_CLK] = &gcc_nsscfg_clk.clkr,
+	[GCC_NSSNOC_ATB_CLK] = &gcc_nssnoc_atb_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_1_CLK] = &gcc_nssnoc_memnoc_1_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_BFDCD_CLK_SRC] = &gcc_nssnoc_memnoc_bfdcd_clk_src.clkr,
+	[GCC_NSSNOC_MEMNOC_CLK] = &gcc_nssnoc_memnoc_clk.clkr,
+	[GCC_NSSNOC_MEMNOC_DIV_CLK_SRC] = &gcc_nssnoc_memnoc_div_clk_src.clkr,
+	[GCC_NSSNOC_NSSCC_CLK] = &gcc_nssnoc_nsscc_clk.clkr,
+	[GCC_NSSNOC_PCNOC_1_CLK] = &gcc_nssnoc_pcnoc_1_clk.clkr,
+	[GCC_NSSNOC_QOSGEN_REF_CLK] = &gcc_nssnoc_qosgen_ref_clk.clkr,
+	[GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
+	[GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
+	[GCC_NSSNOC_TIMEOUT_REF_CLK] = &gcc_nssnoc_timeout_ref_clk.clkr,
+	[GCC_NSSNOC_XO_DCD_CLK] = &gcc_nssnoc_xo_dcd_clk.clkr,
+	[GCC_PCIE0_AHB_CLK] = &gcc_pcie0_ahb_clk.clkr,
+	[GCC_PCIE0_AUX_CLK] = &gcc_pcie0_aux_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK] = &gcc_pcie0_axi_m_clk.clkr,
+	[GCC_PCIE0_AXI_M_CLK_SRC] = &gcc_pcie0_axi_m_clk_src.clkr,
+	[GCC_PCIE0_AXI_S_BRIDGE_CLK] = &gcc_pcie0_axi_s_bridge_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK] = &gcc_pcie0_axi_s_clk.clkr,
+	[GCC_PCIE0_AXI_S_CLK_SRC] = &gcc_pcie0_axi_s_clk_src.clkr,
+	[GCC_PCIE0_PIPE_CLK] = &gcc_pcie0_pipe_clk.clkr,
+	[GCC_PCIE0_PIPE_CLK_SRC] = &gcc_pcie0_pipe_clk_src.clkr,
+	[GCC_PCIE0_RCHNG_CLK_SRC] = &gcc_pcie0_rchng_clk_src.clkr,
+	[GCC_PCIE0_RCHNG_CLK] = &gcc_pcie0_rchng_clk.clkr,
+	[GCC_PCIE1_AHB_CLK] = &gcc_pcie1_ahb_clk.clkr,
+	[GCC_PCIE1_AUX_CLK] = &gcc_pcie1_aux_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK] = &gcc_pcie1_axi_m_clk.clkr,
+	[GCC_PCIE1_AXI_M_CLK_SRC] = &gcc_pcie1_axi_m_clk_src.clkr,
+	[GCC_PCIE1_AXI_S_BRIDGE_CLK] = &gcc_pcie1_axi_s_bridge_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK] = &gcc_pcie1_axi_s_clk.clkr,
+	[GCC_PCIE1_AXI_S_CLK_SRC] = &gcc_pcie1_axi_s_clk_src.clkr,
+	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
+	[GCC_PCIE1_PIPE_CLK_SRC] = &gcc_pcie1_pipe_clk_src.clkr,
+	[GCC_PCIE1_RCHNG_CLK_SRC] = &gcc_pcie1_rchng_clk_src.clkr,
+	[GCC_PCIE1_RCHNG_CLK] = &gcc_pcie1_rchng_clk.clkr,
+	[GCC_PCIE2_AHB_CLK] = &gcc_pcie2_ahb_clk.clkr,
+	[GCC_PCIE2_AUX_CLK] = &gcc_pcie2_aux_clk.clkr,
+	[GCC_PCIE2_AXI_M_CLK] = &gcc_pcie2_axi_m_clk.clkr,
+	[GCC_PCIE2_AXI_M_CLK_SRC] = &gcc_pcie2_axi_m_clk_src.clkr,
+	[GCC_PCIE2_AXI_S_BRIDGE_CLK] = &gcc_pcie2_axi_s_bridge_clk.clkr,
+	[GCC_PCIE2_AXI_S_CLK] = &gcc_pcie2_axi_s_clk.clkr,
+	[GCC_PCIE2_AXI_S_CLK_SRC] = &gcc_pcie2_axi_s_clk_src.clkr,
+	[GCC_PCIE2_PIPE_CLK] = &gcc_pcie2_pipe_clk.clkr,
+	[GCC_PCIE2_PIPE_CLK_SRC] = &gcc_pcie2_pipe_clk_src.clkr,
+	[GCC_PCIE2_RCHNG_CLK_SRC] = &gcc_pcie2_rchng_clk_src.clkr,
+	[GCC_PCIE2_RCHNG_CLK] = &gcc_pcie2_rchng_clk.clkr,
+	[GCC_PCIE3_AHB_CLK] = &gcc_pcie3_ahb_clk.clkr,
+	[GCC_PCIE3_AUX_CLK] = &gcc_pcie3_aux_clk.clkr,
+	[GCC_PCIE3_AXI_M_CLK] = &gcc_pcie3_axi_m_clk.clkr,
+	[GCC_PCIE3_AXI_M_CLK_SRC] = &gcc_pcie3_axi_m_clk_src.clkr,
+	[GCC_PCIE3_AXI_S_BRIDGE_CLK] = &gcc_pcie3_axi_s_bridge_clk.clkr,
+	[GCC_PCIE3_AXI_S_CLK] = &gcc_pcie3_axi_s_clk.clkr,
+	[GCC_PCIE3_AXI_S_CLK_SRC] = &gcc_pcie3_axi_s_clk_src.clkr,
+	[GCC_PCIE3_PIPE_CLK] = &gcc_pcie3_pipe_clk.clkr,
+	[GCC_PCIE3_PIPE_CLK_SRC] = &gcc_pcie3_pipe_clk_src.clkr,
+	[GCC_PCIE3_RCHNG_CLK_SRC] = &gcc_pcie3_rchng_clk_src.clkr,
+	[GCC_PCIE3_RCHNG_CLK] = &gcc_pcie3_rchng_clk.clkr,
+	[GCC_PCIE4_AHB_CLK] = &gcc_pcie4_ahb_clk.clkr,
+	[GCC_PCIE4_AUX_CLK] = &gcc_pcie4_aux_clk.clkr,
+	[GCC_PCIE4_AXI_M_CLK] = &gcc_pcie4_axi_m_clk.clkr,
+	[GCC_PCIE4_AXI_M_CLK_SRC] = &gcc_pcie4_axi_m_clk_src.clkr,
+	[GCC_PCIE4_AXI_S_BRIDGE_CLK] = &gcc_pcie4_axi_s_bridge_clk.clkr,
+	[GCC_PCIE4_AXI_S_CLK] = &gcc_pcie4_axi_s_clk.clkr,
+	[GCC_PCIE4_AXI_S_CLK_SRC] = &gcc_pcie4_axi_s_clk_src.clkr,
+	[GCC_PCIE4_PIPE_CLK] = &gcc_pcie4_pipe_clk.clkr,
+	[GCC_PCIE4_PIPE_CLK_SRC] = &gcc_pcie4_pipe_clk_src.clkr,
+	[GCC_PCIE4_RCHNG_CLK_SRC] = &gcc_pcie4_rchng_clk_src.clkr,
+	[GCC_PCIE4_RCHNG_CLK] = &gcc_pcie4_rchng_clk.clkr,
+	[GCC_PCIE_AUX_CLK_SRC] = &gcc_pcie_aux_clk_src.clkr,
+	[GCC_PCIE_CMN_HCLK] = &gcc_pcie_cmn_hclk.clkr,
+	[GCC_PCIE_CMN_LDO_CLK] = &gcc_pcie_cmn_ldo_clk.clkr,
+	[GCC_PCNOC_BFDCD_CLK_SRC] = &gcc_pcnoc_bfdcd_clk_src.clkr,
+	[GCC_PRIMESS_AHBM_CLK] = &gcc_primess_ahbm_clk.clkr,
+	[GCC_PRIMESS_AHBM_CLK_SRC] = &gcc_primess_ahbm_clk_src.clkr,
+	[GCC_PRIMESS_AHBM_PARTIAL_CLK] = &gcc_primess_ahbm_partial_clk.clkr,
+	[GCC_PRIMESS_AHBS_CLK] = &gcc_primess_ahbs_clk.clkr,
+	[GCC_PRIMESS_ATB_CLK] = &gcc_primess_atb_clk.clkr,
+	[GCC_PRIMESS_AXIM_CLK] = &gcc_primess_axim_clk.clkr,
+	[GCC_PRIMESS_AXIM_CLK_SRC] = &gcc_primess_axim_clk_src.clkr,
+	[GCC_PRIMESS_AXIM_PARTIAL_CLK] = &gcc_primess_axim_partial_clk.clkr,
+	[GCC_PRIMESS_CLK] = &gcc_primess_clk.clkr,
+	[GCC_PRIMESS_CLK_SRC] = &gcc_primess_clk_src.clkr,
+	[GCC_PRIMESS_XO_CLK] = &gcc_primess_xo_clk.clkr,
+	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
+	[GCC_QDSS_AT_CLK_SRC] = &gcc_qdss_at_clk_src.clkr,
+	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
+	[GCC_QDSS_TSCTR_CLK_SRC] = &gcc_qdss_tsctr_clk_src.clkr,
+	[GCC_QPIC_AHB_CLK] = &gcc_qpic_ahb_clk.clkr,
+	[GCC_QPIC_CLK] = &gcc_qpic_clk.clkr,
+	[GCC_QPIC_CLK_SRC] = &gcc_qpic_clk_src.clkr,
+	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
+	[GCC_QPIC_IO_MACRO_CLK_SRC] = &gcc_qpic_io_macro_clk_src.clkr,
+	[GCC_QPIC_SLEEP_CLK] = &gcc_qpic_sleep_clk.clkr,
+	[GCC_QUPV3_2X_CORE_CLK_SRC] = &gcc_qupv3_2x_core_clk_src.clkr,
+	[GCC_QUPV3_AHB_MST_CLK] = &gcc_qupv3_ahb_mst_clk.clkr,
+	[GCC_QUPV3_AHB_SLV_CLK] = &gcc_qupv3_ahb_slv_clk.clkr,
+	[GCC_QUPV3_WRAP_SE0_CLK] = &gcc_qupv3_wrap_se0_clk.clkr,
+	[GCC_QUPV3_WRAP_SE0_CLK_SRC] = &gcc_qupv3_wrap_se0_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE1_CLK] = &gcc_qupv3_wrap_se1_clk.clkr,
+	[GCC_QUPV3_WRAP_SE1_CLK_SRC] = &gcc_qupv3_wrap_se1_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE2_CLK] = &gcc_qupv3_wrap_se2_clk.clkr,
+	[GCC_QUPV3_WRAP_SE2_CLK_SRC] = &gcc_qupv3_wrap_se2_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE3_CLK] = &gcc_qupv3_wrap_se3_clk.clkr,
+	[GCC_QUPV3_WRAP_SE3_CLK_SRC] = &gcc_qupv3_wrap_se3_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE4_CLK] = &gcc_qupv3_wrap_se4_clk.clkr,
+	[GCC_QUPV3_WRAP_SE4_CLK_SRC] = &gcc_qupv3_wrap_se4_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE5_CLK] = &gcc_qupv3_wrap_se5_clk.clkr,
+	[GCC_QUPV3_WRAP_SE5_CLK_SRC] = &gcc_qupv3_wrap_se5_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE6_CLK] = &gcc_qupv3_wrap_se6_clk.clkr,
+	[GCC_QUPV3_WRAP_SE6_CLK_SRC] = &gcc_qupv3_wrap_se6_clk_src.clkr,
+	[GCC_QUPV3_WRAP_SE7_CLK] = &gcc_qupv3_wrap_se7_clk.clkr,
+	[GCC_QUPV3_WRAP_SE7_CLK_SRC] = &gcc_qupv3_wrap_se7_clk_src.clkr,
+	[GCC_REFGEN_CORE_CLK_SRC] = &gcc_refgen_core_clk_src.clkr,
+	[GCC_REFGEN_PCIE_CORE_CLK] = &gcc_refgen_pcie_core_clk.clkr,
+	[GCC_REFGEN_PCIE_HCLK] = &gcc_refgen_pcie_hclk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_APPS_CLK_SRC] = &gcc_sdcc1_apps_clk_src.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK_SRC] = &gcc_sdcc1_ice_core_clk_src.clkr,
+	[GCC_SLEEP_CLK_SRC] = &gcc_sleep_clk_src.clkr,
+	[GCC_SNOC_USB_CLK] = &gcc_snoc_usb_clk.clkr,
+	[GCC_SYSTEM_NOC_BFDCD_CLK_SRC] = &gcc_system_noc_bfdcd_clk_src.clkr,
+	[GCC_UNIPHY0_AHB_CLK] = &gcc_uniphy0_ahb_clk.clkr,
+	[GCC_UNIPHY0_SYS_CLK] = &gcc_uniphy0_sys_clk.clkr,
+	[GCC_UNIPHY1_AHB_CLK] = &gcc_uniphy1_ahb_clk.clkr,
+	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
+	[GCC_UNIPHY2_AHB_CLK] = &gcc_uniphy2_ahb_clk.clkr,
+	[GCC_UNIPHY2_SYS_CLK] = &gcc_uniphy2_sys_clk.clkr,
+	[GCC_UNIPHY_SYS_CLK_SRC] = &gcc_uniphy_sys_clk_src.clkr,
+	[GCC_USB0_AUX_CLK] = &gcc_usb0_aux_clk.clkr,
+	[GCC_USB0_AUX_CLK_SRC] = &gcc_usb0_aux_clk_src.clkr,
+	[GCC_USB0_EUD_AT_CLK] = &gcc_usb0_eud_at_clk.clkr,
+	[GCC_USB0_MASTER_CLK] = &gcc_usb0_master_clk.clkr,
+	[GCC_USB0_MASTER_CLK_SRC] = &gcc_usb0_master_clk_src.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK] = &gcc_usb0_mock_utmi_clk.clkr,
+	[GCC_USB0_MOCK_UTMI_CLK_SRC] = &gcc_usb0_mock_utmi_clk_src.clkr,
+	[GCC_USB0_MOCK_UTMI_DIV_CLK_SRC] = &gcc_usb0_mock_utmi_div_clk_src.clkr,
+	[GCC_USB0_PHY_CFG_AHB_CLK] = &gcc_usb0_phy_cfg_ahb_clk.clkr,
+	[GCC_USB0_PIPE_CLK] = &gcc_usb0_pipe_clk.clkr,
+	[GCC_USB0_PIPE_CLK_SRC] = &gcc_usb0_pipe_clk_src.clkr,
+	[GCC_USB0_SLEEP_CLK] = &gcc_usb0_sleep_clk.clkr,
+	[GCC_USB1_MASTER_CLK] = &gcc_usb1_master_clk.clkr,
+	[GCC_USB1_MOCK_UTMI_CLK] = &gcc_usb1_mock_utmi_clk.clkr,
+	[GCC_USB1_MOCK_UTMI_CLK_SRC] = &gcc_usb1_mock_utmi_clk_src.clkr,
+	[GCC_USB1_MOCK_UTMI_DIV_CLK_SRC] = &gcc_usb1_mock_utmi_div_clk_src.clkr,
+	[GCC_USB1_PHY_CFG_AHB_CLK] = &gcc_usb1_phy_cfg_ahb_clk.clkr,
+	[GCC_USB1_SLEEP_CLK] = &gcc_usb1_sleep_clk.clkr,
+	[GCC_USB_CMN_HCLK] = &gcc_usb_cmn_hclk.clkr,
+	[GCC_USB_CMN_LDO_CLK] = &gcc_usb_cmn_ldo_clk.clkr,
+	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
+	[GPLL0_MAIN] = &gpll0_main.clkr,
+	[GPLL0] = &gpll0.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL2_OUT_MAIN] = &gpll2_out_main.clkr,
+	[GPLL4] = &gpll4.clkr,
+};
+
+static const struct qcom_reset_map gcc_ipq9650_resets[] = {
+	[GCC_ADSS_BCR] = { 0x1c000 },
+	[GCC_ADSS_PWM_CLK_ARES] = { 0x1c00c, 2 },
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR] = { 0x38000 },
+	[GCC_APC0_VOLTAGE_DROOP_DETECTOR_GPLL0_CLK_ARES] = { 0x3800c, 2 },
+	[GCC_APSS_AHB_CLK_ARES] = { 0x24014, 2 },
+	[GCC_APSS_ATB_CLK_ARES] = { 0x24034, 2 },
+	[GCC_APSS_AXI_CLK_ARES] = { 0x24018, 2 },
+	[GCC_APSS_TS_CLK_ARES] = { 0x24030, 2 },
+	[GCC_BOOT_ROM_AHB_CLK_ARES] = { 0x1302c, 2 },
+	[GCC_BOOT_ROM_BCR] = { 0x13028 },
+	[GCC_CPUSS_TRIG_CLK_ARES] = { 0x2401c, 2 },
+	[GCC_GP1_CLK_ARES] = { 0x8018, 2 },
+	[GCC_GP2_CLK_ARES] = { 0x8030, 2 },
+	[GCC_GP3_CLK_ARES] = { 0x8048, 2 },
+	[GCC_MDIO_AHB_CLK_ARES] = { 0x17040, 2 },
+	[GCC_MDIO_BCR] = { 0x1703c },
+	[GCC_NSS_BCR] = { 0x17000 },
+	[GCC_NSS_TS_CLK_ARES] = { 0x17018, 2 },
+	[GCC_NSSCC_CLK_ARES] = { 0x17034, 2 },
+	[GCC_NSSCFG_CLK_ARES] = { 0x1702c, 2 },
+	[GCC_NSSNOC_ATB_CLK_ARES] = { 0x17014, 2 },
+	[GCC_NSSNOC_MEMNOC_1_CLK_ARES] = { 0x17084, 2 },
+	[GCC_NSSNOC_MEMNOC_CLK_ARES] = { 0x17024, 2 },
+	[GCC_NSSNOC_NSSCC_CLK_ARES] = { 0x17030, 2 },
+	[GCC_NSSNOC_PCNOC_1_CLK_ARES] = { 0x17080, 2 },
+	[GCC_NSSNOC_QOSGEN_REF_CLK_ARES] = { 0x1701c, 2 },
+	[GCC_NSSNOC_SNOC_1_CLK_ARES] = { 0x1707c, 2 },
+	[GCC_NSSNOC_SNOC_CLK_ARES] = { 0x17028, 2 },
+	[GCC_NSSNOC_TIMEOUT_REF_CLK_ARES] = { 0x17020, 2 },
+	[GCC_NSSNOC_XO_DCD_CLK_ARES] = { 0x17074, 2 },
+	[GCC_PCIE0_AHB_CLK_ARES] = { 0x28030, 2 },
+	[GCC_PCIE0_AUX_CLK_ARES] = { 0x28070, 2 },
+	[GCC_PCIE0_AXI_M_CLK_ARES] = { 0x28038, 2 },
+	[GCC_PCIE0_AXI_S_BRIDGE_CLK_ARES] = { 0x28048, 2 },
+	[GCC_PCIE0_AXI_S_CLK_ARES] = { 0x28040, 2 },
+	[GCC_PCIE0_BCR] = { 0x28000 },
+	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x28054 },
+	[GCC_PCIE0_PHY_BCR] = { 0x28060 },
+	[GCC_PCIE0_PIPE_CLK_ARES] = { 0x28068, 2 },
+	[GCC_PCIE0PHY_PHY_BCR] = { 0x2805c },
+	[GCC_PCIE0_PIPE_RESET] = { 0x28058, 0 },
+	[GCC_PCIE0_CORE_STICKY_RESET] = { 0x28058, 1 },
+	[GCC_PCIE0_AXI_S_STICKY_RESET] = { 0x28058, 2 },
+	[GCC_PCIE0_AXI_S_RESET] = { 0x28058, 3 },
+	[GCC_PCIE0_AXI_M_STICKY_RESET] = { 0x28058, 4 },
+	[GCC_PCIE0_AXI_M_RESET] = { 0x28058, 5 },
+	[GCC_PCIE0_AUX_RESET] = { 0x28058, 6 },
+	[GCC_PCIE0_AHB_RESET] = { 0x28058, 7 },
+	[GCC_PCIE1_AHB_CLK_ARES] = { 0x29030, 2 },
+	[GCC_PCIE1_AUX_CLK_ARES] = { 0x29074, 2 },
+	[GCC_PCIE1_AXI_M_CLK_ARES] = { 0x29038, 2 },
+	[GCC_PCIE1_AXI_S_BRIDGE_CLK_ARES] = { 0x29048, 2 },
+	[GCC_PCIE1_AXI_S_CLK_ARES] = { 0x29040, 2 },
+	[GCC_PCIE1_BCR] = { 0x29000 },
+	[GCC_PCIE1_LINK_DOWN_BCR] = { 0x29054 },
+	[GCC_PCIE1_PHY_BCR] = { 0x29060 },
+	[GCC_PCIE1_PIPE_CLK_ARES] = { 0x29068, 2 },
+	[GCC_PCIE1PHY_PHY_BCR] = { 0x2905c },
+	[GCC_PCIE1_PIPE_RESET] = { 0x29058, 0 },
+	[GCC_PCIE1_CORE_STICKY_RESET] = { 0x29058, 1 },
+	[GCC_PCIE1_AXI_S_STICKY_RESET] = { 0x29058, 2 },
+	[GCC_PCIE1_AXI_S_RESET] = { 0x29058, 3 },
+	[GCC_PCIE1_AXI_M_STICKY_RESET] = { 0x29058, 4 },
+	[GCC_PCIE1_AXI_M_RESET] = { 0x29058, 5 },
+	[GCC_PCIE1_AUX_RESET] = { 0x29058, 6 },
+	[GCC_PCIE1_AHB_RESET] = { 0x29058, 7 },
+	[GCC_PCIE2_AHB_CLK_ARES] = { 0x2a030, 2 },
+	[GCC_PCIE2_AUX_CLK_ARES] = { 0x2a078, 2 },
+	[GCC_PCIE2_AXI_M_CLK_ARES] = { 0x2a038, 2 },
+	[GCC_PCIE2_AXI_S_BRIDGE_CLK_ARES] = { 0x2a048, 2 },
+	[GCC_PCIE2_AXI_S_CLK_ARES] = { 0x2a040, 2 },
+	[GCC_PCIE2_BCR] = { 0x2a000 },
+	[GCC_PCIE2_LINK_DOWN_BCR] = { 0x2a054 },
+	[GCC_PCIE2_PHY_BCR] = { 0x2a060 },
+	[GCC_PCIE2_PIPE_CLK_ARES] = { 0x2a068, 2 },
+	[GCC_PCIE2PHY_PHY_BCR] = { 0x2a05c },
+	[GCC_PCIE2_PIPE_RESET] = { 0x2a058, 0 },
+	[GCC_PCIE2_CORE_STICKY_RESET] = { 0x2a058, 1 },
+	[GCC_PCIE2_AXI_S_STICKY_RESET] = { 0x2a058, 2 },
+	[GCC_PCIE2_AXI_S_RESET] = { 0x2a058, 3 },
+	[GCC_PCIE2_AXI_M_STICKY_RESET] = { 0x2a058, 4 },
+	[GCC_PCIE2_AXI_M_RESET] = { 0x2a058, 5 },
+	[GCC_PCIE2_AUX_RESET] = { 0x2a058, 6 },
+	[GCC_PCIE2_AHB_RESET] = { 0x2a058, 7 },
+	[GCC_PCIE3_AHB_CLK_ARES] = { 0x2b030, 2 },
+	[GCC_PCIE3_AUX_CLK_ARES] = { 0x2b07c, 2 },
+	[GCC_PCIE3_AXI_M_CLK_ARES] = { 0x2b038, 2 },
+	[GCC_PCIE3_AXI_S_BRIDGE_CLK_ARES] = { 0x2b048, 2 },
+	[GCC_PCIE3_AXI_S_CLK_ARES] = { 0x2b040, 2 },
+	[GCC_PCIE3_BCR] = { 0x2b000 },
+	[GCC_PCIE3_LINK_DOWN_BCR] = { 0x2b054 },
+	[GCC_PCIE3_PHY_BCR] = { 0x2b060 },
+	[GCC_PCIE3_PIPE_CLK_ARES] = { 0x2b068, 2 },
+	[GCC_PCIE3PHY_PHY_BCR] = { 0x2b05c },
+	[GCC_PCIE3_PIPE_RESET] = { 0x2b058, 0 },
+	[GCC_PCIE3_CORE_STICKY_RESET] = { 0x2b058, 1 },
+	[GCC_PCIE3_AXI_S_STICKY_RESET] = { 0x2b058, 2 },
+	[GCC_PCIE3_AXI_S_RESET] = { 0x2b058, 3 },
+	[GCC_PCIE3_AXI_M_STICKY_RESET] = { 0x2b058, 4 },
+	[GCC_PCIE3_AXI_M_RESET] = { 0x2b058, 5 },
+	[GCC_PCIE3_AUX_RESET] = { 0x2b058, 6 },
+	[GCC_PCIE3_AHB_RESET] = { 0x2b058, 7 },
+	[GCC_PCIE4_AHB_CLK_ARES] = { 0x2501c, 2 },
+	[GCC_PCIE4_AUX_CLK_ARES] = { 0x25020, 2 },
+	[GCC_PCIE4_AXI_M_CLK_ARES] = { 0x25028, 2 },
+	[GCC_PCIE4_AXI_S_BRIDGE_CLK_ARES] = { 0x25038, 2 },
+	[GCC_PCIE4_AXI_S_CLK_ARES] = { 0x25030, 2 },
+	[GCC_PCIE4_BCR] = { 0x25000 },
+	[GCC_PCIE4_LINK_DOWN_BCR] = { 0x25044 },
+	[GCC_PCIE4_PHY_BCR] = { 0x2504c },
+	[GCC_PCIE4_PIPE_CLK_ARES] = { 0x2503c, 2 },
+	[GCC_PCIE4_PIPE_RESET] = { 0x25054, 0 },
+	[GCC_PCIE4_CORE_STICKY_RESET] = { 0x25054, 1 },
+	[GCC_PCIE4_AXI_S_STICKY_RESET] = { 0x25054, 2 },
+	[GCC_PCIE4_AXI_S_RESET] = { 0x25054, 3 },
+	[GCC_PCIE4_AXI_M_STICKY_RESET] = { 0x25054, 4 },
+	[GCC_PCIE4_AXI_M_RESET] = { 0x25054, 5 },
+	[GCC_PCIE4_AUX_RESET] = { 0x25054, 6 },
+	[GCC_PCIE4_AHB_RESET] = { 0x25054, 7 },
+	[GCC_PCIE4PHY_PHY_BCR] = { 0x25048 },
+	[GCC_PCIE_CMN_LDO_BCR] = { 0x23028 },
+	[GCC_PRIME_SS_BCR] = { 0x26004 },
+	[GCC_PRIMESS_AHBM_CLK_ARES] = { 0x26038, 2 },
+	[GCC_PRIMESS_AHBM_PARTIAL_CLK_ARES] = { 0x26040, 2 },
+	[GCC_PRIMESS_AHBS_CLK_ARES] = { 0x26034, 2 },
+	[GCC_PRIMESS_ATB_CLK_ARES] = { 0x26030, 2 },
+	[GCC_PRIMESS_AXIM_CLK_ARES] = { 0x2602c, 2 },
+	[GCC_PRIMESS_AXIM_PARTIAL_CLK_ARES] = { 0x2603c, 2 },
+	[GCC_PRIMESS_CLK_ARES] = { 0x26028, 2 },
+	[GCC_PRIMESS_XO_CLK_ARES] = { 0x26024, 2 },
+	[GCC_QDSS_APB2JTAG_CLK_ARES] = { 0x2d05c, 2 },
+	[GCC_QDSS_AT_CLK_ARES] = { 0x2d034, 2 },
+	[GCC_QDSS_BCR] = { 0x2d000 },
+	[GCC_QDSS_CFG_AHB_CLK_ARES] = { 0x2d068, 2 },
+	[GCC_QDSS_DAP_AHB_CLK_ARES] = { 0x2d064, 2 },
+	[GCC_QDSS_DAP_CLK_ARES] = { 0x2d058, 2 },
+	[GCC_QDSS_ETR_USB_CLK_ARES] = { 0x2d060, 2 },
+	[GCC_QDSS_EUD_AT_CLK_ARES] = { 0x2d06c, 2 },
+	[GCC_QDSS_STM_CLK_ARES] = { 0x2d03c, 2 },
+	[GCC_QDSS_TRACECLKIN_CLK_ARES] = { 0x2d040, 2 },
+	[GCC_QDSS_TS_CLK_ARES] = { 0x2d078, 2 },
+	[GCC_QDSS_TSCTR_DIV16_CLK_ARES] = { 0x2d054, 2 },
+	[GCC_QDSS_TSCTR_DIV2_CLK_ARES] = { 0x2d044, 2 },
+	[GCC_QDSS_TSCTR_DIV3_CLK_ARES] = { 0x2d048, 2 },
+	[GCC_QDSS_TSCTR_DIV4_CLK_ARES] = { 0x2d04c, 2 },
+	[GCC_QDSS_TSCTR_DIV8_CLK_ARES] = { 0x2d050, 2 },
+	[GCC_QPIC_AHB_CLK_ARES] = { 0x32010, 2 },
+	[GCC_QPIC_CLK_ARES] = { 0x32028, 2 },
+	[GCC_QPIC_BCR] = { 0x32000 },
+	[GCC_QPIC_IO_MACRO_CLK_ARES] = { 0x3200c, 2 },
+	[GCC_QPIC_SLEEP_CLK_ARES] = { 0x32018, 2 },
+	[GCC_QUPV3_2X_CORE_CLK_ARES] = { 0x1020, 2 },
+	[GCC_QUPV3_AHB_MST_CLK_ARES] = { 0x1014, 2 },
+	[GCC_QUPV3_AHB_SLV_CLK_ARES] = { 0x102c, 2 },
+	[GCC_QUPV3_BCR] = { 0x1000 },
+	[GCC_QUPV3_CORE_CLK_ARES] = { 0x1018, 2 },
+	[GCC_QUPV3_WRAP_SE0_CLK_ARES] = { 0x202c, 2 },
+	[GCC_QUPV3_WRAP_SE0_BCR] = { 0x2000 },
+	[GCC_QUPV3_WRAP_SE1_CLK_ARES] = { 0x302c, 2 },
+	[GCC_QUPV3_WRAP_SE1_BCR] = { 0x3000 },
+	[GCC_QUPV3_WRAP_SE2_CLK_ARES] = { 0x3048, 2 },
+	[GCC_QUPV3_WRAP_SE2_BCR] = { 0x3030 },
+	[GCC_QUPV3_WRAP_SE3_CLK_ARES] = { 0x3064, 2 },
+	[GCC_QUPV3_WRAP_SE3_BCR] = { 0x304c },
+	[GCC_QUPV3_WRAP_SE4_CLK_ARES] = { 0x3080, 2 },
+	[GCC_QUPV3_WRAP_SE4_BCR] = { 0x3068 },
+	[GCC_QUPV3_WRAP_SE5_CLK_ARES] = { 0x30a4, 2 },
+	[GCC_QUPV3_WRAP_SE5_BCR] = { 0x308c },
+	[GCC_QUPV3_WRAP_SE6_CLK_ARES] = { 0x4018, 2 },
+	[GCC_QUPV3_WRAP_SE6_BCR] = { 0x4000 },
+	[GCC_QUPV3_WRAP_SE7_CLK_ARES] = { 0x4034, 2 },
+	[GCC_QUPV3_WRAP_SE7_BCR] = { 0x401c },
+	[GCC_QUSB2_0_PHY_BCR] = { 0x2c068 },
+	[GCC_QUSB2_1_PHY_BCR] = { 0x3c030 },
+	[GCC_REFGEN_PCIE_BCR] = { 0x2301c },
+	[GCC_REFGEN_PCIE_CORE_CLK_ARES] = { 0x23020, 2 },
+	[GCC_SDCC1_APPS_CLK_ARES] = { 0x3302c, 2 },
+	[GCC_SDCC1_ICE_CORE_CLK_ARES] = { 0x33034, 2 },
+	[GCC_SDCC_BCR] = { 0x33000 },
+	[GCC_TLMM_AHB_CLK_ARES] = { 0x3e004, 2 },
+	[GCC_TLMM_CLK_ARES] = { 0x3e008, 2 },
+	[GCC_TLMM_BCR] = { 0x3e000 },
+	[GCC_UNIPHY0_AHB_CLK_ARES] = { 0x1704c, 2 },
+	[GCC_UNIPHY0_BCR] = { 0x17044 },
+	[GCC_UNIPHY0_PMA_BCR] = { 0x17098 },
+	[GCC_UNIPHY0_SYS_CLK_ARES] = { 0x17048, 2 },
+	[GCC_UNIPHY1_AHB_CLK_ARES] = { 0x1705c, 2 },
+	[GCC_UNIPHY1_BCR] = { 0x17054 },
+	[GCC_UNIPHY1_PMA_BCR] = { 0x1709c },
+	[GCC_UNIPHY1_SYS_CLK_ARES] = { 0x17058, 2 },
+	[GCC_UNIPHY2_AHB_CLK_ARES] = { 0x1706c, 2 },
+	[GCC_UNIPHY2_BCR] = { 0x17064 },
+	[GCC_UNIPHY2_PMA_BCR] = { 0x170a0 },
+	[GCC_UNIPHY2_SYS_CLK_ARES] = { 0x17068, 2 },
+	[GCC_UNIPHY0_XPCS_ARES] = { 0x17050, 2 },
+	[GCC_UNIPHY1_XLGPCS_ARES] = { 0x17060, 1 },
+	[GCC_UNIPHY1_XPCS_ARES] = { 0x17060, 2 },
+	[GCC_UNIPHY2_XLGPCS_ARES] = { 0x17070, 1 },
+	[GCC_UNIPHY2_XPCS_ARES] = { 0x17070, 2 },
+	[GCC_USB0_AUX_CLK_ARES] = { 0x2c04c, 2 },
+	[GCC_USB0_MASTER_CLK_ARES] = { 0x2c044, 2 },
+	[GCC_USB0_MOCK_UTMI_CLK_ARES] = { 0x2c050, 2 },
+	[GCC_USB0_PHY_BCR] = { 0x2c06c },
+	[GCC_USB0_PHY_CFG_AHB_CLK_ARES] = { 0x2c05c, 2 },
+	[GCC_USB0_PIPE_CLK_ARES] = { 0x2c054, 2 },
+	[GCC_USB0_SLEEP_CLK_ARES] = { 0x2c058, 2 },
+	[GCC_USB1_BCR] = { 0x3c000 },
+	[GCC_USB1_MASTER_CLK_ARES] = { 0x3c028, 2 },
+	[GCC_USB1_MOCK_UTMI_CLK_ARES] = { 0x3c024, 2 },
+	[GCC_USB1_PHY_CFG_AHB_CLK_ARES] = { 0x3c01c, 2 },
+	[GCC_USB1_SLEEP_CLK_ARES] = { 0x3c020, 2 },
+	[GCC_USB3PHY_0_PHY_BCR] = { 0x2c070 },
+	[GCC_USB_BCR] = { 0x2c000 },
+	[GCC_USB_CMN_LDO_BCR] = { 0x23034 },
+};
+
+static const struct of_device_id gcc_ipq9650_match_table[] = {
+	{ .compatible = "qcom,ipq9650-gcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gcc_ipq9650_match_table);
+
+static const struct regmap_config gcc_ipq9650_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x3f024,
+	.fast_io        = true,
+};
+
+static struct clk_hw *gcc_ipq9650_hws[] = {
+	&gpll0_div2.hw,
+	&gcc_xo_div4_clk_src.hw,
+	&gcc_qdss_dap_sync_clk_src.hw,
+	&gcc_eud_at_div_clk_src.hw,
+};
+
+static const struct qcom_cc_desc gcc_ipq9650_desc = {
+	.config = &gcc_ipq9650_regmap_config,
+	.clks = gcc_ipq9650_clocks,
+	.num_clks = ARRAY_SIZE(gcc_ipq9650_clocks),
+	.resets = gcc_ipq9650_resets,
+	.num_resets = ARRAY_SIZE(gcc_ipq9650_resets),
+	.clk_hws = gcc_ipq9650_hws,
+	.num_clk_hws = ARRAY_SIZE(gcc_ipq9650_hws),
+};
+
+static int gcc_ipq9650_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gcc_ipq9650_desc);
+}
+
+static struct platform_driver gcc_ipq9650_driver = {
+	.probe = gcc_ipq9650_probe,
+	.driver = {
+		.name   = "qcom,gcc-ipq9650",
+		.of_match_table = gcc_ipq9650_match_table,
+	},
+};
+
+static int __init gcc_ipq9650_init(void)
+{
+	return platform_driver_register(&gcc_ipq9650_driver);
+}
+core_initcall(gcc_ipq9650_init);
+
+static void __exit gcc_ipq9650_exit(void)
+{
+	platform_driver_unregister(&gcc_ipq9650_driver);
+}
+module_exit(gcc_ipq9650_exit);
+
+MODULE_DESCRIPTION("QTI GCC IPQ9650 Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


