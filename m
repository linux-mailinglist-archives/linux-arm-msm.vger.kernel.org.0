Return-Path: <linux-arm-msm+bounces-101456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLaPIwAYzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:17:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A938501E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 09:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43EE6300C558
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 07:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D3C37C105;
	Thu,  2 Apr 2026 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOLSbKcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE6D37CD2F;
	Thu,  2 Apr 2026 07:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113772; cv=none; b=Ib8DMv547xNMUH0FLUmKNDiX9aMJouOesWEhMRBNgXhz8slSXoXYsyymf4G5ocfbnTng0K05+bGgXLcchQ8qeUkkwGh2Vk7CsO7sTSp45uSkvc78S2g6RDWjnS2zXP2BnQS0T0Gia9rLyX4gmzM6r2ShqC4BGV+w3cNXiRV8+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113772; c=relaxed/simple;
	bh=2j3r5K7GZo1GPkan+Mf+5GdTm5nlTnl4H627MYikJK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V7x7jqZD84Z4glFNBvaRZQyaU2xKO0MMYkEXDOs+3zoPtPM4PAwfu26Dh0mJul+zwoqbzTLh3nbbHFABMoOGyOv6heSQU0uMZHrvZYnMHinxx6g6afI5ed1pKlaLrdH+bN1hP9Hjr3kxY5vN42yknmKqPENXd2BB/4zsVsuZZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOLSbKcP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M3w073745837;
	Thu, 2 Apr 2026 07:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wUz7umYrY89a7HSgjf5d2IGoEaApf1XFakq
	pV4gz3Tg=; b=bOLSbKcPit+TuFRWtLb33RzkA/FbEWK7skoBR2TizOfH0/HlnQh
	thsN6zDR+R03l8/vdoQp7TSEC0pfy4hi97PoZZCP/Pm4yYrN+2V0IxU1R7R/4XJm
	F8jaC1sWsDMzqOzPoroo4UtcKSeyXNbk6uDDWMh/uV6pQKIM2za+VkNA8J2Be/+L
	nxcbhyvGoLAaRrkgrGiMuC6bQ8YfiLPXVpOPdL2Jw1Wzti4PSKfKKDLbe9p+B6Z6
	oqJfDGWH+OFVrI6kOQVM2PEN5Ty5UGiM9k0tRDCUiAgxqqzH0rEMZ50oJ0jvsa6m
	CPCnPZLUWl7w1C8KQzELar2BvtSN4aBMiyg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324kwqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:09:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63279EiF007869;
	Thu, 2 Apr 2026 07:09:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d6qj2vfhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:09:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63279EU0007864;
	Thu, 2 Apr 2026 07:09:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63279Emi007859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 07:09:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id DFE735E3; Thu,  2 Apr 2026 12:39:12 +0530 (+0530)
From: "karthik.s" <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "karthik.s" <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1] ASoC: codecs: wcd937x: Add conditional regulator control for wcd937x
Date: Thu,  2 Apr 2026 12:38:54 +0530
Message-Id: <20260402070854.2804291-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: YS_LKmbsCfiFJ6mprLOjXrj9R-HuhYfS
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce161e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=WVhCV30w_vEBU2GG1a0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MSBTYWx0ZWRfX4aT4pBvsIR+3
 2Rp4Y2GkNGXzF+DMTZR79RbbIL0ydHHDIXiygBE8Z5CE6+1H1D/fCg0lbLRURRyRdtUPITwN08b
 sgD5bWmKh5P8/3xoSaOqUspSLG+iDaYDj7/JjMmC9PoZSioUYGiGygcDFCsaL46yx4fuzsWuCUF
 T4rzSOnnZoUNRjX5kiSiGoPmI35VqKJC97XsaqZLCZkfsweVpYIXPKPttzciYDxLEjqu2M6UI3X
 wK9qBk5YG/jCmOUtyTwZhO0lbDgWO+OWgugu5/qbvjErCNEPVfXpQ8D7h4mdzruqfs4m1U1RBQV
 6Pgxu4zKzRkOJ/OowujID8qXLV2JCoCGSYPRBnGbReFALiNKV6NZpWjwWfXvfuND4jxYcNVWfoH
 s5AWj1AXLuSkIDHER7XSQH5e657aW2vbBSw/uZUE8olsiLZ3jKwI+quL5aFZNSBBJcp8dB4VFlh
 1ZJpbuUDBA1U4ouRHnw==
X-Proofpoint-ORIG-GUID: YS_LKmbsCfiFJ6mprLOjXrj9R-HuhYfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020061
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101456-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karthik.s@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 827A938501E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add has_always_on_supplies for managing regulators. Indicates that
the codec supply regulators are always enabled by the system and
must not be requested or enabled by the codec driver.

Signed-off-by: karthik.s <karthik.s@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml     |  6 ++++++
 sound/soc/codecs/wcd937x.c                          | 13 +++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..d89fff1f7171 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -28,6 +28,12 @@ properties:
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
+  qcom,always-on-supply:
+    type: boolean
+    description: Indicates that the codec supply regulators are always enabled
+                 by the system and must not be requested or enabled by the codec
+                 driver.
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


