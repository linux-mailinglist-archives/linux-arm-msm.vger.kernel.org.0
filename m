Return-Path: <linux-arm-msm+bounces-117570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gJ0ME1MgTmrcDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:02:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB0723FDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:02:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fRT0oC1t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=blG6exLr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117570-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117570-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71F6F301B4F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F149338B7C3;
	Wed,  8 Jul 2026 10:02:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A6389452
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504969; cv=none; b=Wpb6I8JeH6Km0oVwZM5GAvAuYY3aCeAx3cPh53SfZRCO2qfhXFFYbDN4ey16KlzRbYXMgq5eTFypWgIPlqC03vyZonI4DLgHq7+BjNAKi54+3egzSlTNDqNhOk5QbC0OeJD9xwaPNj4BeLQDyHp+rGuFIycUDDvHQt2Fck5Zb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504969; c=relaxed/simple;
	bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3y2FUyIfcUf539gIhQqjPF0paLSlZtapSFwRfRGW+1PuWAyQMU4RLNoN+VjkzkJ3M9QbSd3kWjOWHMVDAwFRhzaJZH23qKIMZb6h90R8JVR8l/2TO89PLCUxXo43fP2IipH0yUJPK2XeB3nj/e5KiPKIFFy3V506F19LqhSMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRT0oC1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blG6exLr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888opf2204069
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=; b=fRT0oC1tXrkVMZHq
	oXrrDEkA1bhNmvv6m+dXEXApXfP6yiZtbqagNeDjn/j2lO1rNlnsA3L7Sy92ze0p
	mGLRGVuwbbXzqCLUk9NvYuDa5AQX4ba1PGZ9huHKdF7kq3i2J5cSw+3EoBshTchf
	P8Mgw12R8k05oskiGPelnwxkZE8M9ioPcpzVp3vbnyw+Ltyr2ggl7VllTVK01sKR
	/43EKYfGiK0pCFam3nhNYFmChqisJ2yQ3H9BpTGbDwX3uET88LdDDsbQ3MP0Y3qZ
	ato9/IsNi2yZ78V0kWHKV4zQbc7wQUb2PehYEZkSUXUjbajtCpwrBJgwhG8E/3An
	PvH8/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0rq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380b630c505so734496a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504967; x=1784109767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=blG6exLrHzf0NM1u4Ob9t2amREtRm+MKpMWzoyKSrI7hTZgxjBK61REqfze+EZV4XN
         zy/TCcuRhOkaoOG8+MfHf9ZjUblLgshzjrcuUpP8HG+3m99jAfftkn6L7pTp/hCtxUrH
         3KL0sSrGi+z48cPUjFLuesKQk3WfU5tThtJ61ZVFK+P+xkXtuYAJJc5SNnCPoBm303qD
         g8lILImJqVqCfkz6RKTgD7XykIDxTrYfTtQGIF0Pp4XSzpA8I0GWZPJ1EPh/vvAQ+x4t
         uzyd81KAlaj+7/VeOCg0Sq3NRknayM5iZWwCFfTv2XJpE/S20MKmQpiZfCWyROpjLlUf
         k4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504967; x=1784109767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7w5B72yEDcioPVqMR0tPZmXgNyfCkLg+e3x1vy/LUI=;
        b=pbK/9Dd2tVoYM6qK8q1Z3/huJ6IHq2I/tQRwHANrYn6fXwUZqBRcM2WbAsY7VVF54u
         5+bf5NNkVMgfa5DF7SOBhxCftdOh+huN3ubaEMfVGf/JDOlZDWmkef8LKHl4aN/kR5rm
         oGTgZ3fDaY3xBhgT5S4qGMHrVVWRLJ4xa9Gdy2sLCFzW58uLy9JL/BMs0fgzY2JotYdO
         rjELl0/ZfZVvec+2G1F3GjbJXA5Re41V/LmXcYljPSckW69qwQsQ/9S1GzutUw06b+4v
         LklOynIIvzK6ZmhYLbS/HyxL0uCVEyJ3L2hJrIIttRu+lKGbEHJW50m+N+75OE+BatHD
         AjMQ==
X-Gm-Message-State: AOJu0YwA7Ugo8z0W8iq/v1tfJ3agzvlnOiXcnhgVmknF+2aKeeaz/pN/
	t8wGGZuY6dLHXsvupeA9XeLJC9py3/JP/HTocUzkAQihyyDnZgn9tKw9+aPFaHzBh4kgyFGmQyM
	Js25Umapx2VxeXhuJedm0BilLoyqvJu+/tGDA092DkJBRyOhhiJ8DapNGfCRHU3gWOF1f
