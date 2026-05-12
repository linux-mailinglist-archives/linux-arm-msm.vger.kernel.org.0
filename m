Return-Path: <linux-arm-msm+bounces-107025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F0QGUShAmpwvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:40:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6A519657
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C92E304DE89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7552E7631;
	Tue, 12 May 2026 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqRrnC7G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvbeYNtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517052DE6E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557082; cv=none; b=o7KBHFJTDFA8r0yMRWH69vqg5c0G+cckSI/adBiZZKYA6AkrRiAONspuhcTYLnq+eFRgVdW/IlpZM5/a/RymcudbbNvgs1vxzLpLbDXafXLEK0FmFzAuJkirJTxg9enBj83FkZrD2dd/ak+psRa+5IsyE2ELqLDL7yF5q+htwxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557082; c=relaxed/simple;
	bh=NFa6T1OlpES6l8VtfHxFeXgujLOXbuuENS2CTFHA2J0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eN7q7kz0KRINASDL4M2lOh+oCeAq7mmAI3urbG3pNG08skZ5W9HmCQce9OJ2ysXnJSKAxqhit7QpMRpsi7YR0fNBXSQ5JNNNYL7Qe5hApSM3pgF0SLzpMMmrOM3NGzAnGxuwyT62s5sWld3asbBXW3KGMhCJqUa4k4ZW5hjmF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqRrnC7G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvbeYNtG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6op92186602
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UL3C3PYs7qb
	8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=; b=MqRrnC7GhRK4nR7aPzLj45S8qVI
	hOBxRA5TR1rC8r7E+CBAA2uVrzfkwO44cFrdtcvlgqZass76uCizPUZjTSPnbqs8
	skdwKtVpdyhqWUc08iDihMWsDju00eJUfQ4U5RU/MI/iTUEPma358K9ucyl1V8oi
	V56amjGKU0OUrw0uRDJm3ATmJbUzIAxVaysouflcwI7w5i0nkH95PaQXxSznMmV6
	mwUFqfaHyCwTMQUPdctokmAadZFicAU39+T6F6CUQdd0kgG2d4rjJT0XFRfjWmpQ
	lC9E17X29lP0r/svVp0vLwYcBlhv15ZSi/pcmDzuflyYSLSpPKi76qjkUFw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv299ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so6102302eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557078; x=1779161878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL3C3PYs7qb8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=;
        b=TvbeYNtGL1RTwTJFsSqkX5PVwszwyeD5aFF+el3ULzpdQ6SB/VoLcktkBaeXuoCmw7
         lEj2w+E5fwM8oa3fvNRUDX3CD43DfeoEThE8C4/+kfsgtpwZ8RpQOBQRgWEpCgdbGqJV
         LbTQLLSnXecZWW2EGEqZWdNjHJs2hDQYJhvQ6kUzAruLKbbDMhhThXxryfCkv9ybc+lV
         pJV0Cp0KnB2lvbze8I9Veldb0cSpsErmJbih7NAFYQzuf+WavdzCWG7u5rP2Bh+mXlqH
         syIWND+V5DigwqohWWxcZSwnX8hiNn56jSA9DulF+6cYKPEI10+8/nthZs2ufAKUCsWT
         7JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557078; x=1779161878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UL3C3PYs7qb8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=;
        b=XPrnFMCnb+EnKr9WYmme9vb4UVl0HppD1kAW0KoadthQYwuxMQTh2N3WySxSifWGA1
         CoRP1TnB4X5i6gIZvy2j8AIYVaHxNWaSN9VGBTNd4gQ/Qto/lOZ9QWMBBxKFebT/d5QM
         vFWH2AqkodjovqA4aYH6IKlJAFRTUj4qkdeLQuKLjxiDt4WiDVSE4JjEe04mROj5B438
         fgPKgdKXGVp/UNvAIyshovWOzyym7Zlfnc4jC4GHO0VjcL04S776QByMqug4q5rGnTZK
         Ak2qDNYFSmjY1k7tEPZT5qKx2+mkEscqXdozEzJaLmGzcWP8rd+wvpUSxhriEcU9/2Z3
         sjTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eVXoshoCKRRd02q6YVl4rPDdnLUyb6pk0kYSmz9LnM9/JSiGu1QwnGdNlZ8jhUgtouSz5aqp2VZOJiqT9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++ip4VayR2VKon3fZ4uS3/RqD4Fs+4ZSeHEj8vlTkCQYCdhbf
	px/DgAeCyjYk5eQIiCIhKR7AJk4YUekUqrUJ679nybOygSVDZSPTKPk7rFl8Q91PLhgjr93j2ew
	jC8ZSGFptpFQKoTGrAdLZsh1WcVRHjUYVVemXxItuKnTb0aH8gpHrTbjUnLMXhtIDikYz
