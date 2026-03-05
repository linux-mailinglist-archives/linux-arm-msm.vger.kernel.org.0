Return-Path: <linux-arm-msm+bounces-95595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLceEgpeqWlc6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9720FDBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFE3F306151B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EE0378D6E;
	Thu,  5 Mar 2026 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9iBW2f+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvQPElHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483403822A1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707231; cv=none; b=FrL8v+628WdFCmWThxlade2Gee3AIUVWdS/apBRkWTHJuazNPZc7AnjHX+XNh1To1SPtaU+zC0WC3ksKERNSoClx9Rpa+sP2My4mC7Fi674b4PeHZzSx66itLHnDvkqD0M00q4qRvFoLjDFljQUSEn2PDUpOwUm9mBaO4r5DHAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707231; c=relaxed/simple;
	bh=OA2bwO3rnQqJfDFnh4fnUsExHgqvuoQdvQMVgawEU7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrIjnCYe7k4ZAtCUs6/bC8O2CtMJuZnfkrOaTuHiSrs0aFClwej/7r8oOhp4nZjJSqWuWITqvcJFlT/cYVSQVtSFM+W4k3fJv2+0YMzPct3cdRWmZH5mMfAYQDJ+VtMANiMUavt3YKtP+0bfAFaubgGlvQqwEQvQGNbpibutxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9iBW2f+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvQPElHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpSa1517938
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOhCHllWv8Y31vu7KE8vGple2wWXZoiwYqq5Hq/cwGk=; b=S9iBW2f+urBFcm+R
	s9rBNYD+jg87P/VAdk9cbJLwBSwM2uTiHh9GEvIaItCChGsOYdUdDmg/a2XwK+dH
	BfDL88N83KAkzPGiWZisry5tgJqjczGvs+olUQGO2CrAXJUtbAnLdkff/B5P5KP0
	r1xFv3CcUEUPil3worLZcavVEEV3JusAZ32PjPqFYB9GuSJ3Rdc5SpPOVc0vj2ox
	vBUTpdW5lq8s4UoiNrYpQJ8ficwdlDB1+bF6nuffMYsDhBAoDrjJLEPxa4GEjuKQ
	/KRJDrDS+YADQM20Col5vMS9FniNutWBC2vfxpuOLHdfCZIZhR+w9Uysp86Gt2IQ
	OLdUHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptjc75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:40:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so7389939a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772707227; x=1773312027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOhCHllWv8Y31vu7KE8vGple2wWXZoiwYqq5Hq/cwGk=;
        b=XvQPElHl6+0/V26UemeiViZ3ftQlTW+YTOa8PL2q4I3NvRrrOmGrRbi7d64o3I3MS9
         W9XDBmlAnMUxQLqY9+dyqo/2oJGJlHzuGsW++hN9rkBOzSxnQFLCKPJpR8BKCNIHU/Sf
         l8OxuvTW3twDdGjdo6x8/NMiHs3bqDnAGfcm+bWLLM02jnkeSW+7tMisRCmbbUspiq1z
         KQhhGrQVd1HzkZyUFsZXo4Deo9zkhGhb2Jk4n8GV3DOG0n7AjXv/+aB0V+oJ63nTVh6S
         9v3saVEmMKDceTtruD2XWgZ5SXVridiRyvGT+xb8DSU6hE/I5CzWmKb9sO6GkwnWWKRb
         hqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707227; x=1773312027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOhCHllWv8Y31vu7KE8vGple2wWXZoiwYqq5Hq/cwGk=;
        b=NUVrCbWnovHc+zxdbc/0LdSJW9nlJZqm2r4miDFr89SnyxpBPA+4HIEkcTDi8Bl/on
         wZ6eimyQMq1UD4y0NeqABNGeHmCdCzKOcmQdTfTjPCPqNKK88BV12kBMuf9wo7HPAmgD
         MlqGlfq2vTJrKJIvCxKLgCRGrIxeAZZc0hTUiThJ1/JIMsCurE1gR07KRxZjWlQqrMcE
         8xZ6mxsQP9tgdr1oUMQBvCU8LPYYLkPYCeY7mai/GN4GHAIOIS6IaSTBnbkvnxsDbrAd
         G75OfGFGMOJwvoNGNspYvSAw8NiooLWi7MTapgujSoI3iHkNRuqn41NFmz4nkGKKLYoG
         WOJg==
