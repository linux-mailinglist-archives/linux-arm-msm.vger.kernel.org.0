Return-Path: <linux-arm-msm+bounces-116705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KfZREa96S2p/SAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:51:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBEE70ECA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:51:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aOifZT/Y";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N59OJC0W;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAEB133E50FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E9D43E9ED;
	Mon,  6 Jul 2026 08:57:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A84A2E10
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:57:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328275; cv=none; b=G51MEFTTwd10APjbuf9EOigUL1txUvMZj+C/kpWvjWctbGm0doeQA2vv6TqJWQ0HTrHYCi3IHxg+Hzc6pqX1tWZjwPdhYOr9ts1ZvtYMgKgmhxH59Q/s2wWkYoR9qgvVSI3LNNjN3SUgbF6n/iDw49LX5Ye4t1PlRyOqBO3CSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328275; c=relaxed/simple;
	bh=1EDyH9aug1X6t3O/KLb7o2YnEGR0Elb+2cIvURxayFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jblySyafzFDNWle4xZSnlYbhQzHTWkKI5KmTjPkY7O+F8SOPWuYxFjQXvzKjcaZJaYCRUHlKn71kF6GufFLOq8Ym/Kmx+hiUUKTwFNAn/HReeAN806mfveLhn0NDWuwBQTp4wQctZyYOgJv9PMn/4NXnlEQccSTsV08IzngeSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOifZT/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N59OJC0W; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dFvj048577
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugj2Iq72eCviHxvR+s6BJF+8SBdQV0YogCYuKq+yjZ0=; b=aOifZT/Yyup6hPeN
	9Iz5c2jd6hqIqAAiEERfhG438AqnjGgAfFM6xYIH8o2zSBWMtfbySx+SftTJ/iqv
	4Gtq39gRQ0OLWrVJUefnhmpmXEx6XN7+SofHUJcluPG8E7bX9t8agOVfzAb0Ywn0
	1D0Kpg/WH3PSrjEP7hRL2v6HWRGtV815cO58WCEj6B2Exj9Oxp/o2hvfZM06hbkg
	o8oF5lSkFypJvOPxBtt7/rH0P12xPjaU3qhVFn6PL79a4rG2wpPmAPsuLweJwtEa
	eqEaL/pc9J/gmSVv9Vjh6ROcb4EpibFWivITSnFu6zWGkVXKzuWJnfqlIcb2jDGV
	B5kYeg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur25g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:57:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so25137165ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328254; x=1783933054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugj2Iq72eCviHxvR+s6BJF+8SBdQV0YogCYuKq+yjZ0=;
        b=N59OJC0WsJFxTz7ZOWPTqN9JnrcEBztcg8NPWohsaj/rxzrmkshUW0qP1jiZc5mypQ
         OrM4dsujDHcXqTY7/+9QJdFfbwxXS683HvK/JfOWTdaEfc+P6hdyFvvKcw/Ln5pWACT2
         FEmVIC3DGXOBhZ+47U86fl6invPVBXCn+XnMTuwiGHba3KX+b3h22AkIxDFKZtv/tr17
         VcdxpmGQX9gIWP0eSjH6B0tUgTwUmXg8Ne57XzqMH7xiKHnph278sjg69CcfrRELQ755
         NFcKTVZgJ2VjTEJjBZbRt+ZVvC/W3K8stf/7a8g2kGZIp52wlO8txZSUnHAFJl+QUBwm
         SfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328254; x=1783933054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ugj2Iq72eCviHxvR+s6BJF+8SBdQV0YogCYuKq+yjZ0=;
        b=j1BzbKl95MDRV+vZz/XltjJCMWWifnLD5APm/0CiAyWhwysYM127ozcMsxQYWu9zwy
         69/piu+hoHlsKWmq+pdfGi/TCBHAZzwq5yDoJVtCbrojGU0QdL7EQ+iVlFBRUD0BchB6
         7Y8x/+r8oqqg7ul9SdBmq6eDcmLwT5kjQ3GriydkeK0QW641xp/oO1k5hhNZN/YhY1Xt
         zQp25M5QG2Gn3KHXF9atvqV8UFLlI+66TnE9ci2k0u/jkZuSmdlR3Mz79SbenB6gZUdv
         wjuXzVVE2MM0U+BMkj93hjzx7tY/J1fiAZOOr6DJz9+GCab4lqWZJue5ZOX2BpnbVkvP
         7TDA==
