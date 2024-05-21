Return-Path: <linux-arm-msm+bounces-20143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5458CB3AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83CED1C20949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B543D1494D0;
	Tue, 21 May 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dv6fvSdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE00148FEB;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316848; cv=none; b=mc+wEbE0KSTQh24Q0qI2vyi0giY16apVH5+Xd53PntdfGYOoFwL4bjJ7jVaVRIbdau1JqMbpauPwtNwqQZ0g0n4BHQLLNV8QNDeRiqvEghPK2zmcNMYkNh2no4GtNNqYwuxPLtetb8XscmGdwjl6QI2pkfuLCPOeZ/hj7eU6s+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316848; c=relaxed/simple;
	bh=8KuC+8An/+QRes8Bri7TPb+7ESdJc5p96EB5KfxVkWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q+EiUG++nPviXXSzBKrzUmQQQoW+uKrQ0oGfMnHPwx+K6qMSEFbJjry4YbSy1o80TfexfSRH1O5RR4SrKaq1uZVYXS6XTXO25CEA9UcmonaPqPDrtnQBD7/aAz4ZXJ71fNVrEyT8NMlpexua+zf1tPk789Rm817YGERmtYf8/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dv6fvSdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LDQASj031060;
	Tue, 21 May 2024 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=88NHDvPij+mRH8DRPYPERvabYSKAr78Aq4d8qESSJx4
	=; b=Dv6fvSdOfeRP1fIaLkqdmwaCjRcYmAwdjuGU1MBW/AaJ6wv38o4WVS711eO
	EzglyCJyd9YtQLdYSj8Xr7GtHtNoBW7kdZ2z0M80l3ftY6C0qeGLkCvBMabXz9c/
	/4NoyU/TO9TbSoFGFjuLfq3RUPYmKF7kBTSdfO66aw+bwxzC84ATULDxndFDvNBj
	L6BW/+0MnTdy9jcnKcRBi4zOK/7UdlpB0S1123I9PyVFbYBG+MU2575wq8J/DUnR
	ywl10jXu5SQMzFQmbnMP1aFHaVFlK+I7mTBp3h1V0YdzcwMWxLkYZDIrBKqGvuiN
	H4xvn42swtXg2yMSXCtH3E9/dwA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45pue7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcQTw012119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:26 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:26 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:00 -0700
Subject: [PATCH RFC v3 3/9] fdt-select-board: Add test tool for selecting
 dtbs based on board-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-3-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K5cwYU7NhjfDktkbDUzCLcw99Op14pQM
X-Proofpoint-ORIG-GUID: K5cwYU7NhjfDktkbDUzCLcw99Op14pQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210140

Introduce a tool which scores devicetrees based on their board-id and a
supplied reference devicetree. This mechanism would be most similar to
an proposal to EBBR where firmware provides a reference devicetree which
contains the actual board identifier values, and an OS loader can
choose to replace (or overlay) the firmware-provided devicetree.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 scripts/dtc/.gitignore         |   1 +
 scripts/dtc/Makefile           |   3 +-
 scripts/dtc/fdt-select-board.c | 126 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..7f6d5202c0ba 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdt-select-board
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 4d32b9497da9..a331f07091b3 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdt-select-board
 hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -14,6 +14,7 @@ dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdt-select-board-objs := $(libfdt) fdt-select-board.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
diff --git a/scripts/dtc/fdt-select-board.c b/scripts/dtc/fdt-select-board.c
new file mode 100644
index 000000000000..a7f3dc715ed1
--- /dev/null
+++ b/scripts/dtc/fdt-select-board.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <ctype.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <inttypes.h>
+
+#include <libfdt.h>
+
+#include "util.h"
+
+static const char usage_synopsis[] =
+	"find the best matching device tree from a reference board\n"
+	"	fdt-select-board <options> [<candidate.dtb>]\n"
+	"\n";
+static const char usage_short_opts[] = "r:av" USAGE_COMMON_SHORT_OPTS;
+static const struct option usage_long_opts[] = {
+	{"reference", required_argument, NULL, 'r'},
+	{"verbose",	    no_argument, NULL, 'v'},
+	{"all",		    no_argument, NULL, 'a'},
+	USAGE_COMMON_LONG_OPTS
+};
+
+static const char * const usage_opts_help[] = {
+	"Reference DTB",
+	"Verbose messages",
+	"List all matches",
+	USAGE_COMMON_OPTS_HELP
+};
+
+int verbose = 0;
+
+struct context {
+	const void *fdt;
+	int node;
+};
+
+static const void *get_board_id(void *ctx, const char *name, int *datalen)
+{
+	struct context *c = ctx;
+
+	return fdt_getprop(c->fdt, c->node, name, datalen);
+}
+
+int main(int argc, char *argv[])
+{
+	int opt;
+	char *input_filename = NULL;
+	const void *fdt;
+	const void *ref;
+	int ref_node;
+	int max_score = -1;
+	const char *best_match = NULL;
+	struct context ctx;
+	int all = 0;
+
+	while ((opt = util_getopt_long()) != EOF) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+
+		case 'a':
+			all = 1;
+			break;
+		case 'r':
+			input_filename = optarg;
+			break;
+		case 'v':
+			verbose = 1;
+			break;
+		}
+	}
+
+	if (!input_filename)
+		usage("missing reference file");
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc <= 0)
+		usage("missing candidate dtbs");
+
+	ref = utilfdt_read(input_filename, NULL);
+	if (!ref) {
+		fprintf(stderr, "failed to read reference %s\n", input_filename);
+		return -1;
+	}
+
+	ref_node = fdt_path_offset(ref, "/board-id");
+	if (ref_node < 0) {
+		fprintf(stderr, "reference blob doesn't have a board-id\n");
+		return -1;
+	}
+
+	ctx.fdt = ref;
+	ctx.node = ref_node;
+
+	for (; argc > 0; --argc, ++argv) {
+		int score;
+
+		fdt = utilfdt_read(*argv, NULL);
+		if (!fdt) {
+			fprintf(stderr, "failed to read %s\n", *argv);
+			return -1;
+		}
+
+		score = fdt_board_id_score(fdt, get_board_id, &ctx);
+		if (verbose || (score > 0 && all))
+			printf("%s: %d\n", *argv, score);
+
+		if (score > max_score) {
+			max_score = score;
+			best_match = *argv;
+		}
+
+		free(fdt);
+	}
+
+	if (best_match && !all)
+		printf("%s\n", best_match);
+
+	return 0;
+}

-- 
2.34.1


