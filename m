Return-Path: <linux-arm-msm+bounces-102457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLmBJ9Fu12k5OAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:18:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D43C85C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AA8309A05E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CAA3ACA61;
	Thu,  9 Apr 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVkwiW2a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrujOzFD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA663AC0E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725922; cv=none; b=R2BMJGx2NaEZMnObb7WG/NvFpXsINtMmpCHVvyYfhcG6EV+RGMqhvX4oCR3tsl8xcc83Xp46qTCEcBSDGxFNkjIeHOeyXSCxdsoGxJGf/VHoGlsDMveh0seHAKA1XbtMmMTIGmp20DFw3O5hnowQ6rLOTg8yRMntxjkOANiSnjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725922; c=relaxed/simple;
	bh=2XnojtAV6Jabz+DcCTp8/qRw/weq1RG9ib4HGeGsZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MasYwEHkQfWOl/3lJMEFCZuV7su7+nGu4HnAU1VvZ+rlD0cEa1U3msQiA7S7OBDVxsFSSoO7ecPba2EP5Oq4wkjbML7Nseo0UeC8lPY5qRQoAfb0XNn0jDGltFT7kXS+LdqIbw2sLqc4r+y6MTpESC9sNLiUetMKrgV24D+F00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVkwiW2a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrujOzFD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63950L5M2614625
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X2JYhH0Sc21
	8HR/g51BpETqibfN74W5aDBvbTHVRBgY=; b=YVkwiW2aKKODH5QSHGoFZA8CTeE
	JXrKCwgUkIBrrsahzQmN2ZGlQs7ixVWpyrayH4uL/roifHluR09h1nqUEH86nRKY
	KuLxD3zPTfIM0/UBVuZx695j+t6Oe/1wSY583HTzHsJQSelaVAC9Ogf/kzWBdfZB
	u4AFkOm6oc+tzMc+1gbJmTFW8HkRuNSg9lo03xQMYrrCK+guX/j5kG7adXAc2Cis
	kL765Cw6KQrgkkX+ZpsvQQVdpaYNoFdPLrDV/XfywzHKgHQjbjuxFrrCCvXHdQeT
	30a54kh0YO6BvohaK58ImMybkiHU3cI0P/tJQFZUjZsaSmDDAf8ej5zILjg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt28ucf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:11:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so669880eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725915; x=1776330715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2JYhH0Sc218HR/g51BpETqibfN74W5aDBvbTHVRBgY=;
        b=VrujOzFDWAtTi1nuBGd0eOqTraJb16lZGfk+e4y2pqVN3BhU4qFfcFE1q+iqgg1vXX
         VtvNMUbm31Og6KeXhdYaGTy9qBIUEnahSW0N/y26AKuyRfZmXBgLy+XqvAJiacg+Y+v8
         0fI8TqakGHyTh83ODPKmxjjSFFm5Adq6KziXr4IBvISwREP465BUOhJz1fSzM5SwbtWO
         z4sTYx+9dLWKaHyOS0PcjmbBFmsRr55eqYXcHAtLJKnyjJoiK1DXcu6SiDtxHCEZCSmu
         bITW7mKDU0GkBmVEIf+QFAejHvFXwsVCwMo5HCOtHqjWLTUihP5c1wcwvbcKBds+j/cR
         2PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725915; x=1776330715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2JYhH0Sc218HR/g51BpETqibfN74W5aDBvbTHVRBgY=;
        b=jVVwDSiOB8yM3zACvKVrSTPJl/ahiQSCpCfZkV0pEENbYK46H+f+sV9iu1LfBpYAFx
         PapRNhcY7JuagwHnxRXnVZTXd7iIgNjoyL9++GokFegC4GLUimYa5+3IP8Pggh/Ki7fB
         iXDZsVbmHvqH1BjAagj7FkazOg9ZUZQ4L7pvmAV3w3gYg9hyEEPIh09igGeRnf+208pa
         4KrwZuH94Sl/3/x0gq8QqJWCQbkBO38jcOSfj914pQzpujB8tuA263EAINywJzTpVRaq
         GfghZ60NFEeyfpmOJjvihEjC7gh0xxP/8UmEceslRMrbh5wPTlb5u7YRjNUm/qKCwJaJ
         CAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfkJ/du2C/K4RXwHGxrMxQd1jGDM5QrDCJGnnM1z/iI8HZnhx92MCAR//R1ChlrItTazXn4j/v+oXrhcvo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gBfZVnGJB+3BauMk1lf7NgK33vRyJQrZjqxlomdS5kjBw039
	P9VijP6tKDb/KZ3Z7zvVFAOL23IpPDie5ItZfBSFo08+7hSoVqAH0NaxNSj/0H4pdDhf/ao6vLS
	SeR6GSSTpcrQjLq4Kmgh3EQGRjxxupGQtJyOWlDwfb90oXhdZttNbfS+vJt4U+vfySqDp
