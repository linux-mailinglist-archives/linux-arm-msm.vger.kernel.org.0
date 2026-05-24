Return-Path: <linux-arm-msm+bounces-109516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKd1IgxRE2oI+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:27:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A25C3930
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB753018768
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC46F3148B4;
	Sun, 24 May 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPTAroaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7lzQW7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C83318121
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650767; cv=none; b=Dsqoj3C63F4EH+pmeqFVkFi6kmU3khJQxO1CD9/RPJ+7LB3VRlVO3DlAmcZiiYBDPwkbsDFLXVuIfupatIoXlSTAsBdYc6PuolvVwFRSRouoazXMeT50DPnFmBntk5GorGpIJYRYjul2b59Qbt965+YA2mg3xm7t0rtPF/xPnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650767; c=relaxed/simple;
	bh=2XVqbbZnXrWdL6DvN4+UCZ8/oM3cT6QvMe4IpRa4F+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCND6H2gbvBUyBwjbyu2Zp2KUDk9cztRpb2BbHtlmnt0fjlr/zHIGRL82mDVqOjd4KhehRqFgKZPGmSSzGhNQ8wJOmpUQHgVNXt2FqMXqXsNRo5j1SlX0qdW7k3vZg4zR4R0ysRlF9z0u7JBgdIRWUUs1RExB9cMw+jOWT8rCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPTAroaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7lzQW7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OBVj5F400542
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBy8Sga9ZNMwWSkdE9qADLLm3eq206uB394Jr3D5cVM=; b=pPTAroaMy2+6mEik
	HCA7vFtunh8DcJKzclu4nCSmAMCR18qtK3La2L6muWiclQHyeBYz6A2PpIaQ8BSX
	o7G/WFLePe/w6pPC1DMzPQ/6xMiflLdgBTO6zZg4mCyeXoJjGhuLp7tqVRGVcDsC
	DSqbKcVIhOg6bGwvZS4iE64+OPvKMuigaFDYcVk2S7m/xuF+5SlUFaMW7nW1Vn90
	2ty6+L2L/+CRcGefKfE0NbKRu9qOa4PWSgNLk45+FDLQjmAtcXUSXEwW/HlF6lR9
	UllHYg64kBtvQs686iQEGpnxwNB0EoqfP7zNTgqJn2/+DOS8srU9c+4ZME7CYCoP
	/EvnAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w3bue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso97264025ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650765; x=1780255565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBy8Sga9ZNMwWSkdE9qADLLm3eq206uB394Jr3D5cVM=;
        b=N7lzQW7alIXmPrtXbZYxYlVmyHJ1qWfHmXLDm+hesTuYuTj3IfDtbXpM60hbL5UKGS
         b7P62iSaT5UNzg2OcAIiCuqE+KmWmawkcqIdFsOWnri6VWsu3i+uaBZpcUeRjN9LlwYn
         CHTa6o/BGXhTJ2X+eW+J4v42jA/xfqQNAr6x/UDYL1p4d6iZaNzbsgdRtutULy3aey2o
         PxFfr8n6c9ZspkizVJH0ghIabFYcfNiujaJ1ydiGYC68MEx8g9sj8AFrhuyRiz6H8Gtr
         +opVAoHqCsTCsSjRmabYxLYzjLJRKHe0VIIuUryjXt4yFA8fDfH5P5YqDnI5Wh8T47VV
         paYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650765; x=1780255565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBy8Sga9ZNMwWSkdE9qADLLm3eq206uB394Jr3D5cVM=;
        b=LCAFECNHZLjE4n0RSSbNCxZQTg4EnVp6rhNDUPlYRhCaM9mtqKN7TMKE+YWVp0z43y
         AL3a9nY6YmMI9TSjrkBrK999sMsttKuT9WZwsSsvKWds9oVlbh4+tuJcFpxFh7ahCyLc
         Ja3I1z5pj1/o0YnA8gqomwbpI0u3IiIl8NNHLlwegWzc68epMB2HqoL+6s53S07zkcLM
         x9hsSO5O1h0NN8B3wjhlwVtsMNxucksrBnQ7xjPgcff0/m8zIVDWlR4YekkZYXJHv3JQ
         xVVVFl0ktH7LEnLXKjO9jxXtgV/qdRtgAONy6Q4fqKqEp39sp4Er53yQAGQRCS9Sj0j0
         xQIA==
