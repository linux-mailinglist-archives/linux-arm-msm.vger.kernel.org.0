Return-Path: <linux-arm-msm+bounces-106620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC2lKTq0/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:00:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD84F4A45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 871B23041A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17C633263B;
	Fri,  8 May 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDEzoqEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5V15Z/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC4343D8F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234081; cv=none; b=UGCifC5yW2Gmnc5w+1XJjB/iavghl4nsSCiI5O5zdA1dJuZYOYMfX1bGfOkvT1UA/AG+O3WDcjVmJwEDJjrMAS7l2vqA5BMddyrf4gN57OfLZK65/aK7/ielTre3KzJk0Jhj+8CHpM/sgZDMZdNlJo48mlWqsbdN3IBan3h7mIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234081; c=relaxed/simple;
	bh=HjEDykLJX6Jt9S9QvlQhNfndBFcUdtpN/AUoX4hVNMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HdplcAZnSMHxQYT0dem5+aUHDCTdbkVdOjbieNjqDr4+omNS4OhbDE4FWV8iVKpP5mpxB+9o5pjsq9Q1jcqqqM1UODmaHirUzGIOGxspFXJkTX68VLDZzZs+UNy+JZfOjz9+W3OYLkDOLvD80oEWRLreNAwqxMgynt2jTdPBlYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDEzoqEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5V15Z/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489plvq2770992
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TiJIdCtRF8sPp8DTAw7sCi
	AkaeIBCqQtT+HrST28lLw=; b=fDEzoqEspPuMo/PcO1ct4OOEGOYWxy1fjn1bWl
	qlbZAimEryrvD+q78Jg6VwIKVC4UivO6jaEKCZyTFm/17Fg5hQyA1s8ayDNhIDg8
	Ik+6RBDkvF4FCMPV/J6A8ripnyRS4NATE+usCZJTRYRotcsxnBwJWNVw+VJDvr1S
	YQvmKiS4P+TLI8oU5LsMZsBDHupzDsGsBikXPcZSxdEO1psLHRxMhsLZ9vhnkVFq
	7ifcINVUPVOPeSgkTq+iopX9RhPS9XYZp9oPiOIi9mabNDIwUPcjo695TEr/Yg8R
	9LcXV4wPzLxydZCg4o98NQqpwIync/4NTNuhBPN47/ZTAJ6w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k417-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:54:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so2116823eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234079; x=1778838879; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TiJIdCtRF8sPp8DTAw7sCiAkaeIBCqQtT+HrST28lLw=;
        b=b5V15Z/5ALzZPOxTtundHgtxB0t8P0PU6ChTAQi8CiTjt47gA9fdhMK964tYzsOEos
         fYlU1/foOEcMfc1SMdiRgeDEBeaWdLpe2gES9DYWZIJFq3URN1+TrbaI9zdKCBMyP5c7
         vKj46rnlxr/yhVG/zMCaX0oqXcDKNrvOQo+Jif66USDqX7NYg7j7YBZn6MtQdiW+RtHj
         Eo2I3DQ8GPdzV5F6xohE6NulHtryErKeEatP/9Y3Hvd6ebEL/PSdpXDzNu0oGsC/CQVi
         2uHM0tTqEk9uCV3cu2aQNjYfhhTRrN/Y/MkzVsKr5q+sl+ez8Nl6aOpEO3WnAlJzoX7y
         sWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234079; x=1778838879;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiJIdCtRF8sPp8DTAw7sCiAkaeIBCqQtT+HrST28lLw=;
        b=ne3mNcrMF29A5Al0eA5KBrFt7sW6Qwy6HCPODUeK/d2Wf90G0dx7T24C23SWcbL6U+
         N+MFql3+GEADQPdWet+SDYW3i/tUf3qxsvQaITTouY/v3hMwNeH18SkbMLR5voSGGJmn
         0PFmyQFJOAK9To+oP+JBQuvA3sirfXzADfCJq0L3vrPxse4qkGHf59NWFiefLGCvWABR
         2betjLjCB8VIfFZ2F46Aqqll3GwXqPqYf76/xE5946H1B276F6gY/H66rZGVSHXaTs06
         Ap3yAXwzaRAtZNc3HpaOAXwMxt9YXLyJsJtQeWdWOWQXigdnl2dZc1fjlyhkOajUUTZW
         kHcw==
X-Gm-Message-State: AOJu0YxbM9kuh5G/OJdLKdcmfeDCx3GzaIE4zkiFmGoQZM8gD7TuGncb
	KT6R/6Ao/NiltoBYYA2SKwHrPGD1m8h4NBhvYASnFKYZaLlrYWwxO9k3QNBq8Xr4NDYFntdWhQm
	UNr5RUPbWa9pZosQ7V4YLx/yAgwSF7CjDYD06XqARPreZ4w3mwpRSyXQrDqftAVRhI5G9
X-Gm-Gg: Acq92OGN2zoZ73OTHmhkG25NP2iEhQvEt37Qmj4zDpalabFIv+WoHNMezz9FkS5rRBh
	yPyG/5g+Ult2xtat2WqJKvdVUmtXdggsJ4ThmWtfuRKen8JcqB8arNW30rQYGPrMIlTSKuf6wVa
	VN2jIIqUZyyii1UjFBvoHHTCqPaXrmvpeIPM4e4yxnaEiLGnPXgxaEAX01BodheWgRsid6riAvV
	KPs64ZoUMl+5FF1R2W6da8PxJVA916r5sOSqkO14Chn0eRrLU6tZtkzPmYNpr46EyCv+dmH8RNQ
	s1EOU/bP2u80790dFPbO2pzyjf7M62luqw8te1COSh7TsTybTsdgMJTKuq7fz4BrJCpSWUdYKgO
	t1WmLG2H7z0eDSr3dEkbxevuj/VQ+O+KKQ8mym+B/HNEoTfL3oybe2sEmnKynS5jqHvlL
