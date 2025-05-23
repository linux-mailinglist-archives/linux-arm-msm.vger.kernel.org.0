Return-Path: <linux-arm-msm+bounces-59202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26562AC2136
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 862841B6686D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461A9227B9A;
	Fri, 23 May 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W68Hev6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0090189919;
	Fri, 23 May 2025 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996684; cv=none; b=J5Bj5rtwyfd7txjjXIssIwXFykJ/u41PIATaX760Lb/yzsECnHA1CEgItQmYbFhv5jdv2xBhPv8iGXybmQiw+2i1Pd/vC6Ig+ITCoveXb/BUU9Sf5diHf6VZUTk2QsztXxLf6PjLX+KEqvrZ9GWLXnVfWAfplWKR9EdIgzK4mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996684; c=relaxed/simple;
	bh=sv0pREbVOCvjCN8ul9TzmQLU8hHqkLDMyQKB+FDtPSM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QCDknOEyswbNLc+NDmD48O2fdKQ34PhtbHtX4slYy3oWGSONp7tG1xccS5QPDu6UnOH1s4Gw8zFLJsXH6nU3N/Uo5G6+V8N4RP9AS4ybljunhZ2EjCOQ5gnE33+kVJ0/KlewYuwbQ85u/9YdGIy0+1f7PYxPMkNS4NIPos3ddeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W68Hev6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N39ftC020640;
	Fri, 23 May 2025 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=B2W63gAjLsrk+66KoqByrEnMo2r5cVdBUCPBnwcSWvQ=; b=W6
	8Hev6IWLmw443nEpsM47M9uXODnILhDY6hi6A1F/yVv55TzH93fmjrQlc/HbR0TR
	LCnKCcLQ5UKejNkQH14QeS/9swF6EToL1u13xFv0l3GthTEZxzEY/nA8XCe+5WBw
	C+1Fd1YqBsMvxqBuM58WXCyGXdZG2aTlcmeFY4Ge7tSIh+R1O+ofiktmI/xSEt0H
	iKeMxs59yFXAUnV07xijDfBJ7cgF19EO0JwbzWbxOx3f0x2VkPvCKCuebNZhOnEL
	kkf/8VwTwECemRAj07Rx6cKIgOt8pOlH2FSOMvjN6oLZBRIRiEf7MNW2ri1KTs9/
	jNl4gFQ37JTxBkdYKJ0g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb82k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:37:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NAbwsa030346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:37:58 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 May 2025 03:37:55 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v1] serial: qcom-geni: Add support for 8 Mbps baud rate
Date: Fri, 23 May 2025 16:07:21 +0530
Message-ID: <20250523103721.5042-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=68305007 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EyDw_Kcl9UowM1yU27AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oxJMvvbEJ5dTnTN3-YubJ-TQ7ZzZw_sB
X-Proofpoint-GUID: oxJMvvbEJ5dTnTN3-YubJ-TQ7ZzZw_sB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NCBTYWx0ZWRfX2QpVKCdEoxVH
 4zIInU9B1o6huVii11WPVp15geiBE66ttLyoGQz8tDgkL8zpU1BaOTTcEo0VcC8YbjvHNdJnneb
 W+oGZxBZYUcsVgIi1nWx093Zq8B7ZqdKihWe3rSkbt1mGLWBvhN9OkZzIUbAET8IX2THAfqGryi
 OHqRzA6auD7Qx1pxn3nE+SeEP8FcQwZz9Edi6FLDHl8lvZYheicE5n6yBkZMj/6bsCyfvdUrAXn
 sBXrIJ23ErX2G3e57N4x7gNgSlUigZhmu0PBcr3vBQ8YL8y3Ma8NTgoP8QI9qsCgsbCmgcR1beL
 d6PwynoZI/cutkOzDuqAcYkIxiBC6ONHkX1GsMcEuFpz5yDibBcLPkPEhlacXCR8tuv8Z3es5M8
 eyegmgLBc8vHC0lcUHBdexg0KPKB3892/jut1SXkbgpIlRNMsMKWE6VHAGBPJ+oryrr/RjEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230094

Current GENI UART driver supports Max Baud rate up to 4 Mbps.
Add support to increase maximum baud rate to 8 Mbps.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a80ce7aaf309..a86b84d7b134 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1287,7 +1287,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	unsigned long timeout;
 
 	/* baud rate */
-	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
+	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
-- 
2.17.1


