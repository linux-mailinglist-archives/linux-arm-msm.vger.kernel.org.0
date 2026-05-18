Return-Path: <linux-arm-msm+bounces-108131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEYuNKDLCmqf8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:19:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398B568926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A36A1303D4F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC743E123A;
	Mon, 18 May 2026 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgV88T92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0e3eg6D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1D3E1CEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092285; cv=none; b=GKGtYnwlL8/m8PfogonDn8mzJ37ZSbxGT0kB8jr7XaM3Zixsdu83eg430Xa+kfG+lczgpzthG/I/XjyZXaoYwI4fdd/QJ+ROtXZf4byDNm7iFPrUdzTLqN7PVNkmo6gQCDTS64J9k+ooDOZV37JtnSZoTvKZV/O495PFYospHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092285; c=relaxed/simple;
	bh=IBdjoJCkldAi1l7W7IesQKsrx4QqX49b2fX1Xw90/IM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EyyxFu067gfdZDIqZrLdGUxzIati1A88Rv13khiT//rNEtvUQ3/Lk1K+OdCj0BPomc6zJKJkj/LucIPpqOnpIE9zEdjQbCft0PH4Ll6YZXaNSN4tfqR9D8ctDBY+Ity8XLPeoc8HidNkhVUW/FXaoWzcMV1CncPt/Te3d6QNJGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgV88T92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0e3eg6D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7TLgP1867294
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5sRVeYMxBRb
	B3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=; b=hgV88T921rDX3qFKn/h07HGkrQD
	cZ+wQe94uSuVeoQ3iMuWY8AND4QnwxrMLzgG+2t0kOqUH0E4J7uUF3k9bijfAkcG
	DZgKfsgtvpzyTMx5vP6dz+cN8Z9CAakxHBxTndDVrjF8vgyadlgK4/ulVc7bSAqP
	IzpbAYvr/vMJ9Li3RyV3Qe1oHQum5HEaZ0RateUSfH46CXFo5nQ0XGxodoy+x+oT
	aCiPkG7+QVOBglEbjEpsUjp7bZn52B1Qbg1WDPNK6TzfiqtAIIqGQ+IpkzYMMrSm
	xtFtJw57y3DAWYHyXq+bLC0LzcjbMxvPTq/53uN5k9uDFGWtyOHPhO0khMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw5dy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:18:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so14609345ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092282; x=1779697082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sRVeYMxBRbB3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=;
        b=E0e3eg6DX06rUN+kVSuMzOqwuYSbGRviIm7cgTpQR4PNhgw9v1gT6jsqn+PogX1fcR
         ka5JsgDCIY1jyTIAoDab9d4Lo0gdoFKO6Gc4xtGGnaopSqdW8SIHo1jDbDIdfKre47Gx
         BGMS0cAf9+XKGpW0IdhjMAceCopad5CSwgpg2EcoXau0lkW/aVPLZW61Zh/JJLpHn16m
         kuG8EfEBuaxoC+H15RA38ukd1p+TwEG4ynp2LGjgMWfzW+MNBisWK8v7/3dExWP/8O6o
         NrjS+NlsA6ho+WUxSRLljiWKIuJ2U5mnqsz3ryfnhm3zFi/919bCjQ0xjiNJt/l4j1pP
         mXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092282; x=1779697082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sRVeYMxBRbB3S6B199Lb1hv2zwBoow5QgQ7y16qGoM=;
        b=UB7th24dVNGsh/c5ab6wy9FNfOy7B1tY0KsNXaM8PjePWfjVgG6p78bSY69zNTevzK
         tjpshAkUFaAh1kV783NsmaSbD/4pyD83sl5VtZcEbNUWObbX0j2ixOwuL1ZlsLsxDWQs
         u2OGBDENJgnUFC1slHQ+CXd4P7XDBxumrLHHHo34k3zecNd0eBScP4sTEv4MFMb0vaOP
         7SBo5iehgxjPbrjdxXn41/qlBao8vGynnLdSDNututFgLPMtzWtaqIx03K4A6brZpgqS
         SfgwMg+H1AWN4P4BXKprIUO9wyflarns0fWUOL0WQjGNYJlGS0UGbK2GnSo827+8qY3U
         otnw==
X-Forwarded-Encrypted: i=1; AFNElJ9ejDcyFSsXeOnNSOVrnZs9SgqOreEzYk10pRms6TRD390jGtMQGgFCDZ8piInGvGOdgaQJ2hRkS+QEEqYM@vger.kernel.org
X-Gm-Message-State: AOJu0YxachpdBnSv5PdwNOomQe2b8sJgmNbmI2Fq1On3O8Xzx8XOIQia
	skpA6O55+XjK2yg1OvkkTqcdLWplGINi6wwvu5PU4T4wX+hqrOh9sApWP37dJMhXZf72T9MYc5Z
	lIEvVSRRFSTl6uyEEIznakhcG0vT7bfSayWN9cWGhGTJYhFv1lzxMBWrgiCpAFevPRpvW
X-Gm-Gg: Acq92OGJo+3y3saLcbEzAWldLTEE+OVIaW/3aOtpKQOySsDyEkWx9bt95jBHzUIO6pp
	6O4NPvYQtjuVjbwTuDeF+UHB/uv+IzVHOZVDb/xFJItXf7Gajv49LkRjTD9/qzT+QYSpucZV1aH
	FXR8w+t8MOmfe0tSVs86o2Td7ePtU6nCxgtJAHRbv8YXrGwhyrP3AdraZBgaJg4NTPj/E39N51P
	JlZKo6OuxPY/3+OcBon9jmZeZ+a9o3qgUlQawFyK4KZE2Rr/5jRv/gKcZUs9dx/tryzeeQAkbyy
	3U5OJEcHGLQs+uUJBEKcvf+jFrDLglJahlExJX5BRu584NTCsGFQl5DwwuYIVc1DgP1Ee6reIj9
	8ubWFzNz/4qx+NAMzrEadZUCh0PbFC0bAVip20YWEYEn4Wevgdw==
