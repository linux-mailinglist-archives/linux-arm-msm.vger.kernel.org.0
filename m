Return-Path: <linux-arm-msm+bounces-91585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKc3KHyOgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:58:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D5D4E59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18A5E31221CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B1833AD85;
	Tue,  3 Feb 2026 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJP611Ij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I34QfpfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EF83570CC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097935; cv=none; b=Ia1VX+CsL9F9fojVMfLj+LCAvcP9T5nfyYMLcXARMHxx3gO4Jv+b/nddTlMSVAb5M5dY3jq0XCWrXqi3QPQMaSz8sMMgJ7s/lyFl1O1dw2CbrXIDiKJ6P3m90ELvzdsIxLCvhZKABR9t+W3mC2u+ZPg4/BiDpsIKZgpmudsE+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097935; c=relaxed/simple;
	bh=U4/sKRr7M4WW+QFUhNUawaF5P5iRNlfK2LYJRhPxGVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGlyGh6r6SvnSzW2zUpTyALMlQG4D0jtbJhCG4bhHbYLG4ldxsR0uKKsL5+iVXKpD8FfutFPoGNQqmV5sq0gcHLbcumOpAUG+PjieTsI0clDu71oGjolpz3vZF9WmHwF4qn56mDNSgBpLqS+3XLJwQu0SWLyJeEjQ48abfOc1oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJP611Ij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I34QfpfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134gbuR3744582
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=; b=fJP611Ij23SMmBPP
	+wL2u1ISSs8pZ4YQLVnBUNHnn+eW9XBJUaS8I2a6Q7lLHSaoPprdd00py3ujPUbG
	nyT6+W6RWmkilnmMqHrf+4SapUFyDDdIPFV8hWxp7lzklvTbrbSfrth4HtHpJpYM
	zbCer+GVkS64FWEdnjar6qZ8dyXj61eZZaNfw3cfa7tOaUquMiCIa7KQUjaTOBW8
	AorlmhWALpumAZHcTP9Zo9JJPNZjbEjNGbP3fv9aXMttMnnzUaraBDzR5EebiaAx
	WXyUA6wCFlggXUm9Auamk1acnQxxHeKQmBlT/0A/3iQ5W0puRFxrPID4bwj02aYV
	E1T+5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:52:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso58179305ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097931; x=1770702731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=;
        b=I34QfpfHfq4UDaCc1EVoYI/59wMincuA432RK6WYScoHfWBIA//FcLYyelRLr3zA0/
         Y/v88Z0huEKCtFGA0C/RFJrS5gN6DHAplA0HBefpyRgkyeHznQllIzZ+vds6UPPiTcg0
         eWrBaaFv11K4AFylg6eF/mN0hy+pU/s+3QAfJm19SdnBxYd2C1tWMwk/E/NsXM91bi5T
         lRGodrmGauxhV7DYgk5yOymLeAuDxaJrs/YXxOpveTUO4CB/A86rgFOLTrCJ7OZV0Ukd
         fr/QIX7rg5Aq+DoN70h6Zu0U4bfBouCDa0maDL/mMMKykoIgN2+2yv5d5bjLRLLpcSzt
         XX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097931; x=1770702731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=;
        b=l8S0VFf1/8xsqzS9nOhc8v9Qt4Va2NYUP6TpR6vB/g7SZ6x3Zhf5ZEzAVt1blsrZ9K
         HKm5zuUfNXkr7Hd+9Jt86S8BLA30Dl+FeU9WO/mcW5KKmKiIluCyn4zIATCg+EzKIu1p
         jnNkWM1SPqgyhIGMd++xU5G6iGU99DzQ1A9fHeF1jwxQJ4Bm6AwXxb3hPOQLlTcQP/lG
         Z9EkWfJlX2k+f5Ce/JUrrPknUXCCmwXCvScU0cw/F2iIjn2OvhGq5ZyXYLMIlxPqRkLm
         ds+y0M042QbYCa1osMC+3X0Zbv+I3b2iFstImgc5KKBK56eEXBCcsIDR3EkYxNawKq2k
         BZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeG/xTW8i7/YWtSHsVkMurJdgMGpBokbfe+g0twQSl6Xe5l91+UP+60cDrYI8WpErm1wroYhdAqe+J3BnV@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNASZYiJuaCClr/qWmjdiekTp+BsdcLDxRpFJORO+oagiKO4l
	pcW9XmvQzSklXuu8FhHEAbrglkAUYTx3YT+z79FnYpwa+ok9SINTASg6SS5AQV2u5fX5qzogxct
	6aPyLEML1wv0xOm8cMWAdcLedmDMnmhlWgI7yNANu9Kb5JC/EB2Tcm7RI88Nbcns5uF3pKuFBWz
	q9
