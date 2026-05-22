Return-Path: <linux-arm-msm+bounces-109318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGjuFlZWEGraWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:12:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B07045B4E39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59D5030A0AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC04339B975;
	Fri, 22 May 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSwzn/8l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ieuNoUkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ECD39A801
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455111; cv=none; b=DPfRg3rlfc2Tv7RTHpcKQch/U1BAqYldCeGrpm5/gw4RcLM6M941dmd62RR2XlwewCa+Ea5RpgsK6mFEcfnBvu0YAr7Utodwh27JashVjCbumZsk9fUptWEhs18OMxUGUfVg+pU1/5Y/tonwrrNTuwAYmkrVjkL60SpzuTeziac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455111; c=relaxed/simple;
	bh=sg+2Dka9Tii5QpZ1rgOk7V9jpFe641VpWCk5BfK8u0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=St9O0LFLUUsLmkkMk+pbAhZQw/pfJMR28WvTCkK2/touMjmFZH7gCberhgCggmUEaMI2CvW35WT9SEBsROiV3yXP7o5hy1Sns7VyAHjPYhBsoh6id0Bq/8uDMq4Tu+N1ao1YT9nV2OKKR0HImL7U8NGnjpMpYNU5tHeXiYxMKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSwzn/8l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ieuNoUkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M93s6O1816063
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PM8JHMudD5X
	llfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=; b=ZSwzn/8lZciJCV0A1Wn1Wg8OALZ
	boMRunWcBu9Sor7+Dp/ltzht19NGOaziE6O2RwHr47aT+oLzYlovj6SV5UB6Ya4C
	44r246NNb6mDy9YK2rseiR4h/zGbX3S+tDrHAZ6mBJORhprj+UYLz+wwSXGLAYnq
	mWwpVjmcjGpcYEou3Yst7s4daMNaUS8+qR6wPU60flHsVnZq6eL0ySlkXQG3agub
	H2YsSD8CsUuKleCJo2zhtH++q8otukfQlDhp9ClnXCUTujYYHxw8bIfZqKSCiA/k
	cZJA/WwQLQAzBnkXH9IwdiwlvKExO0ZxTuZrfPMzOlZfEYORMXGSBiM2DbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm21vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b0dc7731so4289441a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455108; x=1780059908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM8JHMudD5XllfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=;
        b=ieuNoUkN0D7htTNMLKMvYVRYAD2upUisRcBUZa6Koydx0Hd8xp/LjvDbWfCiOrNOTi
         hMda6FhVHpAZ1w6YU6t7ambgScApYcNibrd7t7nHY9oybi1/Gt8jw0SVLJAv7JpLayGj
         2CPXDojfta3j0EyHMPbWaneKUAZvhaDD6ovnc17zNKw10VwGfEU+mAkRHXR9VmV0OtX0
         Tx7u61YQTKXkKUqoG+cPAG4AtTPdrMmnBB0iA4L5lU+8wzXpdVOnxKcfy0Sd+kJbNXhp
         LWcW3qkOErlKnkrFuWVFu9xIwWUS87240+pWElLFTGHK8ebcwPuSICpIhdXxLvaShv2X
         9Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455108; x=1780059908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PM8JHMudD5XllfnNJ93l4boA9kEYi/3g+ZR7vBgyK2U=;
        b=duQIZ1q6FBjC8tfIWTxZLeCPF3J/LBMA3m4ggy/bxkIDGKlRCeCctj7fp9EFRC6SDA
         diGeejkj/NeD9Gk1KsU9+xJc2EzrsyNWiNBAPs0dXBCwyHBlZMbOg6n4vnbWHmtlI/Lo
         iCuUgdTJ/fzlRZJX2CUzbObnmBQjMo9YBNh8dxAi3o+RKUpVbiItLsfd4k/s6gFoKq5m
         PfGWvqsTM5c6vZaNVN/4nOlIc+Ix3Ui8+M8eQKMWJEWfDyfnQybaVJdbNws2H/PsvUCA
         kqqt6NUgWqkSqmFHmQSTMDbox50swJYgjyN616nKgXS5h/CuxUdPbGJKBAAvf7YxK22j
         t8IQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b8ynQFYcPUS/pEAuV527lSJApw6wPo6rNvYJkg3lyGVOKPgKdaETR6xjNc5pcGq+q7/fzluru7Vh86HYv@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbkA/WMnwHssLZoAQtIYCazUD1UqiT8WcXrYf1PTAS8h9ZEAk
	J1ydkUuzKeryVYnqW/a9QBwAaP9sQUh/mvdiX7B//7CekQ8TjswoJJ5xBnR1jTeZkJOu/me7Xmo
	sS6zK/MWA1yEoWKF+e1Esj3S1wuhpoPf18aYe/TL/5scrlVoJ0AdB1sJPjeP0i995SDH9
