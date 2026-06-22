Return-Path: <linux-arm-msm+bounces-113931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cAAuLTDROGpJigcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 491226ACE36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IUrniO+a;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jEIWqt+1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D41530315E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CD235C1A1;
	Mon, 22 Jun 2026 06:07:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188935DA65
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108425; cv=none; b=NZHaCivHf5ARxeeWcxevrjP/5jUYTwKpT9Y+27ksS30Lhi40QWspDZhWVssuvPVNPZnuTjvW7mk9xBmgG4OOM8e+mbbr4oMo4DMkqAWRtfQ5y8UB4PXeFI5d5EXDuobuoMrNp6WXgaRehyleYqaSFzrkcjZcmwPCfVGvQucRgx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108425; c=relaxed/simple;
	bh=EeCOzBFzLfdn68K0NHPbkB6kmZPDlrF8OdyZOOk27OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHlE4ryP5S6+UPFvRXZFb0vRS30LnEHC+c6AnDFCflU5REegCdEd1sw5kBf95Rfzw3cvFNvFbbf1pp0x0i3wx8vfyj8Bzmx+NXx6KDRtSmwpMQ0Lr1jqvFAKxjxRJKzEflPE4CGMSviC7M32GU0xxEQd/t9mPzqiAd0eZpIHzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUrniO+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEIWqt+1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59QMP3800857
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJd+VwhCUOgDKPUEKaJlxtNfCOg/wx7KAVVM9S5gYKE=; b=IUrniO+asoGJueez
	LAZy6IB7KI4SxTYIrKc3JYGQHshklL337xBkCNYbOaZeNwmcfqE+MXVyz1rm9X+b
	z0Ts5vZ6p8Uk7Y6VgcetDJ6BH85+OgE5kgGp0+NbO8qS8bVy6sI6wqeUw54HBiFA
	MSwfvADZl3k/tUwqS+Q+QGF4UyAMsm+O2wHE8lMbkwHr7i39TLcVeSp7YIpbEcj3
	+iPm4OHP6RdLqq7e7Mb7oeM+sC7PjGtEiDLhMmepNTYGEPl3k0bTBiwzut1M4U/t
	HufrfZE1SAm4wuOhM+wEiMHdvuZABYfK4Mn+bh0Ftmrf9OuBDe71Gjp1b5lgL0jf
	kJTIQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4u87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:07:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84534f17866so3288347b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782108422; x=1782713222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJd+VwhCUOgDKPUEKaJlxtNfCOg/wx7KAVVM9S5gYKE=;
        b=jEIWqt+1h3z8X+l1FdQa27I1LbkpCdJz1fkU6euJujDrdnsl04xpnX3yn1ZiOCK/xq
         JLLZEbuhzpZ1xxID8AVUa46VDSgToID4+C8lW4YVYGDMhOqqA9rIT1mA1zTPLnuqOAYe
         ACUCXa0nlOtuBm3jt72z4nAChl2Q+WOUvxdk+jzGumHKxgiWj0Qydxi1X3ZtbVIjR8fZ
         aMUSK3dNXNuBTETguqQkAoBJSn6ahiMf4vYiTOPt3tzID7hjpXQD9KS6RQjmANAX/b/t
         5khW0ijJe0v2C0NMB8H7sKdwJ0gKX38ttZ9uKN2Kdp5st3cAX+ZLe/Yl4qRPqNkjxp6x
         64/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108422; x=1782713222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJd+VwhCUOgDKPUEKaJlxtNfCOg/wx7KAVVM9S5gYKE=;
        b=WRGM+F2V7tNOF5A0KbAfobpmcFsrQSj3C2sSgw22xn/i++yTSnsD9Ao9NR4Y2vt5Y5
         Sl889RwEi0wfyeJDGi6XJi6SJOl6fNO7efLcMT9iPeQNOdvOgyQ3UpM+J7wObuz4Nqvm
         DVYux45gztJMdLpMJ/Mz0DEPanXaDJ6U3ZuSpajl8Xgr2aif2ETYR/ac+3jqYqP3CLf6
         yk4Ikj5s6olnmHXTcAGD9/u8hJIzYiJrMGCSqF4eY1NRwuh0HmKB4VuoUCLLZftUmW0D
         kpUoUNzczvIFiqP//TKJAKOCO1K6E9pEXagFLtsjqiTBJZ0TtDFO/acj3JAj3QPMvWnn
         weng==
