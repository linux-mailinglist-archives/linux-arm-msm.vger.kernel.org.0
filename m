Return-Path: <linux-arm-msm+bounces-99858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDqNJzfLw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:47:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493793242B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA82C309C997
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABC53CF69D;
	Wed, 25 Mar 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJgV/Poj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyVnJ+si"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663043D3CF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438897; cv=none; b=skdkU2N//bZleoAlhvAdHeQmJgdAt5dJcDdn5JNAGWTt81+I6sRz1zQRsUHzhr+kivSXCG86AUtSszX9ySI4No4oycoWSaojKAlE7gj+roENEloGwEV+g0ljXgqqjI6AeP7c5wVNVFqRXPxLUDey8HvCzBR7NDmG8UBAq7/21hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438897; c=relaxed/simple;
	bh=RvDw1WkLEnEmhvLbM2Vw+wuFrP8QpNfDVUGmlhDKG+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfgeHbVm+WgAnZLCD8zNhFA80hsyqSZ5Vk2O0Pe9fugKQmJdcCmSnTR6z7iuM3KAJ/N1mRxu+KZYgOGaxh7O0iTwBDiyL2rQOz/k6xeIE4LZ33OM2bACqaDE5eJCwfXBRjq/NnC59P9Ez8OKIBfF+o8Gr8442PbEMhok712OWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJgV/Poj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyVnJ+si; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGQg04092205
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=; b=dJgV/PojUI9SMTpY
	QsHR17NMmBv+DQwuT6hKo9kJTV6g6nSvmGJqu+nExK6kc9boTuyRvDdUtdhowfDk
	3b7xqDk6LdYxlu9WT8GycNv64CKUGGTxJ8z5CdPARl1xVYaFbtgB6z+09qS23FH/
	lO+PowQTNyrwpTnhP/Xeyoso7/+S+Oq1QO8Z/W+J526HFK5Asas7MBurfAbM2AFU
	Ug1Gmz4gmlYbdT0saaE+w33bCWCA4bgx7VM5UwmwW3XqxYHcDgXgonhxrZZEzf86
	IG6m1ydkrJk4pizziDzJtXsutvuVDtbLyqzMK2SvpcF746fJ1cmtmkYPN/8Ywo/x
	Y7zfKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412y2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso65158225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438895; x=1775043695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=;
        b=NyVnJ+siBgw+isRNisTWyOJRw6VKDncAX1ZJaAANZm8CkkUWoaA8uag1L/KSnEbWig
         c+jgdWkh9sljlWXvaBZy1J+Mke+HVYZZdd8AoGwgLQCUnyY4vTF3kEVTeaH3LOVVQ2ZB
         vn0DdakkU7LVbOaz4D4XK8pjtV7SghcfVqpTDqzjL8jd9VAzqilbyN86DzZeIsR7DfdO
         aVN7sPayOehBh6xbnYFdErYUjY9Q5SB7PNvbktwrMV4Q4xuaenQdKjZieub8t9ENwX28
         TrMf+c8Jpqxz2xBVHBZbHWJ82b/+Q1KebySovjQAOhMNBzhb8b7c64m6EqAk7J1Wzg0g
         KV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438895; x=1775043695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=;
        b=ClW3FNS5YjWXubplFfMrRB0Mm4Pj6CaEFrd6JXsTDf80YR1AMLjNoBTQUWdfMP3zKC
         lI11pa2laK2K/XY2qnnhLGkgSdYmlCneRSVeDgp/ubfUXcMq/TLKOF5Y9NQj440JLNjW
         nuwYtPEhDTqcJBTNHzSIEJc75ZSJxpoztFB/qcXIevqq8KQpheAZVhtZ39vzWsYBLW7Z
         1HYUMGO1QqpeLqzzo152KnRi+kkdEj+MXImoJ5nz8DmJXwfXxZvSC1kLkC6WIsjfazds
         8XKpYH12XMqc1Nt6jgd0bcMneGQb5kzJR/GpdPcOzY8aomd5/40qIGImBMI4B9wLuyDe
         VKyQ==
