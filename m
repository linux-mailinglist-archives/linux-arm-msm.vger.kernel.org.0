Return-Path: <linux-arm-msm+bounces-103675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA98MeXV5WnWoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:29:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DC427C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E207B3031833
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CCF296BCF;
	Mon, 20 Apr 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov6GLBmk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f21CssDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9FD38552A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670030; cv=none; b=rqzkX9X3owZ/46N1NXEvaPGFrMw3+a/oaDZwX96FxjDCF1TJ0GviQQFyi7UDlZvo3rEfR+WzHpMtuVMSCzvBzcjv0TTKWawEt2qCIQbLjuAeXspz8jqq0kjehSR/pghTs3rB3hHjWrDJxnQHE2TWrvQQoHleueHh8yEKmGSgB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670030; c=relaxed/simple;
	bh=SMV3Eo3EZu3fqZjtkXSurkAvS9yJhdfdsvRv0Png6m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vD9jpexokO5hhstqVvDwxGkNoPJz6XGhXuvMgah6gDue56muQJtWAXDzhtfTApwqn9iO0jyIAbvZktYFOHGHmwPPoUgvYxDLCZQyfkdkHpoC+jmTghEcJSn1V4T8RhE7coGxohlpJ3AjN8/elsxA9FWE2rngOg1TwUNc4pIY98o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov6GLBmk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f21CssDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K50jt31977967
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F+9AeP4qXKi
	tNTic3Hb5cykdpT8EEJmu66u6wxqftHY=; b=ov6GLBmkyK+CQLGxpGZb3w4fenX
	+CWTDSSO0A7jKCYojSM3dFTX36p5T4pE8yDrMiB3kZFYpHZ0KNnPodw6+D6qrQGt
	DTLmshQIWL326S1V7rOc4mH249Tso/VkOyUhacKEJXpFxHm5UEuOm66JcL/xDqE+
	MBNChb/Xy6zMBFeXlSpx0hw2BbfPX3bc7KWwh59i6lUTnp16291Ck3SYS+pvq+6z
	Go8rBSJ7/sdMbt/t1ekl7J+2kqDhEUIvmiXit+twQB4WhGkmq+/32M56/789cajw
	4DoxsXl5c8wJleqbcOgPfmQKjFCFQ9561+IzEHST968RRhQSjS9LT985BEQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388mhau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:27:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-126e8ee6227so3812239c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670028; x=1777274828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+9AeP4qXKitNTic3Hb5cykdpT8EEJmu66u6wxqftHY=;
        b=f21CssDg/EbLn2ExUnQdKlURg68fc9nAmWAd++Lrw5drzs3gxalGNJkzMZQBTk3r92
         2Jvg+uQ5GxdifjlLX1hg9TA9a9MbUZmUY9nbLpRQhAa/y7uVneLADvp2kHaLNgrzGkG5
         2EG+4jCK80IhgjgxbCRUJAU+IEup8JgRpfBfyPRUWMiK6Hw411N5fEezHb1R4s2l7jjd
         XfxRVPDpOmravbh6Qy4VLgGwdpSmtTtTHrFfvqkTi6Wz+Y1wk3A3H/F9mTweMW4oP/Is
         DCxHsDHF0jpoyPF51P12LjTX3q+fg4wQ18vJr2jyUnyA1h206SoO8T3e3OqnNgWZvETf
         O0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670028; x=1777274828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+9AeP4qXKitNTic3Hb5cykdpT8EEJmu66u6wxqftHY=;
        b=NInzarMTFlM4lzA6mhjfL5KX6chG76ilfANGbVyXrCJRSm89bDhTPZLQATLyOMdlUY
         Wo5gK5BCYb7qfK7gWfg2Fc+FjHRIqJ1BbA+59AFKxGx9nfNplGsEaCOI4fqw44quMFyH
         KsuZYTFL4rYSpYtfG9BHQKVtzNtgg5niH0KUYERDN4eqh/sIxOF1xhIEI/Sdi7i54yw0
         rmuDS1X39eWYEyXVV/C8R0gkgCu2gmXkJ4WorsxnwZzOWl/zztJArPGboX0zaqYXIEWy
         qB/oAIUW0WaOIVD8lPqHiRRVw+mGOJF3yDSLu8gvd3+iCdHYiNsYZoxd3/pdNqcPWmMr
         3/YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EO7/hkV3INgBPTfvuUdLo13Sb41OxDU1HUk941IOo5gkBqjYbDvOxYasAMAG05k8kdu1hWtkHma5IlHek@vger.kernel.org
