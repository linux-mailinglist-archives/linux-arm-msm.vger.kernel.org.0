Return-Path: <linux-arm-msm+bounces-117613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 69jCBhpATmqnJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A2726382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:18:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i4I64sio;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUK5wHUo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A57103038ABE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289E943DA2D;
	Wed,  8 Jul 2026 12:17:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC343E487
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:17:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513076; cv=none; b=Qn8ZS8YobPA2X6S8rlv2blXE3PwR7+XGgwqKCBx6f0D4MXxoAwVgFNN163sqk0LA6l8wE+4D0dA3c8Qh7a0YM1bm7LElwjuhgf2dciGnt3jiAqeFcnBuq4iWC7x9NWHY1Fk1wyC9w1fIBPOfggbQgKlopUyOp0ASMynoEA0l5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513076; c=relaxed/simple;
	bh=j9LrC7SvwrGJ5R59Zyt5T1ZwERBRq1xpSs/MEllIWkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obLnPQFqy4b4eTApRfDhVzVWeRrSFN+wiHrAySGDVp3ESJgkPBR9kg36ENcUAzDQowJji4ywKCozTJcO/QxgiveQVFS5F+P9yiZex4zGdm8KNbCH4hkusZbzmMnAFd08VtDb6GHZijWZFQvAgbpRmaJhiv+wJoOGf1FgNvpyetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4I64sio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUK5wHUo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3VX42667575
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=; b=i4I64sioWZOCeMal
	et6+no9jQvaQcNXS9yQNIheX6TR9D6kGiwANF2fgbKmJstJdUA0Kne2f4t0wQ6Ig
	URL2uKbXlUgycjY6PwcLOSSNyq+inlHAYKoApcH9pnGTwZg/EfgtoBijWndfbdgJ
	CCrem6FbaSWWpQG/LNrpuFeYpbHd0HWNJe/2aR8RpkKrA4Nx67FJYlM5YG8GsvGz
	MJsjH0NKE5jw+KzmMYLz6YunCZYp9qIFflFhXRFE758U3digXyundAP7vnjIyLtr
	/u97UMDxBLL3AtGomRf9CrupJPg5hVotu0B9I9NLGOsmTUZXs0QwhhMPM4QFDM0o
	EZVy2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgu3ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:17:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845df469a26so1867351b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513071; x=1784117871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=;
        b=LUK5wHUoURI2zonkc67HtNXyGZClmw7N8WV4eRcQN480DvcQxSBBAhrqY5wuAvn/Ur
         vHPE2UswtEG/OOTSA/6RcPwL3e7x+b1xKpMokQamtbTOQFxTzLQEw3gFaAt9N3qenPlE
         z2aiL+J5AbMBgaQBiILmgNTDIVHAwz9kEpUUhma5YLsRBCct03OpiZE/PFSfEux75l+v
         Q7rddaovSlcEIr3urYAOpvsKvM+0EXph/YBrd7UIEt+MkskKV7Jn1a92Q3sPvwuDud6v
         uFWZplrvnCnK2ydXqBt1C5PzxyHarHrYki99ItFhh3Mtu4z3Rgu+lebJxMVpHM6sqs36
         57FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513071; x=1784117871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwHspNqOIQ2ut6o0aX2sCzUdxZPsOJPL71oa2C3iLow=;
        b=sqkaDiMjbaI18SHXeaSS4RSxfWe8UlBvZnagI+iKQYlivQ2poMz5WHOOjpWqolCMbS
         kVoQgS8QGI1had2EcBmuf287L7qfuH622Cnxj5s5QZN9PTfMjVUPDYbj8aoxJjx9QAjP
         /pAZY/WpVgnDCnEDUpL36dr+xL100divENyNX+frTNSRK0e/+Km8GlXKowTuYGm83T6E
         TDSL0fDwCfavmrBacIK4D3GxeUUB9MZCD8uSPIPp4FcQSTsZdRtWWckR9XnU2noAyBzX
         +UbHtuPF+pzyxeNRxgNwkg/XOCuyIdAdIFbXueN96N6MNW2Olw1Ay1TRaXCTDEUvhLTz
         Q0MA==
X-Gm-Message-State: AOJu0Yxv9FPdfmMja43duC3C+AAHilNHsg0K8RAaAO3bWaFMP9VKmWiQ
	OvxWwbEidQbACsAg/mSPIM6tMpPYvQAIpl+I8hwfUErrTWFXzYd6CojBJUyU4UX/kXD0J63uRDY
	0kP9aboalzr4KKHVl7cYccott2FT9PzxjhiFdsWSDP2vSrwnu8UTlF0z9f1AeLvmtaGw5
