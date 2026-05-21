Return-Path: <linux-arm-msm+bounces-109063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFZ0KCAED2pDEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 060495A56A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76E4312C912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAA73CDBDF;
	Thu, 21 May 2026 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcXwfnik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSceX91l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2933D6462
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368226; cv=none; b=Iwpj5jEqB2Y9VZsMg9ZoK+HK9Gt5MJNiG7BD3/5vnVON2WX+/ftAxMb+gH5EZyRHimq8urfxdSKJ92UMrGdKJpoOdozsqCMpnpXYbm6B7mK6C0TnNGmNc9t32fH/8W4+ooM1hEoOwfgU/bsbul50BYODephJgWgLQ1rPEl8dXVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368226; c=relaxed/simple;
	bh=wmvKp9NRJ4GvSqBTeqBv04c7mvtTpO9keDXQfKRmU+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HueIkFn2z0tpGFLiVWxZHDNq/AOt5jIoqnUjpxetxwWHLzXNu96wxsoMEe9quw9nZXGBXESYZRUMcJGDEpTpcxIIr/wGI32y5vccGqc7SQvG0d6PZzytaSzshNm1OXkh0DU03OVjib+et0nxwGbFcxLkEfQwk+uvRR/tyLY1l+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcXwfnik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSceX91l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXv0Q818881
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSZqspbgJj2wWqFY7lxfq9p3U8n82NjVy/UhrKbC7e0=; b=hcXwfnikVkwwZWP3
	LwYdjKBaLM2rOYgIVywl4i+Hp+jUMGbQBWpcvRMkANwpLlSOxyFwRRnc/0pr3drx
	IfUV95/zJwvm99t/WA4Mb5No80/GDWM1X2BFXYWtZuVziaup2/qhoyfyuMAfQbRh
	XGwtDLjUFW66aGnPQfUgmBo22qIsDS2HFOUsbr3DCHUVhIS8hiwy2v293b0n1dle
	VV/+TQ9ql5dKD+Wqe6Y+VyEhp4aEzVlXK3hJfhmFzDxQf4B3sn9TQJJYQusoMkKy
	yJ6HwaB/gvUls/RcChQY52Z5q2oCh/9eYoPkvq60LR3FjCARHqk8lZc2MfnkaEY+
	mJFBXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkgg3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662668b825so12148022a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368224; x=1779973024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSZqspbgJj2wWqFY7lxfq9p3U8n82NjVy/UhrKbC7e0=;
        b=gSceX91lfbn61nm/3oPbv2Yg65gxLOuJ5EdQFP9ZiBxCiADyUyMbrdWVctTFbEUG+i
         Kn5LZmGwNrntlsBtVAKTaecQnKnRqvoDkTmQBXUeWPT7Z1zl6J7hIsaZBSb4mJOBzeah
         M8+aO8pupso92HysOlEQ7Azv3Od0aXUzBuozE3iIH/VBQI5BOE/NvVi55ACxEnUzWkJB
         b3ri9REmZ4nZsVCEK6/fTPfkDAeb1lF0FfxPtofk+PuGqnBGVZgOP0idetInXToA/Mmt
         uh9w3Nz5fpY4LrXwE4HjJ0YwdDLn3C+PiqoyTVt2fDfQ3abd6AoKJy2qW6wK9+gDn8td
         gJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368224; x=1779973024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSZqspbgJj2wWqFY7lxfq9p3U8n82NjVy/UhrKbC7e0=;
        b=d8tRaOCvJxnTyZLV1eAE/XxOpN+U38tkINsHvz5wZ47SBkiHPnZYm0EMVIv6seAzqS
         qFCuEz8DjlSnr5ET1WC0LbGE4Uk8p7dMbqY9t49p8Ri/Mi1Yu1rw2ANPIfeNbZ33GitK
         AJPPVL7Sz3xl41qAZC+t1JrscNQLNrnSGixfD0wrk6x7eAwdTumAcG5e7yVS+kiGCEXu
         8wAXw5ZVUdOSbz+se10If/Q9kz7DqYRNAIBXcYrio8KvsLdMfzakL68Kxz+JXa/dOfOy
         SLIUoRlMyL+auY3V4s0+8w88hkRhtw0tSgxzycZIVLmktuPgCTJyaQT3dtuyAEwI3Kgc
         n+IA==
X-Gm-Message-State: AOJu0YyMCDfnP4p7lYUjDn+dCZAJ2RJKZXo5DhLcegR4LXdDUiFpr7+y
	DGrsyKNKQV3Sxgcyw5iR+5Zp4B7swBFlGeyfmGwa+ram8kQfu+df/Vwi37UowPVZd/5hLXfU3wD
	BVCfvw8zqMBoOr38kznCEnqKo4SY1379JiZ8rak0VjMDIXp2xC6yEmh6TH1nG6Buj3Dc8
X-Gm-Gg: Acq92OHZE2VEa82gjgs7CreCwy32ZIeU0vjfmThBRyzJMASMNU4I8wtYRNl8Djx2/vP
	w7lC5AN0axGTtYPV7qwmlZki8UqFw4fUCJHZHzLoEWly1dgkyPEMscNUQFlBizSYrKTa12zql9G
	B3NHw8pOXIDHFOLqprDsSXTu4UAXa7muIr1pSaOS//5qDOMpXk8dPxwY9rTYU+ritvOMUYDSD1O
	QolvFQAbkqsmqAZi8BYskWwI3sSc8XtumkEHt6gLXLhleUAUeaDFNhwM1F8n52AZldgm1uwZDoM
	lRXtBukxWV1OIpkgamL/RiJ/KnoEPD/nYZim8QOEuXvHbmewc/knG22sCLcvTPOkK7zvHewFnox
	cGva9GZvdmddqHO4rIgxm4Q/iGNhMuMPK9TOqpxdJZCyTm4U3Rt3U6+QY
