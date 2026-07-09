Return-Path: <linux-arm-msm+bounces-117864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zPsgKx1CT2oWdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8372D408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jZp0taTI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PLWkjz+y;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3F99307E5F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1453D668C;
	Thu,  9 Jul 2026 06:36:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F73D4135
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:35:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578958; cv=none; b=YLJgGU1z7VtKgvsV922I+wPY0Q5Bbizjymyn3zZ95E4m9BPuu4pEX642HMzh5/QwRVRRXXGsZqgOAO7Aurnc+ip2j9UChcbm0voU2Ylb4TDl2f+uRJ0mrOZcLHtDbN1TogWrwQUlBvoaEAaGv8QPgHeSY7cngPtK5TpmsrIEVVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578958; c=relaxed/simple;
	bh=g16SUM+svdptq1GY9X2fXmFPiOxntS0lmdbaXrp6d4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+FD8BTaiRA3yf8ok6kXMwpxzeQMFY6SFEfhMHVq2GIoHY3eWjIwna9AxY3piibBdqsZon3FsRKBHZgTDDN13yirSPl/tCGyavb9Dp7CM6MhcHdT7jThJNowc24KECc9qo/pY1JC/4u8mQNg69Y7GqKgXv8wQvY2VhN/+/qrQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZp0taTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLWkjz+y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xwcs793746
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9gvp4Nx/FKZgEV7jDtb3Va3H+SAOqpQLjFsjmjYSTM=; b=jZp0taTI8QQS4/zI
	IrO8Yrfo0zF0G+0NSvnm55SB/Oez19/oIudWM29kzdhKmoNebtiKKpN6340jBxUt
	r0LT/4h+ozJB+TMB0Sbs2umX1rdvRxVJWbj98ixUeLqYBlR4VeZHlllQ9606ccyT
	GgW2PVrKhmmHyd7eWYk4Qrz330GESGbyj3BloNTzSdIoZ9YiLGibhCGzUKG7E9p3
	S2aR3AXG9a5ToRd4I0X6YgllMZqUdUdQej41GMyeekr1LU2bG8t/qOMaTrQlRott
	L30zWnCqkmskXwBwGtPPITcHZsOgXciphJSIJSubBsX5lebWTw4sDC5rGlLhwMl7
	vipXKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1yds1cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:35:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so2821633a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578954; x=1784183754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9gvp4Nx/FKZgEV7jDtb3Va3H+SAOqpQLjFsjmjYSTM=;
        b=PLWkjz+yytGvs0/00zgWqIj5Ld7sgr49LTdimkj3lOIU9gebsCc/W/E4olZYjdEx2o
         4TNznGybWVrVs+dTxUXOkbGYHJBPmwae0reD+IrfUjeh36xQQN+r9kpT8RUIbhU32azW
         2qhkF9uKKO379r3ANsEBauhdEUGppHuhyJoxszVikzVyYydRi+/11hLRmB7OKvqXSVIk
         2UDAD+DsvdXmOXrALTrmz5FlfVsXGB1yYu7AwoLW1ibfYj/Sx6fVfa0CIvEnHBEA8D3D
         gCh6nCG5MDOofm9euVifENRbqGMkqffL6pZRKPMecu8I4Z6vSz2191OFbY3+hSQoC/LN
         1/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578954; x=1784183754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9gvp4Nx/FKZgEV7jDtb3Va3H+SAOqpQLjFsjmjYSTM=;
        b=ISBhQJo1X+63lLmSp7774ZyPJDOE2Nb+gNemsIajjDGTf2uxJhPM1Mq/b8htnLVwRT
         x1BJu9G8iWb9HnSsUm6lxulCYpMCWJttsaYq/LY6PH+HoM7OpSdnsdz/XVrWdcZ4xCVI
         VmlyHLQwOPjlzUfRNJfvwFoeh4brb2RvLaxUqj9IXzNbsBueZNTy9no/bHzN0sEyFeNV
         ukwV2XPesJnWAcaDh17mUSplhE+DxhCt7qEauRD3bntGLv87pB/giABs05bh1fFk+tI4
         wozhZj5S4a1W7nwdwvJvpnT1OuBR2cqeyHa+jdVIhMHEGutMG5IulU1EvqvYKYV+b6LM
         /Nhg==
X-Gm-Message-State: AOJu0YwSXQbkQdfbXTtRw4Ggd0yvyqd+YP/+6pn2DkKY29ULymaTJkhC
	a6LwJow+2Juvm5jew/6b5ueGj16f9M9hTCo+o/Z8QruJoWtc5BvLp/oTCG0F/Zq2CW53Y9/mF9/
	iZDeGH2W4z83mzXcAtsKielj68fgwZ1TBCIohwElfgm4lUHHsk9CLDzT8PwIUcOLRNs8N
