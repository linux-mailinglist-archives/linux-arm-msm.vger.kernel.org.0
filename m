Return-Path: <linux-arm-msm+bounces-88835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B41D1A55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53B0D300CEEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0AF3101C5;
	Tue, 13 Jan 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5ZCgaIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb1SL0ya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CCD3C17
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322378; cv=none; b=JRPfzYd0XDfrGDeNchBhybKnhfUg9gcceci5Dy0u+cmWlrPtoM811id5g8j/XjelhqydQ1pUsS1cv3AxHYRdDMf3IzYF49W8Myt8na9C3XJXUkRQKJpFRUev1mZZyGdR8l5VlrQYtoiuKTg5OkQndDkdvtidiXuZG1FiAVY0St4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322378; c=relaxed/simple;
	bh=Hb6Og6xXJJ2OlnU+hg0AXc8Xss6+0Mj0oNwh4Er1AWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FsPAEurMGZMA1m3vJ6feFGZf51lgldSPi+SHxnkT72iHE0STyZZf/xT3kCvgwjSHTjcfhl8ipdymD+meKokWZUiEy+6og1ImhlrHb5QXbVb6Jqduy1e3EpDK4zc2J8kvdDFx+UDjczZPpsp8mAP+g29BJ2dbbdIp5mB97p+oMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5ZCgaIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb1SL0ya; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC6eEB2865817
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FNg3uz7IZ6kkY04yZJe4ti
	LTrzESWpojlhR8mWqbOtk=; b=J5ZCgaIWURJJZCaGdqGEGhrbGQ9pEX5WetuOqg
	mfr46i5L4yGMXC1OKG7FYFiZ6Qo+NuEZvEmRCh7112b6MyJeiX0YGFE2yZJ+EhHp
	0cxWfH2G2+IBlfkBSdq59q4fvlsRsWb7SHfEmtz9LY6UCaJysoMChwN0EE76j8Ay
	y11JaMi9s67Nvgth8yv+RlpxnRaIXkVhMOgYS9zddaSFa+9VFNvb3InKGGvReH9w
	Sjth37wkYaxNVQwUTiQE5f/kD0GI+OGPSGP2aMeWHxJLCdmhE3Jf9cDmn8GgTU1p
	nGrZXZYCYbeA4kQcTCF+jhvPqbqpKAAz4n0Gz7GIkn0xVr+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha7t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:39:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fa6f808cso2322899985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768322375; x=1768927175; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNg3uz7IZ6kkY04yZJe4tiLTrzESWpojlhR8mWqbOtk=;
        b=Wb1SL0yaqjz8t9+0meQDOezfI1fTrDdgGtf2l57Y50X1NbUzm1VasZKrFUs3UYDAwk
         442l+7euykXX9JI5gk16vgREO9iYUTHR1+1P/coVeo50Sz7J/k6bqvepkv9UJE9M5TAk
         V70OOUoSD1qT1PgfWg1srAc66ilouoyxOcf5+y517wZDRGrSEmKOiFxNbtjIhfqzfzNG
         VQu9sVXY4QpqX1BQMrR3ivdBWcVVCpdDVto5YHMByhwrBzEjlTj3rSEgavZFoAofbXqA
         fBLV4Gi5Ei9dVdJ/V2lsW8j5ks2RFG8XO8FE6DDT/bhO1T62rk4CoNnMZ4e5xvVJZ0lX
         r8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322375; x=1768927175;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNg3uz7IZ6kkY04yZJe4tiLTrzESWpojlhR8mWqbOtk=;
        b=oGRCquD0dwKIslkr6aigzp4KI6lHlA1irW5jdypMnbwXjmhGQLFc6i9NgxkPa9JZjD
         yyrXl9M1X/pcV0wjuSt/FGsxTD+XoQy8y5fAH/NCTJhAQHOhdGZZfJbSoudWum1yWW3V
         4ETJ5cJ5j9ASF7G7Tbiea8r1BO249a//xPo95eaa8e3BQeWC4szuky0c5lGXKDIVErXH
         i0xcL8SPkg7j7lxywY1KNEgt2TQVJ6TsEfLVrVit5EDVHdWvxHweTlQLU4n7Eck2qCFd
         Y3dgY9c23Coef5zFZaqqBflK7930N853mSce+GMwAuSxK8mjDI+x5Czryqd6OBSx8os1
         tivA==
X-Gm-Message-State: AOJu0Yz0ecatVAMht42Tvx61tDPxFr2zMwuJtyUbuY5Glo8NvTzLk40o
	DukvhooKH1b90CG5IEtqZQatFmbgnFmAhmHniuESElDI20DiIOd0W3UAy4g9oFjDbH4D3GVynCo
	RoMKXIpimDXokc/56eCDdGXUGCMtKp2YxAlU92KBrwruNFhSvZvcqHlQmtRYKImckbX0so0KW+b
	JA