X-Gm-Gg: Acq92OEfztvv20LGTBJGNRi057gHF7yn6ZpCDIhAEi1oSWi89SNIOc4qIFRgwb2zw32
	6ORRDDy+Fv9KfOx1ThvokoRFhdhSp4+FiY+MWxi+ItCHapzCqaiBrs5SQq74xFsEMW/voDmEki4
	vXmCCQfo1R0tCsLYxL6LiPiXMKEiPIAv3Ne81v61bVedaPZa8660mSmh9mwGF9Vo5LWm5cCjPSl
	anDUJ5Ds0Rl1ueFBceQiERnolWE3nnJxbHyJyM6j1uVn6Vst9I2RuvQgkT2LZRxy2EDgcc80dZs
	EMkNeeNnP8AenV06LbiEMXVTqcKJsCax3xiLhTkXs64Y8h6BjDapJChl+KqLfOoh1ZQRgU5GID2
	rG4ZHatxa+OlnE/Y1VVpDHV9hdprhcgRF4gKBvoorLu5VO0gJtR0Qb9aFK8g92npq6S2op0eRWn
	N3wD/t
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr669535eec.13.1778557078260;
        Mon, 11 May 2026 20:37:58 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0d:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2ffd5ace39dmr669514eec.13.1778557077639;
        Mon, 11 May 2026 20:37:57 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:57 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v2 3/3] soc: qcom: ice: Add SCMI support for sa8255p based targets
Date: Mon, 11 May 2026 20:37:50 -0700
Message-Id: <20260512033750.3393050-4-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TREQXKrYGkJVQ4b0DTx87_RsHvBt-I8J
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02a097 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=SaV-z_UyVCyeOftNReQA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX8/3YKdnl9O7k
 5aun5Or+lzfB6MM/g8Y8VL+gliKHtvjGKMu0S5teHsIV4nTaB0237RyXtQ1SBo1ecnkmmgc3Ynr
 Q7CGw5i87XMthNTuZwOGySMaYRbvrcatu0kUDUP+MBSopZJWHhjflcp1EDWxnB0Z7pR7Ia3onAV
 YFY/jxlIQeKM83x8Azyhhd1ZMr2MXIlPld7r1xZZR8fJtATYMFuhtAl/l4T+Eu9LFSPN7fKaoDt
 t8vTiD7GxA2mvCpKDmRcVUOnI/X77CNy8gQ1+BFRADASCfaJa4jGTnIPSoJiwLJxZBhFASxNqIy
 ozqB43Cp61eEQuhZAxTQu+bDJTmDMaqRx1jVi/4Jy9c2+cktZTQ6/FvWpk5x6GipXOfYkPBtg/x
 YrwJ7t/eWXmPG2hQJS3cd45OB3nK4ZKlpklUdI2SX/dHMYmVZ9+rDcMygghLoAKcBS4DecCmwWi
 4fY9K9bqgJg3hbpoVhA==
