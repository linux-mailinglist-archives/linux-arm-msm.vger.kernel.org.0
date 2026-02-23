Return-Path: <linux-arm-msm+bounces-93581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGtPGO33m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:47:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6C172542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A6AF302C14E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4943134B1A5;
	Mon, 23 Feb 2026 06:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLjqLK1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gf928sD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13403349B05
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829124; cv=none; b=secnxaH1+N0wzUavlhMIAM8ZHQrY6VB8KV8v6lPz8fbiRRL5c002HUrd3zH6PRnPD/JYrJm8fLyP9Rtt4UyPSVH/ksilw9WXroiU9V1/AzHjohLqynAv7FjoZhsWCAWYJMcxIzXCVfofwangfSJHZtGWaHk3d8BPifkjSGB02zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829124; c=relaxed/simple;
	bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESLvOqfh+BNboXR0eadOY3mezD56jvlVW8MwAsuzNdJnhj8G7AdBPB7BXcbKz8eFaa9/hLD3OFzE6r/qW+142FY1s+QO7fOAUJLwCOJiADrZG2IyNyuy3LlzvbonE9WXwCCV9aenuVb0XgYD+R28P4Sy58jBcTgSJAWyqwG06SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLjqLK1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gf928sD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MBZRcZ670853
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=RLjqLK1b6P+q9cVI
	aTsxfOg9QjnjKauIsXAgHXXl5ZnbsMtCFVaRb0jguBtSzanNdw4JsO7xoWQv4LzJ
	NrWSP7mZUFWZl68w57siwDjCHO63eOkvBChnn+F6vsFRBhOwXi8D1djqjOAnU3ve
	/23d6A5yfiDE2QA6KXg+boFoNlNXWFvpbB/dPPjVBqGMwq1QQK434RHXnW+Qo+gu
	PRVYeFsyS5ygzpTb+UNVP6wpaeQsVRPOwK8j9EBeo8DO0CLdtBioCptANI5xHze2
	zejVmqsiF6d0yDqn0EExMvvXvYNPDgCEbsqqZVFW2GfS7gXmJlL+MOdC4wUzn3Ql
	PeV2XQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waup8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aae146bab0so43513235ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829122; x=1772433922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=Gf928sD+LsO8lqz9dtjpJDzhUgzuLbKk+/H4YUOaKZfG57bAllATJZVZPWRppc6xia
         Nvojq60WyHMlJSMGN4RoYQmbSByNZ91yREhHp85E5amoicf3rSR0GIlj7eyXSUj3mQyP
         bRvGoEnxsg7bQAEYmZW1QF7t79KDsU6C6oAEPucK3OYo7VHLOil7NZb4EwyfRwci50Jx
         5pOmTfa0Lf1QSC2ujMcvc6fj9scDUYfyvUCovUQLs2GM7ZsPqK3rpDr2Bp6/wODuWNPi
         3ntaSBJZnRjVp+84gnM/s3VEvb2flaHzr78mSHFlfToiQ68v52sNwuSy2fin+BrGA/UK
         Yk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829122; x=1772433922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=KG69FasOn1mtZJxm6S6HX1d9cqaXAtclOygrE1aeSO6cM52G0JuQOeL2guMNPbLCnb
         Qn3TM/l6Y2nor2yP1BVsNn6q451bEFV1CaTSBej/1mreR1Os/N/BAJjgXugobR/Wo1y6
         EHYs14aOAipfIz9ujvwhkC1TxbEZ0Un71T0GzZmGgx4nG4lX4oIDEBTg1E2Z8SNNS4uV
         v9aXajIuOpBBkWsMu1/znIvJDQafqbhM6kqmk0yB7JKIQIDzenQ8S1Qg9JVVKV1n2jW0
         Sldip6uBBjV12vT5oqB2xoXXHaLzlQCnNz2lhRyPjg+SHWBVOZ5gv0wqS9Yt1TdfKyHg
         KpkA==
