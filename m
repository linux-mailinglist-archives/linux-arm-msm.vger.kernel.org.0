Return-Path: <linux-arm-msm+bounces-99113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIWyML3owGl6OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:16:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE42ED62F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2CA63010251
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5567B35DA5B;
	Mon, 23 Mar 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvKSK86U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJMd9SSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B635E92D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250139; cv=none; b=s4trnEMhR/OZGWKecSrAYwQUVNCtoL+5EkJ0os1M2WBnJARNWK4mIK9wwiG0GxylMWdHjngRDok28ok1sZjAoWQOR0WQwuUJFy3moFzDhnE7b1ofDiRuuxrw6+UJ2j8/H9N/eBfmMAwa5Kus2agWW2YeQBKrD/ioXwz8c7TlZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250139; c=relaxed/simple;
	bh=1kVB09tNu2L/JXEZO/ToUYxEMkDFaHUqjJ74Zd0YDCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ns9zk8ap/4CdJLfDdGv5a/+lQ1DIGPSU12NZ3JZkCC2qWlm7P+fLAOsYDLVsgPWfM3IuniLGguVkCpiQ8sfgxTFa0uASi9AklND7Xo9c5CP8kRXTs3qUVzTavrQ4F4+lpNhe2t8vmSOV076eicfAvPsXcGjqsNKCFEDnV4g46KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvKSK86U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJMd9SSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4dwP3179020
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=; b=CvKSK86UrjlaEy7p
	1wXtadtBUHR4UVZCwgtD39vKozOQTaWoBKxn4NL0XVIr6c3tfYXArsyJjbCdYGKa
	CVa4qU7DsY5E0vHaICrU0pdbXMp06V/OeTXDvYV+cN5V6ZugadQFtMCnj+dxN49N
	vdpsxC0FoLTVlojzPcTxERiKx+LeDVK/vRk8MKrZFBd13j3X3emGHB4P4B/tyFRB
	0i9xrVe0vnrEp8tNiA655PaODGJyCCtv+XZmGwjJiwmiGNIwC98k/CfonILSCbbk
	zZxBItXP1PZKmThS//5fEWA9DDI5XR2ufY9Qx0EMYnsSFCXestYsW5j0YZI3Lj7+
	y5sOvQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kduc7dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso2937309eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250136; x=1774854936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=;
        b=OJMd9SSbwW2FC1lf4iEBvqq0VFp+55X5mTPhY8ElpTvKcUa1lNtldsInLgdyejPNxF
         AWxFJ2k23SHZcvwOYlGf5ZUsONqPyTRE7kV2ou6YqVLmOBY+ulzQ2kdQLzbyh3b9CrnB
         TkL2meLPn6m5dUNBvolDyBC0CLMJf/dn4AVYQdRZuxoIe5wOA3E/yQIHHQPydLHTKHv3
         4xvVpfQhVvFhRdyYYinQ9G0jftz4xJKwUJ0CwKa2+l5rE1UaCEQEpXDwsxJsjhsN9j73
         ORP+eNOdjg2zMq9/AWuJT9SvafxNP6w2ltDwXaa9zESjixYPZmIhCZK4bQJqeNrpI4IL
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250136; x=1774854936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BJhpV2AzAumJm8pTjJTWL4q0sS8IJpLGwzEITJtHskk=;
        b=k9pVJ7BL3Ut1Jc50jDQR8u4qZqodX2bZ3mzT9ZYfXyrM1J/buE7T9K9OItoeIX94Sv
         c7Mr5qSO7LkcJGuFzBrhzTxJA//BSMHsEMbDMNFlhLj7ofbqH0uhvduw1cdzGZap+6Tq
         P2D01aa3HeaitH9z+TZVV2TrnbDH8KExEWkUDS4AUCCCyjSOsAKYJqmC/P+lvYA2Qmv2
         xvqxl0ZQ0BRm7eClqiEaBhSrAG214MRp8wTrh6Ba8u0JoGnA3jVGPIo2pQKQ6pDiZMEx
         Gi9MKly/DjOS0Dy7dSV1aQADGX75IRKeGeVB8301LS3FHPtQFD3YyUFD2bfTx4r41xZ4
         VhDA==
X-Gm-Message-State: AOJu0YxKO6qdOI+KC9YN6jG5801Hp1lg4MuCXILP4FAjM6ZY2edW5tcE
	ddAjq2dC/tdr9nVxrkAOM9fIsVhEYaYeKA7sL/vdLF2RCQ730lbAEoPMJGr0sR/gBFpJuq448B7
	Msz4fELMmNRwyysKe6Rj3BtuDPixckxcyFWxBq4hdVkcxGPXJB2tISwZjO+BrqQ0M6AaE
