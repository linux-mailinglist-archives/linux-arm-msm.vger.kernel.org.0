Return-Path: <linux-arm-msm+bounces-85009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24397CB5445
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 09:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1850630361F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1323009E3;
	Thu, 11 Dec 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D92h8Tw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJQ4EyV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39943009C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765442999; cv=none; b=JhwZ/WG311YAFvOBTt6bh1Nn/AeYbg+wGT5BvZz5h5n548aMzlOgBWioHK4aDekoE6Z/Re8Qx5lKdFLIzXxdA96XzUR1jGRAVaqKBlen4AcnVP7lEPPUhRg5sVnEeHPTIqXe+rK3OsUjZh+EVBpX0yc2IouTrGBsnVZ1E2oItqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765442999; c=relaxed/simple;
	bh=bvfLg/DOPMj8qnPhaTia7oKAAuu0LFvdKpTuLc0a7K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lp13+fA8VvqgPO6FEwyyEkQFkYO2rJharYEsYaqwAXzDNnN3/nG7ShZbyxhi77wMjP6Mk35n1xMlAEi6D/85ZklpZKrO01GCSzp+N1xiubmobSRKtpv18VmL+Lm8yWdPIB/i1g233+aeseVOsrsgitNazVboUJMLa10ruPiDtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D92h8Tw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJQ4EyV8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB8gSZa936934
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8SxwnjnpxPGkw7klPKkoO2
	QYM+Z388l0PBRvJ4pFsYE=; b=D92h8Tw6ptL57sW0GxXAJYIfezfZl3CDfmaVmf
	f9c9xydTEQtU3bYztaELKtNHPsUUR2TvxxaWK4/x6sIKnmaFzF9Z5/xpzau8GdIj
	+hUpT2H9fDO0QMfKgqJYWoDW+SiYdVailaSWbf47RkulcI+HDmz+AdJ2pAz4OIdK
	Ly+Imc3z3/puJNsUg9bLkRwih7aSlNC7EAE5N0uK12QY0JN5r2SZ/hMwJUTmcv0j
	/c66N90U5YyxPuwCMiCGUmFBC/+mLc8vyUHJuS44j9/WLoOJ+9qVDsGJmWw/1u/g
	O+n5f9ksLe8GmRHqG32wKYeWyWPkiQpo+ma4V0KmNv7OHRSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1pgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 08:49:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f48e81b8so11258385ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 00:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765442996; x=1766047796; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SxwnjnpxPGkw7klPKkoO2QYM+Z388l0PBRvJ4pFsYE=;
        b=fJQ4EyV84Pozwd+UgWDiXSnuMk2unG0n+meqKCXw45E1BV7gEyyRNwlhiseFF7iwTr
         aZXpJuDEWa4AHBndeQO7o12Vh9LqeB7JtVKMsud5Cp/yf6FEe3C/0icm1xj47+4123mx
         nrff4OlsdJ43W4mG5XyD9hThm5A6WkukP5QA082rk9EsoifFkx+EIkd2m0E7L4kNBqcq
         Dz495tO14g548NVnq/Mf98QvkAiRPazarEqJcKV9PI2t03a16YLkzpvPObXssWxWYYF0
         8KGGagLyKOz4WGQE8h7esxXj8gSMCQoaZruKrRinep09116nvNseVB+z2UF1noEZSajF
         6z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442996; x=1766047796;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SxwnjnpxPGkw7klPKkoO2QYM+Z388l0PBRvJ4pFsYE=;
        b=VHZz3ha45p03yV475lgAQE1Hf4qfzZhz4VvzFGUVYBvk/fvxV/jp+Cu+XZp0s70cE0
         0h3y9gc3cuNtUR8p6d5+6rlG1jit0y7mIjCdqFU/fH3MjfoCw4JJFfElsMCdsv/x2xSG
         JScsJcJw+hUCLkUR1CFQ531yNcafvtkp7lepaep6LD4Xp938x96ZAKk6gMjlVDf5Ln3f
         rEpkAkbcSRkSQUkGWQP3f5NiYLv4vIEFLAx+ReQpOA9TawlniStKC2MDDoWIGFp2QjIV
         C53zoEKdV7otf/OBWN6HgHEzELAuvV4xtfsE+RgQfZee6tqUZh8AFhniUCIH3CR5ZFKL
         yOdg==
X-Gm-Message-State: AOJu0YypLMbJvNwDEtwo5J9pgqJQ+xuptPHNAI+UzExPJ4WCBfdAB+Up
	HwIGFk0YEqRqH9Aj781ksfzD1RDE12it9u5/M0GghDE5Qg5FEmmYwrtSungBgz92nLcdNnPJ83p
	4Ohjhy8QDhxWtVCZyMfxuR7k3xU+D27wb2RnEc9ufPbK3b8G3mN7UHbAogDIjC70Mp5I1
X-Gm-Gg: AY/fxX5QVHD2EGt+GLHejpZPJprkouTmNmeEYtSn2F7Z0LpHgLJ+4E1cEyvJHRMdjPp
	IaH3lOy9IsdSsMByiHaT0G3mLaGeI7OmTd+eLJEgzgjoD0th4hAwz0TThh3xDy0JL9Vus3Wte8c
	h5FjyrY2cjx8Q6+Qdt5wDhCcjILq4HngJY24S7O9VJMJGkVo7D4I+2Gq4eaW9x5WqhxtS7eW+kt
	jsA8mJvXa4Pn7lQRIF6XirNs7LxXKv75tB42Uc2dc9JQBZodyydP1YcXXSFcnpdLLCzS1+gTgEw
	7lzyOBRJU8yObn24CvpjrKxiGN5h19b403UXnxUSBC6Hz8bYXlcKJCSWziEYXjdf1I8cPBYpbae
	DT+kAXOvWCe0igYgb6SpfQNnVmLSdL83N/ew=