X-Gm-Message-State: AOJu0YwumXNfEhM5VitQhFfB3gVp/yqTLfQLI0tUq2gbdYgloZSm5mYh
	g4iuhwQQFPPo3og7HBWitkaCcp02Peuc0U4vfglGjpyqXUGodE0jBawvp0EvMDUBjL6+AGsl7s4
	LlS9N4ttlZvzXw/KHZEw6dX1+8Cy/LAmcA9Dbw5vjMzoEEXQu6C9eIgqK/KOp04yLnoph
X-Gm-Gg: Acq92OHl1gZhDJI6a10Lk70i2EoJg7UkZ/+fQfSLIJiJg7NPzkBI0ObjaliXRiFGgso
	JYTOMG6SSwdfrk8udYrbxOqNVF/5dDBfO+3CpPxmiFbLti41mPxP8L1UohaAq6ooMDh3VTyEEbh
	AP2teSHHBk5tLNi3LTg2OsMIBKGjGw9McY5dBJQai5obb8UOdSPRW0yriyu+7LL2rCxXeI2jFIB
	1y9QUr8UdiXuJi59AEEqXRyUulIkGsQmzmMUB33cZEN7lCmE/MO5aqOZ4EDOrWzP2xI4ozMEw2A
	B/AtFJj0j6bkhfJcTBkg/rK1VmXobzVFJPJVcg21lc4NWtrJfy88I9e7YoXJbqpo3LBLeDbAoCE
	lUtyBnFmMdemM1EL2uBqo1Ml/pmHCmu+N9rGl2yomnvV9uWjnpUtxJ5LfFm4=
X-Received: by 2002:a17:903:3b8b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2beb05a5776mr124836865ad.1.1779650764910;
        Sun, 24 May 2026 12:26:04 -0700 (PDT)
X-Received: by 2002:a17:903:3b8b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2beb05a5776mr124836465ad.1.1779650764342;
        Sun, 24 May 2026 12:26:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:03 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:48 +0530
Subject: [PATCH v9 1/5] soc: qcom: ice: Add OPP-based clock scaling support
 for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-1-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1350cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zlodBCVASgOsPZHI1q0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX0O0BqFd60uU/
 TDVSRXaWh3iftL3YYIrVKrlwruBEu7EUADjI5PkwnKP344tbEidxspVqqSWxJFUW9QakLp5iBju
 QkybJqaEK/Oex8SXoLqjOAM0omh5GkoZDn0Il7ZwZg4HDh8vWXFpKOUTqskxmpSq/xcCRuOD0Wp
 vD5u1dcf/jTSJG2kxhJeu/DSX259ULNsEOzNUiqiXHJNhqOYWjkKpwmZ8IBmej17iHFCPmio16m
 HDgOoE+WmjjQp2ja4BmpHw9uv7rbMjTH37OwEfwaeZb7mEXeVuf2aTiiBbhMhOKvDaNVby+mJkX
 b4gt7L+4qLWuCOhASXSn7VaarnSC+FPqOF3tt9SZLOJ0m/9dRZr8bn0JY12IKNjrglyT6YC5S9H
 jvxSGaa1x5oHBL0kG8uIbXwK029JYNwJe41cv58ftEb8qmQqXzcOp6vqBNbKiTbtHO9HTuFTu1z
 zRQw91leJAer1jqqHEw==
