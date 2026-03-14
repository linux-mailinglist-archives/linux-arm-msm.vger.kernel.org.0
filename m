Return-Path: <linux-arm-msm+bounces-97660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LiwImnAtGl9sgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:56:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7AD28B4FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D3130B983F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2542E1722;
	Sat, 14 Mar 2026 01:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ll7I4FF9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVPTWV4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2E299927
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773453404; cv=none; b=KJVPDG03sMlPUf9SqQ7u3tmUg/1cQKqhhhwu883HQERjIL0BLDGqd7MN94IvVjvGHay2YTbKrjXk4BuOj3eIVbRCSJwiWq+LBeTw012rbIS0GGOyH/JgU3yTmJlXJg/STgNzH9GUTUXJ9TDASZfxxUDN3wNBBXBpBpbBiHnptiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773453404; c=relaxed/simple;
	bh=2ScFGPmYmss06z8sOf5Eks7Ar9nunEiSn3exz7e1f8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hc+sD6CRP588IMNx5gVzF4csy1VVlfFZD42xgpZNfH+JnrNQqyoc2DKczUyT0wiZPRqyGw1l6qeKii+c1TS3J8OakW8jXMYAEs2aBkmgJm/Xf+4JmnPlImK/VIs9S5lZkwruqgruBHAVGJmo9B0tbZ34kd1XceKjPMmvSCiEOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ll7I4FF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVPTWV4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E0KQq42108770
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vFM6F45qzNjkngt1OTK4+Y
	gAMOwKlmATWIoBHfjRvCg=; b=ll7I4FF9OwK+i/k7K8mFzz1bQbqZuTCVn6QbNp
	FTwyd3tNu7BmzGSjGK6zjyj5LYA0bElhJLAusF36Wx9PBl/BM6BRnxdzYtbR5m+u
	2qoFhyg678gjIKNkFgWc7VKrKKiBouFFL7gVfAcH6FyWUVwIcCk1OnrGf+zhf6fX
	NIusYVgNXXA8yQOaexGAw78MmaDhxI6Ku9zMTNGkJ3NzqIidCDrcU2EbdNkM9ypP
	/dtxRyvE/2z8GRtzhaudAOlWYuxrW77/R9gAxYiXlOY67xXsDLBwM5SfHg/t9V0l
	TWL8hXO06CtcxBhdHkXDbNmnUgIvxDa1dDIBEnF+RBCsLccw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvw1p85rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:56:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae3badc00dso32793395ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773453401; x=1774058201; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFM6F45qzNjkngt1OTK4+YgAMOwKlmATWIoBHfjRvCg=;
        b=cVPTWV4kqqq/3jHzJhHW8iWk7UyUJwySgJbZZOm0XOZKiYexX1yYCOpik+vbpWPwlU
         WvtqUdmASMa1p+PsGPjqLE+M5x9lfB43vqgPOwUJCFURN+w5+8FNpUyTsrhiYjjcB7y3
         UevteZW8/r/8/kDym4eOmNNTAyLdEJQ8t/PsgBsxhjjuk6F5wxQzpYGs7zKc4Otoa3n2
         3+PQ1FeSagPkOdaUsQUrveIJix9hexOT/ZJpLfRd9aHaXUdPTKrNohKyUdxm/Zh8m5MR
         QhtYJLxONoDMTJDyXxGgEUSdjCyOgzxtoIWnXk+9viVuQd4AfFxJSMLgTI2gqje6Fk82
         AOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773453401; x=1774058201;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFM6F45qzNjkngt1OTK4+YgAMOwKlmATWIoBHfjRvCg=;
        b=OP5oBFjPy1QIIc/LuP0qCIc5LtIrGkBGlGxyR6iN8Ufk8S2WTZT1LWQTTwgzdTWcWL
         iiDioo2pZA1JeBUXjMteOJJUf62tDtEQ/ZhECm6AcoJeNSGdAa3WwOOy3+wTRDXUnM4G
         uxIy+ae3XT/xOsJd0pR3QTCYxYoQSK+WCr1MvhJnnz5hilsrhT9htR9MCSilZgz5Td8E
         DDGEETFt/LBbxGpbdPF3xLzcOj5ni/OB9bm/wIAeJztvgzPhj4Lr4MSIDBHytwxGDOrg
         wa7uTbnTt06l/U0aY/Y4ciqNjUC724c/tLrWnacyZJvHIVMY5inncibAvF5XpDg+gvwt
         7nvQ==
X-Gm-Message-State: AOJu0Yzl7oAy0nSxhRtT1dT+SAuT+GaW39isfVjB4Ak0LGJVrAQfZgZm
	UnHhkyyqFWBV0o3dPMX2rYqTuKigaVO/hzqnUJoKqAgzCwE5kM4Qm+rgm9txGygPJ9CBuyxATXx
	MBq/m/cI9uh7dZclQC1sGaXc484cs2SRYH3C9WF8WrgM79LdzLCRfiXTJeESdiJuMPJ8g9i3t/h
	oO
