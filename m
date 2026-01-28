Return-Path: <linux-arm-msm+bounces-90988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJhML+j2eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:45:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA3A0C0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B80A30078B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1785234DCF2;
	Wed, 28 Jan 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOHGwn/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7FiNC1v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7534EF13
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600463; cv=none; b=T8mvXpWN1IKjjIs6y3yW/i92WzhScTN5quARRhKPgSdgLzjhvitsbirgUex8MIKiwIBgPBLAji/apY3PKpeRQHCxRovYsNhIFM6CQNGBsY5e1whS3IuIX3O+nA/UBjyK1qEOsbylFPmbgb0XB2vtpISHn8enNtfFzB89n/5DSm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600463; c=relaxed/simple;
	bh=tgb5v2thYMg2oKua2S+Z2ljwfsLGXMrEPMdeemrkAxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCOxQfP8ytg9R+951gV0TLswgUsGrTI3KDMvgXWUai/8t2oXww6hsf/5nsqzNwSHTO14OdeMhUytsoeuFP3YoUwLJCf271repT/DBYjnWS9TZ8OgRwByyTHmLHySDtBPcZJ2KYhCEkhuujpcnmmOgS3jenGh+/UfmfYfsWjXNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOHGwn/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7FiNC1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927hH3920918
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=; b=DOHGwn/QFPjMk8jU
	hF87pbT0p0Ex16Zw2Pj/EjDdjcHyhS88mh6mjz6Hpk/fyp/3MEyrGTSKvoYy6Rdg
	+5ezjOCItb1se5vIBbIunc0oQxPfSVluS3NP7fpofgwciBZHFp6+cRI7cbNUXFSw
	f9lYiqP/s3fbLbM892BaTnfxsE0aS7D17A7QSTM+E0wKS1yogS/xyBBaC9FsiVXp
	k1U0W173Dgrf1WLCPeiN8lmO+aJkzojt6AJnJPprS7hEWfszSDyp5qftkk3rZzu9
	JQ1pePUFBuHKQ7m7pLmkEFyLKnvSKRbvKI1Umo5998eHFo3pz5XLdl8tQ2AFw6lI
	EaxLEQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211b5ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:41:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a871c32cdbso19721965ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600460; x=1770205260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=;
        b=j7FiNC1vKTI+K+hB43UuwiY8sazbOIDv9tFz1u5csP/xTho+hNf21suEcPR8eHDdbj
         fYCIFuqpOPbbKGTaLD1Bc/NGBskKF8yQriLux5PtrJK5nR50jzylZ2rk/eYDYDeV0AXX
         aB3RgMHtdOn6Ccg4cvNymmEqh2fuh4Pmdd/cRahLNn3YiKl9pmT83vLc8OGnyfUJ07OC
         jbYpFxMGvZwn80q9RSMrGQG8KXTuUc3X8RQtGHYMSRCf9xhDRLHrZJ563yanjGNr6ulV
         UA2GVfsBo4TOEjud3lkEzbOj7zgc0+3siuzzUXpWrDB4lNH3cdvbRZmKuiEL5nLux2WF
         Aovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600460; x=1770205260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urO8LEJ+6lWbFda5otpiYQIaXeiVcmn7HEJcXHUHVl8=;
        b=SHVElEVRLl5FKLzZ9MyHg5O45E4VqY4uHnC6Ut+cQaJ9CAFBPf8CH8cEmG2/T5paJ+
         baSnOaQI/tgSRQ/AMTtXcLxeKTHPVKmhUWR/lFzvK57CYe8Gau9NL+WHQ55G7XNhbyh9
         d8FqB/0g6EAUuXEHR2TYbUOUlxiAtPGbQpuZzrdA4YEtYRuUopGZXZlkzpYnil4aaMTo
         k/mflCw5ZuiLtoX0qp6vTd9KQDxp0+PJB3pcg/yVLqMS2JPIYEsibX4itDaEaBn4LMLp
         RL0jJaqXdn3eV+AhlSpNJW5b03cCBGN4LjlN33Kw2MTfek2sVbOcercrXHxutSFgqoBs
         fkWg==
X-Forwarded-Encrypted: i=1; AJvYcCUGUGp7nUnaDgJhk4fmdla4nAT58+Be1D6W1zN/QVRUOawZcy1IwX5Uoan/8jggAnjxyt5bZTmcM4hVvoc6@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/zL4lAqXJP4UU7hx84c7rGjpkCx4KS/oiVLvk5C22OxTFG1/
	KBiWfnPextP9bJ0oNZJx35OKjDN1mO0tUSGWji8pCwoDV+7k/Bl1Z4MbFcOFMwFQkbPmtzfn1ox
	GyMOfgyX+mJpMxGP6Rwd7Wx7S9nYeyGZDnLAEoMVsdQlhsJwZ/21Lh2ya1We8HbaXZH2y
