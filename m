Return-Path: <linux-arm-msm+bounces-113365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K4n3AmIhMWrTcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:11:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD968E030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:11:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l9lyVmJM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZwoHrGGv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113365-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113365-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA623179BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1A428498;
	Tue, 16 Jun 2026 10:08:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514864279FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604525; cv=none; b=YTXNjc8FdTr0XNk39jVjXMgspFtwbJyLecH+7D/YAZHr2LkWFP0CyK16AtQU7S8n1IstcTHACwO5xHD9KMkoomg9jYuVyU3WNdbX90HioSymwxzvBon0u5S+yKqQHSSeUXJQ3o4hXSAeoOYKePsXqFVRsPVJuj7XI5O8EE4m6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604525; c=relaxed/simple;
	bh=tdClT2nnZsirj5XS71qVphdgmNblxxO6LiiQtz3W7SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXsbMc4RzfhXfcYkhu83FFspHeAKjAfKvtscea096aDSvbfGHmVx0QBq5rtnTkgfo6hrHxdpTCIVv87VLVUY1Lec5fDLktt8ib/2uvyFovQULaaxnn4yG0qK9z1GxmMCS0YlL3tbp6AenC7utMJoyqLr2x6274WJz5wjduXvy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9lyVmJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwoHrGGv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64bnn2911790
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWEnVwVsCKYZx/cV4aRwjJDnM9vVjfC1hSghAKVdypc=; b=l9lyVmJMX8Ioz1Me
	VE7dq5OkBA+VXtlmG9XIYn7sy8JSwxuppV0yrIn9K9vRwoPfdhIHcVVphV8jsJ8F
	1bSlkAaddPQssC/YvUfFaq0IiasEHbKVMjOv6sbDwMY1z4a4c0i0j5ejQgSzrD+H
	xgTiYol5okggw/N65k2sXeDz/9AvFeB9CVETGHYxKwFVl1TWsCz2bo9rQvi+3rOp
	uXQQ4Wy/jcmqcI3K/Ihu48X8t5QGonPHIBK7W8QxxGcx3qCPEUhU8zo56H/KiqEn
	cbSNAKdWE6plPU5tTPjjonqYcVgqmRrUKmK7rhWXzJIXsI77ZkBeHSF/cnPdXp2p
	K+bXmQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52seh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so4875737eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604520; x=1782209320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWEnVwVsCKYZx/cV4aRwjJDnM9vVjfC1hSghAKVdypc=;
        b=ZwoHrGGv903zO5ziUyLUm9unpm+P7AdvVpOge1nWpmcWGSr2fO38U4YzaqOySe1aAy
         RqdcykmbaWP8qsOvPtvl+/XFaVQLSe5/9TLRiyX9iSej5vg/5HvBAbGMddtGmR2n80OL
         aluiSCjF6nWVP/0EYX5C3h8j3x3BjKvNxSZposevgaFMkxsha2Db/c7UIppQiqpIW8Nl
         cIPd5DNXWtfJfxbdQAgaFBMoquZojCJAS3aLY/bNTNqC81PxmoIu+qRPmOL9qiJ8ztoU
         9zcUj/o5SG7RBz44bcMbukSso+FrqGAkzJBnxD2TDqz1ghPkGtg5JJC3uegddKuXFsjY
         SefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604520; x=1782209320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWEnVwVsCKYZx/cV4aRwjJDnM9vVjfC1hSghAKVdypc=;
        b=rFjyqi5zFxyO0ZAWYqW3sq/tXyHMa54975QSpK7YeD45J/aXCeJL3rSJRxDeFliJwU
         rMenNGKX75I6q8LxtW/nHpAUCBU2nnv+RVbT+XN0GgoKChyyAJjwja9Ddq5JfIVUDTuC
         XqestTVPm2f80aKtyEL6+/i3fCbJX4rgcRLJDZblnYtY2+bEATglTGQHoZ7XPriBOOkw
         Qb9B1t8J6LIeKARIsZ6ANBUgcLX1rgzFOSVFwaczsJ9pArH1fJz1BmiX7SAoudkR9uWq
         PxUk2AcnJrpJYjVyjyVKlhfNkHlA2178IpxerLm/RIgI1AYtq3wdATRd6FnYBMuDc2Om
         R0fQ==
X-Gm-Message-State: AOJu0YxBdFqr+n/zVsVoh2tqa/WXI/g10St87odSoPqZXUQl8CVyURth
	pQG6PutCIuGIcZ6seNCQqb5aD5H0CO2ppZGvaY5lj4Ofmd7lWwnJn7ep6mZxdW7GTtxiv0osrUj
	BmvfDQLOexR5l9xigDsX9VkCVuCt4zv7kAzGgQWmIeezpir8i8Ou3Ng2q6WpC2z4TTO3j