X-Gm-Gg: AfdE7clSwn8FqWQeUdJ5T7Vz+CkXdnlUEl6Po0Z39v5JDMWy4SIfJiHfPg54fp87SAK
	8uJBLvFPXPOzBJh0IZ003HBwUfbLjvDfRToKWly9EuY5OSREKUgnvgW3k6IhRVV83sv53N0r6X7
	3xvsj1fwV1mLIYudAM2z1W/Ej38epk9K7et8tw3Taof/UTbvR2f+CnUkejq+vmuqF9m/0z648gh
	XazviLGdclIA0P6YZYBSAwnRhK9diiasrB5hKrlxzohcppA3LIKy8UKmQ/IoviyeabxSuQwPnxa
	MCDxzAeR4RShkFLQwQo+5Dd7IFo4v9nSQYyQRdoFzofW3ZTKB6qt75oCRL7OVDuOK/jIE2q+szY
	yUTM+TrH3vCKzmjXeAtQNVyIFm7nGkMVudJj6ylGxk0lMhqcMXaV1LS8JKA==
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256834a91.23.1783504966675;
        Wed, 08 Jul 2026 03:02:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0f:b0:381:18c3:1b99 with SMTP id 98e67ed59e1d1-38941205917mr2256746a91.23.1783504965910;
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:39 -0700
Subject: [PATCH v8 2/7] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-2-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=1807;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=IIZw68wl/zgbFUJuSWJ+8Js+fM6YD6bI9jBv45CteyQ=;
 b=WSWMoqULrv+aluXBvb4fFgmGX+08bQ2NOO1ViXMaUsrjkktC4OQ4mOzBm7S+1SVwHX1O67qP4
 uf0S25sdXKUA77oO3+B8wPGC5FIDGSBPlC+flJ4YRqGofgKug2b6FJu
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e2047 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tHEUkVd5BVjdM4dvyhIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXzxCBSWeBFETP
 Uc6HzVF/DYdNiuCRXfDj819YyxkUs1j3vFcNb/6wZ3xbu7I32sSZT4FdQRrxnlR0mUw8Cdef8nd
 JY/tK55Xdr6atByBnhlvOQuXx3fvVGQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX4tx0Mq4hJE2e
 aIlp9rSr0MbYwuHNt1XSerLbw20kXhosYd94J5+L3mG0VxMs7eT1IKqBNB/f2IOJbJhAbIOHixO
 vSVzTonBks0WYsm4SBKNB7wuDBvexzecgwB8BwCl2ium9qfFxxPVLI7B/mZYsLG/Jt67Ft9lZI6
 x6AUKl09ASODysMwGrxqhJM8ctk4xjPLpzmHWbeKP5M0yKt9Fk0q89v1yDPRyEq3/ToXLJN4aXF
 WvIXXqrGL3MgaGcUIo1JQNNunvXOdbQeo3S8QyCI3Lg9PmXMhNs1j8oEEvQp/sn5M8EkZtWCTLw
 uwaHxicJVF0BNEOVnkpAoFM2QuUY6YFxHRcVkl5u/HMNW6YCm5X3eqDsiz8jTRLfM67UCGhrexW
 yGXL7iWnvPmLGKxGFcAz9cWKSOXI1OyycKAx5nEPXG/cIcO1yrKKNQ88fTsZJXT1e9/tk5GIJdC
 kKF0vHzCtRv+YEiKkeA==
X-Proofpoint-ORIG-GUID: T8NhbNX6T-oN7ILp_jjbzg8z6-aBAJ_8
X-Proofpoint-GUID: T8NhbNX6T-oN7ILp_jjbzg8z6-aBAJ_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096
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
	TAGGED_FROM(0.00)[bounces-117570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05AB0723FDA

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but has a
different topology: a single QREF block fed by REFGEN4 only, rather than
the two independent blocks fed by REFGEN3 and REFGEN4 on Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties. Note that REFGEN4 is supplied by regulators vdda-refgen3-1p2
and vdda-refgen3-0p9 on Mahua.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-tcsr.yaml  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index ec89feff89e4..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -82,6 +83,25 @@ allOf:
         - vdda-refgen3-1p2-supply
         - vdda-refgen4-0p9-supply
         - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
 
 required:
   - compatible

-- 
2.34.1


