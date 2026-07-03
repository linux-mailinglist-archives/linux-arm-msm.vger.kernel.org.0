Return-Path: <linux-arm-msm+bounces-116262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2BUWKG6IR2oLaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D1700E89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 12:01:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UQSzdkec;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CnUYcxCo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B23301571C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AA73B14A5;
	Fri,  3 Jul 2026 09:54:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5789395DAC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072458; cv=none; b=q39oO2vQGYjE6lNF43VmgcZN2Y7pddjk17LWIsW8gaMnfsF/IBmQT+ncit8OpmjgsEcsrvyOK+NwOXUPojYJfryhu5AInjcj/AlVpm+eNlGt1RLTUC73ltCipd0AoaaS/SeV5Nwb70TWx7Dx+bBbiB6JZoUgJI/F5IXoEP5lEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072458; c=relaxed/simple;
	bh=RBigZqSD2Lucd1Ffeq4Dp/8N1Gy2Ye66tj8Ngrx8NU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDhGgBCb6zIgaZbvgfAR/Y5UAi8L0WI6puIB6inhu11PQZ6bC0VREJcU524Z/H13HGnYMN8M/dTRN7jv6LfZlUmaIfSuCw27mLxgeBUGqe5zX/Xlf+Byd4p+NPoTm6I5fnOhqry2tJYUnIaDoae5vBfSwOc49InGgWGT3NuhXj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQSzdkec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnUYcxCo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635ruF53135377
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=; b=UQSzdkecz+F/U2gM
	Yqbg1vLaVd/TgJcsDoFPmDamfNPOY47R0/inE2sPOgAa0/eawM5QestwWT8Xnn+M
	t3pfJqTRcq7E0TwkIp4oPuNU129hLIYZy3Oxc1qtfETzPDIEdPjmXMwKrDKCJANJ
	23S6C17Z68bippoxAe3onJig9CJ0utrHxS0GeQ0P2UzGSZSn8JNGLOSXiAKQD9BY
	3sXLzj9AZmLDcgrOlOxIfOZmirBzmEEuVgL0ztOXP10rJ+xTW6r4mBk2tUzkV0zA
	qpWjtzt2zCEzJOy6pJaSaUFrlDygLQ0H/LSILjzPNHV1aajFC5ZFu+vt9bEZZzCK
	DuPBcw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchfp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:54:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c987913b08so5435525ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072453; x=1783677253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=;
        b=CnUYcxCoKttSLMftjp6U87P63+dEU1rstp+hPH5w0/BM+NJq9m1r8keNNHj/MFYUpM
         TjZT70tY1Evq9TEjIvgP3/MSCrA311mbBSOOBdmKuLQgICsngfU+DJQINIO8nIsoUjEj
         DZNlNXsR6j1QYkRTx9PwwZGbEh/HYgzy5GjVNmg6XyfN8aLuoZS1nyWiqegPriD+l3+s
         ymEWnY1lFz7Et83JD05KsEJ+gaHyXaAqt0lvWy5A6RXGas+wN9q2iv6JbQ1JrLKMihhv
         WIZa5MGQHJMAD2KV8CLrXPw/cXu1jTkUD27A1JqJ5YemQJT7eEO7r3TkBIdbbKrLLRtJ
         leGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072453; x=1783677253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=;
        b=Tnuk2xXVExNy9619Gu0qMVgNh9uXG1cylAHwZjF4nWFqFEWsg7ylYg7OZlTwkmynk5
         Wri8S8E68Jmc3DakmvTtFPNRVTJEfgO5rLaSza0dcB/vVMvZQqgvWHuq30cF21uAtvqB
         moq0Q74lgt1EFZwa2bD9HbSOWXYy+hOqWN5j6dB594sM7v2pRfu78lJT7a3eFXXMNRhT
         FRucTBN86ec4+WNoLIUIsdXmg3R2we8O6esQ4YjB/vQoL9BRzbjJRlq2S53hJO/0dMbr
         fSWbmQo23KaehWi0e+QYH1sCSfQqKi6KAwHDpZ9baQLs8BO8FYJPeQOpDaVZ1xh1Hkv5
         LcAg==
X-Gm-Message-State: AOJu0Yy98XNbubP7HC/xkzU4ZT6gVy+kXorf8sjzlpTkZPgU8/ERNB09
	hEbtrEviX52uIp+c5qoC+kcRAn/L5+bFE09pkRol77i2vctixq8Tts3NE0JfAczFENJljfrW7H2
	0bBSrVIzDSJ+7NkHV0pMs0MbjoA42cxDjWCcdfzLD1txF4ZK7fY7zKvw7TPDcA8phylRz
