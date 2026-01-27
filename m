Return-Path: <linux-arm-msm+bounces-90742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNJgDC+leGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774693D24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F065C300983A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28056349B11;
	Tue, 27 Jan 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8Tl31gO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1rN4dXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640A34A77F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514268; cv=none; b=L4vtr4LyR0J/ipOv2mlREyRE5sSHmZPtTtic8SJj24y2YGHslOxhzrjU2RgPow3gj+QN02yM14fC6wa7XdvZMfk7scGce30mHllxkdhuAOB4yahp2sa0/R0PpL9OIi/8JW4mDue8ztVK0sTp1+VQGpXS/t7VdiqChnh8X8+1MnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514268; c=relaxed/simple;
	bh=I8W7pa4JyKPRj8h9yXSfNSOL81oHJ6FByrFYm5IaaBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENTQBA5Awg8AGfP/1ceGCOLD05M0AhT68UDrvL7oThosev5yXDTVPOZXrW9BfNUipeRllnxeHLPMBDzPjTYS4Tj+36ab0+/sRFdWkcOA0vQuTsT9ds24KejJXuT5yiaTWSCr0IK/M6vs8wfyZPu2GV0Mv7bvzS6O1M1BkcdFtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8Tl31gO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1rN4dXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAEq8T184939
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRZlUmWOtUpNTtW22cJji73G21XQjhInJGk8SotVTa0=; b=k8Tl31gOK4e1ph35
	fVhgDtA0BoI+ZkZWXTmoN2NlgCCOJCa0UAjTIRu6iCQQU7gwyWtTX0YdQ1Vd4XQX
	DAmnp+toXjX0NRo4i+qgjBkBKyTP0ObMdE85q+muE9vKkP3UwQTUxgraaoY5Io2Y
	UJvIzWfQ7Q9Ijb4hHQqP50juM4xCmygLCQgC0t4KsfElBdcw7b2rRDBXeZf4qu/h
	ukJ8Qnd2PQp4xFxKo+h01jGdQJ6FQdMW2hvXQMOR6J66/YLAj8LdDDaFwA94ozu/
	hzGlKNhnDr2PKHMm7oR9tyEPXOWQha0au8iXzPGFc7HJ4fo2Dj8GS3IPZFWtH2g9
	njLRdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jwa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d203988so10717586a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514262; x=1770119062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRZlUmWOtUpNTtW22cJji73G21XQjhInJGk8SotVTa0=;
        b=h1rN4dXyyIIKcMRkkZPxmBfzXAjwFzrf9v2IWahCbDJgh5FieqnYJG+OFRSrchcVg1
         3G7qJZLHzFOArsOzB7dtlL8dgGDY7qFRbBuHuzsBubYEIeNfKbsvmnwtynqsQqDnkzGD
         C31n+/giTHWhzbH63Af9YWjhM8vDAL05aaa+c/Bercm31Wn9eXuczBwfBtQ9mToBnDVA
         afN3WQ0lu3iuZDb9a+BiMKnTSjxa+YKA6GyRlOS/Hc75TtwE36Vq6yacPxzrb3vOm8X5
         1cui6LhL2sWA94zdG/kfDQc1dPdjmYDKjKZqFqb1QuZmVT/54yaUP7vxTLRhqoiSmKM1
         BWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514262; x=1770119062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bRZlUmWOtUpNTtW22cJji73G21XQjhInJGk8SotVTa0=;
        b=i/xO3pCg4m8yvgOmEYPm1WGwPAreZFsJS2aH2pQwGYsu33vJRlYdJq7/ga7J+Novtq
         yfUeFLfGaoRIZzUSgiIVfDBPg99/TuPBgIAEPktOBcJARnWjEBhbN5Stdlz2Ve6Lx6np
         XldMJuh0McPGy+zL/jD6cEBr8flW/ZpNjaMZHKvaRn34t+4IVjE5we/BmZBf+rHFfGlD
         v3UF26N4Kv9JnzgFnSc/TA/LlHIjN39kvRW6eRhf2KxMH2lYNZo+5NsPVU1pP9+9Oe0w
         2uOOlTVVjDQEvRbb6FinCAcahgCbxkqJApREyR1iCKEht9PhJNpwh+03oUyRxR4bNQXp
         Nzhw==
