Return-Path: <linux-arm-msm+bounces-79890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B56C250AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EA164F4379
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC07534B185;
	Fri, 31 Oct 2025 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK9ezMbh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtBbq2/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D334AB1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914061; cv=none; b=k4FwwFfH629yo/RyXkb+bFhfwrE4ev6iMu6gC1yyOwjJCkJx21hR5Ia7DhcNyWHzKYb5AQeD6JHFadf1/Yp3gpzlLkcI6XfQ+3alNVQqS/S2gD2Mx9aGmJX0LaMfmytaV1EENgHIWwaC+HIcNoR36L7vWKUXwM12vffLqehQD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914061; c=relaxed/simple;
	bh=NR+u/ZJ6Rn1lUAwh58hNdYHt2exbdPvMhMjCvAy03bc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jDwW/7x6x9d2Nt9jCmdQRgxVf5kM8d8QYuAVxDbdWSagyC0oysCfWn4pWL7Iek0PuEITdncdaUmuLKSEm+B+j6JNXVMTR14R4ms6TdjKG4/4pm0YSe6atvxPck2hw0m/foVe83gsEVaegERR/ke7pWrTbE7qzOxEQ0tEKHBsFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK9ezMbh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtBbq2/K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VANPnN1513623
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xcYCpAv72+s
	x5mvCiKKluLtRci+vKelpR/tA9qHixdU=; b=mK9ezMbhjC9ZHRQI/X2cAc+OXIL
	U57CyaRyu/K8qNnWi+kUsgQcIGipmd9GJSa/o7LJa05jYG7b/2FaZlJtLkZlLHIM
	zUo6rCnJyUAWdfeWDBgT+JyOJf2uW4pSBps8CWkljyP35d5D7Zm3vJVOb0siBN4x
	8LRgVAvbIpE6DiV3G+6wZtYDUFikSN1BxjoqJRWps7JMtnVGUnVS9qvOxlQwS+Zg
	8/szuwvqTdzQHOp5Cy0NdGpIr5ouGSfCiJq04lZkPLzKgr/ZDTS01/xefw4dNsz5
	r4q8+vkXjgwqKQUh52H6z0Sut0dv+JHqgFU+poTwn4bYFhRmQHYBHkArH1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hnhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-783c3400b5dso1479740b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761914058; x=1762518858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcYCpAv72+sx5mvCiKKluLtRci+vKelpR/tA9qHixdU=;
        b=OtBbq2/KlUPVNUMLAUdv8gVZNLu3Q/47Gx3O9oXhD/cecB3unFdBVyzUC93eAszkMg
         IeKpEEn3M35H7EtGSvTikOVrAAWB4T/dSMBt6I9abTS7jSq0dceq241xdoBhLxGFrRPs
         CTC1HXiQtRYjhxcJezXoU1T4YzPvj821uHI8+i0F9X14+k9DrqHdgDDQ/2G0XFb01hOp
         XjA236oduz4B9WuI1Cvxu1F1LnhVqBm+YFaVUg5KSe+RL9p9bgBagHMjOOwGXisdzaIZ
         kpXoYODKrbmz4iu5TOMJvCf6NMHpKmjsutF8PhMUAUw0WtC6DhKMRMC5srgQMn3VoIhZ
         20nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914058; x=1762518858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcYCpAv72+sx5mvCiKKluLtRci+vKelpR/tA9qHixdU=;
        b=rqTGhyKF8S4AH+GvUtBDHmigt3zZ1QalbB5iBDC4ngk72T9bQMnIT7wsLtdy/Z4puj
         Gx1DtOWuV0fRBXImPVU3yoib27z7ss/rjy823YJvxzKroRrsT7Yn7CxXaDrw7PILysgV
         kPZMwNvyFMk5cJEh/oOqGKIbyE930o85hiqfG/NrzsmixpcSE7uSkI4X0Snb6WjypD8X
         54fBkIfw+OchbU466dHJ/5ULDoV3UFlBf2f+XcPInWtyfbp+IeQHuEP0N98UQmpVaMXZ
         ghvcrfBucFcH7PTIrVnUYs4RJcArGY7/S5e8xtJ+AE11R2i5RX+FZVU1ZonLkLvJXkae
         d19Q==
