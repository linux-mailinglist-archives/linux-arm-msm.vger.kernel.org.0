Return-Path: <linux-arm-msm+bounces-118200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lRVXKn22UGp23wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533D738D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mwSt09Iz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HAym3anZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118200-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118200-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5B7C3059B80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B383E63A8;
	Fri, 10 Jul 2026 09:05:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A43D5235
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674306; cv=none; b=RT3uEnfE+ud9SimYRjDQ/1G7kboiP+eaZ2mna+0Zuhc7XnTnsjQe60a8gr6avzgSqLnaoQSj206F4/VbtNlL+aIW41GOmVOykbn+DMi5YXJUVmkaBmgJhOk6uB6FWbtIpkR/yB4kA8webe3UNmlYQtbDWD6kvNH2beunnxN63dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674306; c=relaxed/simple;
	bh=LkFnGFAWssGPIbolVdpYF874p9uyyDT0NSK2OsrJn1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uzvi10qKGPJ4y1FP9AmZPQNgBPTymWq0D2HEqDr0ERaJxg58bEFyWwhLvK8HzE9ccj50THWZpgv++9g164ZlTuEEb5+opWSaoVGRooacieK7Mr69aeDWT3MIsscD7ZS8/3LDHWsdZJL5QFEBUQqKu2LWbqJR9FocF+Gc0fQYXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwSt09Iz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAym3anZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dqwL188244
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=; b=mwSt09IzPnNNl5TW
	WhAA/t5I8Bq7dJsk83S6TeAHUlzRb4hg72tsGMPvuhfvByTdPQAaMkAqpLfPqduZ
	VlG3P4PDwj9oKIZUBSbekhOo7Uk+Zoi7Cj4l3mbg78n0P2XF/u2foj6+bwGBczMK
	3jsyrxjiN1Xoo0Azyt3C8upGzOtJvpInXAstG4FkGMzXb8qm1ylLVPDLEALPH5A4
	4ZSngC1VzHNmIi/+zKkqhcyDuEQDSdJWnCkJT/JYzFpvmmzD/LvU/3uEdqNhgCO7
	FjN9+UU0OYW0CR0SvR/ts30sx+Hw/uKffYlSvbKZ3dw59rTdugmdtZx07u1J/Q1D
	FMrgpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesup7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:05:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so5202291cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674301; x=1784279101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=;
        b=HAym3anZIzCt/7LCqz0juTlrafRarEow98naC2vrtJFHg7c9PJcsGZeX0uKyaNrUy1
         ZFwDGGdh3Pk3P2bjEk0k2ztCkfT+w9HeaMOR0KS/aCV/hrq++X9Z6qrgLnA2njmG85yb
         8IsRaFa0EBBPyJLGbrLNce8hMZ3FD2tJDlP50hrCHFaUuBoTCjIPkCWxzYC9GQ7hjW+R
         tDM8lb6BFyHwEL1kJBG7tH5NmaE8gYPsCy/tlCoUJzwye8sFAPtb4J9KYMPLDzrcnumb
         8b7FJgEBOBLy+w6DU5N9e/Cnhi0o1sBgcWzUohYVJSPRq6xrCxHnygMQyHOfReq5yoVR
         rA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674301; x=1784279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=;
        b=J1fs/I4FrLAhti+Lql3S7+0dLC6RKhkIRAT9S8adYbOX90OkQFRcRQA8ZYH/nPDPX0
         d01JGeeJn2mg9KqT/iUOIhXzSkMbvRuoCL/ShHUfJ+2RTi77fPs50rqVrLbrLI60nHn8
         TjV/jjL2BEWOuSZWcJgBeNN44dAO4lYcyezubez7dAlqpd9yfZoJXp3Dp2aMyjWhBJIP
         oGrWiAneC5Rd+wOA17zs4Zu0BYoud51mKOyeXMqDtHvYxb/+rr4f438c1zm2bMp8zrCZ
         oJxpDrhzE2pMmREEMpSPTgcVpfWY7mjN0wehfOVt/D1emzTEhCnWbDb1uGgWKTpAc381
         S4mA==
