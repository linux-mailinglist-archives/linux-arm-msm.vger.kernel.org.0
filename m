Return-Path: <linux-arm-msm+bounces-79889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F73C2507A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A89956010A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B062A34A3C1;
	Fri, 31 Oct 2025 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwLv50Tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTXo1XYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFE34A774
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914055; cv=none; b=QPcb0o8eSZGe0q3DQKzT7XoutOJ4VFFY74JI1kFnXrtvlkFgFmTDaeZi2ZpU/HuXWa2S3sUn+eiK4F3PAx0Xr1bsGUFufvQLcQXA/U1j6aVyc6GU2MaRxoLkwrhtESt9hQy7j+iSSann6EsAAOjNfuZud9MB2AJ5dqSB85W5MTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914055; c=relaxed/simple;
	bh=ISl4afa8cwdv7DeeV1ffEiyBIyGaBEuEZtsasRQTFbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=npMfOXrQZ60tAH4FfHOUKRBeqa2IRa+KcSCyTt2Ot7gIZlxA5XYbDDi+P08P3cloAtnZ/ixorlldDw/c1qtWrKMtFjX8IXxYVttYipgT/nTqNm7nKuTyJZ6j6hcmo8NMiBF0gD2MGuvfNhx+quN1Os2s74uv1ImxdH0FSx7R0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwLv50Tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTXo1XYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8Ldh5899331
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T+lGrQBbk9F
	oJoDoi6KpifG+D4n9fQawHOjseZxAJ1E=; b=pwLv50TlZbSGPLWU9dCvBWTned6
	66SV+yw9A8jSu3zyG7sglU1c45xfYw+GFEAlmVdhneBt7/FcvODLXCm4AVvSBDsD
	3opqUjBrhXCqHNFzN3O+J9MtpUBT+o7y+agAqbKGZU5dHgqOBnYM+xpkkRZoAAkj
	ug8tTUD59qtkrNThc4dl3jzn3comSzBWGfd45GlrXRBz6XU6YFl7U5TkQ+A1fn55
	AITzyqXtR2dX78/a/s/Rq/0kXaqXOJZIbEG9rByPOXl5/1+WmZ/Tk0xOXcQ6imSO
	xxQ8IYKGvT/HesuYXx91D+N8jp81nP6P6dnYanUdRY0ih05dznnqN7QwXPg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb221w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6cff817142so1514820a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761914053; x=1762518853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+lGrQBbk9FoJoDoi6KpifG+D4n9fQawHOjseZxAJ1E=;
        b=GTXo1XYtXvpCTBe7c9lYuZKb2qVNYHkxio/gRF0EWScduuJDE+8hRV2pIqTv4fTSbS
         gd9JJokmvsNWd0P/KJ6C50h8oBsk119mhd5xNLqehiWwXX8sFlkJznya7DN6ISU2uDo2
         YNiv7+WBrcnnnbB/yP1JY4h2NfICnOWH7rdDoEdHxlJpyQwow6GWTqUBj4JXXODJqLD4
         1t+5FoR4LJA5/VmjAATwNBbQxHsCH0bddvF1VC98vcSna2lvue2uYEymGKeSaVPBVSbC
         BM1GMuKmCRldy40MFvRoux+MHWhF54nX7RywKsQ8yhN9HipFlgtP8AT1Qx0l2bJuKZ0M
         21TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914053; x=1762518853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+lGrQBbk9FoJoDoi6KpifG+D4n9fQawHOjseZxAJ1E=;
        b=Um6V3jc2rF/auPg6puwJ3kXsgxUU9zoa/zol/g0YmvlcOg7uM8XyhJls4e6YcfQSwC
         ZbVwSxqel7eVHovNVtjY+EBXzbhzYitNBjIULfyL9CawChqoIA70wI5T0H1vCjb6QnEm
         posV3FWnMiT3mbL7LgI1/sB1jgWScZtz7zeSu4w9Kd/usbKsBDrwjMZiMUTxvTW2Z18X
         hSzQlgPiRi33N2qdHD8rfm01UQjr6L+Cqc1RMwXj7OaKTm1fFOcie6dOeoBeMK/jYYWj
         tzU6wJqY0ejU6wCljY9WdPSWeazj7JTOUfPQF9vnqjcLwtvqKmeNgsqetud57byaEg9A
         qgaA==