X-Gm-Gg: AZuq6aLMgdRgflTh93OVZO6o9hSMTEg78joq3cnPiX1D/HliQmGduPgXZdhRm62qmX9
	iSihmTMzOkB6b5fFVH243fmsEcIwoqEbSKcw2c4oWezlqDhEu9V1kWj9d4Ge87nzYSHapqqkbWh
	j7QdXwoLFgaoyL+AoJOhAVwJ7pYslAICSZd/hW8wS9vcbVjf7204PUDRn7+oNlKU+3J/KbiJd3n
	dWyWTCbFtV+ogq1KmHUuNQXNEkElACU5Xsn7TbZ1LcBG9y1GADA8FNEx0CLpphSZPCRK16Wh/1p
	bzhMUpmFG56x6tjW7o7XNH+ydxsTXmQCF4bVTMbWZTSKOZQG4Dn0Fo9Z/wLPGFJ0DfKWgrxaysH
	HSqOtut1GBjS4h9mCqSYMeDl6+2o6rqBZM6c5xO7DUgWM
X-Received: by 2002:a05:6a21:3994:b0:366:58cc:b74b with SMTP id adf61e73a8af0-38ec62dddedmr4815188637.21.1769600460177;
        Wed, 28 Jan 2026 03:41:00 -0800 (PST)
X-Received: by 2002:a05:6a21:3994:b0:366:58cc:b74b with SMTP id adf61e73a8af0-38ec62dddedmr4815164637.21.1769600459666;
        Wed, 28 Jan 2026 03:40:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:40:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:42 +0530
Subject: [PATCH 2/3] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-2-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=2261;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tgb5v2thYMg2oKua2S+Z2ljwfsLGXMrEPMdeemrkAxE=;
 b=vnbzCXVVkARXQGBcFxA9YhFcF0xIISi15hXTOsChmfp1rgaf88nf8kLbtDSsQsqbUBHTo201x
 MAszfW1+cyUDccRfVH8MOg3PN4VstoHYLuv5Esd/MVjjNqy2Eo6ZwoW
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfXzyMd55RXXRKf
 aD8TJnllcOQPmx2haDjR7d1FsMJ0v1iuBxZ756dHlXBgelMS/5oxj70lAYd6GkbxCSo9U8+Vm3/
 SwRTSkMqwpWrzlddHDwAWqijjnhK0TZEdLYpfIWZHvGXBmNHaQ9W8laVdp0yHQRlttEkoGwQPN/
 tHtK8UKXcslJ/b/v6Y50n3nLp4h1hiOZ+pGPlGlt5kKqtK0xbSl1Y6Y1B8jfAzdRhgOg5E60Nug
 /jec7h/LnUlfBa9nGX70T+VthnJv3tPSjt18uAiH3mjRTwuQp1ufgPDmMJuFPywgWn3qnguSVSk
 /e3VThLS3HFNwSTFzhqSirlMX8DQ9UXHoSM7nO3HilFZVvOC4BhRLWUW7OPUZsAqm5tyKQcDnKl
 QgjU8NxBAB0aFcYduqR1RzikTcL58fXPuLfA6fRiP+uJcr6e5NbA2DBgLXoRVCvlAbQMByOx5WE
 lpPbSdEYdmRbaCNHvIg==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979f5cc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S6-w4pPrR9TiqxbCLhkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: MJ8tfKR5gHg9D7ktU-Xhi0DntBzNM4Pm
X-Proofpoint-ORIG-GUID: MJ8tfKR5gHg9D7ktU-Xhi0DntBzNM4Pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78FA3A0C0A
X-Rspamd-Action: no action

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the host bridge may
enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_can_enter_d3cold() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 7 +------
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 372207c33a857b4c98572bb1e9b61fa0080bc871..2c8056761addf7febc1b0e06ddf8ba4dd4ad1684 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1157,15 +1157,10 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
 	int ret;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_can_enter_d3cold(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 31685951a080456b8834aab2bf79a36c78f46639..18d8f7d5d23088b2fa177e84a21d900c98850fcd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -26,6 +26,7 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+#include "../pci-host-common.h"
 #include "../../pci.h"
 
 /* DWC PCIe IP-core versions (native support since v4.70a) */

-- 
2.34.1


