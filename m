Return-Path: <linux-arm-msm+bounces-114436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A9AhL/SLPGohpQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:01:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E1A6C249E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mREU1L3b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TQtUIDvV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C6A3037BFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 02:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD58C3A8747;
	Thu, 25 Jun 2026 02:00:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9A3A838A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782352853; cv=none; b=R4WjqIuO7x05WPYiuy6S9Z7pWpJ41TMlA7uyE8Rogpc7xW79K3ADM12ob0b+rxTMLmJaxBakTn9uD/oMccjkdLen1v0fZYQyqdsRDLexWnlLruNbxJV0mZowf7DRV808pRZ8pgg5EAmHdEjTyw5dBLfrcp/9Viyi9Qnu3xlbQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782352853; c=relaxed/simple;
	bh=WKowj6deeFFVUYYJTisg7eSkaNMHpYJvSdHfSbtjGCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEHLEtrXoaRKzFzKnkv8FPhhsUWgvRVFCWob+pVQdhI0xs/clxyJplbLC/wXUoSEipd9JCuy3Y/fUMppFtBLEN23jPPbWH6lAsZrWiIcB58aRtX/hu3zy8x6INBQaJaPMY791T9HlvlmXjYiWp37yGAXs68/QGCFVmif+LogVls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mREU1L3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQtUIDvV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLqTOo4024346
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wO+E7+0KJdSr8b4hjM6cq0xJgRzBsO+EXsSR8uCCiag=; b=mREU1L3bKFEcuWQZ
	T4EWXSbubTanw41Hvw/Zlzj1lexiIZAgIYMEOvGdD8g+QtvGjnXM77lIuYBQYz8L
	+4XYSCBFxgveIrRQoFC+4NpWELiSC4U2oTnU7B9yOG1XFdhHxwelS8Z0gvkxH8Hi
	ECCG8i73PS1ZfmrSx1s4gSYSwGvuN+Vq/g2hROEwSyrgUYNvh3AzCWS0thowljUt
	iKK5P/5bTlDlMdkJ/c4A7qA6XRq57tMvAG4+erztk+/XS3M0/p5VhmZcwUu31SWb
	cmi+is2t8EyVBml5S0mJJQP5buGfekFzoAzJk5qecjk+Omdpfa762D1otKXOtwaP
	xQWsyw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfd32k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:00:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c17f62afdso434689eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782352849; x=1782957649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wO+E7+0KJdSr8b4hjM6cq0xJgRzBsO+EXsSR8uCCiag=;
        b=TQtUIDvVysLBsEMD4unFGWi/pvN0edfOxgRarI1HMjnJ52PrLbVpUT3eSvrBJJh0zo
         nb1uxJbaAcy9nSL2tTpR1RbS+JvsgfNZYM9THw8qyt2ezzlxA2D+jTI/uGPc6RKPyqCk
         Ukcsq/RVNYlJ1a8aDKcclyx0UMEQMKQb6oC7Lb/uT7bBSljwr5yPg1mhQHgVh7O4JJE9
         MsujdjY2oY416VpRi3MPQVVwp9hX0ZMQwhjQRLisGSKP8Omx2n+Uj793V4BXJwNaV2hO
         6AqVBChgUHlNUxf4djCiCq+5lDXHCKid7/xp9h+K9e67Yeiel3ys5atatO9k8tzGyJUT
         HrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782352849; x=1782957649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wO+E7+0KJdSr8b4hjM6cq0xJgRzBsO+EXsSR8uCCiag=;
        b=Xa4gPJ/ygPQQ3FRve/ct5Cm/au/K7dsJ+IN7mIQ50Ly6PwBmh2N1TnN9QYuwP/Zf7C
         D4gcf4fegRrlOyghKu37xKFZtgxoXULLAxyyHSkhTBMA6aflR9d0vLaZ2ADi4cqGlO86
         lJ8cp6JHSbEp5VOcvZwlI00E93C93r9mbxNN0mRIpccjTyI0jFBTLXIzwx5micmAoso3
         NiKGx7gIOLWBxNjszGz1Bcj8op8Z8EBJg9aDjKWMEXjiHws5Kt+Eh+NeiIE8XhqgyWW6
         Sj1sV4bmb+Xb/BIw0GKmjr/7CzGbUWrI87ftIq+f64MbOpurFN4jlobSCi3EpwZEc3ev
         4ZAw==
X-Gm-Message-State: AOJu0YzG6yZvdxPCuaHJ7p3E3EhxbFiWCtz1Fc9b0PM95Qn3QFlMThkm
	7L63s8iJ4T2RmBAh1nB804bv7vhfHk49DXBefIn6XIS04RaLr7x7EgLOv3kfAit9fjhc/EuVCtT
	iNe0U8qe4ES0Ugz5KuTLHMJKqy0LIc3uue7zWxtroAR71vpxdqTODBIB+rWP+oYj3Q9/X
