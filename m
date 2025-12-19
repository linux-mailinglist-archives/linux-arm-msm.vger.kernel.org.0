Return-Path: <linux-arm-msm+bounces-85763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8097CCE561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 215ED3078CB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D893F26F2BE;
	Fri, 19 Dec 2025 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XS9UdRMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7unrF0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AE4A07
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113840; cv=none; b=JmYyNEuIwUmYhBkMTPWU5Un0sKEV/GknOQ/ZnJ+2fTT6bYSEVZ6Zp/ySdGq7enxnnesJbt7jnLL0cd1IkKWAtGuzlNN0Xg2mf8m4I/I0OJ0GIkEiDfH+MSiTJjXd0SZQNPJLvLqB5EB+9kkNhrZSwL/N1TOcKUuhpxc9kyVLenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113840; c=relaxed/simple;
	bh=blcX1nouYNXC6ol/gZDD5PA42jcTWn6mTJAJP1lU+68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YXtYAVs6sJXrTTcUblm9hyf2tbiVOhp11mIKEGLncT+bqR/SJPZGq4hzHSIlaHfsgwKZs1/u85gMzZojoX/zEiWJNo1VKjnxP3rAYvSZbHMvLgbpQKRHZ6kas0CXpVSUVZUdcCQba/1sJrVXgrqJ7l/mp4PcEPJKuEw6Umiu1/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XS9UdRMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7unrF0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2O8E31486802
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JegHHkHOmY4
	/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=; b=XS9UdRMkax9gRv77X7CYJ6P1iMP
	WRx0DJWWq8aF8xHscn30bhYBlq2VYNX7JlXzH+wttHDUBc/4v+sAPR7wwxDG5iBJ
	/l4ul3+N6lDbVs+oWMhVShVv9exKZLm8hyReMaNNVMkxuY2Gb3EZXuWaBcLKeckr
	snz+SDqu36i2tIj/cq96tthzW8GH1DM29aIdzFRFdieygHJByL2hGe+WeZv4CHRS
	zPXZxx5+oQhkrHULkqkKMpuwbatkv0ThC/lCbFvrmLsIe9qn1kAu51mW4xkEeBiC
	jqY8PQasX15JvPaqlDeT8zgiZGQ9uhAE0o4MtR0kdpXmXGX57ERIb/BDZnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bh0k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:10:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c5d203988so2628422a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113838; x=1766718638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=W7unrF0Yn/4QgCXffpa/vNEeMbteQVkB+Ujoh+rBXvKBfIH+sXXTOKK1NjXxahmSaN
         MaG9YL8c1hpBLq5ZYUcNYZfQbU/SXI6QcGSms4RjBOSRbW2v39oLch/phGsw1YfHh1NW
         1fIQkoC1jMmGOw+IheZ42Rs91A1o5jMPIUa+lW0AbxP3xO4MsVBtLLpfucmteIGnonhi
         JVpbUm3R3j2gL6MT3xE9payyenyVOLifDYK+YlSM7mYR6xO09Xp1ygtNPdzh0RnVN7Xe
         EO2usY67MO6Pu15ZCCJe1mzF7Fb2ustmPGxkoB2lBXAtpimwKIZ2mHbU3dBDoSTNmbql
         lQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113838; x=1766718638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JegHHkHOmY4/gMghUonjYHVmA1DHiOImuLkaeQyWjyA=;
        b=AgPE4c4SdyBlkKSvxqVtMYIE4m+/+r19SfHesC+GTubm4JyjHQNrhVokZfzFuvow5k
         3jgH6n3Z3rv4jrwYl+WWxwkcfK76Pi0mbC1FhR/rzl4X57zOh3UhCMFEokIRj3IM0Du0
         UaKjj1luB1qRBVh2QjMyMrx1UTt5ya3rYbkuANSTmJ6Jtu+RMm+hdqhFIMQe+uDXLIED
         lW9+RSznotlmqo3U0FTlo7Kn6Q+TQIDd4Q+JqXIOAnUBS5kp/miQQDXizJS0XT7XHIAh
         vvUb5Qz54+2xGj7V8GL6cnO+Wqg5itethLdM/6E10+p8IdHxLxPjaRNtDPHbyTJCLQSK
         ylUA==