X-Gm-Gg: Acq92OErPVKc5CPfLJSY58LNdn2IPyzKo4g0IDYM4kvPR4I924iAuc+E5BbxlXsWkha
	xzaSHBSgaKd7f/QHd+1JkXvFZlb4lEUdoG890JtrFWYuWepmYsDcjG/wcAzZA7JLLn1c2AEI0tP
	Id5t8xEoBa+ZVa2lmKzBTDN67qXrH3bOWdzDoX0DNocu6+GQFZdHXW1AtCHjL3xX/kOM8ZFsUlB
	52ATibrfYmJ3MhpztSqK9u7QPWspXIJwfHBujLC+0gVAaQekbUf5Q+rkDxtUmCDwotpdRQ33iRQ
	+2bnDkp8zuWlD2mskJHMZNxDsiAdsIqwX7E9fmnNlhYTZdj/2JCvIUU6rM1Wh09Cu4EepcNPWUg
	LivlBERNsz10Te66tefBv2m0R4zCdy+6m/kVSvhdbDTa5y86dnvUl7Ml1hSZnJ85Q64APMxGxUA
	==
X-Received: by 2002:a05:7300:511:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30940542b00mr9135224eec.35.1781604519792;
        Tue, 16 Jun 2026 03:08:39 -0700 (PDT)
X-Received: by 2002:a05:7300:511:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30940542b00mr9135175eec.35.1781604519036;
        Tue, 16 Jun 2026 03:08:39 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:38 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:08:26 -0700
Subject: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=26540;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tdClT2nnZsirj5XS71qVphdgmNblxxO6LiiQtz3W7SE=;
 b=YA0mhRp06G9Q0VOiM3fFqzUVjcVJUBRDlDYdttaBqGI7bTq+DUNmcvFZ5/EftUy11K7HZNoiQ
 0qTyqG3cJOEA05ytfq7GZmeSuvQ15dgvd5R2KUF/dxNHXhruzY/tkJA
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX6DTAacgvGnVh
 wEWmdVmF2V8z7m421BZOPJKnnzzk0aWkd+wAY3IVMxz5efBzhWhXAioFt30pDAi47SLBlVafPpj
 8Oi57jXxOMtCkqOv0GO8om0TQ0gG6Jk=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3120a9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vQIrXUVIb5AOOBylnWoA:9 a=9HcTsz3tu3xz1Vp_:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX9KtNIhgPOgvX
 qCJdg8M+yaayWdIOwapanvCfSLOxeCrjgbqp0x6GVmW6NYfPnTaE8+MT2LIx1ieEaa/12/Ycnwr
 DWZxXb0i2AuVOjxbWXHZGyY+RDWSZimaC14WCRBhTXFV5vqaG7tK+Osnyi2oG0j5sFiQI9P4v7X
 ICHa+DO9+g/Yv/pW/wHks3LuNy+rlSpIWE+M0B/skQdhH0Cc1R+ek0+MZjpR2ASA+QydEYePYBi
 uou6BorkjHiN4L2QFX51f2A7/N98J0lD6csKCKa4zulZi7+eZoIuB/95t4+i1BsZoSBzAWIxuOj
 tkP0epl0VI488YquHzXy61QMjis7/WTCLJn/BhGpiJ2oAKHBOb59wBy0D2jdwQB7IcJBAiXU7kr
 ePDedOiU33aWLIxIcGBLO7fSoNAn1Lrr09tra7m5NlJpQEH9D1UfxyYKl2QMj7jv96s/Z59kzEU
 +eqrgAGffOwV8O9YFUg==
X-Proofpoint-ORIG-GUID: Jfa3B4qsdXFlNvsnHmr0gQsSJPly1JCU
X-Proofpoint-GUID: Jfa3B4qsdXFlNvsnHmr0gQsSJPly1JCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113365-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88FD968E030

Add an initial driver for the Qualcomm PMIH010x PMIC haptics module,
named as HAP530_HV. This module supports several play modes, including
DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
and hardware data handling logic. Currently, the driver provides support
for two play modes using the input force-feedback framework: FF_CONSTANT
effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
waveform for FIFO mode.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/input/misc/Kconfig             |  11 +
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/qcom-spmi-haptics.c | 831 +++++++++++++++++++++++++++++++++
 3 files changed, 843 insertions(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 1f6c57dba030..eac939978ce4 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -236,6 +236,17 @@ config INPUT_PMIC8XXX_PWRKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called pmic8xxx-pwrkey.
 
+config INPUT_QCOM_SPMI_HAPTICS
+	tristate "Qualcomm SPMI PMIC haptics support"
+	depends on INPUT && MFD_SPMI_PMIC
+	help
+	  Say Y to enable support for the Qualcomm PMIH010X SPMI PMIC haptics
+	  module. Supports DIRECT_PLAY, FIFO streaming play modes via the
+	  Linux input force-feedback framework.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called qcom-spmi-haptics.
+
 config INPUT_SPARCSPKR
 	tristate "SPARC Speaker support"
 	depends on PCI && SPARC64
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 2281d6803fce..c5c9aa139a11 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_INPUT_PMIC8XXX_PWRKEY)	+= pmic8xxx-pwrkey.o
 obj-$(CONFIG_INPUT_POWERMATE)		+= powermate.o
 obj-$(CONFIG_INPUT_PWM_BEEPER)		+= pwm-beeper.o
 obj-$(CONFIG_INPUT_PWM_VIBRA)		+= pwm-vibra.o
