Return-Path: <linux-arm-msm+bounces-96943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKAqGbRDsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:28:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F7262263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 528703072BFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296603CBE88;
	Wed, 11 Mar 2026 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWpqu4qp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO4jYbJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E483CCFC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224827; cv=none; b=ccVWcB2v/9ETSik5eiq8hnbi4fSRYZjYxdxp49fmpq4dQJwU+QnDAjF1IljY9U87gnqDw2pQhz6PjvraIEayywDLXVEH8ei+dl/b9Im+15fsMezP9BUlgp0XM3y7rzMRPnkT1gdONkS3Boq7Ds2NZzNTIfA/ga1y/IQkc66OnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224827; c=relaxed/simple;
	bh=fy3UTBHOugmoB20oZcj6up7VhBsfAepWi8HvjyVSVZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tv15mgRGSEQc+R3AGBhiczqZ+yZBSzkKe/BOC2VtMeJgq0J9jmJaPes7ZC9xJWEcH1nkG6nl00ppd8LrpZJZ5nvHvESnOe2bRcJFP9wO6AyeZG5t6mDiKAYmwKR1vRDRix6pw9HmnZ8L/sOADPXUBUE1C8++0Symh0kxeASGn5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWpqu4qp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO4jYbJl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5ZXV294236
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=; b=NWpqu4qpYeNdEAU2
	Zw3gI9JLNRKEHETOmCIBhcuoVhKMbGKAWXNtnSWM0OxhA88q3ej//Uh4Ta5BTV4/
	bUy4E6SFuSoX9839JDh4zR/WIN4gEgGhML3vvEZowhHQpncaGfcBByAZG7tUvbr4
	WGJmCnImw+ufB38vvsHNde9b3AVFOwwzu5/ML6N68HBmWfOooBt1z324dsLOMe2t
	sM7yioQTjr9B9dINgnlOLlp3AtdvjDx53wU/TyPiWyoMIU48pbtg/UkyfynHP6rB
	ANJKJ+VmF48zI+EwqfzTYb5xzyrzKaFNDJCysN2Ya1n6wl/EVv2hPQhnLLLomag1
	H0rR3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb82mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4e9577ceso528964155ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224824; x=1773829624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=;
        b=YO4jYbJlgRScY+II7qkZ9IiTJcACzFK3zQrXN7zS5EFSGD87c3q2Cq6GOL7EVNGz4G
         hqZXiVs2T95cTZa0Xhj4wSwED2Yqtj9AEi3joKU2GHO9nG50LOflWmDKl01V7lPtFo7c
         2nkQJbPb2q0RuSebu9f3PIDabPFSIMUZrLQWIBPL/FObOY7+B5wLYRKZrAiJQRBpUBMw
         3FDCmL0zo17BJya4UJ0kalJW1Vef3DwSWNfz7rDSO3J6n0/v2uVnSJ4SHI62WuCSSqrF
         yGpuiNogEFZ8UsQb7yFS00I2MorDWzT9wvKu6gRrwim1VA3kZWuAfKcBsTrIjDtvXxj+
         0C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224824; x=1773829624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3HW+aNY3GxegGpMcu6PaLCejcYO8z8KGXcALkhoF/nA=;
        b=RV66puvHz0tgzduWNCXyX+Ku5ZbG8UvGGg3XtmRAdjFm21nwuRhaRrO6RYjiCIecgF
         ig8ovL4eekGdy69ddrIyBygfyGg+/e+7LobDeeBipiVgOqsOrgeTj71SKAFf/zkeEmt6
         IOO1p7mZXRRdD78yOhIytn9NdUZxf2uVoSbYybUqo6XD+Rn8zOTPmqUXIuY1ILLgnznL
         vIOTPco+XP1CIWBn4YqS/nfkkdpaX4chbHchAYDOMh8nw2yR4tP+Se/RVUwHR0mRCil0
         aKpzIbfE8bQtfZinB4r7QYAr60xUryDDqEUWP29ULcEvVdYOcFkKWIPcul+4X4vPSPUo
         93pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPYUMhvmz3OEim9Lc9DS0YyWDT474fU2StZer/uldk7VPFuXQTzOy8vNpxgJi2EVQg4T3GjuKAt7WqRbjn@vger.kernel.org
X-Gm-Message-State: AOJu0YxgyzjWXly47i1GfPJuBmHSj6ZgiaW6rUZ53XUnDE2iTQOE1gOu
	QHANfitxpUiIaN7ySqzqPctcLMeZmUh82bQrRuVBxh6pmndAeJUcPo4nWRBSFr2C9v+WLANM9rq
	f1CrZzxT0R0TkFkwwSca2cpoyJT6b4txGIp7PGxUgX2YZ3eTug/HS2jASrv1d8Cz5MJDQ
