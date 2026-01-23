Return-Path: <linux-arm-msm+bounces-90326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KZaM+dOc2nFugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:35:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385174603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB1663012CCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249BE320A05;
	Fri, 23 Jan 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7iRWhDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCNtupls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4830FF29
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769164515; cv=none; b=rfYnZLXSqA74hVZl702AhcsOjyfKiEwPxoObvAqZqBxshBEvP/97U/s840OWO/M3nWCbPiXJNFMma/fPzwn0BbjYODOEFXpHKauKr7+VW6SP/Px9hubVYhQ8NXNNfPBMyZ/pUaxmfKq5NsTHiQeFqb9SjxCh8q7KVVD2DUwiuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769164515; c=relaxed/simple;
	bh=R7x7LTEoqtKavIaUOfm07AqpjF+duPFqDYabTte+HIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b6wu0Mb9DtWnTbHBwGYDW5RaXzOlPnWe1ufMG55pSM3Z2rFZ5vwTgvglKrMA18VdUvESKJL4KoUTpXdeehzUYwDTVe/vOJm03Jq0wIxZ1RqPf+e6UfhdifALNWwb/OFxOSXgWe+0cnJ8uhhPMIy9nyOhV7Q0tqe8aza+aZl93E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7iRWhDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCNtupls; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N68Rwi3503291
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HM1eR/0yua0oQzdxWnysW1O5dlgI4eGM12q
	H2XHYpwo=; b=W7iRWhDj2Gwyv44dQaMY/U336/lEMwrYi8GbttZjuixnZYhiru+
	mU1Lgg7gJR2SK2QZwrfZLbKO+LFY6F90NkG16Ya6gi8Imm2nAdlnibcVbmG0pASf
	A/uxZgVpXv6+1KKN6q3EJu8oN321EfjPfX/OAJ2iFCSn9IjviWXciMmeB6wQhzsM
	DMw6k5ut56AHh0vTuH03q2GJEY/YNKxBM7wTF5DKCUh/FWo0+uLxcNnXJpSnP1W5
	cMqUE7dy8TxUYPq983ITQN2nu96+FExjngXzEvmY65NpNgWbCGYOmaYcu2yNFVH/
	Qd4ojpbD9bCxDw9Sr8aNl5+VyvERRUFaqRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus982x4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:35:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso16924965ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 02:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769164512; x=1769769312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HM1eR/0yua0oQzdxWnysW1O5dlgI4eGM12qH2XHYpwo=;
        b=dCNtuplsPafSVkoJf12bSXV1OJ+T/BKBw4ftQlakfxj5LhLPj5xxOQQ3frDaIBYoMN
         awBlixEzNNDFL/cunFEOrh8yqinBfu8D++I89O1RdQhHo3U+HtlX1PuReNB7YEWJQL0Q
         D0mrvLxdyjLwnPBhdhjIrYfFt3qSG3qasrvL13NDpHvS2e+4gRyuIg/gW0kIcOZRBzNt
         aOrzLkbJS2G9g0uyLoH5W16rfJTZMh6oKf7dwydGGJ7Alr+M3+Fa/HWwrK4lkw+oYZZT
         KUNaAPSADIUYODdKNdV+4BGehcjCczNHwjcdpsSwUxCOv86TCs+KeuCx7BbrXKTsJV53
         80xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769164512; x=1769769312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HM1eR/0yua0oQzdxWnysW1O5dlgI4eGM12qH2XHYpwo=;
        b=Fxw44OdhTlh7I3cpx4JQza8oRXBfSL8kZB292kjqdD77J9SqHochzjmupTQcZWGU7C
         1IPT9DkZ9AubIQm9Pv4g4kOQC+4PfFDkzVOG1j0HgMt/+aKVgyiFxlmf/OREtXlWdcEQ
         rEhIJCzEsukxFvZomdV25DBSl0b2tobzKKl//z1NwKvYRnrysifF5QG7Hm+KEPEJuTPu
         SgWVlyaOGpfUDZEcAqBEd2v5zwb9c6dZgZHpLR5C9wkALNnmEx1pzbE8G4/jvPHMvPSA
         d1w8uwNmTaYqJfvOErsb5F7iefZIzgKTF587YimVJdilM1l0yWkvNnRNXMTUt9tPAcxt
         x2jA==
