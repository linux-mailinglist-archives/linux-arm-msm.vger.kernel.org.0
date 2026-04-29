Return-Path: <linux-arm-msm+bounces-105228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPeGOzcS8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:14:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F249573F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D9C9306E1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CAC3BA243;
	Wed, 29 Apr 2026 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5emQm3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSY2RZxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049029346F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471829; cv=none; b=M/u/SkDW0eb+Q2tXz66et+8Ej0n7z3XeoO8nm1jpl8XBfifS4C5GmRvFyrj6bj0j/hpQMwOtimoMAK3FYes41M27YpODK+6A7EE04ivyqx+XB3WXPBjDIiObeX1lBA5/WEdIhQCH4TbCdYughsOzUN/ejj58pP1+7Ua6aIRBj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471829; c=relaxed/simple;
	bh=ZmSPolJcVe+fEIAGwoyfQ2txKJ/fL7rgRfJjQ0veQkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX79v6luEfRDBIGr/Un4kGJSjK/iyC5sEXhuR1UaQSGafV2SlnI2sS+IZ20M9vubqZWAGVgupmfIK6zb7mRoDdM5OZrr4fDpoOJSU9/dEDDsEP8FinUh3R3DoLAW3Tn+uol1Z6FyjrOnNTaByoIMSTgJfF4wHEVS4PHMiXpqv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5emQm3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSY2RZxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qEQx3067007
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=; b=S5emQm3SQ93uC19f
	rFj5xSxSgWrT1L3UN/EO+sqoJMqjUsge7LyNQiGY+ZeN9t3IAnq4qYUCwKOW/82Q
	yAG3qY8MXWTp78p8wgAEdQfwL70v07BVzv18AkNGn9siTt7/TPaiAygmgsuNKBLk
	9hBmB/tuAEaWiGofKVYZ0aOM6nw7rep4gtNM14Ty3A2GNLuo4eTUMWro6yIciM8j
	trVcQIR3noPwvGCOkbjkEYV0Dt7xTSr2NEbeJgQ80rrEQCB38CnXPw0hVjJmRKMp
	j57HNHJDdKj9JfU3H7gW1SSkF1RX+XZqGGWYUSmoM+rBYSLHTWCcfLqHPwafhz5A
	53qhpA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxaupe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:10:13 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64eaa6294d9so16080998d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471813; x=1778076613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=;
        b=DSY2RZxVmxcCJfZUGv90iIpPNMOdu02ObxM//mI1zK4EZzt2GrYee3QOIPSPus2O2t
         uHJK9QxKMUFPcsxAJeckYb+Ze/FFfNWj8dGrY93d54/EXYC96Z87XFU3yZw/jAiZj8WS
         whBjAQ3aaOeqBnXn3vAAzMLbhhTJUpvvnt7jnj+Pj68QOz6PWG0dQbekxs79ACW1kXOW
         NteUOwsEqkMRhtDikOP3fpZBbrYjmsrh9ex3VlWpc9prDkNoStAKMHrCHqjnFuZqW70b
         Yp7Uubu0ExnplcIMQdP5mgtTOl3sNUncMY4LzMjzd3ClyrHSr3SJ31n0clFbz9Hhu3lH
         9Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471813; x=1778076613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCmszfLBMo/STFogk4FjG87dVSfdVQhr5pTDwhUSFlo=;
        b=iuqZp1oLL5bLLCw6Qbun/otOHYhDb3qaFu3w7lW2Wq6Vw0yXbfUjP5mJ7k+E4/yRGG
         BVN5kLd7s/LF+yMFTKZLhfE1QHLJlAbPjTnUawZ/tiVng6bj2hKkiCD7YfFVAAQbOFqR
         hTL/KJDmjlvusctMfl43KArzdwiMNOOZbLlAV3ghrh6xrqlSGg3wVtXoYECxs0LjwYBY
         /9OfjKZxEQcfIyTFDOrn4P+M6sJzZfhlFiqYmia6f2khw1674xTc9rwUmpwkYkS6xe/Y
         bIEWKcgmLEKRhl7cvfPEjDfZBZrdu7mWnCLGyfin6JPQqOMPs4WMmD+ybWa77WVBLLFt
         9inw==
