Return-Path: <linux-arm-msm+bounces-90758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JadJqCreGl9rwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:12:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A894148
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 13:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8DF03004627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BB434CFC3;
	Tue, 27 Jan 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NnoQkF2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioW6rPs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B333469F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515923; cv=none; b=G4x9Hhc6aVNAGa+T2IZcWr0OvXO3nj+KPyLIDUMfV4Vl6AOTj2pZYZxKGH6JkBEXx7sUALuR9XbMkDoG/o7MRfv5NufSIxEeJTC7vQUohdZHjBAq4G9laMPbudQBRSKRl5ijrI7meVjf26FCXj+6K4js0a3ZprX4kueyzcGh7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515923; c=relaxed/simple;
	bh=TeDy3t3Fs7sFv6et8Ck2qBnwLTCzre+JdzVVG14n6ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q5O/HZ0UYgpFKfKoLey1KjTZRqgV04XvCUT1KiZU4pPNdQtdxbop/i8vqf3cbPGkonvT+L2n31atsrpKHffeYUtA2fajTt+uAzE5ezXW8Yb1OdvnCPcgFf8h2kD6Li9P4I1WUqJW//5XQNpNDCCIghyUUnYzdMOp4txIHWR/59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnoQkF2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioW6rPs9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86nsm620690
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ds2ZJGE2krsn4P3tEHEukV
	hMuBmMD5Z71E4XCCNGtXw=; b=NnoQkF2rmO4tVZEjiDNcK1ybXCDrgwGdusJNVW
	lBKCM+RTyjlJQNHAUzhIOY2COeOx/nNrcyJV+/zhVxPL6Y5BzRUsje0hVzQfzDhy
	rNwhVjlCjA3kkrkxKqOKiWjHmOkNHlEykoNE8ZotZMCE+6wZv3TgvYzD6ymHU0uI
	5xtmQncwi0xJCyjP3Z84yDNXxswAVSuD6ar2X5Cy8WA+6vQK+oLWNVhRjHSRpr7G
	V+uppQdq0D3MP0DH2sWU3Mfj6ryj1wu8EojE+TPS9OP7ZP1inENOM3NFWbKX30k7
	xdFIgpc4uSDX7u6db3GVdlVfHFdesB/J6bwpD6/5IlJtzBIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegrr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 12:12:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76b0673dcso53692545ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515919; x=1770120719; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds2ZJGE2krsn4P3tEHEukVhMuBmMD5Z71E4XCCNGtXw=;
        b=ioW6rPs9d2/UgB/N2H+A0ZdJeInnwF5kNi5kvHTbrE+Esz6qpVjQ/xMvzAPITJrdH6
         bQKhnE1TnXV975+sDm7nxfKV2OqAUkaZJ4zafEXzrasR/t7DSgWVNikbDL5GHbELI6IC
         YvsYq8cwgIBYzub6C5mFufSHxzCIh3QikrqerU71d6zSfmV91zqCoHQMalcxtcwMadZ3
         EgdpgkfIr1K74KEdCUAtpHxN6Y3tiAwSPs8Ejdtu+7dCv4CDgN0w7sB/Hhq348GKb63u
         LTsqb1+UJrs4zXeqpYXtr+YVOAl+28WkgQQwV7yd/K8pzrWg14hxCQkeAyGDDmGurD0n
         Aorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515919; x=1770120719;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds2ZJGE2krsn4P3tEHEukVhMuBmMD5Z71E4XCCNGtXw=;
        b=cU6ZRdUwhm/tArIIqmXNS0HCfpZ2DuIf1Q1ONbNW3XzJlPr91HY3vRo4jtDxldtGgq
         JM0FOaOX9H+aaOFr1LipsddfMSv0GbGwEUUISdRZn1yQ8IGQ914pl+GveGhvEefJcQPE
         0HwS8RBdnw65fmLKq3GczXE/SHNvlybg2vxp2VSuO8UmYHuyMtT5+NqJVXTNhoTwjttt
         LENlj4ftocEchHfxL6IexgHU7mSSVwqeDZt3e5/t59oVW5YUTCcuy/UgNNoAKvC09Ksc
         22hKHMZ2h1ES7cw21usX3FZAjplURS4WCH1t7/+K858Nm2T9W9NRZGrfuaq7MOkjybyY
         k0VA==
