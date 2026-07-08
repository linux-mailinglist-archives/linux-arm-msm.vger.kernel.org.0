Return-Path: <linux-arm-msm+bounces-117788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id suDmFYSWTmoEQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A82737297EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sk8FfjU5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R6fNoImJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B8D3088920
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBFE43800D;
	Wed,  8 Jul 2026 18:25:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B1D4A33F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:25:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535137; cv=none; b=rSoneGrLSWcGL5+Eb2t4hsAMiuO3RVPFOON6/Iwb+AewEzsawK1oVbiOnQG5ncQtqrS25XU3J+36LabfB7/s9BPorXSkBamOxZM/bO9wweM5p2FLtIGZSD9YrFMm9LXicTCCZOjCjCaJCyjFncS3FQiGjJPUHWdxIAK867DUknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535137; c=relaxed/simple;
	bh=5+tOIwKjFEOViCePhwuk8uzWNUyFlbnCkTYOxe+u4rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcApiDdzEaojF5hJoyYeMTdJlxJBDP7m3zVUnrqk6dAXPoJe3ZZll91hxsDW3s8yVLaxpIlYH2Urxm7avfewnBvI2qVroxejee4E6/1NPJU42+PRbP8Mtwz9drkgJyMkaPCzivJlStwWlwbX5WS5OEZq0CJXB1V2MI8eGg2thRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk8FfjU5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6fNoImJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLH7k3170635
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=; b=Sk8FfjU5GLvHMFJB
	3eR1yBnF/n8m0LnjcEUPdFp6W/2DibP0GV8EiXaNkX2pF/hJV7Hbh7/am8uG2A3E
	Acy3qLxLSfjWC4xmZlRYGV+XSA3mmPGqK54et9igrS8Gs5EYvq50iLKrKfAlmIDw
	ERTaVKd/FwhrCUV3LVl2J7XAW+0Nd7txz1dsDNXjRTF7NB/LsK1KuS0eeQdHwsA4
	y4+0hqNTLV6QyDIfkr6YSqR948nJAmMx6dPR6RtN9yFHu4pGR0YPuFLALoaWAHd+
	mrvQfnJ7sb02+7ulSIpK4udiANZOYPpXdaKhAZht/OJNXPko7bM0fiDkz/eY27dd
	kSg6ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gc92c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:25:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ab059052so127010a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535134; x=1784139934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=R6fNoImJIB65+ZMz/VpvGr7x5ZcH5zJODn7VckrtpqXl12c3+xS1AQ/FOt6Db4C8wW
         m4mQfNPgAaITW6xD15bmkycDbm2d3P+7autDCThz8wC28wwYq6vTJ5uqI48tQqhNngIW
         11pLa9SnhU+gZ/xxL70En+3kFwok6rV56DOOr+Ry/UEuuSK7LovbzZvKnu3GoD1to4EC
         BCV/WE9X0LUrKywhrJOkjyTZTkFhBLSEaFpZ0Vwi7owHh2UfkDKWzBczDnvPt/LPoHPG
         uG00+kU4AJ5sQtDwZapNWLfsPWlOGMtKf/H1rmWTE8crtuDgtp0NZB/DodUYItN06XDr
         HsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535134; x=1784139934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tN5xVRl1DL+Wo7vUVaiIf7dOahvY+oVlKkNrh3pgNME=;
        b=GWMs4ktdCKKjDQsFRJgv2ojMMuTVyDf+9sulLRmhQFpRzaC3xArLdOicj1oHfvGOuU
         bQrDIbR2eMhFqUoJSGtKef0wcBth4FYFHxEYzLhVdnliBh+3dx3cq2VUOhAH51htvtzl
         Mpe1nHlxId1Q4W2WCCjNEOA9eDaRTuc9cpt8k9NJGaripDMlheLOjn9u1934UL4I8clC
         6Bx4CLitDK7jbFhHZJqggUT6/rke3h/br6/QK8IuoHY+Jh0CMxP82iNZufl/TujzSUfo
         0k+rYo5B8dW3cjd58TOs9VqHR2YCzfX6p9lTy/fystPlBJtYr9sJ72NrK65/scTyPym2
         NnxA==
X-Forwarded-Encrypted: i=1; AHgh+Rruu7DxgJT3DNrnd9Mf99P7H2ncu37PyJVNYIkBiHZOgfsXu7c9NWiK93ozR2+J7fcex6M2xkWilBXx7thm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TY+loFNpZs6Paik0WMzATUiJJlMqUXaSDni03hxjZ6/RAig0
	Ca5smd/eTcir52D41pSoWv83r9TDoh9fevM7GpvmZcYHwVKBn9queSB7oZEaLQeu2B4UciZYzaQ
	as+/BZaFDuNF6kGiZnIJ+q8T+NtNiZX1mY/J38ZMuE085Iw/T/WFJR7I0pkGVpowBeeUUwZuxJw
	p5
