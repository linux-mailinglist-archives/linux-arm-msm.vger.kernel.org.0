Return-Path: <linux-arm-msm+bounces-102161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLtrNt8A1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:04:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAD3AECDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EA98300AC24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11913B6C1E;
	Tue,  7 Apr 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWO+Br8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCz5pe9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C883B7759
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567011; cv=none; b=PnO3MI4Jefm921Nawjvg0LinS9p+dASR0SgC1HlSCvQcyT8XwnI3B9Tq7cwB5AL/Nvg0Y23RX2LkXfZE4EemOjKpYAirkqiuD1hJA/zITpcHkaQIB2WHeK/FMeloYnWoGrg7x7CZrE27todIg5usto4DTGycMsqHli8PNP90qLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567011; c=relaxed/simple;
	bh=77/I314LVY80VJYVakANAJH+wffpPLweMyKMYg0Una4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxXBRlRsQcjEkiIkbto349orJwbav7RaS8Wk11S9vfmJSaFkrgoxsJrOlpjqR6Wi4L/Ay7yvYAEdRnOYDMO6A3F1OCddfyGdeJm/9OPepOhCE9WeX2e1KxlSa3R/SE+B/bjf3s2z5lSPEbTqqzizCFcZascaPoYxbXZX9k0RG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWO+Br8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCz5pe9i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X4wb2327732
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=; b=IWO+Br8juXfi2GMw
	0IKkHEoBDywwCfX6efs6+f1+rQqegHIh85G20uAZ0uuoPeRiYz2n40wE5vaCMBXS
	ar97iG62w1tGd+Dh+yEQGMi67d6zt8x/scdL5surl/JrjnDqd4WVZaoRq7QMg5xx
	usIhv76hAZYFh7/3l+8ssdpAv0gqZ0qGSEuBsJaKCuFsbrJL65cvqC7nJ654KUmP
	npN8/89e96MwZqJPhv9tX3AzKEgGbYhKmexXkhG4r39seWlGDFfOTrtyfnj3YC4B
	WbAq0DdY//I94CsYUXpawV7xoKKXyXCW3nw1GZERMlAnGc4RHw9vEiQ8bult3+qB
	7/LClQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tssc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:03:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so125355405ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567006; x=1776171806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=;
        b=iCz5pe9iLbrG5YtAVN2sTZ7XiukMekq98A+M4TxRugVpnK/rx1ArlvKmJzBeOBqFUA
         +MIBNSMJU8fj9CVyOtKWUceMtereHeP/3Lp2nUoeUZmNSIH7C2SKKK+x1OQEn0dn+ZCF
         9BJo62GOE6Wz1/xiYNy3e38dQc02Rrm/CMwG08TmgDZZiDZl6zHmj7P54DccXP7xqDCA
         GIPlpgArOdLZWiL900kjS2Aojh9fMEjAuhkWMpoVHq9WKQjomZ7mm86a7Q5KbemI082l
         h2NcSJi8YiiJ+UdESNdXPiNsUQitYUj4oPM4vGSTPhyy4EO2I1j03modFBd6A6vJbkY4
         2w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567006; x=1776171806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkmg3F6NSFziMg5x7zcfPohfxWa2M+zq+HuSXMlQHbo=;
        b=Ikqpz+6I/VIIXuVDIBJjo75pCVZP6+upejO32mWa2CjN8TDbrCLNeXAGRCIBbcQsmu
         bHr9i1dM5t5mYQhFiT17TDKB4AanykFjBZ+4KHtZSA9OY41HBh59FHD4/0bEblbgYo7u
         +xoUY1CMPnPojTB3oYJ2XTXZb1MLXYAJq7CeZzheBv+AfMbFuq7vTVUDIkGIOrqx4d7+
         qk4mDW7E1hLddaIDWdTgwFoYXvz1uRdMrbEGlw5W7sKDnkmvxfx7SWZ0r9B7Lz4ZVKDo
         59vrAn0pgEkNXVwrmhoG6oWaqC/w/wefNcf+6G9MUm0IisS0JcV+q0TunFanENHMrFQq
         cWgg==
