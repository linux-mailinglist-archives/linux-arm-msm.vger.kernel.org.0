Return-Path: <linux-arm-msm+bounces-96929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPbCM588sWmAswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:57:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45B2617B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 731A430EFB40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2933B7B92;
	Wed, 11 Mar 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRNcFFVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8jDPApA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32398314B72
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222388; cv=none; b=YvJ7lW550A1jx/OP444cinemKsDAXDq5pjo0gBmuTp+I9U/8bBr5lIHH2DDPPtnheO7C5w26aOMTId1Bx9FRLzcqwYD8+4Sz/Q+6xj9ghcO8qasTroC8SeArSCwndwnFMy5YJJJSto/pBDUvpPQ20u6MEwtSsCCoJb36QhU3kPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222388; c=relaxed/simple;
	bh=wVcoXDFeUyKAEj7Wp41jFOLTmfWi9c0kwmWks3uxC40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1IqetT9kd+0BpBtrNnQiRCMsD/51Bte48AWMb9V3VYcfjAJFA+HGV1IGc5HiMVp/pGzQfLZto4ePWlEgsPBthmFfzP5a1+4YV5wDiRJ6WbnLe4aLIHnL8bhHk3p/Ka7oIfLOh2wyNiM8Squn+FxKnZs1Jzc516FmaJBnzKrXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRNcFFVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8jDPApA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8lBUj1572929
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdAzK8Adxop+WYXouQbytrygK+EysY6Fo59E5Zf9tzw=; b=HRNcFFVwm3e9NbSa
	hzEUcYHFEE5Qh5Ge4dQpYhA4tm8BGSQGupVZh8mYlpPYRQ5y4z4sCck3pYLsTuNY
	P9QlLyQRzsz4Q1Siktbif9iaAz6MKBboQQX5nYInFrRWK+QpI1QLVYgTPnvKqVH7
	wL/ALEfdPfcDunog/o7RmH0CyRCO+ENgTdjOjpkLrhoQn+bRZzL4dXgI9YagyzGM
	YBvMNaIHf4jWB4FF62s8TbnwKh0xZkZIG0PY/B1/fghmufkW2si6rKbSktzNFAjg
	1/2SOh8W3vcyJS0lw4U0+vEOlWm9q4edKuivInVoUnIrHAE3slIcIVkmgGDJEKnb
	k3uMKw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkay4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 09:46:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b7ed8964so3026063b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773222383; x=1773827183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdAzK8Adxop+WYXouQbytrygK+EysY6Fo59E5Zf9tzw=;
        b=I8jDPApATHpsSxI6PsU+upzfoiWWJJEHY5fvxxY7QZPB8k5tYV3jnrib18SK/u4Crl
         mdN9NqkYBguaXg6sONGCJiiOIbWz+eKlN8KuMTvfOS0IsF0EZ7jbFnVA1pfPGn/3VzHb
         quAwheSfOuaCcY4Da8Uy2uxux48WoVXr2Dhy5hv0Gp760A16eRIIhxK8zfDemPOA8RBH
         ioayyLYOKi/Il7CiJYFBxvb3RtdBv8nQjvx75XqKLU7DEzoOnG174sIe+cCWCe9YmX/w
         Idiws6/8ElCuMWwMrtT7O/dIvhBLKYss1DJWf85Wnwe+Qc57JRxsoQtPuOa3NdHuNCzS
         dLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222383; x=1773827183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdAzK8Adxop+WYXouQbytrygK+EysY6Fo59E5Zf9tzw=;
        b=NLCdd5pvldDNRlBAdFckF4zhlMXBhpsGoufp68du2ppqYppQdGNmunmXZ3pjKi6e1m
         QbBjfQcNldGrWjIJSmZreMZbfz5mRTpz9m7ic4kTjrNSFj8M8n38gRZJesr+4Fg1U6FH
         qPAtyBPHn8sFfWP3zSqWRFmBzJtvLMqaq/UwszinVuBVBqX+TOE6oF9Jlk24muqIyoFX
         d+IAkJZA2scFAtW1LN67/OyIsrL0MNLtGprNgMFpmUYlAgL2iqq9zh7FGQwSc6ppjQYL
         l9ak1CvesjXSzjIX/49RpiFbJEerUHGspiBDON//OwS1BsvbCdmTfJnABNNdqOVbfLV7
         cavA==
X-Gm-Message-State: AOJu0YxM/8R6Hyw2yri09lHl1q0Y3L5xdCxoGXrB/G1xal8pCTvmnZ+H
	J4nXJZkzE9xaA4OmLvAdqlcKZJUMrUK1lVQZ1K9ehtbyz/zpzzoMp4rBgzm/hR3jA1IKg0usW8K
	FZqEh+JmeSeGdZyOHF7M02BI/lpVUZyzqV6KQ3w5ZkG+JymRNx+AEXvbtZBWPpdtiRko4
