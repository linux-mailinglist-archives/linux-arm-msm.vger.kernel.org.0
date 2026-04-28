Return-Path: <linux-arm-msm+bounces-104946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCYDLNqC8GlwUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:50:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F3481D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97CE5308AB5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE1C3D9030;
	Tue, 28 Apr 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pS6pWmQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpUrXaTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E3A3D902C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369460; cv=none; b=mQefQfYqnDy/xYUMkDS2Jlmj0swbJKbdnP8XmxaasmGa579/sUniBHa+koOwM/GK+cXul2XyIuxUOBpK295hrslK3r6D7ZmYXo0uEDRvC6jN2/PjcCmRRimEeca+P5m8Hg8CpuC4U6/ekZQz6iY75x/SJprDLLcy3AP35wuXLfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369460; c=relaxed/simple;
	bh=E5Fp9SeBlxlY5LkEyncq8DbWiaXUn9TX29qYsqFaHc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bgrRqsTg/quRQjV4b+7hBPiemISFon4YFCap3TvCre2fRmZBp8TxsqWJp0C0IBPXAIseDZ3dAPbTaye0axKfasN/0Qdz8Y0IlN20N1lpRWRj7eToagUb3UDPQBYnWlVLmGfNe1e0VPzBYmRbrZ1PiQGm4tPV7an6S8/u2QQs00k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pS6pWmQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpUrXaTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7ur9x3968052
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbKhSU90NlGW1d2QoysiqJ
	Hk3Yb91hEocxCgqPl/zD4=; b=pS6pWmQgpEyf8EL8Zh74MO9N1JnVlUVRODBVgy
	qddZ8EFDPlZVksZ5FWHdKeSIgxOPPfT954CX5DMAfEy+YUYDC9EJ8OMdXXCkWUR4
	h2jcjzm1pA0QlgbBs6xwj87zlF6iJHMYRyghneAPC55dooXCjbpWVO8zZtLk0dsR
	zf61FQb+HFzYMU78BXgxUWMqHQl85OGAqr+0KdhV/KUUXBDwzP3IktCZX75w0lii
	b838jNLGfVuzdQMr88kZprgra8SXkapRMp4yqJpxyu32BeAQfQYhBlLte017lrKN
	uf4crkZpZfv+bkKFnxeBRhlZsqe4838DCvEA2l7px7gNUstg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0ge20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:44:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so14787883b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369456; x=1777974256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbKhSU90NlGW1d2QoysiqJHk3Yb91hEocxCgqPl/zD4=;
        b=dpUrXaTc6W4auV6ykmnBTRCGA1vQPEkkDPLg1hUyduXVKCwJ6SqLNkxmuBqRUTkLEb
         xJDd4Eofmv/wkwlkz0GK4D4YD33g9cWABiEXhfVyZwlbqUmYtNIRWACX4vTPcDpBz7tV
         ak9lct/LUEIuEhSPCC51UK1NQoZghEaYxrDQthV8Q/QDcBem0afY3oY9vhNV2S2Rvxmq
         4F1jweJmxXvUGTegd5/69nTavJ8TJhc+5atWLNPggjjpl2v97MYqsJbA4+zfihxdy+Ct
         Ik73p85Dgbd7IeGtY1NKmVYKghDY8UgCILivYVrGwO4p3eCoirSS/cZlP+IVOFFjzukD
         6Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369456; x=1777974256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbKhSU90NlGW1d2QoysiqJHk3Yb91hEocxCgqPl/zD4=;
        b=aJYj7EF/jK4UP0d2JpE9WJiZQRvogxaUJatkxX1RToOUj4+tx8Zf7hy7VqRac6oqm/
         YBBtwTZBggmNzNNOHjeagtDS8AqJvQU9+ksTBxysurVZh4BR36BfU5hxRzh5BHtahl9v
         CSUHn2w7FSUt2oaWRpFB2fuX1nmqqTT1O7LhQnbFH6h5fZ1XpBDcPpZs7hlB1aV0VVlw
         7wPgsPEFzaYBZe51TYfYFhBaCMXS/IXjBjYwgEDsDfe+7gH0Y18OiCRzryO5rD/LLs1c
         x2YOACM/CyhHNsCp0ocjVb9AE3TL8H9GV5QCxMcpKVQUwUXfJj3CdX2lLjw0FfIu638n
         M08w==
X-Forwarded-Encrypted: i=1; AFNElJ+udmAhkAx9qGJcf2va/j14p5zl2hHYg3pELmIJVALypVo/5uXD4gHWYPkn53HXy7fGDq491MzEBvvsHDxT@vger.kernel.org
X-Gm-Message-State: AOJu0YzY40NOnnDbBPGFyE49EJPVxBZZu3n3d0qNKMVeWr/DUltDJHfl
	LWRev2DoFzXbUYfzc0RvFKyvGxLT8a8b8yIgVDJlIG8Y7MGOPjkw3XguRYILf41xt4n1mu5MKji
	JtAM0Fo4Cci/Nz/tOzS84ud2mz3us4FqzeqHCZVQudTbM/q/HB3wgeTBkRK+Dv6t0w9JO