X-Gm-Message-State: AOJu0YyQe8f0V8HQoAxh1jv9P3z1nNIxp9HxJbwkWxOid0Nudl39PWn2
	Xn78CZqK24WzD5/ogBVPOJFhM7DBBAibwzpA981pJFqWLQTuD2lhslD9cQiBgTL4bB8qpqNZ/k0
	RzihNRZaVDmGCN4itxXRAyGH32JGAjd+W2PXnRHvOB2ueQcI+RZjAlfpu2k3tQTw7+CeM
X-Gm-Gg: ASbGncsE8fgGekp/kYbEzVjwanUVWd/3xwhPkG+Wj3kI/Z3YfYvHxgugcjt6JPft6ew
	mgnHpUBm9EDpLTbuEMgmMhFr0AnESewUPbePOnrf8Ru6VUaCP6TdZn2UkBoeY8lyo2rzlLWnz6A
	umHUmeA28Po1zipAghv/OMydi0CF7+q+iQetrwTYcOlD+03Xe4ODmLna3gnRNcl8yyH9u2cpyEA
	cA3QM2F/opG/Dcx47ngGqusJoU0Hg8+ffNkST/fuiQyPGGw7fyv54YCv6DC6bVeCdA+Ao2Oly3r
	YN0dOj7M0YayHv8lsUBBEP8Ib3orSt/9iL2xV2IR6wOFOY+maEOlyXl4qtW7c23N3evyzCB/JPv
	QnlQz81m8adLDiwr648Jkc3v6uzKkg6YM/pQy
X-Received: by 2002:a05:6a20:a103:b0:2b0:ff55:f830 with SMTP id adf61e73a8af0-348cc6f56d1mr4796293637.51.1761914052478;
        Fri, 31 Oct 2025 05:34:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJVtBqEFCaBAGHv2UQNhXJlUSOeZOqqNb1s7Do3Pm1YnpfErwTizdQ+Rc5UArFox1YRzQCmQ==
X-Received: by 2002:a05:6a20:a103:b0:2b0:ff55:f830 with SMTP id adf61e73a8af0-348cc6f56d1mr4796248637.51.1761914052000;
        Fri, 31 Oct 2025 05:34:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8982109sm2131277b3a.1.2025.10.31.05.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:34:11 -0700 (PDT)
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
Subject: [PATCH v10 2/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
Date: Fri, 31 Oct 2025 18:03:53 +0530
Message-Id: <20251031123354.542074-3-krishna.kurapati@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=6904acc5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JjTwLu2Kam44ScBvYj0A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExMyBTYWx0ZWRfX8GHF5kGEAuQI
 n+zymvfJ88E/hbARuChZ0DNn+Jqw6/ohY2+Z/HPFjoHGOPPtwQqJ56/fsqa8qcDqE3EfoIXtcMc
 dst9ZWwaXQFdYgyGwDNK6rnt4k8zgWSuFq1UJEo0qf5SoWEgOmCP+Iq5CEp64xcN2DQDd0in0sW
 tukVVFrJ8TspPYW5W78+BkP++K5VdfUqdbkZ4UB2itzFsX0+XZT3GNhnMelZjo+j1I1PhBEUMqa
 dbNARZRjHonV+ONjiYO+Il6cF7e3Uyq8lllVT8b6JukOg1wmZ2eS+tjItsOv8XBvuOrCLY1Yj/O
 ahrs2PH9xzOeQaPqA8hVAh0nLAzYw7kEUT96s9YGnMi40AqE/eXAsOTtNvVJnvs/j5oqulcou/m
 n8WCgxmOfcYaahifaNR3bH5bBlG8kA==
X-Proofpoint-GUID: BKjl375q4Rx3Lam77XOgS3gQ098PWB5h
X-Proofpoint-ORIG-GUID: BKjl375q4Rx3Lam77XOgS3gQ098PWB5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310113

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 MTP variant. Add the PMIC glink node with
connector to enable role switch support.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Konrad: Provided diff to flatten USB node on MTP]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 45b5f7581567..932aeee70054 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -191,6 +191,51 @@ platform {
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
 
@@ -1200,3 +1245,31 @@ &ufs_mem_hc {
 
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


