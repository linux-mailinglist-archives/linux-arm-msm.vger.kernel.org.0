Return-Path: <linux-arm-msm+bounces-115666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EZ2FHPHyRGo73woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8C6EC742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:58:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HbealYaK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115666-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115666-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 423003025284
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E135643DA40;
	Wed,  1 Jul 2026 10:58:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6623EFD37;
	Wed,  1 Jul 2026 10:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903499; cv=none; b=svqIfrLl3273T72Lt6E+qW77XoGuXO4Mt18L+MElvVPquMx0gZihXD7WDTl4HNEQYJGQ2yRtLMaEuLyEOOP4wycfFpjf3xUKsB+LaLmKmOyUzpU6bds83pr9rTchmYKo9LZRui5jJcGCQQGAETwmxfS+zGa3mBKZ3D6kQ+InYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903499; c=relaxed/simple;
	bh=ymqbRWgEtzmKdRiRlGBQJ2tJDt2iJYvTrXbNGu7Oqg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S1qMUs6e8Vt69A2GMg4KoO4uD2ODCGTWcBxeDmB78/rl/DQgNDy9pWikuSJrAlxyA3mW0zzSbfU8e02ZwcQU7PwhwGGqMA73LcAdfHCO755+L6DiYMyohrJ4318x++q7FB9I+6wl76lr7R1QvUTo1lmoECWMcvCnIl+47YCsQdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HbealYaK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8TC1761713;
	Wed, 1 Jul 2026 10:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zQDcRbrsf9x
	4xBOjyVHHDgJ9weIobfxHyB0hvCR1MPQ=; b=HbealYaKdWrXiqJkXAj8ilarpef
	GeShPIAyANsM7dSr2IMvtn98231D5RbldjPfBONy2rJtKj1BIICTwXqXA1DM9438
	WJGsXcwwPSvJVM4RiDcK6S7srAoJtulbVP0KKp4VkFTKZkNjvq/fduP2EGODsowB
	Ox5dIu66bK6Pd4AzTjQ316uj3LoVGToCp67j4L2bRmgtLJkT/M8U+9+7yC4YcSt6
	KtDJ6mgjqy+IHRGUrSp2plLk6iHaI0LMmi33QD9GtaSJgWbyUyo/AGrXvditmfrf
	WJCxjv4j194vCkVpLeYpGYw/WmGxtsFu6TJlMdkPcph6R7tHgr7YEhcmtbA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd07nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:15 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2JA011886;
	Wed, 1 Jul 2026 10:58:12 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] ASoC: qcom: Add generic of_xlate_dai_name helper and use it in lpass-cpu and qaif-cpu
Date: Wed,  1 Jul 2026 16:27:52 +0530
Message-Id: <20260701105757.2779738-7-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44f2c7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ElIK2wb-GvUNCdFUK84A:9
X-Proofpoint-ORIG-GUID: P_GAf8VNI3ZtivUndiOjPFxnYXoDwRJi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX72UYBvOqWMiC
 7+UF5IioSoxYAPY2ybunzMRf5cgG5GYBFhKd4X87hXhxqLK3+sQIj4kum0nbMSlN306nkrjsBsZ
 0moCphxiRDg1X5vazugeJ4I5pbld0No=
X-Proofpoint-GUID: P_GAf8VNI3ZtivUndiOjPFxnYXoDwRJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX5YbgB7v2IU4C
 wZIrMw3QQr7/CUG+KkV0S4x4MWP3IX4HjV0MNyQHsZlS6H8oT484EZA4a3Ra7lH69UflZc61AkT
 /8+5s/zeBGQz9rOPBCCJeALxff0Jh9c45YYXP/sfEW4/FHoGqY3zcF25OXd86pPXaKD1yGAr/hu
 T8hYjc53xl1dVLPSEr0gRpX7U0x8dnYTZn3aYjvQLYoYKkvE3kL9+arGFFsbN1PWNBOq4vz1CIh
 w/j6OpE2eP+IiFtDe8N0Opxk4PrFp7w8LABCUkt8ndLTWfWQGCj9Sme3YozhUgaOOY0SL6L0WkY
 jM+7w41pPRCYePdbh3X+pK4G4BvsxClA1NdKpS/rZrtsTCzJeqxWnyvF0/onD9wNwFpwhN7B5KP
 3nhwxjo3QIP5854tI+rMj0nWiypiVJ7/298XxoO6wkFHGazsohC/tc6hD6LU/DX03Wlp1zzA6V4
 xlcyjYVHzIoJMTdUbdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115666-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FC8C6EC742

Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
phandle argument to a DAI name by searching the component's DAI driver
array by ID. Each driver currently implements this identically.