X-Gm-Gg: ATEYQzzIZT2wgBli7+7wQVVUxX409mjTHCXGpiFBIMdF48ESxxEdYNIxmIJyR0TtAWN
	e2LRUmuNUVCd0N3V8b8Aah1VWMRy2PG//dqcRPK4/n6EWYQnoMa9xiU31+nLLm0YJ0Y2/fmVOGA
	08chiRQuvZ3Qt/0Bm2a5IYrFXFr7cYOufH2Aa5xy30H3nEBqcKAfI2KIzoTE3D8zPhg2dy9Ze7w
	C1fstvX3pBHXQX/LVWxXTOpRo0lpn0rJn7a2uPSPsLANjBhIp9Nfp9QloAOjWk6yJE65hcF3tqI
	lE9QpHz/70cfYdUeGlA3wMpv3dPHZ+B1/REeahArKgwZxjlT9uYDO1aS3L8qkuAc1kzN+WdJ72q
	SScFZwX/9l3YfCp8cyk5MvVoae/o9LmXCKxiw8PZ0jXeWv7TxKZ+O9A3i3iCdhc/nniZo
X-Received: by 2002:a05:7301:3f07:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c1095fb80fmr4975764eec.14.1774250135752;
        Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
X-Received: by 2002:a05:7301:3f07:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c1095fb80fmr4975754eec.14.1774250135214;
        Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 00:15:29 -0700
Subject: [PATCH v2 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-2-ce0fc07f0e52@oss.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=2504;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=1kVB09tNu2L/JXEZO/ToUYxEMkDFaHUqjJ74Zd0YDCI=;
 b=MtfPg0/WzxcccrnkITZarstr4an0FSrB3GYefYIOIEx+XcVZGCq+zCV0mtEnRv7BQn+FRSU+K
 EOPre4HDVu3AdlWQAR9PHbVlaBLIqW/krj80b7m5CZdbEa6mP2H3cyq
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX1FCPKXQHyHC+
 TLHr7Ywu5+Nlt+p0uzlE7v6HhTS3M4YsRYtSrOXdMVYMzou8jafLIVDNE7fQ15Fbahwe3SPRYfR
 4hMIKp03A0qiyaFsmuKTJSWgS2By1tKEltkmBoiqgfsF6yuWr6oX+C8Txj6pfuyH0LnzxXzOKqR
 oVxdFXDRjyHg9KlDN7Ig/mkSHmwVZkdXEDjVotKeSTgGh6iVm64HfRYSE1dEl89T6kl+A98E52h
 Qsjr37dOD597QVLB/hq6R1GSttJlkxjFWY5UGvvqc5wgJ9sWhff2FBiWWFWzn53QeSqWlIyby5X
 rWVFTIrztMoZUHCbFAHNjBnFx4nNtW2JLh782rzipcW2F8e1jiVf7cKGB+VnZoAVinstP4RBBBr
 cppUhj8MFtBo3UaZd0BvnZURPNTU1grpZ2j8P/+W6lzggNuRmfxLnFRVeXVVSsGSpRVhKFqJDiP
 gyW8ID7IOY8i8HzbSGQ==
X-Proofpoint-ORIG-GUID: 9G7WOnYZDmGSDHWWM3M6MMftpqRSO4zK
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c0e898 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 9G7WOnYZDmGSDHWWM3M6MMftpqRSO4zK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99113-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DCE42ED62F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
that must be powered on before initialization per hardware requirements.

Current PHY power management assumes a single power domain per PHY,
preventing proper setup for this dual-PHY scenario. Add support for
multiple power domains by using devm_pm_domain_attach_list() to attach
power domains manually, while maintaining compatibility with single
power domain PHYs.

Enable runtime PM to allow power domain control when the PCIe driver
calls phy_power_on/phy_power_off:

- Single power domain: QMP PHY platform device directly attaches to
  power domain and controls it during runtime resume/suspend
- Multiple power domains: devm_pm_domain_attach_list() creates virtual
  devices as power domain suppliers, linked to the QMP PHY platform
  device as consumer

This ensures power domains are properly attached and turned on/off
for both single and multiple power domain configurations.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb31108d51f88d34f3379c7744681f485..424c935e27a8766e1e26762bd3d7df527c1520e3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -17,6 +17,7 @@
 #include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -5329,6 +5330,7 @@ static int qmp_pcie_parse_dt(struct qmp_pcie *qmp)
 
 static int qmp_pcie_probe(struct platform_device *pdev)
 {
+	struct dev_pm_domain_list *pd_list;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct device_node *np;
@@ -5348,6 +5350,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
 	WARN_ON_ONCE(!qmp->cfg->phy_status);
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &pd_list);
+	if (ret < 0 && ret != -EEXIST) {
+		dev_err(dev, "Failed to attach power domain\n");
+		return ret;
+	}
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = qmp_pcie_clk_init(qmp);
 	if (ret)
 		return ret;

-- 
2.34.1