X-Forwarded-Encrypted: i=1; AJvYcCXnPURiUTYY7Ejigpapp4Y/W2D5U7JUJ/zmJA0dNd6zfb/yBK9jA2rd0ZPtRBqKynuhomlcxwoSPaf690VS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw758mhUecMdK3KlywPCHrUgqN7JBm9562tE65JLeAaqKO1QpSo
	OoP4W1EOEi2JOolBxP+9aGLZXs9yUoA4ie+FUpOGUXzmyEh17tXhfQepHC3SNGYefgdjIhr4KGF
	9Tmom41M0h9Xi8dVHHC2NR7ohRvy3BNpJj1jbajtFHhe7SqFSgVLU9DQWA0tZLw3dl3kz
X-Gm-Gg: ATEYQzyyn4dI/APQrl+nzpVlYeUHqnfBCqZdLhtp0Lq0faTiWvhxstNO8JfrTICxYkp
	Qu+BfZ7m/CZ5vaVkeedxQa7UyJSbGIAA7ccOJcd5EtWLWOsJYFZJkqWxPpaLfpEAASRd3R4fhzI
	L5v1BJxmqibFOaXjRJ7QhQOAjFdlhE6/Lu4QmX702lJSPgQEtMBjHe3yQdqWMKG/DvGlntKj9v2
	OmWyZ2przPKtDlvFcce6Z22Dae0ZGijUi/tcA+THxG7sYCI78oCMq97oMEBTSGdMAxeRkGQTo3z
	w1cbuDRm84IjPAT6cKuxiz3I5s/HCAYHsYn3UrOs8Ba7bTAdZOPcwNsVsb2tCVgeWBjEyvIqVC0
	DZ/SP4Njcnx/EknqV9wEDvYa+lOpqe4G2S+0d5pzJWrGhMw==
X-Received: by 2002:a17:902:e743:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2ae6a9ed63dmr51580325ad.16.1772707227351;
        Thu, 05 Mar 2026 02:40:27 -0800 (PST)
X-Received: by 2002:a17:902:e743:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2ae6a9ed63dmr51579965ad.16.1772707226764;
        Thu, 05 Mar 2026 02:40:26 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4650000dsm134429325ad.54.2026.03.05.02.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:40:26 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:10:09 +0530
