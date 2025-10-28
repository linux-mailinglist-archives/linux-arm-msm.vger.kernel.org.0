Return-Path: <linux-arm-msm+bounces-79283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95175C16D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60FB81C2090D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D3C2DC321;
	Tue, 28 Oct 2025 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfdmuA3+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDw0UZgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FF2DC344
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685219; cv=none; b=X5VDGLiu/mDSInEpiiDgowPMQUqTdylD4hCfkm0Mdy5QQGOiZ3f84QMsXkEcFqIq0OdIDDXdKN6ZEeh4j6gTqBqRQDaKq3alUXxfy9KmcWvY5nrrP4IMlLzD5NqNmzpDRw5h28L2J+bH0y4PY+wHy4OPcmlWVHJV8w4wNxuImAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685219; c=relaxed/simple;
	bh=XZlVanBK07YsrrAgPlVUCFnWnH1kW6H3soUn83IKxhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tzvHCn0v1ilQGqe0RoyFX5C/2JV0Fl6noykwGQZNUpc6zhpuy1L2b0kCqaNLEQkdigtJVONG1LKQOMgCYYbgKG04y3x8rLy7CW5L1e4hD8V2GUxAJrYjq0hzjJXTQIRx836xIjyuwhNkSZ+PqKFvHLA+NL3yzjUDXrxQDrkrRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfdmuA3+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDw0UZgA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlRuN2553011
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztnEZ8z8mQZFEmEJLlZF9ukU00RhQZ/xEw/G6uwQnzQ=; b=BfdmuA3+YsIOLaKZ
	OEmDBEtxZIim0jIMIePePy4rTHY/Tejh99PDKqn5z5Yl6keatB5yoTnu9F2uahRL
	DJHFIvUABnWHIWc+fuHrGM/IhniABjKTD0s7ml76WbyXGVJp4N6bvXi7INJ44xyI
	OOfyZSsqZt/6KoYoCz9ELUwOrNAVSRsNMRG0w8CKlrik7HRquMj5CM/Et2EKPARG
	FJbIT0oica6WY+NVk3QHrw6oexwJ7W+Yppa0yGrTlFlQGPnKXubFb5Lk3TmoTfPY
	DsWlzJhnWHkPt7hf27Z2Zqejf41g7DNX00u62gL6lqR+NiswBrOksJ0LGYXOgHT1
	VbHOzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g5bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:00:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e88947a773so327651881cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761685216; x=1762290016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztnEZ8z8mQZFEmEJLlZF9ukU00RhQZ/xEw/G6uwQnzQ=;
        b=aDw0UZgA1AAKRO9dVLmmh5MgaTD76QckB1LeeHPrc8Rky/xm5r0u8PD2IqP7vJAot1
         YV1uj+CX3IZyaNR8K4PRypDzPRooF2Fo0cbZ/7j4coqVRPnImeRKEZfX0qQ8jHVUSO2D
         V9cjjrEkLPKGqN8HyLUEakokqLZPYsajskZ+2yEgAU72jQI+L6J+fyJ1wdnDypPGWi62
         L1SpOTPkp7cI3jVIoONGEyWGB4Tml0XP4b6dFJdxsbW4EoJdSMdON9CcE1hux1yMvzDt
         kwPvZ2i8gA+4Ew1kuJ/j49JkTIou8vcqWzjTZNOJTSqBiuvJbKm8rrz40HJaCdP5z3sE
         zEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761685216; x=1762290016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztnEZ8z8mQZFEmEJLlZF9ukU00RhQZ/xEw/G6uwQnzQ=;
        b=AY97xb2sdV/eKPUYTnxj7w2vrHccqWuHDqCagS2dQlE7SJ1EmEeHRZmPHxr8x3gCCA
         kGY8BpwbCPASLOdtqVYVklNdcbNnPJm7uMhcc8RofAV/mZvLEUpcslCflR2KdT40agzk
         izg+FeJzAuFxr/DIx1R8T1Ss/zdAJeyBule/Q1lBNL/d4HvaramGyKyDC/nVNLi2vXb9
         EUDHUOXMpTbqFtcxkbaZc4EZtIsF/uTk4F3LfyRdKp03gcp+I5tLYNpYG0TX3XpEtxG2
         JnVQMSkwZ7F6w/oS3o1Ysi5EWeUyLyJG3w6JXdsGATeOwpNmFwrUsbYKG8twHhP3KhBK
         VfDw==
