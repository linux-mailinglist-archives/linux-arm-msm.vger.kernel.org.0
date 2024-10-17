Return-Path: <linux-arm-msm+bounces-34675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ADA9A18D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551B4B22C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 02:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696696A332;
	Thu, 17 Oct 2024 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdvy01RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D676457333;
	Thu, 17 Oct 2024 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133606; cv=none; b=GDTt5Mj8ixnVYYwmxkEZ7HYIoPAIzZnFPH4BTUNipJeZYBqA7xgDixG0i1E3wSKF9W6WNDGkduV9ZRbvIV32tb8g+G1hB3cHzXY88nk1CoNPq1G6rdvFKnV2W4T39hd7tJecqZUaTszZExjSOJ6dDMyA3gsdFwSkpeIXYIq9N1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133606; c=relaxed/simple;
	bh=QV7TBaovKSsRDT+O4bia5ouQazOTyZ64/EV//vbGy+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fx32/SaEfSntNRRMfwNZSP1E2egRaVkHmoeKhlkOecfrW2G0iL8c5vM82Zw/IViBx/fPMcIfUPVEpyWxWPLyZQAjNvS3F2HqubKOGbJHpl2HRrN4ds7Gv8loArnrfGrE1poF21VbunOtaCJZItp/7X05tBACJSvdDY8jDtFnzCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdvy01RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGFFvR007430;
	Thu, 17 Oct 2024 02:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wwx8t/s/WjqUw23LHxsmAb/S9TlAJOjrHyQ
	mHkS9Fhc=; b=jdvy01RH3AUwYCIJchJm6EvIekGkBrAjw9oWHHCpxl3uDvaGWHO
	XG/iu1R8xzNbzR7YbOgLmscwfNofa5JlrvBWyswsRLNFgjabQA4OMNQvCkL9BNQn
	lNvTKNOodyx4KH4Nruerg9naW4X3WirtSoG8EQZDMTMLbHDUG3wScSv98M3kZpSJ
	ugt8DWctLXhX6SHNEMs4ByUQxZi1pdUSb2Iz3eGYA1g4VAtbx+Yi4fn8Nnbn7eVJ
	11uMQ4Q280A0mevFZgYmjGxQSPW1UYpnUpGRcYqkH6jbRcuHQNBYQVkiWmJnH550
	HX1ChQpMo3V0JAv9s6V4GrpIA75X+O5395A==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy6ny1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49H2rI3M013807;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6kxu23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49H2rIvP013800;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49H2rHGJ013786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 62FE321C54; Thu, 17 Oct 2024 10:53:16 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, quic_jiegan@quicinc.com,
        Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH 0/3] Add aoss_qmp nodes for qcs615
Date: Thu, 17 Oct 2024 10:53:10 +0800
Message-Id: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vdiceY4cnkZPtwHpH-4_D1JiNIRKrF1G
X-Proofpoint-ORIG-GUID: vdiceY4cnkZPtwHpH-4_D1JiNIRKrF1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=603 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170019

Add dts nodes and to enable AOSS_QMP on QCS615. The nodes provide basic 
AOSS side-channel message RAM information and mailbox capacity.

Kyle Deng (3):
  dt-bindings: mailbox: qcom,apcs-kpss-global: Document the qcs615 APSS
  dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
  arm64: dts: qcom: qcs615: add AOSS_QMP node

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml |  1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml        |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi            | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)


base-commit: a49b32687748279689d11826f8072417199d1639
-- 
2.34.1


