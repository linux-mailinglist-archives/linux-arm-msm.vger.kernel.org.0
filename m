Return-Path: <linux-arm-msm+bounces-71752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C8B417C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09AE61890DFB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5921A2EA49E;
	Wed,  3 Sep 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QRAngTWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0122E8B7B;
	Wed,  3 Sep 2025 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886667; cv=none; b=nZ03SaPqu4vJJFbTI1peBOs7GqiBSD0gnN9Cu3pih9KeffkRWE0tEOsRaoBexjr1MRA8KOZHC/+KuTUL12dyz1XPlrH6rllDjKvVqX70g3+x8ShzfBUkSi1kmPU2Ak4BTmdlDSKgbT7XTdGPQCPtlJ5OCDgxURrqkumuCgvGd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886667; c=relaxed/simple;
	bh=m0uX5/sgHULxRLzpNmfBJbmJ7yyEKAqhVRRp2QTBOEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lbl4dQfagA9o0W1J6IIw+P8mf8gG1bkAtzsd3pvqb527Euf8ywuZv1i3vL+rtJ0N6fxPcj8DeWxjcfCjgWEjGvinE7x1uTe/absmmCF0HJRI4JEhZ3JhaHUGFhRvG8GFz+q3XW7DwGRoq+Xsh1A5eQZUKErf0utTkXmT27dvqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QRAngTWr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831Xkhn023532;
	Wed, 3 Sep 2025 08:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fdsrgnRU8YY
	f1DFwalUE6naTNLUNZovcDEH5g/trfNo=; b=QRAngTWrR/ZkeTInB62Amj0DPv5
	Ha2kUhipy+lhLmmNp2fNSgkPWp71k8ok/iNAH7raUw7XzFx7MyJoE0ApRy4rxOmx
	RMa0x6Z8FZJBJ5WlmNpqr2iVjp/SmbPBRTMRhn7s3C6b41aiTX2qyda7GGuhN/zz
	EMBlD8uhlQPCtlBbh9HQVkyibSqMYKVTGfxGN77pNXbQAcYG2G+Dc8zCyEQvJIo4
	WHVvoF+tDbzerjkmMNmi8oTMlmD9OxjHaAgvlrm6FQVC4Tt9bnmqysE+BEh11J5e
	iSggHvgLqpIR8Al501xjcy1CVunCFwiraHOhRhu6YKmdjJOveBN4tHgYA+w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpawpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58384GpD011548;
	Wed, 3 Sep 2025 08:04:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utcm1wca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58384FDw011499;
	Wed, 3 Sep 2025 08:04:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58384Exo011491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:04:15 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id E9E005C9; Wed,  3 Sep 2025 13:34:13 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V5 2/4] dt-bindings: mmc: controller: Add max-sd-hs-frequency property
Date: Wed,  3 Sep 2025 13:34:02 +0530
Message-Id: <20250903080404.3260135-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-GUID: Bj5aLU_MJF7Qz-QuO4ZVbs3U5J6CRpVn
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b7f684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=Xv05fe2E4YnGG6AOwTMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Bj5aLU_MJF7Qz-QuO4ZVbs3U5J6CRpVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX5ohq1VbJmsGQ
 ESymRLaaJXeoG17Fpckw4BlGLAz/knATTaO+hT0MV8Dj3nRhmKG6VDj5JCVgN5sm9pn74HMzeIK
 +wxEgKuAeQTi308Ds0UWmUOvpP4VAN/0P3gG23T/vdEBKiw6YFaW94zO5fiMljw7jy7PiZtq9sW
 qhcEa1GdA/0vbQiR/uuBNGsY6kfNTucHRxZxix/jvROA9WMFm49WK514uFE7vVINrQalJb3g8Hv
 yPc/gi4yHFsMaRI6V98fuhHCje+6r70P7haeeAIfqODiKOuKsPnaH8kUXxdW5I26lpAnmKC1hey
 c3MdZBbVrERITdiuNLKNgoLv3EVfvY5NV0XraaaMkamaH0pmuSOilKFdVhuWRbd4mlyn4qJLuK7
 6sZmX1L8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Some platforms may require limiting the maximum frequency used in SD
High-Speed (HS) mode due to board-level hardware constraints. For
example, certain boards may include level shifters or other components
that cannot reliably operate at the default 50 MHz HS frequency.

Introduce a new optional device tree property max-sd-hs-frequency to
limit the maximum frequency (in Hz) used for SD cards operating in
High-Speed (HS) mode.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 9a7235439759..d6b785cb2bd9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -93,6 +93,14 @@ properties:
     minimum: 400000
     maximum: 384000000
 
+  max-sd-hs-hz:
+    description: |
+      Maximum frequency (in Hz) to be used for SD cards operating in
+      High-Speed (HS) mode. This is useful for board-specific limitations,
+      such as level shifters or others where the card cannot reliably
+      operate at the default 50 MHz HS frequency.
+    default: 50000000
+
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1


