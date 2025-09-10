Return-Path: <linux-arm-msm+bounces-72984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B5B51722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16AC51600AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD6F31B117;
	Wed, 10 Sep 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar4eojs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49715E90
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508081; cv=none; b=X3kIjlk/Hjv/2uA8On3R6DQha5/Adv9TRF/e0piTHAy4DABEcS1QrB5AOLZt7B6ARqXqhkXvxrfswMY4MTelnxddBdilICjP6Fx14LhjxA+XYfa0TF4FNOzRoNahInMQOK+TKtP2+PbMDpLwHBOZBmJrJvkBZPMb2g6/+fc+INA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508081; c=relaxed/simple;
	bh=HI+Wo58Xx8twVdr7BQzB/ScbaKtSqasqpDD7ddXTfSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kZ76fUkemmjRVRJHIakW2JaC+oO0GnfYKQMyv2vfiKOVy3GKpMzyRmHN3c6ZZtU0du2ijYLtf5yi6mb2VXEA3C703JTCxEmfkyKhfxKx0moZrEPrYUMiTtUkplZ7w6JYiQVCCF/FZ+9cV2V8yqfvyYwXVI8URIMn0LoER+XETGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar4eojs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFGOV003700
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lHFZZKfkltFSPCpfngB13G
	I5dV64wevesNshRHaYxIg=; b=ar4eojs3r8hn/9vGLuWOedDEZ4Qmb9RCI1W7pJ
	SLMZBB6VbRBiy/a87sS/G8nJJB+WxQsl8SWY6zNU4kEyCdAQAS70V1gD1Ns71r8U
	sLpjFp24hpvhGQEkBH3Odo+PRzzbuTc9xteQqn9Vo36EYxJ2hyiOTisg9QaozjR/
	i5ql35Nkuw3udS4xCAKg5LKlG39NeEnaA0c6FyJi4j49mgpi4rNyK9SPvsV62e1U
	+Rb7fKdXdwefLN/oxB+OGeVoleb9Qqwe3stWNMYLRsYWJzoc2LLtf6FeJo0UnIeT
	G+ne0G2f1VQ7lb448ZkqbaCkNnGsdj4iVp/m3LVtBTEXNcFQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8kvhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:41:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b52047b3f1dso9209912a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 05:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757508077; x=1758112877;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHFZZKfkltFSPCpfngB13GI5dV64wevesNshRHaYxIg=;
        b=ZuTq04CrV+bfSyBOr1BbNP00hY/2asHuoyoaODBGggrooK1dnvisDu/V1ycROF3Bjy
         cwhP782QG6dZ4MjmTv+ANso9NiCjEET9pRp1XQqgUt7uCZFJkXAkVQWXChmhttqljVuk
         oAcn/6Ae1J+05JUW/IqVqv18p/u0G8Jb9OecprfO02sOSX/xeKlx+OGIS+cYYgn379uR
         JH61J5UBxv1paH6Yt1v6WGpPfhzfjYWT8JmvTg7R4cNvzHVBkaWIE+E0PmvyJV61yvOR
         JWJBZIZRGP9U1LYma1ghK3NOF//Sqbh3nG4YqvxIe41MVV0qPJiqqSBVvPMTR5dnBVYl
         InDw==
X-Forwarded-Encrypted: i=1; AJvYcCVMk0hcwMKwZJpPf4f7TQ/bJ70txOy9zFNRUJiiYt5vx6hgvXD2li/vUmU6wWSVF1SOwPnBCz3NZx7e1D/c@vger.kernel.org
X-Gm-Message-State: AOJu0YzuczPfHCY5j6P5Xl7qwvqI8VASG2/jNrfHwIzCT8492I5GW7ob
	iVvcyG+OpSgCDTQS+D7dwsybKtg2f5WpB9TDsHXoxF7v1+FXlB3Fc5PbM/FHjVNPy3DL7czAH0P
	WL5jNz6fe4xoQodmb3eDu9gIpkkEikFiyc5Ivfhfdn/hCBc3mcrzBnSWahLILHlpHZZvC
X-Gm-Gg: ASbGncsuUCtTVrZgTrzTXZiPc6nSsLI4S5h7+ez70HcJSYBz/gU5PmzmRkhxt4+9TUC
	XXaCpKjQo8YF4UOklLIDtrBBGJC4FygMqbbNtJM8fxLEHyWMyXtYCyR8I7gs0aPZmKmBk2A+dcu
	6Q7QuHsGoLeVrm5Bhp/WJS1JbdSqcUzv9TnQL/LCMeM/xtuHRzbLRmI3KTNg5eCRmtl4SED+FeS
	82UqfTOz/4EhoiBvvLaNKoSs5nyfM7alsWwNX2RvQLhqIAg1fJs2OPEfn3TucMs6IJJ3gga5q5d
	+WW8Exq4/3RZbW17Gzecs8xYeIonIWQY9rylyEAFiAbBnfNNBCElj6rd+4HjMLtXDg==
