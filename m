Return-Path: <linux-arm-msm+bounces-94196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN9WGm6qn2m1dAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:05:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DB19FFE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22073302529F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 02:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0038537416C;
	Thu, 26 Feb 2026 02:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4EixJ0t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E58i9CNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ACD374193
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772071516; cv=none; b=GsURNztTxOY988QGwbyg1s2kUHiq5f2HtFV/SdJ0REisHf1rVyJQghzEOVhP8dK7vPhAVxOXS+NCBK8OdoqutC9zeVWS8Apqc2rMfZYmczdijt2zgHQHCNsOr7I7QYzw/kFlKEiywejBf/Te/bwyY6G7SESElbzVM4QJcT3ljAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772071516; c=relaxed/simple;
	bh=6VY87t9VghiDLhppTTyGc/EGkt+kVJvSCivK71N+61o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nw29TFc1u/1EmfK/HLuR6bZDGpiJ1L+Vol/5HhSBdRBsNDqIVH65FJVlniB+F0vOA6KBm/6xP+S3mDERuRaEVKg4/iVgfVdiMz0UuFLgppYmyvvYb+UCz0ikDnn9ISc0DA99FSEoNFYFlNJHUnLtBI+3YdR/Hv4qGW8RtCwxLyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4EixJ0t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E58i9CNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PKfiK02523686
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nWc4h1iM5D
	mFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=; b=A4EixJ0ttI4hMqhdfYd/U5eSWWO
	gYXDR044Y6JnDWur5+VdBa3bEfY/vnXdx+HmIq69cMyMYV/NFXJX5lksESB8DP7o
	FzJE0/RTBCsX1cpm3iaXaNbpnZwFBdVoU1/r2KrndX4H6KPkAPVNrrWH7IcDnDc2
	RxQESbIxtiycPQ8GQJ+oHwRfJrOHVtLBSUA77/8arAqP00/FabAMSPRWmWZG3K2X
	Dij9l+JLZsoZxSDr/6sSwysz1GcoXPEF+0EPSJ3MIJpUHKNdRvkH3uU+YcEh0YX6
	5rEImtjzyq3UxkMrLRDBN1kaxKyiqWGfCyHPSJnkvOqqr9OHFek5gldyALQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd8pd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:05:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6798747187eso4134325eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 18:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071514; x=1772676314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=E58i9CNmheepFDR6O+byfqkfueZpte6wYweqRFD5aSJxKSGKTQm9eFMNMiOR6OW0IO
         8Fxvln8MRZ8fts01g976rov2afSwlqYq3tXzS/oa4rVvuEAh5v4okdaqNxIAd2e/Pats
         iQDL19ywoJz/KPCQ/jISx1BKkjq8ywJVXus7HMDEm8b0pV4KpVc4BM2J2qvWl3YuJ+Oc
         M/1bm0XGu4xun4UONhGhQ9ObnOwfFpHvnT+tOvSatvctbDCe79YJVsf7B9pRVtulMjrB
         mdeSk5+v9qcm4iraL4CNffzMeIF15i+uyYuoseyeHKmUHwwQzsbY3RY8hZTnwPdShbe8
         DWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071514; x=1772676314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nWc4h1iM5DmFVSbqSbzqsFj4rfaS5ymL17azyq0Eek=;
        b=VJTmhdJMeMnzxpYPvPvoIieBLzShpC06p+dw0l7iRJH1hUkoUOYrQu4APTOk0PPf57
         qKknCz/m0+bBoYhbjMZoZcL8NryLi7eP2KMtBkdLIiKEUFSgDUoPLbGJ8WCvB2RjB2jv
         E9OPf2dIwoYXbSR/Lsp77+nDpp+IIvR+eoyeMo37Je44GXXcShh/QzLaxpoMMovRXK92
         V17lZaRGH6+4UTXtkOCroXtglmgCxolIdhsWEMIaPIAA8cVES7BlWErXkmrIagJS/kMH
         +/Je3ew1H4Z4pfQ3yma1FFFjXG5G2XtbV0RQ4Aaw7cZIxsFK2JY1eu0hiUOo9t71ph9M
         zj8A==
X-Forwarded-Encrypted: i=1; AJvYcCWOfftNUSss4M4nIisjzE9uyHp1IE4LxIolQ+3Ffiq2Pmvk0tbcWCrH3Ufx+UwDk/6tvkG7oKzDGGzqPblG@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0U7XsE6/j2TxzP+OEX1zWzW9Uofi2mkjknysB471/gQ7m6P1
	Y8a+ousOvXtOvhahpJbtXX0KC/OWtISDjyIHyT5C3uih0X0bDFsyG9YO936nlrs7uPKyqTQmajT
	1jhowf2JkUAO8T2ZkS3shaa8xSW/e+qksgPnqqC12sB4FdsVagH9x9q8jWJl7qJcEDAzs
X-Gm-Gg: ATEYQzzjJ503O4SB7n5pG9fVz4VHvJoN5Pdidu5s7w8lP20WyW13zzpCSB/rQ22QlPG
	X1rFuG6PmvVWi9aITBu7Ne2AaBWnhTXl8XnwRUj6U6n/VEr/DTY1s/YEh6b7LRKqoeMUPB19Jqn
	3STf2aJ1BR8NS7KewjBlbV6gs+iOmjJUzjUXtNkN6ZSaUhrtXbyfLaeRj2P5ZAgIPQq8veTTd3/
	x2rc7UZqmRiyfUS62xFmCz9sczM7Qs7mH4qcdbNo043SpN58goZP+hxqgovH1jsDeVIZSTvbqAh
	zrgWzyL6XFRchZndRtvJ4xM6/XIck+YWGRBkmVmwvcmL6pb+ZEwPRVIc1kkjbvfL2KNyGaI9jWw
	F0A8CZLiZQHM5S1QZWi70xOyb7Lk8jXMokn44SSepa5igFCDatOC76DC05QWEVCGbW9W+0uuZjO
	uK
