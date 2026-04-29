Return-Path: <linux-arm-msm+bounces-105124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIx8DGyp8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:47:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAFF48FF2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A83EE30ADF7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8611538E5ED;
	Wed, 29 Apr 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOIJzAjH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uyz2fRGj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B238E5FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444976; cv=none; b=mGNLnEie9/Dhs+U0x/w2IfQ5HU3b6VpK3v9jCBvczGr/fBQvml1cqTi31tugZR+kiI3iO5MFzvbJOTTyuGdX72qtxbEnUAxzrvolGsW5SpE1U4M863wrJLdO48eSbcv8N5kGcqiKuJGtEeiAenvA+4okOM+SWo1tVF32xnpB6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444976; c=relaxed/simple;
	bh=5PQqOmdR5OOC75CCpY/aytMD49zycczPJnqwX7jwyag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYCTPHNnd391YEt7DoAlh28veZJCzprn1euBbUwAvYgwIWozxNbiUOLN+7puimygqVZDTb9FG04tQ7Tn0uJaw1vq8AG95pGKaoVw0WS5R4235jb1aidd/vPAPQAmO9+wo51l1kLecgNkt71NtbvuGMcZDQptOqcKa1dpdxZYKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOIJzAjH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uyz2fRGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T35toe831369
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=; b=ZOIJzAjHV124E0r8
	vvAd0/8TOxAb3YmeRSYjmBBYHwmr1tdXxZ+6rSHSwilKkIEoZtCYY1ogZsZ3+Q+g
	rak7iJtYKV+/1AIigcUTM/mKoZ4Li8O0hHA1n6978Uz/FAFBm7I8EBvmIYSf9i5K
	s3YfaAUupwv/NSIT76p+I8o0yZKugbp3YmssvFXrntMXi3k0EIg0MCjXRWQD+UEm
	wkKcLgzalGOT9wYjBOtgJPyZ7mQdNFZ60HLkUU3GgNRdvbkJiXO8F9FBoBh/kK8D
	mgoSGkJosl1ybkhlClK20VhOr1r64GNyLEWisjKAi21ykoKRmA8RhRqX4aefH7hF
	/bzGMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqaf09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:42:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso609187a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444973; x=1778049773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=;
        b=Uyz2fRGjXhjvhImqE7mEOcugjr2v+a5XwY0+tSoR9vwJLKCO6wPEPtiox7CpHyyqey
         iAALG2HkRZW/p1s9DL1RzcvtklcUyiBTS6QhbAYPfFVh5Rj6cj6PO4lmUwlAl1yNI06j
         D6YbtCtWC4xNsg0CkkPxpf9EsWVAguuEbltz40+T780vUd9AKaNHzivSMUdkNYZQBWB/
         gUEdx1Bh7ydv0HMit3meOhIFM2SSbl725PjsHK9dbl3lVLI+aIfaixDabJyFUIbha8AS
         psMgwGpDY15du3/wKPK6ypEM9I5Zpm9PUo0kECBLlx2Jk3jizkkLpk743DLWU6K2/WGJ
         rBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444973; x=1778049773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uc8OuLvzX9XXCrHmGKnrAwRgIvxvQIURsHPQUJfLOwM=;
        b=Z/0nKQdEqqGD86PD6oWmyB7gAamKPBPEnwnD+lTWwm6+HcA0R8VWUTTjTYSC8Yerhi
         aq2Oa4wtOa7PIQRGLUjXF1smWTTAP2GActx6AbI3ShSVTcTwvzAIzlWJ7ap0vdNSvX8g
         vnUtltBdc42wUcA3Vc3M16fdPpb8g9dD8/pkpTXjGkzXXE5TFp7cfIFhmQVLx+tvlP+M
         6HE1PeSWZImBJB2MX+q5emSZZKE95cK035lp/W1IdGjmvyi2eoJHRYwqWS6fikEhadre
         /dn4gczRhubkYCy1RD9ablT/uw/jzU1/uL4sHEoF1GaqPKnqhAAYimUkc+4BMD3boyIq
         XryQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WH0FYT9pQI49vi8FgkWY+ljyYatVBYjTSqYaOIz25OstVGOuyQ8y+A9Omsum1GLyx4/JLSC4MzG7XbAbq@vger.kernel.org
X-Gm-Message-State: AOJu0YwNRmey1+oFUWo1q2PKsS8Qk0bsnzRpq/IbDFSd1aXVPfzrOQvl
	RjtDsJNvYwsT99E6hswYqT8h+k42dJ8zdaweZLRHxn9iviC2XD6BWd4xoZdwcP6w3y3l9v2sXDJ
	rN+06Gm+0Pt/xGJfAFDt6TCra2RQNK4x5e7YYWJwYsUBNORiuyDdC+rg4Z5jxWNZ3SvD4hc5kw5
	Dz
