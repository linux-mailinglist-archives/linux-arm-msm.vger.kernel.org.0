Return-Path: <linux-arm-msm+bounces-117235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ifxzAljKTGpKpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:43:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D3719EC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FTfOcgEq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=af9gwQM0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD495300999E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F7E3C0633;
	Tue,  7 Jul 2026 09:43:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A83C0628
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:43:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417426; cv=none; b=hkvtMAH6nkWEtnewcoP7Qhe80jZjMOlB3gz+eQCNdLjcXEOY04ciEpW3EFU5vpJIiIYpr7ZGN+fXoPnSKc65Gq9gCoVD+61Hssodpt5C6Y49QEiDiGIgZIY/GcMlmwsQ/VEgr72i2CKVFIG2mDGcFx0yNfc4C3Om2HmiAlqbjwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417426; c=relaxed/simple;
	bh=p6MkxTcG7Msy18PNCWUslWNtjw1w1EQTF3X3XfZ3gZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHZtPhb3TfIvyiFqsyFMcergX5PyTzEhvgEtig3bmGeAXd2ehpWUzrs7NxdvrYXYgL9HxMQX/gbiqrxd6mZCngm7AEN9Ffzr65q7fJp+SqX2fhXKMwcYLWJ6RCZMx3/GFxtTYd2lcyf1629ELjELlCXVGLGVmqzzv5iRSFJGjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTfOcgEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=af9gwQM0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E4623004589
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=; b=FTfOcgEq8WqLlHia
	lJnFrKgb9Xdi24cZvqmC7zXmmeYHJliipDtVoNr9yNmWl/KV/VWHxwVreVRHgnTl
	PnV/6P1G3NjddMNgfLQNCYx/t3oh8KtUWp+Q2+6p22KK2n/NCfkqUv25aYPbl5xf
	PZnqjjOBMVev2jcudAFu2j4ybqvhtii8Dh0npOVGpZ6yjzkZjKeYMWJhWVhE+Hd8
	YnVmIxDj/9LaDtWZJUPWeLHEWcfLg81bGMiVas5rSHYirlx7M93KQBIlUFAu1jew
	GhoQeKzEDLESuVzi6s2sa90ox1lZiWzM6Kdnxdp0Z4kcz6+zryTh4RYKJm0JRTf2
	dxQLLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su719yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:43:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso13108505ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417423; x=1784022223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=;
        b=af9gwQM0XLx4DgaXEdD9z+te52N+3y4yjtLitqTEgLjjYhj0g8mAG8bq4h/yhUXdqe
         VWnrYxNvk5Ao8zz8STit+1Ko0bsNXD1HnmrYWvoS4j/CsvcuNL1BiGQdESqmBOlFqVBt
         yzD0aFwjZVkIH0DZvoZlOyyvgOwXW987gKHt53M7Ep2nOy+l8gTb+wjJmI9C+ydFihOn
         GTTcdiLVvbNkZG7lvX6CCH8oFHx8C8bbotP9NfWQafdnRuh9cNYE3JTR26hsOMFW6gEf
         +GxAsc14EVFfYIpNN6Lkt76tRKC9r9xxTuEC4s/ek1AVCpWvvbOYvHOaKBlJV0Z3cnnh
         Mxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417423; x=1784022223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sz7H/On7EVNikTZ2hOinzKwdtMxFMGJzuQHNXxzpf30=;
        b=ZtOf9j1NEl7/Yy4oKuyWwpPnJZf5cx0l43uS75s7RRNhwiplChm5h18nFypiJYxvJO
         +NFkAPJtUTPitAlHplhCWzFTf0XqygDBQMDAhbazp5rWUCLBCl/bbv48srMfQ5GpgDPC
         nGPQRpqkRQk3gddnL/Xihm9uJljVLiuV/VZyj7+y1E4TB2UxU83zoyx3cd+yzy8YhZi4
         Y46US6REJevUhK9oPmK9nmYlLicjvOVr/VdB9Dc9J7Zr3MfP3IUDzMDdiYY2p3QmfzG/
         bSLn8LTz/hUMEmo171jomvHZugP0x3gzSY1ztrPV6QGsestszW/tjxYJaykwQ6KPaeoq
         eKBg==
X-Forwarded-Encrypted: i=1; AHgh+RqA1SoSgfY0rXTkWlW8UfAsS3szJD5VwNZjEl1hEvv4PcPEOL+gsN+Lsml6gdFOdQzyrlU9asLjhSaRXvup@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uuxNdCZakcet9P3yNsXian4/i2XeiuTjwKgYYIX88GFFWSyd
	P5ozRO2z11MXhYgXg+Cx90Uv7f/2Q6jzIH0rz/ecZFWN2JtqVu7Vd26j+NK9zKtpDjLLtkRiNvQ
	wcspgjr3BN+NEvz4vaW3dCJ0DOQO1L24BArtgknyznAibzVFcgmJOK2HO85vdGT1AD83BIMMC7n
	jv
X-Gm-Gg: AfdE7cmLlb7taicR3txCZRwcJRgRqxTLlE1tm4RXx9VIc5Ka8bjx+eqV2xATFY44M+1
	Q8+yxBJG1+diJ9bYqfrWCf3BD+G4/50e4CkSMZlq472MRCmcd0Xx3WW2pI3IMkm+Oh8L/xAI2vf
	xlA+/Kf7tnPtfDnF0oqe5ok2ux9jq/f3q1Q++cx9UM0rjJiplVAGTFddnpOOlX5UQIU3xpyRPI2
	8tTtBUG50kQtEPh6uK6HnC972I1oQ+ik1/BMqJkyzai/ogIIF53y5rOBr+BntvFM6jicEdghwKz
	+V1NT10jKv/Xcovf1yNLTuHse4kJ329XT5j+jzCrBPrz8AUypBA8reOBxkxyppEUeRYz/y+Mdcf
	HA2g9zVRPkS9myINIcVe+yUGW3TjMsYSGusgo4Pc=
