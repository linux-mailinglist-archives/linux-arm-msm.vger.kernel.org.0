Return-Path: <linux-arm-msm+bounces-106755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D4oNaVy/mmVqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA44FCC60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 01:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C612305662E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 23:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718B7365A13;
	Fri,  8 May 2026 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzGzBejO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6RzED5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB18363094
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 23:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283091; cv=none; b=JQ0YcHgEo58uUri0r5OUsp+vDyKSGaMUsyz3r8NJAkL/mY2uzEi7ckQIuuRLxbo3Uo+XCmMUA0nvucVEBhKpq3zl4ddhCHITk0080IUEg4bZzdsSr7VhSUvtZvf3FSG3WQPQToj//Ow7omLWGNsaWm6+6rrgY+ojKNB6a/c6ITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283091; c=relaxed/simple;
	bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ4v7btrDNvqHQdA7dbKM4Q3TVKmvDien7XLSCQ8gKEIgaGikZrVqzs1VPCX78x+QNtJ2OSORWFZAfMJBkcV4KCC/XQHfxgUkFwkPWzIJ56vtwXxgbwQD2wkxaW9RHBGa1nwPDDRCnYcED13pVEpe7NIq9ZnP1IWeGICCg8QPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzGzBejO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6RzED5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Llc4l257891
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 23:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=; b=ZzGzBejO+Iryk8zv
	NrxGOg/HcPnkAB43vCr3+FSRlBh2zXs/ubVuntAmrmPVxzCy/zI/tzQqlpG8qFw7
	a7cWqtjmzY+Knfe/6A5xDd3ucuLfy8ZSgK7GcQ6HmXUsE3Geuxvfd6QiSrlqm+Yd
	P+F5QInxSFWhzLwX10ZSQ27vkUy4B2360sY4gCqD36mluTugwdvNWVD6cAe4hAhD
	zoPJZZB488HCKc/qpO+vGuFsdCDdMgyvbRY0RVMXP/T+BxonqhmK789XGcpx10PS
	6bXaDi1K94AoP7kEi4mTS/kcbLYtYRxZufQAcuPY+G7QjmLyk+eGm01pYSzh+Co4
	UXSq0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auekewj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 23:31:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2723413eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778283088; x=1778887888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=c6RzED5eBTLZdel/Jfa+qPz5Y00soqtUmJI/3ABtMWCNLEp+1JHYc4VwFjt7Zk7HFp
         40uvXYdwM/MEuMH/Hc4mziYoSaMcL0WNA790div87XNmuVor033wzgqlpvDXH/6guFKE
         jzRknBq3/o/s6+9Us++fR4T3AQz0Hy6oiRZcmrMsEfxZ//W0B5oDDAS2xH8EFN8cyllN
         PueqL+vfLtRS3KUet1Cukecvy17yZBYyMFvy82po9TJ92qcwJk4bcd4+QAP9URBjDGeM
         6f+F7ArPXrNLVGJilbIePKSlgJgSpbFdNWG1kc6SOQnijnHt+FOu3b4yjmHwvYRQHJYi
         zv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283088; x=1778887888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2mlViog/YyqHq+jcQTv7WnwnY8MfXhr992hmCBoDqw=;
        b=kA138ztl8oNjsi7peOqt9+SvGeTW6765rS+kikGyBtpR9vmv+JmaYoLGl/GbRno00u
         idV6AFjMvGczrUt0ZoLF/t04rJRB1mcJsjTv2rR5DPpSksz94yWiHufiKMI+/0wrPXS1
         ZsBv1uIX7ZV6zsVYy7UynMOm2pmMDREXH3up2U4V0SWPV8of2zGsQshpsJHMCKOj+aG2
         iec200X3pE13sQRs4GjmefSxpowzzJroAP7Ep0YSvW7Qor/H7RhaRuHeDsKDk1xL4WIL
         FWeb7WGHCp+haLensW/ULMv/eMBsMMhCxIcp+PpPT2cIhYW0FL/rxCKpe1+fBpBlRdHX
         T/Qg==
X-Gm-Message-State: AOJu0YwkxQtObn201ZRsaeAYpgLuigqp/SYtH9JuKwtvATozlqcKQPQd
	fqwawDs6+86IaHdZBzYmE2+P16Si3w5JQM0euB/WcsbJ6wG6E4ReB/BsmHHb00geKQT2fcFLyU4
	leZs5tl/j0zhNMG+xN95SuWRqGcH9d4wdsF7ctEX4b/FOJ7fruypT05CgJvVGih+OSRNI
