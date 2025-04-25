Return-Path: <linux-arm-msm+bounces-55685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C9A9CF18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4494C347F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE001DE4C3;
	Fri, 25 Apr 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp3Xbqxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296D51A23A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600684; cv=none; b=MyJbYVnPfqs7JpqhqCkFtpm+jNQIBu6JcrUmf/1/AGFQlYLapwQ8KnAEO9l76jM3UQwYuxpG4scSEOpjKnGZ9poH3KhLFBgUXv3VBT3SjME+KAMnJgBSvDVrfhFb7Td3KDVyjrLJw3QZtc6Dg0nw0B9dTa+VtXc4XLJF969KFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600684; c=relaxed/simple;
	bh=fff+xnuFWko4Cc0eba7qYf6zMZvMKuK81LSGzPyVRM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CR8uX4Pau24MLF+W7ZnH/pJjBRgV/i/eTgm6khT0y1CIlJ3hrIJJZyeZTzZVvseisKIlFuldEwh0p5TW17FE1oDw3e+RXmWiGp2JOcvSqsXt0RGpkhAUhnkDCcIB6ed/GqUhuov8QBbTq67x1RfIOYuZMDGr+6xJTigZliyEhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp3Xbqxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqMS004641
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zkksbIcwAlS/wyPyOtIhFc1qvrFJaGvBZVz
	cZ5T4ovA=; b=cp3Xbqxh3BYnEZTPiRTLeXYLS3ZgY1yLPISQBmjOlgx94Ci/GJK
	x2GDe+pqPLkwqA5a02Bg52SCxz24Rt7AaY/rw/mYmWdGTNvKRkOh81mCUh8Gu/Fm
	YwZYBIxYCgCSrfUlrqgVliTVLa8XO+QmSr31FtirVmv9T+zTeMzyLUPGwgwZ11ul
	uXzUK30aavhFHZ3/wNpcJnnrEteHwFuy1blv2W2BqxH8zALnlmW7LqzGVJeDOVm/
	hQpeu605lo0GJr/RUiiY3qQ0k7PEzsyLFbenjHRF11xWX+KYgO6gQlfdAE6k1BeN
	3NefkX3UOEiWLn15kCaGBeWBvvEpOP0LRXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09t2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:04:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2262051205aso18698975ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600679; x=1746205479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkksbIcwAlS/wyPyOtIhFc1qvrFJaGvBZVzcZ5T4ovA=;
        b=TUK5ijMUUqmLTfcGTHKcV5g/ydx/0Rc+lqRnT1iwnSDR3PSCYLjPz1VAPG7tRhjhsi
         kwGKrosLO8fncgUmBxsRUoagw1MfIHqHS69UK+zhBNCHj6jbFOKxCwtX/qMUo452DemO
         GbkpZBcqecVNJqsZ1VZK23Kwc6zyCiwgqo36mRUG0ES7iHgLAZ2OvAooZaP2NYEJklAP
         LOioHC1ysZ3W878gRTyJgjEN2VZh71U+rApc3+HQdKl1iB24ZEsqvqDoGBNfsJTEE9EL
         ALPrf/qv1lIh1PwKKvGNMfskxftOsfxz2H7dtzexnGPeUeDH9qX+7MoknW3/KAkd4EXk
         yfCg==
X-Forwarded-Encrypted: i=1; AJvYcCUGlTU8x15cuZ7Ixq3sDMbdG/RDv1DDBpyf7b1bBxmPKkmOKTN51PidPW0sx9BQWy4AHlfJ/VfRSEtfLIje@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBPn1ZQLetzX3bvZNS4rsexjw2CC6ullkxTWY6M4jPpVuLKrx
	WOJy60JJzZRnWY/WIYSn160GycLvTM2QwTbU5oPKciR5LqSFUJu27oJm3HCjCy/s5c0rlQzF7Sf
	BpPCDN02pPOYFnlRnwEKqcMToDpvkLDWzX4sScUFbqKJcVKD7jXo/GpNotSzWzknx
X-Gm-Gg: ASbGncsp+qtT5NnBhkOy6ddwtewQ0H0Caez1mCq41qCnCoj1Wo9a0essT4DKv3uEzD7
	ljdEASCx4vb14hzQpdWsBC+5+R+EKkOIjzFw7/Gxp5Ff0CyGGAIAAm6/LRSPCvw6TKHc+7NvOGU
	KrU4oCaxhDlbOl1N8FFhEWEMLsprCKPTS4autrwicY2DsW+Wv5aQlkM4I1b7LgtHWKT5WxNUa7/
	d0C/vEVgyrSOdTvK5q+7JHohTnuHLW1tKgsJgTSsyTf5MbhtRsy6C+EZ8zovsuHs0+HFFRm+mVC
	lRzGZq1Y1Mj5Q+8NBCPyvsDwCx6Q5Qw5s2u/Pv6u7O6759KgckZZS50qdWmJ