X-Proofpoint-GUID: TREQXKrYGkJVQ4b0DTx87_RsHvBt-I8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030
X-Rspamd-Queue-Id: 04B6A519657
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107025-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages ICE clock, with a power domain
set for ICE clock. The driver uses runtime PM framework APIs to
request power on/off status of the clock.

Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Reviewed-by: Deepti Jaggi <quic_djaggi@quicinc.com>
Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 64 ++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 6f9d679b530c..cf185a6e1973 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -68,6 +68,10 @@ union crypto_cfg {
 	};
 };
 
+struct engine_desc {
+	bool fw_managed;
+};
+
 /* QCOM ICE HWKM (Hardware Key Manager) registers */
 
 #define HWKM_OFFSET				0x8000
@@ -554,6 +558,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
 	struct qcom_ice *engine;
+	const struct engine_desc *engine_cfg = NULL;
 
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -570,20 +575,23 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	engine->dev = dev;
 	engine->base = base;
 
-	/*
-	 * Legacy DT binding uses different clk names for each consumer,
-	 * so lets try those first. If none of those are a match, it means
-	 * the we only have one clock and it is part of the dedicated DT node.
-	 * Also, enable the clock before we check what HW version the driver
-	 * supports.
-	 */
-	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
-	if (!engine->core_clk)
-		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
-	if (!engine->core_clk)
-		engine->core_clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(engine->core_clk))
-		return ERR_CAST(engine->core_clk);
+	engine_cfg = device_get_match_data(dev);
+	if (!engine_cfg || !engine_cfg->fw_managed) {
+		/*
+		 * Legacy DT binding uses different clk names for each consumer,
+		 * so lets try those first. If none of those are a match, it means
+		 * the we only have one clock and it is part of the dedicated DT node.
+		 * Also, enable the clock before we check what HW version the driver
+		 * supports.
+		 */
+		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
+		if (!engine->core_clk)
+			engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
+		if (!engine->core_clk)
+			engine->core_clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(engine->core_clk))
+			return ERR_CAST(engine->core_clk);
+	}
 
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
@@ -756,13 +764,17 @@ static void qcom_ice_remove(struct platform_device *pdev)
 
 static int ice_runtime_resume(struct device *dev)
 {
-	struct qcom_ice *ice = dev_get_drvdata(dev);
+	struct engine_desc *engine_cfg = device_get_match_data(dev);
 	int err = 0;
 
-	err = clk_prepare_enable(ice->core_clk);
-	if (err) {
-		dev_err(dev, "failed to enable core clock (%d)\n",
-			err);
+	if (!engine_cfg || !engine_cfg->fw_managed) {
+		struct qcom_ice *ice = dev_get_drvdata(dev);
+
+		err = clk_prepare_enable(ice->core_clk);
+		if (err) {
+			dev_err(dev, "failed to enable core clock (%d)\n",
+				err);
+		}
 	}
 
 	return err;
@@ -770,9 +782,14 @@ static int ice_runtime_resume(struct device *dev)
 
 static int ice_runtime_suspend(struct device *dev)
 {
-	struct qcom_ice *ice = dev_get_drvdata(dev);
+	const struct engine_desc *engine_cfg = device_get_match_data(dev);
+
+	if (!engine_cfg || !engine_cfg->fw_managed) {
+		struct qcom_ice *ice = dev_get_drvdata(dev);
+
+		clk_disable_unprepare(ice->core_clk);
+	}
 
-	clk_disable_unprepare(ice->core_clk);
 	return 0;
 }
 
@@ -780,8 +797,13 @@ static const struct dev_pm_ops ice_pm_ops = {
 	SET_RUNTIME_PM_OPS(ice_runtime_suspend, ice_runtime_resume, NULL)
 };
 
+static const struct engine_desc cfg_fw_managed = {
+	.fw_managed = true,
+};
+
 static const struct of_device_id qcom_ice_of_match_table[] = {
 	{ .compatible = "qcom,inline-crypto-engine" },
+	{ .compatible = "qcom,sa8255p-inline-crypto-engine", .data = &cfg_fw_managed },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
-- 
2.34.1


