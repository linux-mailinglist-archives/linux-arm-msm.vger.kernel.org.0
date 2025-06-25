Return-Path: <linux-arm-msm+bounces-62544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B85A4AE8DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64301C2408B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012262F9494;
	Wed, 25 Jun 2025 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFGV5HrF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3912F5497
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877953; cv=none; b=U+B3KoJhclp4QVRUdCFNIxwN9uoPWixbNZNfwLhXmwhvB5kSSFUkw6oWCj37GOnKNu/u9Z+EXvKwiQ+6ttBmZSiLKYZfMtaTOSbpfUwiP4ggH94c/RisVT+N5MkhLRvtklu0EFU2jG3wqxKKA/ulvV8RFrJ6vDlPYjUXvHXBW54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877953; c=relaxed/simple;
	bh=miM77xEXTrB6mt10AQICgq6MDZD3BX5ufhFU8RcosDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBRqrsauNXhpaE/i3z4NCkDfaCdDE84jHkD4+emDjsC6FKPmZVNOxnqhTqID+VnscK5iF2iRrfhuQTubNisyvhiPuj1CxjFsR8plH7JfJ1iMiPD5KWWwtWn6pNLaUaRdWzmXcsVAFSQDjqNLl4eBTykWzGW4mg/eBl3S/jXLDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFGV5HrF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAL9K7001286
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
	lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=pFGV5HrFiVHgGbMsigNsiN34XeL
	V85NrU2arxrLMhWzSknYErzNud7rFy1AoxahQ50iQ5MV+R3gcPYOGziCAxFYskJW
	4qwK1MuxSf6SEQQ3ait4roeXZnj9GpvXSCMm8CHWBTNN+CIOxEtmyOG/FG8bG5rY
	y120oAcUqDBgx4ETAdMbMeA900xZlCIhad1KInMlEKwtglPCG046esCod4mk2epg
	RfmUXOhQPu4wjcjGJEynqnzN4/wReZvmYTnjG3jOZg3ugKVKfaByMk8PP1FlBRFP
	bdUcjX5uSbiMn1JVjhS4vBzuUi2QTWzZI5Ts9JqyU8M63AwZyRxu3UM9Dhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdasth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31ff60558eso1015527a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877951; x=1751482751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
        b=ZMQwAckEsrfg480Rp3NGN/NsdfOSJ7Qy3B6q0NQFbhtOjZhwgs/eMzsvdugxIssy0i
         eILPyQWRxmHcdGdv/YGFDJ9AOWHR48usp+ACmEfPhig8EcFxLG/ocaBaUOkuK5VAq4AJ
         q9xUCCSK1MGXzZXtcxPvk28k1Ry73AoaZepP5rdsUjU07YWz4yaFZLz0hFbGOrceH8JE
         TOg4HDQsoaAyGUAqceKqeXjZZJP6lEJVdUo2AvFMogXe53h7nsZw53eb5dB+5+rbslzf
         xhxNHqCbfbPUr5OaK8KForZC3h7K+lne2YEWAMaVyI3LrvG/3+X6RkDw4pTrLdLbCe84
         yBjw==
X-Gm-Message-State: AOJu0YyZL1HLsND6EmtCnQAXhMNHa2701PTeKn60jjB/x8TXgGcbhsCb
	zbGf6tHS6EkQHG5oAvfZDaBXIdve6ravY+YijDZc6rEH/sETnQdvJCALXpnTYR5IZHW+0cmFKS5
	yONH/D2+Cv7Kg/6H+kp4RoTUyVUE78zhu9zStvwKYA3xHP4aBvoPOcAfNMEfsX5qlTCOX
X-Gm-Gg: ASbGnctLe1C8ofmCRjectWF1l9PCJMzPdCu7RFDV7GQtErLd6HG2Vgc+8n5SU5wm6Vk
	h0zwRm+qZtjAO5b255nhUz0aETeGIXz50yApk84d29IdW632NTc5XRiF9mU2wxWAwMn70icKcgg
	jnSirlB1TkOwOPY6cz9/mIEm+wxJQBkUnD6Xr3yAY6neDOuQR9DBvoYUEPSriWl+JR/mGuesZVK
	rjuA1Du7z6t7WLNKEOo3iy/DGfMlnhENIuU/DePTFHBv1ttgF5uTeTuO/QNZs2EEihSrAWGKM6z
	J9363DX2BQZuWcG+aKLSfjcY59EPsVq4
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-316e2336f18mr798545a91.10.1750877950571;
        Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbp4SKrEY9d8JIbSkMB6p5URNqdjm5cGwlxWoVGnHIftvqm3YVrqyP0ZrvpIQrI+VVUGZoBA==
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-316e2336f18mr798499a91.10.1750877950074;
        Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6ccsm2331259a91.17.2025.06.25.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Wed, 25 Jun 2025 11:47:25 -0700
Message-ID: <20250625184918.124608-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46ff cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXwvPgR7e0gkzi
 BN/nAssmV0D8TL7QSWvZTxTGx3p9Vi7Umfk7b2gKVeuLM0bhJXzqKZCEv7kbUWpnsv+uPPhEguC
 yjHrWWGXwtWrMguyZccFrmgKv19V0fpNCZmDBOls5s7TOfQ2JZnxKyLB0uMbZ8xK37vZisKQ/o6
 Oi2bMUAxQkmr+R7/2DnopfmVv/KGH2mnrBvlXsSSRot/8gyKOHARZZpfrHqr7jTZl1pnwdZdcGw
 GDOcUBD5X9IWpcTUTMpYyazbPTzrfYHL1HJ/jDAklHr2eSgCI5jR7zHUaEeTHHGVA+IC6Fi0WXN
 yakjWD/lbFhz/3DEE2CZO6FQHAvBplAyAVpiBOH8xvAVuKB6QP61V2uDovAtTbBV8q3+6tBc1kw
 jqS2FjSOmabU+MRzg7PNs1GpfoMFN2tkepOPaysCT+zA+g8Ki/YKt9a8vkCx11vmA55FdoLr
X-Proofpoint-GUID: 1RjhkwA236nQcaquToT5h_hc3V7VpAMQ
X-Proofpoint-ORIG-GUID: 1RjhkwA236nQcaquToT5h_hc3V7VpAMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=978 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f0e37733c65d..83fba02ca1df 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..1c068592f9e9 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0