X-Forwarded-Encrypted: i=1; AJvYcCWu4IS9zi36ViSLja22iXnB8Quizpp9Y627QhXQN+2NobZzDqMhXb9CQfxtRVbmtE2jegwH482V8BNZdvxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuIRZ9dbf2YLB5R9oHmlVWxEid/RQQPNFRrf5XwHpkcYaTEMQK
	oDJwo2t7updQnPs9CMYUO4Rog1jG5B6r8cLnJndGr164tAIKOYu866l05Rpnw75U+UyO0FkKklH
	0yUiZbeXZwKC3w2ByRamrUhQxJfz+aUr6ffyT+Ii6ZPuq+iHaFhHG1XqSPmZkarhqr8+Q
X-Gm-Gg: AeBDievhkyv3+K+DvQutVsqrJyxey6gulKd4zyj3GMhqFDhfCQSFmqosslO8ljkPZUa
	3RtdHpuZFmct0fBajw+TtRNHlFoIlSYCJNelNOqv8DgtvxWFo9RzUHYzS1VLsH7GjvAkb5UXKPy
	If8Ob18QhcehBpdEcXcHMrA6v0FV3je/eO5T+eYTB5EmF9oaSkIDna5a417U1KuhV/AYy9HCYi+
	GQjfuA4f5l9fgCUR8n7+69XftaKuFYhlVBJb97FryZ6ZQYD2waZCFzC+H1Argk1JQAZP9MuGrmc
	QMpXUshvpZemfEHxjk5YUsQoQH6QAUsnxW7LuBMll/TwainNfzZef4JzBdFFUQM6Vj91Dgp0akf
	5PjLwbHJWzgSQZVLfyOIyl1Ar3KUXtLKkAOZbYUYwWQQPYj5/qUWDMIIs
X-Received: by 2002:a17:903:910:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b2818014a4mr185891115ad.31.1775567005727;
        Tue, 07 Apr 2026 06:03:25 -0700 (PDT)
X-Received: by 2002:a17:903:910:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b2818014a4mr185890375ad.31.1775567005020;
        Tue, 07 Apr 2026 06:03:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm181564885ad.53.2026.04.07.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:03:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 18:33:08 +0530
