Return-Path: <linux-arm-msm+bounces-115570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpCGK1WsRGpIywoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:57:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 065676EA0AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 07:57:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y8aDjuET;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MuHKKZWr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115570-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115570-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26D223047064
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 05:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037DF392C29;
	Wed,  1 Jul 2026 05:56:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982FA3815C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 05:56:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885365; cv=none; b=CK3T/LXfrm6EU4cP8ky+SmxO1iTKeA/TjSshalQ6Jfu1DgIUH987SUsM6UQXpb6dO+Q1D/8/E0GZTlm32v9nXb8eeOAyg5ZPWcGC/aZS2kWIM3FqxcqBNIrC36k78dFgrZwej7BBKg91sOtzRoeBVv//klwJMTmhmWMXMQsSEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885365; c=relaxed/simple;
	bh=HKFOu1fNblOcn/HFOdu48EyT+lBa2UuOd8Ya8wh5870=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AI10loobW/zwtwyJcXsWbbMgbwpE6sUzIf+4Pw2xNl8Tf7yAivUEreI5DjZMtgvPkCFUmN3D4ZPgpT9EcsSa+SKGe423bkmxmdQnqDjHig3QWHw5QuFxFzo1SrpCs0eDog5YMZB/KTDJ7oZleh9mv/nJDiqHIQs0XrSgd/DrUQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8aDjuET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuHKKZWr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lTG8140756
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 05:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g0+lG/T+afF
	4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=; b=Y8aDjuETy9TX9pqF3g7vV7t1M6K
	M/pd7hk5Ez7/24lOylHcAwBSbrR8uOCYTx8sAHuWGT6kfKLKTqsPSnx+K8yh245h
	qkycdnzV5D+9UsBQaRGVuEKxRqeaRLaszn+1rs67SGrQutfMBZaxmxRVrod8kUFt
	T9i5nO4jfGJImK1Zz2GKGpuEvOln6jEAs7cHX0evTeL26WoPmXlCTVxcMO90o32F
	pYyTgRObV5w0G15fNZ+BoBSdegMsjkBcoLpddvnAdNWzN1mhXhkrR2pEzJkBy6ru
	FCLHWLY1by+QY/B3zAP0zE2+5JSpqfpy9KEd47E+rLCVx60WSyxUHPxwUzg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99jn79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:56:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c825562f8bso3514185ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885363; x=1783490163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=MuHKKZWr5rvpUDRgDg0/AcGisQgSoljLpCzNaF7AeAb5DkWHcL/20SJPh90hl+vqv6
         vbJrVxp2C3+/VxGBS7UF5cG3B/rx3OpzMzof8x7qI0cymTxkvrI7dLqCC2QiT4bPH5wE
         TK3KEeDJgdU17cIjwarRBdH9QpMsUj+z79c3egy1UT1BzraLen0tPojGKfKNLLmnA1eJ
         Vl2vR7ZwJP6fQzEs1VQmqY1UmBcw7txU67hTMN62blDoWAnQol13RX2fbEBVMLGlpoCk
         Cc/lzCbVsBscrNlZYjbPEji+NykMpmolbAKeNnqWXzlbZkQHDlsOW2POrmmjjn+D7ReZ
         chKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885363; x=1783490163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+lG/T+afF4ySmlryIDom0iKLYnuD7FP3qAhyNGYbE=;
        b=ToVMkWAf7jIj4lFBo9vdoydww+twXmaMvJmsjfwcyd9jykbvQYX2pYt69+qnZxSj3E
         klGlYDdQCtNRGE0HXbru3JyBVd3afj40V6wikJXhdfFHC1x8keLXeqGnaPMjepqxKUyf
         KwILH85newjt7gjdqDzJn78CHtejO8OPqAzPQMaEyKQbZZlkuZy7ztHTeJkMVSBUmjSc
         PMaf0TQut9qvusXksMgeXo+FKoNIYcs92YYlDnEJ0TST/kVcFWP5h428YbCpBI8skx4n
         5R/esjJ/3abm1yT1CRa6+sBRUAsjNBfkq1fmtbA50Ss9041Ialoh30/FxdU1R3WWDd5L
         k6FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok3SVX2UH9PwnO5a3CxWIjj625tJP/msQmoss4yyFQLlsVxbiXOWjYvnTBs6oGeeH61VfqdginEzyQaEc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Rfa7XrhUE+d+schcaG5qR5shaYYe2Nt+9RJF33buoi+FS6V1
	I3STRcR6N6iZtyDsy0YMgqGhb9MEy/85Djr3wKrdF7OLvmRoRO/rNl4jD+q0c9cqsviGBBfQTvX
	dyb8b2+NLsKVj87ZvSXtvMuhhXEtGSryoVdYwFamwStR61c8g1hrrxDlRgFeOjdZ618Lr