X-Gm-Gg: AeBDies8aiSZfjhUbd4ZTcYWyQbPq8NMm7XLHX8voLNghGf0ZgociiitMrb4LRq2qjn
	tj8XoFhAb4UsaWFjO0DWimjyIT9gpzEcV/QINFCr/stbrKjAlCtNzI7dvQLM9HiTYj3536xK0Gm
	T0pXFSfg+Bzq6eDdKoR/kBwXMBzTC7v7FH3F6qyAX0fnKpQMXJ/oGcSd46IOyiZIqbuRWhg9kWH
	qONM4WSe4tb2zbFdcYgnozvvXqE5cEuXsmyMVyu5ShJHfLT0A4xzwODMmGkqHMbj6VP61CTs/vh
	9MJikA0ieBjai8GUQtp4QomBBjZFVEoOxy5cBOL+WL6Fo6jORSxg/YfvqCVSY6L28OxYgTPSWWA
	Evzzm8x9bJDw2zDUKXMS66x1Mvfn2ITPtawg3EjcWKN5hb9vrpIwh97pNQd5CQlJxhB32IWJ75M
	Lksj0IXxct/LoL9uDnb6WFx5zZ4soHqz3p0a86GcvmUDO2
X-Received: by 2002:a05:6a00:e12:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-834ddbc0d38mr2135333b3a.30.1777369455920;
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:e12:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-834ddbc0d38mr2135310b3a.30.1777369455438;
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
Received: from hu-lmr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00a4fsm2168428b3a.5.2026.04.28.02.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:44:15 -0700 (PDT)
From: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:13:50 +0530
Subject: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFWB8GkC/yXMSw6CMBAA0KuQWdsEa4HqVYhp+hlwDAXSAaMh3
 N2iy7d5GzAmQoZbsUHCFzFNY8b5VIB/2LFHQSEbZCnrUkktbAimHz5xTSYGZuOnONuF3IBCqa5
 yUl8addWQgzlhR+9f3t7/5tU90S/HCPv+BWQcG/1+AAAA
X-Change-ID: 20260428-add_glymur_mdss_compatible-44f5b2837498
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lokanadha M R <lokanadha.r@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777369452; l=1484;
 i=lokanadha.r@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=E5Fp9SeBlxlY5LkEyncq8DbWiaXUn9TX29qYsqFaHc4=;
 b=GxReak954ZzGmZqlgnafc5bl4MSkvrNHTmLT2Ber8YUDsqdVq8fCPAkZMk2YDZwaMCMRXg7+B
 UyP4R6kL3t1CAtinzijNaV/C076Tk8T76b1SZZ6d+NduSyoDzGzxch7
X-Developer-Key: i=lokanadha.r@oss.qualcomm.com; a=ed25519;
 pk=PfwARBW5uLDUvebYCDLNkw3HD4g2b3T0VDrb1uc1Rxc=
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f08171 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X4sqO_BnIXgP0qhT90oA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: D93lWKdIbIBdUQZH0kvclCZwO4zVw39K
X-Proofpoint-ORIG-GUID: D93lWKdIbIBdUQZH0kvclCZwO4zVw39K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX9EIJjcXjeVQd
 GsQx96Dv/XxtgzJx6ftCXfmoXgQX1DbWw2Ijx5GxziMGJKKvDgedUTXyfK1sEXDg1BHfdw1cJys
 nYQcH4mC1H/DwwBrrtrajXZ1etyyTAphdPnpmBYNUfilOA3GdTr9nQofXVTIN2bVhaNpLW/WSve
 +YzlW5E9eLFja9ecvPT+5QzYAZJmaYVRR6To9RqpNvfvu8wp/u60eUvEMTAPypxyzdQJPNbRzlj
 AgyOASFYl6TH7H5lkwmBjerGZ6iS3NB7KWU+NOTWIzMgCbzzwYW4RYpVPLUgxGhGrTESc7GmThg
 Vcv0c0K6Z+oru6V1LLk+qWS2trrrqu9QKHCVd3GbLmO34FI8+9KRPqObOC2k3AqgoMQSpJY/ZNt
 0dS7z9FvyHAZ+bUkq6/Qg+IRA5gIcNBJsAedrLLbFkaLMjTSiBnu0Nt19nNTZkHocATmqPsUQLS
 l85/7uTClILVPfbpjAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084
X-Rspamd-Queue-Id: 2A0F3481D9C
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104946-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[lokanadha.r@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
table to configure the SMMU-500 context bank for the display
subsystem (MDSS) on the Glymur platform.

The settings disable the next-page prefetcher while keeping
macro TLB caching enabled. Without this entry,
qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
device and leaves the context bank ACTLR at its reset value.

Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..6df48499a4b2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,glymur-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sa8775p-mdss",

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260428-add_glymur_mdss_compatible-44f5b2837498

Best regards,
--  
Lokanadha M R <lokanadha.r@oss.qualcomm.com>