X-Gm-Gg: Acq92OGUx5pouV8IP68yZ/XtSXR0pQEPxvaEe9LSfDrHiIw4zfRp587xnjjpXoR9JxY
	TB4mwIjFRj+sHPfaJ1AoA0CVeM8KLT+IKBuWaq7Y01Gv0JK2y6a8diEOi5MRWgLAJjIQvq+KJiA
	lZ2O+Gia8xi0KMkTB5C8KxowaUc3CBDxxFkZC0iOn1F4SWyPBZGqdWWWCP2qO1H9GrRzjwFLGNA
	fAJDuNaI3WTnKRec1o4EDI2LrYKhaUNVu1ptjgzZQPmog9vllpLJR9SvRxSAe8C3QxsMjUu14RA
	d5w4DINyg2ipCTnoZ2OBk5PmjgwLtyl54bgffCY87TfZC2fH9wpBhIcV/8Ab3h35JY1z8UVRSYm
	ljMQ11QiZ/MqqTfrcAChtcFo1a8csCrUlJH33BEtzo6jvUoVQ8Q==
X-Received: by 2002:a17:90b:4e84:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a676f0614mr3778447a91.3.1779455107526;
        Fri, 22 May 2026 06:05:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4e84:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a676f0614mr3778372a91.3.1779455106974;
        Fri, 22 May 2026 06:05:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:05:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v5 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Fri, 22 May 2026 18:34:41 +0530
Message-Id: <20260522130459.3411038-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: INhBs4M1iqi1GOGK1pZQPzBAZoRC5ROg
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a105484 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KdAuDO48zGbrRqqoz3UA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX/Ky86NbCDoS1
 7HvKPZTgJiDLQ9P/qwaxMUtS/pLOhVJbh/cKcD5P3aU9hobWMfajIthhhs7d0kogxB6cqMJ6YYy
 rPjvUwlxhBU4zbABBPhAxWQdkr38Ca+6bBLeGJ2pnIFi7VHqcTfpMsMUs+sV8xH//RlEfP9a3RE
 Dhh0RlHXvKcUgZU3vSKN/PZdCoorhKV5jt1s2C6EWD2ECoHWaoIrfiInIn9AgT/B6b3h8sAmaED
 9iKW9b0ooduxjmCbBy/aWfB/qg/48STw13eyfETyfzV3HzW1B0rXuBE2Q0lwWM40NUuCok6kX+o
 KJJBIyNxfHrjVw1zIkpmFOxw5m8olwLGYfDLRErjv2gj/AwHM05pMr+/5RFYZco/IOJEU5fQMWw
 UCxigwKiChSPI6E3kjLgUeGR71t7T6dRlRh6F3tJkoQ/r9NMwRKN9z1PJthz1smzWuMIVAj/53w
 0pszOMrf4vC52MjCgYg==
X-Proofpoint-GUID: INhBs4M1iqi1GOGK1pZQPzBAZoRC5ROg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220130
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109318-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B07045B4E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Take a runtime-PM reference in fsgen_gate_enable() for all VA variants,
including non-SWR-master configurations, and release it in
fsgen_gate_disable() so PM-clock-managed clocks stay active while fsgen
is enabled.

Add a PM dependency for SND_SOC_LPASS_VA_MACRO so PM clock helpers are
available when this driver is built.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 133 +++++++++++++++++----------------
 2 files changed, 71 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4e17119f2f9e..e73667b87fd8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2867,7 +2867,8 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"

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
@@ -1348,32 +1349,56 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret, rpm_ret;
 
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
+		rpm_ret = pm_runtime_put_autosuspend(va->dev);
+		if (rpm_ret < 0)
+			dev_warn(va->dev,
+				 "runtime PM put failed in fsgen enable unwind: %d\n",
+				 rpm_ret);
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
@@ -1534,6 +1559,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1627,20 @@ static int va_macro_probe(struct platform_device *pdev)
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
@@ -1629,7 +1653,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1683,28 @@ static int va_macro_probe(struct platform_device *pdev)
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
+	rpm_ret = pm_runtime_put_sync_suspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind: %d\n", rpm_ret);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1715,23 @@ static void va_macro_remove(struct platform_device *pdev)
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
@@ -1728,24 +1741,26 @@ static int va_macro_runtime_resume(struct device *dev)
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+	ret = pm_clk_resume(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
 		return ret;
-	}
+	}
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
+		regcache_mark_dirty(va->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(va->dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

