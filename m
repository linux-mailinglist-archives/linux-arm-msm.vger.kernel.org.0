Return-Path: <linux-arm-msm+bounces-52792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EBA74EBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 17:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B75F7A6BFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380181D88D7;
	Fri, 28 Mar 2025 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO6TsQab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715314885D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743181163; cv=none; b=HQeocUIFOVvwaXDGxQ1YOaiGELnH45qygmxvamTcq7JLOK/ggf4b04AHpwXMm/cD4DfoiH3C61o4esHdVKWCknRRp77BVRsgnk+VZwUz+YMObk3/0a5SfG8ll5otTc96JcpHfGhFbKgkwEU+O9l3KQ3T2mbel4ozQfBNpo69ouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743181163; c=relaxed/simple;
	bh=BbOCBhZBPct+W5aZL4ZQZ0x5it0G+9oYhaKc864UHUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pSmhMS5GVzhDndHEsLr1q+FExQvwNAipUH3sJ4Nq1nsxD+LjVCKmk0gMgsXjHK+fnPvdfG/52fZ2V01Bg8bL44a/gwxpd4yBGfY19vozf24eyY3HKgymxVO5NwnQGdTtj2X8ch0Rkkf4HrI/5Xh0k8V865lxzeCaa3X2iZzYfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO6TsQab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCpfAQ011628
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=V2f1HMKtzZJ4ntrfM75NdwD86xrfsxLuVDs
	TC3ZV4H4=; b=KO6TsQabGzwcefV258Uko8UkKCIgv5/LDDtgqyQkDlRG+XHzbW7
	Yym8k/ddCEk9FX7uFGxDok/9aLcqQZtfSPzBrCaLLaJM7ifcSNaBJ+/ePDWotQE5
	XyDlC9act5nJtAYlX4r+42mjs5T6MUVuxmGKMTM6Tl+SVjoklrZT1MO8XIgZeCgD
	F0gYH2j/IY2gRZfyGx2cOzWYzeTrJI/ahZ43f5vlFuIoBq5YCVK1MOezbEFBNxYP
	LfA6L4lbAgCXgc7hSbRM+GxWrkvUQv0S5+0W4yUIuCehsm5NZPI2MrQV67W+L+sZ
	DLqKMvnhOTTgzOaZ7u3kldnxuQvqWlxjdrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj9ct4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 16:59:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225107fbdc7so43826225ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 09:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181158; x=1743785958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2f1HMKtzZJ4ntrfM75NdwD86xrfsxLuVDsTC3ZV4H4=;
        b=OrKGwu4jwy7J7BfHYM4XTjgFXUkViac5Vb0+o+yAgvrcBDn5BAamsvrIxj/jUaAhy0
         qSMYiA0yq5lgeFG5q6AvJwzoWRHTHQlLH4fcZg2lCnbCkFWV9qu05sPHZmuYoBMqZgwb
         ud/Gda8vOWoFRbwDvxrF83w8Psgz8HSJJDOW/92J7R6gi7ZsTtq7RJ2AU+2BGovC30Jm
         pNpApAsO1+7GEYUSA6aJdu2AQyFy4gwirrbK2EaEnQhbqigUiGS3HmkpkK2yMto7MVl7
         GDYy4Cs4zAdSJxwZeLoAFMmIx6MnMhsWl2j5gfZwPzwlKGK/BbiF5qU4I1vbDg8UKIhn
         Xlfw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4efyBzl8z/ui8+RE6weXYrDWicUgGUb71gtQlUGgYhr4dRsLqwbFVTbISgjTVR9xsP/ucKYvtX0GSpQH@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnkZhICVAMX/V4X4vObZD/093cziLVDpE8ZqTS/uAFenxkZkR
	MeG0mjQh+Jy2H3LOcf5tlTK9sG5pP+z4R7mu3UGovDIw304gTofdJsfG4ZleXzYVYHhXPv58Cy9
	jSshAv93avtizJo6AWOBAQgV5/HJWO2XBSCEbe1Ij4sG84gvx9sVKIADWfUoZsKKb
X-Gm-Gg: ASbGncv9qO9QBEjUoTOU/WCXnNSezbb2i+smxL8twFDVU4N3g45Q54SK8NihCB42pAy
	4fksrxOx8/L04LIn+rp2QCZ9rPD+E9djlTPI189Fk0WrLQSyG3jEGGvqd59bMuQSPuzKqJj2LIw
	2IKeuKyuW196a0rPLSX+uEGjUeRzSyA2s8vAd66d5E9+9955Zpr6dwsuGRLKtlRbkiYletL0KR5
	XoXJ5dCWEPq8JTJLioBFg2yJbiw4CdaQLhPR7x1KuIHcW2+/QVaAZjCE6YwlnS2SPmgiyu15kkh
	fYEiRL2+cYepWQyjnstWOwYVDyiPk5z5CKiNqAQK7Kd9wmVi/O47KyT3FGgw0Bp7