X-Received: by 2002:a17:902:cecc:b0:296:5ebe:8fa with SMTP id d9443c01a7336-29eeebfe575mr13747255ad.23.1765442996379;
        Thu, 11 Dec 2025 00:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBa0oS93/MQoeu73NXgcNxkSjgAVk1cWs5YGATBhhuOw2YX1kd6M2yLudoYN7TBK0HDJ06bg==
X-Received: by 2002:a17:902:cecc:b0:296:5ebe:8fa with SMTP id d9443c01a7336-29eeebfe575mr13747025ad.23.1765442995876;
        Thu, 11 Dec 2025 00:49:55 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b3742dsm17330425ad.6.2025.12.11.00.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:49:55 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:19:45 +0530
Subject: [PATCH v6] arm64: dts: qcom: x1e80100: Add crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-crypto_dt_node_x1e80100-v6-1-03830ed53352@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKiFOmkC/4XNSwrCMBCA4auUrI1MJk0bXXkPkZJXNWAbTWpRp
 Hc3daMLi5uBf2C+eZLkoneJbIsniW70yYc+R7UqiDmp/uiot7kJAgrGsKYmPi5DaOzQ9MG65s6
 cBAZAtdFMoeS1FhXJ15foWn9/y/tD7pNPQ4iP96ORz9v/5sgpo7ipEQF46yTfhZTW15s6m9B16
 zzITI/lh0OQy1yZuVZY4FqjEcAWOPHFMVjmROaEsohKVhslqh/cNE0vhpId+2MBAAA=
X-Change-ID: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Neeraj Soni <quic_neersoni@quicinc.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765442991; l=3298;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=bvfLg/DOPMj8qnPhaTia7oKAAuu0LFvdKpTuLc0a7K4=;
 b=LswJj5AJOraWtdtSFasYLTfaVd6dtyw+evTQKolsSF8+71Q75dfH2duwSDjO5kEyk07cJHAEu
 UTQkSyn0fR5DRipGZKV+yk/Oqre/uPYyfj4pNtne1ltcJQdJ3NDVWKg
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: fv2xpQokLKQ1Pk9NosWh_21xadFW4lL5
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a85b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sh6W_4nX93PCX1bT9VcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA2NCBTYWx0ZWRfX7oVXhhbhmg03
 KwJ2CdkJPzVlW7sV/+QmoYjuQx9uJuUhCC8K/Ey3JOEvbPKHGAelLe2N0B9JO8eec5a23PQKpqK
 n7uJuxE4kWsfcpPcM7GoRJxcSqkgyJDJeOUOXCZ4aUhAPYabzIXMoReKwrYNVKeeLLz0kTqRFFw
 4gBIkWPzTYKD/c7BSS1KqXcGaOv3ZQbUxwRN0HtnCmrIsHx51emsl/hTLyBtBuqOBuHJ0VxgUb0
 3NYG3Iq7+dG0fh8sHunw7FdQH2P2Wffm9lC7qUO5yZz/suCcNDDKCTuZi+JLlkqNpNmleQiclPG
 bXsKg4ALesajJnarZWqSLj1mal4OWK7gQ4mPJO61VjxK8cZy1JVjK8v4/rk9hr4+ARTvjDk/ohh
 5wAGgemW1t8XDScODR1hGIrQYVCU2A==
X-Proofpoint-ORIG-GUID: fv2xpQokLKQ1Pk9NosWh_21xadFW4lL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110064

On X Elite, there is a crypto engine IP block similar to ones found on
SM8x50 platforms.

Describe the crypto engine and its BAM.

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
The dt-binding schema update for the x1e80100 compatible is here
(already merged):
    
https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
---
Changes in v6:
- Added Reviewed-by tag from Abel.
- Link to v5: https://lore.kernel.org/r/20251210-crypto_dt_node_x1e80100-v5-1-5ad22a869a56@oss.qualcomm.com

Changes in v5:
- Sorted the nodes correctly as per their unit address.
- Collected Tested-by and Reviewed-by tags.
- Link to v4: https://lore.kernel.org/r/20251208-crypto_dt_node_x1e80100-v4-1-f5d03bb2c501@oss.qualcomm.com

Changes in v4:
- Updated iommu property to use 0x0 instead of 0x0000 in last cell.
- Updated dma-names property by listing one dma channel name per line.
- Use QCOM_ICC_TAG_ALWAYS symbol instead of 0 in the interconnects property.
- Link to v3: https://lore.kernel.org/r/20251127-crypto_dt_node_x1e80100-v3-1-29722003fe83@oss.qualcomm.com
---
Changes in v3:
- Fixed num-channels and qcom,num-ees properties by updating them to 20 and 4 respectively.
- Link to v2: https://lore.kernel.org/all/20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org
Changes in v2:
- Added EE and channels numbers in BAM node, like Stephan suggested.
- Added v1.7.4 compatible as well.
- Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..7066130f242d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3760,6 +3760,32 @@ pcie4_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx",
+				    "tx";
+			iommus = <&apps_smmu 0x480 0x0>,
+				 <&apps_smmu 0x481 0x0>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0 0x01f40000 0 0x20000>;

---
base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
change-id: 20251127-crypto_dt_node_x1e80100-bcb1a2837b56

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


