Return-Path: <linux-arm-msm+bounces-114433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2gFhOE+MPGoxpQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:02:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55A6C24CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:02:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nw94ETJ+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="M8F9/1Tg";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114433-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114433-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8CA30C869B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 02:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBF43A873A;
	Thu, 25 Jun 2026 02:00:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF823A7F4F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352850; cv=none; b=LLXrVZRJgEvBQs9Ywf8vu0x5fau7KqbvfWDVRMw2eyY++9mTGB7N17RA0EVzIrU7B3QrZuSIW0VpytR7pS+TR2PAfaWqkRXORv6bwWzE2exYm7q5RZKinVvN+Aup0zAzgI0FO3+wx+kJMNymIfpYY08+WeEZVX0gpS2cSunBwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352850; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QI7d6P6ukRCSLPydqG1iCM4R6sv1Ct72dtLDoeKUaGnqpnE7sqI85NGm0k9U2WjA69kbw2Bldi8K7uO9ywbWxUso0AG/ega98CtHpNIh5L/W3DySnMQt0Z8clX9Hsqf3P3bDPe0rPwnURGMAeCRK1IoM87ckU9oFGhHHLzjzP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nw94ETJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8F9/1Tg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqcjK366631
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=Nw94ETJ+BM4TaZRu
	ZUFmUCB2c69twa3XAWukijHgrqfHzSrgXNxFpf0ppVGssUmjIFd/tcn3/vxj2qJT
	nb7SO+y8GF2YHuoLshphnV1JfCXm3LsQEaRf94gHXBpsBa6zTRLMkrRTkU9bZ7ex
	Xe0l8gHszTwdFZlNS1OKN1/AoFFDS2IMpkkGovXW/cD1oNXXnw63fZUye63JiCdO
	ywL/VyLi+6bUuJfYxgXSjAWM18tHklB42fJL5kWEMG7KgcikSeE4TMw5QojKAxIA
	eDTRKjYp94a+CbkwiZaaGGDDcr6dMIgHfFq5HWQKIERka2q1sL78NvSIfr4FBMvg
	9PLkUA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar515m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c62861b3bso852216eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782352847; x=1782957647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=M8F9/1Tgb+AP0zGVyWmX4F6Guu1CV379mQEdyk4yTAayCg12wnoePeMFzoT1vGfwAH
         6VIvsCVrnsIClSV/BwVRusLlaVfGxtGBRVfwx6VBofW0jnVQiTmOV27qPFTJG5pnIUFm
         Lt7jpaZ2P6m93sMlf8/fMli3XSXVIVO2Xl4gvUCqK/9h4+K5vXA0iN5OsOI87/PPvCU7
         QAMcq/oErASWjeAsG8UjhHhZ6BLInVphwDRTVuQ6hA3N6c1zPrF6pB3ircYU+k0PPPyM
         PCfsv/SR59NKGBOqOSWZUj7H5ZGQ0t/O+VyGkDsb3FQkBelkd5hh85n1GwmKNBKSprtm
         JDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782352847; x=1782957647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=JxkCcEcpvRZY72biMgCExG6kBSJRJrbyl4N/cyF98+F3sFrn2q8K+d0gw+58Pr0dZ4
         aIC5Gbb8DhR8QJElLxk1X4jA4aNxY2FyRWyE/tVYtaUlG0Hg4BWZdmWiIADMtqtKQ/8r
         nRZfLzQrsd9/SS7lSFXINTo3FAG8v//f/nARh4rCCk1YPGa87cshZdi2WViCCa4YSW49
         364/EF/JN9DzcQQkL1a2QFALOnhiqIU471xeUdiwJc00M9xT4pjJ5LlshoeIH1S7xbLw
         QKTonW/pg4XBStTv0RpDmeufJOkzhPzu3erSMRJ1jZnAgC9mIVHFkT7mT/IJ7IvxfkKv
         JEww==
X-Gm-Message-State: AOJu0YzCuTfuX4tdKm77AHclG+CGOXoGII1QdUNjG1W2KDb9T1pN8P5r
	xwKqVk3s4yIwKVehnkgkozC3IrfX+p2fb04wPmbm4QdN08FZPJeSZr6+/uP3ml0cWbfFkqt/Smk
	wuhDL4OUovr8UfPJvRGKueerue0U5FFAKX4FVCA5rXbD4fBOSjRnjmLzYM+CheUAFLkg4