X-Gm-Gg: AfdE7cnH4d/iX2IAwmtNLe7gGX73ggRNNGt7wtforqY++8IHrRIRdtURLwOdDH0Sttf
	vJr3yaghu1wfGE6711Yp1z4Y1+0dLQkfnxUkPtz+AOAZNaXH/RAxzLV4CVPdwSzEstdXNChRTdC
	+UviU9HFG7YQuvMZCl1k72x+CS9SRNbpSnSCTb/JAkFiIegM9Z3Q7eESXuSkg3J3YVw3ilm146D
	Xk9vhX2MjLtRoDU28+KdTbEged2php/I3DijIdPhksOGwJ4s+B8FoBppQKU+IN/mZ3REosIz8ZW
	MgZpzMq4oreM8ZvzLJgmDPOwAOJHIhpH0Qmh7x5bOKFauoOehzp4UZ5JKNbZA76q0bbmbXOLaYR
	K1cvBorsWe6PE0ipTbPFWkPxDaFxPQTG0OOBtAtszaA==
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396670637.36.1783535133963;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9acb:3ff with SMTP id adf61e73a8af0-3c0ba29e14cmr4396641637.36.1783535133447;
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:33 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:06 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-2-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXwEhrIYsFPA66
 4u5B8HTza+IvtTzZratXFo45U0lfSc4UKehZJDMdFxPCcSfAyMi1TK0ktuaAywV9MJVERqIZpAy
 s6GxRMfgRjLuINxeyW/BnQIhXKGXA1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXy+uyfnvtik5e
 jXr77ymrNsre9zB4XuuAvt4SOFYM0uMXdcCO9lsEjoY3B2JzIb0ms8jP9ZEWLxbfnUrlQkWnoem
 YRyBjgBksOh+zQaQ3SpyaBih8oU/2XLLiA7XPoN9GTnkebL+mEb2rVn1g9qibWEF7P2Z0WQntKc
 GdGTa2QqjWZKJArWlqsePIU1GGaK7WxsKNPLi79ibWx8acD7+8CkQilkhBiQEWVsKbcv28n9R/y
 rYoNfcMK4qyq5w+MKIV2/JxSrsEwBIpakugUmeWzVc7kgkVv2RXYjdOBN7XsngOpnHdFki1Gozk
 yXLI3s0o1+NavBp7pAPj1ZGmhUeXqzYzMjDqJ165Vje2B77nmwwMhE7FIy0OtZoZNApBwclZj4N
 eKH6VQEz5u9wue/T7kWMHnEIUJYjQWz3vAcPzW7bxWu0bk+AAW3xZWYPmWX1vPcrVhfwW3PIPId
 5k8Ex9XLwAkwVadvOow==
X-Proofpoint-ORIG-GUID: cJ-oqo1aJoeg1jZLgll8lHObfUOZ674J
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e961e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z3K_AQPDDkgJnXkyaHcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: cJ-oqo1aJoeg1jZLgll8lHObfUOZ674J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A82737297EA

Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
that provides clocks and Audio Core CSR that provides resets on Qualcomm
Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 90 ++++++++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 ++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1ec24951316842fbe3b0bc5c0e7e80c0d9d8d637
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-audiocorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core Clock & Reset Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio core clock control module provides the clocks and Audio Core CSR
+  module provides the resets on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-audiocorecc
+      - qcom,shikra-audiocore-csr
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocorecc
+    then:
+      properties:
+        '#reset-cells': false
+      required:
+        - clocks
+        - '#clock-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-audiocore-csr
+    then:
+      properties:
+        clocks: false
+        '#clock-cells': false
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-audiocorecc";
+      reg = <0x0a0a0000 0x10000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+    };
+
+  - |
+    reset-controller@a0b4000 {
+      compatible = "qcom,shikra-audiocore-csr";
+      reg = <0x0a0b4000 0x1000>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0e64a42523f1ec4213ce8cbbbe6f8262d414f0eb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+
+/* AUDIO_CORE_CC clocks */
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX				0
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX2				1
+#define AUDIO_CORE_CC_DIG_PLL					2
+#define AUDIO_CORE_CC_AIF_IF0_CLK_SRC				3
+#define AUDIO_CORE_CC_AIF_IF0_EBIT_CLK				4
+#define AUDIO_CORE_CC_AIF_IF0_IBIT_CLK				5
+#define AUDIO_CORE_CC_AIF_IF1_CLK_SRC				6
+#define AUDIO_CORE_CC_AIF_IF1_EBIT_CLK				7
+#define AUDIO_CORE_CC_AIF_IF1_IBIT_CLK				8
+#define AUDIO_CORE_CC_AIF_IF2_CLK_SRC				9
+#define AUDIO_CORE_CC_AIF_IF2_EBIT_CLK				10
+#define AUDIO_CORE_CC_AIF_IF2_IBIT_CLK				11
+#define AUDIO_CORE_CC_AIF_IF3_CLK_SRC				12
+#define AUDIO_CORE_CC_AIF_IF3_EBIT_CLK				13
+#define AUDIO_CORE_CC_AIF_IF3_IBIT_CLK				14
+#define AUDIO_CORE_CC_AUD_DMA_CLK				15
+#define AUDIO_CORE_CC_AUD_DMA_CLK_SRC				16
+#define AUDIO_CORE_CC_AUD_DMA_MEM_CLK				17
+#define AUDIO_CORE_CC_BUS_CLK					18
+#define AUDIO_CORE_CC_BUS_CLK_SRC				19
+#define AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC			20
+#define AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC				21
+#define AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK				22
+#define AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC				23
+#define AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK				24
+#define AUDIO_CORE_CC_IM_SLEEP_CLK				25
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK				26
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC			27
+#define AUDIO_CORE_CC_RX_MCLK_2X_CLK				28
+#define AUDIO_CORE_CC_RX_MCLK_CLK				29
+#define AUDIO_CORE_CC_SAMPLING_CLK				30
+#define AUDIO_CORE_CC_TX_MCLK_2X_CLK				31
+#define AUDIO_CORE_CC_TX_MCLK_CLK				32
+#define AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC			33
+
+/* AUDIO_CORE_CSR resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1


