Return-Path: <linux-arm-msm+bounces-102875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DYMOrqM3GkhSwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF313E7C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A46BA301ABBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819DC39281E;
	Mon, 13 Apr 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwksyroC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxrIxxB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F5A3921C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061583; cv=none; b=QTvJGp5EPe6x8UxXs0BaHfMGgUN1L7OnAwqE6KPaZRnfWLd0xI5cEK68sRptYxArQ/W+R7QLWdpgNzMwPsYtBN6l6stO0KLFkZUjCCGTHcyAHbjtlHwMJqtH9OFw/IZkXylLldwgWtvRBm4H0NI8SOwWAmcgCNuDQmu8ZUHaQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061583; c=relaxed/simple;
	bh=WuxD6kGdL+V30CDieIdjcJTNov5dAUcLLKr/2N6fJU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5EAeXCkinx94mFkME54aaF4AsYC4VU5sigN24r5MNr+irgzvXg6OYGjwuf6nAA6nnw+s03VrILWvNANCqb8Eg+SrFkx79gGLgudPrlHnmLZyybaZk+TCwAWuSnhbJUd24dJB3jz7JOtwc/T0xZWXtEKcqdL8yPb+t7drlV6MlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwksyroC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxrIxxB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5wHbF2782267
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=; b=VwksyroCd/hL84vz
	r9VH6GJsr+u4eyUE4i4TV7xJGRmI6xmDcgKKGRoOd2QG0ZjbSpjywjsBEzSvei/T
	8ioW2NL7yyeiChKOQIXAeKUbVsZXiunAYIDNxhhEDpLTD9CeXqqGjY3QQHFLpaCa
	HH0Uy3IbRx/xIw1ncn79AE/QTXeNAOD8gHmnwnhOYyJ2zzKN0zJufBTabrKw8mm1
	ru43pPelq+rldv2dabI3L6pB84TmG4fxHxK2tTL1CN0aIPYgIqKv9m2Lhd09+gl4
	n1mKcIjcjpODX1YGyNvUN4CrwRu6XiK8tZB/4N8rhz/xPk3CX8uhERnPxEyOYZ20
	BHJPag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpbr9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 06:26:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso874957eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 23:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776061581; x=1776666381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=;
        b=IxrIxxB9Im0ZjORs1LqYgW6JxBoHQeS1HgGcgcjlzAkhiSkrU2I7YyrticYLrqlACX
         E7mn0wKKy0HegZyyEGxfb5xZFIXammhEJ6/jYa8mSli1eUzatLR/sBvleAPsHpncrYqD
         A1qFEmyhsAPwARMhqOBF1Pg4u2fCqiUbvjFU76HnBBDQSE9mFdpPtP9DucGKOg/qKmlg
         RxwYZTJp4aLkL6kfmj+yIZXOc48zDkY5O70dTOvypWpycwbkMtAAdqO51uNUDWeNAp9O
         XWFvme4EP6lN8k2P1WLqwpsdOVRnmZ9ddF70qhJhXNRp4QGm/T2r8VQNGna8rAcPdyLN
         nhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061581; x=1776666381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Le29xCZV1ZgyaYyiM/bMz3/EFr3qGhovELMUCsNM1sE=;
        b=eYPJcPFmHhOq37p2ppMWlaBAWuw1u5rs68aKajQIrx4wlKHe2oA6NB4A7+PK8kUY/N
         OZ/eJPyclR/SpehDuIupctYMQobdMN0zQnRAwJHldam0NzCzVV/735q1N+1BBIEKM9Ft
         T8LLtxPOzajkV8tdIKSzVk/6t4KJGXlpXeCWtejwnkg1769zA4eMpu9SEQ5EuaQ08T3a
         EfEO0qfgp2vro07XfpDEqK+69Fl6kluf+ECNmQyN5So7OQviH+HsZWt/xoY6Q+mg2kN8
         VbzM23NFaXBMvKwIxUsA+pGLkmon5lF3CqcO3gXKrQJMrn8MvkFWH2hwDhtZk2sXrzJO
         pY8g==
