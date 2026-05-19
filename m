Return-Path: <linux-arm-msm+bounces-108324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNlLL7j5C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:48:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A025778EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A386304875A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A9334F479;
	Tue, 19 May 2026 05:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFmMaIpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ojx2aUsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABDA34DB6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169647; cv=none; b=DTkVf2zVLn5WfMDiPNiy5ByI8FZcqZciwvZkgJTX+9BvzP4ssW7PnBpWBmEyMF4pUfuYz4n91C+rS7NQ7TMx2p+kVQhrD4dr9mCC+sSq0eaM5yb9QKgiwCYdEcMbhKwFnr58KjP08eL5LFfXq1IXoqmlKTgpvO6/OFFo+S0FyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169647; c=relaxed/simple;
	bh=0SfbZYNjk789aGYvSOXe+aw7DeVeyc7Kx10vw0KqrQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0qsBc2/t/Qbtt8XoppI9Pvk7MiPBbhSjq8+hGNwfaUA/tJPXxPJgkRhz67z6TPhNYV3OdLtRgXLmWedmvg5vdaZfdt47aY7eiY3s/LPzftO+EFDa++p9hoTRpmdYaI6s5W6Kfc7621IbfhzQOQ0xUqnrN2FqZTZ4EXIw/lXSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFmMaIpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ojx2aUsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ILVX5Q2892697
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=; b=TFmMaIpgIHCHlj76
	I0rUJqlAyXopxTRYDAEq5fKY0sFK6UewYqji5/nPpx299GNXsqYq+E0oKtXUMa/6
	Vx/NOv4nBb7p1RH/BT0JVke0kaywynB4o1kr30DqV5Vew0MzE9Ux5j0oCbARzY1A
	07uHuvfIq2GonIkALsyhpU/5dJqsltqRI0l9dNpXo2T9vXylBw0cfOyd39kvlruK
	ef3kAzailOmypjGuroSYTlyVSSmL2e7FnPmEE0JLsAcSq4C5bjo2Xxv3MElnKGbl
	UbfcVx4yxAncwEglHUUs4+OFuKr9O9III6e4gMxImlJqDnTlVzl04Y+TqCaLZEi5
	5gXYBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1ckvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6106931eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169644; x=1779774444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=;
        b=Ojx2aUsfMaEQFjGlCjV9Iedk1Z5WRaXB7iIgpaOHcLFR3jiHUq6COS2bfLhTcUIvcL
         vG3UfGuEjPEpimJROyKm+yopTB7aFa6E49NeUwPwJhMjfSTydVk6VyOteYRH6W9x41uU
         jWC5iCaRoUK2MJ82oY8jNZBoFDhEJuJL3SLdejuNNJ3d78JK58vmJ0b2VqqN/ugPTcYv
         cbNBDTx8wZ4KyDBevSUhV73tlVf3nh2GStJldcO3wF7OJK6zqunIYP/CKpdx+uNPC1yz
         QohV8bQXCmVUC6cDnjUS1lRfdqWkqTL/up7kRVFAJ0dLH/v1dAu/fdZ0D90gZoYJ7ckN
         GM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169644; x=1779774444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtTEoJrQ863EpCklHl4K1iMrE0nExfGouoieBxC+FJQ=;
        b=BQ6msN9vt9teUcdjq89VZJ7bTd+0Zw9N7vhgPKLWrgcJUqi8C4MSknDBa/v/QRCZXN
         l7G6xoyg/UaiyakmEaT6VYLEXKbs0KmFOTepIKPmAMyylhhxqFOtKeu4+c7fG05YE10M
         q0PmmCWZaO4NzwxtmNFZOrwhmRhAUxwlj0RpX3JazoIgIrizWvEnDAjn1v2a4Ssebji1
         f5bZGtk8ANfxwSb59x4PB6jRS5fbADWVlmvGFjGuol/b7U1NSEHed4e3Q4Ee2dItpCiH
         PaVW3UFNjowXaPWAibvAK6e36UKPpZzCFJbgO3ngYQrs/042DasQSGDhiZ09OM3gFLom
         WNvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/f2NUXj1N2lkAHx+5/bR3Yplgz/Cu+nftT0KdIlHiufF9wNejJi9sSWOWRqxcloWR8ZFef/ivQIcB+6XJP@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbJmuvNmy9H7QCa208Yd9HFYOwmqqQo5Zx76ZUNePZT6V0+rW
	ST3diuZp1n5VN1TIQVQpsZ+EZQxE0m9yK+Q7wLcT+LW3NWPN9pB8relPuPJrwL780fA8K6AkulD
	9TGkoYTjs9nDX3H+nqUWnTelG8LD3JmmkRdJikIg6UcMQl4axYaM1v2VI4Trh/2MZdy3s
