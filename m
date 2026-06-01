Return-Path: <linux-arm-msm+bounces-110595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LPEEoSBHWpZbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:56:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E302C61FA5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 14:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C2BF3013BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9888737F8DA;
	Mon,  1 Jun 2026 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQJrA3qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JX3hj29B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811A37F8D3
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318553; cv=none; b=RulEuy8zqxhDufElE7J0sEm3m8IvsOt9A85a6ROCSnBN0ItL9cS9PD2P9/yZXdQIfT7pqbO/mxyFtNFR5kwFzLlul2kAb1Ij7MUdj7fvBkO22q3VhfnLhjJl9hNK14hxNYv/MIo3ycYE9lU8CO9YHhaIE3yxhU80a/6ye5Rtulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318553; c=relaxed/simple;
	bh=kUbdnEMSHvVgRSN3yEH1aPEWWE2TMTiH3h86TLcS5Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMCbSjxjllO3i1alAAVIXqAgiF+FoFAQtxtJ1EZ0ucwvsjydzjp6V7dO1ojs+6W827G4Ebxw3di3HKDVaDQJ7pWkR0CKqNTgx23N8h0+Vx6AbvMlwuC4gZAIye15F4GOBF0KqmwGlILwXtLnr/6ft5NmKRDihoCD2BSBjCjvsXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQJrA3qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JX3hj29B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f8aK2740421
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lURcRDqv7GIiogdUWdKl5TVqZh1V97MvrCT6nsTkYg=; b=cQJrA3qiQBSZ/xT4
	dWPg9+SsOFYyEyIzbcEQY2x7OjrTMDnVztuExNEV/ToE+V5CwxlS2RmOekTAB3Di
	2UfrMK9JkSAdgO4IHGOI+HWr33Dy8sVkgDyZBqlTIfCBI2OGrX2gUYzBTKmo9pDl
	2RFuy4k024myv98ioTj422aXL0NTwZzRst5aSzl36ixV4LB9cds9C3/1x3ZUsM6Q
	J8vVLFzcAeTpgmTZy+H1GjiXv02OIqTL44yRjgbDSW24Vw40UiGinKUOWOeStrBR
	gtcsQCeEHmMoma5XCqVg/7FtJ/Sl7PoAzqrEN25ehfAniLMyGuk5pwbFnCefdcgE
	wMmdaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqh13f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:55:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so17790505ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318551; x=1780923351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lURcRDqv7GIiogdUWdKl5TVqZh1V97MvrCT6nsTkYg=;
        b=JX3hj29BARhIpF+aiSrC+fPLtHX9poNuNHKu68MQiyXU3hy9NGYUs0gED6Axy1eNj9
         jq5M8o5CZpioN0aGawa8PTA6CIv0AJ5kzTTAe3D9c0aGAAMP3qWQqsGQ/28n9n770oSc
         CTQvwA7qV/bZf/PxfdnGOC/jXX6x2zFXCM1e8uEMl087ExZKgTd7Gopjo4JnHp5r1xNz
         Pf705Dg2EHXsPkQPsUX3cK8euerPkofxFGEOyhQm+7kdmFcE9vjWXv1CS4/dVn2+G/uj
         hlGWClF90MJDPRYMiDpQc2Md04KQwq7bt/t+V+uJnyMJe3+/VipB3jF5MN8HFZ6jm9Cy
         fWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318551; x=1780923351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lURcRDqv7GIiogdUWdKl5TVqZh1V97MvrCT6nsTkYg=;
        b=IwNhn+5a70o/eQmyDZ1uPG9/8CtghUeKQm6rumXOdbuNM6K9RgSnu/wLC9992Gp4Ur
         uM0H0Wb7kw8rBj9PsU+oE/NdeLvxiEZheu19IJ3r1KHDvRNwwE2p35OQoiVmdNug7y3s
         6Cyeh8xpPuRe32lxtVnv/Vm4iPFSRLmhyTAUH60SQYDAkPaBD5izr9/UhSlQzDFAHgIw
         DM5QIIcbKH/3A/QNqT3NaQQ4g1c5W8PQ1mBpdOuYVvNkusYoFDJOCVjxX28ku1+AvDUb
         dy0OJIrlKrjYsD5MuTams/1hbhKxI+HrWxfXQMDRITvye9ftEzXzjTNdNOrwMt2rEqZG
         OFUg==