+obj-$(CONFIG_INPUT_QCOM_SPMI_HAPTICS)	+= qcom-spmi-haptics.o
 obj-$(CONFIG_INPUT_QNAP_MCU)		+= qnap-mcu-input.o
 obj-$(CONFIG_INPUT_RAVE_SP_PWRBUTTON)	+= rave-sp-pwrbutton.o
 obj-$(CONFIG_INPUT_RB532_BUTTON)	+= rb532_button.o
diff --git a/drivers/input/misc/qcom-spmi-haptics.c b/drivers/input/misc/qcom-spmi-haptics.c
new file mode 100644
index 000000000000..75b3e338b54e
--- /dev/null
+++ b/drivers/input/misc/qcom-spmi-haptics.c
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
+
+/* HAP_CFG register offsets, bit fields, value constants */
+#define HAP_CFG_INT_RT_STS_REG		0x10
+#define  FIFO_EMPTY_BIT			BIT(1)
+#define HAP_CFG_EN_CTL_REG		0x46
+#define  HAPTICS_EN_BIT			BIT(7)
+#define HAP_CFG_VMAX_REG		0x48
+#define   VMAX_STEP_MV			50
+#define   VMAX_MV_MAX			10000
+#define HAP_CFG_SPMI_PLAY_REG		0x4C
+#define  PLAY_EN_BIT			BIT(7)
+#define  PAT_SRC_MASK			GENMASK(2, 0)
+#define   PAT_SRC_FIFO			0
+#define   PAT_SRC_DIRECT_PLAY		1
+#define HAP_CFG_TLRA_OL_HIGH_REG	0x5C
+#define  TLRA_OL_MSB_MASK		GENMASK(3, 0)
+#define   TLRA_STEP_US			5
+#define HAP_CFG_TLRA_OL_LOW_REG		0x5D
+#define HAP_CFG_DRV_DUTY_CFG_REG	0x60
+#define  ADT_DRV_DUTY_EN_BIT		BIT(7)
+#define  ADT_BRK_DUTY_EN_BIT		BIT(6)
+#define  DRV_DUTY_MASK			GENMASK(5, 3)
+#define   AUTORES_DRV_DUTY_62P5		2
+#define  BRK_DUTY_MASK			GENMASK(2, 0)
+#define   AUTORES_BRK_DUTY_62P5		5
+#define HAP_CFG_ZX_WIND_CFG_REG		0x62
+#define  ZX_DEBOUNCE_MASK		GENMASK(6, 4)
+#define   AUTORES_ZX_DEBOUNCE		3
+#define  ZX_WIN_HEIGHT_MASK		GENMASK(2, 0)
+#define   AUTORES_ZX_WIN_HEIGHT		2
+#define HAP_CFG_AUTORES_CFG_REG		0x63
+#define  AUTORES_EN_BIT			BIT(7)
+#define  AUTORES_EN_DLY_MASK		GENMASK(6, 2)
+#define   AUTORES_EN_DLY_CYCLES		10
+#define  AUTORES_ERR_WIN_MASK		GENMASK(1, 0)
+#define   AUTORES_ERR_WIN_25PCT		1
+#define HAP_CFG_FAULT_CLR_REG		0x66
+#define  ZX_TO_FAULT_CLR_BIT		BIT(4)
+#define  SC_CLR_BIT			BIT(2)
+#define  AUTO_RES_ERR_CLR_BIT		BIT(1)
+#define  HPWR_RDY_FAULT_CLR_BIT		BIT(0)
+#define  FAULT_CLR_ALL	(ZX_TO_FAULT_CLR_BIT | SC_CLR_BIT | \
+			 AUTO_RES_ERR_CLR_BIT | HPWR_RDY_FAULT_CLR_BIT)
+#define HAP_CFG_RAMP_DN_CFG2_REG	0x86
+#define  AUTORES_PRE_HIZ_DLY_10US	1
+
+/* HAP_PTN register offsets, bit fields, value constants */
+#define HAP_PTN_REVISION2_REG		0x01
+#define HAP_PTN_FIFO_DIN_0_REG		0x20
+#define HAP_PTN_FIFO_PLAY_RATE_REG	0x24
+#define  FIFO_PLAY_RATE_MASK		GENMASK(3, 0)
+#define HAP_PTN_DIRECT_PLAY_REG		0x26
+#define HAP_PTN_FIFO_EMPTY_CFG_REG	0x2A
+#define  FIFO_THRESH_LSB		64
+#define HAP_PTN_FIFO_DIN_1B_REG		0x2C
+#define HAP_PTN_MEM_OP_ACCESS_REG	0x2D
+#define  MEM_FLUSH_RELOAD_BIT		BIT(0)
+#define HAP_PTN_MMAP_FIFO_REG		0xA0
+#define  MMAP_FIFO_EXIST_BIT		BIT(7)
+#define  MMAP_FIFO_LEN_MASK		GENMASK(6, 0)
+#define HAP_PTN_PATX_PLAY_CFG_REG	0xA2
+
+#define HAP530_MEM_TOTAL_BYTES		8192
+#define FIFO_EMPTY_THRESH		280
+#define FIFO_INIT_FILL			320
+
+#define HAPTICS_AUTOSUSPEND_MS		1000
+
+/*
+ * FF_CUSTOM data layout (custom_data[] of type s16):
+ *   [0] = play rate (PLAY_RATE_*)
+ *   [1] = vmax in mV (0 = use device default from qcom,vmax-mv)
+ *   [2..N-1] = signed 8-bit PCM samples packed one per s16 (lower byte used)
+ */
+#define CUSTOM_DATA_RATE_IDX		0
+#define CUSTOM_DATA_VMAX_IDX		1
+#define CUSTOM_DATA_SAMPLE_START	2
+
+#define HAPTICS_MAX_EFFECTS		8
+
+enum qcom_haptics_mode {
+	HAPTICS_DIRECT_PLAY,
+	HAPTICS_FIFO,
+};
+
+enum qcom_haptics_play_rate {
+	PLAY_RATE_T_LRA       = 0,
+	PLAY_RATE_T_LRA_DIV_2 = 1,
+	PLAY_RATE_T_LRA_DIV_4 = 2,
+	PLAY_RATE_T_LRA_DIV_8 = 3,
+	/* 4–7 are reserved */
+	PLAY_RATE_F_8KHZ      = 8,
+	PLAY_RATE_F_16KHZ     = 9,
+	PLAY_RATE_F_24KHZ     = 10,
+	PLAY_RATE_F_32KHZ     = 11,
+	PLAY_RATE_F_44P1KHZ   = 12,
+	PLAY_RATE_F_48KHZ     = 13,
+	PLAY_RATE_MAX	      = PLAY_RATE_F_48KHZ,
+};
+
+struct qcom_haptics_effect {
+	enum qcom_haptics_mode mode;
+	enum qcom_haptics_play_rate play_rate;
+	u32 vmax_mv;
+	s8 *fifo_data;
+	u32 data_len;
+};
+
+/**
+ * struct qcom_haptics
+ * @dev:          underlying SPMI device
+ * @regmap:       regmap for SPMI register access
+ * @input:        input device exposing the FF interface
+ * @cfg_base:     base address of the CFG peripheral
+ * @ptn_base:     base address of the PTN peripheral
+ * @t_lra_us:     LRA resonance period in microseconds
+ * @vmax_mv:      maximum actuator drive voltage in millivolts
+ * @fifo_len:     programmed HW FIFO depth in bytes
+ * @gain:         playback gain scaler
+ * @play_work:    deferred work item that starts or stops playback
+ * @play_lock:    mutex lock to serialize playbacks
+ * @cur_effect_id: index into @effects[] identifying the active effect
+ * @fifo_empty_irq: IRQ number for the FIFO-empty interrupt
+ * @play_request: true when a playback is requested
+ * @pm_ref_held:  true while a pm_runtime_get is held
+ * @irq_enabled:  true if fifo_empty_irq is enabled
+ * @fifo_lock:    spinlock protecting the FIFO streaming data
+ * @fifo_data:    pointer of the data buffer for FIFO streaming
+ * @data_len:     length of the data buffer for current effect
+ * @data_written: number of samples written to the hardware FIFO
+ * @data_done:    flag to indicate that all samples have been written
+ * @effects:      table of the effects
+ */
+struct qcom_haptics {
+	struct device *dev;
+	struct regmap *regmap;
+	struct input_dev *input;
+
+	u32 cfg_base;
+	u32 ptn_base;
+	u32 t_lra_us;
+	u32 vmax_mv;
+	u32 fifo_len;
+	u16 gain;
+
+	struct work_struct play_work;
+	struct mutex play_lock; /* mutex used to serialize playbacks */
+	int cur_effect_id;
+	int fifo_empty_irq;
+	bool play_request;
+	bool pm_ref_held;
+	bool irq_enabled;
+
+	spinlock_t fifo_lock; /* protect the FIFO data during play */
+	const s8 *fifo_data;
+	u32 data_len;
+	u32 data_written;
+	bool data_done;
+
+	struct qcom_haptics_effect effects[HAPTICS_MAX_EFFECTS];
+};
+
+static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)
+{
+	return regmap_write(h->regmap, h->cfg_base + off, val);
+}
+
+static int cfg_update_bits(struct qcom_haptics *h, u32 off, u32 mask, u32 val)
+{
+	return regmap_update_bits(h->regmap, h->cfg_base + off, mask, val);
+}
+
+static int ptn_write(struct qcom_haptics *h, u32 off, u32 val)
+{
+	return regmap_write(h->regmap, h->ptn_base + off, val);
+}
+
+static int ptn_update_bits(struct qcom_haptics *h, u32 off, u32 mask, u32 val)
+{
+	return regmap_update_bits(h->regmap, h->ptn_base + off, mask, val);
+}
+
+static int ptn_bulk_write(struct qcom_haptics *h, u32 off,
+			  const void *buf, size_t count)
+{
+	return regmap_bulk_write(h->regmap, h->ptn_base + off, buf, count);
+}
+
+static int haptics_clear_faults(struct qcom_haptics *h)
+{
+	return cfg_write(h, HAP_CFG_FAULT_CLR_REG, FAULT_CLR_ALL);
+}
+
+static int haptics_set_vmax(struct qcom_haptics *h, u32 vmax_mv)
+{
+	return cfg_write(h, HAP_CFG_VMAX_REG, vmax_mv / VMAX_STEP_MV);
+}
+
+static int haptics_config_lra_period(struct qcom_haptics *h)
+{
+	u32 tmp = h->t_lra_us / TLRA_STEP_US;
+	int ret;
+
+	ret = cfg_write(h, HAP_CFG_TLRA_OL_HIGH_REG, (tmp >> 8) & TLRA_OL_MSB_MASK);
+	if (ret)
+		return ret;
+
+	return cfg_write(h, HAP_CFG_TLRA_OL_LOW_REG, tmp & 0xFF);
+}
+
+static int haptics_enable_module(struct qcom_haptics *h, bool enable)
+{
+	return cfg_update_bits(h, HAP_CFG_EN_CTL_REG, HAPTICS_EN_BIT,
+			       enable ? HAPTICS_EN_BIT : 0);
+}
+
+static int haptics_configure_autores(struct qcom_haptics *h)
+{
+	int ret;
+
+	/* AUTORES_CFG: enable, 10-cycle delay, 25% error window */
+	ret = cfg_write(h, HAP_CFG_AUTORES_CFG_REG,
+			AUTORES_EN_BIT |
+			FIELD_PREP(AUTORES_EN_DLY_MASK, AUTORES_EN_DLY_CYCLES) |
+			FIELD_PREP(AUTORES_ERR_WIN_MASK, AUTORES_ERR_WIN_25PCT));
+	if (ret)
+		return ret;
+
+	/* DRV_DUTY: adaptive drive/brake duty cycles at 62.5% */
+	ret = cfg_write(h, HAP_CFG_DRV_DUTY_CFG_REG,
+			ADT_DRV_DUTY_EN_BIT | ADT_BRK_DUTY_EN_BIT |
+			FIELD_PREP(DRV_DUTY_MASK, AUTORES_DRV_DUTY_62P5) |
+			FIELD_PREP(BRK_DUTY_MASK, AUTORES_BRK_DUTY_62P5));
+	if (ret)
+		return ret;
+
+	/* Pre-HIZ delay: 10 µs */
+	ret = cfg_write(h, HAP_CFG_RAMP_DN_CFG2_REG, AUTORES_PRE_HIZ_DLY_10US);
+	if (ret)
+		return ret;
+
+	/* Zero-cross window: debounce 3, no hysteresis, height 2 */
+	return cfg_write(h, HAP_CFG_ZX_WIND_CFG_REG,
+			 FIELD_PREP(ZX_DEBOUNCE_MASK, AUTORES_ZX_DEBOUNCE) |
+			 FIELD_PREP(ZX_WIN_HEIGHT_MASK, AUTORES_ZX_WIN_HEIGHT));
+}
+
+static int haptics_write_fifo_chunk(struct qcom_haptics *h,
+				    const s8 *data, u32 len)
+{
+	u32 i, bulk_len = ALIGN_DOWN(len, 4);
+	int ret;
+
+	for (i = 0; i < bulk_len; i += 4) {
+		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
+		if (ret)
+			return ret;
+	}
+
+	for (; i < len; i++) {
+		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Configure the hardware FIFO memory boundary.
+ * FIFO occupies addresses [0, fifo_len).
+ */
+static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
+{
+	u32 fifo_len, fifo_units;
+
+	/* Config all memory space for FIFO usage for now */
+	fifo_len = HAP530_MEM_TOTAL_BYTES;
+	fifo_len = ALIGN_DOWN(fifo_len, 64);
+	fifo_units = fifo_len / 64;
+	h->fifo_len = fifo_len;
+
+	return ptn_write(h, HAP_PTN_MMAP_FIFO_REG,
+			 MMAP_FIFO_EXIST_BIT |
+			 FIELD_PREP(MMAP_FIFO_LEN_MASK, fifo_units - 1));
+}
+
+static u32 haptics_gain_scaled_vmax(struct qcom_haptics *h, u32 vmax_mv)
+{
+	u32 v = (u32)((u64)vmax_mv * h->gain / 0xFFFF);
+
+	return max_t(u32, v, VMAX_STEP_MV);
+}
+
+static void haptics_fifo_irq_enable(struct qcom_haptics *h, bool enable)
+{
+	if (h->irq_enabled == enable)
+		return;
+
+	if (enable)
+		enable_irq(h->fifo_empty_irq);
+	else
+		disable_irq_nosync(h->fifo_empty_irq);
+
+	h->irq_enabled = enable;
+}
+
+/*
+ * Must be called with play_lock held.
+ * Clears PLAY_EN and resets any FIFO-specific state.
+ */
+static void haptics_stop_locked(struct qcom_haptics *h)
+{
+	unsigned long flags;
+
+	cfg_write(h, HAP_CFG_SPMI_PLAY_REG, 0);
+
+	if (h->effects[h->cur_effect_id].mode == HAPTICS_FIFO) {
+		ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+		haptics_fifo_irq_enable(h, false);
+		spin_lock_irqsave(&h->fifo_lock, flags);
+		h->fifo_data = NULL;
+		spin_unlock_irqrestore(&h->fifo_lock, flags);
+	}
+}
+
+static int haptics_start_direct_play(struct qcom_haptics *h, int effect_id)
+{
+	struct ff_effect *ffe = &h->input->ff->effects[effect_id];
+	u8 amplitude = (u8)((u32)ffe->u.constant.level * 255 / 0x7FFF);
+	int ret;
+
+	ret = haptics_clear_faults(h);
+	if (ret)
+		return ret;
+
+	/* Enable auto-resonance for DIRECT_PLAY mode */
+	ret = cfg_update_bits(h, HAP_CFG_AUTORES_CFG_REG,
+			      AUTORES_EN_BIT, AUTORES_EN_BIT);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, haptics_gain_scaled_vmax(h, h->vmax_mv));
+	if (ret)
+		return ret;
+
+	ret = ptn_write(h, HAP_PTN_DIRECT_PLAY_REG, amplitude);
+	if (ret)
+		return ret;
+
+	return cfg_write(h, HAP_CFG_SPMI_PLAY_REG,
+			 PLAY_EN_BIT | FIELD_PREP(PAT_SRC_MASK, PAT_SRC_DIRECT_PLAY));
+}
+
+static int haptics_start_fifo(struct qcom_haptics *h, int effect_id)
+{
+	struct qcom_haptics_effect *eff = &h->effects[effect_id];
+	u32 vmax = eff->vmax_mv ? eff->vmax_mv : h->vmax_mv;
+	unsigned long flags;
+	u32 init_len;
+	int ret;
+
+	ret = haptics_clear_faults(h);
+	if (ret)
+		return ret;
+
+	/* Disable auto-resonance for FIFO mode */
+	ret = cfg_update_bits(h, HAP_CFG_AUTORES_CFG_REG, AUTORES_EN_BIT, 0);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, haptics_gain_scaled_vmax(h, vmax));
+	if (ret)
+		return ret;
+
+	ret = ptn_update_bits(h, HAP_PTN_FIFO_PLAY_RATE_REG,
+			      FIFO_PLAY_RATE_MASK,
+			      FIELD_PREP(FIFO_PLAY_RATE_MASK, eff->play_rate));
+	if (ret)
+		return ret;
+
+	/* Flush FIFO before loading new data */
+	ret = ptn_write(h, HAP_PTN_MEM_OP_ACCESS_REG, MEM_FLUSH_RELOAD_BIT);
+	if (ret)
+		return ret;
+	ret = ptn_write(h, HAP_PTN_MEM_OP_ACCESS_REG, 0);
+	if (ret)
+		return ret;
+
+	/* Write the initial chunk and initialise streaming state */
+	init_len = min_t(u32, eff->data_len, FIFO_INIT_FILL);
+	ret = haptics_write_fifo_chunk(h, eff->fifo_data, init_len);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&h->fifo_lock, flags);
+	h->fifo_data    = eff->fifo_data;
+	h->data_len     = eff->data_len;
+	h->data_written = init_len;
+	h->data_done    = (init_len >= eff->data_len);
+	spin_unlock_irqrestore(&h->fifo_lock, flags);
+
+	/*
+	 * Set empty threshold.  When threshold > 0 the hardware fires the
+	 * FIFO-empty interrupt when occupancy drops below the threshold,
+	 * allowing the driver to refill.  A threshold of 0 disables the IRQ.
+	 */
+	ret = ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, h->data_done ? 0 :
+			FIFO_EMPTY_THRESH / FIFO_THRESH_LSB);
+	if (ret)
+		return ret;
+	if (!h->data_done)
+		haptics_fifo_irq_enable(h, true);
+
+	return cfg_write(h, HAP_CFG_SPMI_PLAY_REG,
+			 PLAY_EN_BIT | FIELD_PREP(PAT_SRC_MASK, PAT_SRC_FIFO));
+}
+
+/*
+ * Threaded IRQ handler for the FIFO-empty interrupt.
+ *
+ * While a FIFO play is in progress the hardware fires this interrupt when
+ * the number of samples in the FIFO drops below the programmed threshold.
+ * The handler refills the FIFO from the effect's data buffer.  When all
+ * samples have been written the threshold is set to zero, which suppresses
+ * further interrupts; the hardware drains the remaining samples naturally
+ * and the play work handler stops the engine on the next invocation.
+ */
+static irqreturn_t haptics_fifo_empty_irq(int irq, void *dev_id)
+{
+	struct qcom_haptics *h = dev_id;
+	unsigned long flags;
+	u32 sts, to_write;
+	int ret;
+
+	ret = regmap_read(h->regmap,
+			  h->cfg_base + HAP_CFG_INT_RT_STS_REG, &sts);
+	if (ret || !(sts & FIFO_EMPTY_BIT))
+		return IRQ_HANDLED;
+
+	spin_lock_irqsave(&h->fifo_lock, flags);
+
+	if (!h->fifo_data) {
+		spin_unlock_irqrestore(&h->fifo_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	if (h->data_done) {
+		ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+		h->fifo_data = NULL;
+		h->play_request = false;
+		schedule_work(&h->play_work);
+		spin_unlock_irqrestore(&h->fifo_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	/* Refill: write the next chunk, conservatively sized to the threshold */
+	to_write = min_t(u32, h->data_len - h->data_written,
+			 h->fifo_len - FIFO_EMPTY_THRESH);
+	haptics_write_fifo_chunk(h, &h->fifo_data[h->data_written], to_write);
+	h->data_written += to_write;
+
+	if (h->data_written >= h->data_len) {
+		/* Last chunk enqueued; disable threshold to stop further IRQs */
+		h->data_done = true;
+		ptn_write(h, HAP_PTN_FIFO_EMPTY_CFG_REG, 0);
+	}
+
+	spin_unlock_irqrestore(&h->fifo_lock, flags);
+	return IRQ_HANDLED;
+}
+
+static void haptics_play_work(struct work_struct *work)
+{
+	struct qcom_haptics *h = container_of(work, struct qcom_haptics, play_work);
+	int id, ret;
+
+	mutex_lock(&h->play_lock);
+
+	if (!h->play_request) {
+		haptics_stop_locked(h);
+		if (h->pm_ref_held) {
+			pm_runtime_mark_last_busy(h->dev);
+			pm_runtime_put_autosuspend(h->dev);
+			h->pm_ref_held = false;
+		}
+		goto unlock;
+	}
+
+	ret = pm_runtime_resume_and_get(h->dev);
+	if (ret < 0) {
+		dev_err(h->dev, "failed to resume device: %d\n", ret);
+		goto unlock;
+	}
+	h->pm_ref_held = true;
+
+	id = h->cur_effect_id;
+
+	switch (h->effects[id].mode) {
+	case HAPTICS_DIRECT_PLAY:
+		ret = haptics_start_direct_play(h, id);
+		break;
+	case HAPTICS_FIFO:
+		ret = haptics_start_fifo(h, id);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(h->dev, "failed to start effect %d: %d\n", id, ret);
+		pm_runtime_put_autosuspend(h->dev);
+		h->pm_ref_held = false;
+	}
+
+unlock:
+	mutex_unlock(&h->play_lock);
+}
+
+static int haptics_upload_effect(struct input_dev *dev,
+				 struct ff_effect *effect,
+				 struct ff_effect *old)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+	struct qcom_haptics_effect *priv;
+	int id = effect->id;
+	s16 *buf;
+	u32 i;
+
+	if (id < 0 || id >= HAPTICS_MAX_EFFECTS)
+		return -EINVAL;
+
+	priv = &h->effects[id];
+
+	switch (effect->type) {
+	case FF_CONSTANT:
+		kfree(priv->fifo_data);
+		priv->fifo_data = NULL;
+		priv->data_len  = 0;
+		priv->mode = HAPTICS_DIRECT_PLAY;
+		return 0;
+
+	case FF_PERIODIC:
+		if (effect->u.periodic.waveform != FF_CUSTOM)
+			return -EINVAL;
+		/*
+		 * Minimum 3 elements: play-rate code + vmax + at least one sample.
+		 * No upper bound: the FIFO is refilled continuously from the IRQ
+		 * handler, so any length of PCM data is supported.
+		 */
+		if (effect->u.periodic.custom_len < 3)
+			return -EINVAL;
+
+		buf = memdup_array_user(effect->u.periodic.custom_data,
+					effect->u.periodic.custom_len,
+					sizeof(s16));
+		if (IS_ERR(buf))
+			return PTR_ERR(buf);
+
+		if (buf[CUSTOM_DATA_RATE_IDX] > PLAY_RATE_MAX) {
+			kfree(buf);
+			return -EINVAL;
+		}
+
+		priv->play_rate = (u8)buf[CUSTOM_DATA_RATE_IDX];
+		priv->vmax_mv   = (u32)clamp_val(buf[CUSTOM_DATA_VMAX_IDX], 0, VMAX_MV_MAX);
+		priv->data_len = effect->u.periodic.custom_len - CUSTOM_DATA_SAMPLE_START;
+
+		kfree(priv->fifo_data);
+		priv->fifo_data = kmalloc(priv->data_len, GFP_KERNEL);
+		if (!priv->fifo_data) {
+			kfree(buf);
+			return -ENOMEM;
+		}
+
+		/* Pack: one s8 sample per s16 slot (lower byte) */
+		for (i = 0; i < priv->data_len; i++)
+			priv->fifo_data[i] = (s8)buf[CUSTOM_DATA_SAMPLE_START + i];
+
+		kfree(buf);
+		priv->mode = HAPTICS_FIFO;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int haptics_playback(struct input_dev *dev, int effect_id, int val)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+
+	h->cur_effect_id = effect_id;
+	h->play_request  = (val > 0);
+	schedule_work(&h->play_work);
+	return 0;
+}
+
+static int haptics_erase(struct input_dev *dev, int effect_id)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+	struct qcom_haptics_effect *priv = &h->effects[effect_id];
+
+	kfree(priv->fifo_data);
+	priv->fifo_data = NULL;
+	priv->data_len  = 0;
+	return 0;
+}
+
+static void haptics_set_gain(struct input_dev *dev, u16 gain)
+{
+	struct qcom_haptics *h = input_get_drvdata(dev);
+
+	h->gain = gain;
+}
+
+static int qcom_haptics_probe(struct platform_device *pdev)
+{
+	struct qcom_haptics *h;
+	struct input_dev *input;
+	struct ff_device *ff;
+	u32 regs[2];
+	int ret, irq;
+
+	h = devm_kzalloc(&pdev->dev, sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return -ENOMEM;
+
+	h->dev = &pdev->dev;
+
+	h->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!h->regmap)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "no regmap from parent\n");
+
+	ret = device_property_read_u32_array(&pdev->dev, "reg", regs,
+					     ARRAY_SIZE(regs));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read 'reg' property\n");
+
+	h->cfg_base = regs[0];
+	h->ptn_base = regs[1];
+
+	ret = of_property_read_u32(h->dev->of_node, "qcom,lra-period-us",
+				   &h->t_lra_us);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "missing qcom,lra-period-us\n");
+
+	ret = of_property_read_u32(h->dev->of_node, "qcom,vmax-mv", &h->vmax_mv);
+	if (ret)
+		return dev_err_probe(h->dev, ret, "missing qcom,vmax-mv\n");
+
+	h->vmax_mv = clamp(h->vmax_mv, (u32)VMAX_STEP_MV, (u32)VMAX_MV_MAX);
+
+	ret = haptics_config_lra_period(h);
+	if (ret)
+		return ret;
+
+	ret = haptics_configure_autores(h);
+	if (ret)
+		return ret;
+
+	ret = haptics_set_vmax(h, h->vmax_mv);
+	if (ret)
+		return ret;
+
+	ret = haptics_configure_fifo_mmap(h);
+	if (ret)
+		return ret;
+
+	mutex_init(&h->play_lock);
+	spin_lock_init(&h->fifo_lock);
+	INIT_WORK(&h->play_work, haptics_play_work);
+	h->gain = 0xFFFF;
+
+	irq = platform_get_irq_byname(pdev, "fifo-empty");
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq,
+				     "failed to get fifo-empty IRQ\n");
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					haptics_fifo_empty_irq,
+					IRQF_ONESHOT,
+					"qcom-haptics-fifo-empty", h);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to request fifo-empty IRQ\n");
+
+	h->fifo_empty_irq = irq;
+	disable_irq_nosync(irq);
+
+	input = devm_input_allocate_device(&pdev->dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name     = "qcom-spmi-haptics";
+	input_set_drvdata(input, h);
+	h->input = input;
+
+	input_set_capability(input, EV_FF, FF_CONSTANT);
+	input_set_capability(input, EV_FF, FF_PERIODIC);
+	input_set_capability(input, EV_FF, FF_CUSTOM);
+	input_set_capability(input, EV_FF, FF_GAIN);
+
+	ret = input_ff_create(input, HAPTICS_MAX_EFFECTS);
+	if (ret)
+		return ret;
+
+	ff = input->ff;
+	ff->upload   = haptics_upload_effect;
+	ff->playback = haptics_playback;
+	ff->erase    = haptics_erase;
+	ff->set_gain = haptics_set_gain;
+
+	ret = input_register_device(input);
+	if (ret) {
+		input_ff_destroy(input);
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register input device\n");
+	}
+
+	platform_set_drvdata(pdev, h);
+
+	/*
+	 * Grab a reference on behalf of probe (usage_count → 1), mark the
+	 * device active, then enable runtime PM.
+	 */
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, HAPTICS_AUTOSUSPEND_MS);
+	devm_pm_runtime_set_active_enabled(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+}
+
+static void qcom_haptics_remove(struct platform_device *pdev)
+{
+	struct qcom_haptics *h = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+
+	cancel_work_sync(&h->play_work);
+	mutex_lock(&h->play_lock);
+	haptics_stop_locked(h);
+	haptics_enable_module(h, false);
+	mutex_unlock(&h->play_lock);
+
+	input_unregister_device(h->input);
+}
+
+static int qcom_haptics_runtime_suspend(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	return haptics_enable_module(h, false);
+}
+
+static int qcom_haptics_runtime_resume(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	return haptics_enable_module(h, true);
+}
+
+static int qcom_haptics_suspend(struct device *dev)
+{
+	struct qcom_haptics *h = dev_get_drvdata(dev);
+
+	cancel_work_sync(&h->play_work);
+	mutex_lock(&h->play_lock);
+	haptics_stop_locked(h);
+	if (h->pm_ref_held) {
+		pm_runtime_put_noidle(dev);
+		h->pm_ref_held = false;
+	}
+	mutex_unlock(&h->play_lock);
+	return pm_runtime_force_suspend(dev);
+}
+
+static int qcom_haptics_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops qcom_haptics_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(qcom_haptics_suspend, qcom_haptics_resume)
+	RUNTIME_PM_OPS(qcom_haptics_runtime_suspend, qcom_haptics_runtime_resume,
+		       NULL)
+};
+
+static const struct of_device_id qcom_haptics_of_match[] = {
+	{ .compatible = "qcom,pmih010x-haptics" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_haptics_of_match);
+
+static struct platform_driver qcom_haptics_driver = {
+	.probe  = qcom_haptics_probe,
+	.remove = qcom_haptics_remove,
+	.driver = {
+		.name		= "qcom-spmi-haptics",
+		.of_match_table	= qcom_haptics_of_match,
+		.pm		= pm_ptr(&qcom_haptics_pm_ops),
+	},
+};
+module_platform_driver(qcom_haptics_driver);
+
+MODULE_DESCRIPTION("Qualcomm SPMI PMIC Haptics driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