X-Gm-Message-State: AOJu0YzMgeauB80wk0vKtaF17e2Xa3XfTdyIvGfMxOkb4SQFdn4Igu+x
	LvgL/eSSowKm8U1Pk44cLGTWU0XLVFUiUHf0LV6R9Ou6XFRBNJ6dz7h8ZCzSE8J1UecJgh8KS1z
	G16rj+snyZIqik0ZEbjS+P18vjRZLclARI+TTrNMWMqmcMvARXBpMFwM7ESMjQ2NbHFY8
X-Gm-Gg: ASbGncsVsGV2pTg8bEkDtMpu0e88/adeeyqPfbVqx4QUL0eLXUMk4NtB9u3/jekJNzm
	rBgKswYXFyw+uphAL0TpIJfM4wj14UZmPUJZrDsQicaNcULg4XVFuUvLl+83lhKoe1/GTXLTmes
	XxB6kskTSI4f7y82tgoGY43iz6ozmkJeo5P8PJXWy8e/wSAl5ZJsGqQFNaLHFP3JlQB5v5zDcWM
	7/1+/s+jDTjjGk/OJRKcAfWTMYx1OznJPMFlXinmC+QsXgGq7x4gBxwXgzk7McAR8Rpf4NuYglN
	jFKi+OYL4uFY1hxKx7Q/NL/hgxtKy/tlUoc64R7ssBTdHxafHdxgfv9bvrSrYEPaxDFpygXjszv
	yLoXJhXN266Dtfck/escqtGghqd0Qa0d80RRwkR6tDo3iiPfyP7ftob4Jgk5R6gVJvIDKjUXiBd
	nGsYI32R3k3mdp
X-Received: by 2002:a05:622a:8f:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4ed15b4947emr9504521cf.7.1761685214688;
        Tue, 28 Oct 2025 14:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy+ynRMizh5efdzduRYMgWEH8/HKBtFtnCd4b/KaFwqqay4ojtNyQT3m1WxgtDSScIZivIIg==
