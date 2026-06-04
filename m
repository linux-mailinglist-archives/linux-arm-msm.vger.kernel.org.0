Return-Path: <linux-arm-msm+bounces-111205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EE78GEd1IWoXGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C5640125
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eyKcdI9k;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q5qBgIBC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9CE4307C90B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F3643E9CB;
	Thu,  4 Jun 2026 12:48:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C7247CC6C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:48:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577328; cv=none; b=PAa94zqxrMIaCo28E7U3z/iibtskgNmZQI3HBdoCzMd2r0kbPMcuYMTdr5MWIp1+ibcDZshLMw9Hn2dXKdiWIQtf/8dBXSAB5uSU/isPwYGflUkUWB1Cb1ipRfnJLlZIQWxd98J6vJIolJyFpKdbGISQykhBwfwWWWrjTcxBPyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577328; c=relaxed/simple;
	bh=LYlQL8slJT2X3TsQrVJGOcIURgOr7EAYfQdBwvHGCbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLDf6t1ynNtq+Nr84SNDn3uBs94f22znJi7J7GN+XgOG1n16znjQgLjgbPrsSZrUftPgWupd3BM26bznXtUCqxPyXxQ22frYBt7w7d+RPhColXYAIGUyuyvnOlBjitluK5IQ41YQ9va05w3TjM+1Ss8mU7EYwVjarSjcEna+kdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyKcdI9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5qBgIBC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BYoFl995280
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g3+Ward7dHQ
	7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=; b=eyKcdI9kbP8lRGFUMD6l1oNBrja
	1BIspPSONk33sTK3NAs7W2zBeVExNakfQyt4yUgiFtYugv3zmNrgqyXtcGyedzXC
	K865Oa1rHTMKxgXsFFaTpD4VF04ASVfWOEo69ltTnHIFhy56LrHIADAIT7Ygymju
	Tk9ZVoYZVgaI/7JKJXaafd80uFrxPzW5ADn2Bh/lKu1wv8btt8WZci+mEp6WTKet
	fSj1R7kV2ju8RwgOr0shAfxTEKTOZXvOCuiZOHhQ/ceaUe+j4KhupYbaSFeI1GTk
	jp1HaYwpZrnohDxhxR5DJ6trNnu9bozdlPTqdYcCLal4mNOnJz6BV8FrMDA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374sk42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:48:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8582b167f7so431499a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577324; x=1781182124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=Q5qBgIBCJXBhA0nrbKMvvFayCL13H8bo2kANmq/8aaJ2+W3NdCkgoBKwiXgm3NOu/7
         LjG3JcmDBFrW7ce+IRKfFd4JUDvCkV20eAcKQT//4UwdpWCms3mlQgeuTMHeeZTRuyZ5
         /cK8TYrI1wv6XxfWhxduC6rlZz82YcNYzBXDIXraQFTBUFy2OHhG1+Lq4O3BmfSo9KeI
         fWJXXYMpheMtoCxbtCFmq8bGwx8Oz8VZxL564LNvvstP7OA+BGBs5cTdYoCR3OCmGPIj
         9bJwZCH4EojIuHnPIsaxaoYxCo4Acm6whSRKOAQul9ivU6LMH75hiLBhHvs0jx3iGBUk
         0t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577324; x=1781182124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=H/Q1YslUbIbBi7qDsVP/a1xDNrrpYTYv4pN8/SMBlznQSK/671QGnP0XkwUomu9M+Z
         af6FDomzXQXPkWxcAjBAqWX+UhlVLxeihkVLTBICvn/6rLVQG1kmSuk2Hig3Db2fYxbC
         wydqJaF5LAZl6ByuOO9M4D4vOheQoMKTJzaZNLTb9dr3r0F3YeIrM7IkzA1ECbiG09uC
         vxKFFPU942ERZflzkNRrr+v3mH3amJTepGsIEYNc1uoSgGgL7izNPwLOhavAoyLUi4Mr
         8dKMESiizZLC/MGP4hOw+nevPRltXd8SuBVn0oszd22xB4FnrNYJRDTxV+gtRX0T6DcR
         7gig==
X-Forwarded-Encrypted: i=1; AFNElJ+mrwsjUBNDSyXWCb0auvDxnGhoG/xeg6qudND7lHhFglK2H41rKQCHwOWux8SdfHKm4w3nRJPpZ58QXZFh@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0ahNNYIXu/7tdKNdyKDyekySbSrZXIevlK/s8CUK0bvClZcu
	wTf9CSSDhpbesNB1061uMBrVHH2NUUrne3IlH2MLXexXFePgpoO15WbmKmNdi16SC80SmrKsOXL
	DCQUwtdsPM4fcg34h50B7VnFhClq9T4hhN5Nx3Q9ZiIxLSm5aGSI0mOeJHFWKsZZPgE9Z