X-Received: by 2002:a05:6a00:1784:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-739610c1d7bmr12351313b3a.23.1743181157788;
        Fri, 28 Mar 2025 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZe8Vwj62XoOh3V08Qkwvb7vfMZSYpWyUQGn+SzThfFl8XcngC4QUaBMU5yd8iMjjGnnM7wQ==
X-Received: by 2002:a05:6a00:1784:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-739610c1d7bmr12351276b3a.23.1743181157040;
        Fri, 28 Mar 2025 09:59:17 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e46245sm2018430b3a.73.2025.03.28.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 09:59:16 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Date: Fri, 28 Mar 2025 10:59:13 -0600
Message-Id: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3pwPJkJ_-kBGsoFYF4WvqJYXtzBnpTGk
X-Proofpoint-ORIG-GUID: 3pwPJkJ_-kBGsoFYF4WvqJYXtzBnpTGk
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e6d567 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9j8TaD3Hjcb7PW9T8SIA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280117

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

MHI control configurations such as channel context, event context, command
context and rings, are currently allocated individually. During MHI
initialization MHI bus driver needs to configure the address space in
which this control configuration resides. Since different component of the
config is being allocated separately, only logical solution is to give the
entire RAM address space, as they could be anywhere.

As per MHI specification the MHI control configuration address space should
not be more them 4GB.

Since the current implementation is in violation of MHI specification.
Allocate a single giant DMA buffer for MHI control configurations and
limit the configuration address space to that buffer.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     | 259 +++++++++++++++++---------------
 drivers/bus/mhi/host/internal.h |   1 -
 include/linux/mhi.h             |   7 +
 3 files changed, 143 insertions(+), 124 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff..03afbfb8a96f 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -159,21 +159,21 @@ static struct attribute *mhi_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(mhi_dev);
 
-/* MHI protocol requires the transfer ring to be aligned with ring length */
-static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
-				  struct mhi_ring *ring,
-				  u64 len)
+static void mhi_init_ring_base(struct mhi_ring *ring)
 {
-	ring->alloc_size = len + (len - 1);
-	ring->pre_aligned = dma_alloc_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
-					       &ring->dma_handle, GFP_KERNEL);
-	if (!ring->pre_aligned)
-		return -ENOMEM;
-
-	ring->iommu_base = (ring->dma_handle + (len - 1)) & ~(len - 1);
+	ring->iommu_base = (ring->dma_handle + (ring->len - 1)) & ~(ring->len - 1);
 	ring->base = ring->pre_aligned + (ring->iommu_base - ring->dma_handle);
+}
 
-	return 0;
+/* MHI protocol requires the transfer ring to be aligned with ring length */
+static void mhi_init_ring(struct mhi_controller *mhi_cntrl, struct mhi_ring *ring,
+			  size_t el_size, size_t offset)
+{
+	ring->el_size = el_size;
+	ring->len = ring->el_size * ring->elements;
+	ring->pre_aligned = mhi_cntrl->ctrl_config_base + offset;
+	ring->dma_handle = mhi_cntrl->ctrl_config_dma + offset;
+	mhi_init_ring_base(ring);
 }
 
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
@@ -265,40 +265,134 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
 		ring = &mhi_cmd->ring;
-		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	dma_free_coherent(mhi_cntrl->cntrl_dev,
-			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
-			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
-
 	mhi_event = mhi_cntrl->mhi_event;
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
 		if (mhi_event->offload_ev)
 			continue;
 
 		ring = &mhi_event->ring;
-		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
-			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
-			  mhi_ctxt->er_ctxt_addr);
-
-	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
-			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
-			  mhi_ctxt->chan_ctxt_addr);
-
+	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_cntrl->ctrl_config_size,
+			  mhi_cntrl->ctrl_config_base, mhi_cntrl->ctrl_config_dma);
 	kfree(mhi_ctxt);
 	mhi_cntrl->mhi_ctxt = NULL;
 }
 
