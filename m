Return-Path: <linux-arm-msm+bounces-95260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFd5Ftrrp2mWlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:22:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886681FC7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 09:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3E1D301F6A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 08:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACADE390C9D;
	Wed,  4 Mar 2026 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6RxHpPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duuAb1UQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9E39022B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612523; cv=none; b=V97NoPAmsws46MkGiBIk6ZOrwTfmHLd5+EqzbQi48cf4Fu4bYT39xCzYA6CiNINcm8RXs78WAcF+ZWvvOR+s78iysAygInNW74ds7d5SwtZQSLizAjSyhNG8g2pycosw9Z4PmNGOlr8hd89USMsTb23zv5k79nI1fJ29BCdwPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612523; c=relaxed/simple;
	bh=J4iNJP7fooS2FBjy7epanSIk1L/eL4p/+6UyF/qZDag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLtdpRLI24EXFXmSRxYtimUl9oEiF/lmN/V6TtjUSppnjv2Ob/7chHUHA20aFgF88I2fisVjYU5+UZq1HlyuDvjwqw2zwulmBk9mYAvOaKZkFura5zknaGzSfZCDhjyOkSDMWbZR8uno5xXNG2BgHARrlsI6vYH4czVgD6fVAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6RxHpPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duuAb1UQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SORc956992
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 08:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIlZLMHi3cNBVLJWqwerj0OJ6veqEBRgHl80VQQ/teU=; b=K6RxHpPyVlrE/x66
	Cxy3hR5OQqMFjWYo4DMEYlFSbJBdsuz4330BmVy3AtFKiBRoYzwWmBiicc1mnwDu
	rJsTdgZWW5qWCVbFnG4fmq3Fy/ewLcx/I/VEoefdrgPMQb/xUYHOGTmFLpO1kuy9
	9vNtxOBC65cpxTZrhNx9ViQl07GBP0c8UM/NfmMcYaiDwjUMw/yIco8/Dzd9dHR2
	HLco3woVAdlg748FrltbKEnSExVAvVql2NUfNhAFmhmPCQyzU8YKy65iuP+NKZjT
	4JHd32bGqGr1vi/A4KmaofjE/cCBnzcN54WHFIfwVLXFka7pA17eBenLposkrOlA
	JHL0Dw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qga23a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 08:22:01 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c5fde4c7so126395765eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772612520; x=1773217320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIlZLMHi3cNBVLJWqwerj0OJ6veqEBRgHl80VQQ/teU=;
        b=duuAb1UQfmaY2c0kh5kSaZ+1+q53up7xooIPUTTeJVcitHOOJ6b0oFbwPKe1AUz4p2
         e2TTk0j7Va7Op87TZa1/kTnAYcK127dD+gGnea2SmKVjJZKJq4ppgCXgtGo3z5RXXQrm
         hyZj7D5I46mNDDAg2hhTAqsvVWEhzAZ80H/RiEimmZPN8e4JqJJd7VoGRGRw2kONS2NQ
         aKEL/o8nYoZ9/WqvnqVTXFbUw8nRO6eambtI5ywoyql62NLM3aGMveCIaIBmZ98Vj58M
         qykR1Eum4DfaR6NNIdvoAsqye55Ml85/vAsulUQ5aYaJ8A/U6A75vl/LG3K6oVWBppva
         3IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612520; x=1773217320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uIlZLMHi3cNBVLJWqwerj0OJ6veqEBRgHl80VQQ/teU=;
        b=IqOHoL5yZj4IRHxfvGSkLHQeak3fDVPKB5BbqG8r/QH/bWx0oFJWprOXhRoygjFN6w
         ToPGkQiknCW3XTT2mSo02EZHbg/A23+80H5sNk6PB8JJAoVxFrJYCfwtUhxqv3+xc8n3
         VINVDswqj2heWwZkjF2Wm9BdrCq+SQYI0rZFVtiuhF3XyQHpqmJ/Cf+4s+h7oPLbic6Q
         yr6N8JeYFOVkLcjrAYUj6E+lZR2FG1nF9VI8PNfsHdlMU0F1YuZAvgkdvBLJ95pg9USm
         12iR6+lzaYRoh8jGVhwvZRCRZ8Wb7O/Uvl4/0VAONy+Tpr19GV73DmpPCrayEP32+4kX
         u4eg==