Subject: [PATCH v4 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-d3cold-v4-1-bb171f75b465@oss.qualcomm.com>
References: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
In-Reply-To: <20260407-d3cold-v4-0-bb171f75b465@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775566994; l=5037;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=77/I314LVY80VJYVakANAJH+wffpPLweMyKMYg0Una4=;
 b=r1GJebOmyKQ4qtkufVQselEhGDrMwX8o8kZA/JGziIc9JLDm5oPUn77lbC9tpF24nWy2xQMbi
 0/q3x7aBMOHBF27p39O+NVYefOdrvXo2B2Lt545T5xRzzwSkpKUXMoR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyMSBTYWx0ZWRfX1b+SpEiAGtKg
 o5XY1ITQk0VqvOYVAA/eZTI14lVEOvdMtXsLE1PLlV+l6O04zvmB3dLvlHmwcYW4lI27aDfDyeS
 xJfBWo7H4J/XiBuvIblMPtOfl6Yqt4wRKm8ASEAO/wo7yCmBsbsco9P38+uvzhPIJ4/kMwj5tBL
 E1ggGutcj/xd5gfZrSS+BN/KBNcUdMn55wIkJvQlCeMyYt1DkwhfKzEnGy1/4N7pQ2QdaXuBLgx
 61V9miU8+Ncm+Cn9Zl/xvxyvYobTiayqd03ZWpAH2wNPEN/I7a9xAC2kGODp+L45HiZTaWfbc8I
 odXRJ/oo1jPDSHC3cy1Brsy80GI2FBzlBwuNYY4oacPN772gjzsxeGvponYz1tCRDXlZP/DaNLd
 MtIVHsBAeON0z6+X9S65H5ODXC+HRqfxgAMnti5NahGdUKJJrVZUzQQR/kw2o0c0s/WUYgdecSI
 OJaJ6YTtpIjITb4hzLQ==
X-Proofpoint-ORIG-GUID: I2_64nkfIGgpLoJ9JYlbHsux6yXl8azA
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d5009e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=w2i6tlqj-xX_7Oe5WM0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: I2_64nkfIGgpLoJ9JYlbHsux6yXl8azA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070121
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102161-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61DAD3AECDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a common helper, pci_host_common_d3cold_possible(), to determine
whether PCIe devices under host bridge can safely transition to D3cold.

This helper is intended to be used by PCI host controller drivers to
decide whether they may safely put the host bridge into D3cold based on
the power state and wakeup capabilities of downstream endpoints.

The helper walks all devices on the all bridge buses and only allows
the devices to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. This ensures that we do not power off the host bridge while
any active endpoint still requires the link to remain powered.

For devices that may wake the system, the helper additionally requires
that the device supports PME wake from D3cold (via WAKE#). Devices that
do not have wakeup enabled are not restricted by this check and do not
block the devices under host bridge from entering D3cold.

Devices without a bound driver and with PCI not enabled via sysfs are
treated as inactive and therefore do not prevent the devices under host
bridge from entering D3cold. This allows controllers to power down more
aggressively when there are no actively managed endpoints.

Some devices (e.g. M.2 without auxiliary power) lose PME detection when
main power is removed. Even if such devices advertise PME-from-D3cold
capability, entering D3cold may break wakeup. So, return PME-from-D3cold
capability via an output parameter so PCIe controller drivers can apply
platform-specific handling to preserve wakeup functionality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 63 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 +
 2 files changed, 65 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5ec480fd2a7e50b3af39ef6ac4c8c..34e4c4c1d8c0fdead3e714525a497b722a41392e 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -17,6 +17,9 @@
 
 #include "pci-host-common.h"
 
+#define PCI_HOST_D3COLD_ALLOWED        BIT(0)
+#define PCI_HOST_PME_D3COLD_CAPABLE    BIT(1)
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -106,5 +109,65 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
+{
+	u32 *flags = userdata;
+
+	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
+		return 0;
+
+	if (!pdev->dev.driver && !pci_is_enabled(pdev))
+		return 0;
+
+	if (pdev->current_state != PCI_D3hot)
+		goto exit;
+
+	if (device_may_wakeup(&pdev->dev)) {
+		if (!pci_pme_capable(pdev, PCI_D3cold))
+			goto exit;
+		else
+			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+	}
+
+	return 0;
+
+exit:
+	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
+
+	return -EOPNOTSUPP;
+}
+
+/**
+ * pci_host_common_d3cold_possible - Determine whether the host bridge can transition the
+ *				     devices into D3Cold.
+ *
+ * @bridge: PCI host bridge to check
+ * @pme_capable: Pointer to update if there is any device which is capable of generating
+ *		 PME from D3cold.
+ *
+ * Walk downstream PCIe endpoint devices and determine whether the host bridge
+ * is permitted to transition the devices into D3cold.
+ *
+ * Devices under host bridge can enter D3cold only if all active PCIe endpoints are in
+ * PCI_D3hot and any wakeup-enabled endpoint is capable of generating PME from D3cold.
+ * Inactive endpoints are ignored.
+ *
+ * The @pme_capable output allows PCIe controller drivers to apply
+ * platform-specific handling to preserve wakeup functionality.
+ *
+ * Return: %true if the host bridge may enter D3cold, otherwise %false.
+ */
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable)
+{
+	u32 flags = PCI_HOST_D3COLD_ALLOWED;
+
+	pci_walk_bus(bridge->bus, __pci_host_common_d3cold_possible, &flags);
+
+	*pme_capable = !!(flags & PCI_HOST_PME_D3COLD_CAPABLE);
+
+	return !!(flags & PCI_HOST_D3COLD_ALLOWED);
+}
+EXPORT_SYMBOL_GPL(pci_host_common_d3cold_possible);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..7eb5599b9ce4feb5c8ba2aa1f2e532b0cf3e1c03 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_d3cold_possible(struct pci_host_bridge *bridge, bool *pme_capable);
 #endif

-- 
2.34.1


