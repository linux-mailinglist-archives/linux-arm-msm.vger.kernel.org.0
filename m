Return-Path: <linux-arm-msm+bounces-118846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LI33BlYqVWoWkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:11:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EA74E5CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OHZg3HXn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118846-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118846-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7FF3038A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB733352C52;
	Mon, 13 Jul 2026 18:09:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBD270552;
	Mon, 13 Jul 2026 18:09:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966166; cv=none; b=X9AdNvsXinfWTrT8NeKt/jwEqqn0JPHxzo91EVMFvzanC70SiYk6MOfPNDHd/6j+OXlVc1zElulKz6HebjBAlJvuy5cR8JWZEU73pQz9UT2gYYZERL8sasg68E/PKLNGRznu7DzQ9H2ZAeCi6TPASrVaJwxocGlY9f50iAYJdlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966166; c=relaxed/simple;
	bh=eS1yh00dvL/nv1jGJhSucYFWX5wBlJRGQkv40QOv0ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7TPkXKWZDAh9SbSvZepZ2tYeCuXYGD+s2a8BbjTYsYbpYWpD4igC/Hxv2769zM01WV/6fa5aGHB5BWUs8m9+10c9egs/pwkPWBYZ9vBvzEYYuVIZ+I61eqaYSHVriOqmbEEN2cikBr2rulydPdMV7oL4QbQB9x79pmEqjV3Ja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHZg3HXn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF87FF1887829;
	Mon, 13 Jul 2026 18:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Ej4E7841wX
	SUudpyNzO6v77PECRLn64vaupBwPT9k4=; b=OHZg3HXnnJwf2MWbFn640A0tf0J
	e6jaGYPr4kOr9+zpYSmhJwqqkS4qW7gpFNJ4dRl08LCU8Cb4kY7NoWZY1FYf727d
	lzhvoj1sVs8vnoXdqEjA3J8IsunHoy0DGVt86pV0MXNbz/adsEGm4zd5hVPR5JRE
	j7PTLdHYXNHiq4QXeVUuoe30jJQ41TdUNz3HxLcGJiFd5wOMbrgtIr48Yr8YybZe
	W/SZJEiq2oUKRtbJAd7xQ6D2H7g3iUiPP9HoZ7DRmoWhKKjprYYiFbXqtwYlFJ2F
	M5wJePqynvoX8vDqVZg4tnE0+YLsMGuFMNrDe2ZnRtaIp4/+Kr+sWVWGbPg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavt4ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DI9AJJ007199;
	Mon, 13 Jul 2026 18:09:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewj8p3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66DI9AuK007184;
	Mon, 13 Jul 2026 18:09:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66DI9Afa007180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 18:09:10 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 79E3163C; Mon, 13 Jul 2026 23:39:09 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: Add support for Hawi
Date: Mon, 13 Jul 2026 23:39:07 +0530
Message-Id: <20260713180907.874954-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: hptVkP-5jhi9nR-eibkFq7AfBot6qrv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfXwQpUIPXbwq5b
 qfEqR96i6DccsucjXG1qlkuHAEISnv1lNlNpaKm8Qr3vmijgUolKp1NIPmLONnYyR7QjnGd1oQR
 QPX6Pbb2qW4danWnd3PJe5W0WcEV8Oz3Qz6zH+BqMZG2ldB1cGWJ7gpuT3HWHoKSQ7j00W8gJmR
 M1LAX/ODRdBiNkmbxQVjBVbfcsbvm7LB+3CDtzQbvqwP86vnjqR0fqI1NVV42XnVmTwHB+BTl4Z
 rS4lOh4rhfxyXwTbl4D14qM1VfmEUn1Rsyl2mc8wFj/B2As/aoNQDNxLcRxG/ZliHmvExL5Wwtv
 +9YRN2+iX9IuxGAkhiUz2fHrtJyVlk1pWISWjoRv30lipJuzAbtLKndWl6K/l/10cRVLrRkhgdZ
 ZHiWy0XF9sV4a6DVkkb1rdHTB5+kiXVkLsjObhCQoyNUjDHWEjWTX4U6V2y/9GRGaL2qsD5a1SW
 qUNio3aJ4OLDLArD2dw==
X-Proofpoint-ORIG-GUID: hptVkP-5jhi9nR-eibkFq7AfBot6qrv4
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a5529cb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=QG_whULB8JoOZ3TR1C0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE4NyBTYWx0ZWRfXyB3eAkf9P/xr
 nTFwVvAw2w8wsaTa4uZRmLNT02NcWiunYHVjoLZ9vVJdHpseqrJ4G8OKOu1hi6byQBKmuc9te1s
 1fKPHeUJo9ybf8sqBq6G5M3DcQHWsvs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118846-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B34EA74E5CF

Add compatible for sound card on Qualcomm Hawi platform.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 728300a57..265fbea21 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -360,6 +360,15 @@ static const struct snd_soc_common eliza_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct snd_soc_common hawi_priv_data = {
+	.driver_name = "hawi",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+	.wcd_jack = true,
+};
+
 static const struct snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -437,6 +446,7 @@ static const struct snd_soc_common sm8750_priv_data = {
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
+	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
-- 
2.34.1


