Return-Path: <linux-arm-msm+bounces-31542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11574975F50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 04:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E01286C52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 02:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D483C6AC;
	Thu, 12 Sep 2024 02:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BIWfbbqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8C524D7;
	Thu, 12 Sep 2024 02:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726109709; cv=none; b=qUJKL0tHpMobdjxSuE9TtKntZ9g3SfESWxuodp27kJnSZOziSynYLwaY59o1Szp9pSQ+GMUjP4J9A61agbPakFteH6TyZWitmbUC1huzGxCFr3EsiuR5e50gCtXS9Rq9tlG4rC5mLu+LbAiq7+QdG5rPebS4vR42fXUE9EkYVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726109709; c=relaxed/simple;
	bh=vuNi0K4I/I1V5v2eSkoRmh2Txah9Ac8BY8QFcho8GSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SkmiDosf7eSDrAnzi6Gu0pcAfHl/NWTbX4KJ/Ag8W8tjumyvLK9kBHNjzoN/yhYGQWmD/tpNzujpwmqKccuZ8nNgQnALcVbXqlGXtk7fAAuRIJDBjK0KguQnAgsrh0iBRvvkc0jGvQRrZ7TiK0n4Kb2hLT0ubRoZ0BVM5Z6W1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BIWfbbqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2Lh3m015140;
	Thu, 12 Sep 2024 02:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jDTrdjTDsdCnjSMSh/Ry8S
	IJ2opiRhT39K2mPMSa7PM=; b=BIWfbbqiIcbxm7aOA23FyNwahoCxaeZbObCLQ+
	Vs9Yo5SEbKbsaC9SHUTDwP9UToXwwPzqZ0oPT4XCwLc0gClQojtpKvLfoip4J3sD
	lKrwrBW990AZDFfHmd6hOHM+zYstPtqpkmvMgablXeYgZjxSzVF8lT1BCLl/cMsi
	dYmOcYTEkiNLCX+br34H/dQglQkMl6FqQoKB6RuGR7lXiQX0ufwkDaujPqaSmtOS
	cbuOWhLe4ah5wepZuXcRbeSPaBujgNJ0286SQNeO7ARVHGEmkd+zK3LtRX4kodpw
	kG5iddmEsIj92rOS3ek97Lczlq5wFP4i2NUf82CkqdivKufg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy8p3q6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:55:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C2t22p015473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 02:55:02 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 19:54:57 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 12 Sep 2024 10:54:41 +0800
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240912-add_qfprom_compatible_for_qcs615-v1-1-9ef2e26c14ee@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAPFX4mYC/5WNWw6CMBBFt0L6bQ1THg1+uQ9DmjJMZRKl0CLRE
 PZuZQd+npubczYRKTBFcck2EWjlyH5MAKdM4GDHO0nuEwuVqzJvAKTtezO7KfinQf+c7MLdg4z
 zwcwYa6gkFV2uXO2sBhJJMwVy/D4StzbxwHHx4XMUV/itf8hXkCCbEpXWhYYK9XV+MfKI5/QX7
 b7vXyCtr8fSAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726109697; l=1155;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=vuNi0K4I/I1V5v2eSkoRmh2Txah9Ac8BY8QFcho8GSY=;
 b=xQwbuiu3MSL6FfvcbKqgQMuPRywc5P6gWRCbvDvyzt9mA6shHO3Z1siC8dHtWmWnZriUv4QaX
 ZpTrkrHBthoDHbJc8YnVlNRYEvBupa9GYeYvCBqyrqcGa3qRMnTeGdc
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vh8ywmmsSbegP6e0-7wOx4p5pUQM8Abh
X-Proofpoint-ORIG-GUID: Vh8ywmmsSbegP6e0-7wOx4p5pUQM8Abh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=502 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120020

Document compatible for QFPROM used on QCS615. It's compatible
with generic QFPROM fallback.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
Document QFPROM compatible for Qualcomm QCS615. It provides access
functions for QFPROM data to rest of the drivers via nvmem interface.
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae4..38e0d50f0e1c 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,msm8998-qfprom
           - qcom,qcm2290-qfprom
           - qcom,qcs404-qfprom
+          - qcom,qcs615-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom
           - qcom,sc8280xp-qfprom

---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-add_qfprom_compatible_for_qcs615-e3b02f6fa71e

Best regards,
-- 
Lijuan Gao <quic_lijuang@quicinc.com>