X-Gm-Gg: AfdE7cmm/Htpfkf+zsTLe7Hpp6HinugKtb0pIBuzE1PKTwHlb8N4pPeuS8eEN0lYxxV
	jdX4Nq0iB8OCnVKM06yXFSBUw/9pmdZs2o9LEcCB4+CO2OYvTAV9QFVdCpk6KaDSweKa1EcJ0u9
	SY2QtxQNPSoWzQ0IFGXDZK6uEx5evPSRTY6jKQ6f70zTECu2aPCFbhNP1MQgPqOn6cisrRGsvwS
	3DXSBxuErm06gMWVj5DkGMLZmkeCpk8g2Ta117TEFitnQ2qLoeNSVOexJPxqn6kFfDWZ5bW5HLf
	EW0/rZOMo/VYHSxKDDbhO2zMgJ6vhwKPSUGOB7Y+iR73Z3y1A+82iL36C024EzIZE1VHKxgJS9M
	nfQBuYWT/11wPyDp8zWyjrYOezVM+fWnl3lXVRvEuu1lCsesE1DaoYIPHzRT2ly8IeQ==
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3899165ad.6.1782885363192;
        Tue, 30 Jun 2026 22:56:03 -0700 (PDT)
X-Received: by 2002:a17:902:f652:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2ca7e65473fmr3898875ad.6.1782885362709;
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:02 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v15 1/7] dt-bindings: arm: Add support for Qualcomm TGU trace
Date: Tue, 30 Jun 2026 22:55:23 -0700
Message-Id: <20260701055529.445819-2-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX0YxZWfdj7VME
 shJEBROmP1jE7V/MiLlukFjgMI4OMdppkr6NYAnrqLCfzufWPhDKEtKbrwADB+b6zXBvGVrsYKj
 naFQoRDLNJ4k9HzPdgOJ/yy3YM0ga2k=
X-Proofpoint-ORIG-GUID: gz1X08jT7-I1uk-kgBoxllXsugr9VK6v
X-Proofpoint-GUID: gz1X08jT7-I1uk-kgBoxllXsugr9VK6v
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44abf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N3VNWiZ0WD7Ir0aJMQYA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXyCA8QJyCc5dL
 32TbNJJPt6wJ630/fwQp0wITsDHfZYatuafuRz9hJ3HFI+gHydZY4IhO9O2Bil/vS2ZnAgfBXG+
 9UhW6XGL9x1M8x0pi/FpB2ILpdCaXiSkksbO2bvtJMSBzRvjXgTi21bjE7xJxALQnMwQ8yJFn6s
 ec94XHES1KCjXbiNJX+DHoJgVvC95ZC5ew3G/CNp1DyRSye9Bjtk83l3/Wu8989UaUIRgDTiMsN
 j1P6Ynx/tPo3dc+uTPDk70RkbyfbBWgTdwLYa6SucFWSj3iRygD02/lcEIfATnWhmKb1ScZzLdE
 U2+hyOFFAykCTbJVXZ1Z6T9dLXDXZjoT/K1OhcDbRfCRoWHrjctN9WTNnGkFEL3XaQRS8ANqe2z
 /W2HHnZsp4siJyJTCAWUKHnQokHIIcpozRcTm5Y7pvHGsY+1FNm5JuUyhMIUO8UVPi0v2t8xxQK
 WfJ7nT3nnJqI0k2soyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-115570-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:songwei.chai@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 065676EA0AE

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
 .../devicetree/bindings/arm/qcom,tgu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
new file mode 100644
index 000000000000..76440f2497b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
@@ -0,0 +1,71 @@
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
+    };
+...
-- 
2.34.1


