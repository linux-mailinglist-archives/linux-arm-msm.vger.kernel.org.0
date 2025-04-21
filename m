Return-Path: <linux-arm-msm+bounces-54897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D6A958BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 00:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE13E1887A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 22:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63A022129D;
	Mon, 21 Apr 2025 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaGE6rkC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A621321ADC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272843; cv=none; b=lFX6+ukqU9K1rfsklSBOGjdPAA5W5Wh9hco1zomKDG6HYFDBJYqVGP0yLrRnfGmHbs7RwLy+nLBt6dUqhJCSsquBOg1EoMiDP4haC4pjbVFnlnLO0uraFsV32/j6rnw9QYoCVn29fr4qrFegl/DDS7Mpev7b7cnu4aqyzW2o8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272843; c=relaxed/simple;
	bh=/teLQKUqqqqInwDBMhtvz2ZoYlg5NLp/HJndy5aOQCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7TlLr2LaV8ijL8mVQm6jQxXccBe37/KxaOa6+IKAGyJ2T9QfcEtmQpRxEuv1fGEEBInna2Z71p1PZ0WIObKoay2pCYitt39SPSBlE79i4e6igr9LnwZ2Nut8j4Na4Ev4ae6rtwScIn1tPYKq9irBmoMXdhZLT7Nwmm7kpheYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaGE6rkC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK4n6C003770
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=; b=aaGE6rkCZtdvG9tc
	a1qJ8uhw3iP4HEmPkIB9O7+6NRD1tTXAbC63ftEebmgZjiue074qGi4ystuDl6U+
	DsnqM26bSQWEJeZUgC+/1Vwm0JTGiko1mm3gy7ph+P4ZOFZXnNwrhurZ3uPD+lUU
	9uclUqLnPUgUHQ6aK6vJFSTuN0raWCwWKmK0TK1y8GGqsbZiBoYoXVmpRdylZ87t
	VjlHmU//+4TjwtmPTnKPADrHpNu9ygdOEMuZWAv+mQyX1vc5li5G+Fd09UmfeKx2
	uI5b3z5l/gcd3RW5dSnU3TpHpVUIOgbEHk95ECd4RxhwGqoAcZXC5+GWu+42BCHG
	MEbuxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhnh45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739515de999so3870280b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272840; x=1745877640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=;
        b=mkYu7unkhzulqDoY5bJ0/rQXMAQ44ZUrotZLM+wvcLFd2GInqKDoar733N2VKIt5tX
         dXC/jxIFdgACnhRInKl47aoxgFywf/WUy8zcrwMnhRkdLMYI+YI1PYs7eXD2Zvt0zUGy
         mcebGqIZHu4ST8tIBl2NKGANvx6HnpDWa/uLC7G0apfcRZO3aP0LDfHvwQuHORIMuALV
         BAKmDDBVMtJoOyqwc+xxZNQ3MguOz4DbNMZbGE9Nx04/4IoyBmJS0UqM3Mlea3Ui67+P
         neuKXzx9pNerw/FoXhvf+um8VM60uIrOLxNL/2KTFUshKXZHXfLrxTh0KD3t/VT+zuoi
         IxQQ==
X-Gm-Message-State: AOJu0YzRvA3E/Bu3RX7tzaZGPbhu/AET5S0OnRxgS/EApbJwEJjH9Eg+
	J0ZvT6VqlbPFQmwJRvUXg0zejSER1o/CnhzwDhdHmTTzzqZJAGiD8NWjZVAvzC3I/s8/6vnpFuD
	1OInrU/HIVXwE2Xmj4yOx2zKvK1xKLEz+PR49ly5qB6BYoU4HwdV+vuFOao+YJcBt
X-Gm-Gg: ASbGncvLoUqDjRzWpzohlVftwLEyelLyB1i8cdnlyHSoMybEWKUJyj2D7NGzRRzY32h
	bzMG7B4ePl/yxTj81B/B4TBQ4IrnDFM8S9IC63jeL2mPvOQV2qeCMkbslvI+vE3fOwiGdcyLMzD
	koGQFWuFPM/7XbCeWfw9FG016Ed6JDAq6iYmaL17YtDurGYdS4O+EFlWUq/k9wJQhRn7zLGFf86
	ZifV116IDry3is+PFLo1wy3oFu44GdccAviLxCxvafKPD+9rmdyEmG/SkcnAs33DHOCYOG5Xvum
	R/yc3UKPjcT5KSGyJJ2G32CN/GlxZjsb
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001140b3a.11.1745272839691;
        Mon, 21 Apr 2025 15:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsdbfJsm0KdV60HiBE6DxPravmfAWBBMxUJAVErJZ8Mc6PzUneSapkKYNVVusWvrtS/jXXkA==
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001010b3a.11.1745272838817;
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:15 -0700
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-8-25c79ed01d02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+b6x2t1UZ9tBSOYbcUj0Sk6c/9sXGEBZ/MeOUGfqqx0=;
 b=soft0JCqQzQ4F8eO5+nGm1bNhAoWmg05DsdBm5joEmpWCGlAn4jtQjnOkgw73BUZ0YG2wzdbV
 MIzfiTfDUVVDzggWNSMwA7WyAd2Y4JqKHO6Gfg+pWQ3VJBsB2Wx28pV
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6806c008 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 26VRJmJVaAV-vUI5K6g56wYMJZXqg-6b
X-Proofpoint-ORIG-GUID: 26VRJmJVaAV-vUI5K6g56wYMJZXqg-6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=807 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..d28e45111b8d01c2753493a7a4ee248bbb334aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -814,3 +814,27 @@ &tlmm {
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