X-Gm-Gg: ATEYQzyfEx2GhVA92D4WoQNov5NiU4IukcboMcHzokADkyv9GmpQZp7ffGTbuAiRcjz
	m5/CegF1V83x0yAaNQ/TZbHs6sCkKIi1laOoymC76a8hZc51w8R49ArlRarvIyurVHahc4sqp2L
	7QRmK8fT25m3fVsnqsMFvFpu5HliPsvXiThXXPnY3VEbbvufNR9FReuYZRWMcJoOreibjDDzKE7
	Yi8P3CPT8OqVYJdpocwKGliHtsqVKN69E9ETLD2FYBK+pvuUpO+H5wn5dide2giqSaUwgGPtt1K
	ZLN1UDmfdoY7YoD+isCOzCTb/O6eU6EF8Mz5z3V7vS+mr+MDQtDcNv/ks3S45gNQdF06ZtRjsbR
	ovX7jU58hV3/+YKctQCll8OTJnu9483ECWupQhus+WKI7kRDIbUOPqN+P
X-Received: by 2002:a17:903:8c3:b0:2ae:5eab:1338 with SMTP id d9443c01a7336-2aeca92df9amr47754095ad.8.1773453401463;
        Fri, 13 Mar 2026 18:56:41 -0700 (PDT)
X-Received: by 2002:a17:903:8c3:b0:2ae:5eab:1338 with SMTP id d9443c01a7336-2aeca92df9amr47753865ad.8.1773453400950;
        Fri, 13 Mar 2026 18:56:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c23esm46732815ad.1.2026.03.13.18.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:56:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 07:26:34 +0530
Subject: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFHAtGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nj3Yz8koKc0nRdk2QjSzNTS9Mk0yQLJaDqgqLUtMwKsEnRsbW1ABS
 8PyhZAAAA
X-Change-ID: 20260313-hotplug-4c296595b5b8
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773453397; l=1869;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2ScFGPmYmss06z8sOf5Eks7Ar9nunEiSn3exz7e1f8g=;
 b=bjj9xZTttgB+qK7+ccnya3jBVKEd1or4JbvtK0XASfDv4TjTu8tQ1QCfQtk3+lmrcFlp0ZLvW
 kbvyTSD63XiBGETQEKQEaLjd293NJV2dQ4MkgIJItGiJs8m5nkD5DDg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: tDe-Bk8s_5UiUzzGljThEE4TEPci2Zfb
X-Proofpoint-ORIG-GUID: tDe-Bk8s_5UiUzzGljThEE4TEPci2Zfb
X-Authority-Analysis: v=2.4 cv=auK/yCZV c=1 sm=1 tr=0 ts=69b4c05a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yYIiXX6wkvhfn-NU2jAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAxMyBTYWx0ZWRfX675sK+ghthC2
 ONcU/YjejilPq+hKV1+EX4HisttcDNyZXFiqckj9lV6ZUB0nFnxfdqADuGBRr7xSoxChVxp+6w5
 TxrnS9IGmLH9Ygc4uoocc5OgiAckTMrS2c751Gfxnjyp+ltUtYXSkfNuPQbEa7mpd3dNqFi4J7T
 zT+XwR3KXgAhwPna+fMc2eIz25oEJhWY/MEA8Jc5qA+8HGqmlVN4BmnR2+FYAlHpeNlKEtpHrc9
 OlB51xmuh5wmnNdhG1EEcJprkpZG1EYtF/sRkveZZgyjNp7LOrBnVAkdbpNlaHLCdQT/tJLq9u8
 A4QAXqV04HnTck+TpmCJLc8tEVr8POXHFUMzkbe9UNi6YVIzWLyxg3P5lht+BJcKqyiS+0EfnyZ
 AXPZ/7sLqA+hsTA7mfOjbXFSSzQ+Jj3WyGkYWRYvt+HpLzg4aiEuGlPXYC9qn3iNV+o5iW8J9zW
 DRouchxeUaEJgVppi+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97660-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB7AD28B4FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QCOM PCIe controller advertise hotplug capability in hardware but do not
support hotplug command completion. As a result, the PCI core registers
the pciehp service and issues hotplug commands that never gets completions,
leading to repeated timeout warnings and multi-second delays during boot
and suspend/resume.

Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
Capability bit entirely, which also disabled all hotplug functionality.

Instead of disabling hotplug, mark these controllers as not supporting
command completion by setting the No Command Completed Support (NCCS) bit
in the Slot Capabilities register. This prevents the PCI hotplug driver
from waiting for commands completion while still allowing hotplug-related
functionality such as Data Link Layer state change events.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_en(pci);
 
 	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
-	val &= ~PCI_EXP_SLTCAP_HPC;
+	val |= PCI_EXP_SLTCAP_NCCS;
 	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);

---
base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
change-id: 20260313-hotplug-4c296595b5b8

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


