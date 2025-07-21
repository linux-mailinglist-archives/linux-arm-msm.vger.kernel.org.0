Return-Path: <linux-arm-msm+bounces-65960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F65B0CA8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 20:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547DD1759CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 18:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD3C2E4260;
	Mon, 21 Jul 2025 18:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB0spFK+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED712D9489
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753122598; cv=none; b=aeBHn9gTbeSYjFl8aPwGs99jMpxued5u/vF3D8uT4VuBARDE7h4eGPIRkLXh4bK9xPyh3Io60hfeOoiECMltrANhiJhRQy9BgfjbVQlKQiBFE61VFtcgx3Uefn32h36rIDkgMs+CnCsrB/TFPO8AKdwv0QJsvxbmX5cA2NgkldY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753122598; c=relaxed/simple;
	bh=wwP0wgs37G7SIgdBXKyajalMO8uencXdkJwBMyqMQK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adepdzz+i3fsuM0PDsI8Y+tn2x2u0NlrSMKr0M+XcYez51j6w8LXPN+RdTR7mSkl1ynl5ytbokU20U7vcFzZxYCX48kd++FGcyfiKmC4qiaUkxkWW5kusv8+d3V7YwxdPXudh+b4Gg0YDB1s9M8uG7zKQmr41vSprgZjY7i6/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB0spFK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGKKJg005502
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=; b=nB0spFK+PjnDeIyN
	tEVwVVrmb/XJMeu7DbvyqmqHj5xRUC9wBSTAMGPsS+9TnzaGno9DXR/slXcn4p8u
	tweAsIdxeNPJ2zXt2QOH54oa4JCh6h0hR7PvrSpT2/mYhL/VQ3/6N9cJ7/9y3LPA
	YzmgVwTLd1O+QLKvME42UWRA6h5P/9Bt6f7eafed70OWmdq0Yz5yk+15LDErSY8j
	0B32i0zfbQOkZJPZO2965Z8GKseCXEprzP9IM8YNbKDiCYk1ZIHJ5Kg/hbk2T1DU
	fPIGcSIVFSIGH7WwoEnFhYWjqjdJi1glv9/k6maVxASgq7oimgRhemVnBTf0FNlM
	f9Z2Qg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q6v5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 18:29:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so3071424a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122593; x=1753727393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=751t52RdbCcwhdqGfw2MHgsiZQ8ax24R2DVj0BioALo=;
        b=HQzaeSbIVQ9TViYmO8Otjf1c5MzKQw6Jew6yMSCPHvnnQh4ypIWVnLJiX84UA8iO2q
         3rgz3UugbLI2CXSOsirOPNsjVOQpNxcdgmVC7g8dTQGCgysMOUXdO4aOfO5HiHPaV/OL
         3UvPPp/k9t5McqxSiBIwlHNaLBjFhoDO8hvZCDTw39pwG02mYBQhx8KI4sLY+ruFlb3t
         92c5v8LoEcWfNCCyaYSbkYdOaCHn8jL0ocuLT5hqc5ObR8+w5GClRdHcc92XMoy6w2EM
         5oQF3xErC7YuKf2QspZzHzHEvjq7uG2bElV/kV7wP0tdBC7f95uv7v8GSOy+ZBL9v7uz
         tNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUumZbFcHadJWgV+MxhNUh75VZSFlfhZMKt+rr0jwGfo0Lq149PuiijsQyecK9L7zXrT1IgGu7MRC+lVeFb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5V1yH555mUVxoSA/AwyKBG1+jqkjZUcqnws2zV1CuTYGyEtf+
	GQ7+UHpGduESqdO/BUfRM7CAyKYUo/z/DBBpXkIVRk2wjtkBXcnu/q+i0cYeSYYtOE7NOyjaork
	GdRMKgws5pmVuvFCo44XahgYk9/bWb3+dmqc8bDGzVItHKnQvRSsqxL9c6c9i0ba6xEMC
X-Gm-Gg: ASbGnct8QRp6pH9ZZb0rcpN/q4f1VNfnOxnJb7IkMStfHmCY8nXdJoUt5335evLwTxL
	vJ+E0aS8UPMczLD9RDVBWOoazx2ZkPSiDjn9BkBY5RXj1muEFyZ/4G557ECGxhYooH1edNqgHsM
	qZ8TjW75qRigIHG3+oynns1heKKXbqNAi4a+6igQjxRHDz0I36p/fTaKSCsUh0epTvNRx9nC0Hq
	UXfykRSpgvAUO/XLkEiVIIHxtBRndYTigbmq1SS+12LDLUAAyS29otdEeFM9BmJTkv+ghtjyG70
	gX0f+ij93HDjD3ifHvA/vXnMy/MJwYTYBx2yx+qKghPAZgLtlBMw4tUFLDq2N2YEq2HtPi6cXGn
	S
X-Received: by 2002:a17:902:d508:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-23e2568616dmr307650555ad.10.1753122593209;
        Mon, 21 Jul 2025 11:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEA06S8TFKinv9Wu2LscXJSqCUObI3Wg7g7JStQknBcI4tSz1lSz4wMjNrNt+hJSekJoZkuw==
X-Received: by 2002:a17:902:d508:b0:22f:b6d6:2737 with SMTP id d9443c01a7336-23e2568616dmr307649995ad.10.1753122592735;
        Mon, 21 Jul 2025 11:29:52 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:52 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:53 +0530
Subject: [PATCH v12 6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-6-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rmo18nL+UB7XAtgXRRqne0fPUU/Z0j3760cEPwsemB8=;
 b=HjHL91oAOUytvzZi0mEKgI8wftmZvhJIdLx+TWOHJsBmGlSiXAn+3kblN7JMKgSlZJrb8QX5I
 TW7FqjUxLbTB2KM7UkhtL0NpuEmetwIFdB+tykDB/f5LJN5FI+hRnRY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX1TfgXeF5zSI6
 5rSuo5rlj2eMIlBgPrkEQBbt51a6p8SXBIKMAiu5L+jMdZr5LqmRNFyOfIsDtt11b2uzBIeeHje
 Pbenxrx39gz0pZE5SDM2vIz+Ek9IbPkO3BcwY6ZXbmeydgh2HWW+A4wTaiN1gnvlKX76SeEyelP
 uSPsDLCCx+SeVnXx+2gaBGKDaSHwff3mbYZ31WnthVxArJxrVzvnMhv5TM9nw3QjDvqb09W6pMX
 fTwd0XaqOS3UNfnDiSCZBW8+PdSQpMVadLm067fqdesDZ2B7S1iVgh4ng9jXzxKml638toqgXxv
 ZeKL1DYpHkgXlNw5/h0RXmwH5xFznpsWlwGwS7OXwy4Qc9DEaglAtTz5bBytQBGElA4Ab0xAHk2
 uQ3NKZvZHB72k+AZb6Up9R4H3mhiZvJbx5Vu7RWL0yJCCf3S19Oaaw6KbzuVb1wAo1twpIxF
X-Proofpoint-ORIG-GUID: qGzY4MpK11vq0kMFgH0DIAGOpC6kafXA
X-Proofpoint-GUID: qGzY4MpK11vq0kMFgH0DIAGOpC6kafXA
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687e8723 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..8cf289a3cfc4ac7014885494c27fb003a7258519 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -966,6 +966,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