X-Gm-Message-State: AOJu0YzYxlbgQUiBCxCcKdbxyNxMvuoGo0zHiLg/DtLvj9GvwEHMRfpz
	7OZLH4vh+FQbrDSBIKc69cFpIeHIv93z9TE8Lg0ErgRAX257HSjaEUrY4Q/nTwySvWi+q5OeCy7
	o39Y4oGk8OShOiC/YQHJe/Z6ulJk6tco7BR7pJYIwI08XNEOKlmA0peRhfSajUApGEUf8MTaDI3
	WB
X-Gm-Gg: AfdE7clAQpCQmRxfY0KW7ZgLEkK5QKLqHS8QKh+RE42FXxu2LdOJObkg6C2x+Xhi8M+
	/L1/4qDsvMqmbRH3n9GPpsfYIJwytaCN3Dp0nWD8Fm+BpFDEHbKNK+/aDzfcr12ZjYAvTCTAqtc
	kPs3fv/KHa9PEjALfJSMxTSkllwPtqWbyD2jg8kTEOybkzasOVc6RUeFJoezPVUP0JGux+L7WOn
	4p1tlIk4HYOqQeDGIhxwJ9qpCxQpslEUfHEFLsEFeofArdrVBbriZtzVMscJHMNQr/w0ICsmlEo
	5iKVg5tjdp9D5Z93ZcWVZT6Kqm76DNpwmNDJvao+tNgVPhfzYkwYL5fkZWEERSP4UsUBtQHVXTj
	00zRG7TtlzdT0eq5DLk0MdeW/6whPPyGEJA==
X-Received: by 2002:a05:6a00:3d56:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845625b56fcmr9195751b3a.41.1782108422239;
        Sun, 21 Jun 2026 23:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d56:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845625b56fcmr9195720b3a.41.1782108421756;
        Sun, 21 Jun 2026 23:07:01 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7696dsm8040520b3a.37.2026.06.21.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:07:01 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 06:06:52 +0000
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom: document the RPMh
 Network-On-Chip interconnect in Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-maili_icc-v1-1-0aa8286e6748@oss.qualcomm.com>
References: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
In-Reply-To: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 42bYYbu_xKlJeA0mKONE8-KBDgx0KD97
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfX6Pri6lx1ouoD
 tt1Vpe/Yu0mFEoBI2keJIwzPcZmXkbWwp/36zhlNmm/PfqLpwTEX4NlfwTgYcOOvAkJ5mn7W47e
 ENne1JrsspzO5GxEo2K9bHV3G82Kebk=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38d106 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=jEvNu9c1Eb-cNSkZFhUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfX7mHwiKWu2B1r
 uKcal3AUhpzI9mw7R6j/YBXtwfR3hueE86eOjokVpqTHji94A6OYXMoabYYurjaftrJK06Dvh3v
 V7/4nGBB3KBbFjBLLmHxjay0YPEbTze0sgzV/hfEL3G2xEG0iplqEmXGg3PJNAtaDD4bz1CBPMv
 aFFdWwBwRHREQdg+m9+8AD6y8ydZ14Tfop/5dKE23cJJtS7xtG3+8/VMz8EJHsbBMkoxBrKZqQ7
 AmCqfR3xo1vwDXv6r41ZxhIHrhp8cjcY9MITl1GHy9G8CvsBhG+t8KbZ4poBvL3/qhkoThuYa+Z
 akjpe9a3ZbkqJse7G2DIQ98PNOAvbv+uMb1aFfBJ7Z7+RdE0mSjAPIP4Caw8xt9zH/kl8PboGRX
 56O3lBcPejv6AGn/hRPAXzMHlx9c4EwhG4hgc6Kog9UX9O7+ZiV2k+7FE+XK9xSBF2mrZK/m5Jd
 K1wwfK/Qj5L9vYnGDDQ==
X-Proofpoint-ORIG-GUID: 42bYYbu_xKlJeA0mKONE8-KBDgx0KD97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113931-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 491226ACE36

Document the RPMh Network-On-Chip interconnect for the Qualcomm Maili
SoC.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,maili-rpmh.yaml     | 127 +++++++++++++++
 include/dt-bindings/interconnect/qcom,maili-rpmh.h | 172 +++++++++++++++++++++
 2 files changed, 299 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml
