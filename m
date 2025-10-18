Return-Path: <linux-arm-msm+bounces-77853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33578BEC3C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 03:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13F2A4E4373
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 01:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A9821B9C0;
	Sat, 18 Oct 2025 01:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="It2rF1oX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09821423C
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760751234; cv=none; b=sURciSphVjlZtAoy7Ltot5uAiYnZsutcOgSHs2Vyj9Uuj9lYV2rN8dbZnLwUqOBgWCZZK5yIuTtqfhCj/+mSlnTge0QKLtvdumyiJVHKYdNEZQe6Ep9yCGLPDA08Kf9vvqIviYf4e6Qev6t81cmrd2Ya4f9Fjj4AkDvtzHJL9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760751234; c=relaxed/simple;
	bh=dRqJWz7OIwNnKTzn33y4BQaTa8oSs2p8RyOoVIfWlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceaGN58650W8PTXVu65HpX0/1mlje6RfddvnubPCwf9KPsVZE8gyomloL+VL6XITRt5iFI5uh1Tfdapt2uLAy6JqHgzMoXBeLqJ05vY912KR3gGcVpilL7sl7C4kY3D0gwXQ4W410L6ChY1cZa3GdAKi6Ex594nROnitaZ8iPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=It2rF1oX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJGjQG005384
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnqwEheiYw4eMqGgagIbYYTEmFr59FG4+mnaf+XhjEI=; b=It2rF1oX3BLd+TU8
	kyLXZGWIHND7ASt9uuxNpKpZ8T1giFdsKSRKC8aurqKTNe7rwKvPZsKYi4RXVJCg
	LscNR5QKdkAq5lzGhXmy+rrKfPexXmdwuSbIIBJJwq0+0L7J+BuI53MOrsgv/+vF
	y3zHJukGY2LaAwRUxd2fBofswTT0Q+6bi4rxWqfExG0DbjoWDiJZZiD0dNWS9fhK
	pBII8wo4S4wrc4ECnmJyobe109ARn4sWQDX/927a0RXQebgzvB2ceTzDQDb+HLXl
	C+Jmff8EO/Rms7QUv5uLQv+fM2WMnDxzE2RZnnCmvMl00WG4CIW9UL3Jktgn+mpG
	TPl6ZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5xbpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 01:33:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so2995186a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 18:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760751230; x=1761356030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnqwEheiYw4eMqGgagIbYYTEmFr59FG4+mnaf+XhjEI=;
        b=s5wc/pl6HpF/OnUkdWXLA8lCb6tqM2w8vuypJ5cKb3keZKA83MMR+oXM6QYkJm5owV
         tNsQKukBqyUjMTBQGA30zQTRyXo4nhrLtjAuvkgV5uw821W5zJW2bKP7CnKT4n81F7aW
         IZoRF2AAIQFVjVYkvvaqUEfUXCXrSVHggYD+A9oDdbT8qfKFOmhJCd4k4qkXTbsPb9Sw
         Gb1pMzS6cPhSuWO3ZtgdYq88xOnUDwCvnMvfcFl09gpn0S6MnZA82mwZBKr08YQPJt7j
         NkNNFLTdR49W0iyMERvnRm3pr83jlIYP7jTL18rzinoN7P8TDj8ava+3y6zrpFCHGunq
         TwMw==
X-Gm-Message-State: AOJu0YxVnEwDM5aaijECmE58cvKb8SaEJFnSDddMoYLso2v7eYcW11J7
	MtDStA/8tt6cl/k1Qvjjm/sQQ+nViwLf2q1SaovnU5acqRtFg3rNSLUqI8C/n0DH+0ODbdmngs7
	2GBvvtyAxgQQoPahZy04jiNWCS6SF7jLDTrVhh/fZNdCps9WCe/rU1EAqXBdQ6qtLnb8P
