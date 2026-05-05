Return-Path: <linux-arm-msm+bounces-105933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G0FJsjH+WkwEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:34:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3884CB75C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 875FF30A5F0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C3040758C;
	Tue,  5 May 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apg6ZMTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSAiSpzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7F407583
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976630; cv=none; b=NoFibu8vI6gpOn2ZL71TN3sUdTZgUVXaMFbn32JRlOWSKGTw8erhLpnheqzNb/nLzkkPW1C5NPpsVc77JtK2V24JUEqcw+NGcB9PZYUT5nPMqT1TVpfMDIKp3QdcIWDzJXR71H5KVZ8XcewIebt1YOWNsWjqKiEt+wPPxT7lnJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976630; c=relaxed/simple;
	bh=Fsz7kG3w0RkxZ4KPuxZbiOPZymBoUHmIUdRNM6gCFVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWL83dkRC0pHvoI6jMPs9MbSSrWeMrEaSV3nXAac5kjGpoHNwo6WsG8/0GwdegOQLMHX7jMmBQkHbpwf/Yu1amGR7m1sZPMsHR8KUyqz8VqnjxWgaX42384QXgtPfJmTLh2FfiqdcxTSVobHrVRsx5t00ODvdvgSbng4V29jphI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apg6ZMTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSAiSpzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595WWs4028184
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zpy2+AKjwB8
	Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=; b=apg6ZMTL+4ubkXpc/SMYPIoEVum
	0Phlz07TIJPbWV0tLJy7Ihx0NUNroX/Hncqmqsz4uRJlbGZTRAJ2YIk/K4laIThg
	IJKpsMSMX/wzdMj9MDFz+RfoIcGNSEWQAyM7UgV2l1fJyNoLboL0PLHlH25JbIED
	1TM5g24FFupm8EdjxppN38gTcfOT0vfW5BAQTDsBlXN5DClJkzo9IPZ6DO/dxU7G
	of2CuwLbQtdNtHgPy2VOz9/yIFWKAbY3JgzBiBRjdnwKTMTiTF+c8nLTqax1nzRd
	TR0zi+MPqJXHh7D87mm7sOeMRtYft/emb/pHVYPdLSTV3ZjlCTKOUiypTYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6raee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36512f223d8so5505623a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976626; x=1778581426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpy2+AKjwB8Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=;
        b=iSAiSpzH6QxKKIDqievEDuGhGloBLdfnWfD3pzHfEhL3HvLQpv61gXTKYjRn5j1zbj
         TAWJoGMY/65nBQgyjB89Jgi7ZOGnfz/a/2+nN4GzUfPbVdvS40hvPnu0mmUHJAcQYAQ8
         3OJybN13eilyu4xYj1f5MlQk8NdZ6hv+02o/8ctULdwuXRwEySfhcXJ6/RwcvvD8SMfF
         qVZfShbl/QBGB58zDzfkGCFP6sgk5Rv0BI/QAQ+Au3kOwv0iza8pOc6Naiqz5Z3nJd9v
         atWiv4ufQtS2HQLtaUfvNoFBSKUC6dJ3NMntbxmcexf/KSK2ZotRWNZ7Ry4pFJuuo018
         xa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976626; x=1778581426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zpy2+AKjwB8Kf54slnwusTdEi5rsASp3w8t/OQg9gGo=;
        b=fC42jLbRmFEq5cma+00dzxnHJ4Hooqiem1yE0DHoqFmjv7w6xPzOpSBrs8E1zZC16c
         dwdIxC1KNgUQpwmWSrTHrSOJTmkvfclsGdgbRc5LGh3fLZJODbpbTxVWUBLa9VJirdUz
         x9x2Wup4UlqxURS7TOR9UNP9dyL4ozqvjZnU1ASMY40M7GdYm1oAjERoRNY6u7sAx8Cr
         QWpN2jygE9hk6CGlbNwsG91F9z4EdmpS6QNsBdRxGUOC2uwsqBaRJM0BfnERPid8R/A5
         VF6xFBukQ9Ts7Dc4QZNpxfFoWAS0kGbDCb3bNjHO3y6tGVh/po3a9Z5y9VpVK+sKxIqe
         4Dbg==
