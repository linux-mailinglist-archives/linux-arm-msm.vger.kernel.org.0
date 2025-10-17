Return-Path: <linux-arm-msm+bounces-77810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A450BEB081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1625D74750B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859622FFDFF;
	Fri, 17 Oct 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwzT3dgM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91DC2FFDC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720966; cv=none; b=BDwTQP34FXBX8Vh5cOnyWH9X3ykC6AAMijUHTJr/tiLynChSjv2RjkKEeM5dBzRzN7F12Nxj3RGk0eFqP0GOuPab5WC2tI1vl4TZj+UvMYJeKImrYSBCtTw6It0hr18sGhGfp3oyioVa87BPQzwNKLy0A9tFjKA+N8qbQcoijCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720966; c=relaxed/simple;
	bh=DKmlAsIPsxKb+UGLtLz6RJbuB/etyMXqxhU+LUte0fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnt22c96G9EXIpd1C8LtQbZdT3cRTbgcnK/pjOHX/4irV3OPACP7epJ/wwwTENBOuSiH2bxBCe+XtcwdF3Z4lyALlqhFRhuUrOcYD4j3fObxIN5M+jyBRJP7/HF0NutAd1UFAwB4IJvWDeJxTAdfIyZU0WisILD3lwlPK3/BrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwzT3dgM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HG5sex022178
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=; b=OwzT3dgMYIBGJkgP
	ryQIdBp+caDt5nzx3XIkgHp1hCfFQwl1kfS3JAr3L3XlVOhkjZStgvJ9I4WFTLq3
	MrUzDzYx5q0Sf26VCE02q+ed5hNPIWeX2nx0XX6lLfLOtbwpK/qRSWxVgmtBfDUF
	rHdLZUxXeqYv2ecVyaMs3WVzaekwkaPc385sL4JLHTUsam8raUD53oF3jCiDjWK1
	hDRlJvSmOUDNyC+ApOgFn36kAODfgt4ZwXIHEhLGUUekGV+Cs4KUSl9KaDSbPWGk
	juAleLdbXDSqd/5mUVJwpxyr46+lwjynr0qcMCODXG4yj5Wl8LTJlJ+1id8oP7ZO
	7Xi4gA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290992f9693so21743355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720963; x=1761325763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=;
        b=K4Xr3/sgPKZh/6Ims7ZxozrYgrBHflujutwhMRGgsUPRI08axF7LPaLddj7KJ/Y9FB
         7rNMkTxlosuOtuIvUgn6qpVw5zwIJx/K229aFYiNviFxkUy7p7qN1ZV+0r36Ne82FlmO
         S1I0l9j/kFhWSTzQP8Noo9Qdf4a75wW9F2DaJt+SuDx0lDZzj9n5Zi7q7i7OL5Lc4DLm
         nYt1SeMsYwyawZdsKtWwk1ngEzQJTK/tQ4rXHXlwGXewRpMdgbKau0qLvO+E9zoYXcWw
         KoD1BnuKD4OE0Or+99OarPIjf80jUfF9vYmxyBNh+pbH2MnDLUCegcX4UZgov/lA0NEs
         W1mQ==
X-Gm-Message-State: AOJu0YzCZ7u8mUKRQ+43U7Bk44sCqULAUMRVtk47VwpMP+/4f0eG9dSV
	ONy5oCbFMwYZw/xT3KrhpGb0i6x9zgAaDSB8zJfDsl8/3jNmAMOVPfFfoth+qMcRsIGQhk+0reF
	I8SDBFBYnsAB+XYNKU6b0b9H2cdw5EA0G2nYbprQpuGsHAa+/1wQREhFAoNGDgAwG+yA4
X-Gm-Gg: ASbGncvr5swlLQftkLNJdsZ60RvxPdJEutuZwDDbnVmThIf82XzU41oDZ6KcJ8wCNXb
	rxLfPG89QRBOmBXo5eajiP0a7X+X1+VQiK+HVzjxyx3pBEsXZG+2tS0TZSQmrBF5fgYdrrS6f4x
	Yot2msZJ2p0udRQcHB3xs9NctRFlUiGyYA4/GgCNdPRSSun6r5785NlZPrmpJ8gEoo3oZtb0zOX
	cT/OrAL7nvjJkxxHo426+dFJYW5/pceR1g8oLYq3Xei39bmIRQflxP8DU2FUJPQ6eKyY9mSaVO2
	kUiI/FOdKlBxiR0x8lEC7ReNRuKGYZJFD/f+eNvtl2aLpz7vFSDsvHBTnPhu17DYclhiahMCYLg
	hzCwvyj8sGeeG0fNya9yno3U=
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id d9443c01a7336-290c73ffa25mr53353325ad.22.1760720962509;
        Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB96UCLwEK3jUShTQzV0gUnk3hW5K3A/BrffKQ/0gKgmFt7/wcKFMWQ893/dLgxL2buboOqw==
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id d9443c01a7336-290c73ffa25mr53352965ad.22.1760720962044;
        Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:09:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:32 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=1765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5mbhq+gWS8F7DvY1Msh9SObG+ekXua8QpbuDfASaubg=;
 b=yY3kyUZ+SDP38eprTVxszruPd/GBMnCdvG3qN4R2sdzMWA96T4wUw4IkFr/sYy0WJkwQXVthq
 NP4NVlnlLygBIS75BYf5huDjqCUnykEwnPihfxWH0sC9BJg17NyTa70
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lR53H8tPaMflKak7hqEs6wa5hTKFXAHZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXwHKB+wyG5A5O
 X9wERpiUr1UdTQQsrEArUYflQK1BeiE3XYWoej726Eenning3Z6cjXq7C+lDTJgl27mCXZaqDtL
 rUUlxwkUCS0P2HnG8BCouLn5heGDUxjqLL3CFkE4fzP1OeXf/FV0M0M3vnefe4SJZak3uYalre6
 yG9fuXNsioev/UA8wqEOgGMcW2sKDTKjjZPOfihfVHubqYycfErlIACEPi2b+Wvhshnid7sj3ks
 zxujb4ppAfXHBRqfufjsaNYwxcKBoui3iQwKET3jRa/WtFIr4oTdIg2gEmErccN3g3ml+/RRCKA
 FbBE4xbVSTx8Fb1KpE0KpKoW85m6Kb0D763xyP2D9V36boz082o1pICAgvDK6gBEKZqqzkzSGaP
 ooBlfbOIF4EIVnQ0N4sIimzImsr8dw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f27843 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lR53H8tPaMflKak7hqEs6wa5hTKFXAHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0


