Return-Path: <linux-arm-msm+bounces-103751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBNcCKEc5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA642ABB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35C383074ACF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F351A248F6F;
	Mon, 20 Apr 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnzgp/aR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOQYP7I7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3035979
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688249; cv=none; b=jBNXxBnab+SxAvGoI3EymIxIyOBh4lQnISacnfJ2AbB0eqKnKHxhiQhaSPl1CuyeIDsLJf10K/rIaccOKuc4kAqDxHU8PKsjlXf3Ps87HmdAcks85JhQ1XhYXs/saWpnGK+pM5Cd18brHryBrWm841JyJAkiAGyLwFgDmbGBEyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688249; c=relaxed/simple;
	bh=I/pefbqSETmnZNPMeq5NEVntkaBKgRJaMe2Xo98cXlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MXRlPw3BwySuGeDa1Opn9fV0En7TpFzs2ybIp+1vrwPTJn9PhVV7rYnLWWDcpzhHcJZu5sxZp6S9Rce6wV1P71+S6l39vKQ1sON84nYcwdKEeBRzUljfQXzEtA1ck5wp0PG65AX8Cd/cbIw+SHvY0zUzC9+3QdQE3i5rqz+SECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnzgp/aR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOQYP7I7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvOQs3015215
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HisKd0+ZQuB
	MbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=; b=cnzgp/aRm02KpmDsJsmI1acUS7t
	UfK2Z05cFRPzRzNS3HRULoLyv8M9cFoyggJAi9z7sagKVRBAg1jYbTSUIuQDSEIu
	wXW8L44g4VL8JOlVT6c8Gku2gpreGYYCgOcmMPubaN64QU0LQ61AfUqvApj6CuSe
	5nFLSnVnoRKRD97W/SzMEBL+c8sagsba3M4xeyPaTvvFh87atNNMFQ8mlpdO31CR
	F9aC26Woc3yDvEQWjnHC4MUkI9ceqtX8jF3dK9R3EzMFrz/enfkD4TwgnVqnmPQF
	7cUsJGQVVvI41jHSqEoAHJwmSUTpuRxuRhQGWEk3FO4NtCR2XoWyPZZFcvg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukr913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:47 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7b6fea89dd7so58927587b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688247; x=1777293047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HisKd0+ZQuBMbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=;
        b=GOQYP7I7i11E7mECCJnl4a9AG7og8LA7dfZouxoQshNp0PDkb+5Kocg/NRK+7o0TVm
         c+4LbgRMVwRpMmHC7GplXdWYFK8F0KyNQ21IoTttF3RN9A47cM6U06catLasi1qOamv5
         wuqQ3yuH63d9lnWZML8nTbadBo7eLGIXyDDV/gt4VlGg1fCr3kRMt99HrCEES62RamRL
         LbNNxNqzaYyR1l3LSfFOsmQh0xuWugr/GX7w1mhcLKcjMAEWuUbnOPtlZHp8f7w9JdAy
         /BA677arnR4IdVS8iekQ17We2wNnCrvWWg6SDzTWNFQpBuKQlLS54VgZCUqC/NUIk9A9
         H5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688247; x=1777293047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HisKd0+ZQuBMbBHyrnZU+sXN057JWjOAmVpbH/jgtuI=;
        b=bxuuL4B4+iVxmqr1rAmjyJBausW2ZsRbhdz+uLGJBFL8J1a4XUlG1vL8njg45vjQEU
         3ZiPrsc/0YHDlUpJ21WSo8m7WayRImTmG/bpRS8I7WMOjDOM7SeSIWJ4ISPhXCfHwa7A
         mgIS8PKaWahf5VXA+V0ZqsOgjcVllAC/AMwYZv1gLxlknl2f7Q+OufOwtdAZKILEWCKM
         hLp43Yi7lYQYbu6vGBPx/TY6+U+Qf+Jzfn1bHFS4fDnSMCZzCabarCc1cqxGIfOIwGxh
         O3LZMvzu9B7HecQj7YpldpH7M+QWulGrD1w5420Dvju7BJ5GASu9uuGupy6/W9Dad6Fc
         YqAw==
