Return-Path: <linux-arm-msm+bounces-113803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1nErIj5pNGp0XQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:55:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD176A2D1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:55:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Axafv3yF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WuckZSy7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD0013040AAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503F5343D8F;
	Thu, 18 Jun 2026 21:55:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7432E7373
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781819700; cv=none; b=Y3OPZ468qBrfDEOof5LYQKgEDyKlYWfEE2eg1pt/rMCcIz65CZ8enFyVAH/ZAijw0EaITWQiRTCg9Civ4g6YyjenhvOjg7TUBlR/Sq40oN87iCQbD4lRPncDUyYLWuSQ7PygoMzHe2cDxII0XMo+H8guwrWZp9tWlLdMgdHF2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781819700; c=relaxed/simple;
	bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EgFK3rCcG/XyC1n55QmB7B8zaWxk9P9yTarReATVyRUKqygTTQ7TVUOKwtWFqHZNH2RRRbGk/AtWSEROC6bxLaHdGrLOJBAzCc/bDlsMb3v5UHrY/MkmWfWrHjim3vh2AMf7UE9CV2ch5Nrj1nGw152v5osR83paZBXDo5alGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Axafv3yF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuckZSy7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsOxQ3057041
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=; b=Axafv3yFYhGTDBja
	caW9ynt+lQQASx4Rx6+qpShoXoHAt/Kc1REWzAuwJhRSObNUSAhbd63KRrpXspKy
	oO46YoMlZ2Gr+Z+B6Rz7NKncdnUJq3164ibHiP3Oak3KDhaO2nelP8Fpq76iT6Fy
	AimVXoLCiHQo+Dmb+B27EmYYBHiBzblMYOf4pB8gZ0iowpHu30Y3Z5nJoyhZtS6m
	4LxDbLSGv544heKHv+jNNcpRNOqmKYRSm09EL7Oeo9K3DWQ2SuqtG24XoUioSYSP
	5CEyqk9L+EIN2eF9b4vr6cYwUrlL4cS7zrujh4OdA3OUs9byL6w0VL+7u6MDEOpR
	yLHv2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm229gad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:54:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-307fd7138b1so2360882eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781819697; x=1782424497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=WuckZSy7GREUdudbilUwDQFa8c4z9cxosGbVqXK6Uxrjx5YgkdZ+FrxN85C+BvL53M
         44GEcYmwgs/uedLPrUMjOrSBEgOTM+DeCas9rgFrVacsPgLAQ+RczEupdip7kGDd16SF
         xQVh1lqilaDSwSAXgN9HgqUTuoCmkeXjmg2EYLK7BOcj7HuIyiknG7RtGeqpXLTmhzcx
         N8KKGkRMz7fEEMpJ00KtyTZn9CF1e74uRsIJEoJ9bjazxlUodcjsctD00kV+nlJuo0xi
         Wyvegj5FaT6n05C3TAnZ0D0Yx7rPqt0UvGRBDkgyGnZEq7uwwgQBeRVAL+k4Sxh/Q8km
         rhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781819697; x=1782424497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CejRKYCepA3wHJyI7z3przBFZdBI82v5AnF6z7P2JuM=;
        b=VDxeNFZR/0NSJbI0vAgpHbJtBfAyXsGNFCiq86CahKTf6sGpM9pLK3zXruRjn9/anl
         YoePHLV1+mcRJODku189HwoWI6MT8wg9QM/bbVyVAB0bPOPeVjfbIO1KRYwJeMP8JRvz
         LZoWbwb3uNhhUyqtFMOFsKXg08XsOViULlA4FTOqPS4Ktvfb4/SQRBOKz9BzVrReI5f/
         30F/MVnQJuYzUUCPlwItvJC16BuTkZoTV6ToDM3CRNKAfk0RlG+j6aryroWszUTh4N/q
         pQaISTlhLvbE3X8NGFYpFalYbHfUL+f9IVRVOgfz6KyHjE+55SARySO7eLWErR40TBcG
         fIEA==
X-Gm-Message-State: AOJu0YwGxZjIbXR6uAgbI3M6OVFJRR3Qk6X3IuuHKflj4MrP1kmDOj1e
	pbGDVzUhw974aqr1EgbjfIJECDvoIYvtBVVLjGrfExH4LHF4adqkqGjxPj+mA+pQY/bJx0Zpd+r
	axI1fMmWasOm/zFaXBc2VKBo7H0qHGedIKYCerQowcdnlukLrmo3AVuhpXQPneNroLL0OB+P+jA
	ox