+/*
+ * Control Configuration Address Space Layout
+ *              +------------------------------------------+
+ *              |              Channel Context             |
+ *              +------------------------------------------+
+ *              |           Array of Channel Rings         |
+ *              +------------------------------------------+
+ *              |              Event Context               |
+ *              +------------------------------------------+
+ *              |           Array of Event Rings           |
+ *              +------------------------------------------+
+ *              |              Command Context             |
+ *              +------------------------------------------+
+ *              |           Array of Command Rings         |
+ *              +------------------------------------------+
+ */
+static int mhi_alloc_control_space(struct mhi_controller *mhi_cntrl, struct mhi_ctxt *mhi_ctxt)
+{
+	size_t chan_ctxt_offset, cmd_ctxt_offset, er_ctxt_offset;
+	size_t chan_ctxt_size, cmd_ctxt_size, er_ctxt_size;
+	size_t el_size = sizeof(struct mhi_ring_element);
+	u32 ev_rings = mhi_cntrl->total_ev_rings;
+	struct mhi_event *mhi_event;
+	size_t alloc_size, offset = 0;
+	struct mhi_chan *mhi_chan;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_ring *ring;
+	int i;
+
+	chan_ctxt_offset = offset;
+	chan_ctxt_size = sizeof(*mhi_ctxt->chan_ctxt) * mhi_cntrl->max_chan;
+	chan_ctxt_size = PAGE_ALIGN(chan_ctxt_size);
+	offset += chan_ctxt_size;
+	for (i = 0, mhi_chan = mhi_cntrl->mhi_chan; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		ring = &mhi_chan->tre_ring;
+		if (!ring->elements)
+			continue;
+		alloc_size = ring->elements * el_size;
+		alloc_size = PAGE_ALIGN(alloc_size << 1);
+		/* Temporarily save offset here */
+		ring->pre_aligned = (void *)offset;
+		offset += alloc_size;
+	}
+
+	er_ctxt_offset = offset;
+	er_ctxt_size = sizeof(*mhi_ctxt->er_ctxt) * ev_rings;
+	er_ctxt_size = PAGE_ALIGN(er_ctxt_size);
+	offset += er_ctxt_size;
+	for (i = 0, mhi_event = mhi_cntrl->mhi_event; i < ev_rings; i++, mhi_event++) {
+		ring = &mhi_event->ring;
+		alloc_size = ring->elements * el_size;
+		alloc_size = PAGE_ALIGN(alloc_size << 1);
+		/* Temporarily save offset here */
+		ring->pre_aligned = (void *)offset;
+		offset += alloc_size;
+	}
+
+	cmd_ctxt_offset = offset;
+	cmd_ctxt_size = sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS;
+	cmd_ctxt_size = PAGE_ALIGN(cmd_ctxt_size);
+	offset += cmd_ctxt_size;
+	for (i = 0, mhi_cmd = mhi_cntrl->mhi_cmd; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		alloc_size = CMD_EL_PER_RING * el_size;
+		alloc_size = PAGE_ALIGN(alloc_size << 1);
+		/* Temporarily save offset here */
+		ring->pre_aligned = (void *)offset;
+		offset += alloc_size;
+	}
+
+	mhi_cntrl->ctrl_config_size = offset;
+	mhi_cntrl->ctrl_config_base = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
+							 mhi_cntrl->ctrl_config_size,
+							 &mhi_cntrl->ctrl_config_dma,
+							 GFP_KERNEL);
+	if (!mhi_cntrl->ctrl_config_base)
+		return -ENOMEM;
+
+	/* Setup channel ctxt */
+	mhi_ctxt->chan_ctxt = mhi_cntrl->ctrl_config_base + chan_ctxt_offset;
+	mhi_ctxt->chan_ctxt_addr = mhi_cntrl->ctrl_config_dma + chan_ctxt_offset;
+	for (i = 0, mhi_chan = mhi_cntrl->mhi_chan; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		ring = &mhi_chan->tre_ring;
+		if (!ring->elements)
+			continue;
+		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
+	}
+
+	/* Setup event context */
+	mhi_ctxt->er_ctxt = mhi_cntrl->ctrl_config_base + er_ctxt_offset;
+	mhi_ctxt->er_ctxt_addr = mhi_cntrl->ctrl_config_dma + er_ctxt_offset;
+	for (i = 0, mhi_event = mhi_cntrl->mhi_event; i < ev_rings; i++, mhi_event++) {
+		ring = &mhi_event->ring;
+		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
+	}
+
+	/* Setup cmd context */
+	mhi_ctxt->cmd_ctxt = mhi_cntrl->ctrl_config_base + cmd_ctxt_offset;
+	mhi_ctxt->cmd_ctxt_addr = mhi_cntrl->ctrl_config_dma + cmd_ctxt_offset;
+	for (i = 0, mhi_cmd = mhi_cntrl->mhi_cmd; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		ring->elements = CMD_EL_PER_RING;
+		mhi_init_ring(mhi_cntrl, ring, el_size, (size_t)ring->pre_aligned);
+	}
+
+	return 0;
+}
+
 int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_ctxt *mhi_ctxt;
