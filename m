Return-Path: <linux-arm-msm+bounces-102948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CITpOT3f3GnrXgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:19:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 890763EBCD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94A25300BCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347403C3BF3;
	Mon, 13 Apr 2026 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Secgk7Dn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsXQzBDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58593C3C19
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082732; cv=none; b=mhgivhgCw77pF3Wd0dR+iXCrDrQscejlcRRGzTAzJY4rfzfH/eUinMv5L30MInCeSZs5k6oWrJq2BW1/FS6QJMv5xZkL6AOyDcup8Oal0gZH7YgUmcZ8DUt4aFMtfN0p6PW/YigTxCTBT88dx5BYBLsLlrvw9mJ7GxIokdB6etA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082732; c=relaxed/simple;
	bh=AfHQFN7pDlYelGn7pGidt7m5AGz7WK9db5mV0zs3nzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WSPxnnc2nOZqc14DhI8TTl43sO+J6gz93Vts+3gt0yCTAkoDBCDRBWVQSgzI8E3mfK7+afvcp06uWNLCBHH0sFpLJGqoV2RVipQK4HSklCKSAz1GqhpTt+KGjiWaeqZe5qsbkWsyp/2zZCyX7+muwwoGXxdmuZ791ulA9YdDvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Secgk7Dn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsXQzBDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6JIu63688005
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6AnTcThYSkI
	vK40nziJKZU5G9UJ5bYtnDXyYQeU7520=; b=Secgk7Dno1JE6HqpokJWKzR+xmu
	m4r4nYNTQqOPANXi6mIdXCaJ1T/FAN0ExUt1P/eoZXE/gBoHtpveAPAIS24v9szD
	nStdwlFLVbtI3C61ur9IUsjq57envogMLkBqWMpgeXelsoDG8MN/jiRuSfxGAAt8
	Y0VWg83GeVhMCeMTzMbrnSqz0ujhnaGR2NTzYxGdXucTwO4p4Ow/EeKLJ2GM85sF
	V/ReX5F6vRE1IcQbqvmRQdZWRT6GsyYrPol5AJxvJuKufAOfYVWwNGpwkqhq/DId
	Li1Tz5RRJtV4bYAfeBIn18FwWvESdpspJrGYIAwylNAhP+ghI95Lm5se4Xg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhw5ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 12:18:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-605664a1046so2397693137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082729; x=1776687529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AnTcThYSkIvK40nziJKZU5G9UJ5bYtnDXyYQeU7520=;
        b=WsXQzBDa1oM19VI+vt3+Buwgch1R3voWd2IvfKXsoOojRBZrz/+xHgW4XlS+pHvYNK
         viIfIva6WjVrGF8sGzv+FRSF3uQIcV2ebFw+raoWWSheUXTqEIHJ0bxHB2IHcrXzGyiU
         OQmcbw/eaGxbVB3eAKtrnJcpPShOvXIsKzVTgwrnvB3LSuWGE6tQwBe7adBFbqXmUkrK
         CFeKJ0lriEbP2tMS36IxGTjxq78M8EOV7GDXqZzir24EXDRdAqTFDVJ2oZgBM3Il6ve5
         RTpwh5Xu9GdsAQ4HTp6ptNDd3g+Hhhn9LDrbab/eJPTjX+4hx1lF2r1uNXaWFJF+XvSL
         45Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082729; x=1776687529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AnTcThYSkIvK40nziJKZU5G9UJ5bYtnDXyYQeU7520=;
        b=fdYG2B6ltbs7ButIINHCyE5PcbywjcnyVG5aVMW0N3fmpygH0roQtIgG6BZwCvSAgC
         YctjaalZTwoFTMJEnS/5VDBhVJieyryE002dGLe+EJHKV8vxPbNNHYSuNZ4jKSdUUGWL
         vvXw/ETrsyX5gmJLqTnPgeVFMHrvPPC5NiUfoQ7xXPbvswZI2/Ft2xIA1ggpRM2skLjT
         Wrca1iQgXd9K3JeKWs3QYbclovbrx1dcjFEQ0qGK57IP1ZQ9Lm3itZEL37roYpdAHdml
         lWzAX49tx2lLP74j91SXkSeqRfdRtXOqi+DFHlJVrdXzyrUNADpwL96fmwqbFKulsouC
         6Ntg==
X-Forwarded-Encrypted: i=1; AFNElJ/p415zQ+GnhzNAeesXV8tDWK9cxq/7lu+1gYkNpV3NX+h5qXPAvUnKwXZ44/i2YUJO7U/YHS3TNobkhBaa@vger.kernel.org
X-Gm-Message-State: AOJu0YwjyICNCmgJ99Vx+Ls44CrLFXhVnhEYBQwA0aDiCFWfx6Zu91MR
	9jMW65yohizSWyqfKSX6mNDdazhIJS70LIriHQ2I0To+8KjxlaEO0WBniuznXflXDtEJfm2x7SV
	eKt1yla/sCKhuvfy+ZP3MnQV0gIlGKmx/AL/RxG3fUjpPkJGEaHVOqhjB1AVtbMcUz3QS
