Return-Path: <linux-arm-msm+bounces-1343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8177A7F2BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B32541C21934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9C74A2E;
	Tue, 21 Nov 2023 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MyRUS+VA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9DB9C;
	Tue, 21 Nov 2023 03:25:07 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALAEOFR009217;
	Tue, 21 Nov 2023 11:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=jkyYIGLXZhSaLny8SWblEJDMbQIPF1/jb2ZGeBNxml0=;
 b=MyRUS+VAyXgOBZXovUDqH316YDAREF8ClOpYr34J9hocgtu7pVKeovwyg+WC/EaIcACf
 UwkLhjzKba/aB85OofdX+IGDg3kgUTzJzyWwST+g3hk2hdQtyrQBnvBWJMJDsEKjW3nE
 e1G5O9z46k/lsl99PdJ7DzXERVvucuDd8j0uYF4kzmbEa/tOMYjIifij0Uzp7URSPX8k
 t0pQ8jyEV3xGSZ7J7p9OvlBeEKkp/QlFlbkU74g4F/D6ui7WnlEVOwUK6z/3eLWxcm/H
 w1Km8QOZW9UULKnOpMkw74beYGWwmTXWoxqwpGlK65t2AIBg2EJUrwjQkz1oKAmwCRsX DA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugk9p983x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:05 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALBP4d5006496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 11:25:04 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 03:25:02 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] Add missing features to FastRPC driver
Date: Tue, 21 Nov 2023 16:54:49 +0530
Message-ID: <20231121112454.12764-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Proofpoint-GUID: BZN1Kc6hb2754u9bfz6OD8dNpdHEg3GT
X-Proofpoint-ORIG-GUID: BZN1Kc6hb2754u9bfz6OD8dNpdHEg3GT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=367
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311210088

This patch series adds the listed features that have been missing
in upstream fastRPC driver.

- Add early wakeup support to allow DSP user to send early response
  to CPU and improve fastrpc performance.
- Add polling mode support with which driver polls on memory to avoid
  CPU from going to low power modes.
- Add notifications frameworks to provide users with the DSP PD status
  notifications.
- Add a control mechanism to allow users to clean up DSP user PD
- Add wakelock management support

This patch series depends on multimode support series:
[1] https://lore.kernel.org/all/20231121094844.5764-1-quic_ekangupt@quicinc.com/

Ekansh Gupta (5):
  misc: fastrpc: Add early wakeup support for fastRPC driver
  misc: fastrpc: Add polling mode support for fastRPC driver
  misc: fastrpc: Add DSP PD notification support
  misc: fastrpc: Add support for users to clean up DSP user PD
  misc: fastrpc: Add wakelock management support

 drivers/misc/fastrpc.c      | 568 +++++++++++++++++++++++++++++++++++-
 include/uapi/misc/fastrpc.h |   8 +
 2 files changed, 562 insertions(+), 14 deletions(-)

-- 
2.17.1


