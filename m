Return-Path: <linux-arm-msm+bounces-112082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bBB7Ir7bJ2oL3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:24:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79A65E4B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UWKLGUsj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DuVWZXCX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112082-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112082-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E54C309AE0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E897838E5C5;
	Tue,  9 Jun 2026 09:17:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FC73AC0C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:17:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996652; cv=none; b=SkxwFCYSThJpMh9DJ4myAeIXKZ0fU4WJA2O1ZR+NxAj+SL/KGkBzGMG56X8S4VNIwXD9EtuDm+aerZwqMawpD+Vkn9l3d4x6ZNaL/UIgRLzJWrA1B2lvoYU2H7/igwVhv0QJPxtmZN353GlpXLdXqv9QoBZqiWMKfNsZ4HIASTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996652; c=relaxed/simple;
	bh=rr2oZ1w/13xkEtFn95jWcYLYLPHANAYJKyS/SfpAHZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YoGBd7HT4De//T+wDGbtfBxDtRsuELh96ZmoV9nG+wcxtDN3cd1PxQ1Qa0wl1B5s3JWq2wfZKKCFfARE+GKspMT6DFgVAuf2DhihKw1hcaPXHZ7JgHR4CqFLnkcyxZTWtKqfmkwQTSNZbLwaS9l0pZdeNXaN01I9EX6zDzts+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWKLGUsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DuVWZXCX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqVg2001516
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=; b=UWKLGUsjzW5iheXR
	9wFmRrblAm7db32gW6l8ex5yShOAc2rQFcAwSARY4fbtSkvSTCMkBQ8GBJmpt/sP
	cvkNG27h5cN85+peOkk9NrnIqq8hNIhk7IQGfhzbZ59pEXHtXGyg1LqEXRh7Peox
	l+eKug4rDC4B7qjlvDfKaBq74quR/Gc8mpr8fqqNDaN8NsMEZxP3bl4h7/fUkJK6
	GNYwlBN763wOoencF7n92D4OiuOlnfhqzInhUk/2WkMNVnQxCvb+kZRP7cQyRB1J
	KKMWaJwpaP7eivtEMlh5lWzQKAKaGNWWD+z1zf08Yvmr2ANgRY2YTJI4pPEAZufA
	4UXltQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rj2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:17:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84256bee9a9so3392364b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996650; x=1781601450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=;
        b=DuVWZXCXEEEFbMCqdQcdkMDxTg8FZ6ytYq8/U3K6NXM6KV+IKwt/EyPHkmZD599xgO
         TjoDvP94j7rPIOVHEFfYDMKVPPJEO+ywKjJ1yw6dF0ag/7+gj3qXJjDZoSI/qQbJDVAk
         8HgbEV4SPhS2CF0oxtoJnyrc1u6K9Nd8+/hy4Xp+Gl3leIX5+90m56XVqMQhW23TAOQ1
         ZhcL0pf8CExPyqyszSUGXpGcMdTSVjWGZ19hf/OOGD0BfeTiNMFIfkCBFJqUFbR+dXd8
         cHWnJlQ1i5LPkQNApio0z5+Ed16+GFmiFCEVaaO8dbNpIk6U7Z/AjhT3/F97y0KboMnL
         fEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996650; x=1781601450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZtY4cJodqYk968em9+13qvIqLOM9Dep75Fwn3YXuts=;
        b=jV0lztB5BHOAC04rZXmkJhg2xunxqpREpIt34nN34F5fLmPgCz2Sm9n5NjkEiZjB1R
         6nNYT2z9j2lXR34J8BEKjNHu0xXcG5IL1fm9Dtmj8NiCxlzOER+TnX9JfH/VUtMBtmTL
         BMdhUOjk++7JWWoX0CLlPor3oQFlFawdSTD16gZzs5Z3Oag0plsMBNxiULUE57Z28fra
         iXUxVc2Bse1f2/Wp7YRftcJsljYPjY8ljwnoAbuniYXiB69su2c/6bOAdAX455iU4h9k
         Ao1aGT460GUrSbQOcS9NrZWvUI4ohdnZHa5XucF6YKPoIcMF60LOhPQPC45uBog1jnLH
         hinA==
X-Gm-Message-State: AOJu0Yw6buRWjPrqNn35NV4TpLUMun/GngEov//5xRJEjz7G0s05Ye3O
	rXAtNRKzzEpOC9Ln+4m01XjtneNdz69AyWHPKJRrkdjpXJzObkIEQEyVpnaXDmPYHeZ7CHd0oXi
	rhJKBCiSIlLpid/rQAoOv2BpDA5oRV9SymQJmeuI10lGiTqWDnO15IPKPUrZCHtmYGm+6
