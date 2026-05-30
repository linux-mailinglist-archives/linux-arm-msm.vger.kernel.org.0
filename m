Return-Path: <linux-arm-msm+bounces-110413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8InLN6IuG2qU/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33561227B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D3AF307F2B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5F53CE0A4;
	Sat, 30 May 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCMAEMqD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIAXzYPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DFF282F23
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165728; cv=none; b=fXeFMJUX0P/ogKKtpXycJs8gO9/wbpQ0o5dZ2EYzI5vVtQjgcvp+cJXY9SJKb2qDgaA/7T2cy+qXjkuIrX9lOSUwK7k7cv4D+AXWKpn3nj+2+cLaf0XPaLiBc3e304dY156Psekmrfuozjw21qxJCGCgcLtdJucxhRjUiNkzv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165728; c=relaxed/simple;
	bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDzNq2dGV3aaVaqv8e0ORx76EAQ+t67EsKnw/HpXTsWnj56gMu8E6LfxiNErYUH+equYzmRdnefSQ0HXW+/Q18Uqz1J2w/OzuRDM+ajD/tJyiQzxTSLjUEYzPZhBPunr52MJDhNIew8a13Jz7cuxX0GlN5of/kC0ram94HvcT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCMAEMqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIAXzYPj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOmcY211792
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=; b=LCMAEMqDn65Lw2Uu
	5C12nK9JjynGhavVcjoCcDQx8hZzJtKTKsuGr5QBuM8/cqXsMDAcBpi/JGI/WCF4
	zsZNbyn0ByY+6jrvFBz31wKX/DEc37nZ8QUgk5yXU9bX2+lMYVFgzFLzA/zkvlaR
	Cw25uXztEBg7WJ+GbXYZ/HPFhanXEt7NbkdlYL3h7NVOpwj4JgpU/9CTE2AcBk7Z
	9bncQZDcvfxP5kGyhW45H4AV8VJ/+DNQNX3dOV3pnDnxPdt789hH0hCHocyo52Nk
	uXLbWDWOToB6/Vx23aGSF+Tzq8r303VLRndVKJIBrwJETH+0n1uNsq3aAqO4lq+o
	gFUOpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrnc9nm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso22625015ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165726; x=1780770526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=RIAXzYPjm5t8X0K4Bhsxb6hwjmZAlAevnYzYItvUktdGVVsIyUFXYn9YHkL+6IyjGb
         kYjTHeFEI7m+BQUagzfPyhxjbvPw7hIq9BD+Q6kM6mHpP0qbvWLugHgCqPA0F4dnSJZz
         oIP7yM/s/6TU+sIR2BX/W7oRL900ooznj+GD+tj4t1+0GXzXMCwCSEeziHfJst2Vf1yG
         qBFU8SyTqJBCw8llYECDfmzIAeoEalEHaDN/G271ylX8cpvDbPGORX6GAfl/elc5gBGB
         1VkexN8f9C2w5VhqjkFepZeXYZFF8f56HfV8foYVmRRnsZ00jhs8dYYis5mOfb14k6RE
         x7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165726; x=1780770526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=Dk0JB7J1gA3fI8zNnjFVYD69qg81JZjQAWc9i3cf2aNWraUDcLMld3CSV12uJK2edk
         gHEQFLN2Jrfy7KFiEJelSY6XCwz7zgc91FAiqb3vgjtprBRZOOQZs7tG66KaJPPhxEx2
         QrlVKGqEgp+s0yulsvGFbP0JmEsl6QOJBCXZQVe3jtvdgk2nLD6UgOrVl+mjvL018qig
         6OxOBmAVsyAAW7SyRUbE5Vd54kV/rE0XF5fUMaqiGKwXsPog9Q76mJZPKnQhSrfc4y6u
         7E+du0MB1vVeXMOOsa9yy3KgdQ1y1EeV2clLMr1qcD+J3t8lKWU9LnIRzHHi+QZkyrqN
         8/pg==
X-Gm-Message-State: AOJu0YxyruegVHgeQUQD2qJcuOzrn1NdWL/JF8Yl2StfFGlvh8L1JCYk
	kVWPtOF75Gf9BfWzekazWAHu7FBjC3mCwNBpU58MWtJXck30sb+vgPbNMRzAhTPC0x6XyGvNsni
	DOJlJ4NSDLT7mzDApeNRU3+qllfEaLrnoyUa2p2IG3ZnvrESzFmrXbSMioruB7dXR2+b3