X-Gm-Gg: AfdE7cm1W8h+fdV+blRMtP1QmMUs3r/kc9lyyWJdYCvsNemM/2ctQql4dR1soTtR62u
	vQ/WeyrNeeKlq9xLjaWB7XKopVT+ELNHVygvCDpevRQn1SEJdVPAPD4b/pG/0EBZi9SYH1i+Tjk
	0GM1OsJjpEupKV9dMy91e0lbClkj2yvlpE3ebqoPLDZ9SQF78mQ/8Npg/nt7bknTmcSXUFqbZHs
	ltiLnbmdr0vx5AtWub7LX4tkA6/3n7bhwjPcoSehFvBD12BIE6qMwc5ULoGK5L4nwkr/swoKcWZ
	uPmByI24wxJA/4LWcsOByJ94dJG9CKqFIx09ywYnOUwHfEMVobC02NIPVQKQtj7+CXMY/N+ri87
	iXJTcg9HqUvGLbgvc5vvnlaI9t3GbZNCt/+nfD9Fm6IO9CgChvNQMdy9rNghMysQ=
X-Received: by 2002:a05:7300:c01c:20b0:2da:13c6:f27b with SMTP id 5a478bee46e88-30c55537540mr6424919eec.5.1782352847153;
        Wed, 24 Jun 2026 19:00:47 -0700 (PDT)
X-Received: by 2002:a05:7300:c01c:20b0:2da:13c6:f27b with SMTP id 5a478bee46e88-30c55537540mr6424840eec.5.1782352844905;
        Wed, 24 Jun 2026 19:00:44 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8afca8sm2933939eec.17.2026.06.24.19.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:00:44 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:00:36 -0700
Subject: [PATCH v2 1/3] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-qcom-spmi-haptics-v2-1-b9118e60f3e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782352843; l=6045;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=WKowj6deeFFVUYYJTisg7eSkaNMHpYJvSdHfSbtjGCM=;
 b=nmxjEngup4p/1ZabzZtuqSrdBsPxUxr89aSKWThw7McXLLqENP6Wz8Xv2pao/YvkNaqJKxYnR
 5RNIQw/BE+2A8/8Izgwsww/qJpRH4ohK0DHuvKYLpg2guXXkt3kf5xk
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3c8bd1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S08N5iZLQJCOTSjAB8kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: WoxQa_om3_YFpiQwNCapBbv4TaLiaaPB
X-Proofpoint-ORIG-GUID: WoxQa_om3_YFpiQwNCapBbv4TaLiaaPB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfXwOzLqPvIlZur
 mKA2FgLS5thoyKzMdu12wJW5iGsX7LpdlvQGJlEhAqV4z7ShIjg1ndPfSUkI1CvfcQLgdgN1E6w
 yDKXMehydYeYmC+q3Xp9HaOM+FIgZpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAxNSBTYWx0ZWRfX2LYvJAD8ABqC
 no3H2naVHG5YpVb08UUY4BOakTq/qnJOPN5If/L0jWCrp8kTjjYzez3hT4EGlD79mDfppMAOxkq
 iNYntMZxfmH4IoLg4RHKwp6PsCOS7ptJTKl0bkyaKYuWIVN5Da0cOggh/4Bj1c3FCWDrH+IltbE
 YwefsBgEjzob0Om/X1EtfMX5jrOgnmQteteWmtb7AXnPdkS0vMS0hnu74cqJd+rU7NKVk/rFq92
 XmJbarxTdKvD3+OGER7+Um4N3tEA0PIP9k0g6YB99Knt2yxawKV5eWeajjKhyHDIKKE0gAkNjSj
 38YfF9m2QxG5TBucY7DwxP2VbGaWROvroKOC7QQZqRlBF0p4A+SY9Nhhr5GgCamb8tgLsiOvznE
 BpUL9dqYg8JGpEpT97EHM+qNpEnkDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606250015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114436-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 58E1A6C249E

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..3764c3e113a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by lra-period-us and whose peak voltage is defined by vmax-microvolt.
+      The driving amplitude can be scaled in the range [0, 255] via a single
+      register byte.  Hardware-based LRA auto-resonance tracking is enabled by
+      default in this mode, allowing the haptics engine to follow the actual
+      resonant frequency of the LRA and update the driving period accordingly
+      to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    vmax-mv to achieve a special vibration effect, but the waveform must be
+    short enough to prevent the LRA from being damaged by operating at an
+    overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, rounded to the
+      nearest 50,000 uV step. This is the peak driving voltage in DIRECT_PLAY
+      mode, which outputs sinusoidal waveforms. The value should be equal to
+      the square root of 2 times the Vrms voltage of the LRA.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0


