Return-Path: <linux-arm-msm+bounces-106001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEi1OmAe+mmzJwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:44:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2704D18D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CA953034BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99FD48B36F;
	Tue,  5 May 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Szo4uhuE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj+MrjbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD69492188
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999293; cv=none; b=Xj8J2BDn+J/cfkZI9IPolAOtrqzilyp5OepC4L7JcdOZd3Y32PFfRB2wf3kJ1TzitWQ4+oad/vyLy15l+DPnFYEGaPh70jYRfl0+vUn7NDXxf3kK1nzGmpig94iN9/rBHHA/VKsA/cKUn4pfIdTdWXuRAAwitzwGU4vUXc7xQHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999293; c=relaxed/simple;
	bh=m4A4p2vgY66H2BXnyGEiC0ZiUW0uR0Y5xJ8Y+BB/x3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxIEhrm3Y8igNyhy/2+RDn+47KlRbJ5XowVvpp8tYhQWZpCAuF2hSCygBHai0LzZf2TglevPVRW2+kbzo36U8ylz345GSMeTrmDxYuFqURghhvxy2/Af5ZjREt38L9MlOgcjbCgNpN7Z5Uw+Wrg+vFDbE4f1QYrXPLpD94d+jRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Szo4uhuE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj+MrjbA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645DBdF53187628
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1HuIPnJ1SK+SXNAFqYBOj3egwLSZpfLFZ0p05LH4qQ=; b=Szo4uhuEjaTXvdb9
	eZ+lEZfWj7yjsmB4ksdT/SiahsBGHC2nMAUBHELkSLIbpWGzZtm0XmivpAEuPpd0
	4L1S7neU/SU+9UwNqOelSJghQgEWp/aHUlOaHI4j+kOItIPj21IoNyXSlZBtY8L/
	FWZYgcwPj0JbWyzdrhmHJu3gECPqpllRPo1B9px7rS9Km68ijPTkZXoiKidpj72j
	Hb/DUEPBixmHJiGlZLd1FTqG7FYPEHM/KxErxGn80t34MchDhiC6QqrRO/MmR6r8
	XYsxlDkzauJss69QrWediONwQlwt8t3MtPlCUVKn0sFKybYMHJ4fkYMC1Fx5hYN+
	hmJKkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkkab1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 16:41:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36521936155so2730556a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777999288; x=1778604088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1HuIPnJ1SK+SXNAFqYBOj3egwLSZpfLFZ0p05LH4qQ=;
        b=Nj+MrjbAJ3E+148KyRUqvlBGzMQqPfmpDvuEeRXMAeTync9dwO1nHLg/A/sI/ZC8Pq
         DYESJ+6xAJDujdAIIL8pa8vTW4rq9yNBQIBxt7wiO96QntmQ2xjUP+E1rYj5zFaSgeG0
         DF31vNmoRjPi03gZ+EEUNIvJgRjpbNgSmhGWDNPqlbwhUIHERht3Tu22rTEv3ht8iHHr
         xnlRE4xhDOKIzBoW5pTQe6GuHmYc8NlByRUsXUw+cNcBaF5fqSNNpE7JUZm+Pe2DdB0n
         ZhWxsKDGqDaABf3+Gooxm8frixNxNQGI1XrZcJWorWVTUm0oQnlxZeRyPXBYFG2uw7lI
         kqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999288; x=1778604088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1HuIPnJ1SK+SXNAFqYBOj3egwLSZpfLFZ0p05LH4qQ=;
        b=L3/q4TYqabgSZXarQABXZhHcrtbIKjVOg3bjn2npMwfgMHg4SeWg8ETpOti6MJbxAr
         BcoGlDk/xhEtUZcXTgvstSgHXy59pBjzV5YSMozBfQl5ziyuVea6mOSIKpcUreYPXjPn
         DWPixcunt/jS9HbzcOcRL+V7zfpioo9xHMYEuwwDLuVNFT25qi7qrYRi3a1lODMlk8WQ
         sfYmTK2xLbC0rNpvybgZenBn32+0SgX7jYsLxK4x/K85EZOmULHcLL3rYnconEG7Xo0r
         GBUXP4YHQVb8pZjk0YDkQqhA1QvL7Hesx8P7qhs/Li3miP6z1+cYWtZL4eQiP13x10jE
         BzDA==
X-Gm-Message-State: AOJu0Yy6XMIC666QTnfPYd73G9CPQ9tp4Pph+GXrwAt1iKKNtsXs9bWa
	EHjJmtjzPKmeXNYSbWEhp5EGeuKCEw0pMI3Fy0rHQfZHfn1InN5CRxxdJOM/RoFYM9+VTwL7/S5
	2HRs/9zWOIP0afb5E/NfQZUibt857BEcacrmQHOBEbihol2+x9RfZwE7cpKCSNpUx400owc4Z9G
	AZ
X-Gm-Gg: AeBDiessTywox2MZu+kG03pRlVT5IeLwXIENrIaUfSkle6VeHGR7IFMaFLp1FThNabx
	0J+O16m60ws8PS8zsNUNgrB8q6WYneQU1hygbPoxTy/5MucThiSmLNx6tRE8EyXt8y4heplhIuV
	F09fM/24BynJi7wYSR14IQK94I6BQthqZ8kfWrxbTdMxlxChPQTFRg4j5GgRb/mDAT8HKBkEGpo
	pVnikD/hYp+Bg9ZrhBx7XnwWLR+/Q1hgcNsg5VyS91D1zBRp2Aw7TxZ7Ekpl+69KpLK7oTr2JeN
	Cx8lC8uIdh5viMCSE47VJOdRxjEkqb7bAlsLBWIb7bQwC13dU8fXgHBzvOMrZNBRPb72clNf4OK
	mNY1HjLc5yudCgAbbBpUUGbpjLyfrYW3wQK77iev2z//83M7LgwYig58=
X-Received: by 2002:a17:90b:1dd1:b0:35f:b50e:defc with SMTP id 98e67ed59e1d1-3650ce29880mr15194867a91.16.1777999287471;
        Tue, 05 May 2026 09:41:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd1:b0:35f:b50e:defc with SMTP id 98e67ed59e1d1-3650ce29880mr15194815a91.16.1777999286646;
        Tue, 05 May 2026 09:41:26 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm17944836a91.9.2026.05.05.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:41:26 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 05 May 2026 16:41:12 +0000
Subject: [PATCH v3 2/2] interconnect: qcom: add Shikra interconnect
 provider driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-shikra_icc-v3-2-8e03ff27c007@oss.qualcomm.com>
References: <20260505-shikra_icc-v3-0-8e03ff27c007@oss.qualcomm.com>
In-Reply-To: <20260505-shikra_icc-v3-0-8e03ff27c007@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MCBTYWx0ZWRfXyOWyIidvdgsv
 YSvkCPanZ0EZVwCDqoZJe3zQmyKxSb1N6MRIqQyaEvR8XE3LuomYubyPNhTSGliuN0hyBg2+5RX
 8fwYBFLrU+1WXSuSHXItPWZ6d4ylYbLcU1RRmJbmNZ/GwhJN/TI9NDpsGxJzzEIuzxyIWqIVFQv
 gkBmyfsdMsHWmfi7J6u/Qas1jIWFHcXWdvMaVItodcBovvFPQge200b1FSMiqXg7kCkrUMGo5pc
 ab5XG3rwXad5+lesBYCr3OUO5i4fRs6hHm0JMq9o3L8Wb2Yz/aY5O0aCsyo5NrYqgmFyFsKHE9W
 CXEsSo8LDJGq7EYmgzB9LRmmUlXNsoYgbu+wKutsDQvrzmfzVdiLZ7dBgQ2fU3O7wJ/srCSpDH3
 iiwwxZonL+JYlUpU8ah9J1IN+0oa0XkM4dVsVxP9ygyRNh2EIkvqtZVJPKQVMPzQdHEmMt33exa
 nh1IrUlpuqEwrIxD7tA==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69fa1db9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OuqGSHhY74Ioggy1eYcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 49KhxgPv1SZmqfEXFuNV9yizNH3oxlPB