X-Received: by 2002:a05:693c:2c93:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-2f549f7c2fcmr5978695eec.22.1778234078506;
        Fri, 08 May 2026 02:54:38 -0700 (PDT)
X-Received: by 2002:a05:693c:2c93:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-2f549f7c2fcmr5978665eec.22.1778234077926;
        Fri, 08 May 2026 02:54:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm1459176eec.30.2026.05.08.02.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:54:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:54:19 -0700
Subject: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMqy/WkC/yXMQQ7CIBBA0as0sy4JbVGJV2kaIjDKmFgJQ00N4
 e6iLt/i/wKMiZDh3BVI+CKm59ow9B24cFlvKMg3wyjHozxILR60m4iJs4nhbXxmYU9qsFpJPU0
 WWhcTXmn/Peflb97sHV3+jqDWD7zZ6oR1AAAA
X-Change-ID: 20260508-mix_perst_phy_dts-b741b840833b
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778234077; l=2895;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HjEDykLJX6Jt9S9QvlQhNfndBFcUdtpN/AUoX4hVNMk=;
 b=ZFbD9kJPg9Z/CSnes5kNmNpry/Acsc17UJzeDMdNuFXVFH2WaQsdDcwVGn0FhI2+eA636JUUc
 YYYkQ6353NYALPswRbWrBfqVNamuWbGR9ni7x/DRvywQLwxq5ChO+Aw
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdb2df cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jtNwtCWPJ1kYkMuoZKUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 5jTPSru4dTHKwxBHISw69HNKpPc-QGR4
X-Proofpoint-ORIG-GUID: 5jTPSru4dTHKwxBHISw69HNKpPc-QGR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfXxiYLBjhWcsRs
 /snUm2PjLCtNSMGGYgzQhcjJEkH+EedX13NnRNrwhsYZqZtcc9aEmYg2bodgKvs6Y7M9RzxVu9l
 +ftI3bT6YQefV9n9/hIQ5TZCw/e4FBCqJt7Jntn+72U7SSkxaQ7OkznK4bqF8nVGwZKkL8eN067
 OFDLK4HZ0B1wzpy1IDVbQde1FUfoTICvbmc4DnT/uflqB7Nn+ISckaY9MpLawIQshqa0jgFIghF
 umVwm6ZGKb5VRe9m0Ejjq6NaJZuxw+H8UM4BeX/W5lJFjBVVL9XI6OTQ4bc+Jpgo4WiCzz96fSs
 Fh6fq/TuYZlv4bQFJZDuf+3ZcW0qpvv6+ENs/9Qc2kToBpx3HoaT1HK/BnyiYfJYvDco4grWeKx
 9V2E2CzQ1jeKZGxGeLZ2V9h5k3wexaurLcD4IduY1vE8OKZRQLEtUl5lrQ1yuoEWn2CP72GfaLe
 exwIJSNdmy1iplp23yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101
X-Rspamd-Queue-Id: B9DD84F4A45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106620-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The driver currently supports two PERST# and PHY DT configuration. In one
case, PHY, PERST#, are described in the RC node. In the other case, they
are described in the RP node.

A mixed setup is not supported. One common example is PHY on the RP node
while PERST# remains on the RC node. In that case the driver goes through
the RP parse path, does not find PERST# on RP, and does not report an
error because PERST# is optional. Probe can then succeed silently while
PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
silent probe success makes debugging difficult.

Handle this mixed case in the RP parse path by checking whether PERST# is
present on RC and, if so, using the RC PERST# GPIO for RP ports while
keeping RP parsing for PHY. Emit a warning to indicate mixed DT content so
it can be fixed.

This keeps mixed systems functional and makes the configuration issue
visible instead of failing later at endpoint bring-up.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9fdfc88ac151..8235961d692f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -282,6 +282,7 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
+	struct gpio_desc *reset;
 	bool suspended;
 	bool use_pm_opp;
 };
@@ -1703,6 +1704,11 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 	struct gpio_desc *reset;
 	int ret;
 
+	if (pcie->reset) {
+		reset = pcie->reset;
+		goto skip_perst_parsing;
+	}
+
 	if (!of_find_property(np, "reset-gpios", NULL))
 		goto parse_child_node;
 
@@ -1721,6 +1727,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 		return PTR_ERR(reset);
 	}
 
+skip_perst_parsing:
 	perst = devm_kzalloc(dev, sizeof(*perst), GFP_KERNEL);
 	if (!perst)
 		return -ENOMEM;
@@ -1778,6 +1785,14 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	struct device *dev = pcie->pci->dev;
 	int ret = -ENODEV;
 
+	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
+		pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
+		if (IS_ERR(pcie->reset))
+			return PTR_ERR(pcie->reset);
+
+		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
+	}
+
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
 		if (!of_node_is_type(of_port, "pci"))
 			continue;

---
base-commit: 33a76fc3c3e61386524479b99f35423bd3d9a895
change-id: 20260508-mix_perst_phy_dts-b741b840833b

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


