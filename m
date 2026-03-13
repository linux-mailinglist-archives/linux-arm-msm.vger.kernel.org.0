Return-Path: <linux-arm-msm+bounces-97406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLoXEszls2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:24:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D073B28161F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0ED33004D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8CC306B3D;
	Fri, 13 Mar 2026 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEgHuo5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N941CIUd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260C2701CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397448; cv=none; b=kS9LqSIZdCD+l2vsen1xE8lYs4ILqs8PbyWqmS3Lc7zY9GEyCtt7jWe+PdubjfzuSY9bLg+wBa0CbY4dABgtJuXen+7EuL99u62vkNE10C6KrtkZgTg63pyvOm0SOPxk5gsEb+zRSQQDuhvPtM+zRMK/id5EbBb1EjM7eO51yH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397448; c=relaxed/simple;
	bh=QhBtjbDloLdUGe4ameEFnwT0gkXTioWGK4diNOa+ibA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mihod9TJV2eH9QdJpqBGuh8Mm40FzT87UekNW8xr9hvyu8XU84AmCrKTzs7HM9kHrKkMakUcJRGjBFjSRX3Ie0nKcKluePmRPT2mBaHCB9JnA8erDBuuU9f8lVEus8gUqPaU9nZ8HY1mT6Im/Wtg9mGEFGEQqNXEq2bMCj8+Z6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEgHuo5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N941CIUd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tc0F4140725
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xdroUf42OnaRsZaNXVIwjI
	uoiVOsASCk4ZWCqNs2gp8=; b=nEgHuo5sHIlSGtourKRKx/NaKjQE0MTjlXa1ae
	JlsOEV2ZJ1aS72PzqWf504d/PBjC8yqUYg2RJ2yE6K7/6EeGztR6zH6ZX3vSUbe3
	BVUt9ES9/gT8I4J6R95nnMcERZDKH5/qo+hWjFT7g4Hk3Edvc6Nw0wl0PT4IOrY3
	idi26aY1Y0w4rq7ybs7miaupTsAzn/HdfT2KmK2ZoObRgv9ntU3raX9cqTeTv49F
	NC47V4wEs7TDZ5UoAYiwF4MWuFkGH0P0euZxOSunNsekQH29ealV5Sorsr2rc18q
	VlF6p+litw26pjqsy5rBa6choxenef97ZC6xoGxK+Fu8PZjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn296ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:24:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a188e5aa2so1232948a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397446; x=1774002246; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xdroUf42OnaRsZaNXVIwjIuoiVOsASCk4ZWCqNs2gp8=;
        b=N941CIUddwCpDHmYsOxBDq2uJukpwGzRUxFiXgE0uePcXkzXZqK9spgjC7p2R3qsFV
         Q+yMQlvB+TmhWuM60a2oYrZzCiO7CIrT3sCaRWZY1U1Ng2QH+/B6ClhkJ9Ug5asgllyY
         PkWRRT9a9Su3QjGPttzP6ZVogFEspPhm2oQFPxGWK8X8nfW2PybnwqlOojEsRLJZIVku
         +Q9Rn+dKiPwf+/Ysp6S4SGjsxiAiAGaxa/NKkj2mYm0v08snwvmb7yH/IC1TmYja3ZtX
         rPxMlZb/AQjxlSEm4zouVPlkZA0YrVGF6UkHHVR5/k5rzaBXKctyrZ4aTRwqA9UobgSj
         kY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397446; x=1774002246;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdroUf42OnaRsZaNXVIwjIuoiVOsASCk4ZWCqNs2gp8=;
        b=MWuKzyNMwnSoMHZYOVH5IK1XKcUcfPwQqqU8EYWkH9zafYUvPxH6Tv++K1BcH+w4nJ
         iU5qjIVClyhskerLYRCSI63Z2jKL/QFtqC1aivkIi/ix2U7sN4Oxt34PCD4zTu7/wvZI
         AqjHXzHBvGL0UR7H1U4mO2vCNwtvkg7qwg4Q+xt2XjwZfBIQqUBZTI3//IzpYIfXldmA
         j6gpdNls4GNWc6gm0PmJUGZk/AHcYYhN5r0ZWb0Tso/rLitXSM2mlsckDUKO3uGfRDQ5
         xlRM7t7Ujcb0zZevKVjiYBnSznMoNU8Wl3g5uhCaeHiO9/CVi8tW4o/hZzFZpjcI3XB7
         342w==
X-Gm-Message-State: AOJu0Yw327hKUhlw9W8VTbm4GtGeJ76tf1sTVthAJrtn3SaT2/FtAMYd
	YaFVRsnQCnoAoHUiYm6E0M4b12cMYS3ltHQ4WneOZwJ+FZji6GCFK3mPdH7zdpqcv7PVcIbbc6r
	WY0ygQRyg7KpPpjU2H7tNLoMoS63Wz3ViTWpS9WwTkH+sTobnsUXrFLRE+hNkmoNPCcsA
X-Gm-Gg: ATEYQzxt2OUpamTbzmkXEtPfbtbgBLMBAzWN4N3nrdjtf9ZnV/wPg7xhk7y4i4i6TSe
	h3TaUPVdN50VhdeLlw6F8NyP07fhB6pO4BLpC4GqwyAagZsYgN/38xR/gL2GKqhQoLEWkQO8hoD
	etdP+4Wfl8eNzfEH9rSn+PVx6iuqqNcFFyFLNLxf+iILKj6aKOUVO/Fc7iQSarWEnZjO+BXraUd
	zcUkcKnYXjMX4TFg1tyqhRHRnRRj41tglyjGs1w6N6+DbnhlAxGInMw8/Y+tYkIQMH25UhrblGV
	dBp1eUR2owt/AwGxJpcI8C3BFAcQ8CUJSjiO8x6EQYQBed9TgDA9y1zinCZAZFv4QIWRR0XBaQs
	tlD4n19NJlM42UOnmsmbwAqTtrlv1Mo4T1HgFOejZp4CkXdwfRV74
