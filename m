Return-Path: <linux-arm-msm+bounces-80879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CCC440C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E783B244C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3D02FE05F;
	Sun,  9 Nov 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PY0hDFBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StsmIab+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3FA2FE06E
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699158; cv=none; b=A3T6+MjDTETkczVDgkXtRQ4pv8HJGBKvDpP7EdiJtxIcCvBrY4DMnQp0KTdMl9fT8gddmfBKV0+Qn/UcLtkB26z6+4+auIUlb6ezv5pELxvmQSTdEJA3fHAkFFMd8b5XSy47UZjCvgm9vOvBuZOeJJni6xO32wqr4wNoSv2t+S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699158; c=relaxed/simple;
	bh=UMYfdnFcEDl//CBNfVhkReoHQvijQL74vM5MXpvs8vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjmNSnIA/2cZTg0yJq22rXYQ/+AOCs9KbYBHe76ItjtsXiffHoPONMERLlEphwKQlQcwUl0F0fN5Rm77VivkfE1/is0rvCbSizCKc6fhxo7GpBKTaO5rtV7Ps+UAQIxAw0fFm/wA8C8hcy8GwO5BX37hu0jwrHbuO7fVumjETtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PY0hDFBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=StsmIab+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cwOq034954
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=; b=PY0hDFBGvwSC/Zwi
	eQZoP7MaJFNlvAN82OowVKLHEzV8+xZVYpiffL5WlL0Nxs2NFBYkGvGJXUpIKKUs
	6FaAtf5VqcPX2TbrYmq9U1JSvr1225VP/huhWBvQkIxjPy3GKfz1A/V9fzYR4B5J
	E78Tcc772JXXsVgdVjboP+R7uxLcJq5GmMpKdH+Ca5YfxN3wowd1cZi/WaoXS6Wg
	ZHgsiGko8Jp35Vea3xz2lvUH9xMYdC5gF+Ed2812Qh9vjBEncXHOJ7Icue4ijvUD
	7v08VXreRAwwCdi2stgO3bfRQQtOmHbTY2cUxflaZU0pPEdVh1J6uUoRwD0wKFg3
	pBEU5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xwfj872-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:39:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29809acd049so4824635ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699154; x=1763303954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=;
        b=StsmIab+MQbvCKmKPe7/w4w8g/z9pUxNWTbmy5Jcr7p5tfzDsau0J/Ks3XPq7J3bwi
         t00R5gFm9k7gSp4v8kGBlSHRGhfP0c+LTR6OCun2qKOkDnssXsO3WwdRNGLwrxXm3sO5
         d/Js8Xngf0VrziqntGVocxA5vQDCX+K7r92jsZyyj1t8Do4ubl1npkPYkozCAJnEFHe/
         NwuLa8kPKKqDXbnGlpPGyCaIAq+/VGD6vVjB3uS2mUYrz61uD+ePEuaPXyGhu4FJDwtk
         8IeqF8GP4B2rEdCb0fBpvgccvL0iqoYZRtrnhXRudTl6Lru3V3UPBOo5lueuQtI5PJEY
         gCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699154; x=1763303954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xzsLq6x8zujM+mSWgjjGh8I+QpYkRNwwRETPEDP6/Q=;
        b=mHFQ4r3udvhm1I6GqDJr4k5i0MjZ5CdMarln1fKnlbbBU2XdjlIC8m+CVvzFe6UmhT
         8dZZEN9c1obVi+9WfUf+67PUz9Odv3eSX+vIp0iHd3NLNv/srowWSBoV4oiSL6/IjaBx
         a4TPZZL6P3nQwBe+cOO95QN96uLi+Xu0nXMPcdP56bq95BlqCxKvT8GBvzOut0yUG9ap
         jv+6D11NvqphNZDxxjXSwIjkz4ax86I+FnOYmXvjnE6E5Lc3Mu6C5W9lIIJpqysTW2/N
         ThtXAoHrbcIV/FyREBK4oC5/TmW9FCZgzH4Z9ZYkatJgHtO8kwXzNAqGRgu9w/otv9r1
         JkIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmn9+YWq0cifTL/JrA7B5RHNNUOzt1F+8DpiHzE0naucw+OJ5qRnM0Girdt3u2d1cICDi7mhU232G1mH5z@vger.kernel.org