X-Gm-Gg: AeBDievXOHPXJSse7yJmhf3vD6/1kyQegwi1FacxTKyG1tjw+/lrOYTz2cV+TXQgO4U
	HiDpb9FXB61CEHqs9DzuKjaQ/jKItPu0puC6GR6iXZAbA/bUVNPuek9wCNFvqPcSYL8rgRjA5Za
	AauZgo9eWx/oI59N36FwL/5e2CbawqUIkDXROPjDJNvsF4OCKy7LTxfA2NzAIey/RMAwGgN4nSJ
	VV1k/EzkyqfSfAER4os20lvy46xzYl27FnXm5nPHGAIqlpj9qO+qQTHmjLB2dczb27xEhBzBibk
	GTM4XY1n9/zYTuka7mjmn0xjlhIgkcY8hDDlapu3XXogkZyEAiWmMk1Zbm4VgmMXP+rvFRLqRI0
	MrCDDVk3TQsL4o2j0itfG+THi11kSTw25ez5hUP9xikfkqVABsDbAeWKvO8GwldH/xVE=
X-Received: by 2002:a17:90b:2d0e:b0:35c:10e8:1a72 with SMTP id 98e67ed59e1d1-364a1e91ad1mr2070794a91.7.1777444973106;
        Tue, 28 Apr 2026 23:42:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0e:b0:35c:10e8:1a72 with SMTP id 98e67ed59e1d1-364a1e91ad1mr2070761a91.7.1777444972599;
        Tue, 28 Apr 2026 23:42:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303d59sm2021414a91.15.2026.04.28.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:42:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:12:26 +0530
Subject: [PATCH v5 4/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-d3cold-v5-4-89e9735b9df6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444949; l=3749;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5PQqOmdR5OOC75CCpY/aytMD49zycczPJnqwX7jwyag=;
 b=w+R58IbthfJ5zUxuVUnEnIOCN/KuwhYjhFN9dhYCENxXhUC/7WxDiftz3Zj1nuozc4k/w19wj
 NaeGrMJzDtkC/fvBKOymfM2HEcyFt57ItD5WSujJebuWSV9kTuvBwYA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: L2jnOnOSqejLDkNyIZRwf7BG9GHL5HYM
X-Proofpoint-ORIG-GUID: L2jnOnOSqejLDkNyIZRwf7BG9GHL5HYM
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f1a86e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h5qRVDGUHOPEFS6InpEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX940dGTuPaKAe
 ZgBLpf17CmtOqaM5C2H68UsaemblmmMxSI7TrIcDKubJZromwNlR095eR/cwQcqY+mml9ERSUg9
 rMN3ANNsIsNqtz7vjKpVe2W2mtgjZ6G+mq6eBuLwyCgypM4gABfGdzpK0Gjnt9vglgu/NBXJFxl
 cUG060cmQvl+UJQNXIcit0nb4Una1FXOxTGofqemp/yNWwwLgduq2q5/L946ilgmJq1qjJrT2ZN
 PKCKyZncUK5s6fcZouL7qyrN6U8k3fW/uuzxLVOSzUUEJgfvZ/gYxe9a9ucNNgO9JzII6P+2yJC
 5c4SIjrN1q/myzmEIWaIi7PeYfOEbsx1cMDQwwWf8BIxCmUWu+snE4weIj/55t+bzEeWRs0Od9B
 +v4IeQtMEungaDW16VkLZ9unbClI+6quClU5aPSYe+p1IaEVloGADwOq09U1cpqPWqwqMWy9g0B
 aybc73OAuVHZe0vCTGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290064
X-Rspamd-Queue-Id: ABAFF48FF2D
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
	TAGGED_FROM(0.00)[bounces-105124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the devices under host
bridge may enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_d3cold_possible() helper to decide whether the
devices under host bridge can safely transition to D3cold.

In addition, propagate PME-from-D3cold capability information from the
helper and record it in skip_pwrctrl_off. Some devices (e.g. M.2 cards
without auxiliary power) may lose PME detection when main power is
removed, even if they advertise PME-from-D3cold support. This allows
controller power-off to be skipped when required to preserve wakeup
functionality.

Update the suspended flag in dw_pcie_resume_noirq() only after the PCIe
link resumes successfully, to avoid marking the controller active when
link resume fails.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 15 +++++++--------
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index c9517a348836..9e409a1909e6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -16,9 +16,11 @@
 #include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/platform_device.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 #include "pcie-designware.h"
 
@@ -1218,18 +1220,14 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	bool pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
@@ -1273,6 +1271,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	udelay(1);
 
 stop_link:
+	pci->pp.skip_pwrctrl_off = pme_capable;
 	dw_pcie_stop_link(pci);
 	if (pci->pp.ops->deinit)
 		pci->pp.ops->deinit(&pci->pp);
@@ -1290,8 +1289,6 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (!pci->suspended)
 		return 0;
 
-	pci->suspended = false;
-
 	if (pci->pp.ops->init) {
 		ret = pci->pp.ops->init(&pci->pp);
 		if (ret) {
@@ -1313,6 +1310,8 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (pci->pp.ops->post_init)
 		pci->pp.ops->post_init(&pci->pp);
 
+	pci->suspended = false;
+
 	return 0;
 
 err_stop_link:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3e69ef60165b..e759c5c7257e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -450,6 +450,7 @@ struct dw_pcie_rp {
 	bool			ecam_enabled;
 	bool			native_ecam;
 	bool                    skip_l23_ready;
+	bool			skip_pwrctrl_off;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1


