Return-Path: <linux-arm-msm+bounces-103646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCcIKH6Q5WlNlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:33:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E014264E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 04:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2F2730160F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 02:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFC137881D;
	Mon, 20 Apr 2026 02:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djv9G/U7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8cOIb4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526503783C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776652392; cv=none; b=s/JkxcKU4b6memQQyMXAaR1T+yFXh3s2h07LeqD5AhrJ7f5BMRoBX8H13FsepxQ69kFy9YbOMQZgwt1P43nqQ2ufff1wM/kI3tJzsCRjYcqQfMK6yksom/EbTP7wPIhHhCD963zoGb6YNSlsoe+jXFdSpni+WWrPb5hIzuDeWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776652392; c=relaxed/simple;
	bh=8XArvs/18gJ4dni/w5PECnRX7gZR7hUAIdFZKefVkNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoNI+cz6HNTN5CHs4LBU7CCDUCfwfy1PmcPWChJEV7QcDYsMChISHcmxyoaEim2JjJSyq9N/IadgPdQnWNhqEb7FzsdyR5WNnQ+FQPkWHg5JSP5h2STHo0ZAeYzhOjX8dif+Pgn78p0JeSDgJgmZfFLTJR/P2lIeIJQUQsgaSvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djv9G/U7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8cOIb4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JJW9W4990223
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ysqNKh0iAy6BigKl6eRjXdB/yEQ46WA6R3S
	xPdO6fcQ=; b=djv9G/U7cSLg9367ulV/MvY/gRlxLqE2piZSHBirJ0+uyJL6vef
	yDZ4FHX5VJTdXpTkeIGKLb749T35FFkTZd3Qoc68cE88t3djZhPu2K2LieVbtUuO
	9JKAouhoBEOJ4q+b4azC/WQQhh1OODaE+bJnqsqpqI49nBex+5yPuYFoEU9FjK97
	TtA0j57PuJGfqVBYYJqfp3W9ZqLVMuunlrkb0M3dHuhXgcLdhseQgErrruuqXv02
	oHIea1CJEhQ6j/iVU/hfIR96l2Nui6UMwgO0ctZREwzYeyyM/+AXDSOHqza6A5jn
	t3y2fNzAf9PBMDjHAGcV/Ra8URil4xaKcYA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b73msc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:33:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c20d5d7f4so3917290c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 19:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776652389; x=1777257189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysqNKh0iAy6BigKl6eRjXdB/yEQ46WA6R3SxPdO6fcQ=;
        b=j8cOIb4bFXJ4yBx91/Yw6owb12oCsJgrO+creZ7v1YfYODYPDmpODNShrRwwqeVDAK
         kHv9WGunN8aNIcrs9lkDcEJQJEAVD1ifFRUGtRVD1d7n9bCXL3aF2WhLIQEO+WfyDtFw
         aaLKl0QvZEg9t8uvUTrj7CeauLHjdjPc93DYhNfGOF6mLCEsOrb8jAXJSzg1KclEjSri
         i0JgHkQRD9JqaVXF+Kga7TgKkv04+qkRuuN+miUBf3SbSqrZleVPxYj9rsKFqMPQtwwQ
         QhS1XPbhvwGme3aNOkvzIQbVOh/0Z1AL9GyeN1tRb35a+K33p1B8m3cK6Ya36KW7owkB
         ySOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776652389; x=1777257189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysqNKh0iAy6BigKl6eRjXdB/yEQ46WA6R3SxPdO6fcQ=;
        b=P0w0fJt6jr3+oTF2CHQskIiBLSBOxbwSQ6slYZEngH4+XYacO3zPTMThSBbGxttyLW
         o8lR7wVQqY9oDJPVXZXbiTgFXLir26BxgHHRdevB5864iLsrz2LK+Xisohlv2lDupXTl
         mmeIHbB7ybTZo0Qh2rsgs5wQ4sSkZLj9rI/MFXDl/v+fM+z8lPZFzi3ZNh1KtGkF3nQ9
         FVsUdz6P0/XhmmPq4BJWPuGvYU+AybRBvvMry4Pn0y9G5L6ex7o9adUEOmr53sA32n/Z
         uSGRKTAKvHP+y9Ej2daEFxMYKOELrvwsU4o8bGjFbrUcJlfTZzgbiUXNv/Xntx8XKA6w
         xyAg==
