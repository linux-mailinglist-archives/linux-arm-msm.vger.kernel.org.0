Return-Path: <linux-arm-msm+bounces-91542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGljCZ/qgGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:19:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7ED00F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6ADF30C44F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49CB38E102;
	Mon,  2 Feb 2026 18:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZULst0HF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un6mMv9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5AD38BF7F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055832; cv=none; b=AeAKrXx2gyeJWnnoLEjTdqfrtbnXnbK6HvRE1ZtLB1KfV/aQIQBISD52y7n14dt8pV5HE2Topk57k7UwRmg7HvLoNNtAxupF10H+bOKdYnLuxXdyJh+k60wzw7mTiFjoGcI8sFeA7T9pNGgj3lg9CnC42EGd/EuRvnLojIYnz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055832; c=relaxed/simple;
	bh=Ca7dUrycfmQSIy3bhmc2ircfbQn7cqmMeOtkOf+AclE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8aA4ddWdnr9bb2sudkpqaIoToReJRw5bAg86qQI2cKH7LId+cQCjIaD8imceNlFx6OHCxxjAVRXJcktG4oeZz5GmQaADD7nL76X4+asT93mGEiSv26vwH26Ws3DoDb02UG+R0hzBBu2KEmqsK7W/51sQ1+XmnpcRmbgpJlthgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZULst0HF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un6mMv9x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612EJGl31305623
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LxiuI5+/w1m
	8/5Ddt8uPvaeMtlwMfkEvGlJMXIthprs=; b=ZULst0HF+q0UmDswXLZ0oR0Q8ej
	MxXSLAabYMthDy9H+faB9n0Y1FH2GVwOxPooOIc9QakR28/Q3L9yFPG08L9Nw2Ge
	66NIcJwB0ESgP0LPuILv6kQO+OPMw+9JeEOxLt9YrarUgIOR1fy4XrHyZVqO2z+g
	DoqFeJTc27TsXag/iEh3BCBmlYLYeHd6H+apO3XZe5to6d9y6bPrQFUjTms8aR1q
	Uz98B/Dh5VEHhCgOr5C6nzQe/f+JxNscp2WI2qI0UXziiHCBDY6t45C0xw9f/JPe
	l99Kj83r2b2XO5DUsfias2sVYyUqK7BVx67J3OQIYajpqeNMIdHig/vBHmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1m739-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8234ea73bdeso5937240b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055830; x=1770660630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxiuI5+/w1m8/5Ddt8uPvaeMtlwMfkEvGlJMXIthprs=;
        b=Un6mMv9xb4KItZ2ZR8D7X8IO1CH6IvaTxEMFDCAh4WCFXw3+ipU46UsuSqDmIUlB4m
         Dx67r9kpEATeMJnGFiEAKK5szo2S0hza87nx8dD+0BqdVpRNlfVTZy/7CSpjH8WqBPmz
         bzvocZCNArg2ouLKVETlH1R+G2MSfUsGhCjp8Pfh4mbZiI3XgaaAyHw/TSGaUkfhNB4d
         I6UKlgVhm+0KTjhfNoCKaP6vPGtS6E9XWqGqb31cFfOO92kUIYhPFxqmFJKboPTx6E+e
         niqI4Vcvb32XKR4Bc7O9bRG48HPXME6ujplN57MrKvpJuTerCS4sTAyiljCK8icVfBFj
         eZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055830; x=1770660630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxiuI5+/w1m8/5Ddt8uPvaeMtlwMfkEvGlJMXIthprs=;
        b=acaYhKa45EDv4rLD8uYHUelbE59QkPk9RHnae0zk2KiYUN/ZRuhD7uR1qPEYmYSxN1
         x27H5Znnhdca0KlnbtI8AAGBbz+eLQANnZLe3SGecLEBMKCzwkkbAFkFsj9SUp1AOQfB
         nNF/E2gXtLlfNsUClC5yU2jsNsgRD/tImEO8isvm/1B2esXImVGFE7KCtpJj3T4BZxkG
         7m6iIYj3/z7O43xSZUoLeqHUfFV2UID3wRjp5uZWagqt4SAFfZ3Q1JG9CQA5u/4rNiPW
         nxJ5OzvBqY9hqf8uXXQ8KyM7JOjebmKyYBjh6fTPEuHDai9l8jBBf8mdhBNg3wKjpDoL
         U/NA==
X-Forwarded-Encrypted: i=1; AJvYcCU5jRDv+A9VF+F5DSyiQyHpc5ZrkMN4muHmB+s4DVUMxs0UDx7CDdfcEwZBDNsgFIRUz8dgqsBFQSUwfMrP@vger.kernel.org
X-Gm-Message-State: AOJu0YzqFFu68aCCasYmwpFmu9CtOmZ4ope9wkrVTVOlIVH+r2Q1RRwY
	9vHD/QJeR1JxXKzr1A0JjGvbPgehYXEWD6T4RCUV0Gl1V2f1JyQ1y7P+DSuKUtb11/w11HPk3kd
	7QdCXwQbfxjkOPRtGpj/NFWAk3CfMmvr8oFy42e8IKG938+22a404XDwWl6kTrBgH66dH
