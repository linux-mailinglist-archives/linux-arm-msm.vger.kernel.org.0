Return-Path: <linux-arm-msm+bounces-90285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEw7CGgfc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:12:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E171776
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA93330193A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A759735C1BC;
	Fri, 23 Jan 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMKqNoO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="afG1Qjdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA8356A28
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152354; cv=none; b=m73CTAL8K3GTRx4UvNFbUeqOd/Df8RBAvlZun0skrxReTq/LF/hKugrw02XM2dQdInHq/qyWmezeqIxOM0SjcPtoIO7JIAG63zEqYIgmEgSCOJLWqyW4aJD75UEtm2dAyGVd8dICKSSL7rUtBiMevH3L8n3B3u3yV0p/67253Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152354; c=relaxed/simple;
	bh=mbeGn668zLrH+yppQKFVMkx9Lnc+kerz8T6Sa+p3VVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WylyrRWmdpYaVPSaN+fgVj/ZjjxUkZpCpJ6BFhAKjc0H0WP2kq04LKi6MOcpDnfRaD0VVXBsHZV9ZbFYyZOOmY0S+GIHcjEYPURtHIiSzTITYj49Gy8AuhDdMgxxW+XJHpsEXIypykIsuBWgCDXKyTeCf9w+sIr7ByqCdID8Mro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMKqNoO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afG1Qjdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N539533126259
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4MzyUwxeUkU22EMG4YtRil/j6K8vfk+OPjmGCpuy44=; b=aMKqNoO/C/HEOlOO
	Senw/1zS0OIt/Iv4+hKtu6LNSLlhXanH2STZBgdPARsv5idu9z/p9IdSwwPc3kpQ
	sRxdn2IEgnxo4uvJZmHeQAFcmAdH5dws99yaJuQZcUJLmhdBHGW/vnniyi6AKl0J
	L5ZgDSGCKMXFcZ9a+rFjvc7CzHL8NRHBcyUvYH0V01+YL09WScJY9HxKCCEkwXtc
	4OA0lx5bgSZf//rGpFvE2RmTQ1+zceRx6maCNYIoaxut/Y5upTXmEIKvGvs8BpKX
	qaGTRsPu/RKKsuWK7bq0jpQJbS+KGm8gLtCwDW8iJ9zrVNTJbY1VyKTRZo+BVqGd
	j6YnHg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdsw3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:12:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a377e15716so42848165ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152351; x=1769757151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4MzyUwxeUkU22EMG4YtRil/j6K8vfk+OPjmGCpuy44=;
        b=afG1Qjdv0npekoKySCv0Hk6TRED/JwdqozfZ7cxMoAvF6J8nd3D5Chho++BXSWKnY0
         yqs6+L5Sd0OmEap2uUD80TEIxX8INidxr9U6MK5Io1yyBGN5GQJbPuzlJH2rxVbXgfd2
         ybArAH/u1P2d0eWk/BrHfqwFaVrav+rGWbelwch3ilys5cArZqXRtye61HH1L8rAxwCi
         yb2E6KZ3fVS0QqO8yEfS+hTctIo4S1IbdHMOrZLYKe6wSvcDbZSjg11qJhHI6jYqFCfy
         lPOESmYrSMoVEPgs4I+xW58cxIr+v+LMuxYTrhi+Ad5LmrcMMkdu0kHlT82pr/HSfv3V
         2C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152351; x=1769757151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x4MzyUwxeUkU22EMG4YtRil/j6K8vfk+OPjmGCpuy44=;
        b=FzvOxFD6LhIg1n5Pt8YYOnUiTnYgA32xT2J9RHvEUi62wcjxprJBnfNrvMhDRqphCa
         LQwW8wY5h2JPOAn4iuRjNuglmynbdu34dqszz4jCWyMySsDvJr4H7e7/HzknDQlK9ttA
         nO6B3J57auTYUoXrA19vtbamAY3uTaYXQuVuHxrzl9Y45asUkbwB9/Go+Xt6+RU9KR2f
         zgOvY+xgWXOqtyc4UPnnZ7QNBam0Zmpbi5SsUkPul8XZBtPcpjo02Q6ZZkMkVcKx4XEy
         osQCGHWZKBfpkzQSAP/+rLyMtbqBT6NDiS/y5qntc+uUB8N9RnnDH59XtxzAWIwRICKB
         Qckg==
X-Gm-Message-State: AOJu0Yxci4XU/hIoBDZe+kOfdqfSQLZcRaF874pfa7cyHWZxrtLx66KC
	CmkAk0zbH01kHsqqqwMAiWOcEzlJo8pQ4Ey3+s1OrBm970MOJ0/W3sivyj562DgS5FZOFfYXz6x
	t1sNXvzfZTKOwuTLuQmN0ZTZVFSb2b2fh1K90F9/jTyTc2K2HfZE9qknxCX/19cJ/eaEN
X-Gm-Gg: AZuq6aIrXFmHD77CJVq8BpmAjAwce+a4UCUm/7atReStF5ibfCx7aNPZhMnrWRyHukP
	LT+zHcPkZzMl16A5FAtz1sA/MgkW3kQobfCXsO0gim8yqEEWitcK8Spm6zSAL8rOV6zYsAiJR6Y
	xnsTrCdkSYUbqCpSx6H2QQS4FWT1wrxslscr06fRcYe/8fPTEiPSPO5fBE5/KgA712KDoZFJ5OQ
	FJjGJOHqz7DsZJeXCqnq5EIvqXWA8IWyHSxisX3/Af3Wuz2aY9kZSb4gbVHt1KcWfVcKfEimBGE
	DXB9/ytzPzAQLwUkPAopTOVnAy/P8UOkcii8FATD9B8ogOtj7jVTZRMdnGA5veNHPbdDVdPvVl5
	Kcbg0lowNuNWf3AjWaHaVPWbtMPryYBygmlLL5VQf56V91dA=
