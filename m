Return-Path: <linux-arm-msm+bounces-1211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF897F1A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 18:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05F61C21227
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DC52231E;
	Mon, 20 Nov 2023 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ia5Wf2uy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2F0E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 09:34:20 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKHGYDm004525
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=BNUXCUB5Vm0M8ZszrbTJTGseYxxbTjGdnUHTGlo5MSo=;
 b=ia5Wf2uyCvG9yvR5BfZkS/DguPg4VZHBBLpNXdmPWFNtJduBsvRmIFn8Zxipc3BYsCgw
 cLNkRh6Mf2Zx6iAVgzS0UsfH8KITSbrWYf0imna+WdKCj8HJFNvZmXEe5gtqZ2TEJdiu
 KuVeR9VEcdd4Yu8mmM8/D6vK5c2hwj5g2scIZD/SeOCWaNNpUA2HGlTPypDwwEaWrQUb
 riYZDtb9RVbsWqug5kxHVQ6DlY3Q3nCBFCvBFje/Q6E+7bFKeZjy0WjfJrnVLShl3ZzL
 Oc+okdCFPMYx10w6/ZD5C2yikLY5/9NpgLnBW+CMsXgDNavtruLJ0Uw7hjA2Uw1b9z6C 4A== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug26tsjy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:19 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKHYIjq016815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 17:34:18 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 09:34:17 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Subject: [PATCH 0/2] freezer,sched: do not restore saved_state of a thawed
 task
Date: Mon, 20 Nov 2023 09:34:07 -0800
Message-ID: <20231120-freezer-state-multiple-thaws-v1-0-a4c453f50745@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCYW2UC/33Nyw6CMBCF4VchXTumQ0NAV76HYVHaqUzCzbbgh
 fDuVuLa5X8W31lFIM8UxDlbhaeFA49DCjxkwrR6uBGwTS1ymStEWYHzRG/yEKKOBP3cRZ46gtj
 qR4BSK13Zk9W2USIRkyfHz52/1qlbDnH0r/1twe/6g7H4Dy8ICE7ltkRysmjk5T6z4cEczdiLe
 tu2Dy1YQB/KAAAA
To: <linux-arm-msm@vger.kernel.org>,
        Pavan Kondeti
	<quic_pkondeti@quicinc.com>,
        "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>
CC: Abhijeet Dharmapurikar <quic_adharmap@quicinc.com>
X-Mailer: b4 0.13-dev
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ok2sxupgGozNEsgkWDuBMsTvwRPMw7JL
X-Proofpoint-GUID: ok2sxupgGozNEsgkWDuBMsTvwRPMw7JL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_17,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=558 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200125

This series applies couple fixes to commit 8f0eed4a78a8 ("freezer,sched:
Use saved_state to reduce some spurious wakeups") which was found while
testing with legacy cgroup freezer. My original testing was only with
system-wide freezer. We found that thaw_task could be called on a task
which was already frozen. Prior to commit 8f0eed4a78a8 ("freezer,sched:
Use saved_state to reduce some spurious wakeups"), this wasn't an issue
as kernel would try to wake up TASK_FROZEN, which wouldn't match the
thawed task state, and no harm done to task. After commit 8f0eed4a78a8
("freezer,sched: Use saved_state to reduce some spurious wakeups"), it
was possible to overwrite the state of thawed task.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
Elliot Berman (2):
      freezer,sched: do not restore saved_state of a thawed task
      freezer,sched: clean saved_state when restoring it during thaw

 kernel/freezer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 6d7e4782bcf549221b4ccfffec2cf4d1a473f1a3
change-id: 20231108-freezer-state-multiple-thaws-7a3a8d9dadb3

Best regards,
-- 
Elliot Berman <quic_eberman@quicinc.com>