X-Gm-Gg: AZuq6aLo8lqeHBXvcb5ThdZP/xe60LdgvJAO7PQUY5zYJ5LNTiwH4WP0kHf4waRhyyo
	EjCVG+D9SMctRv8hS750VdRfIwAu4LUTDLO+y+/aqhJcv09KKSrC57QoeJtzgRIpmvxQET8vlE7
	l9TlhLDrbqpzc4XlVqa3klNFwaeG3fTMqMONCpikLz1HK4VmDTfq5gB+n+35LfGnA00GXttOmqA
	j1ajJmxw6VzPYv3LXHGHYXxx4B528v/xtVp8Y2ar0Hy9EQrXkjW5o6WW5VdXCtVMEOBLldBNPnq
	PzNWYNS33cY2T9BT47Nc2JpGkz9Um1w3ORvOxn+C5HZjbdtkHW/XjzsdNIMI0nte1D1zzf1R0Lj
	ZZ0+pPge1F7F3YbWMh2AiQvkE7A98/3COGOAETqNP3rWr9xjmPh5ORldDxoSk6n8Zrs/0Mtvu
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id d9443c01a7336-2a8dc028b56mr145595425ad.0.1770097930805;
        Mon, 02 Feb 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id d9443c01a7336-2a8dc028b56mr145594975ad.0.1770097930170;
        Mon, 02 Feb 2026 21:52:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:20 +0800
Subject: [PATCH v12 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-4-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U4/sKRr7M4WW+QFUhNUawaF5P5iRNlfK2LYJRhPxGVU=;
 b=G2P/JwHdNHZQyowWhQ1wY2ctXlPUXOxK/PH0GtLc9G99wszt2WdtAuEyE5bWv4ckTmAaNB2TN
 EviVDs51LH1DYJ1cKrgi6QUUn2CTECwwf/QIXC/OiYNejdM7tqYaoLH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: rOn7AOevVmIZsFMhn8zrQGocNeILVjmd
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818d0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX1oaSZmWKivW2
 aQGEJpNH1hpXc6mp2AxtfucNSCDMvr6xgHjGc1IfHrDbz340cNP9enbP+G/7Iy11GgsYNqn80ct
 D/lnuLCN9z1oYbguWm9X2Ugkcb6nBa76oz73oOVOudPVQ/kD4xOFNWhLPzQTF0KM/nzjYUhu5/y
 voblEe2Qs4hfFSNL51gi0Z7hdJF5xnfDfu6Rgrx7jMwq2BF3PW064VwpKnKpCMN07VGkkLgGb45
 +e7lyOUigoZ9X8qJyDp2aWmbCQR/fDImBOYjEURAHuHuh89eF9hdA0Z4PYF+WM0dcP/A813pO7C
 0NOEzcuwdzSz5etjul+Sjzefewr/eBNCK0tp8bcemIcDUFxpyiI4tSS7FPt/FnLITxNuRY0xN9U
 No+M8ahfYlTr0YI2fbmv82/HNdz9Hngl0kCZzvgyO8AiR9zT4MtzU4QRIR+hTANr30RYNn1AJGr
 sr+5iDMeoHU+YcrfJRQ==
X-Proofpoint-GUID: rOn7AOevVmIZsFMhn8zrQGocNeILVjmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91585-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F2D5D4E59
X-Rspamd-Action: no action

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cbbb15648fb7..2ece3985e2bc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -867,6 +867,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Retruns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c780f6d5dede..8ea2de08ffd0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