X-Proofpoint-ORIG-GUID: 49KhxgPv1SZmqfEXFuNV9yizNH3oxlPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050160
X-Rspamd-Queue-Id: 3D2704D18D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106001-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add driver for the Qualcomm interconnect buses found in Shikra
based platforms. The topology consists of several NoCs that are
controlled by a remote processor that collects the aggregated
bandwidth for each master-slave pairs.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig  |    9 +
 drivers/interconnect/qcom/Makefile |    2 +
 drivers/interconnect/qcom/shikra.c | 1837 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1848 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..c7c7df2a6ddb 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -283,6 +283,15 @@ config INTERCONNECT_QCOM_SDX75
 	  This is a driver for the Qualcomm Network-on-Chip on sdx75-based
 	  platforms.
 
+config INTERCONNECT_QCOM_SHIKRA
+	tristate "Qualcomm SHIKRA interconnect driver"
+	depends on INTERCONNECT_QCOM
+	depends on QCOM_SMD_RPM
+	select INTERCONNECT_QCOM_SMD_RPM
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on shikra-based
+	  platforms.
+
 config INTERCONNECT_QCOM_SM6115
 	tristate "Qualcomm SM6115 interconnect driver"
 	depends on INTERCONNECT_QCOM
diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
index cdf2c6c9fbf3..7c1834d383d2 100644
--- a/drivers/interconnect/qcom/Makefile
+++ b/drivers/interconnect/qcom/Makefile
@@ -35,6 +35,7 @@ qnoc-sdm845-objs			:= sdm845.o
 qnoc-sdx55-objs				:= sdx55.o
 qnoc-sdx65-objs				:= sdx65.o
 qnoc-sdx75-objs				:= sdx75.o
+qnoc-shikra-objs			:= shikra.o
 qnoc-sm6115-objs			:= sm6115.o
 qnoc-sm6350-objs			:= sm6350.o
 qnoc-sm7150-objs			:= sm7150.o
@@ -80,6 +81,7 @@ obj-$(CONFIG_INTERCONNECT_QCOM_SDM845) += qnoc-sdm845.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDX55) += qnoc-sdx55.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDX65) += qnoc-sdx65.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SDX75) += qnoc-sdx75.o
+obj-$(CONFIG_INTERCONNECT_QCOM_SHIKRA) += qnoc-shikra.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SM6115) += qnoc-sm6115.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SM6350) += qnoc-sm6350.o
 obj-$(CONFIG_INTERCONNECT_QCOM_SM7150) += qnoc-sm7150.o
