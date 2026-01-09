Return-Path: <linux-arm-msm+bounces-88305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EFD0AFC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 429D830387AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2CF30F7FA;
	Fri,  9 Jan 2026 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr6Ompob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0jz5Zs1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF726ED41
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972633; cv=none; b=rsrztuCAD19AzNrQvAOkf9Ld0mkrpYC3no+Sfi+PHbb2RufRM4BhbymQ9T7ywV+aCX1JfSWJLYfm7pPHOVE7MRcCDpiQS+WU/YRZRpCqKx0nk4RoqZJw+h2zBP+u3j+TC65YeOKz7eO93ZLpDeHp1TlZuUelmimettU/XflUKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972633; c=relaxed/simple;
	bh=ioZRh55wDkscBeqn4+hW9QrcAQVQvNg04kbdteev5pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OZmYajQN1ZxFzdqio0JditmXSp0tjmRAngK5heMKUTgw8gD+AMLLnGrCb+y0ZYtb6OrMTGrMUzt7jlfPIZmqmmSIXC6Iu/RGToarTpsJQ8a1lXY8PYqsbQ7FG60SaIBJiefIeOlh29rT8DXLL5liA5QCjXUlbO0YAwhO4W/fRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr6Ompob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0jz5Zs1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2odY1062645
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jb0Km8R9NCZ2RRCM4RJbRN
	8XpEXZjPdNv9OaTTgvMyo=; b=Rr6Ompobv3nFtywUd2XPb5n6W+D6QeF4fHKs4R
	7zPGD6q8OyNiTOSxXvIWqpg6aj5b1gfsI5auzeZjvb51DvZfvuJP06EnVPI+pDD7
	zksVvgdAi//fWws3PwizynMx8dHYXofu7AbCu9//n2MPL26yWgQpxQMiGIUGj/0K
	12TOWIXb3UtF8DDNdN80U6z2VmdwOPe7bcPtTx1LHnFzFgKue5xayTv9DUHt+9W7
	wzo8C70XLMB8Km50cGlPLAwPMxjTG0BD6o3Z2+7NL6jaD+lnkr7FILNSWFtv+OB8
	c/9Nm5VFuxudHYkqUZGKEzTLGf2scTSoAmbrRXynu7A+Jnng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f68psh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:30:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bbe16e0a34so941762585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972630; x=1768577430; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb0Km8R9NCZ2RRCM4RJbRN8XpEXZjPdNv9OaTTgvMyo=;
        b=I0jz5Zs1FyQJTZteW+CuG1kqf1WSziusp5AclBABCgLYBsSxdUJjD+EJ2U9xHQfwtC
         +KrThIPOCmZTgExQHv1qtfZhXOF1cE3PHodCNBbtOYbXnEYZZxp0Nnb7QJ53PGLCjzYl
         +Wv7KWdCxiJhAQjOkrLh+zF5HlLuCTX0bH4kEh5ymYkTrizlyU8Zn/hhR+1SkHg/z8IJ
         OK+J2aSTPaY9QurQpD30Od3FtFYKW3qe2FDu83U+03TVwH8G0XkGQVGBq549myplFaW9
         Xpm1b3SWAW24AYRVeQQ0NNBRHqRFgpJQAOPjhQVdz2jp1jsyK1tP3jObBIAZk2bvKq47
         KWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972630; x=1768577430;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb0Km8R9NCZ2RRCM4RJbRN8XpEXZjPdNv9OaTTgvMyo=;
        b=rmGDjtPfLvwMBhm8no7SZaht36nnPYrAkThJ9pfiuRkGLTvWVi55HX0Gy/tVGPPk7E
         llR8WnzVZQqpDvAR02F96R/8PDYn8PqUdPpVT2RnqWf9ac7bI+eCNh9DHMRTlmSguqZ7
         82ywKE5kR9ObluKqrnHaiz2w12dI/MqzOc69qkteQy9vUCEJp1+Nyx9ttPIejPuhJhCE
         F/iImIWmGmgzcqrZLWB0+ZzflHOd+K9DLL7HpTPk5j5HN+icZYTq7tfuF9d90DMQyZy0
         BqGIRfyEAAVdYwlN6w9Qhfhe5Q/axPg82koSo6ZDd17V0KDdVRtEqOrPDncjle9eY7Ue
         z4PA==
X-Gm-Message-State: AOJu0YxI62Ygl83v0nD5vla6D3A3iqNDqXsMqGbpePmjvWzrjdLkvUwb
	y3+2BbVNVgRgHDsj0H47m9TsR/rHIl4STTBhxEry+kyJ86HRCruZ/L9e9xGF99pY8/Q8OxCuTQx
	xoe2h8ELq0faRJCpyI5Y1iDihz/n/yy3+cOzsrBw1eF6KF13nsftAZL8e+C7eK4i5bG+L
X-Gm-Gg: AY/fxX6hKYy+aCj+h2Dy6UVwaB+aMOcAGPr64FTkFxUp3/frnNzCm8PTwmZbQCIMVP0
	CM0dkU3Oj39IKjsthi0a3FWGERKQHNaiWSqpMpXwzFRX3h8oaSIbq3nmDG/AzE4UKzziESLQkH5
	7CSRgQjpPwVez+iUmDgXkFyto3CI9k2QugS3aqJs0m+MhShiSlhGjw1+WiJ4S8b7opc9pLMvK2u
	WHAuPfkwqm9wU1IC5KOdu/LCigVuk4gyzakijgmblLEkWIHGx4me+6mrmJaSopXLzn5vbUGu2tU
	Y3IvUEKmj1bAXhwniIgC92IQIm4aF7slVYkNaGmX9h9UBPBLimTx1pfb3METeogYWQ0j19wGria
	bFfHsz4usSgAn5fdG0kyAixrI3+jtBNknez3WQ6Gyt+j0YNxfGNf39TaCv9k7WaxeBekv81b8EN
	PexlDAfsyN1dqRPpxPMLhDhfU=
