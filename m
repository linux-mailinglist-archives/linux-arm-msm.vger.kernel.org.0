Return-Path: <linux-arm-msm+bounces-33141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B325C9909E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 19:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564E61F226A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 17:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C351CACE5;
	Fri,  4 Oct 2024 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QDVpKlof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99B1E376B;
	Fri,  4 Oct 2024 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728061440; cv=none; b=gOS096ZPQHQCILX5AhyaBX5O680yeVAStf9gXrolwHjdrXk+pjeAzzYxn1NNpeOujrOoUnniG3sGNQrAoK4q5Bp1siQAX0FUc55tJC3g26DPatK0ZRnskIYRDR+O7Lso8V+oikrrj8PEiIauTi5lNXNuHOIZqQx1tK3VzlxAu2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728061440; c=relaxed/simple;
	bh=sznZIHiLDeSmSbipNni5vB9jsCt+O6nsKUsc1EyG4xY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ECqO1iNdyxD96JCL9NXwV/5lccna7lEeWgjBxwvQBHJYuYajh6XvQ6rJHQ/8msRoHurZrORZwxvpaWaVa8AUzn1r1nBOekEYMvGejQAI0CiMqL0pBWc57oPjqNmPn/mqII0KLxw8LGQAjgvygl/xYjlGqhnSop+k3dswBCtH0eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QDVpKlof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AgupO013391;
	Fri, 4 Oct 2024 17:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kk+HM1Pmi7EADD72te/P0C
	u+PfPui5Ooq/jn+8Np8l4=; b=QDVpKlofuvsWNpbBZllw1oaQCw6e2xmqDGgHtO
	x/CxfUI/tq8egXpBDPI9Zzj603t83NdK4TZzz43CeA7LnIURuFrw78ceTll1xFll
	Yoegq5vcNIwBJrp3Tci13/l3OsmLJT8G1joRQgdoAbFj8VCGOHg4J7n+8oarRPPP
	EYwtxn9EY9QTeGXMS6BHBA634/EC0QtokcgP7kkQqWTxhEbaa+Tx+aDvqHhnfO0J
	okir9U5TuSe/pTxQPbz+SGoBbTOlKbfMhuzSfU1pipa4UZTbNU6l7CsFeQ2SbkOw
	bU8yv1v/CygfPoXBEYmDtvLHGIuYFNX0guZOCdvMvKEhC6JA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kar7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 17:03:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494H3sk4022644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 17:03:54 GMT
Received: from carlv-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 10:03:53 -0700
From: Carl Vanderlip <quic_carlv@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Carl Vanderlip <quic_carlv@quicinc.com>,
        kernel test robot
	<lkp@intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] bus/mhi: Switch trace_mhi_gen_tre fields to native endian
Date: Fri, 4 Oct 2024 10:03:20 -0700
Message-ID: <20241004170321.4047492-1-quic_carlv@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5IUBWfezCZGntg485woq_gCYam_VpM-H
X-Proofpoint-ORIG-GUID: 5IUBWfezCZGntg485woq_gCYam_VpM-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=916 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040118

Each of the __field() macros were triggering sparse warnings similar to:
trace.h:87:1: sparse: sparse: cast to restricted __le64
trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer
trace.h:87:1: sparse: sparse: restricted __le64 degrades to integer

Change each little endian type to its similarly sized native integer.
Convert inputs into native endian.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402071859.8qMhgJEQ-lkp@intel.com/
Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/bus/mhi/host/trace.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
index 95613c8ebe06..3e0c41777429 100644
--- a/drivers/bus/mhi/host/trace.h
+++ b/drivers/bus/mhi/host/trace.h
@@ -9,6 +9,7 @@
 #if !defined(_TRACE_EVENT_MHI_HOST_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_EVENT_MHI_HOST_H
 
+#include <linux/byteorder/generic.h>
 #include <linux/tracepoint.h>
 #include <linux/trace_seq.h>
 #include "../common.h"
@@ -97,18 +98,18 @@ TRACE_EVENT(mhi_gen_tre,
 		__string(name, mhi_cntrl->mhi_dev->name)
 		__field(int, ch_num)
 		__field(void *, wp)
-		__field(__le64, tre_ptr)
-		__field(__le32, dword0)
-		__field(__le32, dword1)
+		__field(uint64_t, tre_ptr)
+		__field(uint32_t, dword0)
+		__field(uint32_t, dword1)
 	),
 
 	TP_fast_assign(
 		__assign_str(name);
 		__entry->ch_num = mhi_chan->chan;
 		__entry->wp = mhi_tre;
-		__entry->tre_ptr = mhi_tre->ptr;
-		__entry->dword0 = mhi_tre->dword[0];
-		__entry->dword1 = mhi_tre->dword[1];
+		__entry->tre_ptr = le64_to_cpu(mhi_tre->ptr);
+		__entry->dword0 = le32_to_cpu(mhi_tre->dword[0]);
+		__entry->dword1 = le32_to_cpu(mhi_tre->dword[1]);
 	),
 
 	TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
@@ -176,19 +177,19 @@ DECLARE_EVENT_CLASS(mhi_process_event_ring,
 
 	TP_STRUCT__entry(
 		__string(name, mhi_cntrl->mhi_dev->name)
-		__field(__le32, dword0)
-		__field(__le32, dword1)
+		__field(uint32_t, dword0)
+		__field(uint32_t, dword1)
 		__field(int, state)
-		__field(__le64, ptr)
+		__field(uint64_t, ptr)
 		__field(void *, rp)
 	),
 
 	TP_fast_assign(
 		__assign_str(name);
 		__entry->rp = rp;
-		__entry->ptr = rp->ptr;
-		__entry->dword0 = rp->dword[0];
-		__entry->dword1 = rp->dword[1];
+		__entry->ptr = le64_to_cpu(rp->ptr);
+		__entry->dword0 = le32_to_cpu(rp->dword[0]);
+		__entry->dword1 = le32_to_cpu(rp->dword[1]);
 		__entry->state = MHI_TRE_GET_EV_STATE(rp);
 	),
 
-- 
2.25.1


