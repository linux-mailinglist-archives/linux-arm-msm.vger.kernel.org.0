Return-Path: <linux-arm-msm+bounces-111637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtdhKTIqJmroSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:34:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784C652434
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:34:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CbFHUSvE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IxpF+E5b;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111637-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111637-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C633040212
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7106E31618C;
	Mon,  8 Jun 2026 02:30:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EDE318B9C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 02:30:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885846; cv=none; b=k1DiH+zi1eEWLBJoAkMTdKQZS+RKGLOHA4orx3BbkYU8xZk9h4Of+Y9D3NtPR6q1AuW7jVngRRt7t7opAcuSgmWTVvvtY939AsUlICUsKOTMtJJLxtuNXjn1K9vnbRFMFef+tjiWWo8H6gSuuOImJOXaaZ7kq/05gKHnHf3QlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885846; c=relaxed/simple;
	bh=BcXNi1JLPYozmk8/QHvCr0pZ/WjZCh4TPhBSo3DHPGY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5/klYNUo3pXPatMSLB0S3gR1ozLULTJi2oNeLQizSURLfv6ty3Lru4A59Ocal6F3hdvpzgZVDMnszf0kOXAYrVAHH/G56pza7LO1Ms52w6HwKyfl3YtnX0PWywuqe5Ex1lJxkUBFT7oBAyBlqfzp6r9UdNsgOB1P19dn0KKzZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbFHUSvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxpF+E5b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GZIH1991562
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 02:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h8Jmd3NB1Lr
	fDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=; b=CbFHUSvEdSRUcd9hBXDA/LjattO
	V1RADF6VSrEYCt4zSc7x3HdnfITXqK4mWrT2ZJBQK+kKbDsooUdZnxOzdLkyOq/v
	DuqF9TEdm/sO+hu+lG63sjAnbiOlQv+dySzg2XdzsL+TS2dYHKtjr6TvyYaEkp2M
	wn8wfKuiywjDH5tzQprtlV3W6630DHbYjKjLhvZ+p5UaPvSw6OsBM8zENIOsOOOy
	iO5X0U12UeLMTbJOtl4TukYwcRepUDnyx0bKvbz/1Hq3jCkyLGTmx5BoSCU7Ak6e
	v/sGlly4c1d1CrjTA1Z7zN8Q2zJN1uebOxhsXXu/pweqjV4HDXW5Ia66IZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3ntgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:30:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so1974483a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885842; x=1781490642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8Jmd3NB1LrfDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=;
        b=IxpF+E5bCY2t4Ud8aUBUS9IpVUIgJs9ZN7DHYxlZEgY7lIVvlTGlV01DaHJIqosmHt
         +ln+9S7gKND2SAgv//DRDx6Qn7II6PUSxOMJlTr/SCJm+ktSFnUauLCF5f12tLLC7UvM
         mnyFBR9kEZOsWpLdjMTxgSJIlGky5Y3kSRP5XMNgNRmi/SSTNom2vH9wE/MCieX6X7DM
         e2qHcySobHknGb3qIG+9zCRkEkkYJUzcqxXOOYgGaTDhuIBDiTRZBhBOC/W0xQtdtpLJ
         GkmiJoBtorseZ83liAlMOwKKpsUj2Mmj3wlYoliF+FJ/Uh5vGTgvo1TrotWoQn7PkqK6
         wvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885842; x=1781490642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8Jmd3NB1LrfDBYuQ2+LtOcZPICs044bAIaMIRNUmTE=;
        b=NAQsO4qSQJ5hX7Zy2KMWNKzNkQttkq7YK9E/1zvclpfwIpl+A9L4S1NzPFnJRIXYXI
         6iliy5Qq4pA8nBM6pOF0Vo4L3pe4viT0eeDr9FHqSwMdeMqIJgxsXlI4mV6VVW/5hRf9
         wJdx3U+O0Y77o8XNUOIF4A5Y37GyDGIsnNTpRvXfrPWd88aKTHxBhsTRkQdubqnjMTPE
         SN/2VZAqAuDhIF2dpY/4VKT5gVYMJriv/QBx3IEolFkmXstn2WRbdmUmzSSBY4uGZ3BQ
         gqMIhhjYDUA1qrEPgTCfc3I9usZ4OUWIQaa6hLBOBQ04dqrgPoGVKicPbQZEDLbmm0oK
         B47A==
