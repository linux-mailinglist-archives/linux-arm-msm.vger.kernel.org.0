Return-Path: <linux-arm-msm+bounces-53625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFAA822A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749E63B4B10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 10:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5A725D20C;
	Wed,  9 Apr 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nWLoa3vF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837CC1F94A;
	Wed,  9 Apr 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195677; cv=none; b=MbEDazexECdJBquQlsM4WPRQ2wABlQ1rBxqJDYmvcJfSl/05M48iPB1MxYUz0LXBlBmtw3eTFEULLXM9nwYc8sVxBfrUosZp0+FcCS6uJQxG6AFNWQNpKpXEtfvQ42Uh9GeyMTf6+cIyzlU6m2v+OCv+9MB6hQRoQSwR5Fbz1+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195677; c=relaxed/simple;
	bh=hBzxKk31jvSLo0GZkJ5a990Ww8g8aq/wLKXQJfwcDRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=s8SCp+gLksXiC9bnxFY1av4TJu20FXsR8XwfF+5m3ANGuUtqrnL0J9BObCyPqHvsi2nCpDtp5gtaIHwoPlTE3GodwVuRrvtNEING9rnxwuRCTh+WJyf9x/MzQ6Rjr/CzohdN3Tqnv9h/g4mkutJYlQU4np5kwX53P6F2rh5ItEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nWLoa3vF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398NoYO004578;
	Wed, 9 Apr 2025 10:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IHaI+++jwCuYOwCz1k8fO4
	Z77OcdqIOA2hEjPVpuZeA=; b=nWLoa3vFQwdTSr3L7nGqmMm8bqlEH1el7YDHqt
	n8sIyMtmSjhgSD00LBx22MwbZ+bcBhxv2p1tIh9vKCooMCrBiuWeDa6YF/NURijE
	ctlUhBNcmdbQY4TM0XcNLtvD7JUFNNuWLIAPbbpNc/c9l1eOGtnLrHfUcerNp3fI
	KDT6e3g5xGWUxk4IJr9f2wq+gFu4f9GvzqDcRhKOpv2NmvEe8t8QNn0F9m1ZTp9+
	yR6HLIJ23PYwbLbyHuuRzzq7ReGPCbcKjHrN6auiNaqhNTsL4nouEYFwewNC1I5w
	e3lCigpwAMW4Ib2ywFM3iPqpnSRGdBDN9LRs/j/H3/SDYHZg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb34k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 10:47:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539Alnf6015431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 10:47:49 GMT
Received: from hu-sumk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Apr 2025 03:47:45 -0700
From: Sumit Kumar <quic_sumk@quicinc.com>
Date: Wed, 9 Apr 2025 16:17:43 +0530
Subject: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAE5Q9mcC/zXMQQ6CMBCF4auQWVvTKYKVlfcwxJTpKLOwYKtEQ
 7i7FePyf3n5ZkgchRM0xQyRJ0kyhBy4KYB6F66sxOcGo02lS2NVHM8XeSm/547QdlR2DPk8Rs7
 zCp3a3L2kxxDfqzvhd/0RO41/YkKFimpLB2/RVbU73p9CEmhLww3aZVk+66qdYp4AAAA=
X-Change-ID: 20250328-rp_fix-d7ebc18bc3be
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alex Elder
	<elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_krichai@quicinc.com>,
        <quic_akhvin@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_vbadigan@quicinc.com>, <stable@vger.kernel.org>,
        Youssef Samir
	<quic_yabdulra@quicinc.com>,
        Sumit Kumar <quic_sumk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744195665; l=2247;
 i=quic_sumk@quicinc.com; s=20250409; h=from:subject:message-id;
 bh=hBzxKk31jvSLo0GZkJ5a990Ww8g8aq/wLKXQJfwcDRU=;
 b=WWIZamR7npB5C07lOVX97sL3VZSf9QwyHVXsu4NzE430YlqPTIoetP1bE80uzc/4YWDW0YLfQ
 GcaZnbULLzjDa/GilCHogak+QGgqc9Nmsim8fKXn1cDC0JrNFsnu3RB
X-Developer-Key: i=quic_sumk@quicinc.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BMIKhFQlxciX4-RCK1zJrG426wdG4PV4
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f65056 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zHbxs7Yk4LvyobavtX0A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BMIKhFQlxciX4-RCK1zJrG426wdG4PV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_04,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090061

Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
before the buffer is written, potentially causing race conditions where
the host sees an updated read pointer before the buffer is actually
written. Updating rd_offset prematurely can lead to the host accessing
an uninitialized or incomplete element, resulting in data corruption.

Invoke the buffer write before updating rd_offset to ensure the element
is fully written before signaling its availability.

Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
cc: stable@vger.kernel.org
Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>
---
---
 drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
 	}
 
 	old_offset = ring->rd_offset;
-	mhi_ep_ring_inc_index(ring);
 
 	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
+	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
+	buf_info.dev_addr = el;
+	buf_info.size = sizeof(*el);
+
+	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
+	if (ret)
+		return ret;
+
+	mhi_ep_ring_inc_index(ring);
 
 	/* Update rp in ring context */
 	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
 	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
 
-	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
-	buf_info.dev_addr = el;
-	buf_info.size = sizeof(*el);
-
-	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
+	return ret;
 }
 
 void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)

---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250328-rp_fix-d7ebc18bc3be

Best regards,
-- 
Sumit Kumar <quic_sumk@quicinc.com>