X-Gm-Gg: Acq92OHdGfp30div6A+qV8jv/ZfuO3Ix3BzE2V5q6qEEMH8CdlsHi1K1IlbbdltjQo5
	1IUKGN91mtSYrIEIioDGhkZFxaVzYu0YHoU43dRgY+zLrKXepgvV93mYsTkmPT6jXsRZbF47S3J
	UFTcg+3CLpUDJ0xkfZulpAhKlugWNuxiVGsF10NZCUp84PR2LNHcdTT9Es7GoKfAY7DTS294uZ5
	wWWU4Mv+5E9AAPaXWweZJXUQke+ZjrAN+8RJWXy71C7K3HMob9duO0VPf8td1HsTssDRknTOPpb
	+9UjpCopn6VE4OTGfA1ZR+j1dyBaQn3gL8x0CIIU4zboPm7EmYaf4qU8ipgj3rqsGDp9C43dqW0
	JuQrrMEu/F+3jW+cOcZvq2cwo2w0hpwCK1yddyH+snEdlYh4xgmSs6qraaqI=
X-Received: by 2002:a05:7300:bb8a:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-2f54b899b3dmr6700467eec.34.1778283087653;
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
X-Received: by 2002:a05:7300:bb8a:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-2f54b899b3dmr6700442eec.34.1778283087089;
        Fri, 08 May 2026 16:31:27 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885b87dsm5033122eec.21.2026.05.08.16.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:31:26 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 08 May 2026 23:31:20 +0000
Subject: [PATCH 05/10] phy: qcom-qmp: pcs-pcie: Add v10 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hawi-phy-pcie-v1-5-237b894353fc@oss.qualcomm.com>
References: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
In-Reply-To: <20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778283082; l=1757;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=8Pt1Iry46S+aeKxOUquDig1kaHN7zoPCKWm77OKh1o0=;
 b=m2ywsU2DGNXxUhUIuOPFjA9wk8TahhnDTjaoCybhJUMJPNrznlkKV6dCqB9AbtQhI9wBb8wYP
 ZmYnKlb24CKAsDz5ZyEvpSRVU5/3lLltLW8TdnbI4MXydoSx5OR1gs+
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIzMiBTYWx0ZWRfXxyo15DRZPY5q
 BmwoT1yVIvEJH1aOWfSwJ4jgK2jf3aImQqBHL0YVNa4clMbGt3r1llZoT1eZA7QHkEOFT4gn33O
 IgFL+pQ0Cbak1NFKlM15J9X7T8oYWPhiyXM31yiT537Ht1bNXdGkRD1ocdTPlOU2oE2/3X68jos
 niQsbW2X1w/E3OxQaCti6wsLP2vKnDrAs+w3AP/TBpxv/3h8u1COKtfhkA+BbhkPXy5FhTxtK3O
 f0uw2pn5r3YVnVh2+VxAp/P1LxhFMImP6cG+Bv6hi6VScr46HmoLY9L4weHhOrFKZ3suip0RL8j
 AzyABJDz/hn8ANyDFmO95z1bImVnPPXIK4rx6SR5uQu1LmCHp8NzXuUkK564mKg/phsMhil66AY
 zafWHYdP+ztxCkQl9tAkZCXohBcG6VIbOfzGgS45NigM5tWcQlH51GUrcBCj7Hj8DGg3kxXXd8R
 TUCziCh8Lp06dOIr3HA==
X-Proofpoint-GUID: YbZfk2kQ_xdtZ1jGkFcJmkqkZjMxryNb
X-Proofpoint-ORIG-GUID: YbZfk2kQ_xdtZ1jGkFcJmkqkZjMxryNb
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fe7250 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=a_mrqaUjlmxG8iE0lbgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080232
X-Rspamd-Queue-Id: 7AAA44FCC60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106755-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hawi SoC uses QMP phy with version v10 for PCIe Gen3 x2. Add the new PCS
PCIe specific offsets in a dedicated header file.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..ba17e53d000f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -40,6 +40,7 @@
 #include "phy-qcom-qmp-qserdes-com-v8.h"
 #include "phy-qcom-qmp-pcs-pcie-v8.h"
 #include "phy-qcom-qmp-qserdes-txrx-pcie-v8.h"
+#include "phy-qcom-qmp-pcs-pcie-v10.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
new file mode 100644
index 000000000000..2cdcc211bd93
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_PCIE_V10_H_
+#define QCOM_PHY_QMP_PCS_PCIE_V10_H_
+
+/* Only for QMP V10 PHY - PCIE PCS registers */
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG2		0x00c
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG4		0x014
+#define QPHY_PCIE_V10_PCS_ENDPOINT_REFCLK_DRIVE		0x020
+#define QPHY_PCIE_V10_PCS_OSC_DTCT_ACTIONS		0x094
+#define QPHY_PCIE_V10_PCS_EQ_CONFIG1			0x0a4
+#define QPHY_PCIE_V10_PCS_RXEQEVAL_TIME			0x0f4
+#define QPHY_PCIE_V10_PCS_POWER_STATE_CONFIG6		0x0f8
+
+#endif

-- 
2.34.1


