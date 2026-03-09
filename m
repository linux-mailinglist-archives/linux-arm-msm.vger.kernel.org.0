Return-Path: <linux-arm-msm+bounces-96227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ12MJCrrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:14:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD7237B25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF5F5303DF53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBAD39A7E1;
	Mon,  9 Mar 2026 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gf/OaFlJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jnou+BRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2E039A7EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054811; cv=none; b=igl5f8/aBks2esF5BCnOoKQqO/iGp7QBFAFn0h5mKjca/LyVQXZVFO1rQ3gNudv57Mz1CwK5yjUKeChi2alUfoBvGaEGTnnkxV2qfSGdpKm8ct65aW+WGIsSoYpGQ4uqTm+vXZ6c5b35I89f2ccLfWJzodLkCkK/x+K1c43n7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054811; c=relaxed/simple;
	bh=Ui0AgihxXCFaYgr+bAZ7i2l9gkj2VFymgy3DBZqKJDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r2f2+9hIvAO/QDnPw5z9iLvBjbzH8kT/79YvSb8V6hEEWyVTR4PoKyRWQ5nTowSLkAGLW2oEZU0afJ0uNzH4Cj4kCXgZnHIxGUvgDUICtUCBZBm9fAIn6BjNiT4T1C4bS1SZaA4YIaI7ZzDbtBWcNmBgcv8ZMtOSf5XdJVNTBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gf/OaFlJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jnou+BRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989mP62660352
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IzHG9N+rOjY
	zjvGxNKtzO8J7u8GYor9iw76AiyCp3zI=; b=gf/OaFlJrNUbCnPoWTAKVuoVq55
	gG4QlkXJT2JR2cPiwy2GxGqYy+i5DrKh8tnfDyu2PkjD6nWuQu69j73uJ53E0nIk
	sUL9z276Fqp13dnj28oV58oUR5p4wXBQj6bB7aGrZngbQEAMTX9Wt7YovOWoVret
	yUg/UhUBoJ8PAXk1DJqWoVoA9KFJk6Hra8pT7LGkCiSzPqVGxI/WcI38j0CPrI6/
	G+vFTbanXIHbjLF5QRXEBTVpIVtpPFlrwrvUH9jap9hD1tHEmyocZEVwu6EYbIKF
	BYvBEyq2x8EH4DLCx0ZinTuvlZntIEf5QukImsOmTtIEFHRUTJO94NiQ0iA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpndy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:13:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3f446ccfso82946055ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054808; x=1773659608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzHG9N+rOjYzjvGxNKtzO8J7u8GYor9iw76AiyCp3zI=;
        b=Jnou+BRkPHOmtuLspsNSsbnv9+g4nzg9lTBTb3DZXHNkSFHQRnSRf3k3L7g+mdyuwT
         symdd35Vh++pYlm6Ovb+nX8HJhqtMzpnrVNnMCuBigYaeA6c+FWwZC9GdR2KosinX1wT
         JZd7lomQpPLWXhtKLPfv25mH3cMQFiPkSylACPTYFOx3wA5IvYWK2KHm9PY8thBa0lTK
         qZ8PGLymD0yeYRh2C5sb6jcU+GxI9g9I8ncA7V/yERsgyTcPXLxny55ADvMWRcw0UWAs
         CtWQyMO7ySvdY7rdHA2AQs2YxXIHcglNENPWBRTnUizawViR/x1t0Fv0Qa/fCDGExy7d
         skEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054808; x=1773659608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IzHG9N+rOjYzjvGxNKtzO8J7u8GYor9iw76AiyCp3zI=;
        b=DoKZQwT2XgkbP40DdN7EdfdcwtsgTSU9uFicTrMeQgDxyinpKCnoooOkBOi5+iv1Jg
         EOgmvoN4KSwq+xCqACk/DFpUrKJV5KxHNNQFpF/P/JCTVyqLttHOS9qRr81Vd41hHjE6
         GnyIMxOAWjj6KDPiCB3BXCMFLZkLrCH3F6PhxYbfH50KiFbl9eI7WQTfsMpJ+xBvONw0
         Sp/RUxgVGyqIb714TbydeJuD55VEteKjtp7meyp3R+pvOPPUkZWl8mhFTlo+R+Xwc7RA
         QfeijQZRX7U7cal5oxUoSwX7IgqLnUmFeRRU7s8mU5DqO3QWciFsdFjDRrsaX/WvijXH
         IcmA==
