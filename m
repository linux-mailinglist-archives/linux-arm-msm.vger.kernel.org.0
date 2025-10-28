Return-Path: <linux-arm-msm+bounces-79280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF6C16D83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 984604F4312
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F663351FBD;
	Tue, 28 Oct 2025 21:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFAnUJSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ox6MNUtg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2447350D54
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685214; cv=none; b=VAkZ04SC7lkdxXvx/ZSWxuE4Tb9fNVV7SOfiREgz/FaDDkmceW0BLbM4dF8KFa1hr2kz3Us6KpJUQHUBK17kcjHNN1/1MNbC2zoN7YvqnGGSUs2omqtV+DAD7btsVMFErLZLlAocJPWqO8HEFsoEMknc7p89E8yupFaYzylVsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685214; c=relaxed/simple;
	bh=CwYtSL3ydaPjZtAAIaViNMdmrzUpICYZyoSsjpUWKZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSDQPjjT6i+fUxLAHvZqUNq0Nz2g7YLo7k8Hf5gnhXf3s7LqiHJ0qlhK0+bS3ssXOmnLk94trz6ss1ApLH7AEqo0aHjw5SLne9eFWOb0sYWz9/fa8vDYBP1nS7pR3m+KnuOUnqmo0MXyy3XA64W+e8P/r/Wgv2m2M09TPtsemUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFAnUJSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ox6MNUtg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlHtX2616684
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKJZs4WeO9wG/g/LdylOAbfrDrIQHhIXPp1U//b927M=; b=jFAnUJShYJnGsEEa
	ZpgdiUuqUuGqIMOhyp6BgGWMzuh8CqG4qPdTE8qgSD9/2AzFtQfrJHcgp5TsjLFJ
	TwZ0BYLHnmZSqRhAXIdIFH1ua1uK/pUg44kSAtDMfPjiygGL8YhjpKCUzjv9kdJ5
	bRoihPK8MGvewxN4HAdJXMXbUaHv06zHEjdQGmIbJuLqtEscEVIwA/0YKXWovvBN
	wnMy9sfaPAuiWF5UUM5p4cnAgszwm/kJxGauuqodMaSCBNiewgIMjKJOjjA1eXCy
	FB0uCIEN1UMxdUurVme8DWDPbI17+QyAIIOi8PyU24HYB8QekPqTprnkxBF8OTx0
	1iTxHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y05sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eba10ad6e1so62620531cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685210; x=1762290010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKJZs4WeO9wG/g/LdylOAbfrDrIQHhIXPp1U//b927M=;
        b=Ox6MNUtgrAnIvKLoBZey+24otVKem66hyuLLj+NHTaEjPnSok81SnlCvHfQpSIoDMP
         Chw019kXP8+U5vcpSYfVB8cEEtCw/5e1LtfitY8Ce520EDnqoiTtYd8WlYVCNv6ZuXC/
         5Kt9A/q/BXJnpGDhQMi4zhk/hG74F6xKMfqmM7NuYloFhomGC3zlG6zKEeQD9OHyw8tN
         g2KNp6aex20WGRXbGqxALen//lw28269WIl5Kl8EYGPNIzUgWRhiQ3TBLMPvFx9eeDoE
         LUr7S4a1ney5TfkDA8vkkS4AEuJ6N6UxRPpK7Dn2xKr2Bpe2OUfK7ghoaCsLtkHsNoZT
         OlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685210; x=1762290010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKJZs4WeO9wG/g/LdylOAbfrDrIQHhIXPp1U//b927M=;
        b=arBjeUOswYlLhhspRtHbYDYMlAkkh5T7j+LVwQr/75jUHjv8SwVX+om+j1Einb4zVV
         YObHxNAQ609sUtcpqnQi2SpiD446DFYZtse64KKndndIpc4ZPaai53SIBLomFIH6e6Dm
         o9uLgLl3DA+Cq3eOgTQkQ0HP2tK2gWXj25S0gV2KAPeVQALhy8lRg4osUw+bS9YPTFZZ
         rtTkbpd99CHM7/OueXyb9M/czdUUIIo5qfJmDMGUNL6KZ3gg+52fWih0F5sxfLMSyAnK
         zKAb+4ZizHyl6SwLKkVFBzquS4LtoNYHAuR9KqyVfUhNGQ4m1e2t/3TgUkx3m7TE060t
         RwBw==
X-Gm-Message-State: AOJu0YzbmZNlOBiIENbpYmoaxn6TNysZHfGo0I6YlvBmNU9p3vltrs4d
	W7toJ8ESE5HdndOGuZMYsnoitD/IPLOjPlMtSHge3QbfiNSseVoMC+dX5RYdPQor24Cc85T4WaX
	pwLsvQaCzU+l+37Rgw630xxS+fswh2FOyPOPGphbkRRrVDo/QdYn+W/016Y+2RxqHUPGx
X-Gm-Gg: ASbGnctHRUc7t9y+veVd8is2U0CK3NlcXM2zxprZAT0l90tmkrTgX9SkrtFmTuUuMD8
	6BYoevQe8WnI1HJMvvtJJOIrfMggmWFgTMyBzz38Oyx3FsTXs0hFyUFCZy2E5xnwlGvUtbynUyf
	FoEaMz7xLRStV1oBm5L1t1V8mRSabrxzOXxy5pXJ3qaCwFiu8DgWuyaogp6cQJY7fRjtBmiJOWZ
	pSTeorJkHvhiCAaaahzOjRqGriV0xu2KgqOgCMpVb5hqpez0dLeRgiW7VvcnA9LFWoFzp6Z6B0g
	obFjR2zwCMw2jRnxlXIAZth7X5wUvNhdrcAbGQNWO3kgtWCPXz5MCrm3YHQPki1xCdN8fAIJkvD
	eu9Nrf0rcXTi7sjhLdmJMtbvh+8dlkVqtRYe8tZroe1MKCF+gj4RVZhy3Ym24IC9Hw0sY2jyvN+
	5hfdnxVPM5TwuD
