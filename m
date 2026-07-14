Return-Path: <linux-arm-msm+bounces-119058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5yhhLSFOVmqX3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:56:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B33C756252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:56:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kjM5G7uD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RsyjFDr/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8C51317CFE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DEC48C8D9;
	Tue, 14 Jul 2026 14:53:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465948123B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040799; cv=none; b=gOq5hqG5y49MTfOiX/YdoUGdL3iFqaYYXkAV/u69r4ovrnjhKyqCAfVXWnbeltmggDmixsKU1jo1L4hrZrXvc4ndaVfRe21LepKk+jGX3sQpOLL+pyKx4hwJ+uDseE58Mj/2uJDpDTZwvadVROv/j1Gk+eFdJFq8CxOs3Ez5wuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040799; c=relaxed/simple;
	bh=xrwaAHbnVExHsqHGYhJkGbQsEOoKu1dBqwSOTP4njNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVq4NcM6BbBsNlvGRMKHe71vXpZFjVuzGl+1TN3MhpgRliEi2B1k2RcbYs1l3ZBT0iD2377nZGuip32FGOFDgniTm4KYZMWCNdry0DgKpYKF2YDZlah+UBUk3OBO3G907KkqvkkixQ5VPZUabyDEkQlIggOIk47ayGnykVNxqEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjM5G7uD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RsyjFDr/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcQRq893472
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=njyQPlyf1rk
	av6QBwZPOvqqqPVwldTUvErL1mc4lwao=; b=kjM5G7uDZkpPQwBMUncGqjL8bh0
	K5n4xmxrGHXbfcp1mbnZEQ9qbhQhdY7k0lFns+ZEkUeVeuCDLgoGmsuiBnSh+jQS
	a2hA6qWJje4shxnr4QYpsMh6CIA8TB8IpkObcJpWxKIaAM/IXciCndZh6/Dqmy2r
	bZKzM6mmBLUVd9dNF09KekuCUvLT0Keh2VBWQ0d6dQ3PCpsUZ4emJLL7p6NdO+YG
	BokMLC81TBR14HbJ2F1cu5I74jwpg+Gzbzsu2UmBYr5h1YI7dWv3zxAfYF8lFcrF
	7Iu7m7L6RH1d2xiohlb1f0eko/WnCi/7Qq37i4WBG0x/s1Tc0045PNoBRmA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqrfmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso6501289a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040794; x=1784645594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njyQPlyf1rkav6QBwZPOvqqqPVwldTUvErL1mc4lwao=;
        b=RsyjFDr/2ATtRobXEgNUtPwrrP/IO1KrVJ1WxmQcnOkGu0iJUTNQUKfTZf0Cf2xX/B
         cAwbkIcEE8UfkosDpM/nu7lSKeAVc44S1QEDwqcNcexWHj8ygYRsAoxVUqOfEFXyz+U9
         49LMyXdhxla4kP3kJnkTMJkLabfQB3BMj0zGU4ZpWQjl+4LZflPoXD9Y023RfVZxO/Ic
         Q3rC3UJdR6C0ccTHHZ3ZYSg9JPZpQELEb8RDQfylQM6FpFuwd8D2/gWs14JfhfQt09F7
         DAdpompsdwj3tjsowQHHLkhf3wONjJXchpq4c+FIUnf6DdKgGpiLlP1lCdCmAraQuhsk
         9wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040794; x=1784645594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njyQPlyf1rkav6QBwZPOvqqqPVwldTUvErL1mc4lwao=;
        b=VI648hNrBiQlz+QaUcUqW7ARzs9YTS/TtWXO+SOGEqgJRUjEmxR84VxTaufnjcay3S
         nMmyOff/Kdj+DCE4USfpYIe8vfmjdEmUA5AOIOPjamlgkBE3kndShjoSjcYcSK4bTzpe
         KK10XqPHzlzWrRWVNeSl6CSMzhQ8bCk3eJ+ouVRY9nHHivqAdX62f521d9IRM9759imB
         wMJPu/2a6tLIGwNcMRupfDAdFLPsCMgiytS0rdA6rnN5DPkPk4qSe0KvUx4DDa0cMwVw
         3VcZNlRvR15x4N2MWceOgNGBnOTTadRQjcvJzux9kOxjZ4fVvaIU/M+6Jq7QE5lR3cjW
         nyiw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3QlPFvK1qGtWrefR1FJSjjVHGmTjttNT5g+tpsG1RXrPqvpFWEPIupWR2wgNEmMP+zXtSBRbwwX3m1D52@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpfwur5GyiQ2L51hyy/EmXp0jZb5qAGkxmKU6c9WTMg0fgPvhc
	DWgBZQBxF6MrKZLaXfd2HjVuk0QN80RwPwirqLyTwAPhr7GNEdPEtT4SMy6G8DVdtta2Jxh2xA6
	f9+oEqrwNvdhS6XAjyHpyE5Z+VO1akShbymJMoOmrIY9zY7dKoaFE+TNW1uwzaQuAL4o8