X-Forwarded-Encrypted: i=1; AFNElJ8SOVJrSrZF4w+HsZoaEwc4zfjGxe/NMlY2BHSWkO63Mr+Fps75b+4BIcNX0idxxohpqkszh6E5aqlsjrTb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14C0yZuC7B9qCjQffcfb9g7P6+C4+kBR608OI6LhbMBzTV/Tx
	zq377jWjR1uKEImjtIY+plkBwuIciu5KeME2VLB/BRhnJUKZN3YJthHtYPEjyhBlDzK2lKQHmiB
	ahE3dhWjEMxJx5nBhiIOaXcUBfSwj5EuUYEvl731kTn1YZJYMlS8zBL4S3dfOeiNVUfVE
X-Gm-Gg: AeBDiesbJhqVpf0fKvup3TvcnQw76/PsBwHB6K1pyCYdtKnoZNuz02RN8IkRv+3SkPZ
	DogTvPB9XniTTyaw7oOq1UKK7RE2OEIZvJig5wIEVNtigOaTJUFsXk7lke9QUFhqxOQMuacWjPH
	brkwHfYShicksnFBdukUm6NJWQDZ0Gh1DHX/S3ufGYddJts6KortcHvkFWQfHkbdhy0+mL+AVxH
	m+2TOpDFZBOcl8wq6Oz9uXI8bME3emCNZNmhtIO/o/38F4sMU4HvosKzGdHPubAwhARj+3kd5Yz
	JNOVZv8c6fLYOCPBbcyqenkdbt8nA7q/gc7NlURlxqIf1rooI7rDEkC4u9SLFnF/rK/dFh5HWyh
	VYQ9YTeK0Y9zX52OxZ0QlV2AudeKSznOGa1emayFUgB1KS6M3cIbJoJS1x+/B
X-Received: by 2002:a05:690c:388:b0:7ba:f2f1:86c0 with SMTP id 00721157ae682-7baf2f192a3mr24413437b3.12.1776688246835;
        Mon, 20 Apr 2026 05:30:46 -0700 (PDT)
X-Received: by 2002:a05:690c:388:b0:7ba:f2f1:86c0 with SMTP id 00721157ae682-7baf2f192a3mr24412937b3.12.1776688246262;
        Mon, 20 Apr 2026 05:30:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Mon, 20 Apr 2026 17:58:42 +0530
Message-Id: <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5WnDiSAfF3P-eVL-y1B-Qm8IrmsfDjm3
X-Proofpoint-ORIG-GUID: 5WnDiSAfF3P-eVL-y1B-Qm8IrmsfDjm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX6Gb1ezp3l6cr
 h4Yrzryc9f0br9xtm7LZVxbp99aSlCUwdqUwEOevhkfX4JVTiZR7rS6//IE1Cw6uRGKBdl3cb1M
 LlEag3bwrzecLn0O2j3CEFsU8ydgnukyAP6PYIh01sweXHLE6rGzs8sW39Tx+SRLKPFK0NMpxbE
 s7Mulf2gFrNCuAbSIpLRPC7Gi1+yKPzS4nIfbwknJ9pm2swigGff383SaiX2g3vapY5H3r2SLPh
 BONIOJG/Wu82RG4MfQ2T40jEVO2HgITY9FdvpWIlIYWcw3Jx+lD4dRwx0DFY3V8rabUH8dAjevr
 GvVNu08RBUl4Kqub6wdleIOUh2nCcGcYjMek+b/IQVTHrSadKUU4O+SogVEk7+BQQDVhGiUGu50
 UD63kTwIuR2v13Z5n7qTx6Yw9NZcJ1ST2kVsKZJZ8xFS8NtiS9ctIWH66Ay9W6fgeHBRu+xHaq8
 kXb+WgzdJeb1ogR2m7g==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e61c77 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=YBVk55sqNhi4ukaP828A:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
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
	TAGGED_FROM(0.00)[bounces-103751-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 7EDA642ABB4
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
 sound/soc/codecs/lpass-va-macro.c | 123 ++++++++++++++----------------
 1 file changed, 58 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..949275f1dfac 100644
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
+	ret = pm_runtime_resume_and_get(va->dev);
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
@@ -1372,8 +1377,23 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
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
@@ -1534,6 +1554,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1622,18 @@ static int va_macro_probe(struct platform_device *pdev)
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
+	pm_runtime_set_autosuspend_delay(dev, 100);
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
@@ -1629,7 +1646,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1676,26 @@ static int va_macro_probe(struct platform_device *pdev)
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
 
@@ -1698,12 +1706,7 @@ static void va_macro_remove(struct platform_device *pdev)
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
@@ -1715,12 +1718,7 @@ static int va_macro_runtime_suspend(struct device *dev)
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
@@ -1728,23 +1726,18 @@ static int va_macro_runtime_resume(struct device *dev)
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


