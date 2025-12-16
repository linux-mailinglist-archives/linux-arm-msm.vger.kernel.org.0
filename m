Return-Path: <linux-arm-msm+bounces-85396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5310CC46E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6F0B3090F2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7C53195F0;
	Tue, 16 Dec 2025 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEXK9L4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUOJQSQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B2531A7E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903696; cv=none; b=J4w6vDgipwAVq9SVA0ZP0uYWB+Owfv9UALT3xpOa8mBPjduatncwXPD7BJuV88K3V0iKruNXOTbfQXoB7SmBWUI8RJh+P1z06O132lxdMKraV7HanmhpHpe27muELiS6Mx6pxN53E1Vc3v93RNdrjuYd1HPMdEmaV6H50wc9tOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903696; c=relaxed/simple;
	bh=uwF5fbHZBzTPcXbfe7qubLy96cgnnK7cfCCGlS5UQpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qo1Jq3LP5ShmnRkqMBNneAXTsITuZ/gmnowcnZatM8RBoei21HpQPxV5v09l5RVo+Uj6tEHP1uu5+DCgYvle5XSRE8lzaicpj3HQLETCg2sYMxb/bSPPbRnubtUhVgjPUZ/tSIw8jYsXbHqhtFSBnivRO+zu1YAzJFEuQubTDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEXK9L4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUOJQSQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGGLHMc018800
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JBas8DcetDChn/tC3EMj4Nw+gt1h+tsQq9O7JhRo1bA=; b=AEXK9L4RGJgtyMAh
	K8fm6o4Jt7Z84DoO9W/9BD5n0xOqkrLXidx4ufSWZvtR6Zblk0yCRyuZfy5/xhMX
	vVCqJiNzhfj4jb9UXz0I+B7tbdwpjwQffmtsLgp1Qi7Wh592woey3pR8vt7to0Tt
	SQiq6sK+GJ5kEK05+yOybBfhTCpSkhJZBbk+R+nF3XY51D9OsHYMp63Di6sp4V2C
	OSzbhBmVkFGPJi6HmUH9UjizSpGZo1e5lnc9cVHRjHJFqQ6yeSPn6f2UoqqEQmTp
	4tVo35GBZYNB9TuXxQ/cOkO5D8KfExI8c5R/AcRFstYhsX9EFaieQ8lvWLIjdtPA
	CtMG8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b366q99tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b4f267ba01so1131651385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765903693; x=1766508493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JBas8DcetDChn/tC3EMj4Nw+gt1h+tsQq9O7JhRo1bA=;
        b=MUOJQSQH2jrRmPft8kp8bydvirrYX9X9gzacGK1Rxq9w8y2WHweRG+q9dHWPYPjebZ
         UVWw3w0YjkJV7uTAI0DEV/Zk50mQEM0PCFq+P+MJMG8hLaLRKXHDAL/UBsQ7RMO9oe+d
         vvKhs4HYw7Ii59ltOTv/hnAXleA6SQnu1/tWbjacjViUeqkMtVGE1TYFHJJRCKxQZDk0
         jQk1/6SZEapDLsyIxjJKbyVqZdnJPIzokXK1j8wFB9oew0nx4wSAbhl0qTNPDOEWakzE
         x7i+zOR6zpObgQ9qdtJ9EcMS0h+hg7ZW+0JKsxhz5/Anw3s/z45uuzha07ccd3sSX6Rh
         kgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903693; x=1766508493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JBas8DcetDChn/tC3EMj4Nw+gt1h+tsQq9O7JhRo1bA=;
        b=DsRKLQsKMRVSLlsmDxN1YwqATiTncwt7ATB2qdv5F260gfGMZDIMztNXlavoeL0l1V
         YDgQXp6vwLYZuMxlRHV8r37X0de6qv4KuzuZosfr71tPItQpgNeSDQ4hfIDT+KHYMSz0
         q7Frq9a8RKsyAX8bH5xpOXeHSyHsyOdUk0cZ3seyinTOJpAOBMGB8T3135cjF7w/hQUM
         JuVVL0/iJPrhrYJAvI4BeI5oPbhwtDhqASPUPwYxraCjAlQBz0zAXjyFboxmUZz039vr
         GCN4xmnpR5IvfJg3J0nsDxzrUsKmwvCG+2dKjlsShYVPPkya/MVx5pGeEQ+JONl8kAfd
         99SQ==
X-Gm-Message-State: AOJu0YzawBb7zOoob1bFbic7yDJiGtYwF+PDCRxzrOKvP/l4xcSqSVe1
	mL+xZGDqkyv+WdyueUawhQAm5n+k+nUAxUTARkgGzVbwXj1EqOElABUMJzS8h7meCIq9fqd40/p
	W2mO0djx2IF+IqoGxo4iV4tBilY8rUhBRNzgtRdZAwOEs665twaIkhSC5GIXUQR+R8JFf
