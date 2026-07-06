Return-Path: <linux-arm-msm+bounces-116849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z8l6BketS2qAYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E388F711417
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bJ3Dt4h/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y5ccl5g8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116849-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116849-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B13D33052224
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94EF40A959;
	Mon,  6 Jul 2026 13:20:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99141A791
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:20:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344058; cv=none; b=DVRnFuKReODnDgrrVXpxythCjFf6nAZX0s7uuLISWTuDraeBi6Pl4GR4Q5X6k7KbN5zpLxV8ZJDYjG6plPBIy4dPSM4rDZZ/P1+uB6jBhGa2ReLRO4CZ3a8uqeGr/MEkGpTR6hEyFx6C5MGYtlzn22sOksYIQHqEWQkx1sMRNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344058; c=relaxed/simple;
	bh=uPGUqAOlSO8DqQWH4/dggJYz7ATT7vMfn2qW6j41JUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uf8uR2yYKwcLivEWoh2QshL97hQ/7+y9Cc6Xf0S61lBfoEofSSb5+HzM36b9JmqTrFWnSFHn8K69QPagnl+UiW9hHVwc/75nH9ZEXVeRRxApQNblhvBFB8HSiKvZPXXRtFMcdaPqV8VlDWgihQP2bRNUKqj2qQqFnf6+t64+bi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJ3Dt4h/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5ccl5g8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxK6a361446
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kk7xpWPEPxL
	RxWLGvjCFd39hKfszuDFeMvQ50jYPPus=; b=bJ3Dt4h/Ve3AB3f2KhQNUdq2YN3
	6bGN0im90P6T46hKVbeZnHlcucwcXCcz8XKtI7d92J2T2qzarMB8byNL6MPRK9pA
	a3g7ywEn3dZo0fkTsRbQKM8dYsvSM7q07MXrL/62tQ+SpArdmDDr9adsl2ewu40e
	LEnQsvG1wJblF/Qgyb2pj1ZSfxJX52Yk3A33WogqwsLgwA8kB1u4SqQNe0BRO4db
	LV8Uzw9R/dvk2iraRvaLVKwmGZ3BTOSzFq7X7omjWLn96/TZPMK9nCY4t3LOxrE7
	HarO78UsWM1P1Exva2eTTPjDW5qlDmB0KqlyKMsqocUK+q0Whd9hEhD+k9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51761-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:20:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc77a6943eso62424295ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344047; x=1783948847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk7xpWPEPxLRxWLGvjCFd39hKfszuDFeMvQ50jYPPus=;
        b=Y5ccl5g81YfDddFX3id8izJN6VqPk1MOYWDT0cx4aXak01N24Fr6NYJ7+yLS7e0XkH
         cMUPb/P1mDCjYPnQ+cjWFvEAEb4N0AeMltl6hBL342txvhT1/UjEQRj7bSxY9ukjZs7C
         BXF0ZuQQPpYBqLsdk3fCbYfRDYta3NH0NRFByFHtWrug+2secvTebSzTW/oRUiapOn61
         TpmT+1B31kZ1eklDMds/nZOEwBkH69VXpwc1au1QFJXOVvBXXH97QvvtZX8D7fAGyfKp
         eLOgLuXC76h/LQuTJYUHOG2TNAy1ioHfQBc+o1sE9wfs1h6s4xSboXOcyZYbVFpWrcfI
         NRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344047; x=1783948847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kk7xpWPEPxLRxWLGvjCFd39hKfszuDFeMvQ50jYPPus=;
        b=LQb1B9bgxWwR99JyI5fv7cjKipfzgFPgx0+z/l6WRpp96XaZdBaLzPpWMVd49Kf6/E
         Zd46+SpLiIhqN1g1o9QSmoqhGvE4o02mvFxVJ1+o/0o49VnzrZ2KxFYp6m3aBpguxj+i
         5LlHtaqC13zvuz5VUY83lKp4VKNy0evUBx+WBUBQbcNiA4COAT1H3tZXb9iNcMU3Len9
         +RbfScnlWyw9f7tjszB+b3CaZJ+Gx6lPrFk0JZlUgrxwCh4wttMyyWJ6epxy9HvzOGjj
         nM0IL9cTgGwIrNuQHwknLQAdR83xBQ19qkP1rWpyG38cHABTPgWi5sMohwR2Hw0lvdXZ
         /+pg==
X-Forwarded-Encrypted: i=1; AHgh+RrAZiEk9NUbzaDFFgVW4pHMFsx/bwymCkem+Y259Cvf9IDwxDqV6b58JnO0L6YbteMcrfFM/P0tIucK2C18@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9COh6M3TWuvK37tIj7qvcbbnhFcbM0Wieb4/ggvAKtFzmjBg
	Ylm8J9YmpN4rM2kma7rxXtrFrmFtILVtDJZU234UB8AXzrAeMnUBS8QhhG9OS2aFOrNRExK7e31
	aq7uPokbOGQ8fSJrmZ5Ioa9GaKo2wv5m0gXV6HFiTN+yq0PXUxxTEnhj6xkNaALgKc/tJ
X-Gm-Gg: AfdE7ck+TfgujqmtcRw3yEK7jLhuFOQldKggMXJUeI8afMaAGoXFfolTZ2BXK3yG7sW
	q2fZLN8CUM6cGhIKsu4qzcl0FwhBChBpSDAS2igaAndeaGM1FKD7X9V+KtSXmpdFhQ0GzZ2XzHf
	Vn4/e3lPEDox4ahoLyX9yrm7ycB6OhWb2YDQea/d3s9UNoVfaeofVN6eQBUgestiecmmDMASbW4
	uhq5FcOGHgXVN4Rg27JunUm7QZN5sg0iCP9fZtU4sur7PQrperkfuwM6c5W+dgJhEOPuoROAY7y
	Zq8hfed9GdOtBHWwQrJtRi/0pfHRdffswoN5glsA5sK98QOdA6fPDtgRUTIw6WdQUV0gQyJ0rlb
	m7nPfTRRQ0sHUO+E9TJKQ4SD6rueTVtmgqxahFy3pBaYe+oA=