X-Received: by 2002:a05:620a:4105:b0:828:faae:b444 with SMTP id af79cd13be357-8c37f51e9b5mr1627700985a.20.1767972629468;
        Fri, 09 Jan 2026 07:30:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhUcXtb5gx9nSmRvRPsE+L2k83bqDKrMSjq5pjK8Cji35aBixEApOc4Yl/W1K4r80x5Pn3vQ==
X-Received: by 2002:a05:620a:4105:b0:828:faae:b444 with SMTP id af79cd13be357-8c37f51e9b5mr1627693785a.20.1767972628864;
        Fri, 09 Jan 2026 07:30:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb922e32sm23918221fa.47.2026.01.09.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:30:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:30:24 +0200
Subject: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: power on onboard
 uPD720201 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-rb3gen2-upd720201-v1-1-50d9b22dbc2a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA8fYWkC/x2MQQqAIBAAvxJ7TlgVUroGPaBrdCjdbC8WShFEf
 086zsDMA5kSU4a2eiDRxZn3WEDWFbhtjoEE+8KgUDUo0Yq06EBRifPwpkiUws7OSYdWG2OhdEe
 ile//OcLQdzC97wf+lFZAaAAAAA==
X-Change-ID: 20260108-rb3gen2-upd720201-8acc1c083778
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ioZRh55wDkscBeqn4+hW9QrcAQVQvNg04kbdteev5pM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aivFCR1W8BDv4sm7yUrRVdzzvrK9lyTxddDpVxYHwyJ
 6y8K6ST0ZiFgZGLQVZMkcWnoGVqzKbksA87ptbDDGJlApnCwMUpABOJV+VgWO6ntFM+SkDa4ry/
 hYad6aYPv/5deej9MNcw6vLa/U11y/teeoXLMVZpHJjs9jSno8ci7MCkF9objE8baOonp/mrKap
 tvWP+L6Wmwkxv4k+PjfVpwqxhpu6PNKe0n7OtcP8e47N6uc7i/1fv+4lrylwVPfbCa9MP2/mHQj
 fMOOvqHvejRO3IxjA/DpOn07wYnx30UnZdrbUv+210nrDh56C+5pAuflte7cn1Bpf65MyEvn6e1
 9rwco90xy6uWB4+i/WLAwSfqM1f0yB78TbTSpFNLWuzV95f9aZh8YMo3Rs7J+xLc5TQYC5hXJBb
 Pt3m0z/2uYeUbpbP/XHigGjhA5N42f2l31kfMK11t00EAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=69611f17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9NoVGIZdV82FU8rnK1oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNiBTYWx0ZWRfX76GY1gLRmelG
 eSY/GtAdRp0LYipgo97Cr59hDSPxc5gL1BL71H0f2WttDUvw6ZAjHwOgp8Mep0Cm7CrFoCnvEhY
 oXkjaQaiTXcAZuDHLj0i8GTyxrkGdfTngr6XmeLdIYmfWcQxDB0/FOOJBODaNBI16X5zoisFprB
 8d4FQJs/EIYifBJUkkZU3l0kfClrAMZlP85G5MVTtVluQw7yL43tSeUJxEV8zcXsVeFJ7dnbu4j
 cEOrCT+noErWteW1i+sb13DS4Hg1+PHe/OymuSeHPZLrko3G8LieGGghnh3Vp1ZEqjkOtDDuiB5
 N0tdHdyaygek0kY+ptiYWW6VtLKfSCOPb/vnKLR76t9KOtJNQvTnQuEo/FtZ2a0SA9M75VtYkVH
 IjQ+V3TL8V9Lt6jRtlmQB97mTYXdfVbZMZTlRplLGcaJq1uBfobCHQSM8rYpSV1Xwo353NWLhnC
 O3tvuANsLXRD6UG8H/A==
X-Proofpoint-GUID: R0FU2D7i5M7k1j_CLprKWqmdit5tg1cC
X-Proofpoint-ORIG-GUID: R0FU2D7i5M7k1j_CLprKWqmdit5tg1cC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090116

One of ports of the TC9563 bridge is connected to the PCIe Renesas host
controller. Specify the voltage regulator, powering on the USB host
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note, with these changes I can't get the onboard hub / ASIX controller
to work. Most likely those need to be powered on separately, but my
quick attempts to do it failed up to now.
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..ddb5a381b724 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -217,6 +217,17 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	vreg_pcie0_3v3: regulator-pcie0-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE0-3V3";
+		gpio = <&pm7250b_gpios 1 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		pinctrl-0 = <&pcie0_3v3_en>;
+		pinctrl-names = "default";
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -807,6 +818,8 @@ &pcie1 {
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
+	vddpe-3v3-supply = <&vreg_pcie0_3v3>;
+
 	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
 		    <0x100 &apps_smmu 0x1c81 0x1>,
 		    <0x208 &apps_smmu 0x1c84 0x1>,
@@ -1378,6 +1391,16 @@ &edp_hot_plug_det {
 };
 
 &pm7250b_gpios {
+	pcie0_3v3_en: pcie0-3v3-en-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio2";
 		function = "normal";

---
base-commit: b74f0330d6283319451a0ef818ef50bf2805d875
change-id: 20260108-rb3gen2-upd720201-8acc1c083778

Best regards,
-- 
With best wishes
Dmitry


