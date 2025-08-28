Return-Path: <linux-arm-msm+bounces-71115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95FB39C97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF49B467B94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21D314A86;
	Thu, 28 Aug 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFL6eLAn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268830F7F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383048; cv=none; b=KC8DHja+XWau259R7YylF9kv60bfzynkEtOKU9MbpLrvatMU31MCdJZ4bv4B+7NYirSCpskZSy0556tvTzzTwyTv9ZG/0HvE8wSR36efVGcR0y3JEzU6XcFxr2Mb6Kt8dhssA7pRspW/6FcWbiIohoaeYdtvlcOf86OnDyvf0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383048; c=relaxed/simple;
	bh=JLQioafU2Ha99tn/qTONrjpmtaS25D1YyPb7oDSQVMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DD6CjUFhfVG/sZA///FZDhMk5E8TiZJPYSbxl+sIbM6fTliRbnGja7Gs0KjznAK3XZ2UidlIwv0tdaRGP8rJrRk2/UcWJJ+gDKseu8TMozT1KtyG1+5JtxKMhwVoT7/pKEuKT6Adfwf7DD1SiouONBBxb8N60qWFJ6tkNeN7AzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFL6eLAn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5tlne027487
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JH0s9yKloivepHo0VkuQk79EV0GNYwLeAdz+CShJbJE=; b=YFL6eLAnQBNb+9ji
	gr8NtTF3af7ZhnHWqNHsuqr6nH0oARxi4/mF0MLythSKjNyUY0JY3FUlU0iiRZ5Y
	UHo8IbeddO+J0HbiQ2wxQXbWXFvX11dYQ4n2cSGXZ8b37k1M68mrGoL7KHKr7O0o
	LMMWhUHzh9wINrtNTnbw/7xDK7ENia3z+DWC9oxCKY4BJodnYKsvqdpDjDMX6Zqb
	E5u+0qtkfggWm+j+/NBQ9m3Rrci0MFVu6Vg4C4Rrp3/92SxWahU9xTF7XiGx18xm
	TUihd40F15zf7/aX7a9UOR9BW33l0k5qEdannLyTfTQy1qCrdYqFNLPLsUJp1eIz
	Hg0tiA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16y57h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3235e45b815so1088600a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383045; x=1756987845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JH0s9yKloivepHo0VkuQk79EV0GNYwLeAdz+CShJbJE=;
        b=beAtluItxQP22cB7hZOb9LMGwehFmBz2Yeht4gT4wjbOH3MKtVA6aKITsUGvcABLNc
         r4vorYD7I9k/npC9zYltE5m2NTiNP1Ei7HvlxqZ+nPs4nKxGywY7p8tZCyFmqzDCg/1u
         aGOByjaMFsDH250oyMJztqvIke2TkCYiqGEzMDeDj8vV6V5jbHHdTqIxfA9pxQJhQOEm
         ykqOmTq732LvkjRlz5/4kPHFTiI9uDLfmMgN2tIQLtQ0Ertpc1pOkCvTN6ClJyoIQT1U
         GtQdDV8bGFPNKiFswTohRXlYXkGFXCoclGG3rpkzE4WKdUIcnwHbiIUmLa8YTeXqiF3g
         4sfA==
X-Forwarded-Encrypted: i=1; AJvYcCX3QjRZOPljtY2oGOSDP1EkGDoH/fcmgoHxOyrlREiHVD4vio2rjbLs+UPgax2MB6amzt0zpY9wEW+VFwTm@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxVIEty8gmaDWIiFY3iLYFACsnItxQuCKYuZcNzvBBa4lIf/V
	Bxw9N3C1DpX62+BnsU3Nw8FE4qsPuznMX6f8YXQQRe4euBXYoT5KT0hy9Djy4fL3xRAURj8fIfA
	TSTZU88Ams4uoqQknqWKphLOhOS1IlQuGj3De6tkykngZd7NH9ULLZtYlmjvdJvs7HN6r
X-Gm-Gg: ASbGncugkQp3UQ5rZBxhtHzsLCifJ+eXMWJIIxHZYU0AM8w2I1PyFFSfUf4Jts2FALO
	nSxin2gKBQVp1/LynvmL/TGVOS2Bt/bB4Fnnx57KWYXRF33WedjcLfRSkn5M7DsR6TV7JrxuYMP
	Er7zMf0L40WCwTUqUMwG+kTBHTsbEhCVN+Xo3iVqJjMEEpicaCy9GfTqHVHtns/7q0dbdc0PUdQ
	whn8wGb0TaIYW0fQy0zvoH+baJEOoaJQAPfQ381q9nRaluFsLpFeIvkrJaBOuNnIS09aXFVXvP6
	Nnvw96w9AA18iY/Q/JVpI/be19imZdrxSKx1T/o4Mbe0CI9QatVyhgmfTbMqRlZp9pONyD16zZA
	=
