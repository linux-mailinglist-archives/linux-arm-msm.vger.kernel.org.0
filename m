Return-Path: <linux-arm-msm+bounces-96947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDS6CV9EsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:30:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AE262365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52FE83023158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417BB3CF69C;
	Wed, 11 Mar 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4ydBhnX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJj4dRuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88B13CEBA7
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224840; cv=none; b=NI6RMjy6vZm3oUhp0tHkcfIz1A4cGL4wbovzoZpcldx01A+JXYNEKiqV0/QT5UW8nI3QbX6sn3/eKtMLXLIR9B55wQH5CrHFsUpjzQrIawjn64ByiB+7wvk6NjcrsxcY/rfmMTZ/BRpVXTbDl/7oa5MT7PaisEppVqIzXhruKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224840; c=relaxed/simple;
	bh=0v4Fkx+XZDjpsl3JOqkuJUc5cmWHZo8Xz0ri4m2aC0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVsVgGcvfnJGJTvf+ZQC1Hom/gfGGGxyulbDwwmaf6q8e/ZLiPB4QAV4tPIfubRM8qp0id1L2pJ3P1NN9hXshWmdzcPFz5X2N6erkL/+dzk7pVx6CyI+LxudCcBBNrCX01nKoNKcl+35MtYkHKkuqz5M5Up4Ka7jWdgdrUBdBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4ydBhnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJj4dRuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA2vhT3893457
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=; b=j4ydBhnXyrXY+Y95
	L64lGMl5TB39e2h5birvkeaTnWCDQ60AvuTEwNgXlV0KgFocZu75Lpp0vwMnNVxG
	YPlyOdoAgIb4Cox8we9nSty/Ci5O5kaWgHIiNwndKOsS7JDWzheZIedxuFz4yGOE
	wnhoCeOwBAFohovg9Ciy/ib8pVzecKl7HnY1SPUTWy5UpvqS7q7diiiDrmqwgTcG
	wEq46vxWNxk+JB32y9XZY6vlwwGLLemzEyzPNR1RL//ikwp3Rfa5E+Q30dviTl21
	oA+y5WNfaQUHEHnqMhW7QHOb8y9OktNWkc7kzwkhhEbAgcsutNXZssO7z+aXWb16
	NG3Ugw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyvavc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aeabe9b4bbso6162635ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224838; x=1773829638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=;
        b=UJj4dRuSDD2YwDBBZdDR2FvV1DRvOlP/RrLCjf+74kjPVvPkQawsKUC4KDn4TZYigi
         gpc4MxJKhXBt2Eje6Jv33N5axykdx6LjNkKiCoLU31RTJLyAOj0vvpAD8alIh88DnfdZ
         CD8RCoJv/aOHLQG1l6vA01AKoZT2GMX1wdADNnYuKqJDzH6OmxpouW6ikm+GXNi/QmHH
         GkP09FsgLpZ1UlOFBlZIsql7ayRtcBpeJt8oSy5XC8OquSOYXrJnXEGWI/dpNJFHCnqS
         7CScDnKzqdsczAVNMSD6MEL75p+fU9Vgw0O0pPIVD+VDJx3IA0dR9qjFiqv5bl/DMWXb
         gM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224838; x=1773829638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UWEk66tIWWw7Zu8KKDmTOs/vpX2yaROK7XddUYgkx0=;
        b=ghc1l+lgrHiK1hJVMM5lpqRxwsuF6IR2xOz+nqo4KrONq2Q96kbhLcaMaGob6fMrxT
         qNvXHzuMd3uu2fWBSU6gYoWRu4g6ccypvri18QQ1wGs4kauJEBCFJmhClLgOOG04FV0R
         3aYls+u6LpkbQ0JKJQ/I+C7gnPVG6vm0vdQClaPc2jqLWO4Zo0yO8QxZRMnIJ732pLdg
         e29MBDlZfnbdty8dfqCKs1MQvA46Dp2pDwGNBFKEVdFI7ARd//cqBwNIm6zCgbtse7VX
         Zc7nd0g7PDUo9Z425f53ZcM+X0ElAT2WiGKvpI0llTP9EZI23HTf/wRBDASRzUX7s6WI
         76gw==
X-Forwarded-Encrypted: i=1; AJvYcCUA9nAs2NDc483aTbwU8LCh0TY4HPdPexaEYNPWQ/1w/xXTh0rP7V76xr9rhTSc4SPDcr6qz4No5Zd2oyow@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJHzVxl0iM9uMLEtIHtaOkHx8VGdfJQTwJCftFpqnC2Q4tmou
	aMDlXgU1nI5dUXp8S/NLw9eCJN1T4aSQ5sPS9HxoInHGU0sdYKwmUXD+2RxsnSiLyo4fRQEybmg
	fpmcH/rd/K/HJ1mwB8hq4jv4GLDrqOVYLgEpEFhRrXVlOi3rmq3HwU+VgB3pEfSP/7JGa