X-Gm-Message-State: AOJu0YzT3ySTvNIs/1UvWPkP9Fq+xs1+3WxQwTxeclRbx8AmHiCf+cCk
	kv/FKOLwunq7HR0m1cBz2rSW3ULEum+NsDsv7pTXtBRpzv8rpcHUhenGqgsz2avB8rmbaAwy9Jf
	w65M8q3r8dPQTNtiZ2KNMKa/G8aVaUKAqiYvZkRXdkmyjRYHr2U5TqP6ORvRUMB7Gn1JL
X-Gm-Gg: AeBDievUNUo84BMSlanmgJT9WB9+LthqeX/+2WVBYGy4zK2uGhy5OmtM4wXveR05Dj1
	8TUdnwkS9NEc2+/WZd5hXUj8JRuENXKWJbjfkZPWdRkz2Cih4Kd5S/f0mBcX3HYC/NHdr9zm+YO
	MTIKdcxOTR0ZcH43+NiyRvVej9Qd1r4CtwSEmu04PsQNwebOLqQZeo0Pm20uiKYS7KHOGJ7XxmW
	g24J9ZHO0cT5Oa+1Y6Uk95IkyMYfM3bAVoSXp0kMXVUXfLqBvmpuQ03lsAaUm6Yaoq0KIbSLFlK
	azS4JaN9ngkSjO9iSzTvXyXx3LMhybt6DSjK99Rfsc4PQsTin/mj+HWvYULtFi9COsZJdKA/6VD
	C2WS4viLEt7wj6eSDhDf53pL5Ua0R9bATgBe6M9S0rUCBqNSl2gojsP4b9PmE/9T/17zYpdPW9k
	szlvvW8dyAER4t4l7v
X-Received: by 2002:a05:7022:ea31:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c73f64327mr5997260c88.5.1776670027844;
        Mon, 20 Apr 2026 00:27:07 -0700 (PDT)
X-Received: by 2002:a05:7022:ea31:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c73f64327mr5997242c88.5.1776670027321;
        Mon, 20 Apr 2026 00:27:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support
Date: Mon, 20 Apr 2026 15:26:38 +0800
Message-ID: <20260420072639.1249984-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e5d54c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=snxuehwT2jkVSlRMsmgA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: rjrF4mEEci9YjEKslNWMRPdyBjDFCRxB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX4ZHK+7vJVoJ3
 9UiVIueUb3aXsMsH16UTnYYQns9iBg6pDGGXR6Jd1i1O4B7jxb3dSeN/NtoBvAo1/R4/ujOcF1S
 QXvDIk40BCxT21oDw5mPkPSESOsVjMQHaqf3NIa5OAekbYoP0xYIiBSDU7lpBg42BnM/uxQ63AR
 JBC8w+o4LzG53fNO13cq29r65WIi5MnWLPDpnJJF3DZXw4SBjSBxHk9MIE2yaqE03rQdch1jl3h
 ICUeryhojLwHMQpTMZhpN+KUk1iSobqXDKUcmffKAw4cy8BHHZP73mtnphK7SWZXmUEXpOT/Qyr
 9ta3VITPZljDSIHACUPjt6M3NXilW8Fk0q8C80mHmFhf5p3uUi765umG6S3ATeQsr8ARlUyoHts
 l3ra1d9vSsCVVXu/YaPaIXOyITbo0SQ8c6KPOX3bwtOxoGUaDoqFollTKUVIApKeH7pjBd2LHZr
 MeATt6uiIK9MHxH9XNw==
X-Proofpoint-ORIG-GUID: rjrF4mEEci9YjEKslNWMRPdyBjDFCRxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200072
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103675-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 256DC427C09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for PMAU0102 PMIC used on Nord boards.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 58bb0ad5dda4..cd5391892fc6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -51,6 +51,7 @@ description: |
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMAU0102, smps1 - smps8, ldo1 - ldo3
       For PMH0101, ldo1 - ldo18, bob1 - bob2
       For PMH0104, smps1 - smps4
       For PMH0110, smps1 - smps10, ldo1 - ldo4
@@ -87,6 +88,7 @@ properties:
       - qcom,pm8550ve-rpmh-regulators
       - qcom,pm8550vs-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
+      - qcom,pmau0102-rpmh-regulators
       - qcom,pmc8180-rpmh-regulators
       - qcom,pmc8180c-rpmh-regulators
       - qcom,pmc8380-rpmh-regulators
@@ -413,6 +415,15 @@ allOf:
       patternProperties:
         "^vdd-s([1-9]|1[0-3])-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmau0102-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-s[1-8]-supply$": true
+
   - if:
       properties:
         compatible:
-- 
2.43.0


