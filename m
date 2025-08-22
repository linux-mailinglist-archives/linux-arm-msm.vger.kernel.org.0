Return-Path: <linux-arm-msm+bounces-70292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24210B312FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5366B1BA1863
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585932E22B2;
	Fri, 22 Aug 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G+Jiu1PZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93301E5705;
	Fri, 22 Aug 2025 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854685; cv=none; b=tMsLBzuq+g2PmcexRtx0XShZNzsqw8grz/nvvC1k1z4JqG6SJJzDDoQzGTFWzxhZ+IVWCLigKNzEwMEqxczp05WtnT4V5tP2Zv9narJleZGg4IHvl9ksinAhblyz9wEx+o6HjpPzANp9e9xSM6XzytATQtO8gsSDW4aBa7roP7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854685; c=relaxed/simple;
	bh=p29owKCz3ecm4EYMWjteO2Thx/IuiRcRF4Yi/2j06xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=f9ag5MUtWN2pIJVomtS356qZE52HgonfjlzAbCvQx/s/h4Z1LlqJBDq6p8Nnu98094pnWHOsbCYCADIj2r2ATW0nVU5kBlSLnr+XqKb4NDzAXW88QHUW3Mg8AjugZpQj6VGx7tJsIRuuUTi0BbhWWK/Ar/SyIiZygcym5/NThsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G+Jiu1PZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UX7T022188;
	Fri, 22 Aug 2025 09:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tohv4Om1ZHY17KbVzigLWE
	atXmnfC4ZmdUB4jy2e14M=; b=G+Jiu1PZC1ZxtLJZ38KR9fnmEXiB7ptP/I7F8g
	FKWrrSP4F5Wq7+gTyQr8DXgIAjA+RKA0PAwNuaS/r3VL+Ty9GPGduR5bK33JzfH/
	UlewyFne5I9sznwWRr/BTPuPFxYXF6wJFrbVnSwopTkqPC33jAZ+DRmU9vpAMUHX
	Kzv0N0u5sjC2nJT264UszQ0ywwdsy2K+MsNwqxL3CyFSruOcJpc/ymNNeTU/NCqZ
	c/vPgWOaJhh+o+a7E1zbiwrUIYxB1zrN29qSNscXw7gKagMgjRLqBIAKhYrVHGu8
	jjHX4SLhYqvrKdoDJiDiPgixTe0BCf/PoMUc+jxggrFls/aQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8qsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:24:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M9Od10018521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:24:39 GMT
Received: from hu-sumk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 22 Aug 2025 02:24:35 -0700
From: Sumit Kumar <quic_sumk@quicinc.com>
Date: Fri, 22 Aug 2025 14:54:18 +0530
Subject: [PATCH v2] bus: mhi: ep: Fix chained transfer handling in read
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEE3qGgC/32NQQ7CIBBFr9LMWgxgaYsr72Eag3SwsxAUKtE03
 F3sAVy+l/z3V0gYCRMcmxUiZkoUfAW5a8DOxt+Q0VQZJJeK91yzasnjdFmi8clhZPyqlRuMM+3
 QQ509Ijp6b8nzWHmmtIT42R6y+Nk/sSyYYPIgO9N2XFltT88XWfJ2b8MdxlLKF/rONgGyAAAA
X-Change-ID: 20250709-chained_transfer-0b95f8afa487
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_krichai@quicinc.com>,
        <quic_akhvin@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_vbadigan@quicinc.com>, Sumit Kumar <sumk@qti.qualcomm.com>,
        <stable@vger.kernel.org>, Akhil Vinod <akhvin@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755854675; l=4966;
 i=quic_sumk@quicinc.com; s=20250409; h=from:subject:message-id;
 bh=KBThMEJX0rKHCfMSRduWUASeRfWzcxnPJbnPQ0YMEVM=;
 b=u8zK4CnamPmkex+WNNNOaszIEiqqQ/uk8SeE+PPjD350OBuLmA0F68A27q/uFhE9N5yGmSLSC
 dKYYahGVT3CCsOUhPqwRz1MTs5XFEkR8K1XgS1mJEBur9KlgxMVnb+r
X-Developer-Key: i=quic_sumk@quicinc.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a83758 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Acz1dXpLE0r9sSoUNVYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: jyZ0ajxforUgOzikqWQQjlbVY_LUpTvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX08/9FfkSvYUS
 tRB9+lqFJoahVh2QE9N1hYcKw2PaQSSGSHxyGH1K7O75c5OxL5qfVmLB6UPAbRgl/GGDI85YrDe
 8fSXk4OMIAMGDkv5fF0Hw1BCJG7iSklEY6/MvYSP1VIDNW5EM4vv69f/lFee5FV0+f2etjdt7a+
 1Mpnn/ln/uFCn+5w/4FpYk7xqj+3UnXAHt4vHFwhedxOemlS2p9iFe+JfaEi2zqoiLTkYu2jruQ
 rjYT49tQCJecX2xJWY9fVqWQwycvWJ4paiR4vwRf/n7xaZtg9SxCdEvNIektuj6FbkFuySwEZJg
 +do/iMtYjgLG8eJbPo+svXJwjZSbtPR4SgD/uB5ZEIRhLQy+PCgDj0763KkXgXcALNF7/tVjIOb
 1ciJNIooCvMdoDRtwu9tXqD/11Iacg==