Subject: [PATCH v5 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpucc_sm8750_v2-v5-2-78292b40b053@oss.qualcomm.com>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
In-Reply-To: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NiBTYWx0ZWRfX9a/BqnTV4UqE
 fA12sTs+MZ9WEbCW5TOn+d81sOsp2damQT+xpLMfT33K+8UjJiRujhfhHYnPtYTCKs1nbUwzr5c
 RlLba9aedAGASdWHtrs4ntV2NADMWjAUM6+SI6bMcuxwaeHJuxnpmeZbGwzfpOASGwgQRinrDL3
 hMY0cJh0bzsPcZBur8H4w/HM22vPcIChIFjroZHyshPWrFhN5f71Q6tT1F0cIWRHp1NbKywAkvt
 9AL0ph8k154v++OoHwqAOfZwV27JFHiTwC7peB2o2wv193HOTEHZiRkrR1Hinq9QrfeketPdcdG
 NYkBXR3Hu2r0kzRY5du2GOnNI+VEqlJJTGUkoZfjv742crMeFEWJKbdqhDGUtUx2q6C+G/2aw17
 GSPYnp9KeFkwgLZgZn5c/msxlpgQioFuKyLpXO2i8N0hCaxGPiU1N2umVaSEIMyAbgQbT7Mgy9M
 o8EAMGa3LqMg3CZNbbw==
X-Proofpoint-ORIG-GUID: sszPowZAyCukK1TGA0aNJ6klLDVBu0iO
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a95d9c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PLT511quuigA__OA0o4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: sszPowZAyCukK1TGA0aNJ6klLDVBu0iO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050086
X-Rspamd-Queue-Id: AEA9720FDBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-95595-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

Update the compatible for Graphics GX Clock Controller for SM8750 as the
GX clock controller is a reuse of the Kaanapali driver.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/gpucc-sm8750.c       | 473 ++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c |   1 +
 4 files changed, 484 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb7445e396048a5bba23fce8d719281f..e4ec41e3dc7dee43a5682a3bd93297785e67e41f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1481,6 +1481,15 @@ config SM_GPUCC_8650
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
+config SM_GPUCC_8750
+	tristate "SM8750 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_8750
+	help
+	  Support for the graphics clock controller on SM8750 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..817b13f5e78cb534e165b09d95e70cd4a58b12bd 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
 obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
 obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
 obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
+obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
 obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
 obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
 obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
new file mode 100644
index 0000000000000000000000000000000000000000..5d52c6d8b5e51356ee691d8a2ef46e80bffab0cb
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_GPLL0_OUT_MAIN,
+	DT_GPLL0_OUT_MAIN_DIV,
+};
+
+enum {
+	P_BI_TCXO,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL0_OUT_EVEN,
+	P_GPU_CC_PLL0_OUT_MAIN,
+	P_GPU_CC_PLL0_OUT_ODD,
+};
+
+static const struct pll_vco taycan_elu_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+static const struct alpha_pll_config gpu_cc_pll0_config = {
+	.l = 0x34,
+	.alpha = 0x1555,
+	.config_ctl_val = 0x19660387,
+	.config_ctl_hi_val = 0x098060a0,
+	.config_ctl_hi1_val = 0xb416cb20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll gpu_cc_pll0 = {
+	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
+	.vco_table = taycan_elu_vco,
+	.num_vco = ARRAY_SIZE(taycan_elu_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_elu_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_gpu_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv gpu_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_gpu_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_gpu_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_elu_ops,
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPU_CC_PLL0_OUT_EVEN, 2 },
+	{ P_GPU_CC_PLL0_OUT_ODD, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .hw = &gpu_cc_pll0_out_even.clkr.hw },
+	{ .hw = &gpu_cc_pll0.clkr.hw },
+	{ .index = DT_GPLL0_OUT_MAIN },
+	{ .index = DT_GPLL0_OUT_MAIN_DIV },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(500000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(687500000, P_GPU_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x9318,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gpu_cc_hub_clk_src[] = {
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_hub_clk_src = {
+	.cmd_rcgr = 0x93ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_1,
+	.freq_tbl = ftbl_gpu_cc_hub_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_clk_src",
+		.parent_data = gpu_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div gpu_cc_hub_div_clk_src = {
+	.reg = 0x942c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gpu_cc_hub_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpu_cc_hub_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_ahb_clk = {
+	.halt_reg = 0x90bc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x90bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_accu_shift_clk = {
+	.halt_reg = 0x910c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x910c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x90d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x90e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x90e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_demet_clk = {
+	.halt_reg = 0x9010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_demet_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_dpm_clk = {
+	.halt_reg = 0x9110,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9110,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_dpm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_freq_measure_clk = {
+	.halt_reg = 0x900c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x900c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_freq_measure_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_accu_shift_clk = {
+	.halt_reg = 0x9070,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x9070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_accu_shift_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_gx_gmu_clk = {
+	.halt_reg = 0x9060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_gx_gmu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
+	.halt_reg = 0x7000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x7000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hlos1_vote_gpu_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_aon_clk = {
+	.halt_reg = 0x93e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x93e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_aon_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_hub_cx_int_clk = {
+	.halt_reg = 0x90e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_hub_cx_int_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_hub_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_memnoc_gfx_clk = {
+	.halt_reg = 0x90f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x90f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gpu_cc_memnoc_gfx_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc gpu_cc_cx_gdsc = {
+	.gdscr = 0x9080,
+	.gds_hw_ctrl = 0x9094,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
+	.pd = {
+		.name = "gpu_cc_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
+};
+
+static struct clk_regmap *gpu_cc_sm8750_clocks[] = {
+	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
+	[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_DEMET_CLK] = &gpu_cc_demet_clk.clkr,
+	[GPU_CC_DPM_CLK] = &gpu_cc_dpm_clk.clkr,
+	[GPU_CC_FREQ_MEASURE_CLK] = &gpu_cc_freq_measure_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr,
+	[GPU_CC_GX_GMU_CLK] = &gpu_cc_gx_gmu_clk.clkr,
+	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
+	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
+	[GPU_CC_HUB_CLK_SRC] = &gpu_cc_hub_clk_src.clkr,
+	[GPU_CC_HUB_CX_INT_CLK] = &gpu_cc_hub_cx_int_clk.clkr,
+	[GPU_CC_HUB_DIV_CLK_SRC] = &gpu_cc_hub_div_clk_src.clkr,
+	[GPU_CC_MEMNOC_GFX_CLK] = &gpu_cc_memnoc_gfx_clk.clkr,
+	[GPU_CC_PLL0] = &gpu_cc_pll0.clkr,
+	[GPU_CC_PLL0_OUT_EVEN] = &gpu_cc_pll0_out_even.clkr,
+};
+
+static struct gdsc *gpu_cc_sm8750_gdscs[] = {
+	[GPU_CC_CX_GDSC] = &gpu_cc_cx_gdsc,
+};
+
+static const struct qcom_reset_map gpu_cc_sm8750_resets[] = {
+	[GPU_CC_GPU_CC_XO_BCR] = { 0x9000 },
+	[GPU_CC_GPU_CC_GX_BCR] = { 0x905c },
+	[GPU_CC_GPU_CC_CX_BCR] = { 0x907c },
+	[GPU_CC_GPU_CC_GMU_BCR] = { 0x9314 },
+	[GPU_CC_GPU_CC_CB_BCR] = { 0x93a0 },
+	[GPU_CC_GPU_CC_FAST_HUB_BCR] = { 0x93e4 },
+};
+
+static const struct regmap_config gpu_cc_sm8750_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9800,
+	.fast_io = true,
+};
+
+static struct clk_alpha_pll *gpu_cc_alpha_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static u32 gpu_cc_sm8750_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_RSCC_XO_AON_CLK */
+	0x9008, /* GPU_CC_CXO_AON_CLK */
+	0x9064, /* GPU_CC_GX_AHB_FF_CLK */
+	0x90cc, /* GPU_CC_SLEEP_CLK */
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x93a8, /* GPU_CC_RSCC_HUB_AON_CLK */
+};
+
+static struct qcom_cc_driver_data gpu_cc_sm8750_driver_data = {
+	.alpha_plls = gpu_cc_alpha_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_alpha_plls),
+	.clk_cbcrs = gpu_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8750_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc gpu_cc_sm8750_desc = {
+	.config = &gpu_cc_sm8750_regmap_config,
+	.clks = gpu_cc_sm8750_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sm8750_clocks),
+	.resets = gpu_cc_sm8750_resets,
+	.num_resets = ARRAY_SIZE(gpu_cc_sm8750_resets),
+	.gdscs = gpu_cc_sm8750_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sm8750_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_sm8750_driver_data,
+};
+
+static const struct of_device_id gpu_cc_sm8750_match_table[] = {
+	{ .compatible = "qcom,sm8750-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sm8750_match_table);
+
+static int gpu_cc_sm8750_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &gpu_cc_sm8750_desc);
+}
+
+static struct platform_driver gpu_cc_sm8750_driver = {
+	.probe = gpu_cc_sm8750_probe,
+	.driver = {
+		.name = "sm8750-gpucc",
+		.of_match_table = gpu_cc_sm8750_match_table,
+	},
+};
+module_platform_driver(gpu_cc_sm8750_driver);
+
+MODULE_DESCRIPTION("QTI GPU_CC SM8750 Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index c209ce5fe4f003aabefd4421eb4f5662e257912a..d46243ee2ddaaa233361dc00a2f64d85ee4ebcaf 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -53,6 +53,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
 	{ .compatible = "qcom,kaanapali-gxclkctl" },
+	{ .compatible = "qcom,sm8750-gxclkctl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gx_clkctl_kaanapali_match_table);

-- 
2.34.1


