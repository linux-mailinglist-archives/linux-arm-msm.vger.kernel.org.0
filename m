Return-Path: <linux-arm-msm+bounces-79977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9023C2774D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 05:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2FC418860A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 04:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1E926FA5E;
	Sat,  1 Nov 2025 04:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvATolhy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg+SSg4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037826F478
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761969617; cv=none; b=fuDWHak4Nn5/k09/lkISNpiwrOeDKjrC8lR4XUjTE24e5Xzq4hZ7AbMWG9sqU0oSyD622z6ZqyKiJQNuxFvwCHqtCegHxf4b1jnEavYxi2TulqP9XivkJQryUFLlcHmWjdlLApyrlVcfEFo9RmB/JZX1y6lG5uLLmUDgsyj6BoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761969617; c=relaxed/simple;
	bh=jRJVNmRKWaUyKPYxNThJKMDGqR2NEEWZYcy73oDMgMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmThYyaMCNFiX2IP+mwFJO5zSJfAA67fPXTZaNJLxUIi2RZNM7p12t623cNG3FwVLXUmjnLydoT7axwVHIS9fPZPqrBNo0wCAOhQ98h5qoZwIufhCuVa5xtSOxETW6oIaJjMpa72LmMDXHc4r/cxuvMLK7T9piCG9HSOPGrjmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvATolhy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg+SSg4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A12q3D5462036
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 04:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzQgOeMry1ItMrZAjqq5fsj4t5zzFirVCIw6IOfjCfg=; b=cvATolhyxUDqfCAc
	wG4t7yJY7cP0F4fvPx7l2QDHO4LPwAFqPAh32UOJAZcz0ns5NrNlL/n07rZX1yfV
	T9VRjpaSebDFjWAQ7uxjc/P446+ZupnGwVGFFh9pRuKJB/v+7UDVn6+LvAElf5XY
	Mf3XOm3K1sx+33Pr/7HbMlMiZs3JqhtYZM+tWO2Qo7E5ZmAgYn5O4IVxtxtCge3u
	hrLmMsNOxMtxlbKN5kehHpbnDuiy0Gdfze47mhLTbPxJTjDTwjdWhlpN8eunwJhr
	9T670T2guM0EMqfNjMItAQNXmLS9qN3tglws3FUdCDbOSrg0lvXIHWc2sH45JF+p
	tV65VQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a59t002qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 04:00:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2952cb6f51bso28675165ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 21:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761969613; x=1762574413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzQgOeMry1ItMrZAjqq5fsj4t5zzFirVCIw6IOfjCfg=;
        b=Vg+SSg4du8M28gvX4V8PdWLfCYamXEt/3cJqiwG4wEvuq+gr9bfJAhI6RPNoXweb/m
         Xg/lmIUHg30qPqa+t7hxOy19oJMt9H9XsaEmRFVM5yB18L9QXWXb7J1xPa+yxSzcL8S6
         W80Jyl9WfH8998HpZELwhm9yeaBdZJGaxqXmJ4p0/56/FDgoidjcvWxpCb08T6oX+qln
         AkiwRmNtzHG+utKr3hRjjqXXM9L7p8pA05qouv1U6oUZvDfYiSoboUHv8cjbZ+x+Y+LQ
         wvOuTTabvX/TVr29kXd7ZY5ZIM0uhn015cVoRaASxa5nfq8Ei6lKIOtgEE2fCT6KIKP9
         sFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761969613; x=1762574413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzQgOeMry1ItMrZAjqq5fsj4t5zzFirVCIw6IOfjCfg=;
        b=kUYRY9q9n+wuB6WxXQScS++zhVnYW5jqzkcWQnkxoOHysRwUu2BXMwHBfld977fUmX
         fbPw7bo4eFSA/+Jz9tTKPbSkVTuD2o2sm3DSUE5CxoSikjV6REfHG6oniRo3QVO/IKbV
         R8Vn9faBOErEs+0+a0rsgThYKrekfRcmaaWBiy3h/1F6kcCGkIcF1BA2aYXx/VcXNYjz
         fUfHCXZ8ugbf88mtsgriq/3NslOjPuWACPmgzESnU/9JA442uCrRrBnLMnoT9eVHDIiL
         cFwOSbBBgxPytXkq8XFHNMbWp91VCoDHjAoTsiweCIn/d/o+4oRY0OylsCUtOTqgnows
         I22A==