X-Gm-Gg: AfdE7clDGrJsJGF/pbInSPfoZ0ic5PTMENynYVs4fTakuy61P7ufn8nh8CFbS7Rd+FR
	Wxt7993IhXJIcjGdlQlNyiowwVldUHf1wrNVFtWX7UUKvD4JApaKAX9E2pSDfK6SmzDYjD+elAm
	J+aNyAu32AputchJ0z+sJSatAe8D7f26IMH5iE82GwK3f+wu7nDkvBeTgE1foTvCvsuaeuwuwSx
	43RQwr+ZP2ewmK5qWpVNwUEjJTDA+6eBKbsyDjfgN5rBS0vbe8mS9V8KY1u1RqUdShFnb6mvmMa
	nu+iWQsLvj2LcZguxiU6Q6CyTRI98jYwr+xGHbMOAwlV1a/bYwYuFxgRjE4cBoIpBCLkG+D3ukU
	JlYXH9MZw7LHxEwfVV6pSxx+ZsFjlwUavkMrqZB7Ib7S6/zI=
X-Received: by 2002:a05:6a21:339a:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3c11029a002mr18498854637.24.1784040793603;
        Tue, 14 Jul 2026 07:53:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3b4:84c5:45c8 with SMTP id adf61e73a8af0-3c11029a002mr18498800637.24.1784040793022;
        Tue, 14 Jul 2026 07:53:13 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:12 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
Date: Tue, 14 Jul 2026 20:22:49 +0530
Message-Id: <20260714145250.2473461-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfXwsdwXJ20iGHJ
 9MLY8DB4tFq61iiKaqKgv7H1+LwmYo1gZrO1WhQrS13tlwKLgS7PU2EnJ+locqZhIh8ze0VF0PG
 jh+S7xOTLqePa/fzkNYdhxOGrAyiI43DG1naBKsLNCNju8W9e9Tb12/CJujxwf6db/tyqQhsfOr
 aMSheDaXFRigjYhSmaWWAWfLr+lWH7uodKwCJIgEVdqI4Os6N0e1ud7QDEEGFwwXEFgJWEVc7PC
 hzTWwHAUBoQqDx3r32xUeOJVTMh9Z3Ro8BMpTN5xEwiy0MxuoO99mc8KytG4BVCjuKVCgW4pX2u
 7q+YprQOG6cBGAqB2f+C1mZcrqCMXMbzLovBoMb2j5aSTRf3j8vRew2Mjoo2tWp2V54X9nsiK+y
 s/sg16auTrMxhh1szJkSWEy8KYmDo0wEXxIOHwBUsEkgMS4oX6WiSuspPU+nD1sOS/bxJL8NY8u
 QoW9Hwwzeg0179WcDUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfXyHZymW6CBxwt
 CRj+XHwY2s2Gv+PfpRSB6SNfGeQGI1suZ1pKD6uJy4a3X8R0VaJBFWLd8xrhgZ8nQpFhzgJko+D
 jGlYctRU9wAcstyKZZh8nMdwQgRBoWY=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a564d5a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=lGR961BgJX-Zf7vNLHcA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7LkO6Sc-TNHaGr4OAlmtMaV3_y3yZkbI