X-Received: by 2002:a05:6820:1994:b0:679:ef25:336e with SMTP id 006d021491bc7-679f3d042f6mr328416eaf.27.1772071514091;
        Wed, 25 Feb 2026 18:05:14 -0800 (PST)
X-Received: by 2002:a05:6820:1994:b0:679:ef25:336e with SMTP id 006d021491bc7-679f3d042f6mr328387eaf.27.1772071513698;
        Wed, 25 Feb 2026 18:05:13 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:13 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Wed, 25 Feb 2026 18:04:48 -0800
Message-Id: <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=699faa5a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: N1lVEvmwS2qc_nqIYmQ6IyORFALdr_vn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfXwCnrCawYXPkr
 0G2eJZacooiaNrC2atdKb+Io0eZEvWw0u0ezXA668YgtLU3SyiC/MdiIHj31P6D4mq3E6kZfIZW
 W+dY4mUQinl2MQVXB8PrbOftGbNmwj7865+Tb+RUrtYh5KwZFEVWMwhv2xG6DWXaDUVDjQm7aJh
 JQBIEDGeS0hfp1NmdE+/KbhczRehw6Zm/uj+ToBS4cBdzMIIB/y6hoyijobX3K1TIrYabypqJPI
 XhjmIGZGnxb1bn0AYcEvWfdhvWFuhPQytPDAYh0frLgwzRtenXUpzigya6mN/8t/jNbJlxT0JHZ
 Qyno5VxVp8GTa5Ycj5AQuKyMTicpX4TBtPES3sVJKEs0M2grDc0+l0fQnuR6Ed9r7F7nW8s8Wn/
 NLlR3TC8kojqeKe9PdsC2DDuiaGJNhS8Dxc3SLbhi2IDH1z6Syy9H3hSf3NOB8B/45aOQnqffVX
 FJxawczA4/dwF8AbU8Q==
X-Proofpoint-ORIG-GUID: N1lVEvmwS2qc_nqIYmQ6IyORFALdr_vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260016
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94196-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,10b0e000:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B54DB19FFE8
X-Rspamd-Action: no action

The Trigger Generation Unit (TGU) is designed to detect patterns or
sequences within a specific region of the System on Chip (SoC). Once
configured and activated, it monitors sense inputs and can detect a
pre-programmed state or sequence across clock cycles, subsequently
producing a trigger.

   TGU configuration space
        offset table
 x-------------------------x
 |                         |
 |                         |
 |                         |                           Step configuration
 |                         |                             space layout
 |   coresight management  |                           x-------------x
 |        registers        |                     |---> |             |
 |                         |                     |     |  reserve    |
 |                         |                     |     |             |
 |-------------------------|                     |     |-------------|
 |                         |                     |     | priority[3] |
 |         step[7]         |<--                  |     |-------------|
 |-------------------------|   |                 |     | priority[2] |
 |                         |   |                 |     |-------------|
 |           ...           |   |Steps region     |     | priority[1] |
 |                         |   |                 |     |-------------|
 |-------------------------|   |                 |     | priority[0] |
 |                         |<--                  |     |-------------|
 |         step[0]         |-------------------->      |             |
 |-------------------------|                           |  condition  |
 |                         |                           |             |
 |     control and status  |                           x-------------x
 |           space         |                           |             |
 x-------------------------x                           |Timer/Counter|
                                                       |             |
						       x-------------x
TGU Configuration in Hardware

The TGU provides a step region for user configuration, similar
to a flow chart. Each step region consists of three register clusters:

1.Priority Region: Sets the required signals with priority.
2.Condition Region: Defines specific requirements (e.g., signal A
reaches three times) and the subsequent action once the requirement is
met.
3.Timer/Counter (Optional): Provides timing or counting functionality.

Add a new tgu.yaml file to describe the bindings required to
define the TGU in the device trees.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..5b6a58ebe691
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger Generation Unit - TGU
+
+description: |
+  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
+  to sense a plurality of signals and create a trigger into the CTI or
+  generate interrupts to processors. The TGU is like the trigger circuit
+  of a Logic Analyzer. The corresponding trigger logic can be realized by
+  configuring the conditions for each step after sensing the signal.
+  Once setup and enabled, it will observe sense inputs and based upon
+  the activity of those inputs, even over clock cycles, may detect a
+  preprogrammed state/sequence and then produce a trigger or interrupt.
+
+  The primary use case of the TGU is to detect patterns or sequences on a
+  given set of signals within some region to identify the issue in time
+  once there is abnormal behavior in the subsystem.
+
+maintainers:
+  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
+  - Songwei Chai <songwei.chai@oss.qualcomm.com>
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,tgu
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: qcom,tgu
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          The port mechanism here ensures the relationship between TGU and
+          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
+          function as TPDM's helper and enable TGU when the connected
+          TPDM is enabled.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    tgu@10b0e000 {
+        compatible = "qcom,tgu", "arm,primecell";
+        reg = <0x10b0e000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb_pclk";
+
+        in-ports {
+            port {
+                tgu_in_tpdm_swao: endpoint{
+                    remote-endpoint = <&tpdm_swao_out_tgu>;
+                };
+            };
+        };
+    };
+...
-- 
2.34.1