X-Forwarded-Encrypted: i=1; AJvYcCVBNEspRL/4017fduM40hoEk7OOoDCNiWShFr8pIFrtiDdWvQu/eXtl//WEWDPFTxvs3QoeEZ/GnOiUQQGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/YDi9VH0fKU3tIvZ5XGvM9ScyXEtVB6+jVIhu7ptr0WYfOJb
	MnFCmB9RI5deeAasNr6FiVfet+y+L2/a85vGsFzopPFc8vbEtZs5ims/gvFPOajQr64ynm5JKgS
	5URNBtIinh8lj1T8IISGcljKjOdvZwLC0AEF5YKHgoVeOxhfWmy0M3k2hjjDIMuVoe+DN
X-Gm-Gg: ATEYQzw3rNqKrJq9drAM54uRJjUNUa5jeAbS+h2CyU45NSRqmo/cZxZdFxEImimRqg8
	MAylq5gIN+INurywKAIGcVjtsjFkiZnb+nWzdf6NKtMP51Th399pjqg4ABJnRUDoMi99CjpwYM9
	L2LV6WQyArqu5LPML6aUvYw45T+bpNp20c2n60uOBAc1vQFcjjyBbPbcCMbLxx80BugWEcTODJY
	qaIBr270VEtIDmquEsvdO++Tgd+mvGR/qlmJ3//FzH2CO/7pweC2acTCIkpDGy3c/k/CqwmgF8R
	8+uRERpa6GUcwvbCClyV3WCsFpG2tCc6xR55qzyzn7e6Dnkf9YDqPcjBgJbmzTBDbvyPGvg1Q4Z
	ip0EkSyX8tuLoU5HOXtOMcmsn/9L0NQdauRLX6iPghIF+83J5T1FsIV8KRw==
X-Received: by 2002:a17:902:f78e:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2ae8245c38bmr93586425ad.41.1773054807970;
        Mon, 09 Mar 2026 04:13:27 -0700 (PDT)
X-Received: by 2002:a17:902:f78e:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2ae8245c38bmr93586155ad.41.1773054807476;
        Mon, 09 Mar 2026 04:13:27 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:27 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v1 3/4] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon,  9 Mar 2026 16:42:59 +0530
Message-Id: <20260309111300.2484262-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfXz6IIC3NK33MI
 P9W93Gxxx65PNUowDusfloLlUZ6vzt5GeyH02VL0wDkSup++l1CqEmasZrchdYp4+pMUrqKr+Pi
 bZL8Sf7tyh/FmaeMCI/O7TKWXwykysBYbZpSCvIGL0nwQep8UOgYdx+egbZjiWO8zK8PqdYwqNC
 PaKuCSD6fprbSO+Nm9nfAg+A0+g4C+82Jt2XjLH/vgI/5nZ6atEQuZB4kQoUi/tMHppQoVI+/1y
 Q6JlRzKntRe3yTxrJDFQ+0xrJHFik/XXR99UAP5bqjTBPSjLxsqDgLDQN2Jw/vM4d0EEJTx8OMd
 RxTdS88PF9GsQ9Tz/+1jBYeWKUpKJoExZVf3iVWDYb5ImSaSN48scxh9tpKYHbzG8TtDxWUC2vD
 lbs3AG+67T+WnMWZbdyNzSjgQQFFgdoj57W03F2ldSDHV2DFNW7P+ps/4wpC1Xzitop1VpgcCTJ
 3cd/eP0d50bzxtvNp2w==
X-Proofpoint-ORIG-GUID: Ub4K4jRQiE0cPad4XWALivnJMniDDUgx
X-Proofpoint-GUID: Ub4K4jRQiE0cPad4XWALivnJMniDDUgx
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aeab59 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=A-h2Renr4JBikGDhi8kA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090103
X-Rspamd-Queue-Id: 60BD7237B25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96227-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 137 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 528756f13..1e739a474 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -2,10 +2,12 @@
 // Copyright (c) 2021, Linaro Limited
 
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/pcm.h>
@@ -15,13 +17,22 @@
 #include "q6dsp-common.h"
 #include "audioreach.h"
 #include "q6apm.h"
