Return-Path: <linux-arm-msm+bounces-105121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPmBCQKp8WkAjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:45:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0BF48FEAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D9AD308D948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082AE38E5DE;
	Wed, 29 Apr 2026 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fj8FXeYM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4WVkwT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB834F247
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444962; cv=none; b=r3iE2Z4LY6+8mnjQ+foWA8hgiioZivqCbs+xDGZ6dvIuzieZrc6Fj183OtWshYC3L+A9AMAICeW2DYNrmQgqHT+xGXiZbC22JrYKDB3BJ7itXrNi1sxSpGj4H5rQM53a4jIQgiHk3OYo86SxDofajxtgMj4DaGsRQD4bbclKoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444962; c=relaxed/simple;
	bh=FM8NSfNkcJ+OAXnXrK/t/KiNoyaQ6US4QTFzM89JCZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMAdVJ8V6v0MTdJxyJecfLuJEyAOdubdhkfGfb4J0XvUGAgk1IfAa7KLj7E34VyMsKwn5kAgGvUrafwMMXFVAnjDZdHxk5q0eviFodnmMiBopXqpKZfVCm0T0Gp3dU75AqTXYmGhOljQQvWnMhjwtjv1NHvvOv3WmNGQOtwFC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fj8FXeYM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F4WVkwT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T0o2bN2007701
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=; b=Fj8FXeYM2Cstey0K
	Z3EIT74accNvl+0ym5DPRKWQo+XgSPtmbafml8RbE12SJrdtRQV0KDvjc+XxvJuO
	TfjWMxgsZCyJ/cF8y3+FO1dmjfCkmFAFMaVYewWvX2fl/110Lo3fMa3ynJUuBmzy
	2GYDn8CsMFBLwxpc5I9n4SKpxHmZ9XtMLuV7Ti4qtqGSLmVIutxXmN0LTCLbiZ1m
	Eu2bmXb8zeUkHZuYJDqfEkiz0DLWK65MNx/XpqtkWinPclle9TUMqyIPmXjMMtm/
	S/1UX2kwBBzpfvkqx42vWfPxLQ4BVhFZU7Eq7dpeHrwCxyhFMnjQcZDuiXkjxzyy
	kUZrmQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sx91xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so22528132a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444959; x=1778049759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=;
        b=F4WVkwT5N32lJW9EAMBk1h/bcGHFYRZBDv5/sCdUugOhI5OARiuL5mdUxCcfWqTrPn
         GAB1FUH7cNj1MsCOwjAV4+Sisun32JTMEdpjp7e/NJM8sEIP9bFuhDyy5g2xB3BhU5rQ
         BwRnfinxxUSD1Cs9DHnqNMnEMYbPBvq7FYviaxeqp8SrP7vjd0G5bo68z9LUK6I+S8/Z
         bAEXoavlDSqLJ15DfbPwKC0QixcHdTZyVLe15H+wkxky9FmgI6IbNaSzjZEUdWl0nPXG
         VD0s7u0J/kIjrFbea+vbiUiP0yQvGkh/5lfj3X2IwbQKdsWhuVHPyMOra95B2D+8x0AK
         hTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444959; x=1778049759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fxC/brjZIUFI/5YPDzJNaa3TSXiJM1Iaua5y0Bx3kDA=;
        b=m+LNBxTsqVXMTmkzGHvgSVCBTNfJB0csJ3VuqA1YWI4/4ZIDUDMtyDytvwqO05vIS0
         AacxbTvsAtmkg+ivdDMkFLSz3gvb9kdUSU66KKse5KEZPBJZsNCRgzsBEucMjrgumjId
         fBZF2xEg4nv+caQRr/SJPDfmXzNr/aH+VHxNXFELl3IRsSCJXrABmWDOE+OdsNRQzUlg
         gOBpuKEotWbXupTtbqRVCKqdNMUYv19BwSNtKHVEjBfPa+hx8pTB6GI/+4qEuV/MgUN3
         vP6QCiHvRN9fKJtjHVtCXHeFZpg+TBlCM5mVyqJ1v6MwbTSlC4rp03UINhQaEAr3wgaS
         lEBw==
X-Forwarded-Encrypted: i=1; AFNElJ8S1CvAjb6vwXSLx6bNDu5WAR4FNIxks6YKHtacuG/+vHF928MGosNrdG3ruAH8zxyDEL9OIN+POtSd/Vvl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/j1ZeDW2b8LUXhgXvXqW2XZpwBRuWYJSlsKMJbWfwVcrREyAn
	JQmqaxoeqaQil+Pxv/n5J/JjcKKRfdlk0KCzi9KEmSe2bIyMZtQSY4IwYwP2jVqpqoXwoPQ7eBT
	LGLBPfRrZrcn57rDIvrkXnu+lG3lH84qIyXCqKK53AAYe/RoJ1Rnpsqe1TjAlTgcy+BFsyNsCOE
	sG
