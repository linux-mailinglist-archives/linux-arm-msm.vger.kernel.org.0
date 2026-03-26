Return-Path: <linux-arm-msm+bounces-100026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPg3BFK3xGlf2wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:34:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E932F14E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 05:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66C3C3029B54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E4D38CFFE;
	Thu, 26 Mar 2026 04:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8DT6Sl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dj67NoHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F24539C634
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499642; cv=none; b=NuTFRsRD3Jwk8tmM2NrlHc8CXyMQtXUs1hzW1cE7Ypx3hTjryidfcwfEKzGbSEW0mu9Jg6XGv6W2841B8uxrSywe7bIC1Nlzeg+uneoDii2th7a/DfmlCP6YHegUoPmi/cTo/wJyTm7eLszYopSQxzStoGfjK4WhrndFSfAx71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499642; c=relaxed/simple;
	bh=l4ivXt3lsKb4kgsBy1mCcps0SSDFqqQ/qyQMopTJGyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f/rcIDeVppNPZd2skxGwO4Fg+fKVrz3HnhAhtDk1wR2u2j/DbhEOiFprBqc2ymyVpyS2L/6mZ65qJGRQGfN9E7eK8HwOE7+aXjAvudI3GaicGs18VN0vABpe1FBD+MUvKFRFNGVmJkfTjUJ+k+ppGP0c5N540BqsnqPV968x0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8DT6Sl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dj67NoHM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PNwGkg1554647
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b1gGYzVXgpW
	/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=; b=P8DT6Sl1HzxN4C2oGlRZFb0DRii
	maU21x0lRkH6wW/FmG5zi7hQ8VGcACVWHhKbpPMu/u0E05lHVYuBHPRmS+Zc1Kbs
	1XSsAK6lCncPoNwMYBHj1L/jBZWXZ4KBE/tnDVds04RhkkhdnmTI3Qyas37vPIi/
	ZET8ZaLIbzET7P1X/5WKfWJzKUeko+aSgDA1c2Kg+3bOwkoWB9ipksxNGlRhk0Ya
	J0BtkX6Lpz46UKZezGoeynSawVXfMV0DAjrm6ZDR7E1M4LCwYmptG4kk5zoLW2SJ
	y+XFd8fRy/xmpjEw1cgz1S3PMsGAfAj0ItDp6ap3O/E8UwMLraypGRQFuSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7au9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:34:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b079b4a8c3so20469325ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499640; x=1775104440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1gGYzVXgpW/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=;
        b=dj67NoHMKdvOgZZKo8WXwwfn93AANtOQ4g1TgmM6QeARtW+RZw9/M9ar7KkYzB+npm
         5KzGWOKpDlwUdtSePTtDWbLylWhjw/HczPNz8SALwJEIt1iZANCym0mhJyXS9jGWsl5j
         gOT9JR2bvPgRNwf2FGlx7HfnjhJMR1/TNaAB5tbV7htKXt3/X7LhxVrQU/v0ZaOBHgBj
         03nhyapC/L4hq3nLGRTZCJKHN08r5PY1ZFywxMMolH7u/wTxxmHYhezQh7SRN29x9Dp0
         ick1ClL+uisbyCYTRZkNiia2gCof7xW/3VKVhQTFN96nFTXLnhx6F8CxyQrLpAfSZ8Kj
         vdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499640; x=1775104440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1gGYzVXgpW/TOjAzqqRnI55kNpdkgiirOaPxukUIGI=;
        b=e4wCX+c2+Uv/kAXjcaz7Jk1YsC5VikujwEmwLZZS30MHvXBqOtROL2XEEX87m9hHUy
         TTCAHI0Xm2gcGWViP6K38pMubpV/jTxo6gwGEliXQM3gxU8g6NNC03AfP0PzTTM+JEA/
         HsirRQUmd5E9/3zAAGZKJEXa7bED6H4xtE7K4aBhOmNWc3nmL/ap+J2gsnqQXgYb8ICj
         Cxy3AGm0GQ+Z6diZzIIFdB1OeT+PMYNkpXZm2AWugio1pfM1+GSTPdEKsP2oTQ252mza
         zat8+6uM9Z+7TP44ufmGjYdovJEUWsGxBCZ3/F3an2RDD/ZZ3lLpaNjRMKEsbkwUP5z4
         cvlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp6UcZcV2CVWvgHptRtn3iPiDiPmyRdc+0zOvparFoP0lJtxa1JQhxmFeslTgjnNSpXWfWYoB3qhaR46o/@vger.kernel.org
