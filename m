Return-Path: <linux-arm-msm+bounces-44964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFF4A10041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 06:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 855723A7A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 05:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1475284A57;
	Tue, 14 Jan 2025 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVHzyz+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0962500B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831186; cv=none; b=FwVZ+DP1QuvFcunUHYmHXDQDlI9MwENAh0P3w8tZwayi9pioK7Tc2ph370HOIJUHBRcO+IqPOMB0HnYTDrqw9sRjUonZrNns0he8oI2lvztS/Bjp4X6ZIOf5vO5x8py6l8EcQOiovkVOVSW8tU46FFrVVCY/pSHgIHfSMuVorsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831186; c=relaxed/simple;
	bh=AuHP26w4yhegi2R/4yfc7MsQcEPJbsVzNrNbEdoBi6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWA0QLw753dnhkQYwOyJUBxQKPBpBeAx/MMmdbyCndiG5vOuG3KUDHCBv/mZR9SlGl7ktgOIvzdHwlyxvekKeluXYYrdOe/e0JOsvMWcMWXj2bJig2fvO+xK5YC1pBA7EXEUHkDAlW6t60CMduDmjJEs4BwwiH7NDI2ueN1S00g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVHzyz+2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKrXlH022928
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHxNYTywNZiQtqTOnpGKq9gUGs6jmn3b0BzTWYuTxxw=; b=GVHzyz+2z9W7HMt/
	E9gJK+9MFfeliRzz0ELFluMvsec4/HR+E1Z34vawgTPrysuzsZWwsC+cUgthK45k
	OtW/+MoSSfZAE+XBbnbHJ/MngNQTU9MMh5lt0SKNBvM0ZZBpNVWNpzjdi9Fd9G0M
	LTJYP2+FGJO9VKcUAtjloJTo9485dM4NjiYEypZ4Fn3SuUIYvD0U+gzO1TYllhs6
	/i4IP39aYfLRGBD8evR2gU/dWPJhYzt7w6H7c+ZZtQwGx9wVjFQyk+aGzngVj2gA
	y4h+dVe/a62Y8SBr5H9rcj7Oe0lnuDEFUvLOssXVUfCgjjkYCwFIt4j5M9MlODTM
	AugcYA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a928v8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 05:06:21 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-722a1343db9so3375873a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736831168; x=1737435968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHxNYTywNZiQtqTOnpGKq9gUGs6jmn3b0BzTWYuTxxw=;
        b=jK1HS1+Dk59HGgKqcM6dVDnca0QMgybsqCJa9lbciTijy0c1WmyTB3c5z/XUSqru0P
         cc2mkMSg3b4TyAmkl2TMOR46x8BU9T2fUJK5TAFtg45JXf2tHaEWK+8p2l95RDYrC3+R
         aQxNa34nn8XCThZtYSxiL4NOUXNcO0fhsH4kK82pLo7Ma7KUqv8Kiu3jAJM+UtOZNQTC
         LJ9T7tbXzkIzcK2XYgfThp1ezM0bKQv2jMSr02yrqMXVqA5XK8kAsfYKhd4gpJt/UBPE
         d86/0GHUZ/xa14vtnUEo8bN+2Wwof7IXgdhSvJnRmO3MRR5C6/LLwvR16fNp6/Sctw/s
         zFAA==
X-Gm-Message-State: AOJu0Yzl4G5q/jixO4l7WxOagoRbXvThA/zAKjxm4OYF1Gia5l2zq7V0
	+pKAYJcVmt+Ab320OvlkierByr0O+pyShY8wXjsPUFD8pvTr3UK4MsTEnNODclY8iS3z2HxTL0G
	YrT/iqcyZaT8TLTNnFYHJ5zlRhtVB/OV74pyNAlfubrOn8+jo8IjQiBiHqT8da31q
