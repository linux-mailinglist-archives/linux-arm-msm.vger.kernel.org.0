Return-Path: <linux-arm-msm+bounces-109064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HWMJIsJD2oHEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:32:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495A5A5DB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4F10337AADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC663D88E9;
	Thu, 21 May 2026 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTzGK+53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD7HjLBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C233D6CC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368232; cv=none; b=A4+nt7+GQVFUEFXfQeF6UMobVOqB25uYT32Ryk8HCcHNKPFOxhF7hfv/0SgEPMREqjWPs6eQ6GV/tux1z+hgcggAaUr/IgBLYvCtzMdwquu1H1T3M267gKud83AA3wIJTShyqDcDrsOFacF97OrZRXtBlwA6inVWYugjiDMIy/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368232; c=relaxed/simple;
	bh=yPovg+NF82r2PTFn5jJ23qnB94f0op4A4x75FCu5p2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gw6KKqv/pjP7j2vW0vQhQUhLzTVprNgCQS8CCw6nxq2VdhNe3aOEKZJz1nhB8xAPvrEWOkn+LkTVi9w+qyLa7n0GNtwnc4P/VEuTYp6upi/MjrtuCZEvq/O9joJcqWj6eRcSvM7En3+d+lWajkqSYhTvOyIho/ZZ+/+XlqyuUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTzGK+53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD7HjLBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kwn3527682
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaF1DDc6ubWUrA0leEh9fmSU9s3FEthmlcwUOHBpY60=; b=jTzGK+53vZy+fALu
	XH/4BIMUCsYaOxLobAdl5lLyJ/LroLUyArodCX0XDM61C23KUlSBAOBK+z6YU/Ek
	XM10W83SnfGSxRe6XpQWhhsWvOc63YDnIcaSQAktozqv+iDPQtVjkULOlXPbp8+6
	bYj0+0jj1LNq+kSGzxa1ILlqBpkjVlU+4JrDR8LmKDxwSZK6NlukHlKhBug3YjcV
	JxfXQmWLRx2USK2MbV/N9/TuHT8hP9+8aKpRyAN/aGNJxNQwxWu/FHr1hLIAoKvA
	VRIzXdvmjIGAXX6e6mScsH2CIVvk4j8qx1rL4m9bJN0i3pqTUF7CU1El+ZP8WePv
	hvN5kQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhn2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828acf7c1dso9639114a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368229; x=1779973029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaF1DDc6ubWUrA0leEh9fmSU9s3FEthmlcwUOHBpY60=;
        b=XD7HjLBLjdYXZPpr90w2CAi9Ho468ZdoElciPzbhdrTs4sSPKfyNmc+tGrD6vNwDDg
         1UsLLJgitFzv3c1qELCpp+O1ai5iv6TWwVDVDUvbEQf8lnIOYLNCCZz9RjphsQPvOY4J
         f5Sdm1ZUnMp0hGLPdal6MQkR1mm347NsoYLTvRZqEVu/n3M3XxEPLu/DrktzBhMkI0d7
         K2+J3khLKBgUV3tD6AxItU4DQx4sgg8mKvdtva68VITcMXaUqs2ykrNnMev3l+xVMsII
         EETabeLnKS/zs7JzTMHS4xqOSeToI17w233il/1BDs4/BlIjB2HIZLlopXi50hKW98MD
         K6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368229; x=1779973029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaF1DDc6ubWUrA0leEh9fmSU9s3FEthmlcwUOHBpY60=;
        b=DP0d/hpNNXs8D7Lf5R6Hou9aj8a5st4BVK1xpmupbeBDbXiZlUZf2D53iDkW8Uwor9
         7TWhBe8GImEb/LOE00G9HrhkgpG9AoG02l84IIyoxxK9gPAZCSpk0ugJUBl30fpcMCk/
         i9JPrcJ6zoEL07ziyjc9EF6JaID6A/VQvCM1ZP8GOko4U7Cl8z3KKjo6wiFpef0B4NCB
         /4LhD5O4B1AaHj11L4pia81Uoz2yx4z0xVVrmCr0sAMhR8C3Aw70q0mhxKtyF1BwAAAk
         Eu5lWmwcUGz29oA5x1JA0ACC+bjsr20Qb93iQel4DM03nERrxBDi0S2ncpuGgpjBKSmj
         bWvw==
X-Gm-Message-State: AOJu0YyL24p2/Q1Hl9LEdUHkIB4cLweW/cZpudgW3hdvb6BClLKSM897
	xw0p1IqJHM/Wk1izyWpLWGIE8u743vGIm8mQ4j2OIxO5XHLmG2FcYFGELBZCEicB1jJpBArlRrl
	134ahk3Y0lj3DajwETKVNZsCMvjvM0CGt4KIo1VL4BDrWdFmoVcZ7bEahZNHp3vuA9iQk