X-Gm-Gg: ATEYQzx6dk7sQZIzm1kIbn522JHcM2d/A58L4cHwuE+w1hiY+Bv9/uGm44PJkoOYCMD
	o53tRFoYPsAzhiWbIhrhK0/i4IEgne/is3GWrl8LKhBWCj/p2nrn970tbPyF6lB1cXJjwqGyZ3c
	0+JyDGbuP4qq01kQInO07+c2GCP94BTp+FbutS3p0rE8Ibogg+VOGz4uTcibBc5tuBjaLtVykxF
	shCoAEBJJgftG6sSL98Ijn4bAt1vxmrlgsKhBkNclhEVJCvKih8enkEUwau/9ZT8FcseeNxdqcp
	Zwqrd1jKfcPEre6lZtaGTiUvDoNZ8U5dbZSDMOSTAB+ogk+XounFu6/w07aWv7X4iLD+vVa37WU
	FK8q605sVbMSGhKOYVtTfewQI+AeFN5bVUZP2F5OGnOZkekdJyZDeDDQtam12HMxAKWL3I6p3BR
	L9zpUMRACEXU1fYPtX4QAjkJ09WHi2CML2hL/4k+DmehHsPSVY9rNokNJk
X-Received: by 2002:a05:6a00:1399:b0:827:28e5:63f3 with SMTP id d2e1a72fcca58-829f7101c58mr1891264b3a.29.1773222382882;
        Wed, 11 Mar 2026 02:46:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:1399:b0:827:28e5:63f3 with SMTP id d2e1a72fcca58-829f7101c58mr1891230b3a.29.1773222382426;
        Wed, 11 Mar 2026 02:46:22 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6df5ff0sm1677403b3a.21.2026.03.11.02.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:46:22 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:15:47 +0530
Subject: [PATCH 5/9] dt-bindings: qcom: add ipq5210 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ipq5210_boot_to_shell-v1-5-fe857d68d698@oss.qualcomm.com>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773222347; l=879;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wVcoXDFeUyKAEj7Wp41jFOLTmfWi9c0kwmWks3uxC40=;
 b=CW8qrfjLdvi5KW/Y7s1g11eN9zOs9oWLne/pmovU50KXuX0J3QHf7h/Vw4JsYngZQrbaeYNZ2
 YhoDJUDkmruAu0u6qi1rg/a2rMkE/oEXk8vHAfxeXRu0kh7Ue1aaH/M
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: zHNZjjtCoYsh4fcvOjLYYsTV-51tFZlK
X-Proofpoint-ORIG-GUID: zHNZjjtCoYsh4fcvOjLYYsTV-51tFZlK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MSBTYWx0ZWRfX8eElTmeRbRC4
 CR0w0EA8XljLYHsm+xDgHE2Yqlx55SutE0+GEXe/5oPYCp2ePna7F2JsuFxBBNBbhYVv2cQYw/U
 1bYqFc77xYv3PeyYxmLd7DGi2GLCM3vuCGMKizJ6OF8WfKW5FdRsjFZAwAQFUSFYtYi0++QUCYP
 D59Q6jtfgc7ePklmHhGA7Jy/C7ShAKDS+QUoxZ0SgN/jrkuDppG306P7G3Iop/XoKYrOygT92zX
 IeOQPy7nIm11VN1uxpuX1sRBzgcXCJyXo4/hD/98Eeef1FLZDmL/qps4Z+bHTMcQPpzhwrNIh0c
 ZvgPs0xKoe0D5zcVhF/o+Ds3oUq67urnIDuQw8gLYeb4wGTu3PtLktle11P0fY/oy3r8y+wabFS
 2s0do5GBx7lAkVf/FGd/4zkui3JUCf+GMrOSdEO0Ihr7xEpxiqf7L4jM8t4CBm47l5R420GhWKH
 ndoDBxqOUcfiYPRzlMw==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b139f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tVH_VOG3TRHTz8gau4oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110081
X-Rspamd-Queue-Id: BA45B2617B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96929-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new ipq5210 SoC/board device tree bindings.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d95acd4a424d368a481aa49d66449f784cf81986..9bf291511bc8910f0118e2e804c07c02770d5fd1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -309,6 +309,11 @@ properties:
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
+      - items:
+          - enum:
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
+
       - items:
           - enum:
               - qcom,ipq5332-ap-mi01.2

-- 
2.34.1