@@ -309,7 +403,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
 	u32 tmp;
-	int ret = -ENOMEM, i;
+	int ret, i;
 
 	atomic_set(&mhi_cntrl->dev_wake, 0);
 	atomic_set(&mhi_cntrl->pending_pkts, 0);
@@ -318,14 +412,12 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	if (!mhi_ctxt)
 		return -ENOMEM;
 
-	/* Setup channel ctxt */
-	mhi_ctxt->chan_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
-						 sizeof(*mhi_ctxt->chan_ctxt) *
-						 mhi_cntrl->max_chan,
-						 &mhi_ctxt->chan_ctxt_addr,
-						 GFP_KERNEL);
-	if (!mhi_ctxt->chan_ctxt)
-		goto error_alloc_chan_ctxt;
+	/* Allocate control configuration */
+	ret = mhi_alloc_control_space(mhi_cntrl, mhi_ctxt);
+	if (ret) {
+		kfree(mhi_ctxt);
+		return ret;
+	}
 
 	mhi_chan = mhi_cntrl->mhi_chan;
 	chan_ctxt = mhi_ctxt->chan_ctxt;
@@ -350,15 +442,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		mhi_chan->tre_ring.db_addr = (void __iomem *)&chan_ctxt->wp;
 	}
 
-	/* Setup event context */
-	mhi_ctxt->er_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
-					       sizeof(*mhi_ctxt->er_ctxt) *
-					       mhi_cntrl->total_ev_rings,
-					       &mhi_ctxt->er_ctxt_addr,
-					       GFP_KERNEL);
-	if (!mhi_ctxt->er_ctxt)
-		goto error_alloc_er_ctxt;
-
 	er_ctxt = mhi_ctxt->er_ctxt;
 	mhi_event = mhi_cntrl->mhi_event;
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
@@ -379,12 +462,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		er_ctxt->msivec = cpu_to_le32(mhi_event->irq);
 		mhi_event->db_cfg.db_mode = true;
 
-		ring->el_size = sizeof(struct mhi_ring_element);
-		ring->len = ring->el_size * ring->elements;
-		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
-		if (ret)
-			goto error_alloc_er;
-
 		/*
 		 * If the read pointer equals to the write pointer, then the
 		 * ring is empty
@@ -396,28 +473,10 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		ring->ctxt_wp = &er_ctxt->wp;
 	}
 
-	/* Setup cmd context */
-	ret = -ENOMEM;
-	mhi_ctxt->cmd_ctxt = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
-						sizeof(*mhi_ctxt->cmd_ctxt) *
-						NR_OF_CMD_RINGS,
-						&mhi_ctxt->cmd_ctxt_addr,
-						GFP_KERNEL);
-	if (!mhi_ctxt->cmd_ctxt)
-		goto error_alloc_er;
-
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	cmd_ctxt = mhi_ctxt->cmd_ctxt;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
 		struct mhi_ring *ring = &mhi_cmd->ring;
-
-		ring->el_size = sizeof(struct mhi_ring_element);
-		ring->elements = CMD_EL_PER_RING;
-		ring->len = ring->el_size * ring->elements;
-		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
-		if (ret)
-			goto error_alloc_cmd;
-
 		ring->rp = ring->wp = ring->base;
 		cmd_ctxt->rbase = cpu_to_le64(ring->iommu_base);
 		cmd_ctxt->rp = cmd_ctxt->wp = cmd_ctxt->rbase;
@@ -428,43 +487,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->mhi_ctxt = mhi_ctxt;
 
 	return 0;