X-Gm-Message-State: AOJu0YzBZXH9RDPKPASbA50JIV6m8JVS9JPAkqiEKCXh+NWoE3HabUT0
	3AkTC/MDbvl+pXSB9u8UjyAZqyMv5QPpnuQsXxiWzjJmyq32VL8HJ12/wKsRSqodhLSwb2HqlnI
	S3aGTIjYH11cBcC1orTGkzK6DLSAEyBXSzx9n8GsjRMn5udH5u1eM6fnSOXseuPqVo3DwRtXhZ5
	+T
X-Gm-Gg: AZuq6aLI+ceemz+XzNeG3Rb69ZWeh7RwFTojj0LN+gJTLfsBwo81rRJkunKTFK0/Qwd
	RXXOkSJL1240QX8LTUm/6/VgeYPozH174aWRv1RqOMGn4vmKWMbwOQvEX7NiEt9o245S6P9m+48
	QnfTvdXqT7no6uj9u/6jnAvT1VlcVcEq11YS8KkSeSeSrktZ727aXnsz1cDQnTNMD98IAYDWHqz
	FMRMiC/l3+d2LMwQe0RxHa3omRSj1oQt/rW+K7AzMRkL/YnkZ6RX2jQ7/0dnhPvjNAagQHsCiYM
	HOQX3rI/3rW7jdq9Wjfw0C1+i75Yw44ekHoQMLOg+bY44hJ3piVkqLy2OGk40EV9N+SzEpJXiwD
	93iP2X3DG05ZlMeGf4T2vBuzPhJurIN69yE7mjaUl
X-Received: by 2002:a17:90b:28ce:b0:353:3977:a082 with SMTP id 98e67ed59e1d1-353fecc6684mr1373180a91.1.1769515919143;
        Tue, 27 Jan 2026 04:11:59 -0800 (PST)
X-Received: by 2002:a17:90b:28ce:b0:353:3977:a082 with SMTP id 98e67ed59e1d1-353fecc6684mr1373156a91.1.1769515918627;
        Tue, 27 Jan 2026 04:11:58 -0800 (PST)
Received: from hu-guptap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6159ad6sm2489474a91.14.2026.01.27.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:11:58 -0800 (PST)
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:41:45 +0530
Subject: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAICreGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3eLc3FLdooJcXYukFDPzlCRL45TkRCWg8oKi1LTMCrBR0bG1tQB
 3HEI/WgAAAA==
X-Change-ID: 20251208-smmu-rpm-8bd67db93dca
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OSBTYWx0ZWRfX1AAmGrnnzRvq
 L/2xEa4U50FGnlno7M2gZd4Rnkv7lQLThx0DqLbK2gf4ChQt9ChW5d6PyXHT5b+aIFyStsIxSdd
 TCVttFycdVQBfi/pkqPubChYjdsHQ+H1rslI6LRAzhfmGxxyfIC8CkVa7PgqoGj6Cdskp0qLClI
 nsNRqwK0wndWiNyZNEuafBREuqU6FVUiY8MexJmYDPL5wVlgrPXJhR/hv9W8BXtg1C6qEuTKK+M
 pR9waIL9td0923JBWx4p2aLcjComjWNXDbaGZeJk6sHa3kO/jB5pysDWzsCb/XOEBZ+Kfzm++ql
 05miT88EZnHAGv1OEtINqsZC4/Nv7FOrjnq0A4WhbG56PxsI9Gau+lG3CxEGPNlNPHyPc/m4X07
 fcJ68w7+FMh/AB98xc1Ovxj7C23MoXYRP8NaN5l6mPrJIEpz/plJlhuBQWvK6IW/dPkodTyYYEp
 Oh+TfYNgzlmy7P1dWvw==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978ab90 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SalRf7IlQZ7Iv0L3QwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: xPnx9zRtMMznnNzP24DvS_VoR1sHr9Kv