X-Forwarded-Encrypted: i=1; AJvYcCUm2/rw//70UZuP0aU7cA0DLNAWJ/wtTbl4FU3mWZzn/oa2N9BFlqjMPxnW8AndG3O1gMyy/yFjXWKREuOi@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8WIaJ7nf2AUKUDM1yFgAXDJ47T3YCkkmeMgu1noR/8tz/r63
	LXjTyTv7/O22oBYSoAmCLFaPzFijFHFyehwSfyCs0dLmo+ViswaNkOId5C1RBMvLyT/z+21g11Y
	dv9bDuj5Px9hFB98rgpLxDCFPa3u5EwH8BFpym0gxNRfJ6uUUh/xCGqIWK0vfh72CJRAO8niLmE
	DC
X-Gm-Gg: AY/fxX7Z7SHTqewDejXGwZPW6TpHqSDOPJ+sWej5I12bqiAotwu/NI3MdQP8iPmjpAI
	H6WaEmTelXGCkcLf6JcRaPhWYFxplM31D1FoPuq9BPpgoFLe2BDt6J4L7KK63WrQq3VBsAa0Fdy
	T+847AemB/aBo4P6XTtg1nFtpfLJ0osOFpZ0uoRvyVB0r4PluskRrlrseQo2tVPe9/sC1iXldQW
	698BWHsEvn/cspzKwv+8L1Vb6aJc4qTyKjfvwHLrb5o9GjK8J0hGmHlgdGSKE1wmPKpAcHsKuQ2
	M+ZjzHonbHq5DHes28k2DvevCId4oDHaaxSEJatsJ6nNEJUBcmxhwcrjBd99ayKa56A8JjxtnmG
	RyL1Z5U2S7fr0GCEY6KpLKcQLr8wZaGuGkiqUV2ugiypQ5b5MsbJcC+yd6c8OL327O1GyP3+aqn
	M+UiU7o20+ugzzNyeRVKATLmsrOJo4qztE/6oW9rw=
X-Received: by 2002:a17:90b:3d0d:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-34e9212f34cmr1468804a91.7.1766113837735;
        Thu, 18 Dec 2025 19:10:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjoO7rmj5mTwZVDn+RLFWw3ODRMf1ImDvCZ7pNDu2ZSpIPdZitTV6bPAc9UBCjfuvIlOSvWQ==
X-Received: by 2002:a17:90b:3d0d:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-34e9212f34cmr1468776a91.7.1766113837333;
        Thu, 18 Dec 2025 19:10:37 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:36 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Fri, 19 Dec 2025 08:40:08 +0530
Message-Id: <20251219031010.2919875-5-varadarajan.narayanan@oss.qualcomm.com>
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
X-Proofpoint-GUID: w_Ctd-O4vT5ewPtwNWsrpDGRh1TMxq-f
X-Proofpoint-ORIG-GUID: w_Ctd-O4vT5ewPtwNWsrpDGRh1TMxq-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNSBTYWx0ZWRfX7Pv260oT9NfM
 kUXPLM4ZZEEwsPse1ngnEYgY5KK5/8OVNzFe04IJVIrRFMlGK+bCEEJb7r3QTfnHGTRymBS6iqL
 faNk/jTP52FLvSf+wfq+DfPf55uIDX6Y3ReM/ImOeKzHMCbL2Xh4E57nzpVBeah6LsKzJILBVfK
 4RHc+ATTGYgf/nWh8uzHpsNQpIPZpzHtppfVg5uPttCNHn4ZQJz+mCD1XvWIl8Ix4gZH4idTWFF
 Z2P2CpeHBIt7C+ri+/wf70JXR8pWYW2vf5G1KVbXlYQaeVNGwtyh6SVzMkPfMudp18/FK0r/iAi
 adl7+OgfVkiG3X6nHlqAjSWtV2ySQZ8Va3W9jIYywvnlU8rhtHjzQZGRS/OvSKlWDLHvs6R5beM
 HbW3dya/twAiDEZrJHXpYohcazJnmh0vwfGnf23PRD8kZO662RvAL+BTJh1v8BFF8hni04n5QX0
 HzqJzRN5eV4YV3gYphg==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=6944c22e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=etOpb5xliKOozrl2HNYA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190025

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index f024b3cba33f..d077f0ed9e46 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -717,6 +746,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1