X-Forwarded-Encrypted: i=1; AHgh+RrRzl2H6TfzxdX2GXN5xF/9+XVg7BJkZNsiburS7VB93WinXGp3ECu3kzJocVtjRrCg0B5NQ1mFSVOKIZx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvf8xF4RE3v+u2mL/Jujb7wx88IwmPI6l+gY8lVrqjlV+MvHGa
	mJO9fGyssNawVrH0R1CeGYO/3HBcLXZ4FogT9+pi0KcgqrY27HcYvyh3gdxEJ5YX3S7Tasi4hqM
	IiiHmj82mXwgdWjPGX5Z4sxf8RMSTbBL30qO4B0f3tQr8C+Aby1cjw0C/X9KatNS/OD4h
X-Gm-Gg: AfdE7cmiM8sgvr2X4bNQLR52Tz8vgE/IJZT91nx0loXkfK8iQK0OsCGq/SuUo5gyNHg
	gxiUQzdenlMYdJUv/8jeSZNoCmAPwQRBxP10HekLX/8rkmGo+Phrw3GyqL9TWlhVpj/GbCg7CBF
	ZXQxq8dIqZ8dQNml+HqO95rAdmikA6dPfqVXGjKtUrFE37tDrWNbPpESz1TJ/Fqz94jlKhtDM65
	PJ1D54KLY7jlCrlZJzwBMFjQAEuviP6FxDdqOQxLwTfvzDYjFl3S7d0kK2il3OBONjp+XsTdURT
	kdyVn02qZijStlfdKyTBKRj4nAL5oRBrJtmvuE+ShzJvlIE+n1Nlo5+O1UsNmRGV+vtYFR9M38v
	glI2jRaQbZY8Iestk0M9WpEdHuOOnESJ1lA+fB3vckI5RXjlx7Cj1LFLplOAlacTEphKFZp75n7
	cDRYbTh8m61D564l/91PsRyMycDA8WIrqgGIl8LV5FNgIquiEd+vxKM3ebuUK7HQ==
X-Received: by 2002:ac8:5f12:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-51c8b422c6fmr109839551cf.78.1783674301385;
        Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-51c8b422c6fmr109839171cf.78.1783674300888;
        Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:50 +0200
Subject: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZfQtqelUYpz7gFtV5xaL2ghC1DggFJUx
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50b5be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXyRdQMqn+zV0J
 rN3Qd9dCimC5Eej+djn0U8V+o29pvIPoYh4NZ7fVzPNUzQz0MDDqIuNcCncz6OBGGnNUpMBYbbb
 nI+t/Rb5YpjOEmFB2oB/syBQAlE+CTk=
X-Proofpoint-ORIG-GUID: ZfQtqelUYpz7gFtV5xaL2ghC1DggFJUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX1CUomhiwFUui
 oIViPIOVakCATYPmThFAg7yiJt4Fr7YlbMvXNnY9vUryZc1HNJaYv5DFmS6+3Unp9U1XJAtjMRN
 LPgEpZb07bzqURgC51DHeoOhkYgeTFzHlp+2GmVj2yFI3Nb8Grhru9iugK5M08qsdqHujlHXISm
 7NcS0QI67EUMc23WMD1KhcfN7ph/jf3b9DE0OVnehpAHdfFCq/1FlTu7gNdL0fIKwHXc8ICStE1
 /o/nNzfH+quxrrZFnlampWpFYKEv41x68PeiBH6CMoVwHMPj2DTklW2ME0ld5FKRbZWOimahBlk
 knUlnm1MbjAHw2KTrplsnaSfmg/QUgDXzoSQ2FirpFiB6sVXm/lejS/VnJ8PWa3nm+D6DKGb97i
 RUE9Ccl4VlqoahbQrmcGFSV99m8Dltsdo1bHNeT5UqnloGRj+HfKJiqK5P0xJ5BP9f8rhDjtRuP
 jfN/As4hj6zw+xyCdxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118200-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8533D738D76

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..58bf79ca447f7173933f6c5641add1f8035abc4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


