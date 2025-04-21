Return-Path: <linux-arm-msm+bounces-54900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79234A958C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 00:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A19E3AE95B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B772822256E;
	Mon, 21 Apr 2025 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIEZACNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D84221F0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272846; cv=none; b=J5RpTl59w/ZO2wDzNrRza5PYfChZn4/98C8fu2kbbHf7JdwQlGp0N+AVPteIyAoYBn0IbNQTD9tZD1MMOLwhaiHvWMf14PNqjFzItFjXXqDAKfoCAbaT3NPWRvoVVgozx7zZYfJk3LPs+xOlLN6h+AtA7ULNPkxPKXXvi9KrQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272846; c=relaxed/simple;
	bh=ZGTzQ2ZkkvsSC/rklcWp3298b4IazTCUmDRyNqAhQoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R3ngUQih6YXiEfK9FNGxWa71MI4IpuIqeW1kRwfCjm7lUqiKDmUQOThd2hgh54EEFsfjvM626C/82WugEtvBwkdtj2dqJfA+xOTWu6hSX4UjYWKi3UTd/jrLpDDtwcuW9vdpFaPjKHbMEnLOqRuc7lOMknpR5VBn94shLjtj7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIEZACNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK43DZ009019
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNZhdDbQ4CpO6odDNFgTaspOuazgSLRe+Qho8Mt2o/E=; b=LIEZACNoFs8EkWUE
	JqgZHQL2t2pC4FguW+h7jj5lVZJkKElBNg2NiOt231JD58DlKcTUPNsqi7nSBcKL
	6EnSPEskBuaAF5SBVERnTHit8CkhS4eAbe1huYHE7c1MUJB1rBJImZyJmX0OwNQ7
	dbCecxY5ejTK+OugSdCui3LnVhekJmCRGug6ApwycxSvMpZQUGO3+eRA8BpXU89E
	DzZ5yStoLDPTEwl/qDbVs6d/HsGrHcmG6ob+DwUMWl0/p0j0+U7gf9qvTmVqhoPs
	oS0wfLPWeVeX/uS2R+Xc0bs0u3YR7n0KhlMiJj64zKKdgoJ2WfpErRsPcf/MMXPo
	nd61/w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478wdw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736fff82264so3331692b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272841; x=1745877641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNZhdDbQ4CpO6odDNFgTaspOuazgSLRe+Qho8Mt2o/E=;
        b=h0Etx5IMb4dCI9wiZo0yDnfdWfBu5aDTeTC3GJuhJWKRg56QLTzKKEeBq/YoNHK/JX
         k0ycS9zJ5+SHJeq/WJCp8ZFu6dHyGWcTc53FJ8KbnM6pygj+g7hoNhc8lWhApauMZMrd
         +3SrwcXorvn4vdq73+p/yJxtCOf8Zdtd3kMhMatfNZ6I0uCx3c9NLb3AC1Gc3Sm4gSlP
         W6bXYuS8W854K293p53arI92styn0uEgYTLG5k6sZ8XHZ1BPCE5crXbJ68Q/gBH/Jaii
         dFDXRdJvvtynYU0u5tyPgTzybQRrq/rABzIB6MmIkJzsg1pCRaS+92WbCop6sEIBJW45
         1m5w==
X-Gm-Message-State: AOJu0YwM40qQvw4RBGIkooQM+y3GEzAUFTgQSMmyi8zHXssrPcSODItN
	EUncXOLuLtBOq5aM2Yxwze2VZcRw0ngwH9a6P1gfuLrKzW78YXor3t6Xh6DKypYV9lKhBII523E
	iB4sbupYw2BkRarmHFuZVqCY1daRfxkZub/LxSKWWhNF3NrabnPn877FIEH8VKP36
X-Gm-Gg: ASbGncs6czvx2CmiEbm1wT7vammM3VYA67MSOGHXg9teypiEaHWNx5inY4nNKG+3D6U
	zqvewTXe0PS3WSINSD7bxsMRVDLLpqUAhpSqZS3WwDjuGfNYwZM8QYul7FRg5pIA4SQA6uBnPim
	iXsiVzCd/wQprZTgH2tPVWdvqvrPgf/20un2JYIDVr8VibZXGeD1wMM9zbDjiJW4lpcGNxQuTw1
	yTZQKkN5jXeSflsuC+cXl72jfEU4JvOKXMItENCIsOatcOJxADF2/rwWZ2v1oA7L09gYUiDLpCm
	YxzJgFRAWyDHaaFJwWOlIb1+iPNinUBrvKcNStNEbbWr42pS24uED5pQzOzO03pDVsI=
X-Received: by 2002:a05:6a00:374d:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73dbe4e3a0dmr15296399b3a.1.1745272841007;
        Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsQtDnYNApQLqy5KcA6mhITkSBM1PN+PtOnFK1BaG3vcBYf9dQGt26si6zv5LYrESEmcgS9A==
X-Received: by 2002:a05:6a00:374d:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73dbe4e3a0dmr15296341b3a.1.1745272840467;
        Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:16 -0700
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-9-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1346;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Jejw3tXebX3bwJYOfSSXxknK7DywBDBkNV50yFQ7X10=;
 b=+GRxjHBRFn26nN9usdJe78ZckstTGCijyHpDp+HOdoS8Rc7Vl5bI+yCSW4iUjQhxfeVs1hCRR
 Lj3tARvPpC2BYVuRGFVWOacXsJocvMEay3m/G9qxURxaeKr3RptnY3s
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: RH4BftKldW0DmuMq4P080rOrera_auob
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=6806c00a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: RH4BftKldW0DmuMq4P080rOrera_auob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=771 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..5cb18ef1bdbece09a7626b57a852379a62985995 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -811,3 +811,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
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

-- 
2.48.1


