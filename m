Return-Path: <linux-arm-msm+bounces-109510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD3HOq89E2rr9QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:04:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1F5C357F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 20:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02D61301AD07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80D33090C6;
	Sun, 24 May 2026 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxlI4ccd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzkEPaFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9D30BB91
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779645828; cv=none; b=jsi0ckqeWQRO5dW8SNuc4dYHlco0uYOLbn1n53nZpJF4QkEf4lN3CdCBOiVzBLrpUngvURdssNOj8YR9YbtAIuFHS/OYWBr7KTbqDKuikr/0mAotFXi4f7cZ659hmRleQHYq/wU3mErdC9hZ+eaPtnqEf7eHc3j2KX9XajsamZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779645828; c=relaxed/simple;
	bh=lPQjOebK0gB5D6eZ9BckZJv2E8FJic0pghKbDN+Wwig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXdLmzM4SjjuLJu8Ffl/c7BCtjMKIwl3id4goU3gs1ansY93Eg6KpmHjpPiDJA9QjmsUHdh4DkbL3litwdZ7W9ipZskWwZ7YgwVchOmgSnULTASAqHPIi383J8rM7FNMZ1xIh+cQPqg71+Dff90DtVF9yyEAtEXDo1fIELsvo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxlI4ccd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzkEPaFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O7noDN152625
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/PAng2Ozse+DKmiO0SrBcnJmRKiMxm4xteIGLoR4+g=; b=UxlI4ccdIq/EivAb
	qr0mFt74J3Zuz8mvj0o0xuimQ7uD9mYCVs7M5vAMQuG3o2UBVSUQBGa4ajtqx8lt
	XG/M0CvGr9lctzUAN4ctiS9ySSYHZlBSDalkh5gL1HfLVO3mQ8zkPRjE+HINRBWm
	fM6KhkzbwoA9DElSR0371+IgLVNdWqxQMPEZR8pWoB0JpOfCQAFFSNIXw9BJ+cWx
	IzKYKzqvAMDJEGPU9KrM6WS+lhCOxWm/4ma6vsioh5avmHvOER7V5KR8cv/NtyQs
	WSLAprmuF9joOidbbLBWAQIrfzeOjrBifTxImp3xLZQx+A8iu80ASJyx7rHQYtgk
	UJEShw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0ty70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 18:03:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso9203871a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779645826; x=1780250626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/PAng2Ozse+DKmiO0SrBcnJmRKiMxm4xteIGLoR4+g=;
        b=GzkEPaFVrpApjzKZ8UdCCoJGyR7cG634YCUtOsUbVOJhFXDOg5QdadXOgd9B5nWsBz
         mfJfz9UAT2VKOxjv23xIfwtOAK7omSRSyNE+0KxdqRB3VJdHbA9shiomYHq7OKDLuJQp
         BppNj/e8TGMphNwEpwYvLQRzxBxOC4ywF5gYTDVf4afB/n8AHuXL5Qb+oN05AwR+CZzn
         UUcecsXFZCJ9D3Fbp7TinquwoeZKq1sHlGumaCJqIq8R8W+7P7WZVvaYvw14FVZxjNUV
         pXtoxy9bwkxLCfAB+I3HIG113UL+NNkAkp0A0PjStKfPjLRbtEbZ8Dz0zQPvJ0Nfiq18
         N94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779645826; x=1780250626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/PAng2Ozse+DKmiO0SrBcnJmRKiMxm4xteIGLoR4+g=;
        b=SjSaWXVJszUVcVvfp6XZKHAfJxwBxxji6Y0YBFNFJiHYQj1teDgCSmFNc20yEQoZ52
         elQSl9j0NlxI4I2P/9UcTqo7H4Xe/fm32eepqKDSYc/84ndGJ0GE9nv8be1ooHKSi8Ui
         /wepqc1TS5pjzLseGkTZRtqAebWi/VC9T3Ms9PY8hqyn4FAKBqElFI69wTcNoUb1dl42
         xPvkLz0S9nh/5fUC6yw3olA70tVEjhFUPm1NMKLY8JdppyVlv1B6ZiZkhp7igF/XKmhH
         5oxLoTerpudwsitjGazyD9juHaOHmqJCLfzwLKujX9fhT5Q0drV+BJE/SLO3s3JU43w0
         NFMA==
X-Gm-Message-State: AOJu0YwmFWnUWLo8ZSvJ2g73tkNkwSgmvuSzGNJ7WLUbaAgBnXCzTzsi
	yfbc6YyscX9LuqMuOYHPc43IhvhEjGUoDi6bTaOMAQFYPWBS+2rLjLrJVq1EIwz1ZqEiCl3zPRn
	8ItsXHrFjBDc2hunC6d+wwZ9Lkox29B9PjXIWb6IZayWJNVySqldtDDMzK96QyIxByfP/
