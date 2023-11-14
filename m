Return-Path: <linux-arm-msm+bounces-604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A47EAA1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 06:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5331C204D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 05:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B37C2E3;
	Tue, 14 Nov 2023 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fi2OqVch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D32C8F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 05:28:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4D4171A;
	Mon, 13 Nov 2023 21:28:20 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE52Ocf022800;
	Tue, 14 Nov 2023 05:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=vi+ivIzdj5lz69ubLpbSMW3Cjsd+LFLFD/vSlhgdYaY=;
 b=Fi2OqVchCBJXH82l59S/tB4JYgK6UMkuBOoXjtKzO5+oBstJ5P23AR99cpz3S0jhu/WX
 uuhGNcLIRdp3LTMpSHa47nBLWUEQ0it9VaP4y1iETjONZRmNG6DLxJ5y7qAmMIg/fx6Y
 atqyHcCS0nqvzPFzrz83AauQI/OKvH36yLYjEZ37aFM3R3IlvlWGuFOzbCHTA08Mk79f
 Chn4paNRIjjxaMdbJD926KkFL3i0MPaUxG4gRscog3IwjBVLQqV/ok6KNPUQl5wEZd9Y
 l5j49fP/66jbBmrFPBL4YWVzYcgyIl9zsQS7gtDFO90NsF13Yk1CtYmrSnBsIDjZ1YJT xw== 
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uc048086y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 05:27:45 +0000
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AE5Rhme008880;
	Tue, 14 Nov 2023 05:27:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3ua2pkg46a-1;
	Tue, 14 Nov 2023 05:27:43 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE5RhkH008869;
	Tue, 14 Nov 2023 05:27:43 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 3AE5RgJC008868;
	Tue, 14 Nov 2023 05:27:43 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id 33BE5549D; Tue, 14 Nov 2023 13:27:42 +0800 (CST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: mani@kernel.org, quic_jhugo@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Bhaumik Bhatt <bbhatt@codeaurora.org>,
        stable@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when queueing TREs
Date: Tue, 14 Nov 2023 13:27:38 +0800
Message-Id: <1699939661-7385-2-git-send-email-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fEW3KgFGSHMfIq2igPBxNogHINopilhk
X-Proofpoint-GUID: fEW3KgFGSHMfIq2igPBxNogHINopilhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_04,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=357 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140040
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Protect WP accesses such that multiple threads queueing buffers for
incoming data do not race.

Cc: <stable@vger.kernel.org>
Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index dcf627b..6c6d253 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1204,6 +1204,9 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	int eot, eob, chain, bei;
 	int ret;
 
+	/* Protect accesses for reading and incrementing WP */
+	write_lock_bh(&mhi_chan->lock);
+
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
 
@@ -1221,8 +1224,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	if (!info->pre_mapped) {
 		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
-		if (ret)
+		if (ret) {
+			write_unlock_bh(&mhi_chan->lock);
 			return ret;
+		}
 	}
 
 	eob = !!(flags & MHI_EOB);
@@ -1239,6 +1244,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	mhi_add_ring_element(mhi_cntrl, tre_ring);
 	mhi_add_ring_element(mhi_cntrl, buf_ring);
 
+	write_unlock_bh(&mhi_chan->lock);
+
 	return 0;
 }
 
-- 
2.7.4


