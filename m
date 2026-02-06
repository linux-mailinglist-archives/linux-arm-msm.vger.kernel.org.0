Return-Path: <linux-arm-msm+bounces-92082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFh3Oq0ohmmSKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:45:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A156101503
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DE093069D76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0F13D523B;
	Fri,  6 Feb 2026 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxT89Rws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKwGvyhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF24B3ECBC2
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399698; cv=none; b=CfDEBDN6aSkTPFVY4+3Q3Bi1K2QYMFkLuEB0thzLsZxOmUB3hn7dyJXCso8XKD0f2hqmh35lTBFkLRxKyRq6WmxiFeJRjNtoMkobBCquYShjGH8X7FpH84Ovwv/lMEtz6MoxndFwzIrVzaVZNHMv48Rv/lT3NNDrDYZNXEDDfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399698; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+Ta5+dtqOc5uZNYrLNbqZG0kU0ha8kAe4QqDDv6yFsfKVU/4HCdMOc80Kd9F8PRYRt4/8pHhLtT/SUHF/eTTED8ee/j9J4OLC2Nt0MVdnM4Lb2pVZesptbBNgXftFB0drvBo2lJ0Cyyb7GhRkPGYV3L00CBt6F1p1iebunrI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxT89Rws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKwGvyhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616FKEqZ4042340
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=PxT89Rws7YMT1YLT2mfavkWPCrb
	1yOK9dRKKuWLQnSc8S1hn67RlNQPty+vKgafSvbyCu9V7tPnKqTrF1wqHeQBkqwy
	RtFJDVXSpee4mg6dcynUfi7eR7VLBBhplHBvDYh75StxacRZrA8HgpQ8LgiiPKg6
	q9YI5AuWrL91gkgdciLVlM4jDOas4EFhqhktlj2GkR5MDw69/PET/KePceVJuWtZ
	R78hHxIWszluHEOolL9QDCMt31n+4wjnkGs8bqobxDeT8vSP7oUBAW8cogmyTqno
	9UvNecGdrzQGlWJ5fGcMVlWIX6NdXGhMVCpQU5iDldeh6pcRs5s4YKuXEPA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c2w1u2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:41:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c61dee98720so576487a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399697; x=1771004497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=HKwGvyhHN1spm/g0zLwBcKERNQmqcj1FVD7wNlUkxPi2CHRwY4bW+DlaM+ZciJV0bh
         SvygjDmbFrzkGTsfWOBKI4cGmAZ8c35FRSBk5qkdqY3Li26WEDvkPte2vgJfwx900sRY
         efN54Ey5+BKnIrLJ4HuwB8Su5wHtaEpBh/ZXxuvFkMarH9ngaUhw5KhdVVPXYvbQKFa1
         JC1CSqQ+mZuLXOqvC1bZ7s37jpDmDMDpB9YupnVSDFn3X0KVpNZMCzoilETe92f40bH3
         shbT5A32VWmfu5Tfq2F0MWY4wJ9M5ZoNdfmUgvTvIbWaeS8xU/ETXiAceYzku2pmrE1y
         A3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399697; x=1771004497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=GHXpTFPLMiA6mabeVxXU9Zr5ry1tDAfHDW7UPYF4lTy4bNwUwiclsnscNKoXF33iaD
         ESR1tS1VVLSqsF62ZRjFVpQoCdS2DiH3fRvBBslP8ZfB9kPSGEbY2YbshO7hu0+8VtIB
         ha69NWxflvdy97c/33SJR0mNmqrCUz+h38DQzTuWDElPvdVt6Cyw05TAqHYBl48z8KrK
         qY8auR/Qn18gwZapyPT9uNlSuZLG6tKjyq56zHjWUB4mNsF2/sw/eSe6rjX4Y0naKfOB
         hs9u831njgbtup2ZUe9MlF/Qu6u9V1eKElW8k9JI60KMzCm3IswGZoYDAbZm6YOQuGkN
         y0KA==
X-Forwarded-Encrypted: i=1; AJvYcCVj1pjk9tyKQGM1YxTruPok20pbXwKHXwCX9u2+lSXjWq0CmGo7WIk+dkv382ZhIsa9W5HuLGxGcFhzIMx6@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOVS+hSNt+BUSbDJoAdAg8+uQaZFXWgo8rpvOD/MLdSqe7nkJ
	4Auj8AA7+oltsUQ2Pt3c3dg4DyDBRXiCflhu/oLk2Q599QTfqel/fa6ePxI0UMkO+Ae27MfVB89
	sDYoJLGv5BCPkI2joItPAHTAfMKZ6nN14E/+BSVNNuiufSc7mDYD4ipaMw2anbhT9+e/A
