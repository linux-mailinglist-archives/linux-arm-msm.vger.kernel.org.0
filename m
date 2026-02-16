Return-Path: <linux-arm-msm+bounces-92960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB/JBgYhk2kX1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E441442C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2974630A49AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5AA311C27;
	Mon, 16 Feb 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoAsJApd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atFYV1AH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DD311946
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249454; cv=none; b=ftZIvfs6lcCvuWWnydQHAlO4niBH2aqhO/FhUZGSEheFE2AYFK8Gnz2ScidzHMgZT9cxXbO5Uzj2vnLtaC4yk3gJr4XS5+FB6D/gpeTM2+Luh/0UQATwvmvLR0XtMjlTLZH4GUn5MwUrrG3gfHL0V7/VyjRg9koLeaPx8XeA8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249454; c=relaxed/simple;
	bh=voeY0qgaagnSQChXunaKTn8hWiJvQAh+eoXXg3kf6eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEmL1z3sPKQeRWLxQmJ4l19dbwrJrkFe8YmbBAC4/OYpbz+9w3ncKoiLk+zJMHlcXplvGT4RKw2mSiQolhOz8nLjnx4knupqTj/wdpzCfx6y/0hOcSEx5jPQUO1F+trME0zimGsX8QdgM0aIu1smJx4vmU4X8EIjbLXRz4ZvjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoAsJApd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atFYV1AH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBAQVS2429921
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=; b=MoAsJApdsj03tnt3
	gsGUR1uyh07/Aml2VO4f0ffIS/gT53AbiRDICVdZ3AHUVkZQ6UhOi5m+deuN82Ae
	90J6MOUAdClpbRECByrNG6+dFY0J/+k+XOaDYzNMPFcTNUnkMTxRh1FlKpR6R317
	6oYXGgtN+QnCA8rJf2YlwxrnbmsEquILiMBT5kPmD8i/9AHc/JnVv/0PXmq3HOQh
	8wZfZ193F7kJ7U6rZU3tSz+/34cpmvyxWJj5pDmbLqdT1rboJI7lFkGCq1wq326W
	DsI+1xthe7XKtwK7evzrnbil9xfw11sNwIVhFahP8Hb2VMCPhlAcAKirCKuvg8oU
	ZVlLGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujyq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 13:44:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bfff75edso195559991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771249451; x=1771854251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=;
        b=atFYV1AHCYs2M1J5BaFm/ZpLS9pggJNRdpx11jhdIJClMNSiZok9JZgmjsTsAkoOOw
         UcYj3etdqktQxCYQq1zcar5QWN6MKd3YXubOTPPArDfZ2ObRu9lJeAIU6V3SZVgwmhjB
         uQGozi9ui/PogKnfQDOMVQqonSa7INePTLrbxWMfKFeH62Uc1HkwF0KVtdxQU3stH9z4
         Owg/eBrLBQQqxX2/k/izYdeJl2Tw65KkxvrEDwQpL9/8ZiAZFUt3sM+dadlTJ7kshsrw
         sHSonHqggHkhJtxprn4JJKfJY9pNTkAraAXwA55WGMIgFgYEYiHGwELZO/JLTCwan1RL
         URWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771249451; x=1771854251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WdwEPD45D07wBUXWw+rosDN5RAMuttt8IrDPkGvUC5c=;
        b=GuUSnkxwQd1/eMCnP7i5x4fwH8tAEfknH9cAUhZ3504AHETOqjfsEjbLCrQwkf9PF5
         2NC3I4kFWfMqiI1ynZCV1LNZgsneUIiorJRdLhtLiLrWaq7xH0BzF4V6SJcRqHE0ywug
         D2AH327CTNcKxsTidMLdSqgIpD+cr64+6nt2SRhre7xuJ+eZir1xKHyHNLoC6oUakNZu
         /MxojLOb8v5vz9+StcEC474fbPyo29poFeXBPg/c8O9ihW/sbyMJWR1QjsJubX+ogN4E
         797xst/AjWk7QBkC7IJYNr+W15jbjY8xdNCfn9ay9mxYxbenH78MDJNQdd6NfUsEPga3
         m8ag==