new file mode 100644
index 000000000000..3db8d8b23219
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,maili-rpmh.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,maili-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Maili SoC
+
+maintainers:
+  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,maili-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,maili-aggre-noc
+      - qcom,maili-clk-virt
+      - qcom,maili-cnoc-main
+      - qcom,maili-gem-noc
+      - qcom,maili-llclpi-noc
+      - qcom,maili-lpass-ag-noc
+      - qcom,maili-lpass-lpiaon-noc
+      - qcom,maili-lpass-lpicx-noc
+      - qcom,maili-mc-virt
+      - qcom,maili-mmss-noc
+      - qcom,maili-nsp-noc
+      - qcom,maili-pcie-anoc
+      - qcom,maili-stdst-cfg
+      - qcom,maili-stdst-main
+      - qcom,maili-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,maili-clk-virt
+              - qcom,maili-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,maili-aggre-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,maili-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,maili-aggre-noc
+              - qcom,maili-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gem_noc: interconnect@31100000 {
+      compatible = "qcom,maili-gem-noc";
+      reg = <0x31100000 0x160200>;
+      #interconnect-cells = <2>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre_noc: interconnect@f00000 {
+      compatible = "qcom,maili-aggre-noc";
+      reg = <0x00f00000 0x56200>;
+      #interconnect-cells = <2>;
+      clocks = <&gcc_phy_axi_clk>,
+               <&gcc_prim_axi_clk>,
+               <&rpmhcc_ipa_clk>;
+      qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,maili-rpmh.h b/include/dt-bindings/interconnect/qcom,maili-rpmh.h
new file mode 100644
index 000000000000..e7a957a9d0f0
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,maili-rpmh.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MAILI_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MAILI_H
+
+#define MASTER_QSPI_0				0
+#define MASTER_QUP_2				1
+#define MASTER_QUP_3				2
+#define MASTER_QUP_4				3
+#define MASTER_QUP_5				4
+#define MASTER_CRYPTO				5
+#define MASTER_IPA				6
+#define MASTER_QUP_1				7
+#define MASTER_SOCCP_PROC			8
+#define MASTER_QDSS_ETR				9
+#define MASTER_QDSS_ETR_1			10
+#define MASTER_SDCC_2				11
+#define MASTER_SDCC_4				12
+#define MASTER_UFS_MEM				13
+#define MASTER_USB3				14
+#define SLAVE_A1NOC_SNOC			15
+
+#define MASTER_DDR_EFF_VETO			0
+#define MASTER_QUP_CORE_0			1
+#define MASTER_QUP_CORE_1			2
+#define MASTER_QUP_CORE_2			3
+#define MASTER_QUP_CORE_3			4
+#define MASTER_QUP_CORE_4			5
+#define MASTER_QUP_CORE_5			6
+#define SLAVE_DDR_EFF_VETO			7
+#define SLAVE_QUP_CORE_0			8
+#define SLAVE_QUP_CORE_1			9
+#define SLAVE_QUP_CORE_2			10
+#define SLAVE_QUP_CORE_3			11
+#define SLAVE_QUP_CORE_4			12
+#define SLAVE_QUP_CORE_5			13
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_IPA_CFG				3
+#define SLAVE_IPC_ROUTER_FENCE			4
+#define SLAVE_SOCCP				5
+#define SLAVE_TME_CFG				6
+#define SLAVE_CNOC_CFG				7
+#define SLAVE_DDRSS_CFG				8
+#define SLAVE_IMEM				9
+#define SLAVE_PCIE_0				10
+#define SLAVE_PCIE_1				11
+
+#define MASTER_GIC				0
+#define MASTER_GPU_TCU				1
+#define MASTER_SYS_TCU				2
+#define MASTER_APPSS_PROC			3
+#define MASTER_GFX3D				4
+#define MASTER_LPASS_GEM_NOC			5
+#define MASTER_MSS_PROC				6
+#define MASTER_MNOC_HF_MEM_NOC			7
+#define MASTER_MNOC_SF_MEM_NOC			8
+#define MASTER_COMPUTE_NOC			9
+#define MASTER_ANOC_PCIE_GEM_NOC		10
+#define MASTER_QPACE				11
+#define MASTER_SNOC_SF_MEM_NOC			12
+#define MASTER_WLAN_Q6				13
+#define SLAVE_GEM_NOC_CNOC			14
+#define SLAVE_LLCC				15
+#define SLAVE_MEM_NOC_PCIE_SNOC			16
+
+#define MASTER_LPIAON_NOC_LLCLPI_NOC		0
+#define SLAVE_LPASS_LPI_CC			1
+#define SLAVE_LLCC_ISLAND			2
+#define SLAVE_SERVICE_LLCLPI_NOC		3
+#define SLAVE_SERVICE_LLCLPI_NOC_CHIPCX		4
+
+#define MASTER_LPIAON_NOC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LPASS_LPINOC			0
+#define SLAVE_LPIAON_NOC_LLCLPI_NOC		1
+#define SLAVE_LPIAON_NOC_LPASS_AG_NOC		2
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPICX_NOC_LPIAON_NOC		1
+
+#define MASTER_LLCC				0
+#define MASTER_DDR_RT				1
+#define SLAVE_EBI1				2
+#define SLAVE_DDR_RT				3
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_MDP				1
+#define SLAVE_MNOC_HF_MEM_NOC			2
+
+#define MASTER_CAMNOC_NRT_ICP_SF		0
+#define MASTER_CAMNOC_RT_CDM_SF			1
+#define MASTER_CAMNOC_SF			2
+#define MASTER_MDSS_DCP				3
+#define MASTER_CDSP_HCP				4
+#define MASTER_VIDEO_CV_PROC			5
+#define MASTER_VIDEO_EVA			6
+#define MASTER_VIDEO_MVP			7
+#define MASTER_VIDEO_V_PROC			8
+#define SLAVE_MNOC_SF_MEM_NOC			9
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC			3
+#define SLAVE_SERVICE_PCIE_ANOC			4
+
+#define MASTER_CFG_CENTER			0
+#define MASTER_CFG_EAST				1
+#define MASTER_CFG_MM_HF			2
+#define MASTER_CFG_MM_SF			3
+#define MASTER_CFG_NORTH			4
+#define MASTER_CFG_SOUTH			5
+#define MASTER_CFG_WEST				6
+#define SLAVE_AHB2PHY_SOUTH			7
+#define SLAVE_BOOT_ROM				8
+#define SLAVE_CAMERA_CFG			9
+#define SLAVE_CLK_CTL				10
+#define SLAVE_CRYPTO_CFG			11
+#define SLAVE_DISPLAY_CFG			12
+#define SLAVE_EVA_CFG				13
+#define SLAVE_GFX3D_CFG				14
+#define SLAVE_I2C				15
+#define SLAVE_IMEM_CFG				16
+#define SLAVE_IPC_ROUTER_CFG			17
+#define SLAVE_IRIS_CFG				18
+#define SLAVE_CNOC_MSS				19
+#define SLAVE_PCIE_0_CFG			20
+#define SLAVE_PCIE_1_CFG			21
+#define SLAVE_PRNG				22
+#define SLAVE_QSPI_0				23
+#define SLAVE_QUP_1				24
+#define SLAVE_QUP_2				25
+#define SLAVE_QUP_3				26
+#define SLAVE_QUP_4				27
+#define SLAVE_QUP_5				28
+#define SLAVE_SDCC_2				29
+#define SLAVE_SDCC_4				30
+#define SLAVE_TLMM				31
+#define SLAVE_UFS_MEM_CFG			32
+#define SLAVE_USB3				33
+#define SLAVE_VSENSE_CTRL_CFG			34
+#define SLAVE_PCIE_ANOC_CFG			35
+#define SLAVE_QDSS_CFG				36
+#define SLAVE_QDSS_STM				37
+#define SLAVE_TCSR				38
+#define SLAVE_TCU				39
+
+#define MASTER_CNOC_STARDUST			0
+#define SLAVE_STARDUST_CENTER_CFG		1
+#define SLAVE_STARDUST_EAST_CFG			2
+#define SLAVE_STARDUST_MM_HF_CFG		3
+#define SLAVE_STARDUST_MM_SF_CFG		4
+#define SLAVE_STARDUST_NORTH_CFG		5
+#define SLAVE_STARDUST_SOUTH_CFG		6
+#define SLAVE_STARDUST_WEST_CFG			7
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_APSS_NOC				1
+#define MASTER_CNOC_SNOC			2
+#define SLAVE_SNOC_GEM_NOC_SF			3
+
+#endif

-- 
2.43.0


