Return-Path: <linux-arm-msm+bounces-106719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBWmDEsz/mmHnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E8E4FAD7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C696C30308D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5452571C7;
	Fri,  8 May 2026 19:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1MfV9po";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKxrp5ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4220E3FD157
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266894; cv=none; b=isnnjejYiNaK40Kq7lu6vBSlKN16uzNg/WxbYIisAYsOQ5IlwJSQnNCdOs3+Ephxyk7OPRxu/j3p06XK16WZ/Z/6bUnBa8Rf71hIsFc9oOxydmfwuPcPff6PlIIW37oYz95l+yhZ9PvEe9tLAreqIKLKZAEZUL5z38giI+b0s+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266894; c=relaxed/simple;
	bh=EeIAZMRmgVmSK/Y4l2hVRqTqYGOuHpZ+loERcUpLJ1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMzia+OhgBXBvg+9m3hwgdgGYdMpOHhnn8thm/W0+CbycUKkwcs08Kn0m5vckbH0bbbL/Z5zjAzzFCLtEVirjENJsrybYxKoolsm8PMPEJnUCoqG8UCX1oDfS9ErataX12s4HzB6ndtRjpHoBRjq+UT1Zrko5mvr+lGGkW42mr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1MfV9po; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKxrp5ez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4vFi1116683
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 19:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2KaNJ7wQbTV8z+VB/6ohB5R61JdVKBpxz4P1XelljE=; b=o1MfV9po/5AzGvQY
	XRXWnINt7kvqpcJcJLIhSS2Mx9pzpvPNTFBz/b+bwohPPql8a6xS0mR1ihkAoCwN
	2wtQRkwaeZ9ALJJ9HGERVsu04aUf20TQ4Ll+gv1E3JIwHY0HfYAWRkrhgleRbg/I
	OnGwqVHBLTEqBVBKycZI/oUZ4AWK7h2qb6QWFwj8nmgHWVbMnGTrieQKQRKTklhW
	LZgq1PdSB8i9DIX2ozRwSFNEPIBhh0CrvD2zia2Rk1ilP26DsK6/utwWb9VpOPcz
	MD5qwshwJdw1hFB5joCDz7PkFMqbamm78RrxcZf6Ih86ZRikiLZg142LsrdlnNjr
	AWoBfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgk7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:01:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso1487157b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266891; x=1778871691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2KaNJ7wQbTV8z+VB/6ohB5R61JdVKBpxz4P1XelljE=;
        b=ZKxrp5ezeeTAhgSneler++XXKbNRo7BxjdClttF4BR/NVNjQ4QzxT7yMadjQbHWQtF
         OS9D646LkaUH5tRSu8L7FmaR700q0nrklpoBrHkG0eA/JJA7a+5Aa0OLBXCfP9sxBkRC
         aTkMk1LvXThgzezUh/Fejfca+dNuWqzrzDZZKA87PHS3LsDGkQZG3Ctgk5FmRciKGS1+
         tZRXIEikyvaHF1EYgUubbDS5kpktpxD8lM36du2kg2PmkA64rDrEuYRjaFV+IIiYMiH+
         0atZEpK5DGhF4PjVY4HG+MaaQg6o6nZ5Pcu/chmAzhy+C6J3vnCxc5GauhWNiKk9OGt6
         ZOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266891; x=1778871691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2KaNJ7wQbTV8z+VB/6ohB5R61JdVKBpxz4P1XelljE=;
        b=Q5aJqyzl24mzeYnRYwN8c2xaxSnt2dW1OoXWXV0AvH3F6ILZaQbWRuAIeFjrXvIeWK
         XBfp1cmvyS1VPj7r0HQgai7IFsF4cSpL52LmN7CVbTnmMisXp433GuJ4XQHkQWoq6RS7
         2mOJxGAY2lf3CkSxuO0MeS75Ovx5MiFWl24rvepBMMNBXuLpcDJBAJQX25Jj7igaeYUD
         aAlZtMgIkdahO5rWzUWsPUkrF9jgsNAeaM/ZrkhecNl/eH3W8kv51eZ7xFy+BwL4R2J8
         sYs/wkOTURDxr8aR7xRW+mlW9KwAsHOphZXCggtQmVOFm/OFlS8dl2ACHyltQCeTjV8g
         7BMw==