X-Forwarded-Encrypted: i=1; AJvYcCXFa49OThkD9nWqBVJaLOYVEkjkRRPDu8xeKIsNrmIdWIsl2ERndXS5uRTO3FDNCP1WL9phS9WKB3x2DvsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQTnhx7HEaYTBTFTkvYCTzE8a4blAaQJB7KgBmlwh4xx2LpDdS
	etQbN/euQBMo4enpNLt64cveARBq3ZA7umBNRDHr6cG1/1NI7b49PCroju+IJVcI5ZQj9LZxbS6
	Y91jlXxgAfxdorLcB4ZqPUY6luvWLWSak/mZK6RowAr7e7+uLPng1vPSca/N7lpuNVLdE
X-Gm-Gg: ASbGncs/B5VTHmEfUy8YeTHg6nDrk3qXVrC+fjWuhagCQw+iE8EhQO3qA7KshePLfsg
	Jzgch8RRvYNg+Jvyc/NohnPz4CwuyzINzKiw+bduA7+y0K+tcbu7DgdUhhCjm3bmf7mK6XePe/Q
	PIQGdO41jIfzFkfRwdEh6/c+XPUVYwoJlA+HDimA1QH+jIPfrGWHWZKEIO2u7ZPJ11o1TmBCKta
	s7z0j99nbBQKQOjaz/IRSnuQZZjHIN17gJp9GJktHmOEH+XGbhwog3Fj/NdlnP91Eevg21d3Dh7
	35HGU0mxwYW+iykNoilRekZdP8barSQdnAU33x6xLffhmGTYfAxDwqcR1I/+Il6JOqfj7rsDdTT
	UA9ioZ/CpLyGEpTblmPCPuFME9M1QtsCZwQ==
X-Received: by 2002:a17:902:d2d0:b0:295:49ab:3593 with SMTP id d9443c01a7336-29549ab53edmr33999835ad.29.1761969613052;
        Fri, 31 Oct 2025 21:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUheIRjvz3OE+8J4TZEx3lxBIf7IExUlWeobFK4xE9CChFD3q8UXFHJLumXBNUfTx34qMgOQ==
X-Received: by 2002:a17:902:d2d0:b0:295:49ab:3593 with SMTP id d9443c01a7336-29549ab53edmr33999095ad.29.1761969612347;
        Fri, 31 Oct 2025 21:00:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm41490725ad.2.2025.10.31.21.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:00:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:29:37 +0530
Subject: [PATCH v9 6/7] PCI: pwrctrl: Add power control driver for TC9563
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tc9563-v9-6-de3429f7787a@oss.qualcomm.com>
References: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
In-Reply-To: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761969577; l=20731;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jRJVNmRKWaUyKPYxNThJKMDGqR2NEEWZYcy73oDMgMY=;
 b=2G0PHD2GWLW3wcUVZtYWIv5aneWSqiUGmZg084WuMYA71iZfNfVSEs/LceQwiAIv6UhSRs2Wq
 P36vrL30Xv7AVlx2681nJ4mt6GyT8eEq9dXLCZ9ie2imPjWKJTdOn5f
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=B5e0EetM c=1 sm=1 tr=0 ts=690585ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ovcFienBLN5XsLGGFz8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y_m7smG7Pztemfk8Mmqxkux4jP1y1Poq
X-Proofpoint-ORIG-GUID: Y_m7smG7Pztemfk8Mmqxkux4jP1y1Poq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzMCBTYWx0ZWRfXwSyd6jtD0p7t
 SSwoyTNVzwlnnlA9XQF5gaDRCyvkzFd0k1X9gDTrIdPyni72C/tsiIYWWn0hOOb5alAbnlduYri
 r6eqPXZHnCm2jbAZdjIk+SZ8hnf0pbait6R3CSW/5yAuCHX9CCEE/t8GleAjJRzKkGb1iIR8MNe
 L2RYKFXOYAsVuWgq1uWtAfY/AcgrVvMjq/wq1zEdNW8fnzVx/P4XZUKIPOiLbb+pLWfqNvod+hq
 QMdLw3wBCGhC4Eg8upWXuvzcQs9kON9XnafrqgNDEZI6yKqWrz6gfleCWChsoQfXzJ8MgHuZyTc
 C+/jaBol9oAz6LBY2JQwX3LlYQg5fXbDx3BqJ0plV216FWba8tY3kInZdqgpkB1JpKbD7Ip5DXt
 4E9iwZMxpGrV+iHB+ip7lvvfQNU2Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511010030