X-Gm-Gg: AeBDieu/1Ky300FN9Nhx+eet4uY1uOd9dKTyEbfIgdaYAKGNg3jc81rghN+QVPvE9x5
	1hh33nHglwlw1Rkgra4gl24dy6r2KZM9c5BXglqbWEtnSiVoA4L+e6EuSI5l6QGHezKDJi41NY+
	thBBrr75jO4CIJGp/zpARUhbaS5hFaq13QeCcxl4GOD239UYZ4VhY17DvnZbO+/TUspFq4IIHF6
	ez8R5rjGiyt125oPBaPFxlSNrU3lXAXY61HWlChsoA4ZjBXMhzld9xZnulfknZjOyyiF6IyHA2i
	zixiXqvrvhRvUxtuN4qsMRDzmepSMIMacWVrTS9Rxy3F7vZT10wkwRY4LMBr5URSmi+TbAnDiPz
	dJXhZMc2sb46QG2mmkwbet8mmMNd7z2nmU5s1XsGAk11UAoeZZ80r8f8QkzzueMruazWFN8AgIk
	WRgr4Lxg==
X-Received: by 2002:a05:7301:19a9:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2cbfbf79502mr12203134eec.18.1775725915184;
        Thu, 09 Apr 2026 02:11:55 -0700 (PDT)
X-Received: by 2002:a05:7301:19a9:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2cbfbf79502mr12203109eec.18.1775725914605;
        Thu, 09 Apr 2026 02:11:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/8] arm64: dts: qcom: Introduce lemans-iq9.dtsi as a placeholder
Date: Thu,  9 Apr 2026 17:10:55 +0800
Message-ID: <20260409091100.474358-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZwXf6NsD-H3wzEXlA63IFAGoJHlg1LUT
X-Authority-Analysis: v=2.4 cv=fIIJG5ae c=1 sm=1 tr=0 ts=69d76d5b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FvohN9vnyHKddW96yrgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX9B6qvOhLCmRb
 Lr/0sh/eF5TVpPh3k4PLqAWB+shsm2WYaRkpEKULZQ/fu8ew39HXlIGq0nbfnerfd7PcTKB+xm/
 5ng+xvH/4cYcS5HkNnUPXhSsb2VuC3bXOQvxFxN4nBzBu0RR0CUuL9BIlOLOVErJ7orpFZrgeyW
 SQ0//xD9nWYs5dqOmusUSxsoqO4wqd93gSJBxzDv3CDZL2D+zuZBsnJav3kHPz8AgOCKBqdQEzU
 DT9Wg5pLk7sPpNcJ/CM57PDYzd4ruTCoudZFkrLVZ5v+umM/hbeBqDaVumJ1fWi19wQd2DGTgZX
 X+/stOD/sPFCxBnxmhSXRZvBrUk3d7PilfDJR/RCouEQl3oV5VBFZG/ytqKpFGQVtitZ1/+qxqW
 SDU3dxoF1660pHw6/9yfsCfU830MRXWwQkkRwoIKiji8xT25f/KeiF24WB2v/0ZwlSDXyaiA05N
 aWrdb35EBnQAO9gCsOw==
X-Proofpoint-GUID: ZwXf6NsD-H3wzEXlA63IFAGoJHlg1LUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102457-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 403D43C85C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lemans is a Qualcomm SoC family that includes not only SoCs IQ9 and
SA8775P where platform resources are managed by HLOS, but also SoCs like
SA8255P where resources are managed by firmware via SCMI.  The current
lemans.dtsi covers the former variant only.  Introduce lemans-iq9.dtsi
as a placeholder for now, while later changes will move IQ9/SA8775P
variant settings in there and introduce SA8255P variant support.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts      | 2 +-
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi     | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 2 +-
 5 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..cd6fa8c4f22b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
index 8db958d60fd1..2b74e58c47c6 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8775p.dtsi
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 
 /delete-node/ &pil_camera_mem;
 /delete-node/ &pil_adsp_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..e50da0da9c71 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..eec68ab572a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-iq9.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0