X-Forwarded-Encrypted: i=1; AFNElJ9GUnoAjdHRk7PJvY7Dg9CpIVkGgwSmpXHV8/3ZdLiBhijm4RUGzTnV2dBUjWrJuTPn2E8Qh+DqHFLsq2iR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9M21Kp9XII9/kZulRqxOQZFtHZBz4POLKUIpwpywmKDsXntos
	C0hhUiC6F5snUp8uj+B+cVG6RrbqkontLMfNQb5D6kx7f/kiuE0lyctrH1Sx28ysW8M6mxVLgVo
	GTxk8j67rbesMc+6xo5/BEUFGRGqvnDa3SFfYpiH2Fgt828hapcpDmWX9fM1oKPsqPzRe
X-Gm-Gg: Acq92OGsVRlBD9372PLZ7oqRmgMFXPlcaAVAuUMK7Ekr/i1Z00bf1WPQWWKr2s87RA1
	E+v1u7eWCm309VfZkQsPOghJQDA4XlvU938YEi4Ryl56OhxI7KlLTYS+9zLbpisIuTqv4L2sKxT
	wHiCLSW15x/w5MjcH03W+6iALvAc3q76kdUXTYPxXHblSU3oe9Y+ut8k1HygkspCXS1TPfkDqVE
	RAsBvz+wpAVjPHC+QE4DDpU8TnpZ6XcRuwvghihxcXsViQqyXM5IQNw/eFC3PJZNEJGLvqMVpN9
	5eyWHk85Q9s7PczfpDH1K3yTx24TvFE1+5ItSvMg2b7ldf9YIXwIgkON76d48Aqviiiw7vH/4II
	Av3NxTeNaPHcbaCN3Sb+kyzRXP1yOyag1TQUxLA4VV4aWDbQIZ9YSfDA=
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr13292285b3a.2.1778266891147;
        Fri, 08 May 2026 12:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:c95:b0:82f:74dc:5f48 with SMTP id d2e1a72fcca58-83a5b2d34ffmr13292226b3a.2.1778266890551;
        Fri, 08 May 2026 12:01:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:54 +0530
Subject: [PATCH v5 05/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-5-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=7497;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=EeIAZMRmgVmSK/Y4l2hVRqTqYGOuHpZ+loERcUpLJ1g=;
 b=0Li8hjN7gXO/t9mp5SMARAExK1BNGbI/HrJEE88yo4eydEDe6qKlPbQEz2JaLJXTMT7zvjgbB
 Nz+L6IlbMXaB8F/et9ZAfkga+riQMV0cwbQnn9bXTYxtmUfnIsxph8t
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: zbMgM2Yoe0jbZG-0EZhVYp_k0Fx0ahoq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXzpTwK4NOaOb1
 kfIw5QPEOJ5a3hu/JQT6kXagS0ahiRWjwhG26AT4CTVGMjn+ScqPw4Iqmao3GoUyn/1v4dMjz2V
 1nha/oJvQ+cpX18ci4lQKJAd/TzDk76dB1mqwJvuhB1oUUqhz4YnKgOjRVx0YFsUJVLhclWhnJk
 0MqvV1qT/qLLh4ZQt96/gvlqEH55qOfepLurw0ddpQp/tkJyzOtIgDLAE/mWq7wrtYE2ldHDXqO
 sxG5gpAjIDLhDxnYLYjCfWfI2b2mzawOqKCjBNwQFAhjKv4KnmcYFsvhbLVQGnXk/c24TS5TbD6
 sx+yPrTNDQ5o+xSeVFNenPIO2JY8MNNTd4nXuhwY+ytiPuc0ruybQFypXLoKX1VphaIB7TwYF5G
 SeGpg3GOku65rTXqGRwMK3iQ00ZIheCukdJnxZtWuMnIySPEJJJ0RYsMrJyH8loPg8syDF80Qyp
 2Iv+XsEKNuZMhBkxK8Q==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe330c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=1OCxxfDL7RIz13hN0lYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: zbMgM2Yoe0jbZG-0EZhVYp_k0Fx0ahoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: E3E8E4FAD7D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106719-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,aa00000:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 208 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 219 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..7b0bb001de85
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface2
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+      - const: bus2
+      - const: vcodec1_core
+
+required:
+  - clocks
+  - clock-names
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface2",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core",
+                      "bus2",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..dcaa2bc21db5
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IOMMU_FID_IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1


