Return-Path: <linux-arm-msm+bounces-62076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA6AE418D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F17631891583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611C724DCFA;
	Mon, 23 Jun 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZJDX5yS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC924DCE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683874; cv=none; b=lbWnzeh4ZwgKjo4ol5IyEybINCu9D2MrS8hDDrrHIA1UMgM2xa1DMKqsnxp7cBGE+5NNYPoheMyKK3O6G0DlBbopYJLeRMfLUPJaOESTLXgG3//VZxlbVc989DWokKxPRRx+esrF1zA62A7JJJQE5QGItdCpQcgAxOi592V5xII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683874; c=relaxed/simple;
	bh=ABdaqENSYXTRrd7yvdzoF7IPntxPkFmQXQe0yMEyiF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RLfkbmfI7aFdZ3itAqmIZWilMO3pinn+CRq4mnOFPSK6LXTz1hRs8YAxYjji4Vfwse03+eCr3Obj7tTa65g2sRdATj+OSJUqhLKhE4th5kixaBKbTHCsnM0bdp+b9Bd1FoFHg63XaVVAZhLM1v85xxxWWUgRAksj/RQEvkhY2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZJDX5yS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9X8UT015282
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pHDxcJKGh2U
	UCfNalxcaB+TVZcoQtFA5ClAelCMQb4o=; b=FZJDX5ySkicGCxpZrKDuvXe4MXS
	QCHVE4Yb0QgK+DNL2qmhp9/Bio4nl03xoYkPfasiuo4qZeXaluhwyn4WjP/6WTad
	X2kNoXp+/zJaEWfsdlUcX3suJj6QQFfIDbBNKiR5HQHcf5N703HJBHzVbCwjsbCM
	NZwLFaP3a7yXgk61+9hs3o6geBX6fkJg58DwducQMxDG5wFvXEiWrx3nB1aGiOaf
	yvzCrwnZNfxDdeHRNGmttFvoj/cuBpWkOTRZMg8TMcHobjOG+MsCEECocxvtVi4A
	x3pQVeiXN94B52E044qvMShTVua5GQdBC8U52htO6UG9GVBbexv/gNFo8XA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5htgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:04:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f569321eso77363b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683871; x=1751288671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHDxcJKGh2UUCfNalxcaB+TVZcoQtFA5ClAelCMQb4o=;
        b=RQj1Z5djr+hXJj/IIfWgnLcw0lmssIFFpXr/FCGth/RX4kPjf5HulDyIxwrU+dx3kU
         lOkzSUDUiFTBzBYJJSVfLCO3FnRfJ1NRk0sMTzSLfuW2IjgBAoJkNUaaBwkbEWc1OCne
         zBicX2r3mUteyUVOXkGGcnG8i1lRjU9dj6quhd98NZO9eVeZa7bshiOzGnGmNUDuk5mx
         HNswmQ6/A8SUBMlMqRZa5jN8Sd2GcL09oGJOcBRTJB5cOHN8IAqkvIpMbB6Fv1PMOAlo
         FNfYuBQPNf3xALvq93n0yNdE9DSvxxssRjzNOl9zQWeCJRiiUX4Cr03+dacCqJiQCwyt
         n2YA==
X-Gm-Message-State: AOJu0YzRuTrVoDaBAbH23iFFRLIgfdaxxjZVQhFau5evh0PP29y4jck4
	I/CZzUsj+lez1lxP/RMrDmtFU906isAkmU8MfZC3UL88UkrGbGbNlkRuD/R6gZLzNlYHFJ9KJsZ
	anC8JDldCvKiuU15Shx28t0kJLZh44nJzUMUXBwi8P9O/HYZm11ljAR7DemjnmuDsm0Bg
X-Gm-Gg: ASbGncsDUkTAwevYvnC/kfvu2+b8XwwZB+rFA5myI0kGHRXxKu0xn+Us1/kflqPxSLw
	M4Z5fZCiLJmHS4660MetLLCEazkWEbnH/v5cUS6Jrn5LfzESEz9e6g0z3d2vhUQOd5+OHjt6Kvc
	A8B2O7dswJrOdLCNrxJjwjSs46k76iNYSwtvMRQb/+1j+RC8GCvcBikoU+iJ58TecHUd6OSTAiK
	+Q5Z0oPUxZxUxNEdoAFZ2BVsaMdQ3phWFIKN5QnDrqii7yKSQKmCxVU0qmhO8Xs1gICHDyalmB1
	CXaoxU1R+FxEUbJea5+ErFhfQRrLBKMeoCwjo7olqVnQjjV7HXpKCQ==
X-Received: by 2002:a05:6a00:b01a:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-7490d6a1ee6mr4405861b3a.6.1750683870770;
        Mon, 23 Jun 2025 06:04:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNx2K0JOd8Kc4Cd+tAf/KCwgszWamGgd6+OdAtY7foj+ETBqCEPWjaYrCYrTcfXyaWLXngqg==
X-Received: by 2002:a05:6a00:b01a:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-7490d6a1ee6mr4405843b3a.6.1750683870305;
        Mon, 23 Jun 2025 06:04:30 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8b2sm8713437b3a.16.2025.06.23.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:29 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK board
Date: Mon, 23 Jun 2025 18:34:19 +0530
Message-Id: <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pgkNloWwSl_0lAT0bn7oWfa9-6sPtvq9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3OCBTYWx0ZWRfX3/6oCRTMxJ7/
 nBAMytFo9ZxJ+g06XoCaeoEdIO7zbVbToe+lFTpbaSX/jh9CJN5twy5kUY0kAwc3D5b7plc/nqb
 oaZW6hCa9QbGXFSYVzXTHWKcnXJU+Lhgdr/8LX0tdH27sSo/zeOimLcEJLpKaW7Wyb6k4bMEpN7
 Cwf3Xy/bRcUzEmpRKnhqPjNh6YGn5PqRF5Iuh92Aj4nBcG0AqsmmFMNiTZ7wyIY98eisaXg4ZYr
 0jPStV51fIHFG1v386gfbraxiVlF9tR1qSr5ALRgnBbOJ1e88+O9ut+AvvEdwD8DgrbAyFpY2sB
 vGqHYPv5urs5peOZ5YX4bgk5ityg0LGWFNuoKe5zJ//SuVn3+CC7VMNPhlLwCPPLRozDuzTiQFw
 1lPCg8oQNZ1EsBsJ/jKnRKxPAntmG+Sog4U6d3LWh9LjaDDVdr8YCMcgGWF/Eg0JbuAoVj6Z
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685950df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_mClcNrwC1fGIE5T0mMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: pgkNloWwSl_0lAT0bn7oWfa9-6sPtvq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230078

QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
which has safety features, it doesn't have safety monitoring feature
of Safety-Island(SAIL) subsystem, which affects thermal management.

qcs8275-iq-8275-evk board is based on QCS8275 SOC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b14206d11f8b..19823bc91a3b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -54,6 +54,7 @@ description: |
         msm8998
         qcs404
         qcs615
+        qcs8275
         qcs8300
         qcs8550
         qcm2290
@@ -935,6 +936,12 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs8275-iq-8275-evk
+          - const: qcom,qcs8275
+          - const: qcom,qcs8300
+
       - items:
           - enum:
               - qcom,qcs8300-ride
-- 
2.25.1