X-Gm-Message-State: AOJu0Yx02l+MW2kQAn31eP3QTvAUfl168/bYM0/J2J+8LcIsMrDNKyE1
	ptDI3iy3g3+dxVV23pnRdlt4+Nq7HTVsJCa+JLLKTCdM8AhlYUvAJae8+oZ5lKwdM997F7RgxwW
	iCP3SS9zsUKBBTVEgtD9hrZelihfus2g0fKrK8EzbI8hCwNs4FkTvI+onMVjZrWGMOIHV
X-Gm-Gg: ATEYQzzySKXQKvHF/+1HzciLEAYOyaNKN5LSkZQ8T4eKP25nGZ1PWbRS8VH9iodNEb3
	3Kg5L3FP+GRCO1H8M5FlV7/Gv+qQDKu2f8GKQEz/ZIjJXDcfZCX9XKGRf8vFg8UFqdSltSNbKCe
	3b0Fz6/bwB65nqoIXwhRgNYymI18GKOPBsXQ/tAkaj8VRrsYHa3hkNcp9PHnOZ/Evhh01PTnIqq
	kseiU8GL9+hWEf69YOvJsNQZqIV43k2/BhBj7/rrnYb6U7ONMMdCN/q4TyXjmxTPrzw98Q8fPaE
	0e+efRXuq5s8yofUpPktVoXI4fGijC1oHk6VDCOeKQy1FtrQvjyz5g/m6m8zkCiTvQhQ4Uj1iHN
	R76Woh1L0/GNhlimDf2/qBMEoIiBRvq51nSEREvmddceXtoeSzF2CWujgE9eyBcvdxnNlOKjsGP
	3srcVStegPhWvhEGj6c6K+kcx8w+y96WJLrA==
X-Received: by 2002:a17:903:2a90:b0:2b0:58a8:5fc0 with SMTP id d9443c01a7336-2b0b0b236b5mr34948635ad.44.1774438895029;
        Wed, 25 Mar 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a17:903:2a90:b0:2b0:58a8:5fc0 with SMTP id d9443c01a7336-2b0b0b236b5mr34948195ad.44.1774438894447;
        Wed, 25 Mar 2026 04:41:34 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:34 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:55 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1511;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=IdPH1Imvkn25efPE2wUno8oRCpw1N9VjuYi71HEmcTY=;
 b=KYgr0Mxa3JiFHajJjIIY/l+uMwSuRIG1RNhjMhDApPHJppBLiBhQ/uYGUUyj864mqoKzaLeaf
 busP5MEU4aeB0sXot4UkRm65nRWltUIeuRPQEzoPx1QVqvaqKapOH57
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3c9ef cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2RbOU0S3Xm0Tm2J9ahGK-K_pW1IGDM8m
X-Proofpoint-ORIG-GUID: 2RbOU0S3Xm0Tm2J9ahGK-K_pW1IGDM8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfXy2TD5X0J7KKt
 X/aP72kM4HwW5RBE+DGJ8v/Bs9ndD9ycthziUq9P8aQIHoSVde1IJg+mEbbQDn7MffK7cfUSIW/
 +kGhQnm/v7wMCmbZZ4CXx9XXIHKiborCSU8DGjKvsBr9eORKkDtAcNUsVQC9d5orltyPjku7Xw7
 dzBISEmb50ATp4HU9JrunWSZ52/Re6iI9ek8DwqbZjtbCIm8Y6rTW3UHdKTAI/+p17aAkd4RyKB
 G4IfAxuadIkuflOveA5F3D1H+vRn3doBLABg1G0X3zgbtjxFv1syzkhAlt3qkvyTDdjHrIaa4t5
 l6o2FS4kDcY4ChezGnHMlIJ767pRMK6ZldQHJd+9Xd+XoixeIerOtmm+AQprH/ZKCK6SQmScn2n
 7wSo6rkuiEmzpXny+DRIpOqqeNFC4HBQCXunuqNihrBvuTwVYFdhLMZrXuuu8dDD+SGEC2jRGY5
 gGZY4y0ak+M+kM+o82g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99858-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,0.0.0.76:email,4f:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 493793242B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