-
-error_alloc_cmd:
-	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
-		struct mhi_ring *ring = &mhi_cmd->ring;
-
-		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
-	}
-	dma_free_coherent(mhi_cntrl->cntrl_dev,
-			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
-			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
-	i = mhi_cntrl->total_ev_rings;
-	mhi_event = mhi_cntrl->mhi_event + i;
-
-error_alloc_er:
-	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
-		struct mhi_ring *ring = &mhi_event->ring;
-
-		if (mhi_event->offload_ev)
-			continue;
-
-		dma_free_coherent(mhi_cntrl->cntrl_dev, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
-	}
-	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->er_ctxt) *
-			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
-			  mhi_ctxt->er_ctxt_addr);
-
-error_alloc_er_ctxt:
-	dma_free_coherent(mhi_cntrl->cntrl_dev, sizeof(*mhi_ctxt->chan_ctxt) *
-			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
-			  mhi_ctxt->chan_ctxt_addr);
-
-error_alloc_chan_ctxt:
-	kfree(mhi_ctxt);
-
-	return ret;
 }
 
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
@@ -475,6 +497,7 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 	struct mhi_event *mhi_event;
 	void __iomem *base = mhi_cntrl->regs;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	dma_addr_t mhi_ctrl_limit = mhi_cntrl->ctrl_config_dma + mhi_cntrl->ctrl_config_size - 1;
 	struct {
 		u32 offset;
 		u32 val;
@@ -505,11 +528,11 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		},
 		{
 			MHICTRLBASE_HIGHER,
-			upper_32_bits(mhi_cntrl->iova_start),
+			upper_32_bits(mhi_cntrl->ctrl_config_dma),
 		},
 		{
 			MHICTRLBASE_LOWER,
-			lower_32_bits(mhi_cntrl->iova_start),
+			lower_32_bits(mhi_cntrl->ctrl_config_dma),
 		},
 		{
 			MHIDATABASE_HIGHER,
@@ -521,11 +544,11 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		},
 		{
 			MHICTRLLIMIT_HIGHER,
-			upper_32_bits(mhi_cntrl->iova_stop),
+			upper_32_bits(mhi_ctrl_limit),
 		},
 		{
 			MHICTRLLIMIT_LOWER,
-			lower_32_bits(mhi_cntrl->iova_stop),
+			lower_32_bits(mhi_ctrl_limit),
 		},
 		{
 			MHIDATALIMIT_HIGHER,
@@ -622,8 +645,6 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	if (!chan_ctxt->rbase) /* Already uninitialized */
 		return;
 
-	dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
-			  tre_ring->pre_aligned, tre_ring->dma_handle);
 	vfree(buf_ring->base);
 
 	buf_ring->base = tre_ring->base = NULL;
@@ -649,26 +670,18 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	struct mhi_ring *tre_ring;
 	struct mhi_chan_ctxt *chan_ctxt;
 	u32 tmp;
-	int ret;
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
-	tre_ring->el_size = sizeof(struct mhi_ring_element);
-	tre_ring->len = tre_ring->el_size * tre_ring->elements;
 	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
-	ret = mhi_alloc_aligned_ring(mhi_cntrl, tre_ring, tre_ring->len);
-	if (ret)
-		return -ENOMEM;
+	mhi_init_ring_base(tre_ring);
 
 	buf_ring->el_size = sizeof(struct mhi_buf_info);
 	buf_ring->len = buf_ring->el_size * buf_ring->elements;
 	buf_ring->base = vzalloc(buf_ring->len);
 
-	if (!buf_ring->base) {
-		dma_free_coherent(mhi_cntrl->cntrl_dev, tre_ring->alloc_size,
-				  tre_ring->pre_aligned, tre_ring->dma_handle);
+	if (!buf_ring->base)
 		return -ENOMEM;
-	}
 
 	tmp = le32_to_cpu(chan_ctxt->chcfg);
 	tmp &= ~CHAN_CTX_CHSTATE_MASK;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ce566f7d2e92..bedaf248c49a 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -215,7 +215,6 @@ struct mhi_ring {
 	size_t el_size;
 	size_t len;
 	size_t elements;
-	size_t alloc_size;
 	void __iomem *db_addr;
 };
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 059dc94d20bb..eb5e0181bea7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -325,6 +325,9 @@ struct mhi_controller_config {
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
+ * @ctrl_config_size: Total allocated size of control configuration buffer
+ * @ctrl_config_dma: Base bus address of control configuration buffer
+ * @ctrl_config_base: Base CPU address of control configuration buffer
  * @pm_mutex: Mutex for suspend/resume operation
  * @pm_lock: Lock for protecting MHI power management state
  * @timeout_ms: Timeout in ms for state transitions
@@ -403,6 +406,10 @@ struct mhi_controller {
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_ctxt *mhi_ctxt;
 
+	size_t ctrl_config_size;
+	dma_addr_t ctrl_config_dma;
+	void *ctrl_config_base;
+
 	struct mutex pm_mutex;
 	rwlock_t pm_lock;
 	u32 timeout_ms;
-- 
2.34.1


