Return-Path: <linux-arm-msm+bounces-39995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD89E1238
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4808D282A82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9069D13B29B;
	Tue,  3 Dec 2024 04:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pfE3mqjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0427A32;
	Tue,  3 Dec 2024 04:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199615; cv=none; b=i2sU56XfXDa1YHyjmW+5qO05oHoZLWFwkRqpnZU9Z2L6H8mJFGiW56becCV/gx1G7H2lgMzPiHhrdboTmXXVWKIsrXkzEev65Ollh6J2i0t3j5eogHVCqMs7DgGu+PKlkj+RRjDb1B3i+4zk9X1fH9Sp2qrsieQsC2bgNGaELmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199615; c=relaxed/simple;
	bh=1k74yh5rMWor9nCD5PeVEFmS/qSH1qXubMdHAr4kg4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fFdhrdqsOHXxbCwq8iLXxbGWRfdBz1gyiyOUi9KizhWRQ1WfBNOvGTOG1eNOL61KthBeQzELnfPWoISXIZE14LRb9ZrRhowDxycOVBxSMD3p8uPXI+K7fdRMmCc5em90FzDZ+BJO8pj+mvCHR0nQy5kJtvkIM0Q0xuKIkzi/QjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pfE3mqjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2K0u0D028930;
	Tue, 3 Dec 2024 04:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owDSHhy8Sr3+CM51CcotyNAWcQJ8/9cPHNsDP/LdFTQ=; b=pfE3mqjVKdhkq0AE
	bsm9/pd4+k8Q3P6Li3/cqBioGbaoiP0MSaRT+Is4WchaIRKVIgQF5acA7bgFnLBV
	4tV7xqPgNyShxoD8/K/3+JScB5jg0bLsjkVFiOv5S94pc+WD36IwS+Y3EzYceNLf
	0ZWXhiolPSOH5nAffUWaHBspvKhNxcdaO8jp7YVVmvOWNuFLFVyiAHm80EHvmRdu
	MvwOomyTqNNMgnyBLtSSAaJShvE9UPBCm4L3L8/iqd73jJA/4ofF5DlLXQO6TxDB
	kaASJ+jGEst4MAsD0+w2QeOn0OlrAFL2tZZpOKOtGT2rF6I04o0rgZt2iwXtEZQ0
	ct7T4Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstesja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K70c029965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:07 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:06 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Mon, 2 Dec 2024 20:19:23 -0800
Subject: [PATCH 07/10] dt-bindings: arm: qcomtee: add QTEE driver
 devicetree binding for TEE subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-7-f502ef01e016@quicinc.com>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8lovn5mFuGbrdZsva5UXpvSHwQRofjvf
X-Proofpoint-GUID: 8lovn5mFuGbrdZsva5UXpvSHwQRofjvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030033

Introduce qcom,tee compatible string.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 .../devicetree/bindings/arm/firmware/qcom,tee.yaml | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/qcom,tee.yaml b/Documentation/devicetree/bindings/arm/firmware/qcom,tee.yaml
new file mode 100644
index 000000000000..43b7e8ac944e
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/firmware/qcom,tee.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/firmware/qcom,tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TEE
+
+maintainers:
+  - Amirreza Zarrabi <quic_azarrabi@quicinc.com>
+
+description: |
+  QTEE is a piece of software provide a Trusted Execution Environment using ARM
+  TrustZone for Qualcomm SoC.
+
+properties:
+  $nodename:
+    const: qcom_tee
+
+  compatible:
+    const: qcom,tee
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        qcom_tee {
+            compatible = "qcom,tee";
+        };
+    };

-- 
2.34.1