X-Gm-Gg: AY/fxX7lUeFEKptIFeieJKvNtd2/h7Ny214DWLIRLaCSUkZl1DtqOT2QYXMG+QGVOxy
	WcIZO6A44VsOuJPpy5OSBpaUt+hPPh5ZXTaq2w/l81K6JEhPfKuR2FbqiymMO/+gMpuo0hnXZeD
	FrLB8Q5XpAkdqHAQilKqefuQGEheKQAuu26F+tQMlyEzIkOa+XORWHErzUdLYXM1vsOsf3CKDjp
	N2JzqoSEYyknRGUECa2lQGOQIZjV/x+OqOOfDW9o0jLAPMrIum53amYaXH5Fs8F5mlGTpM4U+Zo
	N6PNAVWNBRSA7IQv81QDCeshKO6UvN9fpNvGZo5ERvOoABXbXGSGNTBpcKkFPiWI+rKZ50+rNxN
	ck2N6FjAwtHY0Vy4ld1TrM3RHxrTE7cgkMtXt27Cd4vywebSsUHeVM04mGUH5WZVZY9dZA+sa+D
	zEjHGvsBCQSFROO1XKeWzaSNY=
X-Received: by 2002:a05:620a:4493:b0:8c2:228e:78eb with SMTP id af79cd13be357-8c389368b81mr3354421185a.7.1768322374707;
        Tue, 13 Jan 2026 08:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUtRq+Y2gECtoAYtXxWvidMka+3b7Bm+Yt2rBK5+ICtGhPN11kgsg70TbEETlXVu6W01QW1g==
X-Received: by 2002:a05:620a:4493:b0:8c2:228e:78eb with SMTP id af79cd13be357-8c389368b81mr3354416685a.7.1768322374246;
        Tue, 13 Jan 2026 08:39:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fb295f5csm38560801fa.49.2026.01.13.08.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:39:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:39:32 +0200
Subject: [PATCH] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEN1ZmkC/x3MQQqAIBBA0avIrBNylBZdJVqMNtpsKlQikO6et
 HyL/xsUzsIFZtUg8y1FzqPDDArCTkdiLVs34IjTaIzVlKhW0ZFKzVfQbCM7z4TeIfToyhzl+Yf
 L+r4f3BytB2AAAAA=
X-Change-ID: 20260113-agatti-fastrpc-e3fe4bea2b42
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hb6Og6xXJJ2OlnU+hg0AXc8Xss6+0Mj0oNwh4Er1AWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnVFg6ora4I4sr4L2UU46WpIYweDVR81Cyisw
 ZbZ+UdAeaOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ1RQAKCRCLPIo+Aiko
 1TIJCACiwMkkYRSNR3iQ/e5TghOXQkz42rjN8x1NiCPxm6ygomHK19bAcPd0S8RpLgyWInyboFo
 OM9x3EH9yFUTk9ljIvFJQEoIxNEVO2H1P6UNxcVnHFSc2lQ+kTLJ3MEmVqvdanfFfKqrkU2yHr6
 QC/u3gOKwn8x30E61J3ezsFsKn/7WWmbjUDgK+V8Am90AwePKfbUOpqvxneVKdwFj2PnD1DYWnr
 hkI+1Q6d2DY8jrcgwx7p55Mki6mpHfjbWYGqhwOty/zdKuxgpOL4seVRrKV3+0L1ZAGrG4GwKj9
 6mLjHbMrjepLNLGJ74zNuAhN/jwqB2bp4hsRJKIgntJRFppd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzOCBTYWx0ZWRfX5NvtSNx34jC1
 q+HqRK3LwdDI1XfcNpv9EW27uVbJnCW+kOSI1WIjy8IZckO8GrDGqHHjiHDEZnZHLLTrP6xekpu
 i2DndD/9O5Re+xsPK7hWvQKwiJTXDlGLiQnEjINpluDrm79yWrDFAxl9NKvbWhRQ1jwZ5gS7nIp
 BxGF5j8GmB02IUPsLRrBHPSxVEsiF/rahfPRwAZT+GsE+hSlpQdCwswkl5QUAwPkRPlnG0fGgAt
 ug7MKeq8D5E0YSIkVJ1m4YSS5F5CfK6TFUu9cazqBuMlIIX8gkCJSHHox+/882AWQ568WgqGtLs
 T0a3DU+589cTk7q0pXiok8QOhIFxXzJrhVR0n8ys6hx7Ax2nEym9qS2BD28PF8vvJtp72/pTMKU
 5el51lgwcZE89Zp9/4cnvV7mavd8i5oUJnDdwQcniw7K/6dCVkjHJk+78AlCOoSGIqvqmxAhloS
 brg42TR/l2io4qVdIxQ==
X-Proofpoint-GUID: tqToJC0jLhWqDpETLHFd-LRCfFeynSYT
X-Proofpoint-ORIG-GUID: tqToJC0jLhWqDpETLHFd-LRCfFeynSYT
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69667548 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qnRtB28rPDfBZ8ych9EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130138

On Agatti platform the ADSP provides FastRPC support. Add corresponding
device node, in order to be able to utilize the DSP offload from the
Linux side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 7815ece261ea..71f8a0972b0a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2287,6 +2287,35 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1c3 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1c4 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1c5 0x0>;
+					};
+				};
 			};
 		};
 

---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260113-agatti-fastrpc-e3fe4bea2b42

Best regards,
-- 
With best wishes
Dmitry