X-Gm-Message-State: AOJu0YzPXLd8CUNO4ziqJk9sdQd9CboGZXzhgdPK8avGRXMgjYucyjPg
	4IX7bwMsTfYODh2ldUPM7uTOE5EI8UC4VVVs/IyRCeSpE7OMMts6LwBHdK3VG7LY5yK9oMCYJUA
	Wc4EpNR8LjhgXbA1maHYJG3/izfI/GOPYFkg1IWty9YeuncDAy6VR2+YQwX/6aTDTPiLm
X-Gm-Gg: AZuq6aIGkOAgmL9TRpBODn82UaQsx1Q+WDZ1U3V/cJmWfOvY2hdVf0X1Gmo6uhBJI12
	yyyEVn09Yxyv200IS1PZvHc3t3rEp0UYC18L2s7uhUtodOpZVxKZ4GL7BsLN4bkUKaNYza1GFf2
	ZCTQ5h7RlFyoG2Fd/a04/CEGPkFb3ag1VyxtbAEZGi0EaPkx+05qgDRN2qbGeHHYHpH+nmfYMUa
	F7csWHS9T5ixqpJ74EAoru4RN7y1NSuh0cKPOnO2o6Yy1MjkcBnkECQ1ifdO0RA0EF76FESOoUY
	+EDPd3A9CultLsAulxYJ8VBGvdF6dUq+BHIX12KrIeNlOLKCDbczGUplKq1F9IevcT8ApwF7p0j
	NqdQH2GzdFKFIsevMh7mcP9NC+tqeig==
X-Received: by 2002:a05:620a:d8a:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb42412e7emr1353675285a.55.1771249450974;
        Mon, 16 Feb 2026 05:44:10 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8ca:2baa:6656 with SMTP id af79cd13be357-8cb42412e7emr1353670385a.55.1771249450303;
        Mon, 16 Feb 2026 05:44:10 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48387ab1974sm74300465e9.3.2026.02.16.05.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:44:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 15:44:03 +0200
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: document the Eliza Top Level
 Mode Multiplexer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-eliza-pinctrl-v3-1-a7b086595651@oss.qualcomm.com>
References: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=5381;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=voeY0qgaagnSQChXunaKTn8hWiJvQAh+eoXXg3kf6eo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpkx8lcTo3vQal4g/xtFdcSDIRKGrmDHWznOi6F
 vlYhxjbZ1KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZMfJQAKCRAbX0TJAJUV
 VlpsEACTUQyn6tHG5HxiRxKKw8KqN1nuD6ftvdkap8VR9e0xaztuEdPhs3hGKEvt4cnNyTE9er/
 N6Q82oBHHcNOz+zfJ26cJ3B83GGYg+aZrc1lpgkb+Y/UnnbTv5KcKLA7/EQ4Nd2OM0SU8GLVy2V
 q+JSnAoNhP27nDFhgrlES1G1afX852PbS5dJeH7YM6G6XCJwEcj/sCsAs6KCfCU00XJsFb+NyCK
 RQ2UuGEmC3GkuUi7w5GNe1JaZ5torBTraBHFpZmB6If15kVlIuDELTc0l1nubD+/M0Kv61yPGG3
 6BdPlzO0jdCO3FBfSNWs0Jr7irMz1lvJd+vYv/fvzuLZSATmiKk+NaTJFYL8ScTGMNuUOwEVjZH
 Zv8NB/XpS7ct8UFAcwn4UPnEXf2yGisfiLNWUwzf30hLNTal28zy93eXnG1QTPwkDF6T83D8xr/
 ei+FYdpgdJnEvgkX8u6LGqZAkDEFNGH6BAJ8FTmt0qRJHFSE+fDuhauxA1/dxfFyv/0hO8N/uMC
 P+r8uEkO0gLNTNpRfXLRaCRv6gn7aUxeigg6YutvAJ/qw8UPsPg+9DYLiwbqvPieODVE1IFwYI0
 yZuNpZsEY1S7t/Pv9ZskWXFVHJRLZqrF/H8JoxSORwMQheQ1RGz/3FJ7gVzWLEcITIo9HJzGM+0
 BSNZNOddlbkPknw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: YQLTZT327olsS9iLajNeVPQM2XpF6RSU