TC9563 is a PCIe switch which has one upstream and three downstream
ports. To one of the downstream ports integrated ethernet MAC is connected
as endpoint device. Other two downstream ports are supposed to connect to
external device. One Host can connect to TC9563 by upstream port. TC9563
switch needs to be configured after powering on and before the PCIe link
was up.

The PCIe controller driver already enables link training at the host side
even before this driver probe happens, due to this when driver enables
power to the switch it participates in the link training and PCIe link
may come up before configuring the switch through I2C. Once the link is
up the configuration done through I2C will not have any effect. To prevent
the host from participating in link training, disable link training on the
host side to ensure the link does not come up before the switch is
configured via I2C.

Based on dt property and type of the port, TC9563 is configured through
I2C.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/Kconfig              |  14 +
 drivers/pci/pwrctrl/Makefile             |   2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 648 +++++++++++++++++++++++++++++++
 3 files changed, 664 insertions(+)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index 6956c18548114ce12247b560f1ef159eb7e90b10..b43fdf052d376e14e9481d6dd97e89db3a48ca69 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -22,6 +22,20 @@ config PCI_PWRCTRL_SLOT
 	  PCI slots. The voltage regulators powering the rails of the PCI slots
 	  are expected to be defined in the devicetree node of the PCI bridge.
 
+config PCI_PWRCTRL_TC9563
+	tristate "PCI Power Control driver for TC9563 PCIe switch"
+	select PCI_PWRCTRL
+	default m if ARCH_QCOM
+	help
+	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
+	  switch.
+
+	  This driver enables power and configures the TC9563 PCIe switch
+	  through i2c. TC9563 is a PCIe switch which has one upstream and three
+	  downstream ports. To one of the downstream ports integrated ethernet
+	  MAC is connected as endpoint device. Other two downstream ports are
+	  supposed to connect to external device.
+
 # deprecated
 config HAVE_PWRCTL
 	bool
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index a4e5808d7850ceb0ca272731e5539e1dfc564e43..13b02282106c2bdbf884f487534f7466047c7fcf 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
 obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
 pci-pwrctrl-slot-y			:= slot.o