X-Proofpoint-ORIG-GUID: mfpR1YsQApUzG7wOQbCWFUslKDYPUVg9
X-Proofpoint-GUID: mfpR1YsQApUzG7wOQbCWFUslKDYPUVg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240194
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109516-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F05A25C3930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register optional operation-points-v2 table for ICE device
during device probe. Attach the OPP-table with only the ICE
core clock. Since, dtbinding is on a trasition phase to include
iface clock and clock-names, attaching the opp-table to core clock
remains optional such that it does not cause probe failures.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock based on the target frequency provided and if a valid
OPP-table is registered. Use round_ceil passed to decide on the
rounding of the clock freq against OPP-table. Clock scaling is
disabled when a valid OPP-table is not registered.

This ensures when an ICE-device specific OPP table is available,
use the PM OPP framework to manage frequency scaling and maintain
proper power-domain constraints.

Also, ensure to drop the votes in suspend to prevent power/thermal
retention. Subsequently restore the frequency in resume from
core_clk_freq which stores the last ICE core clock operating frequency.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  2 ++
 2 files changed, 95 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index bf4ab2d9e5c0360d8fe6135cc35f93b6b09e7a0e..7b98afec71f6135f580f82497127b0db7e70a6da 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -112,6 +113,8 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	unsigned long core_clk_freq;
+	bool has_opp;
 };
 
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
@@ -311,6 +314,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
+	/* Restore the ICE core clk freq */
+	if (ice->has_opp && ice->core_clk_freq)
+		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
+
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
 		dev_err(dev, "Failed to enable core clock: %d\n", err);
@@ -331,6 +338,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 {
 	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
+
+	/* Drop the clock votes while suspend */
+	if (ice->has_opp)
+		dev_pm_opp_set_rate(ice->dev, 0);
+
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -556,6 +568,51 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+/**
+ * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
+ * @ice: ICE driver data
+ * @target_freq: requested frequency in Hz
+ * @round_ceil: when true, selects nearest freq >= @target_freq;
+ *              otherwise, selects nearest freq <= @target_freq
+ *
+ * Selects an OPP frequency based on @target_freq and the rounding direction
+ * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
+ * including any voltage or power-domain transitions handled by the OPP
+ * framework. Updates ice->core_clk_freq on success.
+ *
+ * Return: 0 on success; -EOPNOTSUPP if no OPP table; or error from
+ *         dev_pm_opp_set_rate()/OPP lookup.
+ */
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil)
+{
+	unsigned long ice_freq = target_freq;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	if (!ice->has_opp)
+		return -EOPNOTSUPP;
+
+	if (round_ceil)
+		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
+	else
+		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
+	if (ret) {
+		dev_err(ice->dev, "Unable to scale ICE clock rate\n");
+		return ret;
+	}
+	ice->core_clk_freq = ice_freq;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
@@ -731,6 +788,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 {
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
@@ -742,6 +800,41 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	if (IS_ERR(engine))
 		return PTR_ERR(engine);
 
+	/* qcom_ice_create() may return NULL if scm calls are not available */
+	if (!engine)
+		return -EOPNOTSUPP;
+
+	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (err && err != -ENOENT) {
+		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
+		return err;
+	}
+
+	/* OPP table is optional */
+	err = devm_pm_opp_of_add_table(&pdev->dev);
+	if (err && err != -ENODEV) {
+		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+		return err;
+	}
+
+	/*
+	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
+	 * -ENODEV when no OPP table is present in DT, which is not treated
+	 * as an error. Therefore, track successful OPP registration only
+	 * when err is not -ENODEV.
+	 */
+	if (err == -ENODEV)
+		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
+	else
+		engine->has_opp = true;
+
+	/*
+	 * Store the core clock rate for suspend resume cycles,
+	 * against OPP aware DVFS operations. core_clk_freq will
+	 * have a valid value only for non-legacy bindings.
+	 */
+	engine->core_clk_freq = clk_get_rate(engine->core_clk);
+
 	platform_set_drvdata(pdev, engine);
 
 	return 0;
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1