X-Gm-Gg: AfdE7clJAt2thYWLmofSQXDKjpLrhMwatzfUNr8CScQ2aKFqkOQDEt7Hz/yn6HHZU5B
	/DehnZIqetq+wrzHFJMHzRfcRhy4NI4yVijQmf2DNPvh550XiVtdix4XzNe/aEDuucanXNI7eAI
	5gELApdtX6GLnh3QNQiGJ2QV12kutt5HhTIEpe7kTMNnnn5F+3O27roDjW4zjBbnH94Ca86ajGe
	qDtZeHTgMPu0DRbSxfd2N86XosawhTx002/IX++D//AtjbHhpyhyYHO86CQPg5O1yafMNU0yf+Q
	jkaRyH+hwneN3Ou7NeX2lFfA7HBYdepC+yd9BKQErplIVSdBAXTEflgBCNSRXeHWEhA/nF10Ykp
	LTsM++TS9jcTP4N7K6lLqvM4bKaxDsUk+mqWeoahD9A8u2Y8D3EIP7EObroEiw3A=
X-Received: by 2002:a05:7300:b586:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30c84d15d55mr618629eec.22.1782352846413;
        Wed, 24 Jun 2026 19:00:46 -0700 (PDT)
X-Received: by 2002:a05:7300:b586:b0:304:18be:55a5 with SMTP id 5a478bee46e88-30c84d15d55mr618584eec.22.1782352845742;
        Wed, 24 Jun 2026 19:00:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm2933939eec.17.2026.06.24.19.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:00:45 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:00:37 -0700
Subject: [PATCH v2 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-qcom-spmi-haptics-v2-2-b9118e60f3e3@oss.qualcomm.com>
References: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
In-Reply-To: <20260624-qcom-spmi-haptics-v2-0-b9118e60f3e3@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782352843; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=RWnpqqugPMLb6oMeuWHpmn19vMXUaJk5ZOAwNR/9o9ryQgbsienpos1/5XV4LNqWOHFvmGnZW
 A4o8ziT8+UqCpmYZlno6lb1wOF9Q8udFWf78MAO41Gq/20a8UhWA1Bs
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: NKDXwzfTsB62hsorH_5MOjlKOTwHa6aO
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c8bcf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX8IkZBFNkVFLA
 mnRXLr3l1qg0jN3ico6XpuFP1RJnKe1MGiwMV5pLMfJ9LgnEOcE+/l1p1SxQI5O/lLGhzfaYTnv
 ohgUtHWaqpQI2VpDnuteD7CPFUenXoM=
X-Proofpoint-GUID: NKDXwzfTsB62hsorH_5MOjlKOTwHa6aO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX/UMK8hNnWKv7
 7XFRaAlHeQgxD+ljh/ewU4E1PjFumvvGuOBOM8ZIILJQRoOIU14dvV2QUwF7HH2P6hfPisPC0ob
 xvpJRoVDuv8QV0r+lPQZrAWpyEjv65jrF3DAFLV2zdj7PHJ0AZCJrbHAKOGzWN8IiZP/ty2Bka2
 j1lk7D59u20MliRL6VCGTaFmbnSxhSG5f+yt5cTuGq6bIDeXF83VmwGCLXVvM6r4oR9CsIBcomq
 QallrDiDJxzNYY3e/XmRt3/Gyudg/BPmuknLCgX3JnI6mFBV7MnvLI1DRxxXE3dzk7Y5o0faV8W
 ZpXfBHLTM79RNrJM6dTfW2u+8yQA+Cpvi59hWTTsvbyz5lBMw+0rV1qJWIyzxwKBkAOi8TvNvxT
 kDE4Tu4wLkdMz9Gy0TsD1VmHuTXpVrkt7qfCzhOdT6yC6Cu0Rntbv1JIZXXxE11XDE2xQI0cL3/
 FUSDUoanbJS4gU2Dgfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114433-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B55A6C24CD

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0