X-Gm-Message-State: AOJu0YweRNc4f8gdXX2u2xvgscOsgGUfYslI1SwXpZCuzp1qAGLZaOBW
	shfjOirFiy5T/yKqqFpLXI0MIWcZiSpIw+FKeaM6MNKogpaJAV5kVxXxNvpc6gmiBJBo6i9su65
	nNFlr6PzZYYISYBuuoyjiOZH5D7bvzWpfe1H3mWgAgDABQvgwKDPTvGVC4hKNdghfHiPp
X-Gm-Gg: ASbGncszyPESSxzfjHOhrxUkTXSMQC/6KAzGTUZGdGvXkvRqTMVyNRTruFf7Lli8sAU
	3Rq8RHhrMMpkVqoNnoi4yYVTgrXQdjTpdm0hyo1tja1VM5FAu4tsgYPuTHMARg01xdj1l2phlFu
	mSquYGSMWT2qUjdecWRDYrovHXhzWlOTHf4BnIXuH2t7zyxNdfn8clKOjDbPhRbFI7lcYNvaGor
	Ggql7lJZ+crybY0rjPwk09rL8Mkg5uVAErzMC+90BIrbcFFrfjAs7ZSxGu/if2sMXACoDG6tlSn
	YGIHmvVd+0s1a0i0GbA92bgfeatrTESZyTN3k7mMQzveVPFRl3PXPEjY6t+rR7L1O6biGLRRnlw
	RL6OvEPzezUEwoh+BaUBxaz8FwGI2m5fQQlQ8
X-Received: by 2002:a05:6a20:9189:b0:334:a124:4583 with SMTP id adf61e73a8af0-348cab829a8mr5100087637.26.1761914057770;
        Fri, 31 Oct 2025 05:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkEeYsjWqXGrQIsSrAvcHTdUX4vNYKplEL+CgKXc5YAFxjE+LZqVrETbo1+ALExr5m7cbeBQ==
X-Received: by 2002:a05:6a20:9189:b0:334:a124:4583 with SMTP id adf61e73a8af0-348cab829a8mr5100030637.26.1761914057122;
        Fri, 31 Oct 2025 05:34:17 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8982109sm2131277b3a.1.2025.10.31.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:34:16 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v10 3/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
Date: Fri, 31 Oct 2025 18:03:54 +0530
Message-Id: <20251031123354.542074-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
References: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ehgry6dYP0okqFxFCjtq7UilhCUb0TRc
X-Proofpoint-GUID: ehgry6dYP0okqFxFCjtq7UilhCUb0TRc
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=6904acca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JjTwLu2Kam44ScBvYj0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExMyBTYWx0ZWRfX5S8CPQxRY4w+
 yESfXCDbmn8YBIM4Y0Gyr8yw4k4aLJiwRBtTpN7s846mpWy22UnLb01QlZbnRQ33NnsKowXPdge
 mFe6+pJ+WelnmrHGJFuJbJTfQOo6qMxxnpR6iyph/28NTZutss/9zK2MNb3aq4qxsbSb06l4+Zg
 ub3p+rQ4+B0fdmsFVe2fykypWQWsmf5QOUJBuL+h8tER3eXR4ERLcHbQvdyB4+LOgbYYDOLYwNj
 u2ftSQGuw7eD4Diom4Z32szpxtCanWfqxvNdENuHSFbW2JTLsfesrqi1jULDAkfUwMPJaeJWFGU
 MfCSRC7DLyaFySYcNQyt8cvHmMktdrgMR49lvBHnuFFLuxaIrmfzeEeWGya1EEt4kh89TTmaZ1o
 Ip1GuyubZWbEjkl4DQ36T7LApnvw6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310113

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 QRD variant. Add the PMIC glink node with
connector to enable role switch support.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Konrad: Provided diff to flatten USB node on MTP]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..c545695751db 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -193,6 +193,51 @@ platform {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8750-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -1054,3 +1099,31 @@ &ufs_mem_hc {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
-- 
2.34.1