X-Received: by 2002:a17:903:2350:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2ccbf043f25mr46499355ad.32.1783417422616;
        Tue, 07 Jul 2026 02:43:42 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2ccbf043f25mr46499075ad.32.1783417422065;
        Tue, 07 Jul 2026 02:43:42 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:41 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:13:11 +0530
Subject: [PATCH v2 1/3] ASoC: codecs: lpass-tx-macro: switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-1-f61b4622f97f@oss.qualcomm.com>
References: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
In-Reply-To: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX0w3n5TzTH9WQ
 6qJovGHWiscgcw9HZ8E5QYuGgZdbz7fe46x0DJ+tuXpmi87vJD/N9e+9sqPWTmH6YdmJVWjZwcp
 SBEpXZZqx8f+FIxGX5bKJkJTCMlt+Y5GHuwK3SiAVP4JmGn2s1x18fp8QQKlpKGoDFvC88pWP8e
 wZJIkt8p+Uzt4pkw8KhifyfkTdUXDxMuerCGWIWXKT38sSxydnggiSbmNacsyLVHJ4kekDQSHMN
 4mePrpd1Brh1/C+d6Ppob6pi4YhNowfB43nV4vOm+D0cukEwOFIU+QiUNpSfAIIAzDTs4xQNNCA
 c5Dc/ZI7i/dJ7vAf4ZKEXVd8Myzve4+MxFqA0n8AR21hZSTOZ///WGz+SrJysEPe2wbOvsrO7Dv
 kbl/uLVu6zP+w7irkKUNWBKDQKh0ItkgyOtPY2NKQNbyCI3kttWCm/oqHFQSIpdFLhtiPhNoeyQ
 Ck0T/YEt/YT67rEk9lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfXzVfZeXXBR44C
 MCs1tF7ZAoEi+Vw8KIWoS9+HZoDphciZHS6Gp+jTN1iMYS72mUdOV2HOWcujkCjNqyMe1IOC73L
 bgboriYFOozjPE6rGtgsIo5164dqeOA=
X-Proofpoint-GUID: jwZxR_Y8fLwi0_R7yj4O-ZLFS6tHRywU
X-Proofpoint-ORIG-GUID: jwZxR_Y8fLwi0_R7yj4O-ZLFS6tHRywU
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cca4f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2ztkfpsRXklUYACcPygA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F6D3719EC1

Convert the LPASS TX macro codec driver to runtime PM clock management
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_TX_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe
and by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Co-developed-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-tx-macro.c | 112 ++++++++++++++++----------------------
 2 files changed, 48 insertions(+), 66 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f90a0d4c77ea..cdb50316f471 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2909,12 +2909,14 @@ config SND_SOC_LPASS_VA_MACRO
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..fc073a556fb5 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -2149,17 +2150,20 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct regmap *regmap = tx->regmap;
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_runtime_resume_and_get(tx->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = tx_macro_mclk_enable(tx, true);
 	if (ret) {
-		dev_err(tx->dev, "failed to enable mclk\n");
+		pm_runtime_put_autosuspend(tx->dev);
 		return ret;
 	}
 
-	tx_macro_mclk_enable(tx, true);
-
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
+
 	return 0;
 }
 
@@ -2172,7 +2176,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
-	clk_disable_unprepare(tx->mclk);
+	pm_runtime_put_autosuspend(tx->dev);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -2318,25 +2322,23 @@ static int tx_macro_probe(struct platform_device *pdev)
 	clk_set_rate(tx->mclk, MCLK_FREQ);
 	clk_set_rate(tx->npl, MCLK_FREQ);
 
-	ret = clk_prepare_enable(tx->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(tx->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(tx->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		goto err;
 
-	ret = clk_prepare_enable(tx->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		goto err;
 
-	ret = clk_prepare_enable(tx->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err;
 
 
 	/* reset soundwire block */
@@ -2356,30 +2358,21 @@ static int tx_macro_probe(struct platform_device *pdev)
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = tx_macro_register_mclk_output(tx);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
+
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
 	return 0;
 
-err_clkout:
-	clk_disable_unprepare(tx->fsgen);
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-err_mclk:
-	clk_disable_unprepare(tx->dcodec);
-err_dcodec:
-	clk_disable_unprepare(tx->macro);
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 err:
 	lpass_macro_pds_exit(tx->pds);
 
@@ -2390,25 +2383,23 @@ static void tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(tx->macro);
-	clk_disable_unprepare(tx->dcodec);
-	clk_disable_unprepare(tx->mclk);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->fsgen);
-
 	lpass_macro_pds_exit(tx->pds);
 }
 
 static int tx_macro_runtime_suspend(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(tx->regmap, true);
-	regcache_mark_dirty(tx->regmap);
 
-	clk_disable_unprepare(tx->fsgen);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(tx->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(tx->regmap);
 
 	return 0;
 }
@@ -2418,34 +2409,23 @@ static int tx_macro_runtime_resume(struct device *dev)
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(tx->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(tx->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare npl\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(tx->fsgen);
+	regcache_cache_only(tx->regmap, false);
+	ret = regcache_sync(tx->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(tx->regmap, true);
+		regcache_mark_dirty(tx->regmap);
+		pm_clk_suspend(dev);
+		return ret;
 	}
 
-	regcache_cache_only(tx->regmap, false);
-	regcache_sync(tx->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(tx->npl);
-err_npl:
-	clk_disable_unprepare(tx->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops tx_macro_pm_ops = {

-- 
2.34.1


