Return-Path: <linux-arm-msm+bounces-74965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886FB9DB16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB7C2E34B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745152F9DB3;
	Thu, 25 Sep 2025 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvHMdkqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EED2F9D99
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782054; cv=none; b=Qykq8utaCydwrV10mo94DSPOCMHwPBMthrjxunqWtlgP+yJMpA3DgPPNorRkN1RIjCrWYm1xvSH/y2HYq9xUGu6xVrtZGmWkOT920Mk/tWWVem8w21Hpw3IO3rQqWwNG7cmD4d9QuaUMEWg37GMbtusqllPonBeEtrzhPeYnmrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782054; c=relaxed/simple;
	bh=9LsryighRnETN2UrxBpydd19TKIhUoH8J1E8OIf9RY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuzkYKPHJO/KeGfriHmVOo7rK8tSMpgZsgal6AqjXGt7NY0/92mQT9Cs8M5tEF0WioP0bKlhkt3LnU4NOO8AdC44No8PODDJuCQVp62mnjnCiUG+Sh49PFRmwbldKaqMW3jCVjPdAv1PWUHX6SkFxtrHqoPq+wBNa6yuSdy4jBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvHMdkqe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oZ5q017456
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VV4MOx0mlwBQzDc46rG9zmLxghWZvJp0NqZlDVgFSZw=; b=VvHMdkqenrNzFQvj
	xx9TOwCF5/NmO41ZjZIC8E6crq06WmNPiUEUQCL5sumNB9V2Uej3fr6/9ChJKbgT
	TO7R87b6idhP0IQHDOmzp2aXICWIJ+4RrX50krELIbxPhCnO9i23KI8iQx17FVKe
	dDXeJgOKJ1kh6s6v9KRdIh6NEgCv3WiDrhDqaLWdIUie5mluOSJeBWiQx6xK1Gw9
	iKTdnK+MnGQ5/BTW8A/XklbwUK1SzBTKw0xWrD1GMYVEQSGX5DF+u0wSEvbuAhSj
	DoyNYFsbhzasqRDX7DnglG4UaBOFhl10M59s70+03uuHpZeGrOQ1zxG0YMHx5ZdD
	4p3How==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0c8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27356178876so4817045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782051; x=1759386851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VV4MOx0mlwBQzDc46rG9zmLxghWZvJp0NqZlDVgFSZw=;
        b=ORto8tcbrhPqFWJDShOvo9NNMj3EZYrdKdyDOim9SjSQb9AU5IQacv2gGC2vXFXTZQ
         0aG+AFXwGwJLVb4+iVbPus6/EpQ1idVs9ctVB7Km/b+AOJhPcQA2X90WaEAjet7YktrZ
         jKPOJJTf1t/agEw7B2aUGByGm/833/F13GI8eGojiKdT3PCEs3hbMNv5aGI8qd+ljzbR
         SVzwnbmd2HnQTfL1/cbcrjO1KIrheiZ7XayWAGusGsEPTTbUp2v2V5H4NpEYIejPYfIf
         T/hs6LbIg5zLjFMfcmQ8aeluiSkBi0vrfkWGRI4WAmvJytFukqnUySRXtVo+jbHK8add
         UIsQ==
X-Gm-Message-State: AOJu0YxvPGgfGi60K+rd+R61BOif2maaucCiNRUYig5Snh39HEYyYmjD
	alKcUrrP8XTw/vjXrHtN/44afl9HFtBimdLlBRCmGuqJH1bfQ0tNY/fg+iuZNbzg0taJWkjS6Mg
	dGrIEaKPI0d7jB36Quv7GY2X2TjqE5rdsqM5eKNAMkj+q579MhkgLMgkv4L4ReVMJ2fgZ
X-Gm-Gg: ASbGncuO2tYu5UJU3nkvuqfjnfzfVFgSiZBhB/X30FqIQzz8Y151vr1y4lzb0OvWPua
	gSQ0sBrf/Ikhkc13FP62BaBXAmE9+5Tg3z/i7FrAod/2pGrG5yqPb9MyJTHE3+zl6ciuzYzQqcE
	lhca49KBce4V7kLPwlBY5pjhmJqRysJSMxlMlG8VVCEzakCMaJBepXjqbzFHr81FFBlHJDoGYfk
	L79KnyB+5ou7AvnFll4j7EJ/FBxipqR4v7s5LHb8QcmITY7iP0oSbefF9josq7Ae+86G63Qki2w
	lww2Ix4HbuD3fwKNJuk0EB4JR8WadbmptjX6eCaiVsrbABIxyR2pVzif6KpA8dWVBb0Ge97VL2l
	yqycQGmp69zfnrmJYe0ytOqN4cb+fEl096IuNdcPXNbBii9s6N9N/SrbmjngX
X-Received: by 2002:a17:902:dac3:b0:270:4aa8:2dcc with SMTP id d9443c01a7336-27ed4a3ed57mr25624555ad.19.1758782051501;
        Wed, 24 Sep 2025 23:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJUiF4F4KkDXo1Pmvtp39GmsKOAbmAczyTA0KI5W08guSAu7F2TO5lr2LK875eUONWFtTrQ==
X-Received: by 2002:a17:902:dac3:b0:270:4aa8:2dcc with SMTP id d9443c01a7336-27ed4a3ed57mr25624305ad.19.1758782050996;
        Wed, 24 Sep 2025 23:34:10 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:10 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:24 +0530
Subject: [PATCH 16/24] arm64: boot: dts: glymur-crd: Add Volume down/up
 keys support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-16-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ZH3ZEz_F2m6ECFYUvUpnaV2anIExlnYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXwpFNmj8VVTGW
 YBtjf0UlLpEb+qCc95yGBgNpYCnKz8T6QS0cOlyDNjBpntIJTsPzYOEZdQjdQzketUdX6uDI+wP
 istK8KUMysFgkpk9yLMCtXISd87ukbCZgdA7q2e8NLVlnZ393jbLxTuYCX0KmONjnuU6gUSy8Ma
 znu/O0XVqiIoPyh1fIiUw97mRFK69ygXkBrNPK0alukcIfmAVj4Ha+uBK1kq0RheXp80s61WC+P
 3HMqCIAmbwqY8RPWTi1YfAj9rX+SMOAsfMq/3qNpek32UPNvpJ4at2jSUYocC+bF1N1jRXHbhQ0
 JRLVFEXQQ1s25Tfsl6VWj14BcJjaRM7JhjJ+I+TLD9lAKwgEKV4e818Xhhhp9TnZ32JJHN3B4EX
 S2qXSKax
X-Proofpoint-GUID: ZH3ZEz_F2m6ECFYUvUpnaV2anIExlnYi
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e264 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eOB7tIhUYvXyc_ElL44A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add Volume Down/Up keys for Glymur CRD.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 97f6eedd7222368f5cbfdd02e9c4d87261d7f19a..d6003ae515e37049fdf17d6b604b974dc8e9fbbc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -63,12 +63,42 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
 };
 
 &tlmm {
 	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
 };
 
+&pmh0101_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &apps_rsc {
 
 	vph_pwr: vph-pwr-regulator {

-- 
2.34.1


