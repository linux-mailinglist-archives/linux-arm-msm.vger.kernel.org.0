Return-Path: <linux-arm-msm+bounces-602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9AA7EAA1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 06:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16D04B20AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 05:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169FED312;
	Tue, 14 Nov 2023 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JZGrAbsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8559D29F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 05:27:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC3294;
	Mon, 13 Nov 2023 21:27:51 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AE0iuP0029557;
	Tue, 14 Nov 2023 05:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=jTLZDpaFyQh9b5vaid9uc2WLgM+TzHPWUCAJsFMDBm4=;
 b=JZGrAbsbxsDqnciuqge93EdYnRzwEI2/XuAru47je3UG5pb4PK8/kJZvuUGII+70yVx1
 ayPCXSaQTMK+GdTT62NEDd8khIGddbUIQpOd6EnjNS8JWUnT0BAvaPSDJ0pn3JU3QzBg
 KgdolXYXtcCpfcgkJxLxAK2rnPfAZnaQ/3S3d7Al4rqjQTcauxM3CBZLXio0j8qwkNPL
 Wa+71AtCBYTYqu9v/2iqcbvKbLv0FyuOC45puN07RNi5r5EXxby2bsriNz01rmImeVku
 WQHx8Na9c80iVWjhPNH1a9ZnCrCuSVQKd+QjLEOFx7Zvx2FObm5iwpGdzXMR5VKzHKpU Gw== 
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubwwn0f6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 05:27:45 +0000
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AE5RiV7032655;
	Tue, 14 Nov 2023 05:27:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 3ua2pkqrhb-1;
	Tue, 14 Nov 2023 05:27:44 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AE5RhHZ032649;
	Tue, 14 Nov 2023 05:27:43 GMT
Received: from cbsp-sh-gv.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTP id 3AE5RhqJ032648;
	Tue, 14 Nov 2023 05:27:43 +0000
Received: by cbsp-sh-gv.qualcomm.com (Postfix, from userid 4098150)
	id EF28F549F; Tue, 14 Nov 2023 13:27:42 +0800 (CST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: mani@kernel.org, quic_jhugo@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, Qiang Yu <quic_qianyu@quicinc.com>
Subject: [PATCH v4 3/4] bus: mhi: host: Avoid processing buffer and event of a disable channel
Date: Tue, 14 Nov 2023 13:27:40 +0800
Message-Id: <1699939661-7385-4-git-send-email-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DSMKcA27HlYvV0yI3DG-uozObHTD5tmn
X-Proofpoint-ORIG-GUID: DSMKcA27HlYvV0yI3DG-uozObHTD5tmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_04,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=687 suspectscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140040
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

MHI channel state is protected by mhi_chan->lock. Hence, after core drops
mhi_chan->lock during processing xfer event, it can not prevent channel
state being changed if client closes channel or driver is removed at this
time. So let's check mhi channel state after getting chan->lock again to
avoid queuing buffer to a disabled channel in xfer callback and stop
processing event of the disabled channel.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
---
 drivers/bus/mhi/host/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index c4215b0..33f27e2 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -671,6 +671,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			}
 
 			read_lock_bh(&mhi_chan->lock);
+			if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED)
+				goto end_process_tx_event;
 		}
 		break;
 	} /* CC_EOT */
@@ -1210,6 +1212,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	/* Protect accesses for reading and incrementing WP */
 	write_lock_bh(&mhi_chan->lock);
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+		write_unlock_bh(&mhi_chan->lock);
+		return -EINVAL;
+	}
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
-- 
2.7.4