X-Gm-Message-State: AOJu0YyuubUaIVIa90HUb0ZI8XhL1SyX/Pc0uyVrx3KGDFKSbnGdlz1h
	B5z4GMNp3tPkHZNvlAG4cvGKbHuK49ZjzcUknqoLqFH0jz1Gn69MNND06XOPXVDNHS9SrMh2YOF
	ZB2wRmUTfqe3g/rec464l3MKUHltf2/pEb76lc3vhWKkemc5Pekme4kgSFFKWr3pkT2Y/
X-Gm-Gg: ATEYQzyGZDzo1DLQB+fjN9mxyOOaCSuJ3hnMbMGb2FTCP8lyYG1D9Lou5F9GaXTZtJe
	cbDmdseBC+rCbiqZUmCxcIPUNEALTG9HOsBTDk4qDvTX+NZteJjyrFpO4NzDrzC9E14koZB/jq8
	qyyP14QNmuHyfu39UssTtbP2bVynM2U8XtSMKOxjb0UkmELxdpGRP77ogE+NYVUEyFUDKULUH26
	xQ8EKcCpGI6yXRRsRsXSa5+EBKAY47eORJRQLy6m0c8vUFhu0XQ1mw5Vt/PWCwCi6DgCKmHDZk3
	6DE+wZJVElC+UhIYBibJ9Oqf+14mP0v6FAxYlylY9XgHo+qms2JeMaxW9P27w3R5SBba/PwNMEo
	aOztp0pSctzyMZhxluVoC9aIn7vTOooeokMkttoteNiRHgLTBHN9gHPPuS8KK5F0C8AQjxnWIYN
	WC331jrIwhYaRu1adBjIrTZJ6UwHCeX/ikVeRt6syNufYwpu0W5kc=
X-Received: by 2002:a17:903:1ae6:b0:2b0:643b:41c9 with SMTP id d9443c01a7336-2b0b0987e0amr71476745ad.9.1774499639853;
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
X-Received: by 2002:a17:903:1ae6:b0:2b0:643b:41c9 with SMTP id d9443c01a7336-2b0b0987e0amr71476435ad.9.1774499639367;
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:20 +0530
Message-Id: <20260326043320.2507890-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4b738 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=nG0a804IO7H6KQc07wUA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX54HW7UN9lUC5
 Ldk+1Gq70B/kY2jBCqOWcNjLBsJ34Z2vMjbysMe7Bk6/fegJDAXwuqLqxyuHTPX2bAq2CU4z4Ht
 5PIjAXaI1SpUpzSM6e0KfcXHlu6ziqvQRClQwoIJO2DJFVTV8iNViQnFpn+Id9FZKwoWihISF8T
 YHPwxy7VMZLmmpoTycRe1cX41ixA6AbRb00ek22dGytz4uoE6HmFmrp+rtBP4QFqsVaXrVy+mMN
 sJX9VSZrtVm2G756pz+s5vwKV6UJ90p7Z+Z7L/4qD+Lmj047q6ewuaCw3mGd4F16O66sprVljYN
 5gmBZtQQKaVPOrsIDEvK+/dk7Rmx/ouVamqOjVK9rRtS/QTdtIWyNZ62uwlsxFTW7jREYkbeAEe
 BNddaqDd24BIBRpUG15AsWG7zL/s+TG1A1l9EAlK669FPD+brfalvXTgM5+Z41SVvsIGzKv97BT
 w3VTgeDNCGAM/DwVBZQ==
X-Proofpoint-GUID: pJnUHodzxuU9iHI4E34CaMAwQSHJNI_e
X-Proofpoint-ORIG-GUID: pJnUHodzxuU9iHI4E34CaMAwQSHJNI_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100026-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A32E932F14E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..5c828c855c98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
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
 
 	soc: soc@0 {
@@ -914,6 +943,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
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
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1