X-Received: by 2002:a17:90b:4a46:b0:359:f0e1:f8c0 with SMTP id 98e67ed59e1d1-35a21e1ca44mr2497547a91.6.1773397445741;
        Fri, 13 Mar 2026 03:24:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:359:f0e1:f8c0 with SMTP id 98e67ed59e1d1-35a21e1ca44mr2497521a91.6.1773397445204;
        Fri, 13 Mar 2026 03:24:05 -0700 (PDT)
Received: from hu-guptap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffe078sm8437602a91.13.2026.03.13.03.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:24:04 -0700 (PDT)
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:53:53 +0530
Subject: [PATCH v2] iommu/arm-smmu: Use pm_runtime in fault handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALnls2kC/0XMQQ6DIBCF4auYWRcDY1HbVe/RuFDASlLEMpW0M
 dy96KabSf7Jy7cBmWANwbXYIJhoyfo5B54KUFM/PwyzOjcgRymQt4ycW1lYHGsHXTd6uFRa9ZD
 nSzCj/RzUvcs9WXr78D3kKPbvjtRcYPNHomCCoRlxPKtWVlzePFH5Wvun8s6V+UCXUvoBXtg2u
 6cAAAA=
X-Change-ID: 20251208-smmu-rpm-8bd67db93dca
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: gL-C_rBGR_xnmaTJhvMNlefrfeKyb5w5
X-Proofpoint-GUID: gL-C_rBGR_xnmaTJhvMNlefrfeKyb5w5
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3e5c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=FOn0AWhus2eDxXApaSoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MSBTYWx0ZWRfXx09WHMpkI/bq
 A7cRHxO2XGPGu2CWBJBvtY6+5BSvXYIc6qemiZyEc6sHbglsA+ZfVApnrIPHS8w0DIf8oBD0C6L
 4GrE/ppnsrzag3/Z2E3OJInm5BvihHQ0ybPCpkHETyy/eI94ydtrVd1W2eT/tNNfJfINAfx1DWe
 4Cilgchnfkrk3GEyPT/nY0UXLCnvEZDJjJ5ptu+1bbe71ppZNBprWVhJLCoGRyaoUcKMmLb/vuU
 Pjc7S6Ny4csEk9feQfI2kBKQeKYi1oM7i8QtOaNYJ5DjqijvMk3F3RNJlIGQqhRhJboJ3xJsIR6
 VEfDU3ouRv3MpuRtgjedZC/tcQ1YEfuhDD4Ap8nucQl/DNhAfp/V3wtidI4f+eCxBGmk9hXtLlU
 9inbnJW4K7iJAzMm18CTngBmci/DLSoCBdCPEfQck2m+tNHaA2rJ473ClWDogXN60kn/jPm4xNk
 QzV/Sbl6lZmJNiiMlmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97406-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prakash.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D073B28161F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
enabled pm_runtime for the arm-smmu device. On systems where the SMMU
sits in a power domain, all register accesses must be done while the
device is runtime active to avoid unclocked register reads and
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

Guard the context and global fault handlers with pm_runtime_get_if_active()
and pm_runtime_put_autosuspend() so that all SMMU fault register accesses
are done with the SMMU powered. In case pm_runtime is not active we can
safely ignore the fault as for pm runtime resume the smmu device is
reset and fault registers are cleared.

Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
Changes in v2:
- Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
  pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
- Added support for smmu->impl->global_fault callback in global fault handler
- Remove threaded irq context fault restriction to allow modifying stall
  mode for adreno smmu
- Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 60 +++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 5e690cf85ec9..f4c46491a03d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -462,10 +462,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
+	if (!pm_runtime_get_if_active(smmu->dev))
+		return IRQ_NONE;
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
@@ -480,7 +490,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
 	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+	pm_runtime_put_autosuspend(smmu->dev);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
@@ -489,14 +504,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu = dev;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
+	int ret;
+
+	if (!pm_runtime_get_if_active(smmu->dev))
+		return IRQ_NONE;
+
+	if (smmu->impl && smmu->impl->global_fault) {
+		ret = smmu->impl->global_fault(irq, dev);
+		goto out_power_off;
+	}
 
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
@@ -513,7 +539,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	}
 
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+	pm_runtime_put_autosuspend(smmu->dev);
+	return ret;
 }
 
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
@@ -683,7 +713,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	enum io_pgtable_fmt fmt;
 	struct iommu_domain *domain = &smmu_domain->domain;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	irqreturn_t (*context_fault)(int irq, void *dev);
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -850,19 +879,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
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
@@ -2125,7 +2149,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int num_irqs, i, err;
 	u32 global_irqs, pmu_irqs;
-	irqreturn_t (*global_fault)(int irq, void *dev);
 
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2205,18 +2228,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		smmu->num_context_irqs = smmu->num_context_banks;
 	}
 
-	if (smmu->impl && smmu->impl->global_fault)
-		global_fault = smmu->impl->global_fault;
-	else
-		global_fault = arm_smmu_global_fault;
-
 	for (i = 0; i < global_irqs; i++) {
 		int irq = platform_get_irq(pdev, i);
 
 		if (irq < 0)
 			return irq;
 
-		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
+		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
 				       "arm-smmu global fault", smmu);
 		if (err)
 			return dev_err_probe(dev, err,

---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251208-smmu-rpm-8bd67db93dca

Best regards,
--  
Prakash Gupta <prakash.gupta@oss.qualcomm.com>


