Return-Path: <linux-arm-msm+bounces-64621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F0B020C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 17:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB542174D18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD62E2ED174;
	Fri, 11 Jul 2025 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEzoyv8+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FA2ECE9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248643; cv=none; b=O3ykWNaWFAyy2XtyA7uIhRJ1iYvFvtr9bVxI/YdQtEpt8u6bUJYyfoGSClJSZ8G+xhsFjmYLQBoyd5zzmaldynMj/0rQekUjr+OKY1zQMe3+YojJnTKPj4kzDMCI9zn5hja04CmzhVI9FhnXVuFj+wWFJM7hrQxkkc9M2/ooZhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248643; c=relaxed/simple;
	bh=PEXn5nInKyDmUxIss2FQVUYDJOTahK9n1p8TmcddTHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DZ62pDDKXKVrStHjCtWgrQh1BmlWums44EIdV/xi+aXrKeOjawERAb2sSdIakD4FJ3K/LKTkWODTNBbMb4rTLGWLd/JMKAo3tF+8DMurRIYL5iK7iRZ/MYNgeMbuiotvN2NDO7hoJhKvelW9539KzQ8UKj9P7zf13AvDYmyl9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEzoyv8+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBI0UF001112
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 15:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=emkhpJE6YHBFUt3US4D3Nq
	wBsCFQqng0EqAEghIvVSo=; b=PEzoyv8+/AyhqRsWIydZoJ7P6gbZIOuGVfD0Kg
	1eQWdztX+zzooJLf7cJhmIbZrxIZtX4KN9p2ZCKlv0SGDhihd/fMhIfKaDjvVAGs
	6bJW5E3VOt6EL58wIicvLPkGTXv2BxBIH/M2Rp4M4n7okberNW6OuvPEdbdexeTh
	TrhDTIbg0TdmdGh5SsATGRscngDXLTrD5YG5FkoyfQJ7pyl/C5G55euytaDrqSQz
	zpKfYJWKXaMfiKQKOD4ZLJPgnPtaH2PuMZhFd2WdXgd6nqlZt4LW9zY/lr0koMt5
	A9pNc1Cxk8QYnjXiORwUX0q12/vTVy8o92i3aTbGbQjy6tkA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucncj95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 15:43:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748cf01de06so3446450b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 08:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248638; x=1752853438;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emkhpJE6YHBFUt3US4D3NqwBsCFQqng0EqAEghIvVSo=;
        b=repPtw0sYJ1TQUO/LQoZQIDnc0+38+CPQms9P+SL9VoPWTD2MoiP9w0gEsEJzqWXxy
         1/qx5DHwvKbdaTRpEXoMKKJfQzGbyrtpEbqYQc6J4sr344A6XXLz9f8URyck6I7blYXR
         ITnZM2koJ42oEubP2xY1Ax1mQnSnw9sUVY/nU2tAiM7MuWNk/QkALpGeON0lJ15m4VWc
         +o7GpX2sq6mQWb/nu4VGl2ayAGKaSS9kVArBMaJ4w2kHOPyK9SfDNtQFq3FeIoAFvWSv
         110pK3aIeVpnFEVWYHQHPdK0Dwk25LZ5WfTcn270n90kLmjGDmRtUm+4fe0AwCFOojdE
         KjkQ==
X-Gm-Message-State: AOJu0YyTciN4YAg6ee3D0T7ONXGhxsmDeYO+3/3xTQztpqR3Q+mEmn3g
	lyIhVH52hvXfcBs5cfV8aKQ5lSqXILBJ4/z9/CbzIHoIy+ZjmdDJjJR5WIGVIdZW79TUSwlF45z
	xhaKuNhOGYm+eBs46U0Ar6Sr//PDsZOIevQx/BTRj9XQhrn9CnFMlfyI1+4x5ndij++8I
X-Gm-Gg: ASbGncsZgVu9SoVNF6Huu8JLL2617S5BYs4K1Kf+0EMyx08OBw9rXDza8icxowhtj+R
	Efkdor5DjyBRGYgcqN94QL809VLDvIymy0jy9nuPkJp90hZBvDVtTsVN8SJp3be1lJgWpxWxr9r
	16p6ztgxmfcR4WNZgzCCWS2VFiJwZhXk5asmG8/vZqVzYR14ScnryqZ+BsFX0F7+FghfAxdrnTu
	aKaaSwdAKrhSg4zaTUx3m9tsclPrDWGx+ncL1gTAOK18W+3HnRtxxw6TXxA7lNHj7Vi2DrrG96b
	TFh/N7rxs1i99qOmPF5FZNqvMUHPDgtUpY1fZpugAfM6lrdi+7P0W2fmt4I4I96e5sxKiSHeqZz
	s
