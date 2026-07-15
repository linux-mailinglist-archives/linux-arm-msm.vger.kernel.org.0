Return-Path: <linux-arm-msm+bounces-119254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id anvIB1KLV2qEWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:29:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBF75EAF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=clQbA6ia;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jv3tnz3I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119254-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119254-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A985300EB85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2813438BD;
	Wed, 15 Jul 2026 13:22:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A233CCFAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121735; cv=none; b=YKB+9y3q81q2pWX0RHeZYyVosiEmHt8ui7h9Z8XcHOPiY7CP+eGtupjZu6lScV6IL0/LuUW7YXrXXVx6iLS7YC6HT+RqSAqCuGu3NVKR/FKXyTu+dKb9nkCJBqDidz+N0KVfqzoaHkjmEQ/6QTiIOQgrC7W6WQIZKjS1OUh7nz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121735; c=relaxed/simple;
	bh=cAarEfDJTg9x6THkit0WCQiEr9hmWbYzl7aBt94vLGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qiJ22pLqqdgxlVZrcT11hXlW5c4CXlUtvKTJZoqtGKCOrEYQvt1RX/gtBxFa/WdTzBoVLrae2MW2lnr350ywG2bFceX0i294fQUQLuoRZEECY8Q+rnLvln6QIvTnnOLweTddP9OaRWxiUBYIpIbWv88oipu6ADf5ai+tMHdFdec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clQbA6ia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jv3tnz3I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcZCl3766594
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScxMUAEkJz4
	WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=; b=clQbA6iagff0rjCTkkdeyPgcvEU
	GTBEpbJmrh1Lifx7yj/KYlFevvsIJeMrSd1oRWinDTIk1Dl9/mremX3jn6YtsvGq
	ke9ieovhxYiKLpbPwSyxMOTKlmz9PVUHAyvTDqpICox0AO+yiX/kIlWf51k3Tv0C
	HKsSgEwf+ssqvYD4CvJlxPaJjPzJkM7ZITU2SBfCm6B19So09Jo6/25XErC2BHso
	+d5Yzr1ULgb85wu0NRkQ1yoC1tFLmt0Puqy91XY6MlwnXJHKCPXWNltZ3J7ndmvw
	eECspauHEM9odg4CNOSnTYLwrIiX+r9mF9VFEJL7reUrd1Z6zD1lzYOZAog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558s39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso27089686d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121732; x=1784726532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=jv3tnz3II5n3OTQ3v2zfX5yWjnRjaMBp8ajCIqPLwPlt1E4XBY9NKFUhhJWMNlhpwM
         UJ1JZYoRIRXSk7S05Qf+msehLrbHunkDWFA9DR/ziA0NTM9N2gKOS+EM7HCGMFe0Y8sV
         NoIC8B4EnjPCd1Pkr/m0HdmP8qVBHDUDZmeYka1J+BZVbIkjxYa5ent0Gzoxpgn7H4Iz
         bS8VK8a/XPpIwsQLcl83LiuhnCfO4SzBIleK8lAwiTEWq26XiTs3CX0hvEne/eXe3tZE
         1sspQkg61nZPCvhKI2REVjUCeRmxFII6jsRva69JccAGHjvmi0Gj3GO59KdycUghZXEm
         r9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121732; x=1784726532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScxMUAEkJz4WlBE1VeN2PJnDHIBmwIiW3kEo3Vr5p00=;
        b=o6WGS1OQfvDvgklH5vqVh9Vq15aZnOG205k+eBHF0/BqxwvrTgUXMIHvk0NtVaqe3u
         mtCk4TUOnCIByjOjLwwVuzhw+1vewasdOCvQT5bl8uEnfHhO2ibSdo1hiE+I76NS84Zb
         8yfoCLcB8i965YrTj7RLVQyOMrwCEXl9EcRK0dH4mR2zlSqXYIwthnxwmTpOsNu6emtz
         lZ6OQ183usRQXiwDB8l60QWDU4glDhwQLqaH8yv0crTF0k9j1TvZSnh21acnu5pX3UMf
         MFnXpmmIqhZqLHRGqxIWDQxvXcZtTIBi7AxexFF5rvzuSKq8CYXFfGR28kk96m+B0SX+
         vPdQ==
