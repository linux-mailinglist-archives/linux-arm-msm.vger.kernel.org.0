Return-Path: <linux-arm-msm+bounces-1347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA07F2BB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDC021C218D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCC54878F;
	Tue, 21 Nov 2023 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HizEmTz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F22B18C;
	Tue, 21 Nov 2023 03:25:16 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALAACxn011535;
	Tue, 21 Nov 2023 11:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=h5CDDG+uTAZRXy+p2xjmUOafRHHAUg3mjpVjHiM2nq0=;
 b=HizEmTz72/vHB0O/whe9uT1msiKYPJZFZdxDarIFj0GLktPesqCwnXphB7bJIctIT92C
 id0ZtQE0M8V0tSjBm3fyDQBbWzRqSrwK5mYzjbysKftzQu4FgFcPLe7JBVDq4c/ej64P
 ZRUPYAOD5Ov45l/0cbvWclpPcW9ZkdKFuDh/DDZX1n9hPTPxs798HB6r/eqIPamDIoF/
 do/kI60jm9tWkMZSfe4oCSdOE0p6ZynBGxCpWQdj0l/9sUrYWCCtnmBCr5NdQPOFdV5t
 2zUUAEsbrQJBgyS5+oIxZuVbNuSpaj9J6y9zDpjWEySkNx7GoQcAQU5bjqYlr1ohM9On aA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugr85rk6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:13 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALBPD28003114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:13 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 03:25:11 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] misc: fastrpc: Add support for users to clean up DSP user PD
Date: Tue, 21 Nov 2023 16:54:53 +0530
Message-ID: <20231121112454.12764-5-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231121112454.12764-1-quic_ekangupt@quicinc.com>
References: <20231121112454.12764-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tUDYpCuN_ysK2OZZGZqbLUNpOGLB1bTb
X-Proofpoint-ORIG-GUID: tUDYpCuN_ysK2OZZGZqbLUNpOGLB1bTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=756 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210088

Add a control mechanism for users to clean up DSP user PD. This
method can be used by users for handling any unexpected hang
scenarios on DSP PD. User can clean up DSP PD and restart the
user PD again.

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
Changes in v3:
  - Rebase the patch to latest kernel version

 drivers/misc/fastrpc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 72ed14174363..97895fce1228 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2254,6 +2254,11 @@ static int fastrpc_internal_control(struct fastrpc_user *fl,
 	case FASTRPC_CONTROL_RPC_POLL:
 		err = fastrpc_manage_poll_mode(fl, cp->lp.enable, cp->lp.latency);
 		break;
+	case FASTRPC_CONTROL_DSPPROCESS_CLEAN:
+		err = fastrpc_release_current_dsp_process(fl);
+		if (!err)
+			fastrpc_queue_pd_status(fl, fl->cctx->domain_id, FASTRPC_USERPD_FORCE_KILL);
+		break;
 	default:
 		err = -EBADRQC;
 		break;
-- 
2.17.1