X-Gm-Gg: Acq92OGE5x5fyMu7qax6WZL/XN6NmsIoSMy6N9r/Mp5V2End84bIkzNr9F3YI7E/x/C
	IdqzKx0uo0ZCtUMHGxPLlLcd/CK1yUcj4zcnZA1sp512J2dxtrALCr4sozKf2H7r7IEgw3UEoDC
	iHxTlxK7Pa9DEbA7XZErh6/1yBfaLbu3gDp31lOe6xiaYTsZ8CVjnMl6YjyJSjaNCbhZ+90fqsx
	MobepNJYchIuRz5qi9sDSekTVcvUcuOw5UPDkDRjTJyeNL3SmkJ7xyMcnEkRPNAExcyaNasJxTA
	ouVjENnzYrhI03TB7dyHH/+XIJi51CIddccIxxTm3iRtUjWhXDLbnvXd4SjbZJiNLkWLcF56sUw
	8/bXHwvup8gj595z1lk6hAT/wS5WqJeJpAELKQE85YKE1QRywr8pcXSepion8arLeVw==
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr409665ad.37.1780165726243;
        Sat, 30 May 2026 11:28:46 -0700 (PDT)
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr409435ad.37.1780165725616;
        Sat, 30 May 2026 11:28:45 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:45 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:24 +0530
Subject: [PATCH v2 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-2-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2636;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
 b=voDxlLutIN6+40mic0eO9qaR/zPZGz1TZBw7zkWz5anDER4KGLCy5Q4rtAloZPAXl3KnaFiwU
 UAS85ssC7BgCYNdBqAf/7fBTeMRPoqiLnssi30yj3MkJ5ERBSLd4M7r
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: JIImEc6MZckR4587mv8BtbSW2-S-upbQ
X-Proofpoint-ORIG-GUID: JIImEc6MZckR4587mv8BtbSW2-S-upbQ
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1b2c5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXw+pgDBC1P9mc
 dz3q3n3/0Qj7Q1nT8JWCmVTNUPXiir5tvDhp1JLC8K4sO7uE1ocPSn4hBvAVZmi9GD//3yp97pJ
 Y1XQY71KST4vkb+GCMwol3itlupPdNxaevbDotL1J1hHgOOZqaUXxMd7eI54cLhcDBvonWsaEqn
 hIybbyYbIWqn27MN6qgmLNJZ45Bvt7JgHO3GiQ9WmEtzUd8XarIUXfukP2T5Tvu5f0HhVFGsld1
 dHyIxZsOi7ZY3muSio3a87wUwr60/v40Ob6C5axi23rtvJGfsBj/EJ6IWdqOxdflrLEECPaULxT
 53rZe8GTKohAB0ocLjj2hmeWZpBOHMVw64rF1smH033XaxuBA+PVMrX0pPmdI9BmtJMjaRNYuad
 EX3JfSy1MqSSkH8KwaqM00xnchulF5/gYfXK46JGDG9P/Pjls9Bc/sxcVk1i8jkLjGydxDlTnya
 SNsaPoLSHEwplPP3brA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110413-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B33561227B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a04cdc1e5ad4..333216df922e 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1034,7 +1034,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1049,10 +1048,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	if (device_property_read_bool(dev, "spi-slave"))
 		spi = devm_spi_alloc_target(dev, sizeof(*mas));
 	else
@@ -1068,17 +1063,10 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.dev = dev;
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
-	mas->se.clk = clk;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	ret = geni_se_resources_init(&mas->se);
 	if (ret)
 		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
 
 	spi->bus_num = -1;
 	spi->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP | SPI_CS_HIGH;
@@ -1104,24 +1092,12 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (spi->target)
 		spi->target_abort = spi_geni_target_abort;
 
-	ret = geni_icc_get(&mas->se, NULL);
-	if (ret)
-		return ret;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* Set the bus quota to a reasonable value for register access */
-	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
-	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	ret = geni_icc_set_bw(&mas->se);
-	if (ret)
-		return ret;
-
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;

-- 
2.34.1