X-Gm-Message-State: AOJu0Yx0C7jX9W2Ca9EiOAEpyL1uNfV4kbjfASWjWYhkmodHzjDM+ZEu
	u3tX0VGe+JjIsx9AGSPMAy0gy7dQ1+sNQDFTGz/U0sIVqWbLmsqDEkMW6aNS0NEnp+LhJaGM3Ms
	G1CN6/0ZQWPHyViKpd7IjL8HFnfnPpt+K2AgGuXts4CP9DGVFXlrnjS/pif+ZvfUPe+l3
X-Gm-Gg: AfdE7cn0wB90YeQ5hZdvEj2pZGCiiH0cc7laYZsEveuKULVsbr3yY+tBd7JQkUE8gpY
	SZ6K33NewaMVQtluUVih6Qjb639Cz6OwUMCJJBDhUNkqVCs8OCud7/MEI8OJjk1jSDaQmjAw4eZ
	0l2MSqqchBEtJ0i+2IW4YfggkCIqXKdEhFyH0o/Nx9fgkul+v/I/IkY0LWh04y8HzrhauIz8tdB
	QA9FSSDFw3g5xocD1BoZ7Br52VUvN/M0M+gxGYWtKV90+03X1f7lfeRhfTwqkp3AO/66fdO76By
	axKnOHlmnXM22Ql9gkZrnOcF/rvpDGJnpDlYMd3jmx9G6kXzZjvm8cvtf5SKq335J7nQS7ummvj
	08bIsa2WqQ4cEboziyV1GyiTdN1yQ5m1nLGGlpEW9
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197440466d6.24.1784121731823;
        Wed, 15 Jul 2026 06:22:11 -0700 (PDT)
X-Received: by 2002:a05:6214:27cf:b0:8de:6bb8:46c with SMTP id 6a1803df08f44-903ff8731a8mr197439996d6.24.1784121731333;
        Wed, 15 Jul 2026 06:22:11 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:10 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Wed, 15 Jul 2026 18:51:49 +0530
Message-Id: <20260715132150.1322663-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VC52so0zab0Zi2vFSspQCSDcnE1-kNU0
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a578985 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AILnUmMEF99VWB6qR_8A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXzqzp4K2bHmNt
 GP4fnfVesOuonrp8eqxa0o2UI0DbyPAH4gPLNPGn7mY3hwJynGmaWSxj6GE1q7EJt54cPdcs3kA
 Bws/bKMN4t2MHjxHftoXgmpbnmkZVxC6G7daPz+IRGzWCHS8SjRMHcwwim0xMMpk8ZLceJfU/pM
 Uyc9cziTLS6rjtcXUY28bAtdarUsZmnJUe/RPhhNA8Rs1lsYmWUXYfbX6jsdtXXOD9IGWfo0CcG
 yyhe1Ntf+8KX+8jrdlDWVSFHDlGwqkWF8H8/F25sfkuI/3EpYK+rk8z+sa/pnUqrMXF1zOdTyx0
 TAFnq/L0saraYV3bTu0N5rriDFpJqDCZkI31StCio+KlrTqyA1h7/3wQ/tljjFR4EvtD+RBB5kf
 MQexfoptWu1WdQzuqTeNpd+eGOZ0eovG7TcRA4LsLXzJOYsq3fB78HHpfjWndKc/LOUd2rP4klK
 whGCFKiVyqqZZTAAggQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX57nVzWeeUAQm
 4hNXQJI63cfIjVKFPhDjA4D1Gh/JgDHMRwo3WZq2RbEVqyqsZyO/+z0YsfRIQmlgP/Rjrd5YNDs
 IWatIkKzJQLZNNvBG3v/RYlrhICLhb4=
X-Proofpoint-ORIG-GUID: VC52so0zab0Zi2vFSspQCSDcnE1-kNU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150132
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119254-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EEBF75EAF4
X-Rspamd-Action: no action

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..86c1da0f577c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,eliza-lpass-lpi-pinctrl
+      - qcom,milos-lpass-lpi-pinctrl
 
   reg:
+    minItems: 1
     items:
       - description: LPASS LPI TLMM Control and Status registers
       - description: LPASS LPI MCC registers
@@ -74,6 +77,19 @@ $defs:
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,eliza-lpass-lpi-pinctrl
+    then:
+      properties:
+        reg:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 2
+
 required:
   - compatible
   - reg
-- 
2.34.1