X-Gm-Gg: Acq92OHvBDmh9qH8ADudZmSP7qTxfo3m65LVVe8zOuW/6MKxPp2XIEjaJND5yfezBte
	KyU11+9giPna+itmlRy7+gXFQm0KxRqHDktN924E4OTJu8iflm8I9dywbjZvZWbnWjJeO3cQCYC
	nJXG0/iRjFVtUGIfpTKopMUEcSo8cH4pZrF2lCGu4hYT5KmecokGPQqzylOodqYj50VSL3YYolH
	2b3UbeHXBDljD1hTqmgx4T5tOXVLtAG5eAB2MyBXnuiM60fF2JMu2ybH5BrnkUlFd3tOWX5GlJB
	Jay/TZ/hiX7rk2m8vnE8Ptkz+huXUVHHq38ZE3D1uGeTGpJXdrrEyntgMRyksgYQZ94tCrfSyzd
	NJAOLk31+V8dDWk1w74XL1/1USr/7HO5ZC08iaSyPIPbB
X-Received: by 2002:a17:90b:560b:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-36a6bb5b91dmr8417813a91.5.1779645825711;
        Sun, 24 May 2026 11:03:45 -0700 (PDT)
X-Received: by 2002:a17:90b:560b:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-36a6bb5b91dmr8417797a91.5.1779645825209;
        Sun, 24 May 2026 11:03:45 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a726348e2sm7252659a91.2.2026.05.24.11.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 11:03:44 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Sun, 24 May 2026 18:03:35 +0000
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-shikra_epss_l3-v1-1-b1528a436134@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
In-Reply-To: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: aomVAmHNKyjtOFS6Hj-aw1GkSM2rv-_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE4MSBTYWx0ZWRfX/NBTP1b3H8xr
 VYQh1CwVVmNtLcFpIFmaPuyiMlbEVz/PClV5u7/2Dtlk7duBG/eaPXWkRP6CuLDBYA3ndrBOCpt
 Ag9RtvosS1Qj0gFRV6ttkWVV1Mhtx3Nvom/t4PxgePMX1DtTk1ruEYqJiMkPCZ4gPxy8rzQmsrI
 mjDFQ4PuUTnIsh43U54D8JjC9io6uedxBf3n8pZrq+xdgO6yaUrKlJQLWDHnSX58jwe7J4UHsU6
 bIeOypHDkc9hJNytbzputV2aoNs/VIZCzoYCA/Jahl/SfH7VLgZtv4s8IJ/wH+T9vkrh7BNwQig
 w/SkgVGt5JA6PfZZlhj0UtHyurYochHV5wvgoXOQ+SyVOVyaVHIqr0BX/icaXrHNkr5DANh0yqZ
 0ECyNFfsH5olM6yCKaY0P4FH17Ar+ZFSzlIeidQv5Edmg2d52WqUD/PJgmvBnOrSziaOGcLMVQg
 wecY+yttRcFoKPZoF7A==
X-Proofpoint-GUID: aomVAmHNKyjtOFS6Hj-aw1GkSM2rv-_O
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a133d82 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O0_WEpH8e0Iti_Y8aDwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fd90000:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109510-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46E1F5C357F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the EPSS L3 interconnect provider binding for Qualcomm
Shikra SoC.

The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
providers, but supports only up to 12 frequency lookup table entries.
Introduce Shikra specific bindings to represent this constrained
EPSS variant.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,shikra-epss-l3.yaml | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,shikra-epss-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,shikra-epss-l3.yaml
new file mode 100644
index 000000000000..333ed40ea8e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra-epss-l3.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,shikra-epss-l3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Epoch Subsystem (EPSS) L3 Shikra Interconnect Provider
+
+maintainers:
+  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
+
+description:
+  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the EPSS.
+  The EPSS L3 interconnect provider aggregates the L3 bandwidth requests
+  from CPU/GPU and relays it to the EPSS HW.
+
+  The Qualcomm Shikra SoC EPSS L3 supports up to twelve frequency lookup
+  table (LUT) entries.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-epss-l3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: xo clock
+      - description: alternate clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: alternate
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#interconnect-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    epss_l3: interconnect@fd90000 {
+      compatible = "qcom,shikra-epss-l3";
+      reg = <0xfd90000 0x1000>;
+
+      clocks = <&rpm_smd_xo_clk_src>, <&gpll0>;
+      clock-names = "xo", "alternate";
+
+      #interconnect-cells = <1>;
+    };

-- 
2.43.0