X-Gm-Gg: Acq92OF7sja7ff03B5pRpIghTuEP06lLOA+UYEEjN2L7Mt6XsJhO4pnhNavVyXAU0mf
	5P0qNTx7yQ1TP+8XTOqR6o51mQUIFB2XcbE0pn359rmxpl1SWEdRNKx/o8X7b2YW9nSXf+50GxD
	1vavsROSw0P1o/GYeehcmGVq/0nMOERQa/7ckMcfWd3OB7bQtbkBapW7iYEj0XeHpI0voIn/iYz
	xxhQTYUlGppUIFUzC+px5wGf87qLlM1g+7VgM1Dti5HHXpL5r5rT0y7EMbfqK7sYv1GxYEW5wik
	aLD+q83m5gFkH3Eim0cbH0+hGgGYRt2VjnJtVEH8zNookqCK9sx8MvZoJ3DuhNooVKiKlzGwkbA
	tCrOxHanyjJrqEbHB+yv0g88j2CJoV73cHLT5bU0mW4QxCoPwivn1RLCF/6ya
X-Received: by 2002:a05:6a20:d80d:b0:3b3:e05:7fc4 with SMTP id adf61e73a8af0-3b4979a261amr8468710637.30.1780577324010;
        Thu, 04 Jun 2026 05:48:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:d80d:b0:3b3:e05:7fc4 with SMTP id adf61e73a8af0-3b4979a261amr8468679637.30.1780577323518;
        Thu, 04 Jun 2026 05:48:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:43 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Thu,  4 Jun 2026 18:18:21 +0530
Message-Id: <20260604124823.3467457-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
References: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX4Qa/sOtBWbtx
 qUdhEtfrqNd+O60/weZT4X1WJ2l0BaZgKK3QDvLGY3uOWhb1srxQDunuYO1Cbpw/pL0BB2gnVO3
 1sbFdHONNPd1n/Oh5lQauHT91gPQbLb4cLUaWTgy6Of0wf7X6l0P3tS8rcic1yViP0bJXV/2df1
 DZYoDBob1VhCzxW6uhDh0VzkZi8f4aZZuB0w1SzwPyaMFvh+fG7TMTaDLAKz87T24R/feY2UVv3
 S+15TNPAHTbhGiJdXG+LCQpPGFrf5Xw5e4rLZ0YDjXXN+p8TkvVTuDp/yDK/cDw/Zsvw1vPdL2F
 XZyhAd2HjFXi6g5i74SEuPKbT5yxcJLgIJmOTUBeq5w4PFCwXKbIJF1wP4i8Ed+6qSBPL+pbRCj
 K69v+yiLQuIJ8fo0ExyCQMIef/VFEKqCFTcTRTpBKoJYW6QRIFZQolUZNFvM+tBHRjNgz3dCOdc
 lI9kYEkYwFapv6uQkcQ==
X-Proofpoint-GUID: XMLe3mH1chKrjJJ3aWxZhc4IOjHAJMhd
X-Proofpoint-ORIG-GUID: XMLe3mH1chKrjJJ3aWxZhc4IOjHAJMhd
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a21742c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0L53WUX8MMYAS1EgRPIA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111205-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC5C5640125

Convert the LPASS WSA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 126 ++++++++++++-----------------
 2 files changed, 53 insertions(+), 74 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a7c61f7c7f4c..458ea62ad983 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2889,6 +2889,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..5952bd6638ae 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,7 @@
 #include <sound/soc-dapm.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
+#include <linux/pm_clock.h>
 #include <sound/tlv.h>
 
 #include "lpass-macro-common.h"
@@ -2529,15 +2530,13 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
 	if (enable) {
-		int ret;
-
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
+		ret = pm_runtime_resume_and_get(wsa->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,7 +2547,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
+
+		ret = pm_runtime_put_autosuspend(wsa->dev);
+		if (ret < 0)
+			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
 	}
 
 	return 0;
@@ -2774,25 +2776,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,56 +2809,41 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
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
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
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
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(wsa->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
 }
@@ -2866,36 +2851,29 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
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
+		regcache_mark_dirty(wsa->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
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


