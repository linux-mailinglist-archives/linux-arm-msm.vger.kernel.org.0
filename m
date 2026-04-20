Return-Path: <linux-arm-msm+bounces-103750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ6HDo8c5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:31:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836E42AB86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080C8301AA49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76221F936;
	Mon, 20 Apr 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BssFsHvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8nmCuwk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A03288D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688245; cv=none; b=MXHsPjJY8M/W1shZVP3VOs5C5yYurtt1/rYxrW43ViOqnyvrwKMEEAuEEUfJ/6LHvNhvyT4C2wkQR1XQl35EkLM2ll0m25DxGgEj/6jT0IsTZox4GnUsFx7XQi3vLC8soV68c867hEoJpkAZmce2wBkZ7TJNuI8gjQtwOQkE5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688245; c=relaxed/simple;
	bh=qhPi/8Cw47sntmr35BWUgrKmvQGOUQjqOqJsQcufebg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJ9mufvWIHvPDbN7cWcP39oWIEBg31tdGCs4HruZEZNhLLWkBYd5v8rfGrgEHT6ys7h/WnjI9+jo4szcutslDS7t2aZ0KozTlo3qFpq09HAxZrQUrH9gBShD2X3YEq9E8TVIQ91lluVyeIrLHZmeCvcXdQ4Yx6zyiqoNLs0Wnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BssFsHvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8nmCuwk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Z1613455879
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yDqkVlDESOE
	DMcULEWWfYAZBcnFAo0NPM57qDmlT4ek=; b=BssFsHvrzC4fjmIbguNU9nCgImw
	9WgwtO7F5BJB584QkSnCG6j8rcGpgfrhVkvEEnh4l1PyPs0xVsBL8R4b1/kg621Q
	Ah+LG+x45oWIE0xLspiORWm0VFTSZNLfy18z5ZbmqnE9m9eWPMFEZjCIC9yO3d2r
	Tt0Wxur7I9+mi3TpAUfiLMn2ei3SEo1amV2bhi8Is81RbAlxdBe+M5fEh/rXo0QE
	LSFW/gx1l/1nny+jvhfl2K/++zBdW1Vu+Hpm3Tqo+dRdct7gaLVPw46A+Po8Inds
	+8+JIb38n74z3joMjJ5YINLar0GzLW9VVBSggmL8bFSbElDALix55AhC0kg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjs7kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:30:43 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7aa1e8734d4so51232707b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688243; x=1777293043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDqkVlDESOEDMcULEWWfYAZBcnFAo0NPM57qDmlT4ek=;
        b=M8nmCuwkHdkZsl/v3ZIZRD61a6wM2zq+d3x1Lb1kS4q1djpXtVCte9u9EywNRrBv65
         fBfJXpHYp7aAWG6tzfkEn7TDjKzvuioZ+PKj95XYDmQiSm7I0YkRmLPz+zxJf92Q5j/2
         AJ1QoOmqyURchAgLL8MNBq62lJyu1Dxg9y9Ugsft51Reolx8VNiyBM9zyIgskaNTkPU6
         zp4fSiqfYi2THAMKrMB8u8H3/i5HDPHxWyfLkoaBjaNMkXCQUp4UxLizYwICkCoAc1wR
         Un6cTiwzjDqUlM87E5HszrP6nKftdl4QJ4pHMmEbKNp+9YKkzs3GFNeNriq4usFyVX/S
         Qs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688243; x=1777293043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yDqkVlDESOEDMcULEWWfYAZBcnFAo0NPM57qDmlT4ek=;
        b=T93X9MLKldiGSl16qgwhT3mGk68D2nI2Czrr/0DrLTqER+oDtUnmqdqm2byk6Qxt1f
         qS9m9G28SmBnfjs9f7MSZTZF8/+pCIL2G/VMBsWmcprti3sv9wZmbyDQnFm/XQeydZy0
         RWPaZDoJ1sQ0NGLIOBlsm1BRw938sla0a1rZFeXRTuPDNvwGWYy3UTEq8Mqnnof74NL5
         SJuJ9MblATvUQJuV9bpIX+5iHn2iou/jTCGMuxMrCytl6is4RI+YpjyMN5ik7PV8imwU
         zhQOo8rL0nS6BW8Stcm/+YSMJOYYM5JIGw3BKyHLnmy65oZ/yahoE3Eo51JL+E2we+Ky
         Gopw==