X-Gm-Gg: AY/fxX4FNiDoHN6e1Kp7ylwT3A/pv2vhbPubyiIZx7praln16QdD97lzuj7TsqxNRXV
	kid8Bv/lIkYn+c57rh9PUtcD2V2w9SK4shJDaykynhwIy9UMhdmjsbjR0O4C5sLEX2Rn8r1Ucjd
	8iyYqm9IeiOZK1gzVTkUDhKQTHQDuChk9cP0pXuxpcYYfX7/U5nzDuI/EO78KNGzBTpG4Cdqi5c
	7CzBInU9SHPuU19J7pDEBAW5QPEdDJYT/l+kJFTL4BCS2VksBYgCN4cFDkRzAJxuzcCZlRYBc+M
	PozojPZtJcOhEqN5g9pLIhLE6NELJmVTmWsYJU7bEw+M7gi2tOnHNtuiJyNxIzjx0mgevheyVoc
	m86WjAK8keBmxdj2BW3aHIbFz6ggzGyHs
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr184106711cf.16.1765903692649;
        Tue, 16 Dec 2025 08:48:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA0qzLj3e+Fd02wzcmdfHUJKMrr+nRmh8mTt+E1hYFg8kD4erRxpi02qXyFuR3lUHGWv6dXg==
X-Received: by 2002:a05:622a:2444:b0:4f1:c5f6:22ad with SMTP id d75a77b69052e-4f1da24ada5mr184106361cf.16.1765903692211;
        Tue, 16 Dec 2025 08:48:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1730719066b.22.2025.12.16.08.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:48:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 17:47:32 +0100
Subject: [PATCH v3 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-sm8750-display-dts-v3-2-3889ace2ff0b@oss.qualcomm.com>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
In-Reply-To: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uwF5fbHZBzTPcXbfe7qubLy96cgnnK7cfCCGlS5UQpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQY1ELIHyBIJcHVLXE078q0Rh7xOr6ztEZrcEO
 o6hqtFOACiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUGNRAAKCRDBN2bmhouD
 16TgEACDPXpMgF8qMsykBoTkh3G8I6RpvfSGa3DhVnKtLzM5XNCsqMoFmxnsrvyK9Lqo5poA0Xc
 72CecX/nOW0m1Dsl1HJo/fxvVxYmVd5jSaI1W/LI6vzniZoDTSTfm2HvxKruifUkF7iRYkB+jqy
 4h/eQyQHDmker+PTt8/r7HsHV+xs3apVqU/XJ7+kmuIir3wy8oiZA/IrLrtDNpmi9FHMk4JFQS7
 cPsPQ1ENzS7gD285mlF9uWphFKTLne9687DeaK8N9L586wr4FNlac7PHRw/y/xgNCehwcB7bvMJ
 AKsC460dHi1GoaQCJt3460rG2Si9Tg/Kk5g0Qz/MPdJbjYCYlfK4Tyoe8jJerhVA53ucYmje/Pa
 BoFF9nK3+bXbJ8Qf2/CLzj7yS4Xsg5yhzjuIp7QFeGVyxzQl11lAELMH/hZYt3TZ1cclmU0JDSt
 zuTRahTq/R2b/sK0T3eJVSADZHxCNBTKfYA1nFbiYQHPZ2qPSeqt5qMyhCejkiEFjb4Y0UXacO+
 AJR6Ywlok+tiYRPJMKE50etnfTCCoj2H6zNxv/2qB/6yo8lRttYzGZ/RSe7tX79XINRZkRZSPmf
 KoiZFeLGMHkhAxeyljMumRv3tL289Tj7lmn0uqf2TVV+zMmVglu2Ic+q2mXaHOlZqhBSTWdL7Q0
 i/ldzKJO9iQej+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Kh63eM_Mb65Eb5syBMrB_Dhr2G1gojFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NCBTYWx0ZWRfX+lUHrkWX7uoG
 yyDO+R/4hO23X5dFKwTpSTo7e4lrTQ4m/0ct8aqvrMp0pBbn+LtcOTMzMJM+Y8yxS8s85S1dh0T
 Zh+ESNMTzpxo81E6vPlbx0Yx2hV6FgWol22qbKzbCArCM7Xi5mJr1+YbilBHAEqouvLoxMihg53
 WgwRhg1U1v/sew9CiGMkCosBiCufuYmNMZGt6soL6HXzL6q846DCdTQ8j577XM2CQ3S0lguRzZ/
 gQf9IAm1Wlx3KAGNIo401VA9W8xzC//IYJw3B+zmL27oM6VPz6xgBvd62mzVvJV2MFDpdIJbvYF
 6VlQdRME2fXpa/kT4QZfnvAAUdaOAvfvb26Tbime3WHQdbazvzTGdx/wVL0dfRLzmARTAk8LRT8
 Cd0DozhafDsGrl82gy7LShfSJcZRug==
X-Authority-Analysis: v=2.4 cv=RKe+3oi+ c=1 sm=1 tr=0 ts=69418d4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RDspO1OVq_Eb2t1NqecA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Kh63eM_Mb65Eb5syBMrB_Dhr2G1gojFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160144

Enable display on MTP8750 board with Novatek NT37801 panel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..68644eccdbff 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -933,6 +933,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1194,6 +1236,34 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.51.0