X-Gm-Message-State: AOJu0YzrZzTdvEi3wOf1II3Ff3x4PfgUPD8PY7Bm4sczebenkaHguzQ6
	t/6G1hCxI16baKyi8gyvcby5ubOSRPSFRj8GNgIG4Gm4g9hqqgAvyUr+sMuFWF2yxqUws+DlvKQ
	ejAodTsVYWY8jmhz2M5++dr2031peBvGL2JGKi6xV0MLhuSK6GE3xUuuiZlL8+FHbOlcD
X-Gm-Gg: Acq92OFu/FTVkfJEC2HsM/CuQrAUKikbDu/Hoy5E7PmDg2Oo1BDt6AhnTl4ZmP2oiVT
	DCuys1NOgeLIG459ru3z/coiJ+2FQ7BAC3hYz0rcjI+p8qV5p8ua3FNBkSQGAcxWOFgN7NtGKNU
	Ypys7ir0+RoEgNMmxL70l74tlYEHryJyDp6E6OEfiYInQn7XL2D6gLoYvPC4gvdwKj6LWI8sfc4
	XKu3K+V1edfTq4y1buudItHjQZH4e0T+1i/XkuONobtwHxVWxtN8luiI0vxU83h0bx25wtXFt+h
	GTq8zMVGqUhbuxp890gL16M1Ws8u3TBh7TEXwcskhry05KBbHIMfmxLhSTL+jy81O1l4qc74r6Q
	FE/dXq+Bv3/Gd0tliE4IK7RQFSHwfX/ZWDILuLE62KTuQYH4=
X-Received: by 2002:a17:903:906:b0:2bd:7684:34b0 with SMTP id d9443c01a7336-2bf367d6ea3mr127427925ad.15.1780318550947;
        Mon, 01 Jun 2026 05:55:50 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2bd:7684:34b0 with SMTP id d9443c01a7336-2bf367d6ea3mr127427655ad.15.1780318550539;
        Mon, 01 Jun 2026 05:55:50 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:50 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:08 +0530
Subject: [PATCH v3 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-6-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=2211;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sQipJtkhsolUvKQRZsr3P2bYvSNuvipPkWQPwpbkMEw=;
 b=2d2bi2REotRDBKB3w3XSNlYysnyD5lcrjhscBJY6txfYs7Nca0tmoHn5QXoiYjYOTPtxreaPF
 gZj+X3+9gwBAW+oW0IX2JcGOMI4RdKW4sNSLmdmxJn/m0jChDz5goZj
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: AszvB-JsLYvW9c_WWqDcvya4KULqHHmP
X-Proofpoint-GUID: AszvB-JsLYvW9c_WWqDcvya4KULqHHmP
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d8157 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX6mSMBPnaAin6
 ud+qXLdgK1vAdqR5SFReKCjQx6G/MVdi+hrU85CvXmwMVq8o3HaKvrZE42yTDTm6XNsURoW78Y7
 z/bxV4gK8XnmdMM7y91mUxaPfMWFzH6xUYzEHM++bSdp7suTQOPY1FXb35IyJaUU3KP7CYnIpMr
 gdaGgDmeLF5z2UIBlSQtZixe6rf9Euxk6debymLq7PwU3APLqnFBfFtA/zwpKvBYNQb0ynwHrSZ
 JmD61aVJHXA8tlTZ1W40RCW+uTUqXCf0s8UO2nFhbPxgqDrG4Ipu5aau/ylJGavRR4vNv6/K0F8
 VrYzvvZOYs6Kk+pcDleG+BuuxlfQ1dfPbVG4o9qBEpaFhIqVbFSYxYV1xeKLmD3XguGKrf87Teo
 lakTApOiT5RO53nOX2oFFEtTC+/tKG0E2tjyFCzDqb5Jv4jkB89GlI6fTm5SKzzsW1ckCz/GAOI
 ExDGjmEwV03inj3PlOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110595-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b4702000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E302C61FA5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 309ebe515814..219c904fba29 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -413,6 +413,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


