Return-Path: <linux-arm-msm+bounces-65961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D668AB0CA8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 20:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 231A36C0FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 18:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4252E426A;
	Mon, 21 Jul 2025 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNot2AE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3E2E4985
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753122604; cv=none; b=XFz5zup5EML5DkItExKM4UBg06RnRBxKuqhzXtAJdSxxbUa6ToqN2suYFf32A76RCCOzAwGPKuJtd5CmqXC4zKTVMOZ7/JDd9elyN4ihH30qQPTIprFwN6LbieuMCL/oFVPkReswIZqHPjlFwr4MYRd1Wm7n+3q8Ejeg1HNJeGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753122604; c=relaxed/simple;
	bh=bDYj8SCrzcBMYL0De2l91EChlN4ZQ8qlnKnsadPkWH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDj1EuxUjLu+HE07O4gRqR26GOeI7PvTA1NFubTtND2GTA0umnu26Xu8RkTB5S8+HS72EKtIStfnlUtPZarZ3QyYIa1SjMgOB10ur32TxSlOAB3Clg3D3CgQy+yhaXnWBYXhgNzb/ndWfEaXjPFN0ze1DF4tGRUjBd4xj+B+v+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNot2AE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGupJE015724
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=; b=mNot2AE5X+lLUtlJ
	fUnS3BfpKFpZ7Bj90v3GMQNCk0NCARF4DgF0lher6/I/WSnZ42DJrD9xo9KOGNzv
	2LH5sxsi1FluiEm2/xdjkQ/P+n9rkh7MmW0q6zBu9A4qrzpExhGmZNoIZVE1hZUQ
	JK15qBRcsUBN+fXDTBbBAdoJw/hYNW8+2txn1UWlYcwqhsNjtXqghCEHcDOs1x/c
	DtJcqtQiPaTGyfJdVETmQ0qfDi2b3tMYAxNjbM6nQRUD/XQ19j9Jkf+9WZ+2tlvn
	8tJGquyfU9KF+LfsVrYU6/UHMXrWkMS12EPSwBg3rt/YBxXFJxHAbKbwaBMCRWnI
	gyTBhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451epq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:30:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349498f00eso44883685ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122601; x=1753727401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO1m4Mu1s9USWMxZJk5OY8bYzy46q5JS7Is6cMJU9ok=;
        b=j2O2k3zu8d5snAVuHuiZ8i8PiCAxVvHXfJaqmWNMZU4wM3d6PHEaNhlN7C6KLeFWwz
         mUy21mFrf6VLqWOSo7whK0O5OadIMz4gkCh+PufXgkq3/5X3V2Ry7M0WNDUVQmdhSnfF
         /VWL+sjoM6uibowu+D3GMV2eKW5/4MniPlrTCpDaOp5hMSeDAj0rJWLZ0HgNmL9wtand
         r5lcbnJwfNaAeuBCdtqY8DW3sQZbku+4BNmybp2nz/ZzUnv0Puepzp5BpGBTD/QzxRWO
         B/J3KMO1JHSuT6nvefHAX7Z61guQljGYleIpNmVck0Zj6ErH7JKtCgUdeKD78nFTDA95
         CMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsFEUMyHRg74hMG9egIKKvtILNHo40bToJQgroT+SkNHN1MNek+pdr488GsprWhtxo6ePzcZcKH1YltuI9@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFeHvKNypkxnum1zipanQNBCBdCv1PecDwC7RRhsEsMSmBfKp
	HD2VbHdnUz3EULLsWvPuV07PaLq1/GuafABip8znhkGhWhJJYHDj3dkA31RCngli5yb+Pc1gWYD
	e7oonZT30TTgkmJl10Zv84pX+/2cZs9bOT/lFuHR4H6vJabGwSHMGIdxRFqNJRHtLgNwP
X-Gm-Gg: ASbGncuS2btNeG7nhn+Wg75suPEe6mYldxH6NA6tFlgtmysvDCaIY2nldo9hOK+vajG
	QERjsCxglrBGj7CptcBsOa2vYHwPlowkLD7Yq5ECpapxrxl2t9Oa5DwxVroNriM3p+Oklnq5s9W
	7+nPp4R8yAJY1RnXPWPQakl3xMcaVDNtNaSwkH5nNpOY5kkc52UxI1WZYDiO7mNoCRtrFTogjYE
	5M2T6PkRAU2UJmoda37F7y9Bt7oZJzBe+dJoiIqrw188QN+w0hzt/nnEsO2g6WRAYz9Pa6+mJHY
	2cXOTasdc460UtWYPuNCEtSAm2yktMYID0TxRqe3uLEEx3H0PpC3JeEkQrLQ5ICwKZ8pdEBVcwi
	o
X-Received: by 2002:a17:903:1247:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23f8ac5c086mr6239495ad.9.1753122600864;
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEiVeGtNV9GmrNVrD6U4nu+8UhEiUkMzdQ/98qBAr+cTMXNUdE4x3JFAM19mTP1eT+MB3fNw==
X-Received: by 2002:a17:903:1247:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23f8ac5c086mr6239105ad.9.1753122600430;
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:30:00 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:54 +0530
Subject: [PATCH v12 7/8] arm64: dts: qcom: sa8775p-ride: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-7-87bac3ec422e@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=1668;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nykICX8hQVOI73Pb+LH6QfNsfIbx6Lek13GmZ+0SmB4=;
 b=g3A+MwUIEuwhNYH7AEZ+1Tszhqr06K8jZVVPYm2Soy7Wcl0QigvUOomREQzxuSnNsq9GSDF2n
 TBAB47HabTaB4SXq+0WPD3nEzI4RciQ7fU3duwR5zUVb3BDxCSqUvDf
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687e872a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: lcLNDgvusZPNVWrrIKCm62FRuf7HbPB2
X-Proofpoint-GUID: lcLNDgvusZPNVWrrIKCm62FRuf7HbPB2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX0cEvfeR3uzce
 pPxBQaZDxiKwB09EU2neZUBGCvKU0BUAm6t4DNoHIPOc4QuyVbhElJGxwPBzL637WbIdd2BhhC0
 ERfXW+y+8SWdOsFLQwuK4ZIipAIju7fk7FpHn4ta6JnZtfPCG+9mu8GGdDUPjzlYzQzkGri8DTm
 kB7eXGo0mXuc7kRqB2P3Cbu2Zy8dTOUjf2QeY6utfFJuVsGJS1N4rhD4e2UnpbMY8Xay68ucZMt
 Z36qWZS2nF7O/eZWo4grCBGHkeKo5t5P/i/arOUVACyu37Xeq+TmUfa2OMBe2nnSwhqW7CHXVbU
 VThfzKdqjKBzMc41moomHzK3iHMq8VcbHar9gBWogPAtsbHQuCWutF/rfCeeaupddU4xOoBKOZ1
 59PEw3xJOymOxxRhoh3sLC6ebTzM31pregsVmZ7YkYFKtBWvMAkn7/eHrmuKJ+UJo3hGEpAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
sa8775p-ride as reboot-modes.  Describe the reset types:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode.  "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc15fe2cce58c0fb7502b19f058b80c..b1bbd3270afc65e9e036e8098ae7cec3d3363a32 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -874,6 +874,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9997a29901f57d7894dc1eacb6a809caa427c6c4..52466607035e663f4dc6e5c97223d5c0404650e2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -622,7 +622,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1