X-Received: by 2002:a05:6a21:6d9c:b0:250:f80d:b32d with SMTP id adf61e73a8af0-25335e6f177mr23586511637.0.1757508076806;
        Wed, 10 Sep 2025 05:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrftTS+0N2imH3IgPQLdHacgwBKP6X3z3IlpwLVR4e5eP/aF1fk05Jlwi7vkfwOHOoqKQMfA==
X-Received: by 2002:a05:6a21:6d9c:b0:250:f80d:b32d with SMTP id adf61e73a8af0-25335e6f177mr23586444637.0.1757508076236;
        Wed, 10 Sep 2025 05:41:16 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a6a7fd0sm2537399a12.32.2025.09.10.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 05:41:15 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 18:11:09 +0530
Subject: [PATCH v3] bus: mhi: ep: Fix chained transfer handling in read
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-final_chained-v3-1-ec77c9d88ace@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAORxwWgC/x2MWwqAIBAAryL7neADkbpKRIiutRAWChGEd2/pc
 xhmXmhYCRtM4oWKNzU6C4MdBMQ9lA0lJWYwyjg1aiUzlXCs7Khgkt6paLT1xmUN3FwVMz3/b15
 6/wCRNsOlXwAAAA==
X-Change-ID: 20250910-final_chained-750c213725f1
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_krichai@quicinc.com,
        quic_akhvin@quicinc.com, quic_skananth@quicinc.com,
        quic_vbadigan@quicinc.com, stable@vger.kernel.org,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757508072; l=5093;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=HI+Wo58Xx8twVdr7BQzB/ScbaKtSqasqpDD7ddXTfSk=;
 b=+vySGg6hSDSPdtqaNt11c7f34fgtcTWBAGEE+bsylMRErej8lEL6cMHyAt6isOoUosMNHYeHa
 OXSaPqv8sO2DUERHBOgJK0YtIqiqUDsdG16/v29BruOHabdV10ImQjF
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9g+R6fBhW/7r
 jBcTwU69nsxeHi2v1NrH4zsv8rgdQVPgV4540FtNve+FOj1Me54OAMj/bbkyMkNqDJ4zXe7KWH/
 QKEJnau9jbo+N5i3xWDOB1OMVHoLBgXhCumjju7ZMjTlQlJyRqc1r8LwFGDqcZgniRylJj3wUZY
 fSur5BDP3QuOnD2MVw2hiSJ/H64MRjAeJuoXPLIteiQqQ9hPDrXLPTqN01vwmOS7l2JR4S7tg5r
 ZqZE31A4yeh/3MKKCA2lgwjyQC2UMHgl1gGBHIIAfpHPQRPHsQHZivfyMlpJyis0oHkqc0VRKB9
 HMLVOUA6d5v/1OYeBO26AGcKllKRuStwE9Y/LtG8Hv4TUOkny/RVqJNx77lieL2ziTwBScBQVgr
 IuSWyzCs
X-Proofpoint-ORIG-GUID: Trx3xoG0tqiQAeNIAO50vTb9vnFP5lQq
X-Proofpoint-GUID: Trx3xoG0tqiQAeNIAO50vTb9vnFP5lQq
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c171ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=vLTmBYhAW2SDn_YjWJsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

The mhi_ep_read_channel function incorrectly assumes the End of Transfer
(EOT) bit is received with the doorbell in chained transactions, causing
it to advance mhi_chan->rd_offset beyond wr_offset during host-to-device
transfers when EOT has not yet arrived, leading to access of unmapped host
memory that causes IOMMU faults and processing of stale TREs.

Modify the loop condition to ensure mhi_queue is not empty, allowing the
function to process only valid TREs up to the current write pointer to
prevent premature reads and ensure safe traversal of chained TREs.
Remove buf_left from the while loop condition to avoid exiting prematurely
before reading the ring completely, and remove write_offset since it will
always be zero because the new cache buffer is allocated every time.

Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
Cc: stable@vger.kernel.org
Co-developed-by: Akhil Vinod <akhil.vinod@oss.qualcomm.com>
Signed-off-by: Akhil Vinod <akhil.vinod@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v3:
- Update commit message
- Migrated to new mail
- Link to v2: https://lore.kernel.org/r/20250822-chained_transfer-v2-1-7aeb5ac215b6@quicinc.com

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
change-id: 20250910-final_chained-750c213725f1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