X-Proofpoint-GUID: xPnx9zRtMMznnNzP24DvS_VoR1sHr9Kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prakash.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C8A894148
X-Rspamd-Action: no action

Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
enabled pm_runtime for the arm-smmu device. On systems where the SMMU
sits in a power domain, all register accesses must be done while the
device is runtime-resumed to avoid unclocked register reads and
potential NoC errors.

So far, this has not been an issue for most SMMU clients because
stall-on-fault is enabled by default. While a translation fault is
being handled, the SMMU stalls further translations for that context
bank, so the fault handler would not race with a powered-down
SMMU.

Adreno SMMU now disables stall-on-fault in the presence of fault
storms to avoid saturating SMMU resources and hanging the GMU. With
stall-on-fault disabled, the SMMU can generate faults while its power
domain may no longer be enabled, which makes unclocked accesses to
fault-status registers in the SMMU fault handlers possible.

Guard the context and global fault handlers with arm_smmu_rpm_get() /
arm_smmu_rpm_put() so that all SMMU fault register accesses are done
with the SMMU powered.

Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53 ++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..2d03df72612d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
 	const struct of_device_id *client_match;
+	const struct arm_smmu_impl *impl = qsmmu->data->impl;
 	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;
 
@@ -350,10 +351,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
+	if (impl->context_fault_needs_threaded_irq)
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
 	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
 	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 5e690cf85ec9..183f12e45b02 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
+	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {
+		ret = arm_smmu_rpm_get(smmu);
+		if (ret < 0)
+			return IRQ_NONE;
+	}
+
+	if (smmu->impl && smmu->impl->context_fault) {
+		ret = smmu->impl->context_fault(irq, dev);
+		goto out_power_off;
+	}
+
 	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
-		return IRQ_NONE;
+	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
+		ret = IRQ_NONE;
+		goto out_power_off;
+	}
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
@@ -480,7 +493,14 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
 	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+
+	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
+		arm_smmu_rpm_put(smmu);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
@@ -489,14 +509,21 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu = dev;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return IRQ_NONE;
 
 	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
 	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
 	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
 	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
 
-	if (!gfsr)
-		return IRQ_NONE;
+	if (!gfsr) {
+		ret = IRQ_NONE;
+		goto out_power_off;
+	}
 
 	if (__ratelimit(&rs)) {
 		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
@@ -513,7 +540,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	}
 
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+	arm_smmu_rpm_put(smmu);
+	return ret;
 }
 
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
@@ -683,7 +714,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	enum io_pgtable_fmt fmt;
 	struct iommu_domain *domain = &smmu_domain->domain;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	irqreturn_t (*context_fault)(int irq, void *dev);
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -850,19 +880,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	 */
 	irq = smmu->irqs[cfg->irptndx];
 
-	if (smmu->impl && smmu->impl->context_fault)
-		context_fault = smmu->impl->context_fault;
-	else
-		context_fault = arm_smmu_context_fault;
-
 	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
 		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
-						context_fault,
+						arm_smmu_context_fault,
 						IRQF_ONESHOT | IRQF_SHARED,
 						"arm-smmu-context-fault",
 						smmu_domain);
 	else
-		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
+		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
 				       "arm-smmu-context-fault", smmu_domain);
 
 	if (ret < 0) {

---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251208-smmu-rpm-8bd67db93dca

Best regards,
--  
Prakash Gupta <prakash.gupta@oss.qualcomm.com>