X-Gm-Message-State: AOJu0YwVit2kmjE3a74yqmf6RhPaySz+dCMdqcUATvya01Dp45f0vD3Y
	qDYIrtFevk/Rla8ybg+TaA03wClLsrR3fiffEE5T+aDMlsZ0fM7My8807TW5lPI2kHsNdc7PCgG
	atcJt4EPmL9fI1y+sClZCSQOKW1x201l1L+FW6kMxUjGKU8883p85EwkWuU5jNXy3px+d
X-Gm-Gg: ASbGnctEXTeJs4iltfFiTKWfJsoCzon9Ktcn1Obu2Nr9yqEYrWe8a25T/Mf1xyaMPWl
	zfKzNOkWAZkeP06cgNXVbLSSeezuidOeyp4LboiRkssWrHi5fZx7KecOvNhwHmlmMiqT4/cNDQi
	R8Ju5ID8nNgQ3xnxIwzCzlnkATyu5RDa2Qm8awRXwJ7PczuHY0vm70yzzxN4UYDg/V3s67KiApg
	F4S92llAKV5dQkpMrMx6EvJgTvon0YzqPsbWtouGorh/FNBKTvkSGYSlUyKz8HV61MJVGREvkmC
	r2DI9DwPdt/FsYChnQeaf0E228/SpGkkUqz7VppNiwGuDKnu9oCcjDbR8mng0Rv+e8+WUlZK4Kg
	8dScw4zubt+VmxyQWOoGmrUqB2MGVa3J0Rus=
X-Received: by 2002:a17:903:244a:b0:295:59ef:809e with SMTP id d9443c01a7336-297e564e380mr69725335ad.24.1762699154340;
        Sun, 09 Nov 2025 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJIVsonHu4pNwPE+f7/331weZTNenlkh2Ar1ZXefNCwpSl91W0SITTJGiPOzgc2bETvAUx0w==
X-Received: by 2002:a17:903:244a:b0:295:59ef:809e with SMTP id d9443c01a7336-297e564e380mr69724875ad.24.1762699153810;
        Sun, 09 Nov 2025 06:39:13 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:13 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:21 +0530
Subject: [PATCH v17 08/12] arm64: dts: qcom: qcm6490-idp: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-8-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wPevfrKI7oCQBZ67FuK+Z4QMbgrqZ9zLXyhCmM5o3U8=;
 b=KRVfr1hd7m7qekk11hcXPHqyUxRtzdmozZcKhdaIrFvqaMzJOpK7PwGxYGG/pI/c4lZoafU+D
 C1C+I5ZDulcC10A5XnRAERkFZgYaryxMEbXGezaQxwhe1NO0r20BiqE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: PFweZCCG3lVq6b4tSsHo3jOGqqYtyeA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX08axqpV5px82
 +MxgL/w8aQ1L/n4Elg98+eyTZ7lZIYJEjq25knD09pVmTfpMfCUuxkpZ7QO6/RPQ1DgGWjdP9UM
 AlqI9wjcL2YdADig31EhA2IQaYkfLav8P1RFRNp3Ks4dFx0VY6Ssc83SwWtCo/0mp5AY2KoU9Fa
 CZj6TJucMGayQJjf10BOoLfhtaDtR47KGKJ5JNeQMWrCKLI1cwb/MJOSLJWNrdGbSfjgCus/I2N
 /CzCK2Efiq1nFny3/Lrq4rLS6eMLQOUAC61KxTaZw5FkwN3sFB1CnlYsTD1pU+7EcV2tCi8vp/l
 iBpKI6eqGDD3ToxQtNu+av9H+y/A1S76ZeoIgjfHhXrQH1HGbYrJLJv46souIBMOXG4PAWl5ddU
 5yvejyZ7Q7shBOi8RdTgTfJhXzCt9Q==
X-Authority-Analysis: v=2.4 cv=LaoxKzfi c=1 sm=1 tr=0 ts=6910a793 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w06kbW2hXDg5FjFnD0gA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PFweZCCG3lVq6b4tSsHo3jOGqqYtyeA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090129

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcm6490-idp as reboot-modes.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode. "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..84322b74917f3a70adce5a4182adfa5d787ab11c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3ef61af2ed8a87d03e82131fcd8848f0a1bc509c..5fe7a2220e1dec3b5cffdf151e09553d54e27960 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