X-Gm-Gg: AZuq6aLtwSgIaxR1ytzwkdpJfFMoc6x4zSL8dh/lGfg2NqX1Xbk+5zAs4A+uw0gCiyL
	IZKRFxvOcxa36839hj5KVrpZ+T0Iyy+LQ4HlAkL+FHXm8OlTNF66UidjdipB+mG4MOKfjHwlW6L
	IotcTT8D2QcPUynT7kFeqPO+mmjUlYwBzJMG5//53AOcYXkfVqzZRHzIsnbvgE2d7qri9aTKCTr
	kwq3rM9ZyVKVZHOPlSOvufK+NYo0pVONi+8Bq5sZnNrqASfuYljgpFjO0VeMzxLk7A5K/PAtByJ
	l1KpuNTr/dIdVdjFJjCDqOlTLJgBFoQTYgsm4Rll/wvV+Cxhx+lfOU3F1cdgjh9b60+9mNNds9y
	tHWYbIChacTlpM7P2O0zpEqCzSUjAavFuK2d6W8MNwiA=
X-Received: by 2002:a05:6a21:6d9b:b0:38e:9ae0:3d5f with SMTP id adf61e73a8af0-393acfd32f7mr3821815637.17.1770399697280;
        Fri, 06 Feb 2026 09:41:37 -0800 (PST)
X-Received: by 2002:a05:6a21:6d9b:b0:38e:9ae0:3d5f with SMTP id adf61e73a8af0-393acfd32f7mr3821776637.17.1770399696631;
        Fri, 06 Feb 2026 09:41:36 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:41:36 -0800 (PST)
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
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 02/13] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Fri,  6 Feb 2026 23:11:01 +0530
Message-Id: <20260206174112.4149893-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfX15Cg6ntTzKSv
 w4NCdT+3y/SY1HvuNibV97c9CrNsSek9Zlcgz1Ep34f2yNy7qWUkPEk7n+W+C9Iov2MDbanzKjX
 WTSDGUFJ6lGHh3P+2nWq9lxTSm4eO1DwK2qbs4riGlegb//p9OwHWeJTy8OQDwTu0TiQimNJm26
 ErPXorKVnN1ZsMohXZpBDaF99fF9TfsSSDlO3Y/6C+C+rGxJpfcY0RhShNXF+6iEtb0SGKO/P4L
 JulNzpGazEMlMECq5ysfgnR2FxFj0fhPdRm/ElhWg0/BgnDaTBAFuWaz0V2pKBy4VCYNKgPBBmr
 N+K0cA1mfqBqc5y/4yZ/hapMpsOOVj93VJqds2PWQ16Y6foV9FeVRB4NDvJbecXlkC1d6GwlMPA
 MYC33DPq5C9bOmIoPOtnoiyoUPJR3CbXuD8XJcrsTt5QaRjWzI9Q8Cg/DP+NdhsSFNkl6UxbUtl
 XMKcr/KPf7lWxDSUKTw==
X-Authority-Analysis: v=2.4 cv=Wtom8Nfv c=1 sm=1 tr=0 ts=698627d2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=BVB3BO4C9w_THQaB-9MA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: zIFbRK6KNho4DLSdjEbbtDuCERJQogKC
X-Proofpoint-ORIG-GUID: zIFbRK6KNho4DLSdjEbbtDuCERJQogKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
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
	TAGGED_FROM(0.00)[bounces-92082-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A156101503
X-Rspamd-Action: no action

Add a new function geni_icc_set_bw_ab() that allows callers to set
average bandwidth values for all ICC (Interconnect) paths in a single
call. This function takes separate parameters for core, config, and DDR
average bandwidth values and applies them to the respective ICC paths.

This provides a more convenient API for drivers that need to configure
specific average bandwidth values.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b6167b968ef6..b0542f836453 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -946,6 +946,28 @@ int geni_icc_set_bw(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_set_bw);
 
+/**
+ * geni_icc_set_bw_ab() - Set average bandwidth for all ICC paths and apply
+ * @se:		Pointer to the concerned serial engine.
+ * @core_ab:	Average bandwidth in kBps for GENI_TO_CORE path.
+ * @cfg_ab:	Average bandwidth in kBps for CPU_TO_GENI path.
+ * @ddr_ab:	Average bandwidth in kBps for GENI_TO_DDR path.
+ *
+ * Sets bandwidth values for all ICC paths and applies them. DDR path is
+ * optional and only set if it exists.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab)
+{
+	se->icc_paths[GENI_TO_CORE].avg_bw = core_ab;
+	se->icc_paths[CPU_TO_GENI].avg_bw = cfg_ab;
+	se->icc_paths[GENI_TO_DDR].avg_bw = ddr_ab;
+
+	return geni_icc_set_bw(se);
+}
+EXPORT_SYMBOL_GPL(geni_icc_set_bw_ab);
+
 void geni_icc_set_tag(struct geni_se *se, u32 tag)
 {
 	int i;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0a984e2579fe..980aabea2157 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -528,6 +528,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 int geni_icc_get(struct geni_se *se, const char *icc_ddr);
 
 int geni_icc_set_bw(struct geni_se *se);
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab);
 void geni_icc_set_tag(struct geni_se *se, u32 tag);
 
 int geni_icc_enable(struct geni_se *se);
-- 
2.34.1