X-Received: by 2002:a17:90b:3f87:b0:325:55cd:9fd2 with SMTP id 98e67ed59e1d1-32555cda0a5mr25083469a91.20.1756383044377;
        Thu, 28 Aug 2025 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh+FZuvrtHdatmZz9NFDOZX4EQHu2edGUNAKaj+LzwOmKyiYcPAJDdxI13V2Rm1b4wPERPWw==
X-Received: by 2002:a17:90b:3f87:b0:325:55cd:9fd2 with SMTP id 98e67ed59e1d1-32555cda0a5mr25083377a91.20.1756383043588;
        Thu, 28 Aug 2025 05:10:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:03 +0530
Subject: [PATCH v6 6/9] PCI: qcom: Add support for host_stop_link() &
 host_start_link()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-6-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=2834;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JLQioafU2Ha99tn/qTONrjpmtaS25D1YyPb7oDSQVMk=;
 b=3DLBa9Wbs2xtxAeBnSSZORHDlNgEkMWEmLEKsGR45JfGAYrdxo+fhjGG2bBtb8588SB4Y5YZO
 4i8Je/MeHLkDoxHV9YbpJJiY9H4K1KT7rOrj+Eb0UGwJkdPegzEFR43
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: fEXqbpZ9FqAw3PdcoJLWpksbhyu66Yln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX2DvqSyWT0FU3
 Lfd7B/4yBeOoHULRXNRuTVKN0Q3d362vkJS+9uK1CBQm9CgjxrgPMscFkI4kPDW0cSrWFzN0FK+
 aanxILXVpEErYGx9l92Pctaw5LFdVQtRWnrtyMg7GbIkQBKFu+hQYLrPpGdgb3EohoTiJA70E9R
 kJBof1wvFObvJEv05ES3PijdLhZOdjKgUFoGsqX2f4+W2CoiK+JjONLrKjGxn8BVTb6Hy8AzbvF
 NmwCASBf5YvgaJeIP2OD91AED0BaIslziAGo/L2DcK8dNVgsqYJkttAvDWk6gJ7Q2BVIa/CRE+P
 C/Riq5TsWsVCN48d1GHl8HE0YlgfXRoFtjQNDYYw/rqdXx6+imwUC8U7YqBbanpfsufL2izbGbi
 6vEFoZoy
X-Proofpoint-ORIG-GUID: fEXqbpZ9FqAw3PdcoJLWpksbhyu66Yln
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b04745 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dstPO7x8LWyc_yWpthkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

Add support for host_stop_link() and host_start_link() for switches like
TC956x, which require configuration before the PCIe link is established.

Assert PERST# and disable LTSSM bit to prevent the PCIe controller from
participating in link training during host_stop_link(). De-assert PERST#
and enable LTSSM bit during host_start_link().

Introduce ltssm_disable function op to stop link training.
For the switches like TC956x, which needs to configure it before
the PCIe link is established.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..8ec76fbc0787ae305e9c63eb82fbc999d197a123 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -250,6 +250,7 @@ struct qcom_pcie_ops {
 	void (*host_post_init)(struct qcom_pcie *pcie);
 	void (*deinit)(struct qcom_pcie *pcie);
 	void (*ltssm_enable)(struct qcom_pcie *pcie);
+	void (*ltssm_disable)(struct qcom_pcie *pcie);
 	int (*config_sid)(struct qcom_pcie *pcie);
 };
 
@@ -642,6 +643,37 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static int qcom_pcie_host_start_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_deassert(pcie);
+
+	if (pcie->cfg->ops->ltssm_enable)
+		pcie->cfg->ops->ltssm_enable(pcie);
+
+	return 0;
+}
+
+static void qcom_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+
+	qcom_ep_reset_assert(pcie);
+
+	if (pcie->cfg->ops->ltssm_disable)
+		pcie->cfg->ops->ltssm_disable(pcie);
+}
+
+static void qcom_pcie_2_3_2_ltssm_disable(struct qcom_pcie *pcie)
+{
+	u32 val;
+
+	val = readl(pcie->parf + PARF_LTSSM);
+	val &= ~LTSSM_EN;
+	writel(val, pcie->parf + PARF_LTSSM);
+}
+
 static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
 {
 	u32 val;
@@ -1435,6 +1467,7 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.host_post_init = qcom_pcie_host_post_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
+	.ltssm_disable = qcom_pcie_2_3_2_ltssm_disable,
 	.config_sid = qcom_pcie_config_sid_1_9_0,
 };
 
@@ -1506,6 +1539,8 @@ static const struct qcom_pcie_cfg cfg_fw_managed = {
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
+	.host_start_link = qcom_pcie_host_start_link,
+	.host_stop_link = qcom_pcie_host_stop_link,
 };
 
 static int qcom_pcie_icc_init(struct qcom_pcie *pcie)

-- 
2.34.1