X-Gm-Gg: AfdE7ckFE5+ReC89rDmCJh8xYxv9EcQhx8urAv3bAOWlux/rRukPMmpE/SMhaf8vCjn
	IZ3OnJ2LvlQ5OEKFNgnViUmSc1pEFAoVS3Zi862Sk7Fg39Ty10mm8BLXBIoviPmF3x1y3YmDotE
	NpQpwkL41v9HrBx2TSLHysfmg4SsDM4jNOmUlvccJ6aLaUZ/N282J/igTs2V2s0xTIwDZ4K4AVZ
	gCD2INhDFoWWgXwjstJd0M1vJif0F5IMEEENga07yB0k5MVHWqMiXBGJqjAaZEgteYSgyklmhlO
	e4wUlZ8fsNlY+jqB4BggNso083P8J45VoxjGXJaP+S/E6QRjD1QnKxImAJMIIsUs3AjO9LhUSbQ
	wOjQZghAwK8hdXSjOaxu6WTDGSk4RssGj7h7ffw6ebgFKAA==
X-Received: by 2002:a05:6a21:b8f:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c0bc903035mr7881478637.4.1783578954626;
        Wed, 08 Jul 2026 23:35:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8f:b0:3b4:605c:2163 with SMTP id adf61e73a8af0-3c0bc903035mr7881439637.4.1783578954204;
        Wed, 08 Jul 2026 23:35:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm28304294eec.16.2026.07.08.23.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:35:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:05:19 +0530
Subject: [PATCH v3 4/4] PCI: qcom: enable Link retain logic for Hamoa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-link_retain-v3-4-81a9d187bb61@oss.qualcomm.com>
References: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
In-Reply-To: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578926; l=1463;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=g16SUM+svdptq1GY9X2fXmFPiOxntS0lmdbaXrp6d4Y=;
 b=MkCA8hAkNOGu/Aa2n+KaKo56xPrkug1TB9cr3mL/zfVW64EqSAegfw0mEINPQ8vd4Jb40yDjY
 GJTh77dRo5UCRC8mEhI/1zCePfyL9AVmIMTc87Cz9EePPhUYouTlyZp
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX/2AVlsyCNQyf
 vaFz0t0/iWyRQNFZgFZWGEkrkCDOJtnYG62aG8YqT9mMbmxeMhJIwNlzsHgERqsNmHBjvguqpJk
 gQqJDBSCABxVftQHavhrS+bD2MFTX4o=
X-Proofpoint-ORIG-GUID: sLwpHn6G6Msqvl24kNaqggXFv5a6aeMo
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f414b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: sLwpHn6G6Msqvl24kNaqggXFv5a6aeMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX4eevxYxZ7Q9c
 e1ldNOiT9XIB8R7wQK0A7XxoIYt66tV3ExjDV5IthD5GwWIHAWQ49d/fUqX+EoHKOCIQ6w5+YhF
 efZ4McpnzQXa7hRP8XJZKcqLW2BVSO1V/7PXz9H6yRSSdn1uM760RX1Zg+uwuorm8P2qsBIomIX
 qcTzJBMaUGWIrrkoNYzd8Utc41M1LBNSbpe/7vkG8cTuVqo5Qx+AWwd4g8z5jiAFj9+ZP1R0Inu
 HtGiKmmUPTBFTP2MjS4WsIAwNFuYUPK/HYhaz9K89p/Kgziwtcz4sBJZmOTQDQ6UE9qraXdJbig
 a0afTpSnVg0Ep6G87O/QJAX7u/Y4+OGAemjZegCO1mSPvlD7a+2xNY/5pUj/ZMcD+qV9NHXR9ZO
 6ISsxvwdgXQjdpDRdQ+GuNN/eM9qMtFhAf/aPfxHaF57j05Pnbgl4qLutuF+7v4z0bdQctJeoSm
 1LDuMhXp/ChpP9jL3jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117864-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29C8372D408

The Hamoa platform supports keeping the PCIe link active across
bootloader and kernel handoff. To take advantage of this, introduce a
specific configuration (cfg_x1e80100) with link_retain = true and
update the device match table to use it.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 77d2d989e9da..0b345a16f4cf 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1671,6 +1671,12 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.no_l0s = true,
 };
 
+static const struct qcom_pcie_cfg cfg_x1e80100 = {
+	.ops = &ops_1_21_0,
+	.no_l0s = true,
+	.link_retain = true,
+};
+
 static const struct qcom_pcie_cfg cfg_fw_managed = {
 	.firmware_managed = true,
 };
@@ -2370,7 +2376,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
-	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_x1e80100 },
 	{ }
 };
 

-- 
2.34.1