X-Forwarded-Encrypted: i=1; AFNElJ/dsjcKmvrSddzARHAPJCCTk+O2XYGjuGPBV3/DMcKyvzaVOf9NBIsd9nQ8y9pCBe8Y2vpGkLe6TqDJt4Nb@vger.kernel.org
X-Gm-Message-State: AOJu0YxRp6VayiCBZKUEoAzkJyoNTDD7mJZdTHjrbN3s0ua9IBEtbhBx
	wvPXIeAvTSAtfek9esZG3HwJzu0fZdPYkRB05eHWUwHI1XoplhGUYpKLasUOK3paIuYRpZ9kIgz
	7E46jVRpzoJQoNxUGohYY6Qwc+D2JBMx0uYD+LrXWOb/rJFcxRjiI6U/WGYqFqCJzBJwm
X-Gm-Gg: AeBDieuUQXO/zegmc/k51MGEhrSA+KTy2A98Q2l3AL+oDR8wMZt2vjSByvpkNSxzad8
	PxO1QFvQis4rtDCQpu5SUgf3qMDswJIcNq8wU6jlmwdrUbO1Eth78dhUuQcICE0F8HQDkyrehCa
	yrspiCKc5o2y+l5ClJLJdbwmMx4q05vJy9cl9527zdnMU/34808OkMkjgkRoG7rbhXKbCvsMoVL
	m4siuphh7PGQU3B3ZLOuUfaynkRIO0pQ2WpAdrHXFY/W0w/mGTIBtud37Hg0UFWYVhcriLlg1en
	d5ZJnY9gkkiaAKWEETUXedtmhdnNgxHykeKoZAZPC0Nv109rjGDOXQgUhBH/I0NkhSIdt59GZ/6
	+yVvC8pgTT4TIFCM62kuyiBqSoLnw3/kAi+MbZbU+flF2oVwsMAbolwRAovF2qnoCEkoujTxrdO
	Z+LEOeTLuHOYTsapjPqKtOUv9XQmFtleGqNcNtkhD/CEyNCyMMPDKwMcOdsOK/6Q==
X-Received: by 2002:a17:90b:4a:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-3657737bdeemr2674125a91.3.1777976626302;
        Tue, 05 May 2026 03:23:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4a:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-3657737bdeemr2674083a91.3.1777976625770;
        Tue, 05 May 2026 03:23:45 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:09 +0530
Message-Id: <20260505102310.2925956-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX5Q2m9lJKfjOg
 hQrMweva5XDBZA62WHCJp+a/rJdX2sJDhQt+Pc76Cnl+VFQ2H8teLm3YojCWgVETT91ZLlZOGpN
 E5bXj8AOlxLBhgU3OmwRPRMSY7UoHFjCR+XaVJEdKnwfCoj6iileu639m3ffIo23YTpIsO17ZMx
 +ijC9uduIcjoB8pIC3K0/alsFS1T2xD5qKHTNpjBf3uRWrkaV74mg1htUChijoGmFM0CVvhrtyd
 ZJgcGHhPrIjamT1cH5YoFeyPPjrFGHTofZ0Qi0SfyWzw0FHQTSDVyafglN9t9pR6OoaRZW8PG6q
 NBYxKhrMcskebfVlwBG86toVEO6ykt3ZFrFK9XUNYE3QSGo/Pedfgk0hqKH6mFnIrXKKILfYDdo
 y30hOdxkaWeuR7xD0qdk7yqUDaq6uVk4hQZzcWEP/0OpZwqg70a/FIgJura+n8Ixa+kwJCFzu4N
 IX7T8w5bypZ+zBjg0/A==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9c532 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=mZiPdHz2TdHmxByWXckA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -8wEMYrX-BvEFVH5jv3RifTpygAUuXtd
X-Proofpoint-ORIG-GUID: -8wEMYrX-BvEFVH5jv3RifTpygAUuXtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: EC3884CB75C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,outlook.com];
	TAGGED_FROM(0.00)[bounces-105933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.975];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..2173f187ed9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -619,6 +648,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1