X-Gm-Gg: ATEYQzwLeo58idjQcNguIDrWxB8EELOlNVsFgZ0mi1nP9KthQh4I7yjVYRu8KDdNoQ6
	wS7WY+fOjxmbHXbRO98KjXT1KhpMG+i7Iz8BPTpgsq+PxKqIy/QpuoqXVwYFpX9FB73gYsO9QQL
	8VcQ31uST1HS4zZOUYdFQ6Wxta1tb47sUTyy5ED2fMcCVvYUa1tzy70tpjmPe7vQJn3uf3clqlv
	qODpK1tGeyXBWzkdbykrVtTMftvIJfBkrIK1LpSvevT2nEvYb79uYBtqlhn2nPjUogkpe9iMXDl
	5orQEk5nBxsGeBwjZiY1QCUwzkYmuXh3i5BqgudyvNMGUVGVoOO2IUdHjFaqSHxzELgV5B2BoDN
	wU9NJW2eyg4WD/n1Kheg5Ntnoe4Cz+nsRlggr2OexfdilUubwT0F8cgn0
X-Received: by 2002:a17:903:a86:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aeae882461mr21337025ad.26.1773224837427;
        Wed, 11 Mar 2026 03:27:17 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2ae:a786:6663 with SMTP id d9443c01a7336-2aeae882461mr21336755ad.26.1773224836899;
        Wed, 11 Mar 2026 03:27:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222872sm19575245ad.18.2026.03.11.03.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:56:50 +0530
Subject: [PATCH v3 5/5] PCI: qcom: Add D3cold support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224811; l=6534;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0v4Fkx+XZDjpsl3JOqkuJUc5cmWHZo8Xz0ri4m2aC0w=;
 b=SnIVcO4hLWZtCxfU7w8+oUn/qP8keFHFwEx8hZLsyGowOrb4LgEnu6sFoJS0pWt49wuPjv9rq
 wJHOkis+50XBeK+3nsfQvv9kOH6UvijOD9DQ7+BO/iBiHtFa7TKjEYz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b14386 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RN3yzfvplrNe8VIVIhoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fWlGSO1qG4RqKXcgjBiAzH3bUJ2xlP7u
X-Proofpoint-ORIG-GUID: fWlGSO1qG4RqKXcgjBiAzH3bUJ2xlP7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX3oMnuH0eRnlK
 kQhfoNrUiaHq8xeGv4jXAWx72JUlO+01tw7jzh3Ltk/RSmwOw0OLYy8KfCK5ZteEV8XBlAGAPUd
 lGxm1RYx/1PY+pl1n2yd1Ta4Yc+KE32J4Xzw1liaLQDdznN2Fryvp6LNURQSim61p8/MuYGDHw2
 CPnGZS5jCyexaq1qXWmbvB04fUp/s3AdYX1TU2QgrV0a+IOPWqpj/JbOKxivk30mnhXNke7CNd2
 YF/+PP4dw+mFklRzCYkZUrsSBxj+1YdUxZBoWF9Qbp+3jzJhpf/ygRUD1C/hn73+cVlH7UjYSQP
 nmESEwn/EYxEQkQzXTWEd+L60PS9HOOlL2cA0GUMLeNiteivLUXSm6QLh8bhNAUpwgkNjlMKFDz
 f4SYtlXwApMTcDoh6S7KI3ObpDfQuFht9ebVqdz9zK42hN1n1oB9sGafSZIASws6J1YfdtRr5iH
 b4vtMwNSXoU6sMg5kfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-Rspamd-Queue-Id: BA4AE262365
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96947-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for transitioning PCIe endpoints & bridges into D3cold by
integrating with the DWC core suspend/resume helpers.

Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
into the DWC host operations so the controller follows the standard
PME_TurnOff-based power-down sequence before entering D3cold.

When the device is suspended into D3cold, fully tear down interconnect
bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
by keeping the required interconnect and OPP votes.

Drop the qcom_pcie::suspended flag and rely on the existing
dw_pcie::suspended state, which now drives both the power-management
flow and the interconnect/OPP handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 47 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c14c3eb70f356b6ad8a2ffe48b107327d2babf77..6c5e9e541d55ad7f90a2203b97847d15d56b59c3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -145,6 +145,7 @@
 
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
+#define ELBI_SYS_CTRL_PME_TURNOFF_MSG		BIT(4)
 
 /* AXI_MSTR_RESP_COMP_CTRL0 register fields */
 #define CFG_REMOTE_RD_REQ_BRIDGE_SIZE_2K	0x4
