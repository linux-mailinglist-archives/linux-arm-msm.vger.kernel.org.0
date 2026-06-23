Return-Path: <linux-arm-msm+bounces-114101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wJ5lDBczOmqa3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:17:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA36B4C8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LcAvmHIQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I4Ieg2Do;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF6CC303B7C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598F1345752;
	Tue, 23 Jun 2026 07:17:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BD3C4B87
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199052; cv=none; b=bR09ckWScOqyFZU7Ez3z7w6VdbInr5LvBnAmlV7Bo6+MvmQI8UL9oXGVos0ySaAGAcXGc0pzCrurW3pypwL39rbjL+W2oMQMPcG645zBQPwU89QX3SiZJUFGeGRboayUhOEayFQGACE02L9QKF7PjY1d3DeACHeb80NQhaZUAS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199052; c=relaxed/simple;
	bh=LYlQL8slJT2X3TsQrVJGOcIURgOr7EAYfQdBwvHGCbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gS3g+iNUu/VarJrvZcIZltnjR8KoGHzfrsBbpI9IMZQcaWlcB2y22r6DBlqHy8bUt3oHi9pMl9ImeiaklWdacBvjFp61fhs2nGRlhIaI8s9g1eW8OugjjJBLEIct2OTIW3ADZnCAd/CI5+LrSH1+V9K/26l9gMxgJhoB8umSqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcAvmHIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Ieg2Do; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6daXC3631915
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fW
	cD6KwA/s=; b=LcAvmHIQoIrG6XUe95vyP5YRDEgQlEk+p5ixilUHyBuNnnujnCZ
	A+GWn0UnFLu6LK3hr03yl9oQVUcpaKFHVEADF9W1mxO5HoFHV3YRdjwE7LH65x87
	Ko+BLBoQUs4OH/CBkODfFj6UMkIk/ZJkc2Q5A2ukv1IRGXhEjd8Py5U8PtT+1pEI
	7icHLcBEdH0uQAQuRDjiflfv0FrA7xKmY0XvrySE218odbO9j5aqZf25fxk46xmr
	LsKsR0uhm0OD13/51NyrjQwEPjDLXSCsFrQLcK6e+gbYnZ2slsjYMp9msFDpeMHa
	V1JeE2FUPZ489LSnfo5aFit9TXMeGxTHKSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvr7v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:17:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0d0516ad7so56532595ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199049; x=1782803849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=I4Ieg2DoKDjIort4ApV7GxBePIPcHX4XFoCkbCWRbMyBO/ZRinydT7AtaLcaHYCfx+
         0v+noAUyfSK0/ncNaf6RRLN3vL1ihLx0HC+WliynRmvvk3v+WfFcKl7+1IX/lX6xbxYU
         r1vOqEztN3AnSTHPfjhdGfSv0asHRdZ51WNBY6ZZGdfYeJIWtqaeeWm06EbRc1Jg9eNH
         dvEQiiIb95B9AzqpdpmsQqyHfCRhLDBsXdowZe1MCGBrqdgwqCnEN45cRU359AtFXdSd
         4+1sWpxHk+VB2Gxw7hqdGjQTTnaLM8R15muyGunRcEUh6hJT9z2uGIXOg4Pq2nApT6zI
         lIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199049; x=1782803849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3+Ward7dHQ7AzvjxSqcPJkFYwCD8AMq1fWcD6KwA/s=;
        b=B4I8OuhBIKfv2lRj3TEa45wXeVTvbyVMziMxBSmqJIc6ys6kvclTdRSndfWdVrQ0Ir
         8GZXk13RzoJWySId75dJ9fg10EhUd83ggqaDl0MfJO3HHTxZ/2m4nHidSZtp5M9t7Y2z
         rELLUdvjJ+MJFnusFITnovXy9dRMZEHrnOHPq1QU8/cIPlv2Zk3Ya6m48DI7t5TAXkDl
         WuQceAVpQKz30dExUBQqFgaB1CRPk6o3yNKpD51LD1ZD1dWdLZTOB01UCennx+p65Tg5
         MiP4uNgEO9odFavCpu7XapJYFLRAVpjsEKvsJqRvrzZj0BsAv0YlxXfttvcQJwA8pp3U
         Gktw==