X-Received: by 2002:a17:902:e94d:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ccbf0515d2mr4751265ad.23.1783344046791;
        Mon, 06 Jul 2026 06:20:46 -0700 (PDT)
X-Received: by 2002:a17:902:e94d:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ccbf0515d2mr4750765ad.23.1783344046290;
        Mon, 06 Jul 2026 06:20:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Mon,  6 Jul 2026 18:50:09 +0530
Message-Id: <20260706132009.1496321-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WpazPe0G9RnZB-42R8u52pMyffvppGoH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX3xxz9r7gykiA
 M0z3dddtmtB/APiSaWls1JA3EaMYD2npky0c0xJHhAO+9S34zThD/E/ypoeJqJ9ovpmUrJJqMWL
 46JtzDGN2JvV3+IVKyWTsS/8ggx16AE=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4babaf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KeRS1JZPbsj9qF_qvq8A:9 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+yWWaHD+qepT
 JQXyONNRxWALhPEEAfxG0K1yT0yvUz/3YyQpDe5SVgBGEPMGZsj5WWx8nQgkpYoAJWUabriJBB4
 oWhGDo7QeYDWLGdGeUQOrVYanMK1ppb7JMZLyug/jkphOlq2c1+1zLc4BNANnlpczA8DDyVVrhh
 1rNHTH9niLyAdkNruSGNhEkOxcA+YXxTi3wVPl41E4WN6oloWOoh6i0qWDq0lsj8ubZM671dZFh
 auGtN6lqbDDIPSilZizHGv/gPI0Ecohk+aBlJZh5oIwavEYIC9uLqWr+NGCGA0RBQAX6B5452qG
 Vyz5pgwcEE+aY9cg8dv6ALXjncbRgw+6d0luo+bpjMAquMTPGcSw2pOH46VUA2gN4eIk+fC/2Xh
 9ra4WG1R6lTLQnd9wMBoUrl8pbYYQqdRsSliYp5viJ1ZdhhI4lYIwToKgmcP5kUrHCN58kSWsD/
 vPIVXuof7PWLo5qJ6KQ==
X-Proofpoint-ORIG-GUID: WpazPe0G9RnZB-42R8u52pMyffvppGoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116849-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E388F711417

The sc8280xp machine driver is currently written with a largely
SoC-centric view and assumes a uniform audio topology across all boards.
In practice, multiple products based on the same SoC use different board
designs and external audio components, which require board-specific
configuration to function correctly.

Several Qualcomm platforms like talos integrate third-party audio codecs
or use different external audio paths. These designs often require
additional configuration such as explicit MI2S MCLK settings for audio
to work.

This change enhances the sc8280xp machine driver to support board-specific
configuration such as allowing each board variant to provide its own DAPM
widgets and routes, reflecting the actual audio components and connectors
present and enabling MI2S MCLK programming for boards that use external
codecs requiring a stable master clock.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 245 ++++++++++++++++++++++++++++++++++----
 1 file changed, 225 insertions(+), 20 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..b13f39dc5afc 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,78 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6apm.h"
+#include "qdsp6/q6prm.h"
 #include "common.h"
 #include "sdw.h"
 
+#define I2S_MCLKFS 256
+
+#define I2S_MCLK_RATE(rate) \
+	((rate) * (I2S_MCLKFS))
+#define I2S_BIT_RATE(rate, channels, format) \
+	((rate) * (channels) * (format))
+
+static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
+};
+
+struct snd_soc_common {
+	const char *driver_name;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	int num_dapm_routes;
+	const struct snd_kcontrol_new *controls;
+	int num_controls;
+	unsigned int codec_dai_fmt;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	bool wcd_jack;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
+{
+	int rate = params_rate(params);
+
+	switch (rate) {
+	case 11025:
+	case 44100:
+	case 88200:
+		return I2S_MCLK_RATE(44100);
+	default:
+		break;
+	}
+
+	return I2S_MCLK_RATE(rate);
+}
+
+static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
+{
+	return I2S_BIT_RATE(params_rate(params),
+			    params_channels(params),
+			    snd_pcm_format_width(params_format(params)));
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -32,10 +93,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -64,7 +121,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (data->snd_soc_common_priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -96,6 +156,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	int bclk_freq = sc8280xp_get_bclk_freq(params);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+
+		if (data->snd_soc_common_priv->codec_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(codec_dai,
+						  data->snd_soc_common_priv->codec_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_MCLK, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_BCLK, bclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->codec_sysclk_set) {
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     0, mclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -117,6 +234,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -127,7 +245,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
@@ -145,37 +263,124 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = (struct snd_soc_common *)of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENODEV;
+
+	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
+	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
+	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
+	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
+	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
+	card->controls = data->snd_soc_common_priv->controls;
+	card->num_controls = data->snd_soc_common_priv->num_controls;
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	card->driver_name = data->snd_soc_common_priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.mi2s_mclk_enable = true,
+};
+
+static struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{.compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data},
+	{.compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data},
+	{.compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data},
+	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data},
+	{.compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data},
+	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
+	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
+	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
+	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
+	{.compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data},
 	{}
 };
 
-- 
2.34.1