X-Gm-Message-State: AOJu0Yxwmz0Qkl+k1goy2pgaQ2rHEaS5Q4JBexNy8TIjQ0yDCVBwT07y
	Ix/3CuJekGzAmGZ21ZLazdLzl8ddCCLaSh6iCIorEI9jDPgoUGxDq5cVoMzeP0sXuKDcdG4CHVw
	5AuerpZodr+rEsAQTfE9XHtX7a/70hLVX5R4PwF/pmeX0uGrws6psu0K16zuEZP1Le+FH
X-Gm-Gg: AZuq6aIcrfqlACRcCEvlLNzxUEsV9oS1cpamN/WUvSj6zHQI0IK6jVn5bfet+QOZv4r
	Blied50g4HRhgPLE9KDavwnYZI+h64Yn5P8T0HACo9co9vl1nnWi00e9RJz+8XeASTI4Ue6/yCx
	PETf5+65A/DPw8I//j7DqIZqs/i0efXnEIDhdW1EWLnJIBSv75mlvBQNMuywuvdtaEZlK57TI2A
	BIhxz06vpizdNwajKGo+hPlEuj/c5oY+0SqPGrQF+8ElMXxfTfYTa+FqWJMmqtJzF1cK39jPmF6
	i3EdVfaZ5ZaJ8WewqAEcwtYVFwXeL6DI2Sjdb0ta+EFtTK94Oa6fy+sW77qq2vxyudIttPKDgYb
	YB0Z/1uCRhZj8alxYLyDZf3wv50nn0rBrMctd
X-Received: by 2002:a17:902:da84:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a80ec68495mr9425425ad.49.1769164512130;
        Fri, 23 Jan 2026 02:35:12 -0800 (PST)
X-Received: by 2002:a17:902:da84:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a80ec68495mr9425075ad.49.1769164511463;
        Fri, 23 Jan 2026 02:35:11 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd123sm16735335ad.96.2026.01.23.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 02:35:11 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: monaco: Add EL2 overlay
Date: Fri, 23 Jan 2026 16:05:02 +0530
Message-ID: <20260123103503.1259645-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NCBTYWx0ZWRfX4rPy1MhlOFKv
 L+XpKbblVo/qiPLyvZm0DrVHU/dgybWbO2hCI0YSh2n0dgQ7r/lluVG1nGGsuSlgLpXvuanpp81
 zd/e+ifKLm4aYSHfjlnGmFpLBiw7pa//DEMv+Kzt2n7yacoXZrSwv9gIsrbf1kpj9L//Wq+WgGi
 RkcQJHvnUeqIQPGs/64OKDkJr0iB8e07LATduevTxwxcb7sBxYlqVtMuOkTxCw/UUrcF7FkccdN
 oSBK1IUFlOn1wtzo/K5/q/IMjIvLnroJHW3NomXyBdRDREBCM1osg/j0OB0h9V/ZBHgwMZu8Fb9
 TdHqciSD60LOQ6Coe8x48Byp3pZGgwnGMtAmdEY2Ne4s0jNhx0p/jvoAN2bEfIA3iAOjVNgTex8
 +EjEArOlamMUc3IOtav+Ek+PAYCAKlxKrSubyfJeybV9PHc54rlXqGj8QAF3JyTu74V65tzfWCA
 +RmeXtbeetHnYUtkD1Q==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=69734ee0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=AMa_MSMaK5sjRf9h2ZwA:9 a=eSe6kog-UzkA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yfm-EHqkw0jO43TXCo511A9tb6VF1hxx
X-Proofpoint-ORIG-GUID: yfm-EHqkw0jO43TXCo511A9tb6VF1hxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90326-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4385174603
X-Rspamd-Action: no action

All the Monaco IOT variants boards are using Gunyah hypervisor which
means that, so far, Linux-based OS could only boot in EL1 on those
devices.  However, it is possible for us to boot Linux at EL2 on these
devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Monaco IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  8 ++++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 32 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-el2.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..cbf7d89e432c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -45,6 +45,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
+
+monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
@@ -147,6 +151,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
+
+qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
new file mode 100644
index 000000000000..be08829a6b2f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Monaco specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_gpdsp {
+	iommus = <&apps_smmu 0x28a0 0x0>;
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x2000 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x19c0 0x0400>;
+};
-- 
2.50.1