X-Forwarded-Encrypted: i=1; AHgh+RrOdhBWRpae7xu4Cu3fZsmHgd3lqn5/fGkmwk79kYp13lRLV7ydViMZjSGmWDTywpVqSnwCKQqH3qoBAMep@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yDX6Nj8Us+68Uh/+5sjgremBH+Ub9TUaQA5REOO9ERNwUdUR
	EYfba2qwBas8eDVgSoDmYGgBg2MmUCkw1bSloDZkCyxEAbZBnsiH1J5ieAp5n1x3n8ZZKe1WxXA
	+iy+E2Kand/2HWstg3E2kFIC+dAjJoBppRwR3a1l7RG1+OByi6BLcRVoAAJyAtB8nIRN/
X-Gm-Gg: AfdE7cmyDZMmQj5NVgN9fEDcpy9f303BRYd4YUQGLruH7RvcDuxSunwlS2PEC6wRy+R
	/ODUQOEIsmfZfOz5U0PoZvSVJbl0WwVqXkPfPtuWU/W1hJONb7RqqTdMKq2m6/mQ+i3bVAZHrZo
	kPCeGnp7DmtQdijBhuBP4M7G21aXVRNhaF0biV2zxvCEBPYL0uJqp6z7HfMtBC8GKS1x7AZaPD8
	+cYz6WWrttrGtr12WXmLZfZIYm9w+V8FQ3m/D/ekvf7oBNfHU40CCBzlyKb0ntKMempJl2MDssy
	fiHowdoeUUU4jxWRCyk8kpSGePA3BAmsL1nzGWmDhAQM7qEUUsQ8mK2/yRt/0ffQ5NDUhfZtbBC
	ZbgSpOTkG4FhFFc2sMWImkFHWlisxGLZbZRcrjaU=
X-Received: by 2002:a17:902:c40e:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c7c9a9be7cmr12879015ad.25.1782199048670;
        Tue, 23 Jun 2026 00:17:28 -0700 (PDT)
X-Received: by 2002:a17:902:c40e:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c7c9a9be7cmr12878815ad.25.1782199048182;
        Tue, 23 Jun 2026 00:17:28 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Tue, 23 Jun 2026 12:47:06 +0530
Message-Id: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a3309 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0L53WUX8MMYAS1EgRPIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXz86CliJNboY2
 4zuhcyZTIo6AEI7EsP+QgKO9m8ELZB6cQWys1VK6NDIVBLdeOIijS3AINzPNO0oPv1euSVc6Pxb
 0fDGhrANQlxykxYfYhOXLMj9braZQ+o=
X-Proofpoint-ORIG-GUID: oAJABOY7crT6OO8QltuKIGqPAYzSccDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXxoCf9giM+LoD
 EggSRQQoWuSrFheuMHj8z42J1CKbxfBBkXjSLnreIG06qJaRRkGDPhH/P1Aikw71HXC247nz2rA
 GvDiqlFIGC0dZKNtoFpBTgXXqk9EWSI3asUzg3E2Zu1xf/zobASF/IqiCwgYJdpmLESycSjzRRb
 g1aFUVQeBsEOh1PV11ZUFcczHATdoMILS2xuq9ztSlzKR2/Rsz/tWsnokFkRXit3Vh0r9aZQTIh
 vzIKc5TMuo/072aSZKhLhtxuM3O7CiPzrsQgP8LpAMediBXMECVeSLdPdKuSLG8vFoNF0DaFXUt
 tkh9RUnxVycld4xpPJl9wojLidoQfF7pPKn1x70BNuSXJJidy+jaE/TteXRF/c5Zt+f3GwCXsbQ
 Rm25bZq9WhKlGK/yD3Fftv0UruKqUY2tQ+PgK1YkuY9fKmt1UB1j4fFCN43spedgWjtMVx6bEtt
 HAJ3aMTTC1LG5/WeUDw==
X-Proofpoint-GUID: oAJABOY7crT6OO8QltuKIGqPAYzSccDt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-114101-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99DA36B4C8F

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