X-Gm-Gg: Acq92OFvFYeXXV6odJxLanVVpYRi/SdjR1QXcdkp+SLFp6+LJfx/yyOB7lGA9P81pdd
	+nzFIFjnSdcGUuxOwY9GvOq1omHWApForb6B0w2JJiBe9OPCgwW2dPGa9WijWn/lM3q2QeO2zLR
	kbRpLJMWBDskpDf6W5Eb1zDwfnrKOZ7NLl/1nWhbEztqIIBTemIQL0MwwC8g3leRotxi9z28/lY
	xo7l0PpFbX6uliRDyCuRwL8NTS83zNUWqPkcYZvW1pbbkj0I5RMoRUNU1k9amm/mSw7PhlyQzmI
	vPaG2FAiIyEFhsT58+HcYs7m1g/K0TRB+xB+r1f1vUoskamxfAjlT//a0D5ic4ThHrEhXZ9LyYr
	jyU9z9Qi0LUUjKR1GilFldNLFn77opk3pmid8yNgXj9IqxNrHe6BKwm8sgxg0y7Dtaaan7JstVZ
	QN1k8=
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr6840959eec.9.1779169644400;
        Mon, 18 May 2026 22:47:24 -0700 (PDT)
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr6840937eec.9.1779169643852;
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:23 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:14 -0700
Subject: [PATCH RFC v4 3/9] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-3-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=2515;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0SfbZYNjk789aGYvSOXe+aw7DeVeyc7Kx10vw0KqrQw=;
 b=BO2RmfNFHbFIq1KEG1dO+4zWeOtGTTNbu/g4DipyMdJHGlwMB3onbNYR2YE0WyW5uigCUblZp
 mF6GK6wBoVLDmAnjOHt5c1QsCtCGbDlQ6NZBx1r0rE0ZjBjpKqDDYUp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: fJfePi-k9vgYpkucXRHN6ghp_IY9iYAo
X-Proofpoint-ORIG-GUID: fJfePi-k9vgYpkucXRHN6ghp_IY9iYAo
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bf96d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX5Z0OafI043fn
 QfpyX70KEC39DfKeafogbNYrgncdyW8Oi10H27TcQWMqmsj7vFP2G+cE2HumIww3TQhkFSNx8Eh
 p9FR+JzDJW9GaP2zEI2LgOYCJnxxV68veUD66yfAcdNiQ3SgBuDC7E4ZQx7FrQJQ6FkC+4gdOFG
 2WNBbw/j/gqqXOR7ENYxNlRppPRfnHgA9WD0U1l3AFxAWbuTuHsxTbK8TyitLyGnzDX6lvIX0tk
 SmSZ4IPfiOLHXIgFUgJuxiFD7ahzSlCBYhtPNtPjOvX2Ht8xpfvVVXcVcGN/EO1m3vI+QK4TOfc
 mYM2AjYQ+VD7HL8XRF/R3OqtX4ON1oI7iMsJLnCD2dTfqAtSLCu5+Wwmr4nwBPY6FQJveajTZ4e
 OdbCorUbYN9KqDkj4Vqy/e/7fTKLcoPUIPYDb9OB6o31tW90aucV2+vW3/oUOUECCBbJYaNq6XV
 C3npy/GJXOU5FEs5vow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108324-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41A025778EA
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
index 75afbd15aaf4..832b5d93105b 100644
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