X-Gm-Gg: Acq92OEg5VtmvQwE6GbpWeBVc24gZiLCupQefldi6LMj6hItpN4DIfJgr64gYOfGfNj
	YaXbFC/ddMn40y2BC8sF6TOwg0pc6Ftus9NvzHULIpd6ps40RjbZA1ESA3oPH4cpSDqT5zSHv6f
	oCYkJ8UnCerESFSRmVEWKE9MfUUEpn4VlYzRs/2N+LOpRCZhzW3YSXtaHTeNhFTRmble0ShO2RQ
	rz3fqF6xP5sAQXfe322We04YnCJhti2KYqR8R98y3tR/LZI08YdyVO1wVjLIMMz16x6Bx3/SSM+
	BWHIK6HlKLsqR64CfRA3zQjo1Hb7TYolfexM3dss4528g9KUyvNvP7QG06YcVHzQkEqAXqURtHm
	EcRTJZAkPpY9N34CKS+ffgIABjIzDeiZpgrOmSBX9bRrfICEbD0yJzXX2
X-Received: by 2002:a05:6a20:e293:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b30878f3efmr3393720637.25.1779368228902;
        Thu, 21 May 2026 05:57:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39f:3efb:e888 with SMTP id adf61e73a8af0-3b30878f3efmr3393672637.25.1779368228395;
        Thu, 21 May 2026 05:57:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f508bsm357984a12.20.2026.05.21.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:57:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:26:34 +0530
Subject: [PATCH v2 2/4] PCI: qcom: Keep PERST# GPIO state as-is during
 probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-link_retain-v2-2-08ed448b081c@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368212; l=1719;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yPovg+NF82r2PTFn5jJ23qnB94f0op4A4x75FCu5p2w=;
 b=UJOfMHyj8g6i+MjsTcuZrBZlxT3uum2fmETZmxbR8XciABJyMNU67dRa29dfz4/uZK12B4lqE
 F9bA502GmjGDVBY9dJ5lNDEjRcrWR+pt+aNRq6HqdlZ8WuvWDhFPGCd
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMCBTYWx0ZWRfX+sR59xJOe2Ga
 WDsR7AzversxpMWLo2dp6oi0RnM1j2szsuh5zPGdlxRT78qNnb+YIwA7VIb18C7a/w5r5hnvvkm
 FuMDXhhSqWz0CLuW6kSaa79PrPVG8tl4E1H68IZuOUkjoJiqLuFUzoFKI3Ze5UUP9+HZfbwWALl
 NGUXqkgQkman4jM7cLs+dAbSoY48Cxjmb2czR0W5LjaebUbu6FOiIllh3QdlmDkT3OV5foqQm7A
 I+lR7CN673N5kT3IX+bEfYKw7JMBz1Br5xngEGOluMKzUawerr4RpSKlFm5LKOdu2wiVPGu2RLQ
 QNDmnzp8xLa7OyAtCjmrj2xphLS4oye3dYeW3JHKFVvClYnx27O7oaEZqgTKiKshBVZwlMHFT4O
 VaCOeE8RQuJqTfw2pN8mhATFGYWbDIhrnWc/WNGoODnnzud+5QXlFgcgv9Lxx2lqKSxLU1hBB2+
 u1qqZfvomZj45Gvv43g==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f0126 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: T2tx46U19jltDU_WvDRfQhpILwCV9qdC
X-Proofpoint-ORIG-GUID: T2tx46U19jltDU_WvDRfQhpILwCV9qdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109064-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2495A5A5DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PERST# signal is used to reset PCIe devices. Requesting the GPIO with
GPIOD_OUT_HIGH forces the line high during probe, which can unintentionally
assert reset on devices already out of reset and break proper link
sequencing.

Change the request to use GPIOD_ASIS so the driver preserves the existing
GPIO state configured by the bootloader or firmware. This allows platforms
that manage PERST# externally to maintain correct reset sequencing. PERST#
is asserted explicitly later during qcom_pcie_host_init(), so forcing it
high at probe time is unnecessary.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..bfe873cbf44f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1707,7 +1707,7 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 		goto parse_child_node;
 
 	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(np), "reset",
-				      GPIOD_OUT_HIGH, "PERST#");
+				      GPIOD_ASIS, "PERST#");
 	if (IS_ERR(reset)) {
 		/*
 		 * FIXME: GPIOLIB currently supports exclusive GPIO access only.
@@ -1812,7 +1812,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
-	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
+	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_ASIS);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 

-- 
2.34.1