X-Proofpoint-GUID: jyZ0ajxforUgOzikqWQQjlbVY_LUpTvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Sumit Kumar <sumk@qti.qualcomm.com>

The current implementation of mhi_ep_read_channel, in case of chained
transactions, assumes the End of Transfer(EOT) bit is received with the
doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
beyond wr_offset during host-to-device transfers when EOT has not yet
arrived. This can lead to access of unmapped host memory, causing
IOMMU faults and processing of stale TREs.

This change modifies the loop condition to ensure mhi_queue is not empty,
allowing the function to process only valid TREs up to the current write
pointer. This prevents premature reads and ensures safe traversal of
chained TREs.

Removed buf_left from the while loop condition to avoid exiting prematurely
before reading the ring completely.

Removed write_offset since it will always be zero because the new cache
buffer is allocated everytime.

Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
Cc: stable@vger.kernel.org
Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
---
Changes in v2:
- Use mhi_ep_queue_is_empty in while loop (Mani).
- Remove do while loop in mhi_ep_process_ch_ring (Mani).
- Remove buf_left, wr_offset, tr_done.
- Haven't added Reviewed-by as there is change in logic.
- Link to v1: https://lore.kernel.org/r/20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com
---
 drivers/bus/mhi/ep/main.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..cdea24e9291959ae0a92487c1b9698dc8164d2f1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -403,17 +403,13 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 {
 	struct mhi_ep_chan *mhi_chan = &mhi_cntrl->mhi_chan[ring->ch_id];
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	size_t tr_len, read_offset, write_offset;
+	size_t tr_len, read_offset;
 	struct mhi_ep_buf_info buf_info = {};
 	u32 len = MHI_EP_DEFAULT_MTU;
 	struct mhi_ring_element *el;
-	bool tr_done = false;
 	void *buf_addr;
-	u32 buf_left;
 	int ret;
 
-	buf_left = len;
-
 	do {
 		/* Don't process the transfer ring if the channel is not in RUNNING state */
 		if (mhi_chan->state != MHI_CH_STATE_RUNNING) {
@@ -426,24 +422,23 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 		/* Check if there is data pending to be read from previous read operation */
 		if (mhi_chan->tre_bytes_left) {
 			dev_dbg(dev, "TRE bytes remaining: %u\n", mhi_chan->tre_bytes_left);
-			tr_len = min(buf_left, mhi_chan->tre_bytes_left);
+			tr_len = min(len, mhi_chan->tre_bytes_left);
 		} else {
 			mhi_chan->tre_loc = MHI_TRE_DATA_GET_PTR(el);
 			mhi_chan->tre_size = MHI_TRE_DATA_GET_LEN(el);
 			mhi_chan->tre_bytes_left = mhi_chan->tre_size;
 
-			tr_len = min(buf_left, mhi_chan->tre_size);
+			tr_len = min(len, mhi_chan->tre_size);
 		}
 
 		read_offset = mhi_chan->tre_size - mhi_chan->tre_bytes_left;
-		write_offset = len - buf_left;
 
 		buf_addr = kmem_cache_zalloc(mhi_cntrl->tre_buf_cache, GFP_KERNEL);
 		if (!buf_addr)
 			return -ENOMEM;
 
 		buf_info.host_addr = mhi_chan->tre_loc + read_offset;
-		buf_info.dev_addr = buf_addr + write_offset;
+		buf_info.dev_addr = buf_addr;
 		buf_info.size = tr_len;
 		buf_info.cb = mhi_ep_read_completion;
 		buf_info.cb_buf = buf_addr;
@@ -459,16 +454,12 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 			goto err_free_buf_addr;
 		}
 
-		buf_left -= tr_len;
 		mhi_chan->tre_bytes_left -= tr_len;
 
-		if (!mhi_chan->tre_bytes_left) {
-			if (MHI_TRE_DATA_GET_IEOT(el))
-				tr_done = true;
-
+		if (!mhi_chan->tre_bytes_left)
 			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
-		}
-	} while (buf_left && !tr_done);
+	/* Read until the some buffer is left or the ring becomes not empty */
+	} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
 
 	return 0;
 
@@ -502,15 +493,11 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 		mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 	} else {
 		/* UL channel */
-		do {
-			ret = mhi_ep_read_channel(mhi_cntrl, ring);
-			if (ret < 0) {
-				dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
-				return ret;
-			}
-
-			/* Read until the ring becomes empty */
-		} while (!mhi_ep_queue_is_empty(mhi_chan->mhi_dev, DMA_TO_DEVICE));
+		ret = mhi_ep_read_channel(mhi_cntrl, ring);
+		if (ret < 0) {
+			dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
+			return ret;
+		}
 	}
 
 	return 0;

---
base-commit: 4c06e63b92038fadb566b652ec3ec04e228931e8
change-id: 20250709-chained_transfer-0b95f8afa487

Best regards,
-- 
Sumit Kumar <quic_sumk@quicinc.com>