X-Gm-Gg: AfdE7cnpnQUm/G3fFkm/XYA03u2+HFtxqDsvd3aaNe8tZRDUiYStna3m7X5Mb/BxwpK
	V7fyj8SpJEM6PWmBehYzBeC2BXf+IdnWMm6hH47EWh6SdQRJyKdjz9IHNt796/erW/TSWzoGRiB
	qGb1T14BuzJ/SUdfC8wmA+CHLXe730TwC8OOCzgM+gus8Muh6k0SjHvUu/OYnQzoyi+UyPpP4bF
	7+oEztWy9z6YeI4mNtXRu8X65OISw6sDRY84rXNv8LgBxvr/ZZJSL0fVGRiiQgXyEKPPp9I/wAi
	0oIvfeU8ZOWkQq3OquML8lcnFcvnZl4uXcogTFoeZv9ZAsVocebvqSq2CQ2YNxHmikJuUcXJod5
	iUQ1aLOTKnZCtYeakRqFKvvtRo/ohd0K0p4Pgso62Cj/m0kE0k22X4VP6UuE+28zCp5xQrXuYeK
	HMVndDJmzPkrwrRQ3RhG82m/o=
X-Received: by 2002:a17:903:8d0:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2cabf682f99mr51384085ad.22.1783072453233;
        Fri, 03 Jul 2026 02:54:13 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2cabf682f99mr51383825ad.22.1783072452783;
        Fri, 03 Jul 2026 02:54:12 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7146914sm7034515ad.35.2026.07.03.02.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:54:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:23:41 +0530
Subject: [PATCH v2 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add Purwa IOT EVK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783072444; l=1321;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=RBigZqSD2Lucd1Ffeq4Dp/8N1Gy2Ye66tj8Ngrx8NU4=;
 b=FYVJucEVhlOTP4cRQ2zGY48mtDpsOYgmxb9OPl+ZA21rcFq1ntRuTF/tP7PovCrmYDK5nxaPQ
 CvW+EkLjY/mAJQbhNYgHL0f8Mk1O+gmtqVfXyRa705qwHCxtw8tjCkv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: z9zl2e0oTZ5TNNeL_bu_g9lSsY2RJ7is
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4786c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y1ZMbBkP95eM7aff42kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: z9zl2e0oTZ5TNNeL_bu_g9lSsY2RJ7is
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX9NrvS3e+Cpkx
 LuxM1jr6878i80D5ilzX7SKJuqHeYjMkHB16TF8DH5FV5joC0mvfh9qyoBkzGjOpQiGmEQlIg37
 wJ+zK0ESrSt2R7B3P95svEFg1KzDukHmyaB5SUuYVo3GSv5mvo2oIdVaduXi3Ffp66OBTQLXrS0
 Rt+eNlgUyedJo6h9Tpjfve2vR0m9mO63UaSWjo8q6YfQtOXguIgc5qO/AA7VQs29VINXSgpMgmS
 Vmr2pT6UwL4z3vTVFcCuR0+vFGh105Ju3MhQbISA4EoQroa1iNgcQKe/Z0bLmqbqsSrj4JA+vjy
 xyaxbzn6+gX+EJ4BCrnln4+0Z4ogAKprJSA9qo6cc96mCmdAsv2LDsg6vaB32fIYDEY+5GEfy0W
 hxNBbmLFucvUnEIvMYn/8RJal+nfTjN/6K9pIK9CLNNTnCSdmaLokM+JKa7/o6V2PKOPAYQKB/5
 kkWnjQOrTg3PCSGAE/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfXxTyDuIQYXS96
 jGhT6+T9w1sMphMkNlBnk+KcjPGyMmN6rL828N70QhfYW4BsFei6i+f8jbMEXM5pvWtrK9T/q9F
 hwdKfVYTHX3gQOs+d3nh1UtT9Q8DYIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 071D1700E89

Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
found on Purwa IOT EVK boards.

Like the CRD, the Purwa IOT EVK carries an on-board embedded controller,
provided by ITE and running on a separate MCU, which handles fan control,
temperature sensors and EC state-change/suspend notifications. The existing
Hamoa IOT EVK documents the same EC via qcom,hamoa-iot-evk-ec.

Like the other reference designs, it uses qcom,hamoa-crd-ec as its fallback
compatible.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..c07483aa5937 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
+              - qcom,purwa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:
           - qcom,hamoa-crd-ec

-- 
2.34.1