X-Gm-Gg: AfdE7cnbj4KUvtjvXUqJsFVdwS5NR8DifVtFfgGTEatF23YX/M/0hBpCy3kCGVTL3x2
	ATVF1m6CLJQhPm52ZwvTYWVu79zCyKc9gkHcqkLfSJRizm0+JyYnhUa85XAZmEbI3Q7Ddb66Sf9
	WQRYce2pN34jQ82oTFwTz3LHzfxulLaxafugN8Z6kX7OvLdhZPQ22JubfIWG2s0ibcHWXfhBZt6
	bB0r2eHcLP1DRfWGVXp5+KsA8D1PAdBpVQoYcsu7rx/ifY2Lvc5/6Ond4xE7wJ3SbzQXQlvzZ9G
	XPgOgMTZgZDU1tplNHLrfSQWXP1Q+CO5NOURluu424yKPhUJVOEHuf4oSYAhG6vJ/lyK0EnRPxU
	qUV5jOtxfZlC49yeUwwdVCiHUqh7qJf/1hbO8DQSiU1MVGpUB
X-Received: by 2002:a05:7300:6422:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30c0716e2d1mr1044226eec.29.1781819696881;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
X-Received: by 2002:a05:7300:6422:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-30c0716e2d1mr1044197eec.29.1781819696383;
        Thu, 18 Jun 2026 14:54:56 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0670a1b4sm619430eec.8.2026.06.18.14.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:54:55 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 21:54:36 +0000
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 Hawi compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-hawi-phy-pcie-v3-1-3fa42ca45ea4@oss.qualcomm.com>
References: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
In-Reply-To: <20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781819694; l=1854;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=6HzWQm13sZymkwJ60yMD4i13qBHluKrBXZyYiKMTzmE=;
 b=BkCn3VM7TaiqbuAWyYPsysTSOcH9CO0WFT1wQrmZ/o3knI1yRH+WUA+x18r+VvqNE9BO9rKFM
 76aBMuNCVf1DZMGxf8yNQPiSlJcZmDsAu7aRmbHivUdYxcj1lxqrehI
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a346932 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZPVUbJor9CvCRQEu2k8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: JGMhBdxlZZpICxfGn7AZRTkcQCulrYap
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfXygD/1xxtCofi
 0yOOgfGNr2AfNUaJPTNcbdZjtb3g7taNuJK6SFPPjXMAsa5rD9N7gj02lDo+zCcnLDhqZRiVkfH
 g6WO4PLn+7KNSP45lcApZdjQBFqg1kU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwMCBTYWx0ZWRfX1IiyR3QSXYJp
 H/kzA7rcOBKCO6Xnh+QPjn+IQhmKsy0m0lvJv3QA97GXD7y4YNvFKtLzqq8weHnh7lZ6fwwmfPC
 /Y6sLSDnmMq64qA8QgbkwQTAUBsax2gtfrUB76T4MjNK1DKAw9lr8HDjx4aogAS2iSDRUYQG+56
 9YHm127UzrZFny79itLeAuz7ELTcrGr6fGSqNR/cQpdBVYQYn83GLe2Pa4ftpSszrIqL+6WVpXg
 IVM+yb80fl2t3Xlt0ITHYbc5MyNNFnzzAKLSLdJG4KE7AIT9qhQCmdMnQb27gS3HavQNa03LSsm
 Hf60wG9+70smoMnjf7C1Einu4SyWPeh6BuHN0vyEV2/ace+/nvNDwLwXJjGn/VJcARwK3JRMr/s
 NQtt5uc4ekUd0ZE/uj0Fg25wxeU9sMTkXDvY2M4N+F+YCe9rJD0lpq8vK7r6h9PvelBEeTuwRc2
 WrNjbWSnGzvfGfEJLXA==
X-Proofpoint-ORIG-GUID: JGMhBdxlZZpICxfGn7AZRTkcQCulrYap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113803-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDD176A2D1E

Document the compatibles for the Gen3 x2 and Gen4 x1 QMP PCIe PHYs found
on the Hawi platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..9e9e34a63bef 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,hawi-qmp-gen3x2-pcie-phy
+      - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -183,6 +185,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -208,6 +212,8 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,hawi-qmp-gen3x2-pcie-phy
+              - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy

-- 
2.34.1