X-Gm-Gg: ATEYQzzgPfDFnJ7D/Bk7G+ppjeExLkEsaNNTQO7udLguqd5Jd/NTg7qnqTAHM/UEctJ
	pXSk1ohjl4WDNl4EpjHUDO1ec1o1Ncd2i4aNudd/McNDy5k19+BX2Auv0qV+GsOzlkbB2zV32Oi
	nqV7Rc6qumW96Xb/NgG/hjcWyZfAC53CxYCBYr/J99bQ92ajOB4nXiSiQ3t8bUA3cOehZ62Qk6T
	/lBDSIUjNMpsg7DeTSMRnyowscd4nsG4CEg8QpSNF31ehEqKRx25YoJLhgjgpgLvgk0YgWJ3O8w
	atiZFq0CmZFqM79mSOqmJt910kul3+w/nnd6BdBZeBHzguo0KgVqqXiGEax2rwqII7L+7mEU1zm
	5W7c+Lg4+zXuixzUMCsM9myh4e4L7D76AzUiiKej3z1pgbozbtYINp6Tf
X-Received: by 2002:a17:903:1a44:b0:2ae:5c3d:b07d with SMTP id d9443c01a7336-2aeae92201emr21189655ad.57.1773224824339;
        Wed, 11 Mar 2026 03:27:04 -0700 (PDT)
X-Received: by 2002:a17:903:1a44:b0:2ae:5c3d:b07d with SMTP id d9443c01a7336-2aeae92201emr21189435ad.57.1773224823861;
        Wed, 11 Mar 2026 03:27:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:47 +0530
Subject: [PATCH v3 2/5] PCI: dwc: Use common D3cold eligibility helper in
 suspend path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-2-4d85dc7c2695@oss.qualcomm.com>
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=2039;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=fy3UTBHOugmoB20oZcj6up7VhBsfAepWi8HvjyVSVZA=;
 b=X9FyPw8OeaPRkbA/4PgAqOrpJ3qLGGhtZbOFwSw2LAoBmZPgdHkRAjhXRnMO5NP+6NqQGzOj8
 tWPIdnBqR/FBxj4CKR+EFFQiJMwA06TT1HHCWG4Qqad+24waSRSQhTl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Hl1rV_FblXrZDKAa6MDdIOTDSmgBcXGq
X-Proofpoint-GUID: Hl1rV_FblXrZDKAa6MDdIOTDSmgBcXGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX310PgUVGIZjZ
 69p3UwAKEZ2MmIKjPWDWN4Ze9Q4CPdO+f8egyfjrEGlrDhMPQEzLHDdmGJ7R9tno3obVNDcKB87
 1xmsAAsYceJ9cUlMnMCsJTVOHma1U/bBzCL7qp0bPW5X3oIGri1PgmhYcRbalqFz54kmQ6lBHKc
 K1sfd06LibqLR8b/rbkVuGc7E8s3v3tDCnrjKK3ssXh03BED0vRCchpxC/Sn3wRvO+7VrMwdVie
 r44HdalFHx6xLcEWsv9gaemSHyj7VMFzslkxx45rOA3xPTpowx9r6C0ueWliQIzpuLU4i/Db4AD
 yvpl64mT8gbrERaC4lhlfpIIiv1i0IpBEM1+IDmquKRazKUb0w7F6xyxhL2JB2O6iWKBBdyfktv
 L5qq+5qBYaG+dEDa1FFy1NloJXIcQubmTYvhVypUiR5GtC1VZlR+0Ogp2rFiBFnHfYk/eM9aJ4V
 TNCI0KvR/MlZp+Zf4rQ==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b14378 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ir7Wv4stjHWE4dv3774A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-Rspamd-Queue-Id: D74F7262263
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96943-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Action: no action

Previously, the driver skipped putting the link into L2/device state in
D3cold whenever L1 ASPM was enabled, since some devices (e.g. NVMe) expect
low resume latency and may not tolerate deeper power states. However, such
devices typically remain in D0 and are already covered by the new helper's
requirement that all endpoints be in D3hot before the host bridge may
enter D3cold.

So, replace the local L1/L1SS-based check in dw_pcie_suspend_noirq() with
the shared pci_host_common_d3cold_possible() helper to decide whether the
DesignWare host bridge can safely transition to D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6ae6189e9b8a9021c99ece17504834650debd86b..8e81f0208c76fb22aa908de4e1ff379ec0cae2ff 100644
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
 
@@ -1218,18 +1220,13 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 
 int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	/*
-	 * If L1SS is supported, then do not put the link into L2 as some
-	 * devices such as NVMe expect low resume latency.
-	 */
-	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
+	if (!pci_host_common_d3cold_possible(pci->pp.bridge))
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {

-- 
2.34.1