X-Gm-Gg: ASbGncuk8ayyhU6gaTnhPBSicIUqxbAaf69CYwTR/3VzfEfVdtOJkp4BjBl+RFSQF5H
	M10w68WZ8qDRLiK1NtcswdjiyiY7XIH5vJmGZ39Jr1ZUVYppMkumJ3DgTVbP1uryE+X4gApMSV0
	2U+oc7lDt0fmOOGlR3zKM38H2LzVEp4WF4LlWtDltlUr/+LxZMEjySbITiGwQWT6OGa350CZuva
	EplxQqCdo6qS5OzyBqnwlfBwW66d8oDv2aYovxq78nIkd6sc9TxJ7vrVOLZhpCCb+1MiD+8P4kN
	/cUgL0DF46nmEX81OLbByUo3TDSZliAsLHuI3FIenze+fCWeJyX5vhLjVYEgvc09yIWoHZF3cq7
	0uJkbWWruveHZF7Xj+JniwOUPz6z0TgQ6Ep2UjVNj6B7BYA==
X-Received: by 2002:a17:902:ce12:b0:26b:da03:60db with SMTP id d9443c01a7336-290c9ca6b1cmr72784805ad.13.1760751230578;
        Fri, 17 Oct 2025 18:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyqTnRrVLfri2rPa2KLlfbixfUhrUK3J0pAbGviBCAqZVoD1KHQxtnhlTVe79JwMAh+DNsIQ==
X-Received: by 2002:a17:902:ce12:b0:26b:da03:60db with SMTP id d9443c01a7336-290c9ca6b1cmr72784485ad.13.1760751230159;
        Fri, 17 Oct 2025 18:33:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf16bcsm791695a91.4.2025.10.17.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 18:33:48 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 18:33:41 -0700
Subject: [PATCH v5 4/6] phy: qcom-qmp: pcs: Add v8.50 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-glymur_pcie-v5-4-82d0c4bd402b@oss.qualcomm.com>
References: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
In-Reply-To: <20251017-glymur_pcie-v5-0-82d0c4bd402b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760751221; l=1673;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=229Z+uA9EBUjxLvNJs5f/sN8K/iZsIa19KeM+KZknsc=;
 b=FMk3XJnpt5L5oYFyTSeIgwj4netRzGwWjSHT7VYRPORe2EsVKTIv45z1fdtp+YHxJZXiYEfIt
 o7Izq7Q8MQVA3O4tO25fm5D025He4SOrT2R0UiSf7mQ4ss04x+4OsSF
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: gp7CppcvtAoqYMyK5LyBf3WQnvdMTVEE
X-Proofpoint-ORIG-GUID: gp7CppcvtAoqYMyK5LyBf3WQnvdMTVEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXxa1+Aad9jSSe
 BzNzzsKx839PefPTSE/VxYjW2fqDvpJ5K8WTHAJDQa0jJ4o0myGOduX3foMTC+8WrqOussI3UQP
 UpZuKOb6+ZJNc++tsjuL7PCPCJyauc9ai6fO/7ssYNc6nyqlqvoG9EWtYDd/KOp1M3BqMEPXyMp
 E3JQVvNaXSF+6kZ/SgDBqoLbvoBddFALA32gxleIFR/ClhBi/yLUMUmXwFJf8zVDBNvLKWm7GsI
 2/9Gry/CFq8ZZLlFXkER1lX/jtA4VMFhWyfaAqD1IsMvysz4T1FXrhjpqVviBMepcLUYta8Cm9X
 jaWULLBAJOzxFGq7ahMOOU/YnI7qco0+2dPTTB6BDqp/xmQyURxyUMnzpR3jQs1UT8CY3HoRO+H
 VshUVWDpPkuSt4RMhUrUXkaZf4zMKA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f2ee7f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MyfKwbsdfMS_-thd9JUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The new Glymur SoC bumps up the HW version of QMP phy to v8.50 for PCIE
g5x4. Add the new PCS offsets in a dedicated header file.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h | 13 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
new file mode 100644
index 0000000000000000000000000000000000000000..325c127e8eb7ad842018dce51d09a6ee54ed86ff
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V8_50_H_
+#define QCOM_PHY_QMP_PCS_V8_50_H_
+
+#define QPHY_V8_50_PCS_STATUS1			0x010
+#define QPHY_V8_50_PCS_START_CONTROL			0x05c
+#define QPHY_V8_50_PCS_POWER_DOWN_CONTROL			0x64
+
+#endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index f58c82b2dd23e1bda616d67ab7993794b997063b..da2a7ad2cdccef1308a2b7aa71a2e5cf8bd7c1d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -58,6 +58,8 @@
 
 #include "phy-qcom-qmp-pcs-v8.h"
 
+#include "phy-qcom-qmp-pcs-v8_50.h"
+
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */

-- 
2.34.1