X-Gm-Gg: AeBDievtwNyrh3PhfQwIdlPZGe8eL2LfAjsV0/djyEEljqxcbc4vC8ja3qFz7MeVE4A
	0jIjDSKxB/ZUGFUpUaPLks7CQ3PXyFAe+GPgszK/r9d4gaf52ZKCd9PxTMffRovANYy/i3jdu+t
	DBK0ZwQZW441/8mofDA5MLTmcgnGbXVKMVmBB/kpPC7gNqeBoLPe7+d0fpTU/Yi89wfzUeC9j6b
	QunITGbRxTMXkomnnuuny7pIbOURbEN5L5+mo5y/qr2qtbhNHaryUCSuQzhLzpPzDknK6W1hx8v
	0RKXQnWltBwWmx2ROF2hxHkH6kTCmat9/epCxNOYfx3YOq8p3JLm6x6bJjJV08EW2Uv2QtVjV5q
	ympQcIiuCyXav/gLaVmkxwNgelrQdXrc+tKqO0oN2aRcDsHkhl4yC2QoteywarQF4X2s=
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr6831519a91.20.1777444959048;
        Tue, 28 Apr 2026 23:42:39 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:35f:ccf6:69a5 with SMTP id 98e67ed59e1d1-3649205a55emr6831479a91.20.1777444958505;
        Tue, 28 Apr 2026 23:42:38 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:23 +0530
Subject: [PATCH v5 1/5] PCI: host-common: Add helper to determine host
 bridge D3cold eligibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-1-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=5116;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FM8NSfNkcJ+OAXnXrK/t/KiNoyaQ6US4QTFzM89JCZ8=;
 b=K3LQ2ALmkEnry3Jpnx3w+lm/fygqHjFpyXjjyleGf6Vb/X5u5okUeTqsxaRl61VwYCNLUloXU
 eLbSzw5GJe/CPBY5JRnFaa88MzYlPV6NajQg6GWbTCoBPnJmwpMCZva
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: HayLnEjoPV_Ihjnowtla46LMMol1MXWJ
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f1a860 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=w2i6tlqj-xX_7Oe5WM0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX5ITZh13UYCBe
 xgX5zPboGsmR5eZ8KJplmRote2pgo+iOzRGM2K1pyVzLTFeIpCkr8GxhJMQ78AkZopg4ceVdQfj
 DrfZ6T8hIYIi1HKLLICcJOiri180XLYqvv0KaUKXFp/G1V4AIFb1WFcVfEpPY67TMH+kYmpb5tC
 HvZ15q5MIB57UscXED5iYqmCmKcN4QM3W53cc6zNzPTZysYSXCbYsRwiJBGVfyZnQxyjuzcWJvN
 ZYXYA80V2fs12VeGakNmSfP6BPdf+WiEpsKfnhqdFHnWaUDGds2xqwzPRBnlZhxj653fBFISxZO
 hCGIlkl3sMyvTWUb9zE3B9XKBxYa/xY9IOVIHLLHqyTlI77DZE38vkUYfA+jVU3slInT6gRt8Yk
 b2F/wjrkhTU5ubt2DC5FPzuhfXwkhDjKc7V+8uWObwGICdswJI8hZf5d9tAyylNC16jn6lcpk7w
 Q1WzDmRaD3fhWSMgdQg==
X-Proofpoint-ORIG-GUID: HayLnEjoPV_Ihjnowtla46LMMol1MXWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-Rspamd-Queue-Id: BF0BF48FEAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
 drivers/pci/controller/pci-host-common.c | 71 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 +
 2 files changed, 73 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..09432d69175c 100644
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
@@ -106,5 +109,73 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int __pci_host_common_d3cold_possible(struct pci_dev *pdev, void *userdata)
+{
+	u32 *flags = userdata;
+	int type;
+
+	/* Ignore conventional PCI devices */
+	if (!pci_is_pcie(pdev))
+		return 0;
+
+	type = pci_pcie_type(pdev);
+	if (type != PCI_EXP_TYPE_ENDPOINT &&
+	    type != PCI_EXP_TYPE_LEG_END &&
+	    type != PCI_EXP_TYPE_RC_END)
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
index b5075d4bd7eb..7eb5599b9ce4 100644
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