X-Forwarded-Encrypted: i=1; AHgh+RrG4UHAtkP0a9zGdV20bCT/zwi6j7GQlX7btCzzH4WlTl7asRPEW8g0hGO2wUGdFuGnN8hSnx5HlHpQACd2@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxSjQLE1NBhaPAMpuvf2y6idqlxVe3S5RlS8W3kYfgj8GkoFY
	TRduWeuqAJSKiBON593/BBdlvebXfX65Qbj3jx7Nk7QlOi1r6DGzpBvZpK9XMR0WMup6cmm0nYB
	sI9g+hdEj8FNHVFbsPOUrEUa2EQm0ntPJ0DFeVJYcFrR8721xTZbpjuiFluXI7FkUibmg
X-Gm-Gg: AfdE7cniu6VEhSL3b5c3i2+dfTa8sk9z+EC+rD1wvvl6M/QTwWCqXgMRwkbHRackLOi
	2+7yb872XkEvkL7azS3Hfyovvx5Cvrris+TnIPzO4ItjDfKt2jSRc7RAG+N3y8V0oYF+fOHUrJA
	9A/yJcyib3s1cAbd4+NY6RS9s3U7LDaMRDqukrnIM1FG5nhtVkAIUNSnXEg3n0iCyHTw1Kxo6A9
	FyIEI64urjEqHWjxNvtqx4/vEnYbUNheQIYscJip0kuMyMlF/i0rq3HXgxmzhiSaavras67DKW2
	Qy7gNcwkdSWBLLks8s6azLRYbNj5vGz1XNmRqL+yvPe0WmHpgrkdiepnyQmqQMV8jQIT8vYmtr6
	UxwvW3l3nK2UgnNCB1AWvJhxgW/lBSi1929Q=
X-Received: by 2002:a17:903:1b6c:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2cc5f485a7emr87489665ad.44.1783328253910;
        Mon, 06 Jul 2026 01:57:33 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2cc5f485a7emr87489415ad.44.1783328253445;
        Mon, 06 Jul 2026 01:57:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:14 +0530
Subject: [PATCH 2/4] dt-bindings: clock: qcom: Add support for Camera Clock
 Controller for Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-2-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: tK16v4GQq8J_xLwEHGDrg66DE_7Iz7Hu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX1tlbIJQDIZco
 pP7Hg0SPcu6pMc1MZ4JiTLzLPQvkFWP4Rd+0ybU4l4vJp3WlGlcxyn69VfEfuVpmVZi2m469en7
 XtJolQ1Zz/yIrwZvj4GA+hIfour6XGw=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6dff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DwuFpA9Xkn-Unn7vKawA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX4ETDqV0PB2j5
 EV4OvQKavTDq2OfS1PBqRCUrf7uz2u2h0eOHb9miUJwiOaWrp+OpoWnJ7rezbfvNoaQXTdGnAAZ
 vM0mUnYZ9EiiS3I5cjhj6Fh+gjoSR6w0OsuuIUiYnP4F6AQYGCyMXtxU9kXBx2iwggXgHwTXRUb
 hn7mdSzKFM4BPvbPsaC8vvUt4oiOwMQLRvD5mNEfCF6Yvqg3jQiauolVUC1usVF3++k1o18q5Q8
 oCPlxDsVKgjC0pL3X5R7Ln/Pc2VAgJ5jWCQPgYH33rcisn9DJn1TOM46XAePgt1dZSUOUCeAxSE
 5PmYIe1SLtpEPzLHy912O+jbnyVkuvbJrpzqFN1hPQ32ngZ/H0rQ1qSiG3poNlYDunvArK52PfM
 hHzve1yyYEp1//skIjA/+34pyKlYutNQSIEQxf5yrIdm4s1gy36RfyWH+btrXM2Llk27QMjwbis
 ZoUViaIT8ZSFS4kaw6A==
X-Proofpoint-ORIG-GUID: tK16v4GQq8J_xLwEHGDrg66DE_7Iz7Hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FBEE70ECA2

Update the compatible and the bindings for CAMCC support on Nord
SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
 include/dt-bindings/clock/qcom,nord-camcc.h        | 167 +++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 8492a7ef73245e4440d6e30c2fd942319126458e..8e460df9f7444e80be537f7b9544db519c775ae8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -18,6 +18,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,kaanapali-camcc.h
     include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
+    include/dt-bindings/clock/qcom,nord-camcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -29,6 +30,7 @@ properties:
     enum:
       - qcom,kaanapali-cambistmclkcc
       - qcom,kaanapali-camcc