X-Gm-Gg: AfdE7cl6swEnzPQ24jpdOxzKf/1cWMVPGPWoIMZWJD+/dzjO2RO0WzsiUxuon+uQJMS
	mdq9I0npNqf4nnn68TQlLt21/D+1jlTtRhojYX3t7f2rmJybzna49k47UKn/X64PdSTgm0bFZ22
	jrZgjjTuqlFaRUa+oG+ybspCy4gCvqVeMuDOd4lczBO6BLjcG2XJ+V2o0QE4hEYnnqovQjem6sr
	FMoKgHSXNPpzpaUIYyant+ZYXceFwhEW38CiFdBUjQked9Z1IymUyrGrGjQko4Pu32QjRBbnH+c
	FYHtE/WGsoc9uZsrg9IMMxyHmLAbi0VrN4w68HKdcuKTQtflrJW+nEMznqDC7bO/adR2zIbG7dU
	RfAx7Y3+WoO3IwPd80oI9QG5L2w==
X-Received: by 2002:a05:6a00:a1b:b0:847:9656:4f6b with SMTP id d2e1a72fcca58-8484323d2c9mr2566208b3a.4.1783513071358;
        Wed, 08 Jul 2026 05:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1b:b0:847:9656:4f6b with SMTP id d2e1a72fcca58-8484323d2c9mr2566160b3a.4.1783513070836;
        Wed, 08 Jul 2026 05:17:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:50 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:47:30 +0530
Subject: [PATCH v7 1/5] dt-bindings: arm: qcom: Document Shikra and its EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-dt-v7-1-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513058; l=1817;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=j9LrC7SvwrGJ5R59Zyt5T1ZwERBRq1xpSs/MEllIWkY=;
 b=L91IVVTTuBYVFSxkhdCViQAlausBGaigd1YeYtRCdEVL0Qlvkzr0oSZhr3a0/rR32ZEiJ0IC3
 cPjcr1Om0yLCDq7vHAqa+hj/7o6O1EaCtstqPKhTmz5zoFuL06+nPbn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: FPtY9nTRBEgy78Qy4rpef-JBBfPmxB25
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e3ff0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nhUW8Zqzme2qF2hNOrkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FPtY9nTRBEgy78Qy4rpef-JBBfPmxB25
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX0AoczmpVSz60
 gQ/QbFJA785H0dYmfwH5Vr/9owWieLMKiYQNvVQ8tnJVUveGF4VlP1LQTWWpLcDCjoOPLtgnDri
 tE79G5UbawcuxlU0SXtjgb+i2hdKDNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX3Dgy6Abn0IZa
 hH1nNLGcYXjwdHyoDXNRpRDaqxKTssFK01Lb6cXO5SF+2E5rGq8I83G01R3Lw6ZLhyPkL4OH3b7
 JkOCT3ocHWr7W43tKqRn95nyA0WPPnVgoX42vQSuZDJ3RWL3OwHZucp3teHggPwz+KEWtNEsDrp
 uKAC6dFNKaKft4FxVZaWe9Lw7/zQfxga4iVngjJtczC576KHwsN8Ew7Or4rFIW0D+JqqB100yll
 gWFuQ8W2m9RnB0U5nz3JSSUyTzru3siIyHC22nFVY9T5jnzMeFPk2LQbtggAm3s3FnTu84FqLAv
 KzNQkOloS6ySV+khvc36T0sUGg6/ZsPMbsB0FnUoHByOiNXr85bGzffcz367JLWD9igzVSaXkRd
 zr90Ic+Ho6C6TCJzyAO6PiSTCdpsOjrzqHA4KXbRZDp0pYZXQpoCoRsrDWTdzuW26pxAjpn9/D0
 nvwUf/XFmXbeKRS+OUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117613-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A84A2726382

Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
form factor. The SoM integrates the Shikra SoC, PMICs, and essential
passives, and is designed to be mounted on carrier boards.

Three eSoM variant are introduced:
  - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
  - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
  - IQS: industrial-grade variant without modem (PM8150 PMIC)

Each SoM variant pairs with a common EVK carrier board provides debug
UART, USB, and other peripheral interfaces.

Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
its corresponding EVK boards.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..b91eea5a0f91 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,24 @@ properties:
               - qcom,sdx75-idp
           - const: qcom,sdx75
 
+      - items:
+          - enum:
+              - qcom,shikra-cqm-evk
+          - const: qcom,shikra-cqm-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-cqs-evk
+          - const: qcom,shikra-cqs-som
+          - const: qcom,shikra
+
+      - items:
+          - enum:
+              - qcom,shikra-iqs-evk
+          - const: qcom,shikra-iqs-som
+          - const: qcom,shikra
+
       - items:
           - enum:
               - oneplus,billie2

-- 
2.34.1