X-Gm-Gg: Acq92OFpsFimQPoYQfOoVKmQgasJhkiT1PSGliwzM2krz8JDowcq8Ut8NLOmNYGf7kT
	Goldx+TanDY4/ssUrp3LRcIIs+Z0yhWeEY+XuguSMu8E97q+55iaSx40MQjedjGDcHLlhHQjmxr
	kJetEfQgHLZdiwJDlmIgXt0Fvzm/7o0GJTvIxLQw3q8yKujMeheefHmd3PS8b+HsJbVYHTeBQ1R
	B5zuJJRvhk+hdYoXeZD/ayjTXkXO0Bnun32pdAKWmPprJxaa0nRaUe7zOeYxPgCYC18jIc2MRyA
	6A3YzentbH0QOWdxmS6mRfMrnj3wdS0t3dkyQUaAdTjEhVJIQOQP61XZDaqvcdiWOVTD1qiU0ZP
	CAyQJuItj/LVPO9lEvx9pXN/+f3W2v3aupEQ/XIvRz7vhGDFxuZUI1x4xK0zGAx2a6phH
X-Received: by 2002:a05:6a00:148d:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-842b0e661femr20374865b3a.17.1780996649547;
        Tue, 09 Jun 2026 02:17:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-842b0e661femr20374824b3a.17.1780996649071;
        Tue, 09 Jun 2026 02:17:29 -0700 (PDT)
Received: from hu-drajpura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm20974879b3a.51.2026.06.09.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:17:28 -0700 (PDT)
From: DhruvinRajpura <dhruvin.rajpura@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:46:42 +0530
Subject: [PATCH 1/2] bindings: power: supply: qcom,pmic-glink: Document
 thermal-mitigation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-cooling_device_reg-v1-1-e15bddcb0086@qti.qualcomm.com>
References: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
In-Reply-To: <20260609-cooling_device_reg-v1-0-e15bddcb0086@qti.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dhruvin.rajpura@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996639; l=1589;
 i=drajpura@qti.qualcomm.com; h=from:subject:message-id;
 bh=hFny+s6/z70haS8msqL480UJfkNA2vaD/64j2s8dXUA=;
 b=gGF9GHjt/HgtSqy6gEEeVtu5qdHS6TURABQkWPbNBSobWXGXSnLwB4pImOJaCW5PUQwNIurze
 eE9aVEifRvYDySMM/NHZxifYSBrX1FYE/CCUcuFZ+k8rs6hAur6edfd
X-Developer-Key: i=drajpura@qti.qualcomm.com; a=ed25519;
 pk=955XCRKkDWtR3Z/wycEd5zolAQt3Q1z7vODzFB/Wn1g=
X-Proofpoint-ORIG-GUID: TwAsBeGvlzl5D03frN73uMgnSGX4_ckc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX+zFTgvjxO1DQ
 x8swXoIo422dM+WFFVKFbRtUHmBrqEhmIcUPDI8WixnQUWL6vpCmkr/clMXeQaaGmP0MATygC5L
 eepHOg9RkJDavsECfCq+UuJkH8ymjK/KDdv/cJ9B65Kdb05HxQuzXCpoY/RO9qZ5dWDe6iBqQYh
 Jgyn7CidaKsVxXgtxNDXc+noYLFYHQj453FiH5uw0U1ONgiMNIfHPHHKgkOykoji8LEVff4xpYy
 usY3zZWkopYN+CSQs1RdGz8+2wtx8wytU9H0Y+8Wmbqxf+xQ4c2NS8dz3PauRE2EEWGErO4GFrJ
 /QnjBPXBBF2DJbFPRkfm9QrPwjyhRe4BAnZx2AN0lqml54xufk1PhB22s2tOs3no4LXY+xnZU+G
 GJ0MBvEXzNqL21mb8ofCYZ7OqXS9GqS23W3NNbI1OWSll6FnUgiWlz1P6A8dtsshvEJeMyj2AP3
 NZwPsjbToee/Fp1TeJw==
X-Proofpoint-GUID: TwAsBeGvlzl5D03frN73uMgnSGX4_ckc
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27da2a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0FHclZ_MPv3-cewW5kAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112082-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dhruvin.rajpura@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:drajpura@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,qti.qualcomm.com:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhruvin.rajpura@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D79A65E4B6

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

The qcom,thermal-mitigation property allows platforms to define
discrete fast charge current limits used by the thermal framework
to throttle battery charging in response to thermal events.

Document the qcom,thermal-mitigation property to describe the array
of fast charge current limits in microamps that map to thermal
cooling states.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..fcb69ebaa7cb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -58,6 +58,16 @@ properties:
       The array should contain a gpio entry for each PMIC Glink connector, in reg order.
       It is defined that GPIO active level means "CC2" or Reversed/Flipped orientation.
 
+  qcom,thermal-mitigation:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Array of fast charge current limit values for different system thermal
+      mitigation levels. This should be a flat array that denotes the maximum
+      charging current (in uA) for each thermal level. Elements should be listed
+      in monotonically decreasing (non-increasing) order.
+    minItems: 1
+    maxItems: 10
+
   nvmem-cells:
     minItems: 3
     maxItems: 3

-- 
2.34.1


