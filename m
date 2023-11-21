Return-Path: <linux-arm-msm+bounces-1319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1927F2941
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761492825FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C5D3C072;
	Tue, 21 Nov 2023 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J52GaVal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F8310E;
	Tue, 21 Nov 2023 01:48:57 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL9ASxM002325;
	Tue, 21 Nov 2023 09:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=uWNXEsW4UPrIPDWbwrtq4QRl5WYpPTZC8CrYutDPGl0=;
 b=J52GaValdXZ4Psm+CTx5PZ0qUqkZw1UE/S4XL9z31G/dHVETcxpyBVmE0SFiHPThVUah
 IDxQJpJJZgJ+IXtOcwmxaHepSUCPphvtJhSyIocWdl6gYB097YamcTCk5HKPtToMWblQ
 ibz2/jcEm+fVwloOrrN0r3h+BuRprC6lJ5DyJ60WIAKzn+UKDn5KLoQdINLQ3WSnshMO
 Ei177N0S6d59AVbMUZaPdyWTSx/QIkCUqIdHj0kiScxjivH26AFxglZyb1T9Nl9AuWql
 6O5VBgyBtP1d23QF7woBskOV9UQQ3TvZEOlU2cIDtmEMvbvsmRCxipPvKs+IBXHO7hCx MQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugrk207ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 09:48:54 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL9ms8V017382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 09:48:54 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 01:48:52 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/5] Add multimode invoke request IOCTL support
Date: Tue, 21 Nov 2023 15:18:39 +0530
Message-ID: <20231121094844.5764-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: G4QPtF32-lcrxQnurKHWgxNJ57icjA72
X-Proofpoint-ORIG-GUID: G4QPtF32-lcrxQnurKHWgxNJ57icjA72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_03,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=484
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311210076

Add changes to support multimode invocation ioctl request. This
ioctl call facilitates multiple types of requests from user including
CRC check, performance counters, shared context bank usage, etc.
This series also carries patch to save and restore interrupted
context.

Ekansh Gupta (5):
  misc: fastrpc: Add fastrpc multimode invoke request support
  misc: fastrpc: Add CRC support for remote buffers
  misc: fastrpc: Capture kernel and DSP performance counters
  misc: fastrpc: Add support to save and restore interrupted
  misc: fastrpc: Add support to allocate shared context bank

 drivers/misc/fastrpc.c      | 492 +++++++++++++++++++++++++++++-------
 include/uapi/misc/fastrpc.h |  52 ++++
 2 files changed, 459 insertions(+), 85 deletions(-)

-- 
2.17.1


