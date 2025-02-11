Return-Path: <linux-arm-msm+bounces-47549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE094A308FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80DDD161ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D751F76C0;
	Tue, 11 Feb 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S3Ay4wq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA031F473A;
	Tue, 11 Feb 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270690; cv=none; b=PO1Lr9XxhD7HsgTMQAOGzfIhH6rSY37fP2OIzs+YHcr5ux2mOizVghBkvo717t9BwOu1I52sbRUK7mIRfkLBOYiXG7D3npS61VmOmXBBTbclnXdnCd7g7b+W/5yAuLFLky5JGjcPCl4w7EPd+kW0QBwTTh13pueZ/XGvWUgzeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270690; c=relaxed/simple;
	bh=lU53bagZCpbF7NgOcmW1llZ/0ZmBIbZBkQ0DIHSWzc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MkIfM3/88C1l+N9o/cKK0rVarjTtDXzWNXe9C73SqeSl3YiVWv4ZYEjEmn4myUF4bDG1kkH8bx9yMX0COucjU5aTpKsurWw/cDW4NhDJvSl3F+CURcbWn7xXPBs+nhK5u75HbmGFvTtSln/QhbFvt5zMUrKpu+jYnvETEvrBk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S3Ay4wq1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B4Y8R7010537;
	Tue, 11 Feb 2025 10:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pop8DLAgHzsfRcjlvrS32YU1xV691RtVt0X
	bPcHrQJ4=; b=S3Ay4wq1HExmhOFofKWV/YyaTsP45pwjLZeGO4Y0Fgh2bQ+MZ3p
	rYOy+kA6SmJV4FxHaG+Gk+Mm3l6XNYP8VQXTz8CoFCDaEZn6luKraO/hDfGO/pP3
	5gLCix3ZLwbrI9HC9+0ot+5kMydtrgoD6QAgj+yn+s/dRkC//rb+OqwMxyZggEsF
	yRa9NjyOnwg3udJkqJIJKBTfmc/7fRQzd0NL8AYxrrDu9TCrhpHH/7+Nv9WcYwDP
	b/4HiVqZJLjauvkE77DOIFsCWzkpdob/48EXfTheZjl/+ZVgsKW5Ux/UulmyXUFN
	fXvBb3I/V8eEh2E/dh1XjqThOMPPmAFzeQg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5c2fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:45 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAigkd002161;
	Tue, 11 Feb 2025 10:44:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkpjte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:42 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51BAifrG002154;
	Tue, 11 Feb 2025 10:44:41 GMT
Received: from chejiang-gv.ap.qualcomm.com (chejiang-gv.qualcomm.com [10.233.43.239])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51BAifj2002152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:41 +0000
Received: by chejiang-gv.ap.qualcomm.com (Postfix, from userid 37913)
	id 830B814F1; Tue, 11 Feb 2025 18:44:40 +0800 (CST)
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: [PATCH v1 0/1] Enable BT for qcs8300-ride
Date: Tue, 11 Feb 2025 18:44:20 +0800
Message-Id: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: TC6-Ab8FCOYS-33P3CW_RyBDvZRqB0zv
X-Proofpoint-GUID: TC6-Ab8FCOYS-33P3CW_RyBDvZRqB0zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=672 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110067

Enable the BT subsystem of the qcs8300 ride board.

Cheng Jiang (1):
  arm64: dts: qcom: qcs8300-ride: enable BT on qcs8300-ride

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)


base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
prerequisite-patch-id: 7777ec69b5f2389a2efdb0bda561b067da72abfb
prerequisite-patch-id: e6140f9abf38172e77875f126da90bde6e1829cb
prerequisite-patch-id: c4e0283b4bce4c4e0566d7783f8ccd7fcaaebd3f
prerequisite-patch-id: c87e5f1cb29568c24566e8a960d6c8dd0be5969d
prerequisite-patch-id: f80a486c6e34dfb62f09faf0eb3fae586cda85ec
prerequisite-patch-id: 0e2cb7a4d8779539a58261111deea6bd6b750f6f
prerequisite-patch-id: edd904882daa9ed31340710e36905c82c4552c8e
prerequisite-patch-id: 28493e0ec65dc01bd8f8e2e82beea6295944e6e6
prerequisite-patch-id: 29da1304862005c0fbe32230b47ce6d270518b04
prerequisite-patch-id: a796c820ab0b76a1b56b32480a83dbf5cb1cdab7
-- 
2.34.1


