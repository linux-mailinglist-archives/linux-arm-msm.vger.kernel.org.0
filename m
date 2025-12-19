Return-Path: <linux-arm-msm+bounces-85765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E23FACCE579
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C87DA30A21B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB322BE621;
	Fri, 19 Dec 2025 03:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haGVi3PP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMuGkYsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD72BE032
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113850; cv=none; b=u40EV8lwanZ90z/7Czti32xwikBdKfCQVHeFwZcjjF6vX4O1N5nWSyiTSVz4Bhj8GI9NHXEcMylhs+OWh+IgJHt7BhidHWtJVyn3OCk4cIzQM9BwNlRYTS9NeTdjxTO/w/ufkieTVw4V9q3bbdfFrfd0z81SwR+aMvlfyILo3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113850; c=relaxed/simple;
	bh=AgxqPzERPznA7XOgOuHTeNGG17DW+S/GQccxahQAN9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DO9URq32CZ0ti7J9+M4rBp8arTSaVKj70eN8KBbsEcFs7hVto5Kf+VL1UbdE3OWq9YGsd480hSvdRDVvbPEs2hRQfEbA/16tq2cBMw01nmZB8QUctpc9TaYOAXasK3g7tzaobh+bAxgYzf8FZWaTWeGnVDMgKNxM4l0OXOiIZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haGVi3PP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMuGkYsE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2OAQB3033908
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V/XvB+rW0dI
	ZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=; b=haGVi3PP5gj1vt5Bn3xZnXnT/LQ
	MNDQcvLuSxhJLPLZwuTCb/Yik+Z69lRf4a9K+BjPGTidMWHB48oVHwQ3kNsQNkgD
	og8c5b8WbKVIHpCeyp3arF0xc2f5T0CXwDvxBHI+PuJmXq4D8IBf5er7e/QfXk96
	jy3tdA5N2g5IxMx6Ib8HdzLSyE3RBIaOt1Ov8bze5UUeNZplJ+B8pTzK2FLpaKnU
	XCzWTu3mz2rfJffmPIPIk9u0bUSQ5C+jlcxA84xPTediM/JN6Fwf6lU0NMdbKg0O
	x2ra/nYCAYovWkqXM6Tg4X+VOtPTrAlsAiQKj5f+FEyxWXcSYILixsgt1Lw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2es041-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c6cda4a92so2570490a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113846; x=1766718646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/XvB+rW0dIZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=;
        b=CMuGkYsEeYfw5M/DWzc26+CynMa+l6vmn9iAUMbGJwMR8YCcZKf54ds1f7Jeh/ptTa
         cyGLP/SUp9lGm42AGPZKTLBL7pFz/U3FWjiJTZQ2rZ1gpWQ6xEmBuO6bNxAghUrjuLBJ
         ZztcOFeubii4PbLkcgZWTMoYu+G5RSW/uhy2WAgKPIU5z7GbmqSz8hH1AMyo0byLX2gF
         B0RwdzjRDaaH/tNDsmkwV/48eDLDLYj7FLuI5xYF30f9w30qIRC8niEi6nPSMY8JNECM
         +q0yIuf+f2Rn7sD4oRH19NZkzcPgiYkQl4HHbMYeO57htHkS8zM1VyhOEEkV9ag7Hmqs
         XCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113846; x=1766718646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V/XvB+rW0dIZY+v+oMfEJE4kW9BQqd3uRtvcynh9tNI=;
        b=ivLZ9YCITUstWkNXb4Ca8xQLKNKChPAHLQ8oA/dPbARIl1qhGgt74SiiLtI7NLPwC1
         R1h3ssAkHegAOiBKeXwJsgzbbExXidVYPHZre2V+t1G/MeDi3425Td+58Lm84YyX3VvV
         e5/vsbV5R83bOkcvAsiALkR1bXMTCt7o5jFgw8eczcxfEreKyJpmwQZLJ5IG9HJxsijT
         oG76rKN87bSQXp1WAGiLuws8SIUwgJbyEVDa6OegCiKpomDm8SRK5OCIzlWN0ftR8lUP
         ncMjZlQE0pIVK4+oPATSgvaWvqI9UMZnOB/1WpSvaAibyhbaImTquFi/iWOxGllOriK3
         ioKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0qzd5px4HviPQ08iGoO5yGRhLcCpDBVI7c/TMdDOG9UBnmQVyIFR4Wv6zgZnN3Qiaqu4SoIunRffHFYe6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8YrJeam0m44LOr+cFcK/WQXpLZEyNrr0fgg+ygFPMDZkPkPT
	CA0jPm9mo6NlXofZOWBD06cdrqI/l9Vz10K+fgwhXMdpPqKHhH0fKfp0LUDhldSchNoXC+YayDg
	AV6hnjcIz09E9oG8PeJhMYHX6NP6S5LYsWbi0Mv0p45+jrqrTEN2nCTcoEBOXN5/S+Bk+d21Hdf
	DM
