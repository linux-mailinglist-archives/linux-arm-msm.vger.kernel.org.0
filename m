Return-Path: <linux-arm-msm+bounces-102949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA9nG1Xf3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:19:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25C3EBCE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A05703009E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E63C456C;
	Mon, 13 Apr 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSM9Nixu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGG1NNQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1473C3BED
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082735; cv=none; b=huKVHqfOF/YWsgWA5DJUJK+MjdWBmklZxYR/MIQwlEr2akgvygzrsAXGkEik6p9CBG0SZx9L1GyLTYAETx6hLO6ks+nVVz04ov6sbOwbLktfsGWCcmU4wZi3OItSd7XSLuhHW10b9H2Xq+TBl9im8K/bahkKWx0lLpPhTi/mrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082735; c=relaxed/simple;
	bh=YcwoMzxukF7+UWLUh7ShFeHrKILX3C2ELlT1tETBD3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1sHF+wVXtKQxQCLb1ziEPkqK9J5j5BZ10pZk3On4Oj6H9zm8CC4t3x99N/cJTpd1HyG65xYitanT8IczSaBvJ+NMM+jYpsk3m6B44pHDZ2/mDgsEREc3JjEK8NYZgAlDiiI9n1MTOsnRPJmBnblWqh9pJqHia66p+mm5XErECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSM9Nixu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGG1NNQk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DBY1hh531178
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hPUdOBqvPU6
	WASDP0dE6MPIvij1WDI+uBqfXimGLyo4=; b=cSM9NixuuQx0xWwwrUCGCu0WVlm
	iFY1gHp8jqQo+O/IIKAzD1cS6dOe7DZRg3/UBv8FQx7a11OyH1XvjiR/boDbraPO
	HTcnb3t3Uc3PY9yKnxpPxWglx9KLYgQZ/02Z7FrtGACpeW0bVv3WnCN0S18z/Ge/
	DZXqnr1yDs1eCBs66haLvG2PtKi4tc0LzMR4n8o9I/S/26uWsi//8fMnrS74Alwc
	HO2XAXLnJK4iHGkqlbbjTSUOIdsJkrsRDub9nv+RLwOZWqfG48tyFtHUZaIxjg1W
	Xxz2tegAlxB3o2ETEfUG1r12fO9yHmwLGTkTOjb2Oi+BZMrA0Ian6Kmr7zA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bd6j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5675cb317e3so4265284e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082733; x=1776687533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPUdOBqvPU6WASDP0dE6MPIvij1WDI+uBqfXimGLyo4=;
        b=hGG1NNQkoN6QW5FKg/PSTL6RrQBHPQPGnA6wasqeDVHuVih1yX5NUJUec0jkHJ7Otj
         WAhX8RfXnovvD9YG3un1/LgsTC4JRX4XDm0f4oyyRjTnl+W/d6wh0c9Cj3BeEh3276GF
         zwXUiSVsflDWzeTwTZuzvFuibJsyyQOtKm0vizcyDJq1/keyZ2wV0Gxtf5mQFmwH1EWO
         0zUxRWXtOz1opmzxJ8HXPEz332tG/1Mq1TYHp6/uX72CiVlQdiaPoeEyUxdkdRZDwlFb
         wb5icp9OeN1iNAdl+bMhWTij8J9qPXEfxOik35VHxWLQqeKLI1cyr7axf0IugW+/PaOI
         dv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082733; x=1776687533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hPUdOBqvPU6WASDP0dE6MPIvij1WDI+uBqfXimGLyo4=;
        b=CBWGKDpuHfcOQ5/S5RS2RCJPtV5pFyAV8B2VkTkA3myO2oHO640ZVQq8qyJ0NswILs
         1IZJBTSEb84e6xrzq/DTIvUsXjUCP9paps04q/jtIxxWreZnqMRCrkEP7dCeMjgmmuzk
         yp3/VMQCJJUDS446zh2qBGV9e3gzl9KYKO4C1FOkEVY0IAXndzD95GAFAL4KkF1RbJN1
         OGeX5dpNLFyafd9plD25JiA/9h1Ye0Gggc6vejEZ+UzxsImk2cdMkpV6yeQYcC85bKRF
         jG5fmza+rOwxbHmfWsXt6AgyXs+dipP9FVszxSWF3nuygyWkfKCkoUdJKifxQQTjf8SC
         +wiw==
X-Forwarded-Encrypted: i=1; AFNElJ9ronwcHWRh/z+yki/N1vtI2oTGKZs7mxdzvs7cemUbQ8oyG4JIY+caze56V2xEmZQxrW8/rS9J2Ywzp+T5@vger.kernel.org
X-Gm-Message-State: AOJu0YxqfisggfY+rM/6XWHB08h/KHiBGoz6R0Z4o5KyxLRF9ZbqL5S6
	Ett57PGhI+PBJYUZACmNi4k/VFmMZu5cHBPrUepnPnZNijhdXI538k1Lsg/D5E5WPn6HSmDyc0l
	uJMum3MB+u0f0PuoOBS1dKECrrD3lcpVNpBy2fDuVoGUTPjdLOqrDg9ZtGY/Ovb8nXAfC