+#include "q6prm.h"
 
 #define AUDIOREACH_BE_PCM_BASE	16
 
+struct q6apm_dai_priv_data {
+	struct clk *mclk;
+	struct clk *bclk;
+	struct clk *eclk;
+	bool mclk_enabled, bclk_enabled, eclk_enabled;
+};
+
 struct q6apm_lpass_dai_data {
 	struct q6apm_graph *graph[APM_PORT_MAX];
 	bool is_port_started[APM_PORT_MAX];
 	struct audioreach_module_config module_config[APM_PORT_MAX];
+	struct q6apm_dai_priv_data priv[APM_PORT_MAX];
 };
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
@@ -238,6 +249,70 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	return 0;
 }
 
+static int q6i2s_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return q6apm_lpass_dai_startup(substream, dai);
+}
+
+static void q6i2s_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+
+	if (dai_data->priv[dai->id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].mclk);
+		dai_data->priv[dai->id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].bclk);
+		dai_data->priv[dai->id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[dai->id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[dai->id].eclk);
+		dai_data->priv[dai->id].eclk_enabled = false;
+	}
+	q6apm_lpass_dai_shutdown(substream, dai);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk;
+	bool *enabled;
+	int ret = 0;
+
+	switch (clk_id) {
+	case LPAIF_MI2S_MCLK:
+		sysclk = dai_data->priv[dai->id].mclk;
+		enabled = &dai_data->priv[dai->id].mclk_enabled;
+		break;
+	case LPAIF_MI2S_BCLK:
+		sysclk = dai_data->priv[dai->id].bclk;
+		enabled = &dai_data->priv[dai->id].bclk_enabled;
+		break;
+	case LPAIF_MI2S_ECLK:
+		sysclk = dai_data->priv[dai->id].eclk;
+		enabled = &dai_data->priv[dai->id].eclk_enabled;
+		break;
+	default:
+		break;
+	}
+
+	if (sysclk) {
+		clk_set_rate(sysclk, freq);
+		ret = clk_prepare_enable(sysclk);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
+			return ret;
+		}
+
+		*enabled = true;
+	}
+
+	return ret;
+}
+
 static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -258,11 +333,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
 static const struct snd_soc_dai_ops q6i2s_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
-	.startup	= q6apm_lpass_dai_startup,
-	.shutdown	= q6apm_lpass_dai_shutdown,
+	.startup	= q6i2s_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
 	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -280,6 +356,59 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.use_dai_pcm_id = true,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	struct device_node *node;
+	int ret;
+
+	for_each_child_of_node(dev->of_node, node) {
+		struct q6apm_dai_priv_data *priv;
+		int id;
+
+		ret = of_property_read_u32(node, "reg", &id);
+		if (ret || id < 0 || id >= APM_PORT_MAX) {
+			dev_err(dev, "valid dai id not found:%d\n", ret);
+			continue;
+		}
+
+		switch (id) {
+		/* MI2S specific properties */
+		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+			priv = &data->priv[id];
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->mclk),
+							     "unable to get mi2s mclk\n");
+				priv->mclk = NULL;
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				if (PTR_ERR(priv->bclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->bclk),
+							     "unable to get mi2s bclk\n");
+				priv->bclk = NULL;
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				if (PTR_ERR(priv->eclk) == -EPROBE_DEFER)
+					return dev_err_probe(dev, PTR_ERR(priv->eclk),
+							     "unable to get mi2s eclk\n");
+				priv->eclk = NULL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -287,12 +416,16 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	struct snd_soc_dai_driver *dais;
 	struct device *dev = &pdev->dev;
 	int num_dais;
+	int ret;
 
 	dai_data = devm_kzalloc(dev, sizeof(*dai_data), GFP_KERNEL);
 	if (!dai_data)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, dai_data);
+	ret = of_q6apm_parse_dai_data(dev, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index 8296370e3..a00d1eda1 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -3,6 +3,10 @@
 #ifndef __Q6PRM_H__
 #define __Q6PRM_H__
 
+#define LPAIF_MI2S_MCLK 1
+#define LPAIF_MI2S_BCLK 2
+#define LPAIF_MI2S_ECLK 3
+
 /* Clock ID for Primary I2S IBIT */
 #define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
 /* Clock ID for Primary I2S EBIT */
-- 
2.34.1


