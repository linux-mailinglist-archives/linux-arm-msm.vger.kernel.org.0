Return-Path: <linux-arm-msm+bounces-106343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI61DKN3/Gm3QQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:29:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 902C94E77CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF75D303DD08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CD93CB2C5;
	Thu,  7 May 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BD5ggKdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BERYWr/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCC370D7B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153194; cv=none; b=lQSYHcs6YMHmMgjh4Nzyj8UUZfv1PlqUFVaTBeSGayhk06WHhm/DfAqDO1+wD1CU/BRS1f5QhgxVKXerh3CkBKDn46v9raBfXjiRjq5Ytp2HR969v0rmqiJHBSKirYHYAC4Oi7za0wWM1ug2U7fKXosLxyuvvPPONcpm4BJQP70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153194; c=relaxed/simple;
	bh=NFa6T1OlpES6l8VtfHxFeXgujLOXbuuENS2CTFHA2J0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9d+VL2Vi2SCV4zqWJXv3eQgtGOBDTc6X8D5C9rb9tEYCuBGZdBhtxGy4Ev75XoisNbmDs3/Gl91FNSngPdEOAp/6cwYhY6G7nyOi7IKgEnGpuXd7elzW8tAk5LF3S9mjizOqpf4hMedYusLHTCzBdkHiVTvF3Z5+N/87WPfckA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BD5ggKdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BERYWr/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pYR61424508
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UL3C3PYs7qb
	8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=; b=BD5ggKdDm9ao69GTgrd2lMeUvrO
	MrW5qic1WqOQdB5Dg+/b00qmw3gIK4Ntd5wE6umu5Z6d7r402+BG9h0TmI1rU5Xz
	iN+rm1ZcHeqU4vYdBk+00cw/Z8g6Gukf4MZyTBku/PzqcVsjbst/lYs856+s90gb
	MRJ9szJqOti7p5hEn0OxFGA4ZCNNo3fF0p9MLY14PkMDblfk0hv7CsdykTufZi5a
	0fhg6DKqMOOTCO+AjAEXMxS7wUwsEmv6S22P/erKaI9Q/qKr9ufhyav0v8owvWVC
	7V8Uq9ZgWveJB/R9EihOx8qnVNwE9tKbNH/rLzOlwZGPQXjtOmwbxqvuIww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfrt02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:26:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so1083715eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153191; x=1778757991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL3C3PYs7qb8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=;
        b=BERYWr/GWnLB+SCZnm68htXwkzNePaa+LudLym3Ve2t0jJ1VzBnZS8W1vQnsVpBP5j
         fgAiHsGUOqsS1nZdabzMPmux6wjVSxXfxATEzH12K0vlDF3Q2SHn6HmcIVHanLCzZGr5
         7O8N19+L2JvmXvMlQ4P7Jk8YxUH61wr00R2/rwsylDrPCykgqpJYjqmxUYRVoezEyBWB
         BNEoIgeS1IdTWrY0uZ46DogOjwJV7AEeSR8ey5PqTCwC9IZ39Ambdk7/9/92x6hT7vve
         ZrHtRT5wwpDoil1X38Q2UIITN+SMu4LvWiNiabL767ykdw+9eOAlCIF2UDkqpm0aDNmz
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153191; x=1778757991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UL3C3PYs7qb8LJc+zdz+SzMOIXkiCyeUwN4vYWoaCaE=;
        b=DURhuPrqaRxEHIDIGGkFXnpu0NvFacGDu/92/3zVZim3n6q2Vqxehoqxb5yIBT8/tZ
         3vShqFiyc1EzYC7aKresl8zz6vfs6RBzLCio/IWnnDbub5KNPUidENzQvJdunPavJGJW
         POevNjk45CMXs0RqKFuSilxpAV+aIvInDMSZGg/VK9bVXdq3M3PO58OpwiFsML1J0ZI3
         sEIXGpVhYMZvKRnIMVbybkZJKIxrcBi12hGx7Z8h3zVrqtO+n085Dmb88Nd1FhzK1oMp
         LePGcxx1h4SAONdf3cSXsOvGrswn9kkzd38aiFwqtuSYoYzP1A0Vk8/WpJ8eziHgRXGc
         sM3Q==