X-Received: by 2002:a17:903:1b04:b0:224:1943:c65 with SMTP id d9443c01a7336-22dbf5ea798mr48469985ad.14.1745600678875;
        Fri, 25 Apr 2025 10:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFa0jThi6LbNPHRcZvzy+M/EACoGXrF/pl9Vf8pDiLg/aU7dqmdcxLE1P99fDxa8mNrGSUxw==
X-Received: by 2002:a17:903:1b04:b0:224:1943:c65 with SMTP id d9443c01a7336-22dbf5ea798mr48469645ad.14.1745600678402;
        Fri, 25 Apr 2025 10:04:38 -0700 (PDT)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216b7csm34787575ad.232.2025.04.25.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:04:37 -0700 (PDT)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH v2] bus: mhi: host: Allocate entire MHI control config once
Date: Fri, 25 Apr 2025 11:04:31 -0600
Message-Id: <20250425170431.921656-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMSBTYWx0ZWRfX1uwChhP/bTQJ rJHHyk2VP+EAOZy5KHwmx6l7OWB2Bh4mlyFg9KRraR3yJIFV46sn5OK5QEG0JUZuJ20I98DQtRJ +KIH/JZnxUUhTgtM9vE3V3fIFGQMDZNzxpovP2yP0p3L25Iapy0FOzhxkMy8zBl57MORWewThi3
 NzPRuK0jUMEdWE7Hq6OZOD2YIQQZqNIeTVk9P2Wd+rLjkB54PILn2tZLwG55q3/Ra2A6295CIbi SGoyRQeyrpdoqVGuKtFeDNs31ANJGcYLWBCa/VzjBXRvz6z9p+9KMiGOjqKl7FgGPAVPCO7Z9KH qoZdFekA67P/o6Fg3IodHNF/futFwI1dD1y8IJDDrxJ7W28YL8ia5/RvdvzufQdnmdyzqaAwBLJ
 cMxJijqHodypCQfL+EB0hytEdKf/Pz84o8mwqhdJv7NIwq2dEuH9Y+G7M+kPBhYphcxrhK0F
X-Proofpoint-GUID: ljsaoUleLtVb3IPPoFk4rlguhLFCU9-c
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bc0a8 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=L1SiRjdkoy2qpHNo_gMA:9 a=2xCbdNrgO4zEkwPZ:21
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ljsaoUleLtVb3IPPoFk4rlguhLFCU9-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250121

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

MHI control configurations such as channel context, event context, command
context and rings, are currently allocated individually. During MHI
initialization MHI bus driver needs to configure the address space in
which this control configuration resides. Since different component of the
config is being allocated separately, only logical solution is to give the
entire RAM address space, as they could be anywhere.

According to the MHI specification v1.2 rev AB the MHI control
configuration address space should not be more them 4GB. This comes from
the description of MHICTRLLIMIT in section 6.2 which states: "The most
significant 32 bits of MHICTRLBASE and MHICTRLLIMIT registers must be
equal".

This means we have a 4GB range (32-bit) to play with in a 64-bit address
space.  If the upper 32-bits of the 64-bit address for both the base and
the limit must be the same, then the range of addresses from the base to
the limit can only vary the lower 32-bits.

Invalid:
BASE: 0x0
LIMIT: 0xffffffff_ffffffff

Valid:
BASE: 0x0f_00000000
LIMIT: 0x0f_ffffffff

The current implementation is in violation of MHI specification.

For example mhi_init_dev_ctxt() -

We allocate the chan_ctxt with dma_alloc_coherent() as an individual
allocation.  In the case of AIC100, the device can access the full
64-bit address space, but the DMA engine is limited to a 32-bit transfer
size.  The chan_ctxt probably won't be larger than 4GB, so the size is
rather irrelevant.  Can be allocated anywhere.  Lets say that it gets
put in the lower 32-bit address space - 0x0_XXXXXXXX

Then a little bit later we allocate er_ctxt with a different
dma_alloc_coherent() instance.  Being a unique allocation, it is not
tied to the chan_ctxt and can exist anywhere.  Lets assume that it gets
put somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX

Now we have a problem because we cannot describe a single range covering
both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
32-bits of both registers is the same.

Change the implementation to comply with the MHI spec by allocating a
single giant DMA buffer for MHI control configurations and limit the
configuration address space to that buffer.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

v2:
-Amend the commit text to cite the spec limitation, and explain it

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
index dd372b0123a6..79224d07f3f7 100644
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