@@ -283,7 +284,6 @@ struct qcom_pcie {
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
 	struct list_head ports;
-	bool suspended;
 	bool use_pm_opp;
 };
 
@@ -1404,10 +1404,18 @@ static void qcom_pcie_host_post_init(struct dw_pcie_rp *pp)
 		pcie->cfg->ops->host_post_init(pcie);
 }
 
+static void qcom_pcie_host_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	writel(ELBI_SYS_CTRL_PME_TURNOFF_MSG, pci->elbi_base + ELBI_SYS_CTRL);
+}
+
 static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.init		= qcom_pcie_host_init,
 	.deinit		= qcom_pcie_host_deinit,
 	.post_init	= qcom_pcie_host_post_init,
+	.pme_turn_off	= qcom_pcie_host_pme_turn_off,
 };
 
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
@@ -2072,53 +2080,51 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	/*
-	 * Set minimum bandwidth required to keep data path functional during
-	 * suspend.
-	 */
-	if (pcie->icc_mem) {
-		ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
-		if (ret) {
-			dev_err(dev,
-				"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
-				ret);
-			return ret;
-		}
-	}
+	ret = dw_pcie_suspend_noirq(pcie->pci);
+	if (ret)
+		return ret;
 
-	/*
-	 * Turn OFF the resources only for controllers without active PCIe
-	 * devices. For controllers with active devices, the resources are kept
-	 * ON and the link is expected to be in L0/L1 (sub)states.
-	 *
-	 * Turning OFF the resources for controllers with active PCIe devices
-	 * will trigger access violation during the end of the suspend cycle,
-	 * as kernel tries to access the PCIe devices config space for masking
-	 * MSIs.
-	 *
-	 * Also, it is not desirable to put the link into L2/L3 state as that
-	 * implies VDD supply will be removed and the devices may go into
-	 * powerdown state. This will affect the lifetime of the storage devices
-	 * like NVMe.
-	 */
-	if (!dw_pcie_link_up(pcie->pci)) {
-		qcom_pcie_host_deinit(&pcie->pci->pp);
-		pcie->suspended = true;
-	}
+	if (pcie->pci->suspended) {
+		ret = icc_disable(pcie->icc_mem);
+		if (ret)
+			dev_err(dev, "Failed to disable PCIe-MEM interconnect path: %d\n", ret);
 
-	/*
-	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
-	 * Because on some platforms, DBI access can happen very late during the
-	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
-	 * error.
-	 */
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
 		ret = icc_disable(pcie->icc_cpu);
 		if (ret)
 			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
 
 		if (pcie->use_pm_opp)
 			dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+	} else {
+		/*
+		 * Set minimum bandwidth required to keep data path functional during
+		 * suspend.
+		 */
+		if (pcie->icc_mem) {
+			ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
+			if (ret) {
+				dev_err(dev,
+					"Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
+
+		/*
+		 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
+		 * Because on some platforms, DBI access can happen very late during the
+		 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
+		 * error.
+		 */
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_disable(pcie->icc_cpu);
+			if (ret)
+				dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n",
+					ret);
+
+			if (pcie->use_pm_opp)
+				dev_pm_opp_set_opp(pcie->pci->dev, NULL);
+		}
 	}
 	return ret;
 }
@@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+	if (pcie->pci->suspended) {
 		ret = icc_enable(pcie->icc_cpu);
 		if (ret) {
 			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
 			return ret;
 		}
-	}
 
-	if (pcie->suspended) {
-		ret = qcom_pcie_host_init(&pcie->pci->pp);
-		if (ret)
-			return ret;
+		ret = icc_enable(pcie->icc_mem);
+		if (ret) {
+			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
+			goto disable_icc_cpu;
+		}
 
-		pcie->suspended = false;
+		/*
+		 * Ignore -ENODEV & -EIO here since it is expected when no endpoint is
+		 * connected to the PCIe link.
+		 */
+		ret = dw_pcie_resume_noirq(pcie->pci);
+		if (ret && ret != -ENODEV && ret != -EIO)
+			goto disable_icc_mem;
+	} else {
+		if (pm_suspend_target_state != PM_SUSPEND_MEM) {
+			ret = icc_enable(pcie->icc_cpu);
+			if (ret) {
+				dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n",
+					ret);
+				return ret;
+			}
+		}
 	}
 
 	qcom_pcie_icc_opp_update(pcie);
 
 	return 0;
+disable_icc_mem:
+	icc_disable(pcie->icc_mem);
+disable_icc_cpu:
+	icc_disable(pcie->icc_cpu);
+
+	return ret;
 }
 
 static const struct of_device_id qcom_pcie_match[] = {

-- 
2.34.1