X-Received: by 2002:a05:6a20:a11b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b3216b2a24mr341036637.4.1779368223924;
        Thu, 21 May 2026 05:57:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11b:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3b3216b2a24mr341003637.4.1779368223478;
        Thu, 21 May 2026 05:57:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f508bsm357984a12.20.2026.05.21.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:57:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:26:33 +0530
Subject: [PATCH v2 1/4] phy: qcom: qmp-pcie: Skip PHY reset if already up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-link_retain-v2-1-08ed448b081c@oss.qualcomm.com>
References: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
In-Reply-To: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368212; l=3603;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wmvKp9NRJ4GvSqBTeqBv04c7mvtTpO9keDXQfKRmU+0=;
 b=Lf5uPP6lOdqiH810K/fw8fjljnmWCoHzlhfhROpoten0D8FfUgTOR63Bj90b2vp9nPzDzp4UR
 m+XYTpuKfxdCCpgUM+pbX8d2k+C/lm4qaCbjxROZxZYEJfo23MmH5VE
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMCBTYWx0ZWRfX7tzVKvc4GfWn
 ML1BqELGg/U5+HkhV4hWJmKS3shBEF8TcCRXXLrlikq3BieccLQVatOLBnloSpL1qyoBxiWPP6n
 kdXv43T0n/lELe4FDtgZg7ezGCi+4U55ihZZUMiSRVQJ3VNhLqUv6g1sNNaN99Wl+X8LmPpSsrj
 sqaeW+V6urMc5xZaDPetPQpjwuB6laH4aC3C6kVAiOvvCpLmaEBG8jguEgwf4QYbRnJp5BN2p73
 K//oIValVQsDvevotq9Ch/twnUdYhiuaXPQh5CpLUWWdvrnVK6Jy3sBwDNrsKW40dPUV/fHOZE7
 eemmOK6YYDhGDco5S1e6lNq/xxZzJYDMJEPyhNZkF8ylob51BWKITqrl61egDqwA6mQlcshVTc9
 eRg4enSM4uuCAWdw8rEeyskrzR42XEaLvtWbmt3xVsMPt/nF7wIR2UNOsj/AkoW2ratHN8chKzP
 I9nHiR1VposVSczr/9g==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f0120 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=opHQ60H3MKUy9uz0bH4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: T4N4qh5eoBbkb34AaQ-GkRjBbbIh5hjd
X-Proofpoint-ORIG-GUID: T4N4qh5eoBbkb34AaQ-GkRjBbbIh5hjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109063-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 060495A56A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the bootloader has already powered up the PCIe PHY, performing a
full reset and waiting for the PHY to come up again adds unnecessary
delay during boot.

Extend the existing skip_init handling by introducing a skip_reset
condition. When skip_init is active and the PHY status indicates that
the PHY is already operational, skip asserting and deasserting the
no-csr reset while still enabling the required resources during
power-on.

This allows reusing the bootloader-initialized PHY state and avoids
redundant PHY reinitialization and PCIe link retraining, which can
add hundred's of milliseconds of delay.

This relies on the assumption that when skip_init is enabled and the
PHY is reported as up, the bootloader has already configured the PHY
correctly and the link is in a usable state.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..1458ac1478c7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4729,6 +4729,7 @@ static int qmp_pcie_init(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
+	bool skip_reset;
 	int ret;
 
 	/*
@@ -4744,6 +4745,9 @@ static int qmp_pcie_init(struct phy *phy)
 		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
 		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
 
+	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
+							    cfg->phy_status);
+
 	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
 		dev_err(qmp->dev, "Init sequence not available\n");
 		return -ENODATA;
@@ -4767,13 +4771,15 @@ static int qmp_pcie_init(struct phy *phy)
 		}
 	}
 
-	ret = reset_control_assert(qmp->nocsr_reset);
-	if (ret) {
-		dev_err(qmp->dev, "no-csr reset assert failed\n");
-		goto err_assert_reset;
-	}
+	if (!skip_reset) {
+		ret = reset_control_assert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset assert failed\n");
+			goto err_assert_reset;
+		}
 
-	usleep_range(200, 300);
+		usleep_range(200, 300);
+	}
 
 	if (!qmp->skip_init) {
 		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
@@ -4823,8 +4829,11 @@ static int qmp_pcie_power_on(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *status;
 	unsigned int mask, val;
+	bool skip_reset;
 	int ret;
 
+	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
+							    cfg->phy_status);
 	/*
 	 * Write CSR register for PHY that doesn't support no_csr reset or has not
 	 * been initialized.
@@ -4848,10 +4857,12 @@ static int qmp_pcie_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(qmp->nocsr_reset);
-	if (ret) {
-		dev_err(qmp->dev, "no-csr reset deassert failed\n");
-		goto err_disable_pipe_clk;
+	if (!skip_reset) {
+		ret = reset_control_deassert(qmp->nocsr_reset);
+		if (ret) {
+			dev_err(qmp->dev, "no-csr reset deassert failed\n");
+			goto err_disable_pipe_clk;
+		}
 	}
 
 	if (qmp->skip_init)

-- 
2.34.1