X-Proofpoint-ORIG-GUID: YQLTZT327olsS9iLajNeVPQM2XpF6RSU
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=69931f2c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=73qe-b8KcWbEUoKDdJwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExNiBTYWx0ZWRfX1uhmkwCqd95w
 /agCOYcz6Wl3DswZC1RWlP16b/Z8X3+0cyRyBTEUdzSaAMY4jmlblbXzEUeuuCDsRuFClCOLKcK
 gVLZrVg61O6axhIkKlN1TSo6KGaEgcFWNexgOQW9Pnj1dPvDcg+abD7pRC+DKp8ZMIXcpZCvmuf
 OZ3oFQAV04o8hNGmF23Yn4+IJ+NG7SwmBghjdfWGcf0qzDubAfkFvcu1fFFgD+lmeaQrhb2l0m6
 K08Jx3KsXuMGdO7HkXePIJORwhRt2Jlvz7t3S3DBoexyYsxnAUF7kokNealt4A5vgIRNwOd1LwC
 D7OMgXNBsJYsL7mUmc9xoDZ80uzOFbGLJwAr2t1qhxn+OlHttwkh9s72AfRfHlV38R8753IM/4H
 BJn2c/BEXSyFQ65UByl9c1MOY19Cvc4cYpOBGKvkK7X/vQOYXt/Dlp7V6uLPesNm2hwWgXopww7
 wW8sM1k2lunBIKpTG6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92960-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f100000:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3E441442C2
X-Rspamd-Action: no action

Document the Top Level Mode Multiplexer on the Eliza Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
new file mode 100644
index 000000000000..282650426487
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,eliza-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Eliza TLMM block
+
+maintainers:
+  - Abel Vesa <abel.vesa@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Eliza SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,eliza-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 93
+
+  gpio-line-names:
+    maxItems: 185
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-eliza-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-eliza-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-eliza-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-4])$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, coex_uart1_rx, coex_uart1_tx,
+                coex_uart2_rx, coex_uart2_tx, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, dp0_hot, egpio,
+                gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1,
+                hdmi_ddc_scl, hdmi_ddc_sda, hdmi_dtest0, hdmi_dtest1,
+                hdmi_hot_plug, hdmi_pixel_clk, hdmi_rcv_det, hdmi_tx_cec,
+                host2wlan_sol, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
+                ibi_i3c, jitter_bist, mdp_esync0_out, mdp_esync1_out,
+                mdp_vsync, mdp_vsync0_out, mdp_vsync11_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3,
+                pcie0_clk_req_n, pcie1_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
+                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
+                qlink_big_request, qlink_little_enable,
+                qlink_little_request, qlink_wmss, qspi0, qspi_clk,
+                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
+                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
+                qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
+                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, tsense_pwm3, tsense_pwm4, uim0_clk,
+                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
+                vsense_trigger_mirnat, wcn_sw_ctrl ]
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,eliza-tlmm";
+        reg = <0x0f100000 0x300000>;
+
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-ranges = <&tlmm 0 0 186>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        qup-uart14-default-state {
+            pins = "gpio18", "gpio19";
+            function = "qup2_se5";
+            drive-strength = <2>;
+            bias-disable;
+        };
+    };
+...

-- 
2.48.1


