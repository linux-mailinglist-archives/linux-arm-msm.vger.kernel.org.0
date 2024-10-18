Return-Path: <linux-arm-msm+bounces-34892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFA69A373B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAAFD1C21EE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD00318872C;
	Fri, 18 Oct 2024 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IwuyuwP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA717995E;
	Fri, 18 Oct 2024 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236867; cv=none; b=LAYM4TfIL2urSl4qHjdEy8EfusfevH4minvlCsz18lEiIH/0QGKfThlA/bgfTisxSjt6sKFWfGqCfpUT5xevRyhaMz9SyX5FRPl+bo6cwvu6M9voP0PuYS+M1YNQks/+w9OGUJmIUgL7qUNB5lV5FZbT8u4VSF+4IiZQcfALp+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236867; c=relaxed/simple;
	bh=9Tv9DoGYtH6U+fImqbE/s2SHDJR1QCnAdovvrekoFk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pi1eoB7OQ+E+unpY/6x6mOsRIywcZ2MnPLMbr8C3vO74v2w+smu/cE+xUH9XiPszdtCUGuCBIcMSRuJ2T10KQUyi4Vm6x5vcM0OMLZMGTD8oz+6o3RHGHmxdLvJ87U0Dr2chk5Dnec/VNE4RPxjkIsgAC62KNokRnq/vDTmHUn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IwuyuwP6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5EAY5029139;
	Fri, 18 Oct 2024 07:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0QmfMtG/s07+N4FJm+BtOyvhGRVKhaYdoNC
	tz3p5aX4=; b=IwuyuwP6jt+63upsNa9f1Yqq4T41+iDKOCtSFsK8PXswsEMFqjT
	H4NO5lsxFkwQ1xRV+T9l7yYeURfAADokuqXMK/u0Giae6pCSGCf4gnNtdRtnzWV7
	dN7rNebC1niJ7qM9RBuKdIFjgkKB/GgTt+AH0teY9gEumJUJ7PfFUMTha8H7ZUya
	mgJpZQOf56u12HSpVI1HCHeuyhcSBde2R6bOoug8/cLhApPzBuWGZmu0SUl4VIF0
	BZNilEf4TiSbFtWxG6pEqFfSgLo0JuyT4QVy+h68GL5TohdwgUwn+wKMVg3TOxzk
	Oq8+luq6BurMLTZWdilCDUeWV+RvtxJSoHw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbq8c96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I7YLFs023250;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6m4a3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I7YLB4023239;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49I7YKTC023237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 448A521BF5; Fri, 18 Oct 2024 15:34:19 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH v2 0/3]  Add aoss_qmp nodes for qcs615
Date: Fri, 18 Oct 2024 15:34:14 +0800
Message-Id: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HbGGCt7gLF1k_HiUYfuQ_BR2iwSWLTv3
X-Proofpoint-GUID: HbGGCt7gLF1k_HiUYfuQ_BR2iwSWLTv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180047

Add dts nodes and to enable AOSS_QMP on QCS615. These nodes provide basic
AOSS side-channel message RAM information and mailbox capacity.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
Build Dependencies:
- Initial support for qcs615:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

Patch made the following verifications:
- Successfully passed dt_binding_check
- Successfully passed compilation and node checks
- Successfully passed the invocation and execution of the upper module QDSS

Changes in v2:
- Add reviewed-by tag
- Fix typo error
- Link to v1:https://lore.kernel.org/all/20241017025313.2028120-1-quic_chunkaid@quicinc.com/

Kyle Deng (3):
  dt-bindings: mailbox: qcom,apcs-kpss-global: Document the qcs615 APSS
  dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
  arm64: dts: qcom: qcs615: add AOSS_QMP node

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml |  1 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml        |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi            | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)


base-commit: 8c6492fad8370b1181bdf18a04dde748ff0e108a
-- 
2.34.1


