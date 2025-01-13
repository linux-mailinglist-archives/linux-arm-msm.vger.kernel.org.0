Return-Path: <linux-arm-msm+bounces-44919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C9A0C393
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99BE1188964C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3350C1D5150;
	Mon, 13 Jan 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bt//E56B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E561B4159;
	Mon, 13 Jan 2025 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803352; cv=none; b=SPqFZJLIywtyygn+SCYxqqz4d018uSpEVlzS2wuGEtQNSertQ+xKLIMXhBBdw7pV6ocOc8TOIjDPiIcyDRlonNu7CLOblaKzPV2e0JtvB3s8i2q9WBRKcwiwyn1bDcao3Cphk+KyJfqOKFoB+UCrSHWPXMpX9vMJbBrbb5/u6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803352; c=relaxed/simple;
	bh=zRoCPnOC7zNJnpDljwuV/XUmIKlw9XQwGKmI6KkpHlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oUYcZFROxRoTAVEIYpcIn7KmKlP2ZXn1ygtX5GVaPU69OSO14xPGYuY3YjJRa1tpr0qdrT6OUZFuIBJ6IROHvFhUEEuPFgpNtMrUWl1/kOXS3n4hVpmVWy2aER1I9aA/uBZl1sunXp/wtVgy204JMMVdDmOZBaTTd5Rue7zLJxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bt//E56B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHDdNq014884;
	Mon, 13 Jan 2025 21:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fe7DHJyqAxzu+kauepmVdWaj08AJo5ZJsm3ZngFib8Y=; b=bt//E56B+NPB6NR4
	ApbKvBKre/xVBkXNf185BGEGZ4FFgTEoTXlBtzWV+jHaSaOCIxT3f/i2He4oMDZo
	63cWlD0GGr4v+3/XDw492MLfC52C8avOX3bAxElKoW7J6W5zZ69wV6xAUzD4qQxG
	JfHaIxZDssKagwxkYK8BnJ7rpKsBsz+GKOPCzSB63ykX6+jJMAilk/NVwAzZXd0B
	henE8hw9lOpc0RmTDCpRpjoMJp0IvHh1+liLRDRBb6jtvaOokhlWT0JD4+YiaFHp
	yJIfXfHqeKxHMlMxfMQWuGqO7i3oNB49LH7uqpcOmzO2ZbrD0HboCzGd86fa0bIL
	RYSFSg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44571yrh9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLMRTt027105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:27 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:22:27 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:22:22 -0800
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document
 SM8750 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_gpmic_master-v1-1-ef45cf206979@quicinc.com>
References: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
In-Reply-To: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803346; l=985;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=v3sjtxp3H6+ZOYeU6Z81Im1ph73RG/tkfoXhkMrT5/c=;
 b=xn9qfWAgltLHOtuQTef39NETuu2TM1zz+Q0i1qvmQUxHFAZrgLTOBMbhgNYGZy71gYwTcaPXI
 +P7DrwjBTKIBDNMREsg7hUtovjxCSoID8papimE/tJ3GGVsgHYoBKDF
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LJ-SDIbXeP42RdkG0PwyijzjNaBjzu2S
X-Proofpoint-ORIG-GUID: LJ-SDIbXeP42RdkG0PwyijzjNaBjzu2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=966 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130169

From: Jishnu Prakash <quic_jprakash@quicinc.com>

Document the SM8750 compatible used to describe the PMIC glink
on this platform.

Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 2d3fe0b54243e8d912d2aea637dadd49a02f230a..4c9e78f29523e3d77aacb4299f64ab96f9b1a831 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8650-pmic-glink
+              - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink

-- 
2.46.1