X-Gm-Message-State: AOJu0YxoxifTlcgipSVnAfmvoBwFxCZEN9bSrCqwbPpjdAkd4Ue5J2xy
	eNnUaGp1at2cEGBHT4J1OGBhBE7vmqEiEKIcVdPJRiRk87uaIrPBInYjHsXTlXaMZYyCcbo3I3H
	E3bkGdZK2bkvlJ1ePvIn4PHa4qHjR2Iq1aZG20TAr1GJO2P5ObiBqSUrjAvo4YRWRfhBJ
X-Gm-Gg: AZuq6aIbMfIxtghEv1MWPib63fbBOByzYe2sN2a4dfdnC64l5IeG/RkFXyrjQsrGRCn
	0G5pdWbp4j3BWqV3TS7MGN42iNPVSFmiZIF0GzKkeKKDjRXtXuKNb/VT7Gk3VyDZODoBYBm4zKI
	q8sHk6h7WoQB3TZ7naM2IibcAm9Vmfd69hnRN+BCCh7BaCgQfpaDxXr5g0NvKAKlVNaE9F1Dn7k
	Ry3CeaF/+JlFukqkDk7zjsmxhmlXhS+4+ReySh06bpficEPpDOFRuo1Ijcue0Vj5qhSKNIGLXdQ
	3Cqp6NBg3gXjR0aEgSLTMPo4Hustctzr9UF9bPzuA1rHDeC6SKS7mTSeXnxif2+1Ltb1JQMyesy
	LD5eVSPUnsmrJ7Ysvb1mvbRcEpgfOSLmcpQ2B
X-Received: by 2002:a17:90b:51c5:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-353fecdcf95mr1495643a91.4.1769514262024;
        Tue, 27 Jan 2026 03:44:22 -0800 (PST)
X-Received: by 2002:a17:90b:51c5:b0:341:b5a2:3e7b with SMTP id 98e67ed59e1d1-353fecdcf95mr1495617a91.4.1769514261385;
        Tue, 27 Jan 2026 03:44:21 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6230d5dsm2392301a91.17.2026.01.27.03.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:44:21 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:13:49 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add EL2 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-talos-el2-overlay-v2-2-b6a2266532c4@oss.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
In-Reply-To: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769514252; l=2961;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=I8W7pa4JyKPRj8h9yXSfNSOL81oHJ6FByrFYm5IaaBo=;
 b=2L/RyYlatW3s91TmeBnnCVgfvLmLcQotsDZo3cT3JiToHLwJioRnwC3OlzrPzylUai+H8NlQ6
 Bq4StovFf9QCRKtqhE2uvSD+XOSf5juAizPQMqXa+2QUfJGJTwJpdFT
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978a517 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9v-3qFfyIGgz6gOtqwAA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: v7nuJRs0XyXcAh_dhd4oecFhfa9sqwov
X-Proofpoint-ORIG-GUID: v7nuJRs0XyXcAh_dhd4oecFhfa9sqwov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX0TO9k8CrH0bh
 8RQHi7EusKiEFa/yoftoVbuFiIl0KssMG4HStdRwFI+btpc+f/EFoFr++ig/kotGk8t36kML1O3
 X+bWJU/SfLwv0ahd5D8PrnSJOFhCmfjy5duzrWP60M5/jRPioFI0EUqvCBSb9uqEW33DetezLqR
 JtzYGKQV9D/ugP+iT2iquei3tSjcxONX2CQmsvtPUg5LNqY6n2XR9gRCZa7dPdLaXR9QGpNepm7
 6dgGdOXn26EwrOglgPbzwro7HVmcAEOge7O011umGfFm143ZtqVzvTWDSVFUef7CuONhw0yQrfS
 eEmdtvNm3h5QhOfyyHMwj01Zk6C68z55S+qNhZTZj8amSmgmgO+ZhjE+dOO7nGu/Z6++fw8LaFI
 AeieRqpJEADa/729WH3dxykFHQP9DPwmu9Q8U9APkZogm1gR2GDKARdAcl/HZlDVmI2AtHmlPa+
 JG131fpxwR2o7rq4PQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90742-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6774693D24
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
 arch/arm64/boot/dts/qcom/Makefile        |  8 ++++++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

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
index 000000000000..a7e3270f8609
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Monaco specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x2000 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x19c0 0x0400>;
+};
+
+&remoteproc_gpdsp {
+	iommus = <&apps_smmu 0x28a0 0x0>;
+};

-- 
2.50.1