X-Forwarded-Encrypted: i=1; AFNElJ8wt7tPxl9Y5r+e+P61kD89Ffo/kzcQ2o3CUkFbG56RlyIIJ7/xN2dQJm+FZPJkB/C1ANwFRUH2T2UBOB4o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xNnlRvJb/l9Qc6rVQUFn3If/HxAbaJpqsLXsNOIqiuNzQq7W
	nKANsslzERBuwa0qBBQQiK5B6/bgdtjpJwcC0PtgcHzW/T/LuoRpr4FWpVYMC9iWjNvCCOF00ez
	/Is0GIIqoNBwR0mwuYK9FQ6d74ZJd8Next46KUtl8M8P0jwke7NovZ0Fi0Oqlxkl99Jj4
X-Gm-Gg: Acq92OEObKVYh4N9I+E5IfV1KjMagWQALUBOrwXKWrubxsBvzKuBvRihH2axGYN+Guw
	JOEBIYhLUCylmUMI5n36TNMMlugnGcEiynVcrn+IIyfMHw4lZbSo0przrmkEwBmIV7cafZAHxZJ
	7HwZR5USQtRZoBhab9rnXlVezH9siSU9jkR7fPzQLkEupUH3W+Y8yJNywZHpdoQLuy1eg32kXpy
	khsybtXtzuCLC4m9GkF1ukSpr1z4jmFoUDYkVWBydnpeweWAbC5/sjG+2+wZMjuajCz4kJyPl6+
	7305We9q90XBpXXgva5tdjgv65qZy9oIxpDYxctmNezE28APt+1Zc98x9quzmvBO4EZF/R/+a99
	jeLTwvGZWQuDshceQmWrkDBH/8iaD5YuysyA+xSzYC+01XSxGk6PRPSxKK+Uvq9zPMrMb
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr15956833637.46.1780885842173;
        Sun, 07 Jun 2026 19:30:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:685:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b4cd091965mr15956799637.46.1780885841714;
        Sun, 07 Jun 2026 19:30:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:41 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Mon,  8 Jun 2026 08:00:10 +0530
Message-Id: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfXyLYsmeSxYBdd
 ISc8vYk439WkleGF4AnE1nyQxNj3ymdGJ/q+oxGxX/lvcelbkILzu/pA3VBpiWcOSuaz8B0dpOG
 G+W1e7rDlGRXmgBA7a5+TAhLvxEm7kSauSSAJ/0iDYKbXgg0c/KFUB0BA65OCbLoNRxFKUq5/Ky
 Orx4hStoyuHa5+tKe0jRWY3qXtqoAEM4luDSGDn1Dly5PQSBl9UzFvHGTOuTNvW/5ySW3L+BAP2
 BSqfAs+zurn6NK79Z80a8kVC5eVmCbShfzziVrhvTtu+S0VkunFy5in/tjHGb1Qm3/Zn5zowFVj
 fdF+Z2HejfNxmu8kDadVNt9dqgpT7tntyN4lgUzm1hVOAH1k4emXziX70anSXDHBbMrz+pEGAjF
 cSPnjUgtoQ3ph03AdlQoYcuuCh4qlncheXzG8H84OfeWw6+8IntkuHndhEhvr15QNGM9ROMyQLG
 rTOrdocO5/T1cIYw10g==
X-Proofpoint-ORIG-GUID: q7LNgUgWJk7lOrKxrMejEosE2y3gATtM
X-Proofpoint-GUID: q7LNgUgWJk7lOrKxrMejEosE2y3gATtM
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a262953 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=A-h2Renr4JBikGDhi8kA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080020
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111637-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1784C652434

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
index 006b28348..143750afb 100644
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
@@ -251,6 +262,70 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
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
@@ -272,11 +347,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
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
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
@@ -297,6 +373,59 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
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
@@ -304,12 +433,16 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
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
index 6917e70bc..7b751486c 100644
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