X-Gm-Message-State: AOJu0Yxr2XbEYLBr+gzgO/YmOJJ+y2bJphh+wEjyl0t8Ik/VsuSEjBWL
	LUWIph7OlwUSaQgN24bkDJs/C7OwryVxTIrzonlGOZjOVhk2Ivg1TyJcOXL2bzHhB9p+QuhuXpZ
	kJajcnc6sU1nD8ur4Neb+GGIb+PxJSybrQcebxg7ptbVBDmfHfsc0CkbzhQ+HbnVFIYIB
X-Gm-Gg: AeBDieupaIB4SXfe0PVreJYn2fHtdCWvSgEnzAuSkZ3KNd6eZFn9Xq7Z14NKvtdzPsd
	HOqNN3PatZbF4eZskCTs3C7EtAINaSpIMnz8P/E6Se0mYmKiKaJ2q0bceeTUMos2OIWxpUPAcAh
	Cvo3jaGcw6mv5njtez7naHxCwX9kSt9jxOOZ2T+JPRS2kZ/psOVWdeIhN0jsZmyZmBbFKWNaVkd
	GIZlBP5uKupZvwksaCZpDMExZCKVhqkjMLldvpwUjyQzDIVtaFR10Tiq+LPQ9noO/HG656A6oBK
	PcgbCKffqd0vQt6K8T4kINK2x3JSwvNPZycvHNQ4e7tild+EGwfmJcysv9J20qSmzv39O1KY+Hv
	T9Ud3afrqQ1EI5U0SzR1XDbYWn+bap82DcxNQFUdw8Koz+PzRST6w3OpDD3bt9zvGmpNZ
X-Received: by 2002:a05:7300:220d:b0:2c1:6676:5ed6 with SMTP id 5a478bee46e88-2d589669863mr5936246eec.25.1776061580853;
        Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
X-Received: by 2002:a05:7300:220d:b0:2c1:6676:5ed6 with SMTP id 5a478bee46e88-2d589669863mr5936224eec.25.1776061580282;
        Sun, 12 Apr 2026 23:26:20 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm15260935eec.14.2026.04.12.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 23:26:19 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 23:25:57 -0700
Subject: [PATCH v3 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-glymur_gen5x8_phy_0413-v3-2-affcebc16b8b@oss.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
In-Reply-To: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776061577; l=2571;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WuxD6kGdL+V30CDieIdjcJTNov5dAUcLLKr/2N6fJU4=;
 b=oIeAAqEG9SEUZcNaYwhRdKHtYtS+diUCf/WWHL1ZhagoSPXt4BK35q/TEcJmwzjJWYyfJOvuO
 R/LkzvwtIECDN9YfRwvv8LAB50WN4CywYm/PTyFq8z4kB1rhRXMUaJr
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dc8c8d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: pzIkCKCrenGfYmrODmTd6FskVcmmRGmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2MCBTYWx0ZWRfX7Uis8kYVGrSD
 Q/eXsUxfzArgpJ4dH85SUb2OjQrOJx8jLi6S3XzLakEzVshol7XI2cE046YefR5zLVI2YMOcQ0O
 WwsA62CfoM2/+9+M3MyK7JepARg1rgj6hMjQ/A+W72ZJnhiJj0a724BvRYYsDNIBA1XQRwGUFqY
 +fZdZSWHJ3C701ZzivpFDwlQyvmbONSqfrdP7IiWTl7mcsEuZMowRk/7zckOujUEW84NRpYHwiJ
 IXdOoopF4q1bb+j7PVvpbWp3dpB24xtMluvELSdrUg8DQac0V8UbMnDkPa0luHf8EOaDUK054i4
 8nAiOjRLUhdqYdsQ9hTuC+lZtoSV2Bxi6Vy7NXKNbH6DVai9RXFtKfIv6qmLGa7FrKYNTTO06Od
 lRK5MMNDQn0NsHj8QAxn6TjmcScHz5NoFpNUVktfiJFBqmlXwxFXc1xuOeLuW12xEhKZQ+EfFH/
 IpV29OdbzYdYjKApDiQ==
X-Proofpoint-GUID: pzIkCKCrenGfYmrODmTd6FskVcmmRGmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102875-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EF313E7C21
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