X-Forwarded-Encrypted: i=1; AFNElJ8GtdYtvVRhrwcIbcQVvq9+DFpHjGIYHM4nvIbZlTZO0ISpUPMaIDh/k7Yey/PVIbmZk9ITRDztac0tB9Cm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv2jUhZ3ddYo+qRYHxsueRd9lqKKtizCL6d1aP4uYr++qW359N
	TMSkRUuwfN7l95IxE/tFLkP++BN1JmCOHujQdW+f4VtZm4p7AJSfxbr7LgXVE5jWT/sXIKZs63D
	3h/QxXkfW7FfWOZ6MBxSbz+IiaDNGePMafMYDJD4X1/lGB0bJ7yi/FGFhkJUBnbFlj3Vf
X-Gm-Gg: AeBDievL1NIJbsP6t8XluyQEUfBk7LrmeXKJaQEXOZ+NPl9R3M6/RLMoMESLV05Bx+a
	nO7E6bTTUAPFgxcsN2uhfNgBQsaLzmsappjJnRNgCEuxmYM+MnoB4n5BYVT6xNEYWAPA5cKjVN9
	SYxcQWRssZCMmbYG/MWER/fldJ8i6jKVX/BDtQcAW8h2aCs8c7RTIUvp43BAqmhCyAgMOrvWCYC
	/2wY0JBhPaO3JpRIJ7KfhQF2aGwz8muhScldWAbk7+DkDWty/yGlMe9VKg7PBEfE7u4dR1i4xuX
	eUfuXDOwf4Nd6y69hoy+Kuyn46Q3e3Sun5bfouXmc2diA+9cLCGnIfXZ4ftw8bvPmOqmIpBEYJE
	YyEUt2hgixokqzWWZFZZ3+fgCZxUEa1t32s7aZZbrhJ/1Xdbz2N+wef5GK9BKaiBBxaje9ARVgh
	13Ohx31H4PDZ20YeH+
X-Received: by 2002:a05:7022:6988:b0:119:e56b:c75b with SMTP id a92af1059eb24-12c73faf85cmr5934215c88.32.1776652389346;
        Sun, 19 Apr 2026 19:33:09 -0700 (PDT)
X-Received: by 2002:a05:7022:6988:b0:119:e56b:c75b with SMTP id a92af1059eb24-12c73faf85cmr5934199c88.32.1776652388841;
        Sun, 19 Apr 2026 19:33:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c837f7feasm8881355c88.0.2026.04.19.19.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 19:33:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM for Nord SOC
Date: Mon, 20 Apr 2026 10:32:43 +0800
Message-ID: <20260420023243.1239927-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e59066 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=xeZt8Ao_mqNCE84dPYsA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyMSBTYWx0ZWRfX9X1TGkwxELh4
 8kelmj4CGACRqPYrkeCT66MEemia0Mg4jEouFk8JVn7I3YdDoouRAW4JEj/Ca5q1qQbvhCbxJEg
 fAx45cU0iVt+MD90jxcYd+ZXJutVnz3H/EFZ4z/HoxCMvh7W4e0XYdM5NOoXeKOQ5AipS60HJm9
 Ase7wenVhnMkFPUt2I7JkQNe0CuaBUApI7HT0KQIRoix1UmUxya8ciXFf7N5QcTkGYM8dX7YPg5
 xkWlwz6EeEHVArlAZCQZN3Sm//X/u0RI4Tib3Dtoz4NwamfUTWZj3Ld7vgWnponkHyC7RUYGqxE
 DaTkG/y080u/lqd4tywbt5hkJypkeqltR+pbvjVKPa3MkgBGKsJjF/8ngJfDK2DCQSX1feX+fy3
 8zqSRXsBBY36A14Hy2nCA1FS94uqhNNmgY/wUNAiSiNp+vLLKI4YLhiWa5EXR/P3nTEaAgaP8/m
 BESCuAkf8SmnoZDGAeQ==
X-Proofpoint-GUID: tSQ6-RPfi4TsEyUDDmQjLMPY71MpOEp6
X-Proofpoint-ORIG-GUID: tSQ6-RPfi4TsEyUDDmQjLMPY71MpOEp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200021
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13E014264E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document SCM compatible for Qualcomm Nord SoC with a fallback on
qcom,scm.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 7918d31f58b4..c9590ecbcd2d 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,scm-msm8994
           - qcom,scm-msm8996
           - qcom,scm-msm8998
+          - qcom,scm-nord
           - qcom,scm-qcm2290
           - qcom,scm-qcs615
           - qcom,scm-qcs8300
-- 
2.43.0