X-Gm-Gg: ASbGncvW6BVY9uw93+hvC993blFZJmL6A7fVafkt6C+diROjE5P6SczOvDQnu8PE3rl
	S4FhJ3unAZ69Sfgdp12OXLCLqv1Uq9ryt2av6JYiDe5qANEliSHw6MSdDB4r/dFCcIjN12GC6Bq
	FSPi8a4jMgWiYBAyQMkiBQdSo02N/qEd5jVEoFZHr+eXJsn7xTLD0wFDOXdkc6nl6/2+CUtyG7z
	OO+3bhhk/XzLYTES4JUEWmGS38nZrvoMMLEPuPxCd7MsFp9zBbyACE0AqF5hjvhEk/WIYK/su0+
	RWHB7iZGHS/eIAm1fnNniK+TRHvShJjklzI16R60H28imOb78AZPF6aw
X-Received: by 2002:a05:6830:611a:b0:71d:f9f1:7f3a with SMTP id 46e09a7af769-721e2ec9d03mr14623999a34.24.1736831167462;
        Mon, 13 Jan 2025 21:06:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnWR6Z1RNcjpuYCaWtX6P5hvwhxoRNoAimCWjyQ7z1kiDZzsM+Gn4+PXzLkz/ZlOxswztXlg==
X-Received: by 2002:a05:6830:611a:b0:71d:f9f1:7f3a with SMTP id 46e09a7af769-721e2ec9d03mr14623666a34.24.1736831152553;
        Mon, 13 Jan 2025 21:05:52 -0800 (PST)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882756603sm4001750eaf.29.2025.01.13.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 21:05:51 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 21:11:40 -0800
Subject: [PATCH v3 07/12] of: overlays: dwc3-flattening: Provide overlay
 symbols
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-dwc3-refactor-v3-7-d1722075df7b@oss.qualcomm.com>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=48679;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=AuHP26w4yhegi2R/4yfc7MsQcEPJbsVzNrNbEdoBi6U=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnhfIVwlbndoIHLJjxdNIoNXPVaSFMiaAg3EXCt
 N9JnNMuWWKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ4XyFRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU54hAApv2Ugwcl+MqqFFVFVtEHuCl70k5rAJ//gaW4l+y
 PksvrHTPhxxSOXoPBtEAkDxaqYZzOWTmdGkTSqkR0Zn1IOj71GZv2KUtORw2gNeuRo+Gcq8+ak7
 vS2ybcE/eFeolZ73Ggoi48jgmP/Zi/H0VRyIpfnNs4sDi8e6Yk2EXDHxfsK1PE2SV8z2w+IDssY
 JIQOFhXkrzWoY2V7ME0cYoBrcSrtErmIkb4b747Nus2qc0iwx++Mg+79d1AlfZ0NeLKk51MnfZ5
 pGc2uv0FFetwi8IHsROIFj9DHxBipBD+lJG5QoqMlmNOiDJQGYeiPfas2Lges0k8A/cNfKosOQL
 xWdFeEbfAxHn+AGCjDhgmO2s6QkxPWPkuTbyoBlu5vl1n/hzQXliXzQBhRMTy6yGf+X+8AZMWV2
 FOY9MPi41bh8vVdy3Xv6CJmU0xqlr1DKPytzLFgoDc+RDZtmeXuzysqSpKhYFSu2jluOcv1BNeK
 ybKbAZN7oLdzC/6LmJr9PzyVWSsSZkJ4v7rzUNprj2Mjgw5QSizZmGMUPEsqa8daqVbeDBzNrsJ
 jqNvX1KpcuFPNXk91jdLVp10QbXJlF3vfZXRhMWjN55PzYwVsr26VY/15CX6UY4+8JW09etyc6p
 0z2to+wXQEBR7cBnNXLHwclT0ji8a3NYX4/RnQHu0MhE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: 6nxk951xf94wm-nW0Z2aGeV70zQeZV9b
X-Proofpoint-ORIG-GUID: 6nxk951xf94wm-nW0Z2aGeV70zQeZV9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=945 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140040

The overlays introduced to apply the migration to the flattened Qualcomm
DWC3 binding depends on symbols to be applied, but in general the
DeviceTree blobs in circulation on people's devices wasn't built with
symbols - and hence they can not be applied.

Work around this problem by detecting when the live DeviceTree is
lacking symbols and inject the necessary symbols for each target, for
the duration of the dwc3-flattening overlay application.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../of/overlays/dwc3-flattening/dwc3-flattening.c  | 765 +++++++++++++++++++++
 1 file changed, 765 insertions(+)

diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
index d33cdf6661c0..07f90360c04d 100644
--- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
+++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
@@ -19,546 +19,1273 @@ struct dwc3_overlay_data {
 	const void *fdt;
 	const void *end;
 	const char *migrate_match;
+	struct dwc3_overlay_symbol *symbols;
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_apq8094_overlay = {
 	.fdt = __dtb_dwc3_qcom_apq8094_begin,
 	.end = __dtb_dwc3_qcom_apq8094_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@f9000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_apq8096_overlay = {
 	.fdt = __dtb_dwc3_qcom_apq8096_begin,
 	.end = __dtb_dwc3_qcom_apq8096_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb2_id", "/usb2-id" },
+		{ "usb3_id", "/usb3-id" },
+		{ "usb3phy", "/soc@0/phy@7410000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_apq8096_inforce_ifc6640_overlay = {
 	.fdt = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_begin,
 	.end = __dtb_dwc3_qcom_apq8096_inforce_ifc6640_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb3phy", "/soc@0/phy@7410000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq4018_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq4018_begin,
 	.end = __dtb_dwc3_qcom_ipq4018_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "usb2_hs_phy", "/soc/usb-phy@a8000" },
+		{ "usb3_hs_phy", "/soc/usb-phy@a6000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq4018_8dev_jalapeno_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_begin,
 	.end = __dtb_dwc3_qcom_ipq4018_8dev_jalapeno_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "usb2_hs_phy", "/soc/usb-phy@a8000" },
+		{ "usb3_hs_phy", "/soc/usb-phy@a6000" },
+		{ "usb3_ss_phy", "/soc/usb-phy@9a000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq4019_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq4019_begin,
 	.end = __dtb_dwc3_qcom_ipq4019_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "usb2_hs_phy", "/soc/usb-phy@a8000" },
+		{ "usb3_hs_phy", "/soc/usb-phy@a6000" },
+		{ "usb3_ss_phy", "/soc/usb-phy@9a000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq5018_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq5018_begin,
 	.end = __dtb_dwc3_qcom_ipq5018_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "usbphy0", "/soc@0/phy@5b000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq5332_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq5332_begin,
 	.end = __dtb_dwc3_qcom_ipq5332_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "usbphy0", "/soc@0/phy@7b000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq5424_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq5424_begin,
 	.end = __dtb_dwc3_qcom_ipq5424_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "qusb_phy_0", "/soc@0/phy@7b000" },
+		{ "qusb_phy_1", "/soc@0/phy@71000" },
+		{ "ssphy_0", "/soc@0/phy@7d000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq6018_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq6018_begin,
 	.end = __dtb_dwc3_qcom_ipq6018_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "qusb_phy_0", "/soc@0/qusb@79000" },
+		{ "qusb_phy_1", "/soc@0/qusb@59000" },
+		{ "ssphy_0", "/soc@0/ssphy@78000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq8064_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq8064_begin,
 	.end = __dtb_dwc3_qcom_ipq8064_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hs_phy_0", "/soc/phy@100f8800" },
+		{ "hs_phy_1", "/soc/phy@110f8800" },
+		{ "ss_phy_0", "/soc/phy@100f8830" },
+		{ "ss_phy_1", "/soc/phy@110f8830" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq8074_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq8074_begin,
 	.end = __dtb_dwc3_qcom_ipq8074_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "qusb_phy_0", "/soc@0/phy@79000" },
+		{ "qusb_phy_1", "/soc@0/phy@59000" },
+		{ "ssphy_0", "/soc@0/phy@78000" },
+		{ "ssphy_1", "/soc@0/phy@58000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_ipq9574_overlay = {
 	.fdt = __dtb_dwc3_qcom_ipq9574_begin,
 	.end = __dtb_dwc3_qcom_ipq9574_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "usb_0_qmpphy", "/soc@0/phy@7d000" },
+		{ "usb_0_qusbphy", "/soc@0/phy@7b000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8953_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8953_begin,
 	.end = __dtb_dwc3_qcom_msm8953_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy", "/soc@0/phy@79000" },
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8992_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8992_begin,
 	.end = __dtb_dwc3_qcom_msm8992_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@f9000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8994_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8994_begin,
 	.end = __dtb_dwc3_qcom_msm8994_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@f9000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_begin,
 	.end = __dtb_dwc3_qcom_msm8996_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb3phy", "/soc@0/phy@7410000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_begin,
 	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_oneplus_oneplus3t_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_begin,
 	.end = __dtb_dwc3_qcom_msm8996_oneplus_oneplus3t_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_dora_row_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_sony_dora_row_begin,
 	.end = __dtb_dwc3_qcom_msm8996_sony_dora_row_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb3_id", "/usb3-id" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_kagura_row_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_sony_kagura_row_begin,
 	.end = __dtb_dwc3_qcom_msm8996_sony_kagura_row_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb3_id", "/usb3-id" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_sony_keyaki_row_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_begin,
 	.end = __dtb_dwc3_qcom_msm8996_sony_keyaki_row_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "usb3_id", "/usb3-id" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_gemini_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_begin,
 	.end = __dtb_dwc3_qcom_msm8996_xiaomi_gemini_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "typec", "/soc@0/i2c@75b7000/typec@47" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_natrium_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_begin,
 	.end = __dtb_dwc3_qcom_msm8996_xiaomi_natrium_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "typec", "/soc@0/i2c@75b7000/typec@47" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8996_xiaomi_scorpio_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_begin,
 	.end = __dtb_dwc3_qcom_msm8996_xiaomi_scorpio_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy1", "/soc@0/phy@7411000" },
+		{ "hsusb_phy2", "/soc@0/phy@7412000" },
+		{ "intc", "/soc@0/interrupt-controller@9bc0000" },
+		{ "typec", "/soc@0/i2c@75b7000/typec@47" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_begin,
 	.end = __dtb_dwc3_qcom_msm8998_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{ "usb3phy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_fxtec_pro1_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_fxtec_pro1_begin,
 	.end = __dtb_dwc3_qcom_msm8998_fxtec_pro1_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{ "usb3phy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_cheeseburger_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_begin,
 	.end = __dtb_dwc3_qcom_msm8998_oneplus_cheeseburger_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_oneplus_dumpling_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_begin,
 	.end = __dtb_dwc3_qcom_msm8998_oneplus_dumpling_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_lilac_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_begin,
 	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_lilac_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{ "usb3phy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_maple_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_begin,
 	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_maple_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{ "usb3phy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_sony_xperia_poplar_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_begin,
 	.end = __dtb_dwc3_qcom_msm8998_sony_xperia_poplar_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{ "usb3phy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_msm8998_xiaomi_sagit_overlay = {
 	.fdt = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_begin,
 	.end = __dtb_dwc3_qcom_msm8998_xiaomi_sagit_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy", "/soc@0/phy@c012000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qcm2290_overlay = {
 	.fdt = __dtb_dwc3_qcom_qcm2290_begin,
 	.end = __dtb_dwc3_qcom_qcm2290_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "mpm", "/remoteproc/interrupt-controller" },
+		{ "usb_hsphy", "/soc@0/phy@1613000" },
+		{ "usb_qmpphy", "/soc@0/phy@1615000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qcm6490_overlay = {
 	.fdt = __dtb_dwc3_qcom_qcm6490_begin,
 	.end = __dtb_dwc3_qcom_qcm6490_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qcs404_overlay = {
 	.fdt = __dtb_dwc3_qcom_qcs404_begin,
 	.end = __dtb_dwc3_qcom_qcs404_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{ "usb2_phy_prim", "/soc@0/phy@7a000" },
+		{ "usb2_phy_sec", "/soc@0/phy@7c000" },
+		{ "usb3_phy", "/soc@0/phy@78000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qcs615_overlay = {
 	.fdt = __dtb_dwc3_qcom_qcs615_begin,
 	.end = __dtb_dwc3_qcom_qcs615_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_hsphy_2", "/soc@0/phy@88e3000" },
+		{ "usb_qmpphy", "/soc@0/phy@88e6000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qcs8300_overlay = {
 	.fdt = __dtb_dwc3_qcom_qcs8300_begin,
 	.end = __dtb_dwc3_qcom_qcs8300_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@8904000" },
+		{ "usb_2_hsphy", "/soc@0/phy@8906000" },
+		{ "usb_qmpphy", "/soc@0/phy@8907000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qdu1000_overlay = {
 	.fdt = __dtb_dwc3_qcom_qdu1000_begin,
 	.end = __dtb_dwc3_qcom_qdu1000_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17200000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e5000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_qru1000_overlay = {
 	.fdt = __dtb_dwc3_qcom_qru1000_begin,
 	.end = __dtb_dwc3_qcom_qru1000_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17200000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e5000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sa8155p_overlay = {
 	.fdt = __dtb_dwc3_qcom_sa8155p_begin,
 	.end = __dtb_dwc3_qcom_sa8155p_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb2phy_ac_en1_default", "/soc@0/pinctrl@3100000/usb2phy-ac-en1-default-state" },
+		{ "usb2phy_ac_en2_default", "/soc@0/pinctrl@3100000/usb2phy-ac-en2-default-state" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sa8540p_overlay = {
 	.fdt = __dtb_dwc3_qcom_sa8540p_begin,
 	.end = __dtb_dwc3_qcom_sa8540p_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_0_hsphy", "/soc@0/phy@88e5000" },
+		{ "usb_0_qmpphy", "/soc@0/phy@88eb000" },
+		{ "usb_1_hsphy", "/soc@0/phy@8902000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@8903000" },
+		{ "usb_2_hsphy0", "/soc@0/phy@88e7000" },
+		{ "usb_2_hsphy1", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy2", "/soc@0/phy@88e9000" },
+		{ "usb_2_hsphy3", "/soc@0/phy@88ea000" },
+		{ "usb_2_qmpphy0", "/soc@0/phy@88ef000" },
+		{ "usb_2_qmpphy1", "/soc@0/phy@88f1000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sa8775p_overlay = {
 	.fdt = __dtb_dwc3_qcom_sa8775p_begin,
 	.end = __dtb_dwc3_qcom_sa8775p_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_0_hsphy", "/soc@0/phy@88e4000" },
+		{ "usb_0_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e6000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88ea000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e7000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sar2130p_overlay = {
 	.fdt = __dtb_dwc3_qcom_sar2130p_begin,
 	.end = __dtb_dwc3_qcom_sar2130p_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17200000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_dp_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sc7180_overlay = {
 	.fdt = __dtb_dwc3_qcom_sc7180_begin,
 	.end = __dtb_dwc3_qcom_sc7180_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sc7280_overlay = {
 	.fdt = __dtb_dwc3_qcom_sc7280_begin,
 	.end = __dtb_dwc3_qcom_sc7280_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sc8180x_overlay = {
 	.fdt = __dtb_dwc3_qcom_sc8180x_begin,
 	.end = __dtb_dwc3_qcom_sc8180x_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_mp_hsphy0", "/soc@0/phy@88e4000" },
+		{ "usb_mp_hsphy1", "/soc@0/phy@88e5000" },
+		{ "usb_mp_qmpphy0", "/soc@0/phy@88eb000" },
+		{ "usb_mp_qmpphy1", "/soc@0/phy@88ec000" },
+		{ "usb_prim_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_prim_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_sec_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_sec_qmpphy", "/soc@0/phy@88ee000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_overlay = {
 	.fdt = __dtb_dwc3_qcom_sc8280xp_begin,
 	.end = __dtb_dwc3_qcom_sc8280xp_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_0_hsphy", "/soc@0/phy@88e5000" },
+		{ "usb_0_qmpphy", "/soc@0/phy@88eb000" },
+		{ "usb_1_hsphy", "/soc@0/phy@8902000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@8903000" },
+		{ "usb_2_hsphy0", "/soc@0/phy@88e7000" },
+		{ "usb_2_hsphy1", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy2", "/soc@0/phy@88e9000" },
+		{ "usb_2_hsphy3", "/soc@0/phy@88ea000" },
+		{ "usb_2_qmpphy0", "/soc@0/phy@88ef000" },
+		{ "usb_2_qmpphy1", "/soc@0/phy@88f1000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sc8280xp_microsoft_blackrock_overlay = {
 	.fdt = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_begin,
 	.end = __dtb_dwc3_qcom_sc8280xp_microsoft_blackrock_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_0_hsphy", "/soc@0/phy@88e5000" },
+		{ "usb_0_qmpphy", "/soc@0/phy@88eb000" },
+		{ "usb_1_hsphy", "/soc@0/phy@8902000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@8903000" },
+		{ "usb_2_hsphy0", "/soc@0/phy@88e7000" },
+		{ "usb_2_qmpphy0", "/soc@0/phy@88ef000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sda660_overlay = {
 	.fdt = __dtb_dwc3_qcom_sda660_begin,
 	.end = __dtb_dwc3_qcom_sda660_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy0", "/soc@0/phy@c012000" },
+		{ "qusb2phy1", "/soc@0/phy@c014000" },
+		{ "usb3_qmpphy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm450_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm450_begin,
 	.end = __dtb_dwc3_qcom_sdm450_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy", "/soc@0/phy@79000" },
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm630_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm630_begin,
 	.end = __dtb_dwc3_qcom_sdm630_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy0", "/soc@0/phy@c012000" },
+		{ "qusb2phy1", "/soc@0/phy@c014000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm632_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm632_begin,
 	.end = __dtb_dwc3_qcom_sdm632_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "hsusb_phy", "/soc@0/phy@79000" },
+		{ "intc", "/soc@0/interrupt-controller@b000000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm636_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm636_begin,
 	.end = __dtb_dwc3_qcom_sdm636_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy0", "/soc@0/phy@c012000" },
+		{ "qusb2phy1", "/soc@0/phy@c014000" },
+		{ "usb3_qmpphy", "/soc@0/phy@c010000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm660_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm660_begin,
 	.end = __dtb_dwc3_qcom_sdm660_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "extcon_usb", "/extcon-usb" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "qusb2phy0", "/soc@0/phy@c012000" },
+		{ "qusb2phy1", "/soc@0/phy@c014000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm670_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm670_begin,
 	.end = __dtb_dwc3_qcom_sdm670_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_begin,
 	.end = __dtb_dwc3_qcom_sdm845_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_lenovo_yoga_c630_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_begin,
 	.end = __dtb_dwc3_qcom_sdm845_lenovo_yoga_c630_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyln_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyln_begin,
 	.end = __dtb_dwc3_qcom_sdm845_lg_judyln_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_lg_judyp_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_lg_judyp_begin,
 	.end = __dtb_dwc3_qcom_sdm845_lg_judyp_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_qcom_sdm845_mtp_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_begin,
 	.end = __dtb_dwc3_qcom_sdm845_qcom_sdm845_mtp_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_starqltechn_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_begin,
 	.end = __dtb_dwc3_qcom_sdm845_samsung_starqltechn_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_samsung_w737_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_samsung_w737_begin,
 	.end = __dtb_dwc3_qcom_sdm845_samsung_w737_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_shift_axolotl_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_shift_axolotl_begin,
 	.end = __dtb_dwc3_qcom_sdm845_shift_axolotl_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_thundercomm_db845c_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_begin,
 	.end = __dtb_dwc3_qcom_sdm845_thundercomm_db845c_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_begin,
 	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_begin,
 	.end = __dtb_dwc3_qcom_sdm845_xiaomi_beryllium_ebbg_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc_intc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdx55_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdx55_begin,
 	.end = __dtb_dwc3_qcom_sdx55_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc/iommu@15000000" },
+		{ "intc", "/soc/interrupt-controller@17800000" },
+		{ "pdc", "/soc/interrupt-controller@b210000" },
+		{ "usb_hsphy", "/soc/phy@ff4000" },
+		{ "usb_qmpphy", "/soc/phy@ff6000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdx65_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdx65_begin,
 	.end = __dtb_dwc3_qcom_sdx65_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc/iommu@15000000" },
+		{ "intc", "/soc/interrupt-controller@17800000" },
+		{ "pdc", "/soc/interrupt-controller@b210000" },
+		{ "usb_hsphy", "/soc/phy@ff4000" },
+		{ "usb_qmpphy", "/soc/phy@ff6000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sdx75_overlay = {
 	.fdt = __dtb_dwc3_qcom_sdx75_begin,
 	.end = __dtb_dwc3_qcom_sdx75_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17200000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_hsphy", "/soc@0/phy@ff4000" },
+		{ "usb_qmpphy", "/soc@0/phy@ff6000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm4250_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm4250_begin,
 	.end = __dtb_dwc3_qcom_sm4250_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "usb_hsphy", "/soc@0/phy@1613000" },
+		{ "usb_qmpphy", "/soc@0/phy@1615000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm4250_oneplus_billie2_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm4250_oneplus_billie2_begin,
 	.end = __dtb_dwc3_qcom_sm4250_oneplus_billie2_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "usb_hsphy", "/soc@0/phy@1613000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm6115_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm6115_begin,
 	.end = __dtb_dwc3_qcom_sm6115_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "usb_hsphy", "/soc@0/phy@1613000" },
+		{ "usb_qmpphy", "/soc@0/phy@1615000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm6115_lenovo_j606f_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm6115_lenovo_j606f_begin,
 	.end = __dtb_dwc3_qcom_sm6115_lenovo_j606f_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "usb_hsphy", "/soc@0/phy@1613000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm6125_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm6125_begin,
 	.end = __dtb_dwc3_qcom_sm6125_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "extcon_usb", "/extcon-usb" },
+		{ "hsusb_phy1", "/soc@0/phy@1613000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm6350_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm6350_begin,
 	.end = __dtb_dwc3_qcom_sm6350_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm6375_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm6375_begin,
 	.end = __dtb_dwc3_qcom_sm6375_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@c600000" },
+		{ "intc", "/soc@0/interrupt-controller@f200000" },
+		{ "mpm", "/interrupt-controller" },
+		{ "usb_1_hsphy", "/soc@0/phy@162b000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm7125_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm7125_begin,
 	.end = __dtb_dwc3_qcom_sm7125_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm7225_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm7225_begin,
 	.end = __dtb_dwc3_qcom_sm7225_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm7325_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm7325_begin,
 	.end = __dtb_dwc3_qcom_sm7325_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8150_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8150_begin,
 	.end = __dtb_dwc3_qcom_sm8150_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e2000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8250_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8250_begin,
 	.end = __dtb_dwc3_qcom_sm8250_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8250_xiaomi_elish_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8250_xiaomi_elish_begin,
 	.end = __dtb_dwc3_qcom_sm8250_xiaomi_elish_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8350_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8350_begin,
 	.end = __dtb_dwc3_qcom_sm8350_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8350_qcom_sm8350_hdk_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_begin,
 	.end = __dtb_dwc3_qcom_sm8350_qcom_sm8350_hdk_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17a00000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e4000" },
+		{ "usb_2_qmpphy", "/soc@0/phy@88eb000" },
+		{ "usb_hub_enabled_state", "/soc@0/pinctrl@f100000/usb-hub-enabled-state" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8450_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8450_begin,
 	.end = __dtb_dwc3_qcom_sm8450_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17100000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_1_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8550_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8550_begin,
 	.end = __dtb_dwc3_qcom_sm8550_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17100000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_dp_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_sm8650_overlay = {
 	.fdt = __dtb_dwc3_qcom_sm8650_begin,
 	.end = __dtb_dwc3_qcom_sm8650_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17100000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_hsphy", "/soc@0/phy@88e3000" },
+		{ "usb_dp_qmpphy", "/soc@0/phy@88e8000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_x1e80100_overlay = {
 	.fdt = __dtb_dwc3_qcom_x1e80100_begin,
 	.end = __dtb_dwc3_qcom_x1e80100_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17000000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_ss0_hsphy", "/soc@0/phy@fd3000" },
+		{ "usb_1_ss0_qmpphy", "/soc@0/phy@fd5000" },
+		{ "usb_1_ss1_hsphy", "/soc@0/phy@fd9000" },
+		{ "usb_1_ss1_qmpphy", "/soc@0/phy@fda000" },
+		{ "usb_1_ss2_hsphy", "/soc@0/phy@fde000" },
+		{ "usb_1_ss2_qmpphy", "/soc@0/phy@fdf000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e0000" },
+		{ "usb_mp_hsphy0", "/soc@0/phy@88e1000" },
+		{ "usb_mp_hsphy1", "/soc@0/phy@88e2000" },
+		{ "usb_mp_qmpphy0", "/soc@0/phy@88e3000" },
+		{ "usb_mp_qmpphy1", "/soc@0/phy@88e5000" },
+		{}
+	}
 };
 
 static const struct dwc3_overlay_data dwc3_qcom_x1e80100_hp_omnibook_x14_overlay = {
 	.fdt = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_begin,
 	.end = __dtb_dwc3_qcom_x1e80100_hp_omnibook_x14_end,
 	.migrate_match = "qcom,dwc3",
+	.symbols = (struct dwc3_overlay_symbol[]) {
+		{ "apps_smmu", "/soc@0/iommu@15000000" },
+		{ "intc", "/soc@0/interrupt-controller@17000000" },
+		{ "pdc", "/soc@0/interrupt-controller@b220000" },
+		{ "usb_1_ss0_hsphy", "/soc@0/phy@fd3000" },
+		{ "usb_1_ss0_qmpphy", "/soc@0/phy@fd5000" },
+		{ "usb_1_ss1_hsphy", "/soc@0/phy@fd9000" },
+		{ "usb_1_ss1_qmpphy", "/soc@0/phy@fda000" },
+		{ "usb_1_ss2_hsphy", "/soc@0/phy@fde000" },
+		{ "usb_1_ss2_qmpphy", "/soc@0/phy@fdf000" },
+		{ "usb_2_hsphy", "/soc@0/phy@88e0000" },
+		{ "usb_mp_hsphy0", "/soc@0/phy@88e1000" },
+		{ "usb_mp_qmpphy0", "/soc@0/phy@88e3000" },
+		{}
+	}
 };
 
 static const struct of_device_id dwc3_flatten_of_match[] = {
@@ -738,10 +1465,36 @@ static int dwc3_flattening_migrate(struct of_changeset *ocs,
 	return ret;
 }
 
+static int dwc3_flattening_ensure_symbols(struct of_changeset *ocs,
+					  const struct dwc3_overlay_symbol *symbols)
+{
+	const struct dwc3_overlay_symbol *s;
+	struct device_node *symbols_np;
+	int ret;
+
+	symbols_np = of_find_node_by_path("/__symbols__");
+	of_node_put(symbols_np);
+	if (symbols_np)
+		return 0;
+
+	symbols_np = of_changeset_create_node(ocs, of_root, "__symbols__");
+	if (!symbols_np)
+		return -ENOMEM;
+
+	for (s = symbols; s->symbol; s++) {
+		ret = of_changeset_add_prop_string(ocs, symbols_np, s->symbol, s->path);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int dwc3_flattening_init(void)
 {
 	const struct dwc3_overlay_data *data;
 	const struct of_device_id *match;
+	struct of_changeset symbols_ocs;
 	struct of_changeset migrate_ocs;
 	struct device_node *np;
 	int overlay_ovcs;
@@ -763,6 +1516,15 @@ static int dwc3_flattening_init(void)
 	}
 	of_node_put(np);
 
+	of_changeset_init(&symbols_ocs);
+	ret = dwc3_flattening_ensure_symbols(&symbols_ocs, data->symbols);
+	if (ret < 0)
+		goto out_destroy_symbols;
+
+	ret = of_changeset_apply(&symbols_ocs);
+	if (ret < 0)
+		goto out_destroy_symbols;
+
 	of_changeset_init(&migrate_ocs);
 	for_each_compatible_node(np, NULL, data->migrate_match) {
 		ret = dwc3_flattening_migrate(&migrate_ocs, np);
@@ -784,6 +1546,9 @@ static int dwc3_flattening_init(void)
 
 out_migrate_destroy:
 	of_changeset_destroy(&migrate_ocs);
+	of_changeset_revert(&symbols_ocs);
+out_destroy_symbols:
+	of_changeset_destroy(&symbols_ocs);
 
 	return ret;
 }

-- 
2.45.2