diff --git a/drivers/interconnect/qcom/shikra.c b/drivers/interconnect/qcom/shikra.c
new file mode 100644
index 000000000000..bc40d1592fb3
--- /dev/null
+++ b/drivers/interconnect/qcom/shikra.c
@@ -0,0 +1,1837 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ */
+
+#include <dt-bindings/interconnect/qcom,shikra.h>
+#include <linux/device.h>
+#include <linux/interconnect-provider.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "icc-rpm.h"
+
+static const char * const sys_noc_intf_clocks[] = {
+	"emac0_axi",
+	"emac1_axi",
+	"usb2_axi",
+	"usb3_axi",
+};
+
+static const char * const memnoc_intf_clocks[] = {
+	"gpu_axi",
+};
+
+enum {
+	SHIKRA_MASTER_QUP_CORE_0 = 1,
+	SHIKRA_SNOC_CNOC_MAS,
+	SHIKRA_MASTER_QDSS_DAP,
+	SHIKRA_MASTER_LLCC,
+	SHIKRA_MASTER_GRAPHICS_3D,
+	SHIKRA_MASTER_MNOC_HF_MEM_NOC,
+	SHIKRA_MASTER_ANOC_PCIE_MEM_NOC,
+	SHIKRA_MASTER_SNOC_SF_MEM_NOC,
+	SHIKRA_MASTER_AMPSS_M0,
+	SHIKRA_MASTER_SYS_TCU,
+	SHIKRA_MASTER_CAMNOC_SF,
+	SHIKRA_MASTER_VIDEO_P0,
+	SHIKRA_MASTER_VIDEO_PROC,
+	SHIKRA_MASTER_CAMNOC_HF,
+	SHIKRA_MASTER_MDP_PORT0,
+	SHIKRA_MASTER_MMRT_VIRT,
+	SHIKRA_MASTER_SNOC_CFG,
+	SHIKRA_MASTER_TIC,
+	SHIKRA_MASTER_ANOC_SNOC,
+	SHIKRA_MASTER_MEMNOC_PCIE,
+	SHIKRA_MASTER_MEMNOC_SNOC,
+	SHIKRA_MASTER_PIMEM,
+	SHIKRA_MASTER_PCIE2_0,
+	SHIKRA_MASTER_QDSS_BAM,
+	SHIKRA_MASTER_QPIC,
+	SHIKRA_MASTER_QUP_0,
+	SHIKRA_CNOC_SNOC_MAS,
+	SHIKRA_MASTER_AUDIO,
+	SHIKRA_MASTER_EMAC_0,
+	SHIKRA_MASTER_EMAC_1,
+	SHIKRA_MASTER_QDSS_ETR,
+	SHIKRA_MASTER_SDCC_1,
+	SHIKRA_MASTER_SDCC_2,
+	SHIKRA_MASTER_USB2_0,
+	SHIKRA_MASTER_USB3,
+	SHIKRA_MASTER_CRYPTO_CORE0,
+
+	SHIKRA_SLAVE_QUP_CORE_0,
+	SHIKRA_SLAVE_AHB2PHY_USB,
+	SHIKRA_SLAVE_APSS_THROTTLE_CFG,
+	SHIKRA_SLAVE_AUDIO,
+	SHIKRA_SLAVE_BOOT_ROM,
+	SHIKRA_SLAVE_CAMERA_NRT_THROTTLE_CFG,
+	SHIKRA_SLAVE_CAMERA_CFG,
+	SHIKRA_SLAVE_CDSP_THROTTLE_CFG,
+	SHIKRA_SLAVE_CLK_CTL,
+	SHIKRA_SLAVE_DSP_CFG,
+	SHIKRA_SLAVE_RBCPR_CX_CFG,
+	SHIKRA_SLAVE_RBCPR_MX_CFG,
+	SHIKRA_SLAVE_CRYPTO_0_CFG,
+	SHIKRA_SLAVE_DDR_SS_CFG,
+	SHIKRA_SLAVE_DISPLAY_CFG,
+	SHIKRA_SLAVE_EMAC0_CFG,
+	SHIKRA_SLAVE_EMAC1_CFG,
+	SHIKRA_SLAVE_GPU_CFG,
+	SHIKRA_SLAVE_GPU_THROTTLE_CFG,
+	SHIKRA_SLAVE_HWKM,
+	SHIKRA_SLAVE_IMEM_CFG,
+	SHIKRA_SLAVE_MAPSS,
+	SHIKRA_SLAVE_MDSP_MPU_CFG,
+	SHIKRA_SLAVE_MESSAGE_RAM,
+	SHIKRA_SLAVE_MSS,
+	SHIKRA_SLAVE_PCIE_CFG,
+	SHIKRA_SLAVE_PDM,
+	SHIKRA_SLAVE_PIMEM_CFG,
+	SHIKRA_SLAVE_PKA_WRAPPER_CFG,
+	SHIKRA_SLAVE_PMIC_ARB,
+	SHIKRA_SLAVE_QDSS_CFG,
+	SHIKRA_SLAVE_QM_CFG,
+	SHIKRA_SLAVE_QM_MPU_CFG,
+	SHIKRA_SLAVE_QPIC,
+	SHIKRA_SLAVE_QUP_0,
+	SHIKRA_SLAVE_RPM,
+	SHIKRA_SLAVE_SDCC_1,
+	SHIKRA_SLAVE_SDCC_2,
+	SHIKRA_SLAVE_SECURITY,
+	SHIKRA_SLAVE_SNOC_CFG,
+	SHIKRA_SNOC_SF_THROTTLE_CFG,
+	SHIKRA_SLAVE_TLMM,
+	SHIKRA_SLAVE_TSCSS,
+	SHIKRA_SLAVE_USB2,
+	SHIKRA_SLAVE_USB3,
+	SHIKRA_SLAVE_VENUS_CFG,
+	SHIKRA_SLAVE_VENUS_THROTTLE_CFG,
+	SHIKRA_SLAVE_VSENSE_CTRL_CFG,
+	SHIKRA_SLAVE_SERVICE_CNOC,
+	SHIKRA_SLAVE_EBI_CH0,
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+	SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+	SHIKRA_SLAVE_MMNRT_VIRT,
+	SHIKRA_SLAVE_MM_MEMNOC,
+	SHIKRA_SLAVE_APPSS,
+	SHIKRA_SLAVE_MCUSS,
+	SHIKRA_SLAVE_WCSS,
+	SHIKRA_SLAVE_MEMNOC_SF,
+	SHIKRA_SNOC_CNOC_SLV,
+	SHIKRA_SLAVE_BOOTIMEM,
+	SHIKRA_SLAVE_OCIMEM,
+	SHIKRA_SLAVE_PIMEM,
+	SHIKRA_SLAVE_SERVICE_SNOC,
+	SHIKRA_SLAVE_PCIE2_0,
+	SHIKRA_SLAVE_QDSS_STM,
+	SHIKRA_SLAVE_TCU,
+	SHIKRA_SLAVE_PCIE_MEMNOC,
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+/* Master nodes */
+static const u16 qup0_core_master_links[] = {
+	SHIKRA_SLAVE_QUP_CORE_0,
+};
+
+static struct qcom_icc_node qup0_core_master = {
+	.id = SHIKRA_MASTER_QUP_CORE_0,
+	.name = "qup0_core_master",
+	.buswidth = 4,
+	.mas_rpm_id = 170,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qup0_core_master_links),
+	.links = qup0_core_master_links,
+};
+
+static const u16 qnm_snoc_cnoc_links[] = {
+	SHIKRA_SLAVE_AHB2PHY_USB,
+	SHIKRA_SLAVE_APSS_THROTTLE_CFG,
+	SHIKRA_SLAVE_AUDIO,
+	SHIKRA_SLAVE_BOOT_ROM,
+	SHIKRA_SLAVE_CAMERA_NRT_THROTTLE_CFG,
+	SHIKRA_SLAVE_CAMERA_CFG,
+	SHIKRA_SLAVE_CDSP_THROTTLE_CFG,
+	SHIKRA_SLAVE_CLK_CTL,
+	SHIKRA_SLAVE_DSP_CFG,
+	SHIKRA_SLAVE_RBCPR_CX_CFG,
+	SHIKRA_SLAVE_RBCPR_MX_CFG,
+	SHIKRA_SLAVE_CRYPTO_0_CFG,
+	SHIKRA_SLAVE_DDR_SS_CFG,
+	SHIKRA_SLAVE_DISPLAY_CFG,
+	SHIKRA_SLAVE_EMAC0_CFG,
+	SHIKRA_SLAVE_EMAC1_CFG,
+	SHIKRA_SLAVE_GPU_CFG,
+	SHIKRA_SLAVE_GPU_THROTTLE_CFG,
+	SHIKRA_SLAVE_HWKM,
+	SHIKRA_SLAVE_IMEM_CFG,
+	SHIKRA_SLAVE_MAPSS,
+	SHIKRA_SLAVE_MDSP_MPU_CFG,
+	SHIKRA_SLAVE_MESSAGE_RAM,
+	SHIKRA_SLAVE_MSS,
+	SHIKRA_SLAVE_PCIE_CFG,
+	SHIKRA_SLAVE_PDM,
+	SHIKRA_SLAVE_PIMEM_CFG,
+	SHIKRA_SLAVE_PKA_WRAPPER_CFG,
+	SHIKRA_SLAVE_PMIC_ARB,
+	SHIKRA_SLAVE_QDSS_CFG,
+	SHIKRA_SLAVE_QM_CFG,
+	SHIKRA_SLAVE_QM_MPU_CFG,
+	SHIKRA_SLAVE_QPIC,
+	SHIKRA_SLAVE_QUP_0,
+	SHIKRA_SLAVE_RPM,
+	SHIKRA_SLAVE_SDCC_1,
+	SHIKRA_SLAVE_SDCC_2,
+	SHIKRA_SLAVE_SECURITY,
+	SHIKRA_SLAVE_SNOC_CFG,
+	SHIKRA_SNOC_SF_THROTTLE_CFG,
+	SHIKRA_SLAVE_TLMM,
+	SHIKRA_SLAVE_TSCSS,
+	SHIKRA_SLAVE_USB2,
+	SHIKRA_SLAVE_USB3,
+	SHIKRA_SLAVE_VENUS_CFG,
+	SHIKRA_SLAVE_VENUS_THROTTLE_CFG,
+	SHIKRA_SLAVE_VSENSE_CTRL_CFG,
+	SHIKRA_SLAVE_SERVICE_CNOC,
+};
+
+static struct qcom_icc_node qnm_snoc_cnoc = {
+	.id = SHIKRA_SNOC_CNOC_MAS,
+	.name = "qnm_snoc_cnoc",
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_snoc_cnoc_links),
+	.links = qnm_snoc_cnoc_links,
+};
+
+static const u16 xm_dap_links[] = {
+	SHIKRA_SLAVE_AHB2PHY_USB,
+	SHIKRA_SLAVE_APSS_THROTTLE_CFG,
+	SHIKRA_SLAVE_AUDIO,
+	SHIKRA_SLAVE_BOOT_ROM,
+	SHIKRA_SLAVE_CAMERA_NRT_THROTTLE_CFG,
+	SHIKRA_SLAVE_CAMERA_CFG,
+	SHIKRA_SLAVE_CDSP_THROTTLE_CFG,
+	SHIKRA_SLAVE_CLK_CTL,
+	SHIKRA_SLAVE_DSP_CFG,
+	SHIKRA_SLAVE_RBCPR_CX_CFG,
+	SHIKRA_SLAVE_RBCPR_MX_CFG,
+	SHIKRA_SLAVE_CRYPTO_0_CFG,
+	SHIKRA_SLAVE_DDR_SS_CFG,
+	SHIKRA_SLAVE_DISPLAY_CFG,
+	SHIKRA_SLAVE_EMAC0_CFG,
+	SHIKRA_SLAVE_EMAC1_CFG,
+	SHIKRA_SLAVE_GPU_CFG,
+	SHIKRA_SLAVE_GPU_THROTTLE_CFG,
+	SHIKRA_SLAVE_HWKM,
+	SHIKRA_SLAVE_IMEM_CFG,
+	SHIKRA_SLAVE_MAPSS,
+	SHIKRA_SLAVE_MDSP_MPU_CFG,
+	SHIKRA_SLAVE_MESSAGE_RAM,
+	SHIKRA_SLAVE_MSS,
+	SHIKRA_SLAVE_PCIE_CFG,
+	SHIKRA_SLAVE_PDM,
+	SHIKRA_SLAVE_PIMEM_CFG,
+	SHIKRA_SLAVE_PKA_WRAPPER_CFG,
+	SHIKRA_SLAVE_PMIC_ARB,
+	SHIKRA_SLAVE_QDSS_CFG,
+	SHIKRA_SLAVE_QM_CFG,
+	SHIKRA_SLAVE_QM_MPU_CFG,
+	SHIKRA_SLAVE_QPIC,
+	SHIKRA_SLAVE_QUP_0,
+	SHIKRA_SLAVE_RPM,
+	SHIKRA_SLAVE_SDCC_1,
+	SHIKRA_SLAVE_SDCC_2,
+	SHIKRA_SLAVE_SECURITY,
+	SHIKRA_SLAVE_SNOC_CFG,
+	SHIKRA_SNOC_SF_THROTTLE_CFG,
+	SHIKRA_SLAVE_TLMM,
+	SHIKRA_SLAVE_TSCSS,
+	SHIKRA_SLAVE_USB2,
+	SHIKRA_SLAVE_USB3,
+	SHIKRA_SLAVE_VENUS_CFG,
+	SHIKRA_SLAVE_VENUS_THROTTLE_CFG,
+	SHIKRA_SLAVE_VSENSE_CTRL_CFG,
+	SHIKRA_SLAVE_SERVICE_CNOC,
+};
+
+static struct qcom_icc_node xm_dap = {
+	.id = SHIKRA_MASTER_QDSS_DAP,
+	.name = "xm_dap",
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_dap_links),
+	.links = xm_dap_links,
+};
+
+static const u16 llcc_mc_links[] = {
+	SHIKRA_SLAVE_EBI_CH0,
+};
+
+static struct qcom_icc_node llcc_mc = {
+	.id = SHIKRA_MASTER_LLCC,
+	.name = "llcc_mc",
+	.buswidth = 4,
+	.channels = 2,
+	.mas_rpm_id = 190,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(llcc_mc_links),
+	.links = llcc_mc_links,
+};
+
+static const u16 qnm_gpu_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+	SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+};
+
+static struct qcom_icc_node qnm_gpu = {
+	.id = SHIKRA_MASTER_GRAPHICS_3D,
+	.name = "qnm_gpu",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 6,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_gpu_links),
+	.links = qnm_gpu_links,
+};
+
+static const u16 qnm_mnoc_hf_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+	SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+};
+
+static struct qcom_icc_node qnm_mnoc_hf = {
+	.id = SHIKRA_MASTER_MNOC_HF_MEM_NOC,
+	.name = "qnm_mnoc_hf",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 7,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_mnoc_hf_links),
+	.links = qnm_mnoc_hf_links,
+};
+
+static const u16 qnm_pcie_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+};
+
+static struct qcom_icc_node qnm_pcie = {
+	.id = SHIKRA_MASTER_ANOC_PCIE_MEM_NOC,
+	.name = "qnm_pcie",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 4,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = 185,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_pcie_links),
+	.links = qnm_pcie_links,
+};
+
+static const u16 qnm_snoc_sf_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+	SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+};
+
+static struct qcom_icc_node qnm_snoc_sf = {
+	.id = SHIKRA_MASTER_SNOC_SF_MEM_NOC,
+	.name = "qnm_snoc_sf",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 3,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = 76,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_snoc_sf_links),
+	.links = qnm_snoc_sf_links,
+};
+
+static const u16 xm_apps_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+	SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+};
+
+static struct qcom_icc_node xm_apps = {
+	.id = SHIKRA_MASTER_AMPSS_M0,
+	.name = "xm_apps",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 5,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = 0,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_apps_links),
+	.links = xm_apps_links,
+};
+
+static const u16 xm_tcu_links[] = {
+	SHIKRA_SLAVE_LLCC,
+	SHIKRA_SLAVE_MEMNOC_SNOC,
+};
+
+static struct qcom_icc_node xm_tcu = {
+	.id = SHIKRA_MASTER_SYS_TCU,
+	.name = "xm_tcu",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 2,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 6,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_tcu_links),
+	.links = xm_tcu_links,
+};
+
+static const u16 qnm_camera_nrt_links[] = {
+	SHIKRA_SLAVE_MMNRT_VIRT,
+};
+
+static struct qcom_icc_node qnm_camera_nrt = {
+	.id = SHIKRA_MASTER_CAMNOC_SF,
+	.name = "qnm_camera_nrt",
+	.buswidth = 32,
+	.qos.ap_owned = true,
+	.qos.qos_port = 3,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 3,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_camera_nrt_links),
+	.links = qnm_camera_nrt_links,
+};
+
+static const u16 qxm_venus0_links[] = {
+	SHIKRA_SLAVE_MMNRT_VIRT,
+};
+
+static struct qcom_icc_node qxm_venus0 = {
+	.id = SHIKRA_MASTER_VIDEO_P0,
+	.name = "qxm_venus0",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 8,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qxm_venus0_links),
+	.links = qxm_venus0_links,
+};
+
+static const u16 qxm_venus_cpu_links[] = {
+	SHIKRA_SLAVE_MMNRT_VIRT,
+};
+
+static struct qcom_icc_node qxm_venus_cpu = {
+	.id = SHIKRA_MASTER_VIDEO_PROC,
+	.name = "qxm_venus_cpu",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 12,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qxm_venus_cpu_links),
+	.links = qxm_venus_cpu_links,
+};
+
+static const u16 qnm_camera_rt_links[] = {
+	SHIKRA_SLAVE_MM_MEMNOC,
+};
+
+static struct qcom_icc_node qnm_camera_rt = {
+	.id = SHIKRA_MASTER_CAMNOC_HF,
+	.name = "qnm_camera_rt",
+	.buswidth = 32,
+	.qos.ap_owned = true,
+	.qos.qos_port = 9,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_camera_rt_links),
+	.links = qnm_camera_rt_links,
+};
+
+static const u16 qxm_mdp0_links[] = {
+	SHIKRA_SLAVE_MM_MEMNOC,
+};
+
+static struct qcom_icc_node qxm_mdp0 = {
+	.id = SHIKRA_MASTER_MDP_PORT0,
+	.name = "qxm_mdp0",
+	.buswidth = 16,
+	.qos.ap_owned = true,
+	.qos.qos_port = 4,
+	.qos.urg_fwd_en = true,
+	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
+	.qos.areq_prio = 0,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qxm_mdp0_links),
+	.links = qxm_mdp0_links,
+};
+
+static const u16 mmrt_virt_master_links[] = {
+	SHIKRA_SLAVE_MM_MEMNOC,
+};
+
+static struct qcom_icc_node mmrt_virt_master = {
+	.id = SHIKRA_MASTER_MMRT_VIRT,
+	.name = "mmrt_virt_master",
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(mmrt_virt_master_links),
+	.links = mmrt_virt_master_links,
+};
+
+static const u16 qhm_snoc_cfg_links[] = {
+	SHIKRA_SLAVE_SERVICE_SNOC,
+};
+
+static struct qcom_icc_node qhm_snoc_cfg = {
+	.id = SHIKRA_MASTER_SNOC_CFG,
+	.name = "qhm_snoc_cfg",
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qhm_snoc_cfg_links),
+	.links = qhm_snoc_cfg_links,
+};
+
+static const u16 qhm_tic_links[] = {
+	SHIKRA_SLAVE_APPSS,
+	SHIKRA_SLAVE_MCUSS,
+	SHIKRA_SLAVE_WCSS,
+	SHIKRA_SLAVE_MEMNOC_SF,
+	SHIKRA_SNOC_CNOC_SLV,
+	SHIKRA_SLAVE_BOOTIMEM,
+	SHIKRA_SLAVE_OCIMEM,
+	SHIKRA_SLAVE_PIMEM,
+	SHIKRA_SLAVE_QDSS_STM,
+	SHIKRA_SLAVE_TCU,
+};
+
+static struct qcom_icc_node qhm_tic = {
+	.id = SHIKRA_MASTER_TIC,
+	.name = "qhm_tic",
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qhm_tic_links),
+	.links = qhm_tic_links,
+};
+
+static const u16 qnm_anoc_snoc_links[] = {
+	SHIKRA_SLAVE_MEMNOC_SF,
+};
+
+static struct qcom_icc_node qnm_anoc_snoc = {
+	.id = SHIKRA_MASTER_ANOC_SNOC,
+	.name = "qnm_anoc_snoc",
+	.buswidth = 16,
+	.mas_rpm_id = 110,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_anoc_snoc_links),
+	.links = qnm_anoc_snoc_links,
+};
+
+static const u16 qnm_memnoc_pcie_links[] = {
+	SHIKRA_SLAVE_PCIE2_0,
+};
+
+static struct qcom_icc_node qnm_memnoc_pcie = {
+	.id = SHIKRA_MASTER_MEMNOC_PCIE,
+	.name = "qnm_memnoc_pcie",
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_memnoc_pcie_links),
+	.links = qnm_memnoc_pcie_links,
+};
+
+static const u16 qnm_memnoc_snoc_links[] = {
+	SHIKRA_SLAVE_APPSS,
+	SHIKRA_SLAVE_MCUSS,
+	SHIKRA_SLAVE_WCSS,
+	SHIKRA_SNOC_CNOC_SLV,
+	SHIKRA_SLAVE_BOOTIMEM,
+	SHIKRA_SLAVE_OCIMEM,
+	SHIKRA_SLAVE_PIMEM,
+	SHIKRA_SLAVE_QDSS_STM,
+	SHIKRA_SLAVE_TCU,
+};
+
+static struct qcom_icc_node qnm_memnoc_snoc = {
+	.id = SHIKRA_MASTER_MEMNOC_SNOC,
+	.name = "qnm_memnoc_snoc",
+	.buswidth = 8,
+	.mas_rpm_id = 184,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_memnoc_snoc_links),
+	.links = qnm_memnoc_snoc_links,
+};
+
+static const u16 qxm_pimem_links[] = {
+	SHIKRA_SLAVE_MEMNOC_SF,
+	SHIKRA_SLAVE_OCIMEM,
+};
+
+static struct qcom_icc_node qxm_pimem = {
+	.id = SHIKRA_MASTER_PIMEM,
+	.name = "qxm_pimem",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 14,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qxm_pimem_links),
+	.links = qxm_pimem_links,
+};
+
+static const u16 xm_pcie2_0_links[] = {
+	SHIKRA_SLAVE_PCIE_MEMNOC,
+};
+
+static struct qcom_icc_node xm_pcie2_0 = {
+	.id = SHIKRA_MASTER_PCIE2_0,
+	.name = "xm_pcie2_0",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 21,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = 186,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_pcie2_0_links),
+	.links = xm_pcie2_0_links,
+};
+
+static const u16 qhm_qdss_bam_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qhm_qdss_bam = {
+	.id = SHIKRA_MASTER_QDSS_BAM,
+	.name = "qhm_qdss_bam",
+	.buswidth = 4,
+	.qos.ap_owned = true,
+	.qos.qos_port = 2,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qhm_qdss_bam_links),
+	.links = qhm_qdss_bam_links,
+};
+
+static const u16 qhm_qpic_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qhm_qpic = {
+	.id = SHIKRA_MASTER_QPIC,
+	.name = "qhm_qpic",
+	.buswidth = 4,
+	.qos.ap_owned = true,
+	.qos.qos_port = 1,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qhm_qpic_links),
+	.links = qhm_qpic_links,
+};
+
+static const u16 qhm_qup0_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qhm_qup0 = {
+	.id = SHIKRA_MASTER_QUP_0,
+	.name = "qhm_qup0",
+	.buswidth = 4,
+	.qos.ap_owned = true,
+	.qos.qos_port = 0,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = 166,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qhm_qup0_links),
+	.links = qhm_qup0_links,
+};
+
+static const u16 qnm_cnoc_snoc_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qnm_cnoc_snoc = {
+	.id = SHIKRA_CNOC_SNOC_MAS,
+	.name = "qnm_cnoc_snoc",
+	.buswidth = 4,
+	.qos.ap_owned = true,
+	.qos.qos_port = 7,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qnm_cnoc_snoc_links),
+	.links = qnm_cnoc_snoc_links,
+};
+
+static const u16 qxm_audio_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qxm_audio = {
+	.id = SHIKRA_MASTER_AUDIO,
+	.name = "qxm_audio",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 22,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 3,
+	.mas_rpm_id = 78,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(qxm_audio_links),
+	.links = qxm_audio_links,
+};
+
+static const u16 xm_emac_0_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_emac_0 = {
+	.id = SHIKRA_MASTER_EMAC_0,
+	.name = "xm_emac_0",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 19,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_emac_0_links),
+	.links = xm_emac_0_links,
+};
+
+static const u16 xm_emac_1_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_emac_1 = {
+	.id = SHIKRA_MASTER_EMAC_1,
+	.name = "xm_emac_1",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 20,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_emac_1_links),
+	.links = xm_emac_1_links,
+};
+
+static const u16 xm_qdss_etr_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_qdss_etr = {
+	.id = SHIKRA_MASTER_QDSS_ETR,
+	.name = "xm_qdss_etr",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 11,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_qdss_etr_links),
+	.links = xm_qdss_etr_links,
+};
+
+static const u16 xm_sdc1_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_sdc1 = {
+	.id = SHIKRA_MASTER_SDCC_1,
+	.name = "xm_sdc1",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 13,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_sdc1_links),
+	.links = xm_sdc1_links,
+};
+
+static const u16 xm_sdc2_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_sdc2 = {
+	.id = SHIKRA_MASTER_SDCC_2,
+	.name = "xm_sdc2",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 17,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_sdc2_links),
+	.links = xm_sdc2_links,
+};
+
+static const u16 xm_usb2_0_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_usb2_0 = {
+	.id = SHIKRA_MASTER_USB2_0,
+	.name = "xm_usb2_0",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 24,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_usb2_0_links),
+	.links = xm_usb2_0_links,
+};
+
+static const u16 xm_usb3_0_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node xm_usb3_0 = {
+	.id = SHIKRA_MASTER_USB3,
+	.name = "xm_usb3_0",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 18,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(xm_usb3_0_links),
+	.links = xm_usb3_0_links,
+};
+
+static const u16 crypto_c0_links[] = {
+	SHIKRA_SLAVE_ANOC_SNOC,
+};
+
+static struct qcom_icc_node crypto_c0 = {
+	.id = SHIKRA_MASTER_CRYPTO_CORE0,
+	.name = "crypto_c0",
+	.buswidth = 8,
+	.qos.ap_owned = true,
+	.qos.qos_port = 16,
+	.qos.urg_fwd_en = false,
+	.qos.qos_mode = NOC_QOS_MODE_FIXED,
+	.qos.areq_prio = 2,
+	.mas_rpm_id = 23,
+	.slv_rpm_id = -1,
+	.num_links = ARRAY_SIZE(crypto_c0_links),
+	.links = crypto_c0_links,
+};
+
+/* Slave nodes */
+static struct qcom_icc_node qup0_core_slave = {
+	.id = SHIKRA_SLAVE_QUP_CORE_0,
+	.name = "qup0_core_slave",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 264,
+};
+
+static struct qcom_icc_node qhs_ahb2phy_usb = {
+	.id = SHIKRA_SLAVE_AHB2PHY_USB,
+	.name = "qhs_ahb2phy_usb",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_apss_throttle_cfg = {
+	.id = SHIKRA_SLAVE_APSS_THROTTLE_CFG,
+	.name = "qhs_apss_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_audio = {
+	.id = SHIKRA_SLAVE_AUDIO,
+	.name = "qhs_audio",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_boot_rom = {
+	.id = SHIKRA_SLAVE_BOOT_ROM,
+	.name = "qhs_boot_rom",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_camera_nrt_throttle_cfg = {
+	.id = SHIKRA_SLAVE_CAMERA_NRT_THROTTLE_CFG,
+	.name = "qhs_camera_nrt_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_camera_ss_cfg = {
+	.id = SHIKRA_SLAVE_CAMERA_CFG,
+	.name = "qhs_camera_ss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_cdsp_throttle_cfg = {
+	.id = SHIKRA_SLAVE_CDSP_THROTTLE_CFG,
+	.name = "qhs_cdsp_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_clk_ctl = {
+	.id = SHIKRA_SLAVE_CLK_CTL,
+	.name = "qhs_clk_ctl",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_compute_dsp_cfg = {
+	.id = SHIKRA_SLAVE_DSP_CFG,
+	.name = "qhs_compute_dsp_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_cpr_cx = {
+	.id = SHIKRA_SLAVE_RBCPR_CX_CFG,
+	.name = "qhs_cpr_cx",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_cpr_mx = {
+	.id = SHIKRA_SLAVE_RBCPR_MX_CFG,
+	.name = "qhs_cpr_mx",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_crypto0_cfg = {
+	.id = SHIKRA_SLAVE_CRYPTO_0_CFG,
+	.name = "qhs_crypto0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_ddr_ss_cfg = {
+	.id = SHIKRA_SLAVE_DDR_SS_CFG,
+	.name = "qhs_ddr_ss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_disp_ss_cfg = {
+	.id = SHIKRA_SLAVE_DISPLAY_CFG,
+	.name = "qhs_disp_ss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_emac0_cfg = {
+	.id = SHIKRA_SLAVE_EMAC0_CFG,
+	.name = "qhs_emac0_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_emac1_cfg = {
+	.id = SHIKRA_SLAVE_EMAC1_CFG,
+	.name = "qhs_emac1_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_gpu_cfg = {
+	.id = SHIKRA_SLAVE_GPU_CFG,
+	.name = "qhs_gpu_cfg",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_gpu_throttle_cfg = {
+	.id = SHIKRA_SLAVE_GPU_THROTTLE_CFG,
+	.name = "qhs_gpu_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_hwkm = {
+	.id = SHIKRA_SLAVE_HWKM,
+	.name = "qhs_hwkm",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_imem_cfg = {
+	.id = SHIKRA_SLAVE_IMEM_CFG,
+	.name = "qhs_imem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_mapss = {
+	.id = SHIKRA_SLAVE_MAPSS,
+	.name = "qhs_mapss",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_mdsp_mpu_cfg = {
+	.id = SHIKRA_SLAVE_MDSP_MPU_CFG,
+	.name = "qhs_mdsp_mpu_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_mesg_ram = {
+	.id = SHIKRA_SLAVE_MESSAGE_RAM,
+	.name = "qhs_mesg_ram",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_mss = {
+	.id = SHIKRA_SLAVE_MSS,
+	.name = "qhs_mss",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_pcie_cfg = {
+	.id = SHIKRA_SLAVE_PCIE_CFG,
+	.name = "qhs_pcie_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_pdm = {
+	.id = SHIKRA_SLAVE_PDM,
+	.name = "qhs_pdm",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_pimem_cfg = {
+	.id = SHIKRA_SLAVE_PIMEM_CFG,
+	.name = "qhs_pimem_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_pka_wrapper = {
+	.id = SHIKRA_SLAVE_PKA_WRAPPER_CFG,
+	.name = "qhs_pka_wrapper",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_pmic_arb = {
+	.id = SHIKRA_SLAVE_PMIC_ARB,
+	.name = "qhs_pmic_arb",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_qdss_cfg = {
+	.id = SHIKRA_SLAVE_QDSS_CFG,
+	.name = "qhs_qdss_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_qm_cfg = {
+	.id = SHIKRA_SLAVE_QM_CFG,
+	.name = "qhs_qm_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_qm_mpu_cfg = {
+	.id = SHIKRA_SLAVE_QM_MPU_CFG,
+	.name = "qhs_qm_mpu_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_qpic = {
+	.id = SHIKRA_SLAVE_QPIC,
+	.name = "qhs_qpic",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_qup0 = {
+	.id = SHIKRA_SLAVE_QUP_0,
+	.name = "qhs_qup0",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_rpm = {
+	.id = SHIKRA_SLAVE_RPM,
+	.name = "qhs_rpm",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_sdc1 = {
+	.id = SHIKRA_SLAVE_SDCC_1,
+	.name = "qhs_sdc1",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_sdc2 = {
+	.id = SHIKRA_SLAVE_SDCC_2,
+	.name = "qhs_sdc2",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_security = {
+	.id = SHIKRA_SLAVE_SECURITY,
+	.name = "qhs_security",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static const u16 qhs_snoc_cfg_links[] = {
+	SHIKRA_MASTER_SNOC_CFG,
+};
+
+static struct qcom_icc_node qhs_snoc_cfg = {
+	.id = SHIKRA_SLAVE_SNOC_CFG,
+	.name = "qhs_snoc_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = 1,
+	.links = qhs_snoc_cfg_links,
+};
+
+static struct qcom_icc_node qhs_snoc_sf_throttle_cfg = {
+	.id = SHIKRA_SNOC_SF_THROTTLE_CFG,
+	.name = "qhs_snoc_sf_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_tlmm = {
+	.id = SHIKRA_SLAVE_TLMM,
+	.name = "qhs_tlmm",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_tscss = {
+	.id = SHIKRA_SLAVE_TSCSS,
+	.name = "qhs_tscss",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_usb2 = {
+	.id = SHIKRA_SLAVE_USB2,
+	.name = "qhs_usb2",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_usb3 = {
+	.id = SHIKRA_SLAVE_USB3,
+	.name = "qhs_usb3",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_venus_cfg = {
+	.id = SHIKRA_SLAVE_VENUS_CFG,
+	.name = "qhs_venus_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_venus_throttle_cfg = {
+	.id = SHIKRA_SLAVE_VENUS_THROTTLE_CFG,
+	.name = "qhs_venus_throttle_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_vsense_ctrl_cfg = {
+	.id = SHIKRA_SLAVE_VSENSE_CTRL_CFG,
+	.name = "qhs_vsense_ctrl_cfg",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node srvc_cnoc = {
+	.id = SHIKRA_SLAVE_SERVICE_CNOC,
+	.name = "srvc_cnoc",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node ebi = {
+	.id = SHIKRA_SLAVE_EBI_CH0,
+	.name = "ebi",
+	.channels = 2,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 0,
+};
+
+static const u16 qns_llcc_links[] = {
+	SHIKRA_MASTER_LLCC,
+};
+
+static struct qcom_icc_node qns_llcc = {
+	.id = SHIKRA_SLAVE_LLCC,
+	.name = "qns_llcc",
+	.channels = 2,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 312,
+	.num_links = 1,
+	.links = qns_llcc_links,
+};
+
+static const u16 qns_memnoc_snoc_links[] = {
+	SHIKRA_MASTER_MEMNOC_SNOC,
+};
+
+static struct qcom_icc_node qns_memnoc_snoc = {
+	.id = SHIKRA_SLAVE_MEMNOC_SNOC,
+	.name = "qns_memnoc_snoc",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 314,
+	.num_links = 1,
+	.links = qns_memnoc_snoc_links,
+};
+
+static const u16 qns_pcie_links[] = {
+	SHIKRA_MASTER_MEMNOC_PCIE,
+};
+
+static struct qcom_icc_node qns_pcie = {
+	.id = SHIKRA_SLAVE_MEM_NOC_PCIE_SNOC,
+	.name = "qns_pcie",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = 1,
+	.links = qns_pcie_links,
+};
+
+static const u16 mmnrt_virt_slave_links[] = {
+	SHIKRA_MASTER_MMRT_VIRT,
+};
+
+static struct qcom_icc_node mmnrt_virt_slave = {
+	.id = SHIKRA_SLAVE_MMNRT_VIRT,
+	.name = "mmnrt_virt_slave",
+	.channels = 1,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = 1,
+	.links = mmnrt_virt_slave_links,
+};
+
+static const u16 qns_mm_memnoc_links[] = {
+	SHIKRA_MASTER_MNOC_HF_MEM_NOC,
+};
+
+static struct qcom_icc_node qns_mm_memnoc = {
+	.id = SHIKRA_SLAVE_MM_MEMNOC,
+	.name = "qns_mm_memnoc",
+	.channels = 1,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+	.num_links = 1,
+	.links = qns_mm_memnoc_links,
+};
+
+static struct qcom_icc_node qhs_apss = {
+	.id = SHIKRA_SLAVE_APPSS,
+	.name = "qhs_apss",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qhs_mcuss = {
+	.id = SHIKRA_SLAVE_MCUSS,
+	.name = "qhs_mcuss",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 319,
+};
+
+static struct qcom_icc_node qhs_wcss = {
+	.id = SHIKRA_SLAVE_WCSS,
+	.name = "qhs_wcss",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 23,
+};
+
+static const u16 qns_memnoc_sf_links[] = {
+	SHIKRA_MASTER_SNOC_SF_MEM_NOC,
+};
+
+static struct qcom_icc_node qns_memnoc_sf = {
+	.id = SHIKRA_SLAVE_MEMNOC_SF,
+	.name = "qns_memnoc_sf",
+	.channels = 1,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 313,
+	.num_links = 1,
+	.links = qns_memnoc_sf_links,
+};
+
+static const u16 qns_snoc_cnoc_links[] = {
+	SHIKRA_SNOC_CNOC_MAS,
+};
+
+static struct qcom_icc_node qns_snoc_cnoc = {
+	.id = SHIKRA_SNOC_CNOC_SLV,
+	.name = "qns_snoc_cnoc",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 25,
+	.num_links = 1,
+	.links = qns_snoc_cnoc_links,
+};
+
+static struct qcom_icc_node qxs_bootimem = {
+	.id = SHIKRA_SLAVE_BOOTIMEM,
+	.name = "qxs_bootimem",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node qxs_imem = {
+	.id = SHIKRA_SLAVE_OCIMEM,
+	.name = "qxs_imem",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 26,
+};
+
+static struct qcom_icc_node qxs_pimem = {
+	.id = SHIKRA_SLAVE_PIMEM,
+	.name = "qxs_pimem",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node srvc_snoc = {
+	.id = SHIKRA_SLAVE_SERVICE_SNOC,
+	.name = "srvc_snoc",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node xs_pcie2_0 = {
+	.id = SHIKRA_SLAVE_PCIE2_0,
+	.name = "xs_pcie2_0",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static struct qcom_icc_node xs_qdss_stm = {
+	.id = SHIKRA_SLAVE_QDSS_STM,
+	.name = "xs_qdss_stm",
+	.channels = 1,
+	.buswidth = 4,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 30,
+};
+
+static struct qcom_icc_node xs_sys_tcu_cfg = {
+	.id = SHIKRA_SLAVE_TCU,
+	.name = "xs_sys_tcu_cfg",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = -1,
+};
+
+static const u16 qns_pcie_memnoc_links[] = {
+	SHIKRA_MASTER_ANOC_PCIE_MEM_NOC,
+};
+
+static struct qcom_icc_node qns_pcie_memnoc = {
+	.id = SHIKRA_SLAVE_PCIE_MEMNOC,
+	.name = "qns_pcie_memnoc",
+	.channels = 1,
+	.buswidth = 8,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 317,
+	.num_links = 1,
+	.links = qns_pcie_memnoc_links,
+};
+
+static const u16 qns_anoc_snoc_links[] = {
+	SHIKRA_MASTER_ANOC_SNOC,
+};
+
+static struct qcom_icc_node qns_anoc_snoc = {
+	.id = SHIKRA_SLAVE_ANOC_SNOC,
+	.name = "qns_anoc_snoc",
+	.channels = 1,
+	.buswidth = 16,
+	.mas_rpm_id = -1,
+	.slv_rpm_id = 141,
+	.num_links = 1,
+	.links = qns_anoc_snoc_links,
+};
+
+/* NoC descriptors */
+static struct qcom_icc_node * const shikra_clk_virt_nodes[] = {
+	[MASTER_QUP_CORE_0] = &qup0_core_master,
+	[SLAVE_QUP_CORE_0] = &qup0_core_slave,
+};
+
+static const struct qcom_icc_desc shikra_clk_virt = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_clk_virt_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_clk_virt_nodes),
+	.bus_clk_desc = &qup_clk,
+	.keep_alive = true,
+};
+
+static struct qcom_icc_node * const shikra_config_noc_nodes[] = {
+	[SNOC_CNOC_MAS] = &qnm_snoc_cnoc,
+	[MASTER_QDSS_DAP] = &xm_dap,
+	[SLAVE_AHB2PHY_USB] = &qhs_ahb2phy_usb,
+	[SLAVE_APSS_THROTTLE_CFG] = &qhs_apss_throttle_cfg,
+	[SLAVE_AUDIO] = &qhs_audio,
+	[SLAVE_BOOT_ROM] = &qhs_boot_rom,
+	[SLAVE_CAMERA_NRT_THROTTLE_CFG] = &qhs_camera_nrt_throttle_cfg,
+	[SLAVE_CAMERA_CFG] = &qhs_camera_ss_cfg,
+	[SLAVE_CDSP_THROTTLE_CFG] = &qhs_cdsp_throttle_cfg,
+	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
+	[SLAVE_DSP_CFG] = &qhs_compute_dsp_cfg,
+	[SLAVE_RBCPR_CX_CFG] = &qhs_cpr_cx,
+	[SLAVE_RBCPR_MX_CFG] = &qhs_cpr_mx,
+	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
+	[SLAVE_DDR_SS_CFG] = &qhs_ddr_ss_cfg,
+	[SLAVE_DISPLAY_CFG] = &qhs_disp_ss_cfg,
+	[SLAVE_EMAC0_CFG] = &qhs_emac0_cfg,
+	[SLAVE_EMAC1_CFG] = &qhs_emac1_cfg,
+	[SLAVE_GPU_CFG] = &qhs_gpu_cfg,
+	[SLAVE_GPU_THROTTLE_CFG] = &qhs_gpu_throttle_cfg,
+	[SLAVE_HWKM] = &qhs_hwkm,
+	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
+	[SLAVE_MAPSS] = &qhs_mapss,
+	[SLAVE_MDSP_MPU_CFG] = &qhs_mdsp_mpu_cfg,
+	[SLAVE_MESSAGE_RAM] = &qhs_mesg_ram,
+	[SLAVE_MSS] = &qhs_mss,
+	[SLAVE_PCIE_CFG] = &qhs_pcie_cfg,
+	[SLAVE_PDM] = &qhs_pdm,
+	[SLAVE_PIMEM_CFG] = &qhs_pimem_cfg,
+	[SLAVE_PKA_WRAPPER_CFG] = &qhs_pka_wrapper,
+	[SLAVE_PMIC_ARB] = &qhs_pmic_arb,
+	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
+	[SLAVE_QM_CFG] = &qhs_qm_cfg,
+	[SLAVE_QM_MPU_CFG] = &qhs_qm_mpu_cfg,
+	[SLAVE_QPIC] = &qhs_qpic,
+	[SLAVE_QUP_0] = &qhs_qup0,
+	[SLAVE_RPM] = &qhs_rpm,
+	[SLAVE_SDCC_1] = &qhs_sdc1,
+	[SLAVE_SDCC_2] = &qhs_sdc2,
+	[SLAVE_SECURITY] = &qhs_security,
+	[SLAVE_SNOC_CFG] = &qhs_snoc_cfg,
+	[SNOC_SF_THROTTLE_CFG] = &qhs_snoc_sf_throttle_cfg,
+	[SLAVE_TLMM] = &qhs_tlmm,
+	[SLAVE_TSCSS] = &qhs_tscss,
+	[SLAVE_USB2] = &qhs_usb2,
+	[SLAVE_USB3] = &qhs_usb3,
+	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
+	[SLAVE_VENUS_THROTTLE_CFG] = &qhs_venus_throttle_cfg,
+	[SLAVE_VSENSE_CTRL_CFG] = &qhs_vsense_ctrl_cfg,
+	[SLAVE_SERVICE_CNOC] = &srvc_cnoc,
+};
+
+static const struct regmap_config shikra_config_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc shikra_config_noc = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_config_noc_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_config_noc_nodes),
+	.bus_clk_desc = &bus_1_clk,
+	.regmap_cfg = &shikra_config_noc_regmap_config,
+	.keep_alive = true,
+};
+
+static struct qcom_icc_node * const shikra_mc_virt_nodes[] = {
+	[MASTER_LLCC] = &llcc_mc,
+	[SLAVE_EBI_CH0] = &ebi,
+};
+
+static const struct qcom_icc_desc shikra_mc_virt = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_mc_virt_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_mc_virt_nodes),
+	.bus_clk_desc = &bimc_clk,
+	.keep_alive = true,
+	.ab_coeff = 152,
+};
+
+static struct qcom_icc_node * const shikra_mem_noc_core_nodes[] = {
+	[MASTER_GRAPHICS_3D] = &qnm_gpu,
+	[MASTER_MNOC_HF_MEM_NOC] = &qnm_mnoc_hf,
+	[MASTER_ANOC_PCIE_MEM_NOC] = &qnm_pcie,
+	[MASTER_SNOC_SF_MEM_NOC] = &qnm_snoc_sf,
+	[MASTER_AMPSS_M0] = &xm_apps,
+	[MASTER_SYS_TCU] = &xm_tcu,
+	[SLAVE_LLCC] = &qns_llcc,
+	[SLAVE_MEMNOC_SNOC] = &qns_memnoc_snoc,
+	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
+};
+
+static const struct regmap_config shikra_mem_noc_core_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x43080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc shikra_mem_noc_core = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_mem_noc_core_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_mem_noc_core_nodes),
+	.bus_clk_desc = &mem_1_clk,
+	.regmap_cfg = &shikra_mem_noc_core_regmap_config,
+	.intf_clocks = memnoc_intf_clocks,
+	.num_intf_clocks = ARRAY_SIZE(memnoc_intf_clocks),
+	.qos_offset = 0x28000,
+	.keep_alive = true,
+	.ab_coeff = 142,
+};
+
+static struct qcom_icc_node * const shikra_mmnrt_virt_nodes[] = {
+	[MASTER_CAMNOC_SF] = &qnm_camera_nrt,
+	[MASTER_VIDEO_P0] = &qxm_venus0,
+	[MASTER_VIDEO_PROC] = &qxm_venus_cpu,
+	[SLAVE_MMNRT_VIRT] = &mmnrt_virt_slave,
+};
+
+static const struct regmap_config shikra_sys_noc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x6a080,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_desc shikra_mmnrt_virt = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_mmnrt_virt_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_mmnrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_0_clk,
+	.regmap_cfg = &shikra_sys_noc_regmap_config,
+	.qos_offset = 0x51000,
+	.keep_alive = true,
+	.ab_coeff = 142,
+};
+
+static struct qcom_icc_node * const shikra_mmrt_virt_nodes[] = {
+	[MASTER_CAMNOC_HF] = &qnm_camera_rt,
+	[MASTER_MDP_PORT0] = &qxm_mdp0,
+	[MASTER_MMRT_VIRT] = &mmrt_virt_master,
+	[SLAVE_MM_MEMNOC] = &qns_mm_memnoc,
+};
+
+static const struct qcom_icc_desc shikra_mmrt_virt = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_mmrt_virt_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_mmrt_virt_nodes),
+	.bus_clk_desc = &mmaxi_1_clk,
+	.regmap_cfg = &shikra_sys_noc_regmap_config,
+	.qos_offset = 0x51000,
+	.keep_alive = true,
+	.ab_coeff = 142,
+};
+
+static struct qcom_icc_node * const shikra_sys_noc_nodes[] = {
+	[MASTER_SNOC_CFG] = &qhm_snoc_cfg,
+	[MASTER_TIC] = &qhm_tic,
+	[MASTER_ANOC_SNOC] = &qnm_anoc_snoc,
+	[MASTER_MEMNOC_PCIE] = &qnm_memnoc_pcie,
+	[MASTER_MEMNOC_SNOC] = &qnm_memnoc_snoc,
+	[MASTER_PIMEM] = &qxm_pimem,
+	[MASTER_PCIE2_0] = &xm_pcie2_0,
+	[MASTER_QDSS_BAM] = &qhm_qdss_bam,
+	[MASTER_QPIC] = &qhm_qpic,
+	[MASTER_QUP_0] = &qhm_qup0,
+	[CNOC_SNOC_MAS] = &qnm_cnoc_snoc,
+	[MASTER_AUDIO] = &qxm_audio,
+	[MASTER_EMAC_0] = &xm_emac_0,
+	[MASTER_EMAC_1] = &xm_emac_1,
+	[MASTER_QDSS_ETR] = &xm_qdss_etr,
+	[MASTER_SDCC_1] = &xm_sdc1,
+	[MASTER_SDCC_2] = &xm_sdc2,
+	[MASTER_USB2_0] = &xm_usb2_0,
+	[MASTER_USB3] = &xm_usb3_0,
+	[MASTER_CRYPTO_CORE0] = &crypto_c0,
+	[SLAVE_APPSS] = &qhs_apss,
+	[SLAVE_MCUSS] = &qhs_mcuss,
+	[SLAVE_WCSS] = &qhs_wcss,
+	[SLAVE_MEMNOC_SF] = &qns_memnoc_sf,
+	[SNOC_CNOC_SLV] = &qns_snoc_cnoc,
+	[SLAVE_BOOTIMEM] = &qxs_bootimem,
+	[SLAVE_OCIMEM] = &qxs_imem,
+	[SLAVE_PIMEM] = &qxs_pimem,
+	[SLAVE_SERVICE_SNOC] = &srvc_snoc,
+	[SLAVE_PCIE2_0] = &xs_pcie2_0,
+	[SLAVE_QDSS_STM] = &xs_qdss_stm,
+	[SLAVE_TCU] = &xs_sys_tcu_cfg,
+	[SLAVE_PCIE_MEMNOC] = &qns_pcie_memnoc,
+	[SLAVE_ANOC_SNOC] = &qns_anoc_snoc,
+};
+
+static const struct qcom_icc_desc shikra_sys_noc = {
+	.type = QCOM_ICC_QNOC,
+	.nodes = shikra_sys_noc_nodes,
+	.num_nodes = ARRAY_SIZE(shikra_sys_noc_nodes),
+	.bus_clk_desc = &bus_2_clk,
+	.regmap_cfg = &shikra_sys_noc_regmap_config,
+	.intf_clocks = sys_noc_intf_clocks,
+	.num_intf_clocks = ARRAY_SIZE(sys_noc_intf_clocks),
+	.qos_offset = 0x51000,
+	.keep_alive = true,
+};
+
+static const struct of_device_id shikra_qnoc_of_match[] = {
+	{ .compatible = "qcom,shikra-clk-virt", .data = &shikra_clk_virt },
+	{ .compatible = "qcom,shikra-config-noc", .data = &shikra_config_noc },
+	{ .compatible = "qcom,shikra-mc-virt", .data = &shikra_mc_virt },
+	{ .compatible = "qcom,shikra-mem-noc-core", .data = &shikra_mem_noc_core },
+	{ .compatible = "qcom,shikra-mmnrt-virt", .data = &shikra_mmnrt_virt },
+	{ .compatible = "qcom,shikra-mmrt-virt", .data = &shikra_mmrt_virt },
+	{ .compatible = "qcom,shikra-sys-noc", .data = &shikra_sys_noc },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, shikra_qnoc_of_match);
+
+static struct platform_driver shikra_qnoc_driver = {
+	.probe = qnoc_probe,
+	.remove = qnoc_remove,
+	.driver = {
+		.name = "qnoc-shikra",
+		.of_match_table = shikra_qnoc_of_match,
+		.sync_state = icc_sync_state,
+	},
+};
+
+static int __init qnoc_driver_init(void)
+{
+	return platform_driver_register(&shikra_qnoc_driver);
+}
+core_initcall(qnoc_driver_init);
+
+static void __exit qnoc_driver_exit(void)
+{
+	platform_driver_unregister(&shikra_qnoc_driver);
+}
+module_exit(qnoc_driver_exit);
+
+MODULE_DESCRIPTION("Qualcomm Shikra NoC driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