X-Forwarded-Encrypted: i=1; AJvYcCVM0nsUOW1AMFXFXLTQGzkEHRWyz1ovaT4obhMFXuG209J5sC7VRKHXji4o8dohlDUrHteqHI8R5jFOHjk2@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+E+YRMLzlilvWkinnqUbeGE1TS9+wgqljtZQ8buLAQjefOfX
	eO7qEzuSyACKSNFEvnPvULQivYlEClANYxuYhiD+fE9JJvmfWpZIE1yUIEv5OZYs7NNgCtV+meu
	TxQpITaprLtPbfuwJU1zUlLKHJApSwJyeYfZBt0tUjJP7DRyMN+bMuF+CR/tWkAZ968yi
X-Gm-Gg: AZuq6aKJQZ04IUTe4qGoyYpqeJ1WAmfVY1K4iI5SmB8rq/7NSLbhIX7t2EFecM/rbQu
	RSHJiVo6W67TpswZHpDhWsXCbFH/p8GbZnkwp/KLa2VIL/PAkay8OeHojd865BnoKo2rJeV/Sar
	lyHOG3gEeie/hm5aelA5kHn+M15Rl3tV4XidkP/GQxvoJugW4ixA8NMmd9Qn/N+H38CT//hfrt2
	xVoQV3rVBTrmCA8b1SYTq8xMT2aBV5nJ8hFiIEmA/9Uu+Vn4HXP54GRHWr2fFegMEHuf1ivl6Q2
	F4W2+3e3nIhHw9OvojAnpoPxsMQ7uirKWzdwHgvIME7avXeBuXdK1TJnxl8gM6l7YpB6TfQTcNv
	d77H4Cc3Ql6iwbeFc0QrF7RCbrzzAfjA9ZNYmNWM/a+6KP0RROEYVQC/BvZEm56Z8L5UziL8a4S
	Zf2euY8oJGzpHT
X-Received: by 2002:a05:6a21:a34b:b0:364:33f7:7338 with SMTP id adf61e73a8af0-39545e549f1mr5199009637.8.1771829121491;
        Sun, 22 Feb 2026 22:45:21 -0800 (PST)
X-Received: by 2002:a05:6a21:a34b:b0:364:33f7:7338 with SMTP id adf61e73a8af0-39545e549f1mr5198991637.8.1771829120967;
        Sun, 22 Feb 2026 22:45:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:40 +0800
Subject: [PATCH 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-4-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
 b=78YAd59lTYgK/tbuk4c/MCEBFv3Qi22W8s2kk+5gInZxrUZ5yMqCCGi8XGwxyb0DJMjyylj4P
 9MW/hrvOYgJARBc0EPCuuyhP5TvWAoEwTmX6QCFeolBXLkqpz9JPvJ9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699bf782 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX6eha3GbIP/Ay
 Bl8DIygJuy6R0WEMOf+IVNFnlBH7rDrxVrsT/92RF3bhVmbv9yCL3pO5OlUD8HkHfV1LvZPunDg
 DSPDyqz5PPo73fultGUjJ7H76q8q9LK+rkAKn1NPH/WKHFxstMJHai3pWYyAuN719Pn3Ws82EHK
 5BYk4H6lr6lop+akgBhpK6hlMF0Z93bdCwLpg2qAe+TSiii8c3/TeDS4zoJL7qButoQLqxLpLch
 LVYi/9tZMNhqFeVFeMPfqv8Si2157As9Q0Fb+QW25i+J4muVgBYinReGUUEGD/nOkvVTeNW7D/Y
 NtjSjQpX6jOF3mhOYZql6RmSfKWiJMjERdGFNY8Um6WLeX7jOsCYMpB2/tV0Cote9klA+NJB+lS
 C2JU6defk50VYKF2Yi+k+LPlbsbMki5fLP7+X06zH+u+zcKdg/0cBFK+Lf/r84P+DDcJrjQAjzX
 1n558HDyoH9w16hp86w==
X-Proofpoint-ORIG-GUID: 1ZE5yriW1GD0agQ4E1GJZLsFtylGuctG
X-Proofpoint-GUID: 1ZE5yriW1GD0agQ4E1GJZLsFtylGuctG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93581-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7EE6C172542
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
index 081498162011..32353980964a 100644
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
index 92ffaf771fea..27dd72065c60 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -472,6 +472,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


