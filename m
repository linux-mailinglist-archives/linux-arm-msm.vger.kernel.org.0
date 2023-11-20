Return-Path: <linux-arm-msm+bounces-1213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 741557F1A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 18:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A395A1C210B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F416C2230F;
	Mon, 20 Nov 2023 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e+0FbClZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81171124
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 09:34:26 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKHGjDA012529
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to; s=qcppdkim1;
 bh=EbzvNwj4CIbtC07B2c+ircX4/1kNKJO9XKufiyTSIJ0=;
 b=e+0FbClZV4eA1BqtcibvUpMVvzqz+y4tBcl5WJzCXQMJ7qjoJB4xrH+qUOJo/vM/CfYD
 OQH4AAMiBvBXU1uwSKIkXKMnEaJhnT4V3r7PYmLfu11a/VVs2+jojkrx8Iw9MQEK9gY8
 +pcUQMNbpMXqYQoLNRHrmIEAfQPhPdNiVCflhhxmaTq6W0aqcDnk08FTqgNJvaSqgsSP
 QURploIItXaos8BIXKF3EZCZ+PwhBNmD0r9XMII4EW0lrVDOvb00QVyJt9R6V280hNx6
 fSboMt83A2RwuCfuO421dTSU8c8PJUyy4oCf4k2tJb2mx59g8AAbu4D/3f6y7ZZXWIkZ 9A== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug53713t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:26 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKHYIIc020684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:18 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 09:34:18 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Mon, 20 Nov 2023 09:34:09 -0800
Subject: [PATCH 2/2] freezer,sched: clean saved_state when restoring it
 during thaw
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231120-freezer-state-multiple-thaws-v1-2-a4c453f50745@quicinc.com>
References: <20231120-freezer-state-multiple-thaws-v1-0-a4c453f50745@quicinc.com>
In-Reply-To: <20231120-freezer-state-multiple-thaws-v1-0-a4c453f50745@quicinc.com>
To: <linux-arm-msm@vger.kernel.org>,
        Pavan Kondeti
	<quic_pkondeti@quicinc.com>,
        "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13-dev
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ifa6FjJlsDDz16GUvhuLOdwhbMTWn6YJ
X-Proofpoint-GUID: ifa6FjJlsDDz16GUvhuLOdwhbMTWn6YJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_17,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=629 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200126

Clean saved_state after using it during thaw. Cleaning the saved_state
allows us to avoid some unnecessary branches in ttwu_state_match.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 kernel/freezer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/freezer.c b/kernel/freezer.c
index 759006a9a910..f57aaf96b829 100644
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -187,6 +187,7 @@ static int __restore_freezer_state(struct task_struct *p, void *arg)
 
 	if (state != TASK_RUNNING) {
 		WRITE_ONCE(p->__state, state);
+		p->saved_state = TASK_RUNNING;
 		return 1;
 	}
 

-- 
2.41.0