+
+obj-$(CONFIG_PCI_PWRCTRL_TC9563)	+= pci-pwrctrl-tc9563.o
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
new file mode 100644
index 0000000000000000000000000000000000000000..46339a23204f64c817b0a01d5f81853bdb8759e5
--- /dev/null
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "../pci.h"
+
+#define TC9563_GPIO_CONFIG		0x801208
+#define TC9563_RESET_GPIO		0x801210
+
+#define TC9563_PORT_L0S_DELAY		0x82496c
+#define TC9563_PORT_L1_DELAY		0x824970
+
+#define TC9563_EMBEDDED_ETH_DELAY	0x8200d8
+#define TC9563_ETH_L1_DELAY_MASK	GENMASK(27, 18)
+#define TC9563_ETH_L1_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L1_DELAY_MASK, x)
+#define TC9563_ETH_L0S_DELAY_MASK	GENMASK(17, 13)
+#define TC9563_ETH_L0S_DELAY_VALUE(x)	FIELD_PREP(TC9563_ETH_L0S_DELAY_MASK, x)
+
+#define TC9563_NFTS_2_5_GT		0x824978
+#define TC9563_NFTS_5_GT		0x82497c
+
+#define TC9563_PORT_LANE_ACCESS_ENABLE	0x828000
+
+#define TC9563_PHY_RATE_CHANGE_OVERRIDE	0x828040
+#define TC9563_PHY_RATE_CHANGE		0x828050
+
+#define TC9563_TX_MARGIN		0x828234
+
+#define TC9563_DFE_ENABLE		0x828a04
+#define TC9563_DFE_EQ0_MODE		0x828a08
+#define TC9563_DFE_EQ1_MODE		0x828a0c
+#define TC9563_DFE_EQ2_MODE		0x828a14
+#define TC9563_DFE_PD_MASK		0x828254
+
+#define TC9563_PORT_SELECT		0x82c02c
+#define TC9563_PORT_ACCESS_ENABLE	0x82c030
+
+#define TC9563_POWER_CONTROL		0x82b09c
+#define TC9563_POWER_CONTROL_OVREN	0x82b2c8
+
+#define TC9563_GPIO_MASK		0xfffffff3
+#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Bits to clear for GPIO deassert */
+
+#define TC9563_TX_MARGIN_MIN_UA		400000
+
+/*
+ * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
+ * wait for 10ms for the internal osc frequency to stabilize.
+ */
+#define TC9563_OSC_STAB_DELAY_US	(10 * USEC_PER_MSEC)
+
+#define TC9563_L0S_L1_DELAY_UNIT_NS	256  /* Each unit represents 256 nanoseconds */
+
+struct tc9563_pwrctrl_reg_setting {
+	unsigned int offset;
+	unsigned int val;
+};
+
+enum tc9563_pwrctrl_ports {
+	TC9563_USP,
+	TC9563_DSP1,
+	TC9563_DSP2,
+	TC9563_DSP3,
+	TC9563_ETHERNET,
+	TC9563_MAX
+};
+
+struct tc9563_pwrctrl_cfg {
+	u32 l0s_delay;
+	u32 l1_delay;
+	u32 tx_amp;
+	u8 nfts[2]; /* GEN1 & GEN2 */
+	bool disable_dfe;
+	bool disable_port;
+};
+
+#define TC9563_PWRCTL_MAX_SUPPLY	6
+
+static const char *const tc9563_supply_names[TC9563_PWRCTL_MAX_SUPPLY] = {
+	"vddc",
+	"vdd18",
+	"vdd09",
+	"vddio1",
+	"vddio2",
+	"vddio18",
+};
+
+struct tc9563_pwrctrl_ctx {
+	struct regulator_bulk_data supplies[TC9563_PWRCTL_MAX_SUPPLY];
+	struct tc9563_pwrctrl_cfg cfg[TC9563_MAX];
+	struct gpio_desc *reset_gpio;
+	struct i2c_adapter *adapter;
+	struct i2c_client *client;
+	struct pci_pwrctrl pwrctrl;
+};
+
+/*
+ * downstream port power off sequence, hardcoding the address
+ * as we don't know register names for these register offsets.
+ */
+static const struct tc9563_pwrctrl_reg_setting common_pwroff_seq[] = {
+	{0x82900c, 0x1},
+	{0x829010, 0x1},
+	{0x829018, 0x0},
+	{0x829020, 0x1},
+	{0x82902c, 0x1},
+	{0x829030, 0x1},
+	{0x82903c, 0x1},
+	{0x829058, 0x0},
+	{0x82905c, 0x1},
+	{0x829060, 0x1},
+	{0x8290cc, 0x1},
+	{0x8290d0, 0x1},
+	{0x8290d8, 0x1},
+	{0x8290e0, 0x1},
+	{0x8290e8, 0x1},
+	{0x8290ec, 0x1},
+	{0x8290f4, 0x1},
+	{0x82910c, 0x1},
+	{0x829110, 0x1},
+	{0x829114, 0x1},
+};
+
+static const struct tc9563_pwrctrl_reg_setting dsp1_pwroff_seq[] = {
+	{TC9563_PORT_ACCESS_ENABLE, 0x2},
+	{TC9563_PORT_LANE_ACCESS_ENABLE, 0x3},
+	{TC9563_POWER_CONTROL, 0x014f4804},
+	{TC9563_POWER_CONTROL_OVREN, 0x1},
+	{TC9563_PORT_ACCESS_ENABLE, 0x4},
+};
+
+static const struct tc9563_pwrctrl_reg_setting dsp2_pwroff_seq[] = {
+	{TC9563_PORT_ACCESS_ENABLE, 0x8},
+	{TC9563_PORT_LANE_ACCESS_ENABLE, 0x1},
+	{TC9563_POWER_CONTROL, 0x014f4804},
+	{TC9563_POWER_CONTROL_OVREN, 0x1},
+	{TC9563_PORT_ACCESS_ENABLE, 0x8},
+};
+
+/*
+ * Since all transfers are initiated by the probe, no locks are necessary,
+ * as there are no concurrent calls.
+ */
+static int tc9563_pwrctrl_i2c_write(struct i2c_client *client,
+				    u32 reg_addr, u32 reg_val)
+{
+	struct i2c_msg msg;
+	u8 msg_buf[7];
+	int ret;
+
+	msg.addr = client->addr;
+	msg.len = 7;
+	msg.flags = 0;
+
+	/* Big Endian for reg addr */
+	put_unaligned_be24(reg_addr, &msg_buf[0]);
+
+	/* Little Endian for reg val */
+	put_unaligned_le32(reg_val, &msg_buf[3]);
+
+	msg.buf = msg_buf;
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	return ret == 1 ? 0 : ret;
+}
+
+static int tc9563_pwrctrl_i2c_read(struct i2c_client *client,
+				   u32 reg_addr, u32 *reg_val)
+{
+	struct i2c_msg msg[2];
+	u8 wr_data[3];
+	u32 rd_data;
+	int ret;
+
+	msg[0].addr = client->addr;
+	msg[0].len = 3;
+	msg[0].flags = 0;
+
+	/* Big Endian for reg addr */
+	put_unaligned_be24(reg_addr, &wr_data[0]);
+
+	msg[0].buf = wr_data;
+
+	msg[1].addr = client->addr;
+	msg[1].len = 4;
+	msg[1].flags = I2C_M_RD;
+
+	msg[1].buf = (u8 *)&rd_data;
+
+	ret = i2c_transfer(client->adapter, &msg[0], 2);
+	if (ret == 2) {
+		*reg_val = get_unaligned_le32(&rd_data);
+		return 0;
+	}
+
+	/* If only one message successfully completed, return -EIO */
+	return ret == 1 ? -EIO : ret;
+}
+
+static int tc9563_pwrctrl_i2c_bulk_write(struct i2c_client *client,
+					 const struct tc9563_pwrctrl_reg_setting *seq, int len)
+{
+	int ret, i;
+
+	for (i = 0; i < len; i++) {
+		ret = tc9563_pwrctrl_i2c_write(client, seq[i].offset, seq[i].val);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl_ctx *ctx,
+				       enum tc9563_pwrctrl_ports port)
+{
+	struct tc9563_pwrctrl_cfg *cfg = &ctx->cfg[port];
+	const struct tc9563_pwrctrl_reg_setting *seq;
+	int ret, len;
+
+	if (!cfg->disable_port)
+		return 0;
+
+	if (port == TC9563_DSP1) {
+		seq = dsp1_pwroff_seq;
+		len = ARRAY_SIZE(dsp1_pwroff_seq);
+	} else {
+		seq = dsp2_pwroff_seq;
+		len = ARRAY_SIZE(dsp2_pwroff_seq);
+	}
+
+	ret = tc9563_pwrctrl_i2c_bulk_write(ctx->client, seq, len);
+	if (ret)
+		return ret;
+
+	return tc9563_pwrctrl_i2c_bulk_write(ctx->client,
+					    common_pwroff_seq, ARRAY_SIZE(common_pwroff_seq));
+}
+
+static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl_ctx *ctx,
+						 enum tc9563_pwrctrl_ports port, bool is_l1, u32 ns)
+{
+	u32 rd_val, units;
+	int ret;
+
+	if (ns < TC9563_L0S_L1_DELAY_UNIT_NS)
+		return 0;
+
+	/* convert to units of 256ns */
+	units = ns / TC9563_L0S_L1_DELAY_UNIT_NS;
+
+	if (port == TC9563_ETHERNET) {
+		ret = tc9563_pwrctrl_i2c_read(ctx->client, TC9563_EMBEDDED_ETH_DELAY, &rd_val);
+		if (ret)
+			return ret;
+
+		if (is_l1)
+			rd_val = u32_replace_bits(rd_val, units, TC9563_ETH_L1_DELAY_MASK);
+		else
+			rd_val = u32_replace_bits(rd_val, units, TC9563_ETH_L0S_DELAY_MASK);
+
+		return tc9563_pwrctrl_i2c_write(ctx->client, TC9563_EMBEDDED_ETH_DELAY, rd_val);
+	}
+
+	ret = tc9563_pwrctrl_i2c_write(ctx->client, TC9563_PORT_SELECT, BIT(port));
+	if (ret)
+		return ret;
+
+	return tc9563_pwrctrl_i2c_write(ctx->client,
+				       is_l1 ? TC9563_PORT_L1_DELAY : TC9563_PORT_L0S_DELAY, units);
+}
+
+static int tc9563_pwrctrl_set_tx_amplitude(struct tc9563_pwrctrl_ctx *ctx,
+					   enum tc9563_pwrctrl_ports port)
+{
+	u32 amp = ctx->cfg[port].tx_amp;
+	int port_access;
+
+	if (amp < TC9563_TX_MARGIN_MIN_UA)
+		return 0;
+
+	/* txmargin = (Amp(uV) - 400000) / 3125 */
+	amp = (amp - TC9563_TX_MARGIN_MIN_UA) / 3125;
+
+	switch (port) {
+	case TC9563_USP:
+		port_access = 0x1;
+		break;
+	case TC9563_DSP1:
+		port_access = 0x2;
+		break;
+	case TC9563_DSP2:
+		port_access = 0x8;
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	struct tc9563_pwrctrl_reg_setting tx_amp_seq[] = {
+		{TC9563_PORT_ACCESS_ENABLE, port_access},
+		{TC9563_PORT_LANE_ACCESS_ENABLE, 0x3},
+		{TC9563_TX_MARGIN, amp},
+	};
+
+	return tc9563_pwrctrl_i2c_bulk_write(ctx->client, tx_amp_seq, ARRAY_SIZE(tx_amp_seq));
+}
+
+static int tc9563_pwrctrl_disable_dfe(struct tc9563_pwrctrl_ctx *ctx,
+				      enum tc9563_pwrctrl_ports port)
+{
+	struct tc9563_pwrctrl_cfg *cfg = &ctx->cfg[port];
+	int port_access, lane_access = 0x3;
+	u32 phy_rate = 0x21;
+
+	if (!cfg->disable_dfe)
+		return 0;
+
+	switch (port) {
+	case TC9563_USP:
+		phy_rate = 0x1;
+		port_access = 0x1;
+		break;
+	case TC9563_DSP1:
+		port_access = 0x2;
+		break;
+	case TC9563_DSP2:
+		port_access = 0x8;
+		lane_access = 0x1;
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	struct tc9563_pwrctrl_reg_setting disable_dfe_seq[] = {
+		{TC9563_PORT_ACCESS_ENABLE, port_access},
+		{TC9563_PORT_LANE_ACCESS_ENABLE, lane_access},
+		{TC9563_DFE_ENABLE, 0x0},
+		{TC9563_DFE_EQ0_MODE, 0x411},
+		{TC9563_DFE_EQ1_MODE, 0x11},
+		{TC9563_DFE_EQ2_MODE, 0x11},
+		{TC9563_DFE_PD_MASK, 0x7},
+		{TC9563_PHY_RATE_CHANGE_OVERRIDE, 0x10},
+		{TC9563_PHY_RATE_CHANGE, phy_rate},
+		{TC9563_PHY_RATE_CHANGE, 0x0},
+		{TC9563_PHY_RATE_CHANGE_OVERRIDE, 0x0},
+	};
+
+	return tc9563_pwrctrl_i2c_bulk_write(ctx->client,
+					    disable_dfe_seq, ARRAY_SIZE(disable_dfe_seq));
+}
+
+static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl_ctx *ctx,
+				   enum tc9563_pwrctrl_ports port)
+{
+	u8 *nfts = ctx->cfg[port].nfts;
+	struct tc9563_pwrctrl_reg_setting nfts_seq[] = {
+		{TC9563_NFTS_2_5_GT, nfts[0]},
+		{TC9563_NFTS_5_GT, nfts[1]},
+	};
+	int ret;
+
+	if (!nfts[0])
+		return 0;
+
+	ret =  tc9563_pwrctrl_i2c_write(ctx->client, TC9563_PORT_SELECT, BIT(port));
+	if (ret)
+		return ret;
+
+	return tc9563_pwrctrl_i2c_bulk_write(ctx->client, nfts_seq, ARRAY_SIZE(nfts_seq));
+}
+
+static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl_ctx *ctx, bool deassert)
+{
+	int ret, val;
+
+	ret = tc9563_pwrctrl_i2c_write(ctx->client, TC9563_GPIO_CONFIG, TC9563_GPIO_MASK);
+	if (ret)
+		return ret;
+
+	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
+
+	return tc9563_pwrctrl_i2c_write(ctx->client, TC9563_RESET_GPIO, val);
+}
+
+static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl_ctx *ctx, struct device_node *node,
+					  enum tc9563_pwrctrl_ports port)
+{
+	struct tc9563_pwrctrl_cfg *cfg = &ctx->cfg[port];
+	int ret;
+
+	/* Disable port if the status of the port is disabled. */
+	if (!of_device_is_available(node)) {
+		cfg->disable_port = true;
+		return 0;
+	};
+
+	ret = of_property_read_u32(node, "aspm-l0s-entry-delay-ns", &cfg->l0s_delay);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = of_property_read_u32(node, "aspm-l1-entry-delay-ns", &cfg->l1_delay);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = of_property_read_u32(node, "toshiba,tx-amplitude-microvolt", &cfg->tx_amp);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = of_property_read_u8_array(node, "n-fts", cfg->nfts, ARRAY_SIZE(cfg->nfts));
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	cfg->disable_dfe = of_property_read_bool(node, "toshiba,no-dfe-support");
+
+	return 0;
+}
+
+static void tc9563_pwrctrl_power_off(struct tc9563_pwrctrl_ctx *ctx)
+{
+	gpiod_set_value(ctx->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+}
+
+static int tc9563_pwrctrl_bring_up(struct tc9563_pwrctrl_ctx *ctx)
+{
+	struct tc9563_pwrctrl_cfg *cfg;
+	int ret, i;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return dev_err_probe(ctx->pwrctrl.dev, ret, "cannot enable regulators\n");
+
+	gpiod_set_value(ctx->reset_gpio, 0);
+
+	fsleep(TC9563_OSC_STAB_DELAY_US);
+
+	ret = tc9563_pwrctrl_assert_deassert_reset(ctx, false);
+	if (ret)
+		goto power_off;
+
+	for (i = 0; i < TC9563_MAX; i++) {
+		cfg = &ctx->cfg[i];
+		ret = tc9563_pwrctrl_disable_port(ctx, i);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Disabling port failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, false, cfg->l0s_delay);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Setting L0s entry delay failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(ctx, i, true, cfg->l1_delay);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Setting L1 entry delay failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_set_tx_amplitude(ctx, i);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Setting Tx amplitude failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_set_nfts(ctx, i);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Setting N_FTS failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_disable_dfe(ctx, i);
+		if (ret) {
+			dev_err(ctx->pwrctrl.dev, "Disabling DFE failed\n");
+			goto power_off;
+		}
+	}
+
+	ret = tc9563_pwrctrl_assert_deassert_reset(ctx, true);
+	if (!ret)
+		return 0;
+
+power_off:
+	tc9563_pwrctrl_power_off(ctx);
+	return ret;
+}
+
+static int tc9563_pwrctrl_probe(struct platform_device *pdev)
+{
+	struct pci_host_bridge *bridge = to_pci_host_bridge(pdev->dev.parent);
+	struct pci_bus *bus = bridge->bus;
+	struct device *dev = &pdev->dev;
+	enum tc9563_pwrctrl_ports port;
+	struct tc9563_pwrctrl_ctx *ctx;
+	struct device_node *i2c_node;
+	int ret, addr;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "i2c-parent", 1, &addr);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read i2c-parent property\n");
+
+	i2c_node = of_parse_phandle(dev->of_node, "i2c-parent", 0);
+	ctx->adapter = of_find_i2c_adapter_by_node(i2c_node);
+	of_node_put(i2c_node);
+	if (!ctx->adapter)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find I2C adapter\n");
+
+	ctx->client = i2c_new_dummy_device(ctx->adapter, addr);
+	if (IS_ERR(ctx->client)) {
+		dev_err(dev, "Failed to create I2C client\n");
+		i2c_put_adapter(ctx->adapter);
+		return PTR_ERR(ctx->client);
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(tc9563_supply_names); i++)
+		ctx->supplies[i].supply = tc9563_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, TC9563_PWRCTL_MAX_SUPPLY, ctx->supplies);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get supply regulator\n");
+		goto remove_i2c;
+	}
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "resx", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio)) {
+		ret = dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "failed to get resx GPIO\n");
+		goto remove_i2c;
+	}
+
+	pci_pwrctrl_init(&ctx->pwrctrl, dev);
+
+	port = TC9563_USP;
+	ret = tc9563_pwrctrl_parse_device_dt(ctx, pdev->dev.of_node, port);
+	if (ret) {
+		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
+		goto remove_i2c;
+	}
+
+	/*
+	 * Downstream ports are always children of the upstream port.
+	 * The first node represents DSP1, the second node represents DSP2, and so on.
+	 */
+	for_each_child_of_node_scoped(pdev->dev.of_node, child) {
+		port++;
+		ret = tc9563_pwrctrl_parse_device_dt(ctx, child, port);
+		if (ret)
+			break;
+		/* Embedded ethernet device are under DSP3 */
+		if (port == TC9563_DSP3) {
+			for_each_child_of_node_scoped(child, child1) {
+				port++;
+				ret = tc9563_pwrctrl_parse_device_dt(ctx, child1, port);
+				if (ret)
+					break;
+			}
+		}
+	}
+	if (ret) {
+		dev_err(dev, "failed to parse device tree properties: %d\n", ret);
+		goto remove_i2c;
+	}
+
+	if (bridge->ops->assert_perst) {
+		ret = bridge->ops->assert_perst(bus, true);
+		if (ret)
+			goto remove_i2c;
+	}
+
+	ret = tc9563_pwrctrl_bring_up(ctx);
+	if (ret)
+		goto remove_i2c;
+
+	if (bridge->ops->assert_perst) {
+		ret = bridge->ops->assert_perst(bus, false);
+		if (ret)
+			goto power_off;
+	}
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &ctx->pwrctrl);
+	if (ret)
+		goto power_off;
+
+	platform_set_drvdata(pdev, ctx);
+
+	return 0;
+
+power_off:
+	tc9563_pwrctrl_power_off(ctx);
+remove_i2c:
+	i2c_unregister_device(ctx->client);
+	i2c_put_adapter(ctx->adapter);
+	return ret;
+}
+
+static void tc9563_pwrctrl_remove(struct platform_device *pdev)
+{
+	struct tc9563_pwrctrl_ctx *ctx = platform_get_drvdata(pdev);
+
+	tc9563_pwrctrl_power_off(ctx);
+	i2c_unregister_device(ctx->client);
+	i2c_put_adapter(ctx->adapter);
+}
+
+static const struct of_device_id tc9563_pwrctrl_of_match[] = {
+	{ .compatible = "pci1179,0623"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc9563_pwrctrl_of_match);
+
+static struct platform_driver tc9563_pwrctrl_driver = {
+	.driver = {
+		.name = "pwrctrl-tc9563",
+		.of_match_table = tc9563_pwrctrl_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = tc9563_pwrctrl_probe,
+	.remove = tc9563_pwrctrl_remove,
+};
+module_platform_driver(tc9563_pwrctrl_driver);
+
+MODULE_AUTHOR("Krishna chaitanya chundru <quic_krichai@quicinc.com>");
+MODULE_DESCRIPTION("TC956x power control driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