X-Proofpoint-ORIG-GUID: 7LkO6Sc-TNHaGr4OAlmtMaV3_y3yZkbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155
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
	TAGGED_FROM(0.00)[bounces-119058-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B33C756252

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 194 +++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h            |   4 +
 2 files changed, 196 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b28348..040b97f03 100644
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
@@ -15,15 +17,64 @@
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
 
+static void q6apm_lpass_dai_disable_clocks(struct q6apm_lpass_dai_data *dai_data, int id)
+{
+	if (dai_data->priv[id].mclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].mclk);
+		dai_data->priv[id].mclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].bclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].bclk);
+		dai_data->priv[id].bclk_enabled = false;
+	}
+
+	if (dai_data->priv[id].eclk_enabled) {
+		clk_disable_unprepare(dai_data->priv[id].eclk);
+		dai_data->priv[id].eclk_enabled = false;
+	}
+}
+
+static void q6apm_lpass_dai_put_clocks(struct q6apm_lpass_dai_data *dai_data)
+{
+	int i;
+
+	for (i = 0; i < APM_PORT_MAX; i++) {
+		q6apm_lpass_dai_disable_clocks(dai_data, i);
+
+		if (dai_data->priv[i].mclk) {
+			clk_put(dai_data->priv[i].mclk);
+			dai_data->priv[i].mclk = NULL;
+		}
+		if (dai_data->priv[i].bclk) {
+			clk_put(dai_data->priv[i].bclk);
+			dai_data->priv[i].bclk = NULL;
+		}
+		if (dai_data->priv[i].eclk) {
+			clk_put(dai_data->priv[i].eclk);
+			dai_data->priv[i].eclk = NULL;
+		}
+	}
+}
+
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				 unsigned int tx_num,
 				 const unsigned int *tx_ch_mask,
@@ -251,6 +302,66 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
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
+	q6apm_lpass_dai_shutdown(substream, dai);
+	q6apm_lpass_dai_disable_clocks(dai_data, dai->id);
+}
+
+static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct clk *sysclk = NULL;
+	bool *enabled = NULL;
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
+		return -EINVAL;
+	}
+
+	if (sysclk) {
+		ret = clk_set_rate(sysclk, freq);
+		if (ret) {
+			dev_err(dai->dev, "Error, Unable to set rate (%d) for sysclk %d\n",
+				freq, clk_id);
+			return ret;
+		}
+
+		if (*enabled)
+			return 0;
+
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
@@ -272,11 +383,12 @@ static const struct snd_soc_dai_ops q6dma_ops = {
 
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
 
@@ -297,6 +409,76 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
 };
 
+static int of_q6apm_parse_dai_data(struct device *dev,
+				   struct q6apm_lpass_dai_data *data)
+{
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, node) {
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
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+			priv = &data->priv[id];
+			priv->mclk = of_clk_get_by_name(node, "mclk");
+			if (IS_ERR(priv->mclk)) {
+				int err = PTR_ERR(priv->mclk);
+
+				priv->mclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s mclk\n");
+				}
+			}
+
+			priv->bclk = of_clk_get_by_name(node, "bclk");
+			if (IS_ERR(priv->bclk)) {
+				int err = PTR_ERR(priv->bclk);
+
+				priv->bclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s bclk\n");
+				}
+			}
+
+			priv->eclk = of_clk_get_by_name(node, "eclk");
+			if (IS_ERR(priv->eclk)) {
+				int err = PTR_ERR(priv->eclk);
+
+				priv->eclk = NULL;
+				if (err == -EPROBE_DEFER) {
+					q6apm_lpass_dai_put_clocks(data);
+					return dev_err_probe(dev, err,
+							     "unable to get mi2s eclk\n");
+				}
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
+static void q6apm_lpass_dai_clocks_action(void *data)
+{
+	q6apm_lpass_dai_put_clocks(data);
+}
+
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 {
 	struct q6dsp_audio_port_dai_driver_config cfg;
@@ -304,12 +486,20 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
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
+
+	ret = devm_add_action_or_reset(dev, q6apm_lpass_dai_clocks_action, dai_data);
+	if (ret)
+		return ret;
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index a988a3208..bbbe6d368 100644
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