X-Received: by 2002:a17:903:3850:b0:2bd:6327:b507 with SMTP id d9443c01a7336-2bd6327b69bmr153260085ad.18.1779092281779;
        Mon, 18 May 2026 01:18:01 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2bd:6327:b507 with SMTP id d9443c01a7336-2bd6327b69bmr153259855ad.18.1779092281262;
        Mon, 18 May 2026 01:18:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c2631basm136620755ad.34.2026.05.18.01.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:18:00 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Mon, 18 May 2026 13:47:37 +0530
Message-Id: <20260518081738.2453957-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX3zaZt7Jtqg72
 bsPOwkJyd6Gk+ypO6liEXXyIkZiJbOP5buMh9JD7CE2aXf/vEjUV4zrBNYI4SvN6J1L+fx4sffp
 9MlzKfsrhnE5Ux4vtZOJHAoq9mu+3inKIHEnHXLfRXhAeg6KzWPmEsv6nZUIioSfsjvlKOCLqX3
 yFiDshVjwHiTDfvctHTSVEXW6s9sc72UfV/xWs32TupY5dAoQW7Mgrj3FoP7JUBqboOaorILutq
 H6o34Tn/Qsvw2Uw82hwRrvHWHoY/qUwr8Sf5/UA6DntWQxo2z6KZCfvICF+Q+UZ2OHComFiaGzy
 ++Uo1wcXqYIwMZoUWJXpRvBHkrIyHvKE2QCizScKdxV0Z3XbjV8MxYA+WayQyGVDT1JO/+SltDy
 vV8ejYUfYJokQijFSPKsqx0xcuoYTreiX670Tinq3FQ4TL/zFg3eQvk5sVUA1OJNJcczqi76/E0
 NIT5toD8mRBC9YLOJTw==
X-Proofpoint-GUID: ihp0oNKpx-q4hvkiCyDbTeZql0S-c8i9
X-Proofpoint-ORIG-GUID: ihp0oNKpx-q4hvkiCyDbTeZql0S-c8i9
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0acb3a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180079
X-Rspamd-Queue-Id: 2398B568926
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108131-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Convert the LPASS VA macro codec driver to use the PM clock framework
for runtime power management.

The driver now relies on pm_clk helpers and runtime PM instead of
manually enabling and disabling macro, dcodec, mclk, and npl clocks.
All clock control during runtime suspend and resume is delegated to
the PM core via pm_clk_suspend() and pm_clk_resume().

This change ensures clocks are only enabled when the VA macro is
active, improves power efficiency on LPASS platforms supporting
LPI/island modes, and aligns the driver with common ASoC runtime PM
patterns used across Qualcomm LPASS codec drivers.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 128 +++++++++++++++---------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..64a06d9ed6c8 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_clock.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -1348,32 +1349,52 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
-	}
+	ret = pm_runtime_resume_and_get(va->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = va_macro_mclk_enable(va, true);
+	if (ret) {
+		pm_runtime_put_noidle(va->dev);
+		return ret;
+	}
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
 
-	return ret;
+	return 0;
 }
 
 static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
+	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	ret = pm_runtime_put_autosuspend(va->dev);
+	if (ret < 0)
+		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev)
+{
+	int ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1534,6 +1555,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1623,20 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
+	ret = va_macro_setup_pm_clocks(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(va->mclk);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_mclk;
+		goto err;
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err;
 	}
 
 	/**
@@ -1629,7 +1649,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1679,26 @@ static int va_macro_probe(struct platform_device *pdev)
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = va_macro_register_fsgen_output(va);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
 	va->fsgen = devm_clk_hw_get_clk(dev, &va->hw, "fsgen");
 	if (IS_ERR(va->fsgen)) {
 		ret = PTR_ERR(va->fsgen);
-		goto err_clkout;
+		goto err_rpm_put;
 	}
 
+	rpm_ret = pm_runtime_put_autosuspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+
 	return 0;
 
-err_clkout:
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-err_npl:
-	clk_disable_unprepare(va->mclk);
-err_mclk:
-	clk_disable_unprepare(va->dcodec);
-err_dcodec:
-	clk_disable_unprepare(va->macro);
+err_rpm_put:
+	pm_runtime_put_sync_suspend(dev);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1709,23 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
-
 	lpass_macro_pds_exit(va->pds);
 }
 
 static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(va->regmap, true);
-	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, false);
+		return ret;
+	}
 
-	clk_disable_unprepare(va->mclk);
+	regcache_mark_dirty(va->regmap);
 
 	return 0;
 }
@@ -1728,23 +1735,18 @@ static int va_macro_runtime_resume(struct device *dev)
 	struct va_macro *va = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+	ret = pm_clk_resume(dev);
+	if (ret)
 		return ret;
-	}
-
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret) {
-			clk_disable_unprepare(va->mclk);
-			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
-		}
-	}
 
 	regcache_cache_only(va->regmap, false);
-	regcache_sync(va->regmap);
+
+	ret = regcache_sync(va->regmap);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		pm_clk_suspend(dev);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


