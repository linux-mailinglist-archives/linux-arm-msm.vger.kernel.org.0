Return-Path: <linux-arm-msm+bounces-32222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E2983C38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32B61C22560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 05:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B9539ACC;
	Tue, 24 Sep 2024 05:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ii1YV60q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC58549652;
	Tue, 24 Sep 2024 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727154718; cv=none; b=mFan02d3WiV/NvbH7c8uiDRO6tDt9c/28hvhvoOQth3KmGb8jqMe9pRQo76HEy+tprjUTNCvGMT56RxSxbBgkruXRHMpcvJh6EuL+YvFd8kgWG8Wul+OFwGs6vZvYoj87OVoFrXKxpgeQq8QXFlNVgHmOiOtF9Uo1K1c1ihLYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727154718; c=relaxed/simple;
	bh=CvEAFg1AnAi38zXZUkCRWOiBwOBUiNXZbEVQsZ2CJZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+35wbIDwgHV28WKap/QyfY4aCLzpH154j0WQeS0PO5gLXkuprybVnhCrKtXY9I0MBzC8fZ+IVwChiYq4VWELoMdf5vO/nOWau4ZMmDSWXSqYDTowsupS3WcOk9zpglMtUONgL7SZMXKQU1P527axEp6r8HC2573CUwBUYUHPvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ii1YV60q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NLPaFN024614;
	Tue, 24 Sep 2024 05:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sdu0//fzuSNN9hlQMcpF/e38hIqRStoDda7u+GPOYdk=; b=ii1YV60qa93BGLZV
	6YdWOhokVGmdLhliclcVk5s4urGU5WedCZm7Qjrq/liD7dW+18myZCQxbJWsbPUU
	6bQxvrq+8DW98jcrIYUKnn1yLZOeVggNDVw9V4abAWHQX49ZrisLAi+DPI3wdRZy
	Kyzudb+kp8zJybGp2r3ZLdy/0rxzNoTZYkagbXUuAM0pJy/EHJXIQDDv7x4NnHGV
	vYB4EIZNSABp77iTchgRKUKFWNpi0QMaQBIjJ6hEjecOVTJ7t8GJm5Oi1UhQo2YO
	Dm8NYWIZOloN8hpxwrSSGSDmjHZ07ad5E2ALmkJ771R28HNrxPSxGfIyIw3ascgN
	r1fAtg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe96wjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:11:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O5Bq1p009292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 05:11:52 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 22:11:48 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280 cpucp mailbox instance
Date: Tue, 24 Sep 2024 10:39:39 +0530
Message-ID: <20240924050941.1251485-2-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s3-qsDgYSzVGav-evNrFBfj2s2RAqcyI
X-Proofpoint-GUID: s3-qsDgYSzVGav-evNrFBfj2s2RAqcyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240033

sc7280 has a cpucp mailbox. Document them.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---
 .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index f7342d04beec..4a7ea072a3c1 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -15,8 +15,9 @@ description:

 properties:
   compatible:
-    items:
-      - const: qcom,x1e80100-cpucp-mbox
+    enum:
+      - qcom,x1e80100-cpucp-mbox
+      - qcom,sc7280-cpucp-mbox

   reg:
     items:
--
2.25.1