X-Received: by 2002:a17:902:f651:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a7fe74e57cmr17004535ad.50.1769152351399;
        Thu, 22 Jan 2026 23:12:31 -0800 (PST)
X-Received: by 2002:a17:902:f651:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a7fe74e57cmr17004265ad.50.1769152350872;
        Thu, 22 Jan 2026 23:12:30 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978e0sm11336775ad.62.2026.01.22.23.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:12:30 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 12:42:12 +0530
Subject: [PATCH v3 1/3] soc: qcom: ice: Add OPP-based clock scaling support
 for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
In-Reply-To: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX9R/uiPtMzn17
 0Kc2CAxzZS7cn7YltB8V0zlGM46lsWnK8viA1KleEwQ+NKs5wyWEQhL9ySKU/Joe5pxTYGXmZc/
 W8nckMBNWEHdfR6nOnesx5XVzQVtEs45sLW4DPBOhsLgzOCIDsvlAlfKsHYU1k4srAwudmxja3r
 EmtZ1T2kzIp1Gbu2FNv3btTZQTEHIOcYeMKZ/LSZ8Q8I/5mHCyluPI2lW3YvahfxShKuPyWNGi5
 fau0F16pNnl+4X9A9epVVRdKcPACTIXZh+DIYbSr3hqz5U+wD2HeXBo47TFM9GrC3AMnsPjFCvd
 /z5w19rjEMHSVPK0hmwTVNspIThY6MZvoFPyrWqrqGMjqe2IHiSecGX6/EAjVNEaH7DVX2wMN4Z
 adZagIr9LcmaXnx3679Z7yt4nmpTU4HczObyorgw7SdWi58x3XBUFw5fsHmeDVs+xldDwjfcL6z
 cvFJ7/VB0OV1PK/BnWw==
X-Proofpoint-ORIG-GUID: odE4m083t4BLRveLq_H7ScCDaOIO_X8O
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=69731f60 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GaBF8cNdLVowMAKyZsMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: odE4m083t4BLRveLq_H7ScCDaOIO_X8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90285-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E6E171776
X-Rspamd-Action: no action

Register optional operation-points-v2 table for ICE device
and aquire its minimum and maximum frequency during ICE
device probe.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock if valid (non-zero) frequencies are obtained from
OPP-table. Disable clock scaling if OPP-table is not registered.

When an ICE-device specific OPP table is available, use the PM OPP
framework to manage frequency scaling and maintain proper power-domain
constraints.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  1 +
 2 files changed, 64 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cadd21d6f96eb1799963a13db4b2b72..ca6a7df7a6827378af1f013c7e62a835d1b80cc5 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -111,6 +112,9 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	unsigned long max_freq;
+	unsigned long min_freq;
+	bool has_opp;
 };
 
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
@@ -549,10 +553,29 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
+{
+	int ret = 0;
+
+	if (!ice->has_opp)
+		return ret;
+
+	if (scale_up && ice->max_freq)
+		ret = dev_pm_opp_set_rate(ice->dev, ice->max_freq);
+	else if (!scale_up && ice->min_freq)
+		ret = dev_pm_opp_set_rate(ice->dev, ice->min_freq);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
 	struct qcom_ice *engine;
+	struct dev_pm_opp *opp;
+	int err;
+	unsigned long rate;
 
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -584,6 +607,46 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	/* Register the OPP table only when ICE is described as a standalone
+	 * device node. Older platforms place ICE inside the storage controller
+	 * node, so they don't need an OPP table here, as they are handled in
+	 * storage controller.
+	 */
+	if (of_device_is_compatible(dev->of_node, "qcom,inline-crypto-engine")) {
+		/* OPP table is optional */
+		err = devm_pm_opp_of_add_table(dev);
+		if (err && err != -ENODEV) {
+			dev_err(dev, "Invalid OPP table in Device tree\n");
+			return ERR_PTR(err);
+		}
+		engine->has_opp = (err == 0);
+
+		if (!engine->has_opp)
+			dev_info(dev, "ICE OPP table is not registered\n");
+	}
+
+	if (engine->has_opp) {
+		/* Find the ICE core clock min frequency */
+		rate = 0;
+		opp = dev_pm_opp_find_freq_ceil_indexed(dev, &rate, 0);
+		if (IS_ERR(opp)) {
+			dev_warn(dev, "Unable to find ICE core clock min freq\n");
+		} else {
+			engine->min_freq = rate;
+			dev_pm_opp_put(opp);
+		}
+
+		/* Find the ICE core clock max frequency */
+		rate = ULONG_MAX;
+		opp = dev_pm_opp_find_freq_floor_indexed(dev, &rate, 0);
+		if (IS_ERR(opp)) {
+			dev_warn(dev, "Unable to find ICE core clock max freq\n");
+		} else {
+			engine->max_freq = rate;
+			dev_pm_opp_put(opp);
+		}
+	}
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..b701ec9e062f70152f6dea8bf6c4637ab6ef20f1 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,6 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1