X-Gm-Gg: AY/fxX519B7zpvOzDAZdCTA3q1yHBN7AfWTTTm8IgDhC4H/lytIRzBn8jnG7InJF4I3
	Rw5gGDE9o3AAwlGOtATYonPIGfysFEn5TXoRXjGUdragFgG9S5x6JEZENaIgerI7uMcrLCDxCnP
	//+E2ScJaQBm5f3cydRrT0d46yL6D9GCaAnpAp/zC8AKZP6lCd3PhYevkReJBEvxw5S1Xowwc2K
	ASfimaOo9c/6BR2tAWu157iKnzfy+KHjqKG/eOxyyWVMtsKdsHpmEYSHVUP5q9o5uLbc+aIjEck
	q3F8xjGaaG8xltYDXMfAb8K9+MZe0lwW8PPCtpPABqGY0XRdepTGM8IPpaU0xrFaKSBWxP+8reT
	9VzYb98nUGOvFnk6QmjcA6sSI4f/aYBuSzao/gd7HF8aY1+NmOnQgKWknycakfcCHsUkrLP3Da2
	4DDkgPo0vCzm5u6Gl/20iOrXw2HaLiobeuqq5xP+E=
X-Received: by 2002:a17:90b:17d0:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34e921b7386mr1127308a91.21.1766113845765;
        Thu, 18 Dec 2025 19:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRzRHMsWMc2GtmMs14LTf0+nKhYLUbSbd9caEr1MqvD5I4eQU51a4bnShWX1gu6YqW5BMMfA==
X-Received: by 2002:a17:90b:17d0:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34e921b7386mr1127289a91.21.1766113845283;
        Thu, 18 Dec 2025 19:10:45 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:44 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>
Subject: [PATCH v8 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Fri, 19 Dec 2025 08:40:10 +0530
Message-Id: <20251219031010.2919875-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XPY5fLQWQfMWbqjenKLTjpwwZMik7sgw
X-Proofpoint-ORIG-GUID: XPY5fLQWQfMWbqjenKLTjpwwZMik7sgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNSBTYWx0ZWRfXzeqwFSuCIawa
 FbS/2cyXsWYC8q2RJZHzh4IPgwI4VUC0LeUDcslj1ZCgVD8hB2beJlOppSp2afONvunrEJQn/RO
 iUz2qIGmFUmAUPHYypBUpM10IkMi3uSLe17mQgJDHQfjaOZfSZgBDhUSA6iOx8gWmg4aFmEuqNM
 1fjMQXbvsuGt+jKLrYSgZ2FpfOE/+pfOnZl0LOABmdpSvKYdPbYVWLlk816a8R7qgarE9DY6nqZ
 bR7oRHP1dt2afpCY0hEhcA4tUXwfI447Kxmz1mc4eADMAi+SaCgYaYEIqz08nvdhiHkp0R/5WZ3
 IB27x5aBzA+k61PGx9mXbzQbzfQIYVOsCgnd6ksvy8tBWFO9y/KlfX0pItXKa0By2SdZJeWS1cS
 vEdUSO17Mra+op5bDDXlR2SWdxWo0metpmh0fBgF4lCpI3cyLEBDq1EUIHx3EDrAiH0btne5koE
 1+5uFkm4Wii8w7+iRzg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6944c236 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=XZDXhZPjwrZnrKVJ4rAA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190025

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc9..6d513fe6ad58 100644
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
@@ -226,6 +226,35 @@ smem@4aa00000 {
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
@@ -903,6 +932,35 @@ frame@b128000 {
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