X-Gm-Gg: AZuq6aLVytspPfO5pbSic1dBzcnHAPKdXNblqWNldNaHiK2CnggEthO7HES6rJZg/eU
	JgUd+mSUMXOnq00ecW2lu5pyCULED8FjvyUuaEm5ab2gRyk0cydrHtrbSTtxwLiOeqyG+k81e4O
	fKnTfX5Jm4CbVyKjlUCr4Up4XSFBc1EY3rOGmztGr6NxsDBko1akhb4YXq00rEFocEPRPtNxXSe
	wDvUyMxDCNiKp9mTzc1pX3S+PE1qepGUK/cG9QLJ7hFYZQ/n0eOsp2zVdyCkPx08h2A9G/b6LGw
	HFQbaYy/PCC3yarAdcxrnxNbXL15Bc3zivAKzdaNS+F9CMBlTblX4+lk0PY7wNFl6pgEoEuDsqQ
	B6mp8FUkzpe/eZLoumV6QvmRhL3N9hSiglMWqvkBt79M=
X-Received: by 2002:a05:6a00:94f3:b0:823:f51:192e with SMTP id d2e1a72fcca58-823ab756df4mr12340326b3a.51.1770055829995;
        Mon, 02 Feb 2026 10:10:29 -0800 (PST)
X-Received: by 2002:a05:6a00:94f3:b0:823:f51:192e with SMTP id d2e1a72fcca58-823ab756df4mr12339898b3a.51.1770055820680;
        Mon, 02 Feb 2026 10:10:20 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:20 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 06/13] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Mon,  2 Feb 2026 23:39:15 +0530
Message-Id: <20260202180922.1692428-7-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v0cy_BTfWXPOFAm4xnb4x5TdeWkf-BTn
X-Proofpoint-ORIG-GUID: v0cy_BTfWXPOFAm4xnb4x5TdeWkf-BTn
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980e896 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WUWHbvwt6nHlCWk_UTEA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX35yyLqxG4ZbB
 +R9E1p3hQx4YvERy74QwYGjwZdXgJuQfyIspMDadK3yonLQaywGZ5Wcd8UBzrwku9b+aL40BwVL
 7RsgWJ2wZwIEQa28JC5gke9pgmb5pQ/pDpfvwPyC23SViULHFwlNZZEMRi14LESy+Y1iY0ZRUEB
 OmagzTJlMUo04H2xhnaaevlsgANL7k8JaqXYw89f5b7F4D0rBgnXw9IdsBrg/tzwfVi+7LTt3K1
 msKfG75GOE6QJvU69mqVXr/cmj2xZruTXrCr7UFFstxmO/Ipc+mVefCMHc2qLRwdGkfB0rFtaSm
 MODZqvDekeCvpDSh20mRMwnJa2GxI44mhYD/sfkFK4+aE3QW+Kxfly2w5lCdqMchCODg5UQlAqK
 NXQyFavG6hAz7Gu9+IrktUR1cMVjKUonsIy2dSbKWfI9kJSUS8TgUAx6LGlJyqugxKNbZ1AatgZ
 mY1/fXrOz2j3BNVxDnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91542-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6A7ED00F8
X-Rspamd-Action: no action

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
the attachment of power domains. This often leads to duplicated code
logic across different driver probe functions.

Introduce a new helper API, geni_se_domain_attach(), to centralize
the logic for attaching "power" and "perf" domains to the GENI SE
device.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4
Konrad
- Updated function documentation
---
 drivers/soc/qcom/qcom-geni-se.c  | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 17ab5bbeb621..d80ae6c36582 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1092,6 +1093,34 @@ int geni_se_resources_activate(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_activate);
 
+/**
+ * geni_se_domain_attach() - Attach power domains to a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function attaches the power domains ("power" and "perf") required
+ * in the SCMI auto-VM environment to the GENI Serial Engine device. It
+ * initializes se->pd_list with the attached domains.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_domain_attach(struct geni_se *se)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	};
+	int ret;
+
+	ret = dev_pm_domain_attach_list(se->dev,
+					&pd_data, &se->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_domain_attach);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 36a68149345c..5f75159c5531 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -64,6 +64,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @pd_list:		Power domain list for managing power domains
  * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
@@ -75,6 +76,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
 };
 
@@ -546,5 +548,7 @@ int geni_se_resources_activate(struct geni_se *se);
 int geni_se_resources_deactivate(struct geni_se *se);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