X-Gm-Message-State: AOJu0Yy2gluBO/hXAnOeamOlldzr1TFDhfET8gy8X2IW2JiAh/09ATvB
	ABP7Husa5yQMVvKJMvyB2I+B78LePhQis6CHYADQGB45Ds5ZSp03X9N4mTJ9u1zx1lUPfFN+CuS
	EhpBh6MqINUam9x7nZ3oQeTpw0imJuAPNt3+MDTPdJlU4O/YObXFs3MAYx8bFy0OuBa92
X-Gm-Gg: AeBDiev/x2ubabPWL8PpMMrlxBomzad2+qqdObfVUQCJxt7v+vtsGwROucSt/dbeyWn
	qe2BI0xJLFRGQcTeU4MWtuvJ+CovKzl28FmDEmpvpJYp5PiCSLVJ1zQU0qYhgc0dwdXv8+gU4ef
	PWPbEFTuH90ygH02eKSYcv7t7X95E3ABrUiywGoTfUcbElrKDbfjMACs8+KMlnyXIoK1hWC3s0t
	PYczsZrHXarM3MkZyGxtGI7X+VSCwzpRY278lVAjAX5DFmj6YHOyTmfHm4Qt4+g2/WzcBDiiVXW
	d9s0cSoHyUbLXISsXFi5TqUG+dKtDslgKe5GOjTbCHeQSUY6AD8X1ULSxS1QCGt6UhO6CfUOtfX
	WQEjp3iMbAHoFzCWd0LPdooi0wO8cNuwpDggEJ6a4i0osnnKbj/jtyXxGmgNknt8eJQNlTuNyR/
	3WvLVvp7rHvITnlAA=
X-Received: by 2002:a05:7300:2387:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2f54b897efemr3605764eec.4.1778153191370;
        Thu, 07 May 2026 04:26:31 -0700 (PDT)
X-Received: by 2002:a05:7300:2387:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-2f54b897efemr3605745eec.4.1778153190711;
        Thu, 07 May 2026 04:26:30 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56fd92780sm8373295eec.23.2026.05.07.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:26:30 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v2 3/3] soc: qcom: ice: Add SCMI support for sa8255p based targets
Date: Thu,  7 May 2026 04:26:25 -0700
Message-Id: <20260507112626.2527413-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
References: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc76e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=SaV-z_UyVCyeOftNReQA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExNCBTYWx0ZWRfXwkZ8IrJWXvdp
 n6hW8Ggzpv5GMAMvZwBdwbBue19xJnxWm+vKX6bUpUb8Xyafy6CFJzdWtwVu5uYTB4MXoE+auCx
 B4sEltXU1rNLDPNNA8l+1sYeZucVX+w1gXDxRnPfLfFqWiB6aQcgQ2oFHcBtCW8JiquqmrQJbHF
 L0AoFrBibw+awQbmS73HaEMbx6dB5v8izpU/y2izCCnmm0A/Rm3wUhbrEh4V6GKxMSUWQsyjMbz
 /c63LPCo8vNBcrmh/8pz66LhWWLh14LL/Q3f3fOMYGPm2mFqkl7x06hCMkvAG5woa7D37tshlw8
 aYV2H1uEXms0HR29zAVgvR1z6lP8Ka02jtlXKwcwMggHhrQoRLDN1rb4aHgjaFZqzfG/ttDchcL
 oHdkJsF+Fxq5aO2LXxN/Tj9jUeYnx2gGC9TSw000yBuNGMCjYMGeJSrrzGjyMBM4nH3uV6x/rx3
 Xi0t71yWwUxPdi73V1w==
X-Proofpoint-GUID: AL7ST8pm1s1F0KppZjWffQvFqLGTpKsg
X-Proofpoint-ORIG-GUID: AL7ST8pm1s1F0KppZjWffQvFqLGTpKsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070114
X-Rspamd-Queue-Id: 902C94E77CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106343-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
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


