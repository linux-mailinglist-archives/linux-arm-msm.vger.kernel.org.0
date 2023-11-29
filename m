Return-Path: <linux-arm-msm+bounces-2358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D27FCF8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 07:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5224B20B0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 06:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E75101DF;
	Wed, 29 Nov 2023 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ecKOqNyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4290194;
	Tue, 28 Nov 2023 22:58:17 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4fFUp029017;
	Wed, 29 Nov 2023 06:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=dpYMv7fQCbBZemHsfaofE+thXQiZttKpERKvSHpImYw=;
 b=ecKOqNyS8kTA5wCRRCHWocEaLvaXT98IovGIxuDCTffUeivi3Kef/l9lmCMZ5owVhxEv
 8T9GhqoEDL+mqpBU3KZoCM1I4LkExv+2Aq8zg87rCyGVOBFgl58M19yJuTG3FAxQcL+t
 fTBajpmQHdjdUilpLTRP+83s7A8pG5hUUgrA/7dvTlkWWtcDxXOuT/ibldtHDH4r03Sc
 dQJSHGi9aip+Lm70WsYJ6rFqWwySNKNqeXMLWuRUR8KfL2mFpN017c9Vzgdc+0QIuF7/
 /4bJnOL3ZgRoNwBacfL5rHl/Q5sy2JyYWhgDg6dWtEDYc4Z22Rkpfa2lX5qWtHJtSlt1 WA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtj375-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6w9xM027171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:09 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:58:06 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH 0/3] firmware: arm_scmi: Miscellaneous fixes and opp count increase
Date: Wed, 29 Nov 2023 12:27:45 +0530
Message-ID: <20231129065748.19871-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1Vtm68OoRqijKglwyudd94w4bXeK_uqE
X-Proofpoint-ORIG-GUID: 1Vtm68OoRqijKglwyudd94w4bXeK_uqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=640
 impostorscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290049

The patch series includes bug fixes identified while testing the
performance protocol on the X1E80100 SoC. It also includes an
increase of the maximum opps count to the next log level.

base tree: next-20231129

Sibi Sankar (3):
  firmware: arm_scmi: Fix null pointer dereference during fastchannel
    init
  firmware: arm_scmi: Fix freq/power truncation in the perf protocol
  firmware: arm_scmi: Increase the maximum opp count

 drivers/firmware/arm_scmi/perf.c | 33 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

-- 
2.17.1


