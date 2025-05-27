Return-Path: <linux-arm-msm+bounces-59627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933BAC5BE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42C994A80AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252BE215F72;
	Tue, 27 May 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku8XGyGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2E2165E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379905; cv=none; b=XE8tlnuQa7vQN5v2AnHUNd3F1zF4wYwn8QtJQVZLYDTE+7ebNUJFX0jWTx2o/XrSHNzdfmkc4IyqW5VBwIqchj0WuJAxEL3/IHay5LU1JKMDlxQT0TYe0eduHRj7nW5r61N/IrBywBfIYjPPIcshQRX/l3gN+KNox6R5+pNY2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379905; c=relaxed/simple;
	bh=KVQpBUxY898OgxHofMwBS3SQRdZueoxZf5ILA+twSEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ep2Zrdwz0E11iEgzxHZFEVveSVhnM+srMuo8wve8Rs73B8/NIcvhBPKuNgYkXqL3VhJanOs0i3kyUsjOtjImwwO+WqfI2I4V9cf0enZ7T59LfhKXkDzHCix3IkW1/XzYEtQxTBXLGgqWAqrLB0ShR7LYfYAnRpROJqIeyowpxzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku8XGyGN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIIahc024529
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=; b=ku8XGyGNM0cD4O2p
	e/nfCt/gQVj1hNBbSv7MvO8P4az+FAp6b9N5ArvkdWR2iW8Hdv6/rvgkpecyuhFJ
	m3J0qfvmSsvPyRmJFA6Y9reIlgYRPoCkzRCT89oK491XFQBQPRJarRMRxVhBkQ0o
	zku//xs6drP+5+obIpRr+iMBYeXz5lT1M3RlbH2nkwX1xfpDGd/HoETNq9goUhXW
	KUxwj9tf+tHBWQdkFJUArrC3WoaaTu6w/0xHk1EOec29EgRILnNtPjRRaGRXkoOt
	T5n+Myo2nl4tVqLczaamkHpP9xlKMPZYUDc0bRVCwFfXcFkjjI13gsFzcjAsZAYa
	yNGXjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549g7c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 21:05:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73bfc657aefso2527797b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379901; x=1748984701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzRhl64Zv5yDqBHxQZ3cj4CWJj0+v77+Y3Pg3G7a3BU=;
        b=mNAdeEYb9OtcstEwdN8tIiyP3Uk3smANzc4fbWywrBr03KCe4lvHDrJ9DX9gpHDHP3
         Xmd4kGXx1YVJgfunpT7RZbxcwKhz+Z4mHg4mWPc4kwZUxEiYJOMzBqVGAaso8l8qnYp6
         BIgTZqBcdy83SftRW7aVJe1cG5lulohfxRsXUIWJ0F/yB/Ka29QVk4mVpIc8CnIxqTZE
         XOp2fgIf9jy42JF/jAgCAz+5lL3XhJzbt3NiWTps5duO8FoNtocCsrDrB/c9DRm8lhTX
         /wmtossdE+zT4zBdgylAnP5JBZor6w8T2IQ5dWZe9XrjSWbPnj5wSAAUE0Z9WG5FQDXI
         R4PQ==
X-Gm-Message-State: AOJu0Yyi/EQGtCmvv3+OxYHoiZL7QFbRqKaYgF40SGRHX+OFyD8BYd4L
	S8V1BFTr14Za5+cCTt7kMppXBtxIz4xaPqWWFEDNTJEIf4f46qPWn7evYu29hrqA6HIQqkAQCMS
	imvN7XvnwAgi0QMvUorqugWj8cBWoGgT8XejRN0FPKwqryiTJxRyXIZqJDNCAq7WOgSiP
X-Gm-Gg: ASbGnctX9AdxJHFMKXJlTaSOsqGIsonq2zRSo29EGG6FF49IZ+X4IVSEj82DAeEjH7W
	RqJSYpnW6VwZYZHlOb/xtiqctyxfwh5kc4t5O+Jgn9efNXkl2YT+y6spZgtGslthXQA/ocubAAL
	meRvnnmm3CwD7WEp8X4SeAUqhLsoXwXoLSF8UTem/P5dVIVQXi2uWRv3aUipS8s2D4XMYG4ociq
	F6VbyhkY8j/EcEBTHwri/kn2urrKdil6nkKZ6fWFe8urMUq8AAUNV/NC4856ExdsS59dKuEAPdN
	nhJl1Yynbyut2dhuGBTIMbvlpTpautgzfjxtDyd/nbLm4agU0nvMtphM7TulCEhXHgk=
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294720637.19.1748379901382;
        Tue, 27 May 2025 14:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP42zUWXhEhoQN5IEHJjKv/vMbeqty1ztD8a25bRQwLQO3Db3gW3dczT8C8Tba1smWx7q+Lw==
X-Received: by 2002:a05:6a21:3305:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-2188c289ab9mr22294694637.19.1748379900997;
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:00 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:41 -0700
Subject: [PATCH v6 05/10] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-5-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1426;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=2C6aI5pd5BWhSTEhtHBak51NwjHm1CBTcKGDwCW84eg=;
 b=+RgrZ3qByHLV/U1fiMG21YBXz3FH3SWPCbcDLBDzvXvrqIQqU26M7grdrJWa2RNyA/AHze4N/
 vb6chONnS/6B31yW7+693rVPVIUjPxlrSEsHR/5RkqyBCWY66Oqo6R6
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: _ok-ZB0LQzbneJUyvz_RDAu96f22uTe-
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683628fe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=2IHzoM5ujN45o2WKKn0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX4eoZTOSG2b+b
 VmImuH5S9PYElTOYIAbt5mxpwBy76RviCMQJq7Dr3lgsBgjxyl9eoMYjBdntwAMmwx5WbyH/tt/
 rJUCI9FLiN0B0Rfnl4w15Bzatsfyyku2Qkl+bJXaSpcK65tS9X+bmHeL73zG8v+JHWGJinzrKya
 7y2j2mdZent97MqXxeF20g44VlvzT6WaaXZh88Lrwnu76pvgMoXO8FbjZhTIeU7tfRzkowkDjHo
 x843oHjH28Shl19tzGdVX12VCJfpkeR3k8SYTfqvohMSLMW8KxrGTuMBBlXmiW4hcgzz7oQv7jO
 GldAfzZzIWrznnmURZIoZpVd+KjQo+j1WQA1UcllChDgzsb/n7vOkmeowBMyBvdd6WZPzqnKGuO
 40Dt4onOgvwKFIGP2VbAqkkvMXSEBp4nkTZ30/rCKqkSKgDeQ97dFIYBYLZ2fz6OCHG7HGw6
X-Proofpoint-ORIG-GUID: _ok-ZB0LQzbneJUyvz_RDAu96f22uTe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=940 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index ef14f4e33973cff4103d8ea3b07cfd62d344e450..85581b40e598814cb27d954e8c63eba809702622 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -126,12 +126,12 @@ config PHY_QCOM_QUSB2
 	  USB IPs on MSM SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater is paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.48.1