X-Received: by 2002:ac8:570b:0:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4ed15a3c027mr8116011cf.0.1761685209866;
        Tue, 28 Oct 2025 14:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYsTaZ2jdJMiMfGuRq3YefyAWHJmT6QsE8Ud6CA7utk+BwEHqJQK55j+Vy7cSqUKHznLRDeg==
X-Received: by 2002:ac8:570b:0:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4ed15a3c027mr8115591cf.0.1761685209384;
        Tue, 28 Oct 2025 14:00:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:00:02 +0200
Subject: [PATCH 3/7] arm64: dts: qcom: sc8180x: create common zap-shader
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-zap-shader-v1-3-7eccb823b986@oss.qualcomm.com>
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CwYtSL3ydaPjZtAAIaViNMdmrzUpICYZyoSsjpUWKZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAS7T12d55mqeVo5ywuIYzsFgdFy3gAjM9XMyp
 yF8OjughTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQEu0wAKCRCLPIo+Aiko
 1eyKB/oDtn9PWtRtn06HR3BUcJVXCT7j1t/JPU0CXkfcW1A28McDCX+/LYtZ+MZUwG6BvQo0Rk2
 jKv4+78nJJ7CZxo+MtgKhDq/cGulzzRhAKfMa2FWFitCIIN8Hr6s9A2MnGaNT8jLHxVgnb+JU3/
 R3Oc2zmEsIM3CBKc/9ir/aeBHn3n1LLrkIHc2q5/J1r4oxPBIVTwJYEgkmcTGoDEcSSCwtCfaxo
 iEDV1GzF8STQvkZadiqLPjTqdziPn5EmtbIF2iLI3fAjBPXiI4qLDWkuXqkD68oTYwWkoGgw7Aj
 rvIOob9UirhmOGqbm+L/2lPfwFYvu+IoUeorw1ugqBDW+xBb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=69012edb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IGUcv2A_Vedk0hkw8VMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: uccMbp5TEG__gmZwCJOrJQE-cSpNCegF
X-Proofpoint-ORIG-GUID: uccMbp5TEG__gmZwCJOrJQE-cSpNCegF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfX/M2DJqO/hlrP
 vw+yKywr7hr62Ti0VAMVtBUis8iIHOKbdpcaFw5rorAfyrCQZFYu3/MIojF5srJGJpR4j66MAVX
 Fit0B/6m1PlcuCkd6hoTzoApo3b8F40kvI7w6poMFbXpFmNTHWbn47+pwHXTzlQ2c0FWtVhyY5F
 6Ely7Yx7ZBHGupaApvAhk7nzkPaiUpLlvcf2L5x9wN/w7uVReo12fvC7GVnA4V9FBhf5BrKAtVy
 7YPg1kXTYDuYUVwh1A2l/mPposibgQvmIksqL4oNeF+E46/UNft8B88DtrgqaCYwug3vTXpY5Xn
 YreiPfsmKoujbVufJ5yqwTXByp4TGcRcJ6IqKV69n9CBxg97G4T37kgao+zwQLgQBXCFjdOv99o
 L9xGyZzbuiElskEKl3XoyPfCEY2V4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280176

In order to reduce duplication, move common GPU memory configuration
from individual board files to sc8180x.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 6 ------
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi               | 9 +++++++++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 08d0784d0cbb899b021198bd85e26f1a93861713..625a155a584ae4ca14c6f373ef21b773ea7311cb 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -151,11 +151,6 @@ adsp_mem: adsp-region@90800000 {
 			no-map;
 		};
 
-		gpu_mem: gpu-region@98715000 {
-			reg = <0x0 0x98715000 0x0 0x2000>;
-			no-map;
-		};
-
 		cdsp_mem: cdsp-region@98900000 {
 			reg = <0x0 0x98900000 0x0 0x1400000>;
 			no-map;
@@ -357,7 +352,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 93de9fe918ebdadf239832db647b84ac9d5a33f6..069953dcad378448800d45e14931efe1fe1a69fc 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -14,6 +14,8 @@
 #include "sc8180x.dtsi"
 #include "sc8180x-pmics.dtsi"
 
+/delete-node/ &gpu_mem;
+
 / {
 	model = "Qualcomm SC8180x Primus";
 	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
@@ -444,7 +446,6 @@ &gpu {
 	status = "okay";
 
 	zap-shader {
-		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index e3143a4a41c948cf4ddbf4b137a1323366566fdc..42ab76d52ae21c39d5855e20e11f9cb2319f3afa 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -646,6 +646,11 @@ reserved@89b00000 {
 			no-map;
 		};
 
+		gpu_mem: memory@98715000 {
+			reg = <0x0 0x98715000 0x0 0x2000>;
+			no-map;
+		};
+
 		reserved@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x1000000>;
 			no-map;
@@ -2274,6 +2279,10 @@ gpu: gpu@2c00000 {
 
 			status = "disabled";
 
+			zap-shader {
+				memory-region = <&gpu_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.47.3


