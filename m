Return-Path: <linux-arm-msm+bounces-57063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C3AAD671
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68B03AAEE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D933212B1F;
	Wed,  7 May 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eUF3LsDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F37DA9C;
	Wed,  7 May 2025 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600694; cv=none; b=d74ciU+If7AZ2/17pZMwC2dEzzU7gw/llu0LjIaMVVcaqMGof2F91d+RePORzCzDhZgify2zuS2xpDhzLyi5oChfF+siqLc7UxAbdt2vmkd9rtN5Uzs8L9mGUPWBl54+b7iJazU7E0K+2ALmYwbgPQNHYRT+1OcWsxX93/3JPao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600694; c=relaxed/simple;
	bh=iaZZHhMZySSeEs0AhznkKU/ngm8yNCu5IKM92AmttUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGK88d+TrQVnyegwq2UD8Bjl373JT3qtutn8IWsCfnhDl0IneykXeitzCWIH3TgBijk23Zx/tIW1C50xuN+aVYe/11qO05LyZwNJQjqncy0eQa/JYn1BQODELcTp9GTx66OqmskzMWw16ClhYIHq5yCbPFFwMpVjq3wGAxgckXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eUF3LsDO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H37H024563;
	Wed, 7 May 2025 06:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i67vsrLy3th
	yADwX1owKPibTqF+o8PFIz4uJEB2F8lA=; b=eUF3LsDOlDyGMrsagvCmEdrf4K3
	H14hg05DlDIzUf34fGukBVQ/+h/UOyjM8LdPDqVo38Xj7IC1lfHl1HXeq4P+Rioe
	qNQvGVBSYklDvejvny9z8xLkWyNKKEF9bMf8Hlv+EvS0QZy+wROlpm1swSUxy0Rq
	pEctKvnL3YmDUSyxGxv7gl/BaIQ44KaewyCuepXUuzFjdqbUlauI6b3odu3JUAJW
	xGVxgAVvaVXqR23KOgC31kwtVpzO5X5I4wuSzNn3fHrgPhVyJtGlr/E4UHZRvmZO
	n9cNFku8XNG5Yu8uV47KxPk1LqXy22bq6DcUUPoCNU7tzg4OdlYBr6vsJpg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3cq3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pPuL009496;
	Wed, 7 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pOul009456;
	Wed, 7 May 2025 06:51:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pOT3009452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3452F584; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 1/8] dt-bindings: arm: qcom: Remove bindings for qcs9100 ride
Date: Wed,  7 May 2025 12:21:09 +0530
Message-ID: <20250507065116.353114-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfX8fIDgttlClzG
 Rj8Gg9VRQkQiU+Qah0N3iExRjKJPXtlvOL2X/7nB+KKtXXbD8+3j4VAk5CIOpFBc+DH+ApTKePP
 sw+FOzLYKg+McjAGW4BI2wfXCSfnn9FW2RGqbocM+UQcGpd3C6eAdiUIYYk842ZqphdFML9TWXS
 SM+VE/lIg2GvA54ob739FhunCY7cRSBTqmZo4Bg8k+Szht/klMPnir7jPRsslMAq9SNU7y89+wa
 O3JrtYJg/R+/4DK2Bqel2kwRAY8ZbSVl4mOG+bkrPz7KQZMKyAPOgH5Y318PISadFM71K3vtV9w
 auUIap13oam+J3KsB8glpiAT+ASiG4x4HKUgHNUEhGDPcQgjqMeVRWGZfZhxJL58CJTv/i/gwqn
 +znfmKKZ9461m9ae3SwV4fkVHD8a7YsnbKKXhe8vOag3GF/ueHyA8mE/MAMAtVlP8XcbVoZY
X-Proofpoint-GUID: 1na-oLAtK87DXC97FUQM3PkOSqkj86uG
X-Proofpoint-ORIG-GUID: 1na-oLAtK87DXC97FUQM3PkOSqkj86uG
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=MdW1Zvk9s7w4fJUuJ5wA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 mlxlogscore=943 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070062

Remove qcs9100 ride support as HW is not formulated yet.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..96420c02a800 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -962,7 +962,6 @@ properties:

       - items:
           - enum:
-              - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
           - const: qcom,qcs9100
           - const: qcom,sa8775p
--
2.49.0