X-Gm-Message-State: AOJu0YysNvhhnOqZs9lwYTffVCGSaw5fnwaEUIanqAyJRQHEdEd2OLJ4
	gqmApxPf0JBNA+r/ZEiDDA8I0dYMGJbk1J+Vz+9HAGmNzwJHgdExf7FPy8uu2T3yLwukbAP/ydg
	CY+BMFMnm6Ujlq1LykplwMF73vtdOxML870X9cAokN+keiDTvKMGe+H9qkEBFpOe/IMbB
X-Gm-Gg: ATEYQzw5UHxwxTKPJXstp5QjYOl/vzX+c+0dAhwTccMNi7JUp5+Jw3vG+usKjw23/js
	hu0qIQacwj9EAknJ4Q/V4tXF7cXahdAfGGN8QfXcTAfLhB84xd1UZSMCbj7ljRwSBbvJ2eOrPee
	IqiMtMQ/8lAmajrLOOaVPQfNxXVmYQcf1XJAEhLt8XGHB8NSjNImYaM3QWusOthOjI954RYNlHh
	Al7iuWPbGI9cXisIcEk2Uif/5fi8sHMH6Ds7HLFJYtH0rNQy06TTK4W2nAvykvByX6RCRimcjH8
	9uJxH8PmfnkyBm2IvTI1eKWZCfEB/WPdTTL1zJUoOOXCtrJ7IB8ODtC1ojTR97RuEcobLQwngQM
	oXNx8obSGKC/VbKOhINXrZ+ECr+cjMFj4/ReweYziKqaijkBd7Go/kXBUub1GWIYZjX3I
X-Received: by 2002:a05:6820:228e:b0:663:364:674f with SMTP id 006d021491bc7-67b176e9755mr800757eaf.1.1772612520494;
        Wed, 04 Mar 2026 00:22:00 -0800 (PST)
X-Received: by 2002:a05:6820:228e:b0:663:364:674f with SMTP id 006d021491bc7-67b176e9755mr800749eaf.1.1772612520151;
        Wed, 04 Mar 2026 00:22:00 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d9absm18006952fac.16.2026.03.04.00.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:21:59 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 00:21:56 -0800
Subject: [PATCH 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
In-Reply-To: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772612517; l=2482;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=J4iNJP7fooS2FBjy7epanSIk1L/eL4p/+6UyF/qZDag=;
 b=hXW7/3qZDw8ZcuCNj5DNMwpqd5gvzLVpDYhDMMiUziMx8Ux6j2NnYe10xoZtSisok7Uy9UoMu
 RzCC64PxoX0D2heExusm2P62gAB7wKXzv/jEJ9PDGpPsyaZSX4jt47u
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NCBTYWx0ZWRfX/BscGdsbncI3
 8dEplGw5k1QDgHcFf3/QV+Z5R3qvQ06llLHxQX0uQnac7NWneS+JjHGKEYWmNngxOal/LVO1KnY
 EbfEfFiU5ijujsJsVFWye1fiSr5jZcX70sEOXKijCnc7j9cKA1RX29jJSrqxwCdCptwjCMMEukd
 6nm8CLmZ/a9l+2oI8APv6KeVh0L+s1BNFawU9DZOwUcQtzKSBW5NBbPmirsr4XdYUsNU3WuhaHT
 tO+P3yfA/sH6UBcCddH2XCwYwZCn17G5PD6YVrqRSpaE3AQQwgIUSNM5xNhnnBpj0cdmEzv2qRb
 ioySkC1OZmGtHi4Xj0FaSWljraRBjsyh575955IlzGH+n09p7KIQI1kFnAO6VCSfRsKqjl9moxs
 LotADThJJ/JkMUUulIH1Dkx/Ca2F1RGKKFp7u7oro13lHtTXJb5yHKJcsKdZRv9Midh2izq49/z
 blnNyc4/9zNamtPS0Tw==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a7eba9 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eu5IZVYEi8O4nexjJlAA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: UCOo5EXhZ4X3xB0cw396XpjLuZo_w5Jb
X-Proofpoint-GUID: UCOo5EXhZ4X3xB0cw396XpjLuZo_w5Jb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040064
X-Rspamd-Queue-Id: 886681FC7DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95260-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb31108d51f88d34f3379c7744681f485..7369c291be51aa1ad7a330459dcb857f5a1988f6 100644
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
@@ -3334,6 +3335,8 @@ struct qmp_pcie {
 
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_fixed_rate aux_clk_fixed;
+
+	struct dev_pm_domain_list *pd_list;
 };
 
 static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
@@ -5348,6 +5351,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
 	WARN_ON_ONCE(!qmp->cfg->phy_status);
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &qmp->pd_list);
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