X-Gm-Gg: AeBDietQfmwqirD7tu845lI7J7M5dm/cpNHpmVMgYXytvPf+cdU8/h7D+crY1iT0fUK
	vsfQZOIihFYsubnDUj0ZWhVHZhfL86v2QAu3RwJeYdStl5pmzoDjC/Fd0NDpCtrw8+YHNghaaz2
	h2jkFzHlO4QrCg5la6aBrFLTXCpmPc7ubxeIMrBZqq2o62fk4Pk8R+zqS1eJRBOXgJWUYaoek7X
	C+QcjC5zE64YY1Xq5KoBCU8oTkKkJIAwNW/p1VZZvK66tLvc0Iipl412gFq7qx/zI+blLgxFkYA
	ZBSAutyZZDMBizOspIRgBiWJvWd2ogXXj+HYytvf6WgIZX76vPucxxiPkL2YK/uyhPgJK6tXINH
	9qll9qpa+JaZFVGMPUdK5zEK9jGbOgiD0vChJ012U4bGGXAawQA==
X-Received: by 2002:a05:6122:788:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-56f3bcb0843mr5016035e0c.14.1776082732915;
        Mon, 13 Apr 2026 05:18:52 -0700 (PDT)
X-Received: by 2002:a05:6122:788:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-56f3bcb0843mr5016023e0c.14.1776082732482;
        Mon, 13 Apr 2026 05:18:52 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:52 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Mon, 13 Apr 2026 17:48:23 +0530
Message-Id: <20260413121824.375473-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfX+ZjdQaTbHeb6
 ooT4k2AuJ1Ogm+oH7d/DYkl/iZky7RaobCV+Z/R1RqUilKro/264jqmvQG7Ol9QBEh9MhzIjYMd
 B7Zvs43RLNvVRqM+C3ISHeiYwvqUocgqtJ7+JsBDlfs3+I7pXfGkoFxQJudnbihy5Xw3tRFSWoP
 e9M/6ij8bqsq6OJ3rnhAh7Sanxm9ETeH57wUlfydfDaoLJm3KTw0LFySUkJhsbxgUEuiAbrjGoj
 mN0KBv22JMd7mX2b9wmc54Vn9z72mGwoqR9ThUyPqcjLIfjNgFxdjzl8m5fjCB+TRizOesZW/hB
 37S9dUxhwSCM/nYpCBx9XJQ7dwstCHzW9GjzbqVOS0L/Kxg6g//QeH7clCtC0lcseYRc6YQ8aGe
 WGuVopaeMlv3768y21tNB5IMh9PGci6qI+VHWaEoCDVyZ9EZ4EzolvaktuyyUEayV3c2FZs8yCo
 XsLvoE4E+094wp2oWuA==
X-Proofpoint-GUID: u1cBI5iAxrHBFwNoBrdDbcnR1ufZT7WG
X-Proofpoint-ORIG-GUID: u1cBI5iAxrHBFwNoBrdDbcnR1ufZT7WG
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcdf2e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102949-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C25C3EBCE6
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

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 120 ++++++++++++++----------------
 1 file changed, 54 insertions(+), 66 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167..b909f8bef 100644
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
@@ -1348,18 +1349,22 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = va->regmap;
 	int ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
+	ret = pm_runtime_get_sync(va->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(va->dev);
+		return ret;
 	}
 
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
@@ -1372,8 +1377,24 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	pm_runtime_mark_last_busy(va->dev);
+	pm_runtime_put_autosuspend(va->dev);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev, struct va_macro *va)
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
@@ -1601,22 +1623,18 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(va->dcodec);
+	ret = va_macro_setup_pm_clocks(dev, va);
 	if (ret)
-		goto err_dcodec;
+		goto err_rpm_disable;
 
-	ret = clk_prepare_enable(va->mclk);
-	if (ret)
-		goto err_mclk;
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err_rpm_disable;
 	}
 
 	/**
@@ -1629,7 +1647,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1677,27 @@ static int va_macro_probe(struct platform_device *pdev)
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
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
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
+	pm_runtime_put_noidle(dev);
+err_rpm_disable:
+	 pm_runtime_disable(dev);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,12 +1708,7 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
+	pm_runtime_disable(&pdev->dev);
 
 	lpass_macro_pds_exit(va->pds);
 }
@@ -1715,12 +1720,7 @@ static int va_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(va->regmap, true);
 	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int va_macro_runtime_resume(struct device *dev)
@@ -1728,25 +1728,13 @@ static int va_macro_runtime_resume(struct device *dev)
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
 
-	return 0;
+	return regcache_sync(va->regmap);
 }
 
 
-- 
2.34.1