X-Gm-Gg: AeBDieuToJeXKv3PfZoN7BrwKbwqBt4hUKFNpqQK/Bvew2UDxR5TtInA4Qu3ftAie15
	GzxXgCF85FJdL09pzkqkYbqSziDYkPm8KrI03RyrYfStaxLZTYesc8u/fvDiHE42fqfjl/ZU0WJ
	9GRQ6JQlQykTkpgcHhW+yY511jvd3bO8MKuzgjRhRdnvviCZZdKRSMOwn2t1PVCOaZXKxxmDvj5
	8F7gUZ8HXfgV7ZD8haG1+cEGW0qqoyz5SzFV05dTcpfg/sf1vSIsJAzOvJMxqGdNL07FyNCtmNL
	Kqbcox30XGzxFpdNj49CKUJ9TBBEeITzbvZs8hmKtNhR4jZJdNw73LLt8estMRYrGf0GLpw7bk8
	qG7iF5LPmwSb1IOkHACjTkfls04upJt64ZvrC372+bY9DFglpag==
X-Received: by 2002:a05:6102:5708:b0:601:f386:9ed2 with SMTP id ada2fe7eead31-609fe89d49cmr4713616137.7.1776082728837;
        Mon, 13 Apr 2026 05:18:48 -0700 (PDT)
X-Received: by 2002:a05:6102:5708:b0:601:f386:9ed2 with SMTP id ada2fe7eead31-609fe89d49cmr4713606137.7.1776082728430;
        Mon, 13 Apr 2026 05:18:48 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9568c185a71sm1449231241.7.2026.04.13.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:18:48 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Mon, 13 Apr 2026 17:48:22 +0530
Message-Id: <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfXzSAY5SNqwae5
 DoB8Ix91QjboGTq5CZpR2hXptuH428dQD35XErh69MVShCkITjjowTIxe0/tzXBNn9MygJyMQPw
 KRk/YFgfRKqHKl2ZBvPhhhuYwMUXLdZpUxbUkPTFGB+tuBgMkOTRS3pNgv1hQ6gLObLNCtTv1CP
 N8l7zfDD9/qn5JGrSqv040dQVRBBFm6I9pVRplPZlyG3ID6LHWAkAlH3FU1oPMsZRnSEgwOLfab
 +4+TYX4minBpAbVJLRUH5cW7lnsfnN5k0sQFxrBLch6k80W7nub6+7iXDqhwddI9WBaiXrPp1wL
 Cwe2GLnq/5Kdxn2UnaesTsY+mLlP+ReO/WA7aFb9RSE+adoQPJwN1CmK6n4x7whC2kMSQkNnwDd
 l3GAO6Ljngco15jaSdiJdNwoWS4xylTOYXqtwVSYTaJfu93za6LHO1S8Kl/1Lv4SldWNNO0Ev6h
 BN+uKeZkBiSuQKj70bA==
X-Proofpoint-ORIG-GUID: K32mRaEOwG4aHfaT-cf68ssqWyOqfovp
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcdf29 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6iqXw53aW0HuLngz8iAA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: K32mRaEOwG4aHfaT-cf68ssqWyOqfovp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130121
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
	TAGGED_FROM(0.00)[bounces-102948-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 890763EBCD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS WSA macro codec driver to use the PM clock framework
for runtime power management.

The driver now relies on pm_clk helpers and runtime PM instead of
manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
clocks. Runtime suspend and resume handling is delegated to the PM
core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
PM callbacks continue to manage regcache state.

This ensures clocks are enabled only when the WSA macro is active,
improves power efficiency on LPASS platforms supporting LPI/island
modes, and aligns the driver with common ASoC runtime PM patterns used
across Qualcomm LPASS codec drivers.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 118 +++++++++--------------------
 1 file changed, 37 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af..6aa6c4d95 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,7 @@
 #include <sound/soc-dapm.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
+#include <linux/pm_clock.h>
 #include <sound/tlv.h>
 
 #include "lpass-macro-common.h"
@@ -2529,15 +2530,15 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
-	if (enable) {
-		int ret;
+	ret = pm_runtime_get_sync(wsa->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(wsa->dev);
+		return ret;
+	}
 
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
-			return ret;
-		}
+	if (enable) {
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,9 +2549,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
 	}
 
+	pm_runtime_mark_last_busy(wsa->dev);
+	pm_runtime_put_autosuspend(wsa->dev);
 	return 0;
 }
 
@@ -2774,25 +2776,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret)
-		goto err_npl;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		goto err_rpm_disable;
+	}
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,44 +2809,26 @@ static int wsa_macro_probe(struct platform_device *pdev)
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = wsa_macro_register_mclk_output(wsa);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
-	return 0;
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
-err_clkout:
-	clk_disable_unprepare(wsa->fsgen);
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-err_mclk:
-	clk_disable_unprepare(wsa->dcodec);
-err_dcodec:
-	clk_disable_unprepare(wsa->macro);
-err:
+	return 0;
+err_rpm_put:
+	pm_runtime_put_noidle(dev);
+err_rpm_disable:
+	pm_runtime_disable(dev);
 	return ret;
-
 }
 
 static void wsa_macro_remove(struct platform_device *pdev)
 {
-	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(wsa->macro);
-	clk_disable_unprepare(wsa->dcodec);
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->fsgen);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
@@ -2856,11 +2838,7 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 	regcache_cache_only(wsa->regmap, true);
 	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
-
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int wsa_macro_runtime_resume(struct device *dev)
@@ -2868,34 +2846,12 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
-	}
-
 	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
-
-	return 0;
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
 
-	return ret;
+	return regcache_sync(wsa->regmap);
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
-- 
2.34.1


