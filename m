Return-Path: <linux-arm-msm+bounces-101460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKxzFLEazml7lAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:28:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A63383852C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 884073003E93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD5337CD2F;
	Thu,  2 Apr 2026 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPxT/RY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72AD27C162;
	Thu,  2 Apr 2026 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114593; cv=none; b=CoNAJA9tCUWMNgL5XS7B5570RzT+A20RJLbbPew6M+5VLZfa0Y3XK1nFw3kwB5RSqpiNMtikArg6y+BTmNZnYlPKehPefbAlNB4zGIVLWCeuB5iBwxTWWf7bcdlNAihAv2zWvLb9y/5jdITe8erux7Y8yKRZ21Ek90vZ+jlJwtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114593; c=relaxed/simple;
	bh=cJ7p/TJm47hVlAnPZdiRDW6Mi1PuymieyrtIXGZ+dnA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LNogqIU4rzvJxAZ1GW+WY8WDBunUU4hL2U+HT2aqOVRiQKSuJKMudhe1Zp5IEtbCI6Jo9RHeVWkxDGJJEINCSoIBY5ZZORAUGJ0DPnydBkCoEojcR2QlpRtN+lShpXstPmrEPT9IN1NEY9DIZgG/Btr/gg37YLBr2h4n3owJYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPxT/RY9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326qKbS3746285;
	Thu, 2 Apr 2026 07:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DDH9oaJerecxI6CgFr55TeVgZPAMYZjkaMi
	LVB+D1zU=; b=GPxT/RY9gXKZRs+3CPa1ojcUvqSqtOPAlKBR9nT8LTz9X3hVptf
	OM9m08cxnbkXROyLACir6Ys7VtQM/hxiNjWEho/Y0HjN1j6sex3MkW6RlcP5eime
	WMGwJlRNrQ+RZyHAI32yvSLG1y6xB2UFFGrHX1z7z7uRdKEH6egKVTnJkPvasDcq
	iqGuzRVMcTI8hhuvTIyjbQnoDRBxw/Lpy6ts7ZilO+TovPknkARgLLOywwviVEND
	tAIFHG8JsNWcIhVKj8iOD3afeLBRI0uzcAAk5UKLRWi0QD+7kgVdDAVUSfkfGVrO
	zMIlUy/Ixof2a5tsQs77aDZNhu7oUe4aZuA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324m01s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:23:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6327N0Xs018557;
	Thu, 2 Apr 2026 07:23:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk2k1y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:23:00 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6327N0MN018552;
	Thu, 2 Apr 2026 07:23:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6327MxZY018548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:23:00 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id E31CA5E7; Thu,  2 Apr 2026 12:52:58 +0530 (+0530)
From: "karthik.s" <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "karthik.s" <karthik.s@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator control for wcd937x
Date: Thu,  2 Apr 2026 12:52:56 +0530
Message-Id: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 3gAaZLiWTK_U3Clj7fylKV75nvgdhm3t
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce1957 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=K7MyikV2WjFrkGsVk4AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MyBTYWx0ZWRfX/HK3yez5qLRx
 Fk2ozWXRlCbUauNcj98qPP2ZGJboQ7eKCuFJVukDBYLPAoFK6L3uBb0/qB9KYaDkFZVpqtzK3JV
 u6JzvnZkxEw4+AheV721lAiz8OFmeoBE/nR2y4Y5r89wvig16ENdjXJsBCCp7IMPVQfrIZDD273
 8vXXn6xVCuZ7qYYJnd/j99u8C9GPad/CFLKJ+Xa30ojrAbCBw+28QFKb3+HYi8I44Bql1lLPEZy
 +VFB8O6Hcmw8ENVynJeek+gou3wXVnjzK7MWQt5RRRnseyIUTXwQqOpMZ/DHIWb4TCEebsBRylQ
 gwFAGpawCPipxRVkfbD08jhDbNGN+4W6hG8OM95zRyml4mX2pMGbtPNceW3AswBsyJddYH7WnaP
 YbQks6DZ0rcGb/JjkeDebF1pi7AW1AtFhT/NmXgHitIhhExeyGkblZdWDq70TCgpydLR1q3pXDS
 8BezIrDwOHaur9jzdZQ==
X-Proofpoint-ORIG-GUID: 3gAaZLiWTK_U3Clj7fylKV75nvgdhm3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020063
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101460-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A63383852C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add has_always_on_supplies for managing regulators. Indicates that the
codec power supplies are provided by the board as always-on rails and
are not switchable by the codec or its associated regulators. This implies
that the codec supply regulators are always enabled by the system and
must not be requested or enabled by the codec driver.

Signed-off-by: karthik.s <karthik.s@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml     |  8 ++++++++
 sound/soc/codecs/wcd937x.c                          | 13 +++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..38b3452788e9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -28,6 +28,14 @@ properties:
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
+  qcom,always-on-supply:
+    type: boolean
+    description: Indicates that the codec power supplies are provided by the board
+                 as always-on rails and are not switchable by the codec or its
+                 associated regulators. This implies that the codec supply regulators
+                 are always enabled by the system and must not be requested or enabled
+                 by the codec driver.
+
 required:
   - compatible
   - vdd-px-supply
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 10a2d598caa7..1514ceb7d790 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -100,6 +100,7 @@ struct wcd937x_priv {
 	int aux_pdm_wd_int;
 	bool comp1_enable;
 	bool comp2_enable;
+	bool has_always_on_supplies;
 
 	struct gpio_desc *us_euro_gpio;
 	struct gpio_desc *reset_gpio;
@@ -2907,10 +2908,14 @@ static int wcd937x_probe(struct platform_device *pdev)
 	cfg = &wcd937x->mbhc_cfg;
 	cfg->swap_gnd_mic = wcd937x_swap_gnd_mic;
 
-	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd937x_supplies),
-					     wcd937x_supplies);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
+	wcd937x->has_always_on_supplies = of_property_read_bool(dev->of_node,
+							"qcom,always-on-supply");
+	if (!wcd937x->has_always_on_supplies) {
+		ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd937x_supplies),
+						wcd937x_supplies);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
+	}
 
 	ret = wcd_dt_parse_micbias_info(&wcd937x->common);
 	if (ret)
-- 
2.34.1