+      - qcom,nord-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
diff --git a/include/dt-bindings/clock/qcom,nord-camcc.h b/include/dt-bindings/clock/qcom,nord-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..655fef2084a580cdaabf8870a209b32b604c8af0
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-camcc.h
@@ -0,0 +1,167 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_NORD_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAMNOC_DCD_XO_CLK				0
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				1
+#define CAM_CC_CAMNOC_RT_AXI_CLK				2
+#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				3
+#define CAM_CC_CAMNOC_XO_CLK					4
+#define CAM_CC_CCI_0_CLK					5
+#define CAM_CC_CCI_0_CLK_SRC					6
+#define CAM_CC_CCI_1_CLK					7
+#define CAM_CC_CCI_1_CLK_SRC					8
+#define CAM_CC_CCI_2_CLK					9
+#define CAM_CC_CCI_2_CLK_SRC					10
+#define CAM_CC_CCI_3_CLK					11
+#define CAM_CC_CCI_3_CLK_SRC					12
+#define CAM_CC_CCI_4_CLK					13
+#define CAM_CC_CCI_4_CLK_SRC					14
+#define CAM_CC_CCU_FAST_AHB_CLK					15
+#define CAM_CC_CORE_AHB_CLK					16
+#define CAM_CC_CPHY_RX_CLK_SRC					17
+#define CAM_CC_CSI0PHYTIMER_CLK					18
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				19
+#define CAM_CC_CSI1PHYTIMER_CLK					20
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				21
+#define CAM_CC_CSI2PHYTIMER_CLK					22
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI3PHYTIMER_CLK					24
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY2_CLK					33
+#define CAM_CC_CSIPHY3_CLK					34
+#define CAM_CC_CSIPHY4_CLK					35
+#define CAM_CC_FAST_AHB_CLK_SRC					36
+#define CAM_CC_GDSC_CLK						37
+#define CAM_CC_ICP_0_AHB_CLK					38
+#define CAM_CC_ICP_0_CLK					39
+#define CAM_CC_ICP_0_CLK_SRC					40
+#define CAM_CC_ICP_1_AHB_CLK					41
+#define CAM_CC_ICP_1_CLK					42
+#define CAM_CC_ICP_1_CLK_SRC					43
+#define CAM_CC_IFE_0_MAIN_CLK					44
+#define CAM_CC_IFE_0_MAIN_CLK_SRC				45
+#define CAM_CC_IFE_0_MAIN_FAST_AHB_CLK				46
+#define CAM_CC_IFE_0_PCP_CLK					47
+#define CAM_CC_IFE_0_PCP_FAST_AHB_CLK				48
+#define CAM_CC_IFE_0_SCALAR_CLK					49
+#define CAM_CC_IFE_0_SCALAR_FAST_AHB_CLK			50
+#define CAM_CC_IFE_0_TMC_CLK					51
+#define CAM_CC_IFE_0_TMC_FAST_AHB_CLK				52
+#define CAM_CC_IFE_1_MAIN_CLK					53
+#define CAM_CC_IFE_1_MAIN_CLK_SRC				54
+#define CAM_CC_IFE_1_MAIN_FAST_AHB_CLK				55
+#define CAM_CC_IFE_1_PCP_CLK					56
+#define CAM_CC_IFE_1_PCP_FAST_AHB_CLK				57
+#define CAM_CC_IFE_1_SCALAR_CLK					58
+#define CAM_CC_IFE_1_SCALAR_FAST_AHB_CLK			59
+#define CAM_CC_IFE_1_TMC_CLK					60
+#define CAM_CC_IFE_1_TMC_FAST_AHB_CLK				61
+#define CAM_CC_IFE_2_MAIN_CLK					62
+#define CAM_CC_IFE_2_MAIN_CLK_SRC				63
+#define CAM_CC_IFE_2_MAIN_FAST_AHB_CLK				64
+#define CAM_CC_IFE_2_PCP_CLK					65
+#define CAM_CC_IFE_2_PCP_FAST_AHB_CLK				66
+#define CAM_CC_IFE_2_SCALAR_CLK					67
+#define CAM_CC_IFE_2_SCALAR_FAST_AHB_CLK			68
+#define CAM_CC_IFE_2_TMC_CLK					69
+#define CAM_CC_IFE_2_TMC_FAST_AHB_CLK				70
+#define CAM_CC_IFE_LITE_AHB_CLK					71
+#define CAM_CC_IFE_LITE_CLK					72
+#define CAM_CC_IFE_LITE_CLK_SRC					73
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				74
+#define CAM_CC_IFE_LITE_CSID_CLK				75
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				76
+#define CAM_CC_IPE_0_AHB_CLK					77
+#define CAM_CC_IPE_0_CLK					78
+#define CAM_CC_IPE_0_CLK_SRC					79
+#define CAM_CC_IPE_0_FAST_AHB_CLK				80
+#define CAM_CC_IPE_1_AHB_CLK					81
+#define CAM_CC_IPE_1_CLK					82
+#define CAM_CC_IPE_1_CLK_SRC					83
+#define CAM_CC_IPE_1_FAST_AHB_CLK				84
+#define CAM_CC_PLL0						85
+#define CAM_CC_PLL0_OUT_EVEN					86
+#define CAM_CC_PLL0_OUT_ODD					87
+#define CAM_CC_PLL2						88
+#define CAM_CC_PLL2_OUT_EVEN					89
+#define CAM_CC_PLL3						90
+#define CAM_CC_PLL3_OUT_EVEN					91
+#define CAM_CC_PLL4						92
+#define CAM_CC_PLL4_OUT_EVEN					93
+#define CAM_CC_PLL5						94
+#define CAM_CC_PLL5_OUT_EVEN					95
+#define CAM_CC_PLL6						96
+#define CAM_CC_PLL6_OUT_EVEN					97
+#define CAM_CC_QDSS_DEBUG_CLK					98
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				99
+#define CAM_CC_QDSS_DEBUG_XO_CLK				100
+#define CAM_CC_QUP_AHBM_CLK					101
+#define CAM_CC_QUP_AHBM_CLK_SRC					102
+#define CAM_CC_QUP_CORE_2X_CLK					103
+#define CAM_CC_QUP_CORE_2X_CLK_SRC				104
+#define CAM_CC_QUP_CORE_2X_DIV_CLK_SRC				105
+#define CAM_CC_QUP_CORE_CLK					106
+#define CAM_CC_QUP_SE_CLK					107
+#define CAM_CC_QUP_SE_CLK_SRC					108
+#define CAM_CC_QUP_SLEEP_CLK					109
+#define CAM_CC_SFE_LITE_0_CLK					110
+#define CAM_CC_SFE_LITE_0_FAST_AHB_CLK				111
+#define CAM_CC_SFE_LITE_1_CLK					112
+#define CAM_CC_SFE_LITE_1_FAST_AHB_CLK				113
+#define CAM_CC_SFE_LITE_2_CLK					114
+#define CAM_CC_SFE_LITE_2_FAST_AHB_CLK				115
+#define CAM_CC_SLEEP_CLK					116
+#define CAM_CC_SLEEP_CLK_SRC					117
+#define CAM_CC_SLOW_AHB_CLK_SRC					118
+#define CAM_CC_SM_OBS_CLK					119
+#define CAM_CC_TOP_AHB_CLK					120
+#define CAM_CC_TOP_FAST_AHB_CLK					121
+#define CAM_CC_TOP_IFE_0_CLK					122
+#define CAM_CC_TOP_IFE_1_CLK					123
+#define CAM_CC_TOP_IFE_2_CLK					124
+#define CAM_CC_TOP_IFE_LITE_CLK					125
+#define CAM_CC_TOP_IPE_0_CLK					126
+#define CAM_CC_TOP_IPE_1_CLK					127
+#define CAM_CC_TOP_QUP_AHBM_CLK					128
+#define CAM_CC_TOP_SFE_LITE_0_CLK				129
+#define CAM_CC_TOP_SFE_LITE_1_CLK				130
+#define CAM_CC_TOP_SFE_LITE_2_CLK				131
+#define CAM_CC_TPG_CSIPHY_RX_CLK				132
+#define CAM_CC_XO_CLK_SRC					133
+
+/* CAM_CC power domains */
+#define CAM_CC_IFE_0_GDSC					0
+#define CAM_CC_IFE_1_GDSC					1
+#define CAM_CC_IFE_2_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_IPE_1_GDSC					4
+#define CAM_CC_TITAN_TOP_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_CCU_BCR						0
+#define CAM_CC_ICP_0_BCR					1
+#define CAM_CC_ICP_1_BCR					2
+#define CAM_CC_IFE_0_BCR					3
+#define CAM_CC_IFE_1_BCR					4
+#define CAM_CC_IFE_2_BCR					5
+#define CAM_CC_IPE_0_BCR					6
+#define CAM_CC_IPE_1_BCR					7
+#define CAM_CC_QDSS_DEBUG_BCR					8
+#define CAM_CC_SFE_LITE_0_BCR					9
+#define CAM_CC_SFE_LITE_1_BCR					10
+#define CAM_CC_SFE_LITE_2_BCR					11
+
+#endif

-- 
2.34.1