X-Forwarded-Encrypted: i=1; AFNElJ+utbcDEcc/QKW7SsHo0QqIIFC9bNXYTwYmU5AnhJX9CKMqIjVIBAmABzzwLRU5+CAZwFnjQvSbRErNFLb5@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDFsOdbZLTviRpwZLJE9wpmk83cok8bONbnjHeeOwEmNyEvUr
	LpgeYuV9GtKVQ+8FT4saK4t2ABY/b7qpRC2EPXj8s9OF2kfIamjafT8QUY26AX1iX8ERx+xPlYJ
	xv3G9Hb2/5HD7NajozEPcNLS5XqzDON8CfRTUdEhqwRL3HO4YjmuXAYWsLyEIdy9uoWzP
X-Gm-Gg: AeBDiet4rdhtEmH+GrNsYJ5puyZl/6vzmqPFgKUWHw1wKFjBbJSOXtu1xJS9V4RUonH
	WIjLd/+rdzHt0MDumPKobshtWHSnGvdHuE1dv4swcSW4ZpegMdHY2bCQoVyxo28e35JvmONh8DP
	FWdAiOFf8s7j0F69U/vQpAPQlBGERbwra0I4gpcohCpvlqVvKK0BJOSbmwu54H5w3ED9EM/cYxz
	qel7+sbHyx55u+EKhxcrgqcBHpqSPAnRKaG6e40RaNd57dGi8avB8GaIRTdwZ8Wz5CAPp84/KUQ
	XH6jog+DS9ODVCUOSYiX7e/rU6cS4fttcES/VXkkLQG2hqPLKWDp4KhV7WV/kv4kYFzgMfKVYw/
	ClDankReSo2aNhpCSIYC/I/MnULoaK9lQ5Xg5sxRKT4d1nDigZ+opFO0P73qx
X-Received: by 2002:a05:690c:112:b0:79d:67bd:53ed with SMTP id 00721157ae682-7b9ed00b858mr136993617b3.49.1776688242543;
        Mon, 20 Apr 2026 05:30:42 -0700 (PDT)
X-Received: by 2002:a05:690c:112:b0:79d:67bd:53ed with SMTP id 00721157ae682-7b9ed00b858mr136993247b3.49.1776688242144;
        Mon, 20 Apr 2026 05:30:42 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm42785177b3.6.2026.04.20.05.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:30:41 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Mon, 20 Apr 2026 17:58:41 +0530
Message-Id: <20260420122843.327171-2-ajay.nandam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mfUbEEVbgRJeC7lKv1uDByeoVDVJ_xEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfX+HlcqofmeWQZ
 RyR7D1cra56MJPrldPrpOxjKMjVqTPUGUZzvBk4i5RgmzRa/8xmyrqhXxLXic1kCcxDWQmx7KXi
 zObbI5E8GuIxc5YeoYYIH40eEzYwOzdhyW9TItfWoHo0cWvYJSAIgIUjpzxqsobD33IT6U7JDYJ
 QRkHA2epk08eTdakrgqirhHkUIS1XQ86MXUqH6kqDVPmFxS31BXqU2yO4BlMuR7+IWm7JJn/AwC
 IGJDsBwt/CSbJHwxGF2J/XLaksc4tyTKnEJDNVj/zPtEhHZIIAdGPw6ahlKbnUX4YwBomXvt7G2
 Nk+9bGdUvOJ8bmoi2tyTx8xFjfpSNJOBYvAy5vXp9/DoLFmxCiFU14iyaRoyVGnnP5YuSyxUbir
 AMOXVbbuqSB2oqGKTIOM7bdv3ppTwXTiRW/DgBalNtz5z68JBOuMPAQcv+/TgyPoIhxWtAxpgis
 lfS6cvT8gtjI4YAkU8Q==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e61c73 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=6iqXw53aW0HuLngz8iAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: mfUbEEVbgRJeC7lKv1uDByeoVDVJ_xEY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123
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
	TAGGED_FROM(0.00)[bounces-103750-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8836E42AB86
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
 sound/soc/codecs/lpass-wsa-macro.c | 113 ++++++++++-------------------
 1 file changed, 38 insertions(+), 75 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index b695c77c18ac..ded1cd8db831 100644
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
@@ -2548,9 +2549,9 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
 	}
 
+	pm_runtime_put_autosuspend(wsa->dev);
 	return 0;
 }
 
@@ -2776,25 +2777,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
+	pm_runtime_set_autosuspend_delay(dev, 100);
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
@@ -2811,44 +2810,25 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
@@ -2858,11 +2838,7 @@ static int wsa_macro_runtime_suspend(struct device *dev)
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
@@ -2870,34 +2846,21 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
 		return ret;
 	}
+	regcache_cache_only(wsa->regmap, false);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(wsa->fsgen);
+	ret = regcache_sync(wsa->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(wsa->regmap, true);
+		pm_clk_suspend(dev);
+		return ret;
 	}
 
-	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
-- 
2.34.1