X-Received: by 2002:a05:622a:8f:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4ed15b4947emr9503721cf.7.1761685214025;
        Tue, 28 Oct 2025 14:00:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f861f5sm3283594e87.107.2025.10.28.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:00:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 23:00:05 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sc7180: add gpu_zap_shader label
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-zap-shader-v1-6-7eccb823b986@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XZlVanBK07YsrrAgPlVUCFnWnH1kW6H3soUn83IKxhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAS7UDIYbGe3XDxCxNrS0zAq0+gWjg/uMGzAzs
 718A9UAk0SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQEu1AAKCRCLPIo+Aiko
 1dNoCACg08F4nyNGtHTbnJoxhvSiUhjUDQ0LUe3n5iTPGjsYsXTNaeCOJ/E7hTnBAOHPV4vKWhS
 RBW1luOf3MdIBXy5wc3lHHRKtIcvtlvg//F4+2jy+dMCezDZeeG4UtXamw+kyxpRUNajTLQnMwm
 M8L2J6LIkT9B/sTeA5W7CFyeWnovb/Cd2mcq9CUPTYil63meHsFSbNEapS89kVMNbjW8Wmfsxtt
 O6Ofy4KUcbnLdvy5RJqbRhG4JQFQ87yMiLKpiOOhjvAOcYBxwmKgMAiV2azLGS1+EtCUVrdNwTO
 KJYHJ5KcyhFUtdSyMcZ5e7gLfWHYkyXJ2JyVbIidiLjjCqay
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: uBwTSuhhiFoWMxU1AdZBpcqprfhRYg_5
X-Proofpoint-ORIG-GUID: uBwTSuhhiFoWMxU1AdZBpcqprfhRYg_5
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=69012ee0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bRHBWdnJZKEDweV1ddAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3NiBTYWx0ZWRfXyf45gz7UCNJC
 aZxUVRz9BWbfXPRTgPOuwlu8XMU7Yvx51LbDcpsda7r2dQU6cYiQ0tgruvqbxZbz7qQm+mBVopj
 2XVXoYrEnq/eDW9TgSt6MF7AoSTJO7Z5qCVZckhTy24XxtUE7eicY1F+q5ClEsw52OXjIkksgZq
 iTcguFKuKna6gpmJAQN4tsj1Ly/ebDoJYbc0AhjSlhs56kYzXK68UOh35ixKEwq25rDT+WyFRFl
 Ua9pfRDCv2/BcTGSaH9k2l9wNe7kJ3v1O2Ct55azyDPT2ODoNoYW/bqCVIbQoXKmiADiiQBPnoY
 NIOFKpPIeR+iO0wU4OWF6bo3YoYTGbMqpNyiMCzXyPHQOa210jxEM/bGk6ESVfrn0ngGIedawjn
 QOKqkEkCFbpnvlt5WtrV+AUU/Yhtvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280176

Patching existing DT nodes based on full path is error prone and
generally not recommended. Add a generic zap-shader subnode to the GPU
node on SC7180, delete it on trogdor and IDP, two platforms which don't
use ZAP and patch it with the firmware-name on all other platforms by
using the label.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 9 ++++-----
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso         | 6 ++----
 arch/arm64/boot/dts/qcom/sc7180-idp.dts          | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi             | 4 ++++
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index ad342d8b7508c543984f166300bea04b6d7de88f..1514da636269826ce3e87d8c23aad0e37430f57d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -31,7 +31,7 @@ chosen {
 	};
 
 	reserved-memory {
-		zap_mem: zap-shader@80840000 {
+		gpu_mem: zap-shader@80840000 {
 			reg = <0x0 0x80840000 0 0x2000>;
 			no-map;
 		};
@@ -426,11 +426,10 @@ panel_in_edp: endpoint {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		memory-region = <&zap_mem>;
-		firmware-name = "qcom/sc7180/acer/aspire1/qcdxkmsuc7180.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/sc7180/acer/aspire1/qcdxkmsuc7180.mbn";
 };
 
 &mdss {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-el2.dtso b/arch/arm64/boot/dts/qcom/sc7180-el2.dtso
index 49a98676ca4db270ecb55e8f801d0800ef9e4def..6e8da59597b657cf15c68c3a12ab56213979950b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/sc7180-el2.dtso
@@ -8,10 +8,8 @@
 /plugin/;
 
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
-&gpu {
-	zap-shader {
-		status = "disabled";
-	};
+&gpu_zap_shader {
+	status = "disabled";
 };
 
 /* Venus can be used in EL2 if booted similarly to ChromeOS devices. */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 19cf419cf531f353f17b83b89ec57dac697d5134..0bce3eefca2e9b14310390f49616873689894ae3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -39,6 +39,7 @@ chosen {
  *
  */
 
+/delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
 /delete-node/ &xbl_mem;
 /delete-node/ &aop_mem;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 74ab321d3333cf8fdca45c7cde2fcd9d34b264b2..b398f69917f0e1eb7f2b1b0a6cb582ecb0c7c5c9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -41,6 +41,7 @@ charger-crit {
  * required by the board dts.
  */
 
+/delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &xbl_mem;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a47182994c564e036dba25c772454320dc41cc7c..45b9864e3304b2c0331a27109f7918c327cee5c2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2185,6 +2185,10 @@ gpu: gpu@5000000 {
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.47.3