Extract the common logic into asoc_qcom_of_xlate_dai_name() in common.c
so it can be shared across drivers without duplication. Replace the
private implementation in lpass-cpu.c with a thin wrapper and add an
equivalent wrapper in qaif-cpu.c.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/common.c    | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h    |  5 +++++
 sound/soc/qcom/lpass-cpu.c | 23 +++++++----------------
 sound/soc/qcom/qaif-cpu.c  | 16 ++++++++++++++++
 4 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index edc4611691f7..46569290d44c 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -23,6 +23,40 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+/**
+ * asoc_qcom_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
+ *                               DAI name by searching the DAI driver array.
+ * @dai_drv:  Array of DAI drivers registered by the component.
+ * @num_dai:  Number of entries in @dai_drv.
+ * @args:     Phandle arguments from the sound-dai property; args[0] is the
+ *            DAI ID.
+ * @dai_name: Output pointer set to the matched DAI name on success.
+ *
+ * Returns 0 on success, -EINVAL if args_count != 1 or no match is found.
+ */
+int asoc_qcom_of_xlate_dai_name(const struct snd_soc_dai_driver *dai_drv,
+				int num_dai,
+				const struct of_phandle_args *args,
+				const char **dai_name)
+{
+	int id, i;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	id = args->args[0];
+
+	for (i = 0; i < num_dai; i++) {
+		if (dai_drv[i].id == id) {
+			*dai_name = dai_drv[i].name;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_of_xlate_dai_name);
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..5baf51a39c97 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
+#include <sound/soc-dai.h>
 
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
@@ -15,5 +16,9 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
 
+int asoc_qcom_of_xlate_dai_name(const struct snd_soc_dai_driver *dai_drv,
+				int num_dai,
+				const struct of_phandle_args *args,
+				const char **dai_name);
 
 #endif
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..0c84964bafdc 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -18,6 +18,7 @@
 #include <sound/soc-dai.h>
 #include "lpass-lpaif-reg.h"
 #include "lpass.h"
+#include "common.h"
 
 #define LPASS_CPU_MAX_MI2S_LINES	4
 #define LPASS_CPU_I2S_SD0_MASK		BIT(0)
@@ -458,30 +459,20 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
-static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
-				   const struct of_phandle_args *args,
-				   const char **dai_name)
+static int lpass_cpu_of_xlate_dai_name(struct snd_soc_component *component,
+				       const struct of_phandle_args *args,
+				       const char **dai_name)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	const struct lpass_variant *variant = drvdata->variant;
-	int id = args->args[0];
-	int ret = -EINVAL;
-	int i;
 
-	for (i = 0; i  < variant->num_dai; i++) {
-		if (variant->dai_driver[i].id == id) {
-			*dai_name = variant->dai_driver[i].name;
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
+	return asoc_qcom_of_xlate_dai_name(variant->dai_driver,
+					   variant->num_dai, args, dai_name);
 }
 
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
-	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.of_xlate_dai_name = lpass_cpu_of_xlate_dai_name,
 	.legacy_dai_naming = 1,
 };
 
diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
index 08c7aa477938..93b75ea8e48f 100644
--- a/sound/soc/qcom/qaif-cpu.c
+++ b/sound/soc/qcom/qaif-cpu.c
@@ -793,3 +793,19 @@ const struct snd_soc_dai_ops asoc_qcom_qaif_aif_cpu_dai_ops = {
 	.trigger	= qaif_aif_cpu_daiops_trigger,
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
+
+static int qaif_cpu_of_xlate_dai_name(struct snd_soc_component *component,
+				      const struct of_phandle_args *args,
+				      const char **dai_name)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+
+	return asoc_qcom_of_xlate_dai_name(v->dai_driver,
+					   v->num_dai, args, dai_name);
+}
+
+static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
+	.name = "qaif-cpu",
+	.of_xlate_dai_name = qaif_cpu_of_xlate_dai_name,
+};
-- 
2.34.1