X-Gm-Message-State: AOJu0YxYVfemMpoIm8s0lGc4XSe10WweRLIPHwXOswiQcVD++eU/yuxM
	ZV+jB2Y0zx9+Oyd+yJphzYCwyAKNn710CE5hIkjO6e071d3RihUkK6TC9lLtO1Rufl1leleshwX
	yVWkNP4yqls5ENU8hxmzxKfcgZRgdQxYtCb4ktwzkJJPa4bz6KeJ6ohFOVbwItUsah/8=
X-Gm-Gg: AeBDieunchbU55dCsx4CpW+Msp92Y+mzr6teRqnHARc3D5mycFQuk5IpqUcpJSDtass
	eKA+owpJ3xC0axDvjACvBoi/qiM/SKKl5HVcNhphaafwTJfjdYVKIQLLQqtE5dI1lAfkLoDW2KW
	IQJNIoRhwPMq0oZ04u5jECXcWjlOOFmFV/3iAFmAhUEeuC0OeELu5cMVtEIOXVjkX3QPjjBDD/2
	nD1cl551b0nH1+a3JwJ3fWrb+EtJIXsQZS/QkCvQsMFGiqsNhZ6ADmHgaN3AJOgFYYGnuwAOriv
	25+hIEDcMRtcR6HChDE4qdVxfKKPvAnnkYcQhJdIqfYnmVwpGt/cx26yxOM0/imG8Rkcd6FyEMT
	yC4bWdtMaWGWcgcQx0IlLv3iyDB3mZX6n3qQcoS/cosVUI9D9jdSFBdnMVUEgZA==
X-Received: by 2002:a53:ac90:0:b0:654:27b0:8881 with SMTP id 956f58d0204a3-65beed37a0bmr7079795d50.3.1777471812928;
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
X-Received: by 2002:a53:ac90:0:b0:654:27b0:8881 with SMTP id 956f58d0204a3-65beed37a0bmr7079755d50.3.1777471812506;
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff7ce720sm1286731d50.21.2026.04.29.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:10:12 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:39:56 +0530
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_rpmpd_shikra-v1-1-fdba28564380@oss.qualcomm.com>
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
In-Reply-To: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777471803; l=843;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=ZmSPolJcVe+fEIAGwoyfQ2txKJ/fL7rgRfJjQ0veQkw=;
 b=BA3H/jKRX9lJg2PzXkgvtqBVtv+fLAI+34GzeYlG37O/T2zP8y67LYopstFEWvnuCQQ+NP3Au
 azLDLQEmk2ED6eKcTHYdw2RIpFF7i77qetlkTIhL2CjxsRcvnpj5tZG
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: NcMZyvCqn1NNJ_EnL13WndJJxIQhOkmo
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f21145 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfXyXaJje5hO2ZZ
 sgVJ0BKhEiwIjVhaKQD7fCd4psuzROGJ4kRY5P3ci8+uBvJ6HJpuSCdW9gwi7bid1YsoCnea90r
 v5wwZQe/gP0LfBd/640pyTHNVrQYbnr0ESb/e7QoMB9p9eImSKQEefTjA/enZrubgCuXLepHXE7
 DK6o/M0bPxXISMfV/Er+vboSubxTH7i/g2MUuk2jrMeQlJUBjlVX27wZKYo+WToGyvfUzwQUDhH
 QOvdZ9PEdTgICIyWfRoEwAX6wBSVZcp5A/tfniDrOg1L34ArdI1IXUXyckCOynqtaHxsH8RGtfr
 DZhEliqqrcaXiBG+YMM9EA59CtfeQbzd7XSqoz1HqGH0lXXCV3YZHDamt/nbXbtKdKlqOn0Vwdx
 zC9QcODe8eAjF2Hogef5hAqZvsu2miJ31AJ1J9dqO4MGiM+rZ3hRMlwZtlSq1VSWmrfti8F16oe
 qF9YxY16kqriyLPHpRQ==
X-Proofpoint-ORIG-GUID: NcMZyvCqn1NNJ_EnL13WndJJxIQhOkmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142
X-Rspamd-Queue-Id: 976F249573F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the RPM Power Domains on the Shikra Platform.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1