X-Received: by 2002:a05:6a20:9c99:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2311fa06643mr7190493637.40.1752248638329;
        Fri, 11 Jul 2025 08:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFA8pi0ySFhkHZI7IhUQan0B4zMZWd3ZAl91cAZ5DjbvXrfYe+D7WAOQzynEuRM2o1cvnnQ==
X-Received: by 2002:a05:6a20:9c99:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2311fa06643mr7190463637.40.1752248637941;
        Fri, 11 Jul 2025 08:43:57 -0700 (PDT)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52c4fasm5447532a12.5.2025.07.11.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:43:57 -0700 (PDT)
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 21:13:47 +0530
Subject: [PATCH] arm64: dts: qcom: qcs9075-iq-9075-evk: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADIxcWgC/yWM2wqDMBAFf0X2uRE3NUpESv+jSEmTbbtQoya9g
 fjvTfXtzIGZGSIFpghNNkOgN0cefALcZWDvxt9IsEsMspCqqBEFeXN5pHfSwo3COGe1rVErqyE
 5Y6Arf9feqds40PRK2ed2Qk8xmjXbZO1arVCiUuW+zrGstFQCRTLs+WMi9/743+xtbof+AN2y/
 AC3q9GnswAAAA==
X-Change-ID: 20250711-enable-iq9-dp-addc9c7195c9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shashank Maurya <quic_ssmaurya@quicinc.com>,
        Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752248634; l=2394;
 i=venkata.valluru@oss.qualcomm.com; s=20250711; h=from:subject:message-id;
 bh=xNxTHWh4Dha0pCFM09zKxyHkpUC/Tls6RXg/hqBBInY=;
 b=ZEkKX8apqTvSjExfh440dF1QD0AuQ9hoQlqJD6LyDyiKZJYu35ezAvnQdBniM2Wt/xudp05lK
 nw1OJv1Xrb7B2DdsqEZROce0TH0vIzjISszlbrMUPGH1LwW5kRPWa6i
X-Developer-Key: i=venkata.valluru@oss.qualcomm.com; a=ed25519;
 pk=f/CAPG1ZGl5SP8S1GuC97WMhUEV87h0JheHkNMt1nhM=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6871313f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=SV12H1ROeRvGGX9EcCkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: p1rAff-dEwLuTw6fBZs2nXb0o5KeFdsg
X-Proofpoint-ORIG-GUID: p1rAff-dEwLuTw6fBZs2nXb0o5KeFdsg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDExMyBTYWx0ZWRfXxOFtQxsqMhws
 05JejHQ8j8j0cE8p93LnO5mqrnAxcB3l0wtmIJbXY6KxFsHcMNNgdglV5nTj0mUw1IEMtF3sz3g
 717BgMiChbvg7McOEOe9flBrikJJZH1DyMRLEMA3I9n3iuOyyqhLVEJlWIl/MDLlPhr4L5CEuT0
 qkft+5GK9fFSKWWzMHNE+hr7dWxMPrjWLjRj13Sf8OMe3Cn+O7l9FHnwDFAy1nK90eR9bM34Wqi
 1NVmvgT9JJilTQQIk8IxrbIUrQYkPe9y50K2RgPj4Dbi/GhDzvvzA3Kodk1NwtUZSwST7oVrXbE
 BuSogd58kswZrOMonaWDDVznX5VYVELJUK5kg5reyAb7KlBwSoisJwKy7iN5OMkoW8Gq1UoKclu
 TvKreYgKTlRP+HL0F/TyGzmlTs/0uSCnBrY+DqHKGImhwMY5Ql9uNEpsfTng4esGJjX6ZHo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110113

From: Shashank Maurya <quic_ssmaurya@quicinc.com>

Enable DPTX0 and DPTX1 along with their corresponding PHYs for
qcs9075-iq-9075-evk platform.

Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index ab161180d1d5a670a68c0903e85f24a91faa2b71..110e08db3ad82e3aa88aa4c4ed4b2beb607385ad 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -252,6 +252,44 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss0_dp0_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss0_dp1_phy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -260,6 +298,20 @@ &sleep_clk {
 	clock-frequency = <32768>;
 };
 
+&tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio102";
+		function = "edp1_hot";
+		bias-disable;
+	};
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

---
base-commit: 7f3a635117b377cb90b67757cb46de12ce8aa24e
change-id: 20250711-enable-iq9-dp-addc9c7195c9
prerequisite-message-id: <20250612155437.146925-1-quic_wasimn@quicinc.com>
prerequisite-patch-id: 22eee78c5507c3105e0c74d1128b3db803879d7a
prerequisite-patch-id: cf52fc82e606ab87458339f71596ca31253e91ee
prerequisite-patch-id: 3617ce3b1790bc5b8e50dca6c3ae482759dcc684

Best regards,
-- 
Prahlad Valluru <venkata.valluru@oss.qualcomm.com>


