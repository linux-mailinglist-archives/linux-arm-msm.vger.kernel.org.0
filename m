Return-Path: <linux-arm-msm+bounces-82980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAEC7D516
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 19:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33D2C4E16D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 18:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D84329B233;
	Sat, 22 Nov 2025 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyeRt0Xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lq3+Q1qb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B442989B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763834765; cv=none; b=dQldvkmjkg3a7ocXVjmYQHN1zLgn9tk8veiZWBAmsLb9huiNgYsHZ5ckNVX4QybAk8pA1TofwXRF8WD3iiylb2RgVMqIO/WXqXpl/0jPRRLtc9p8r2DJ6BJxxLzviqI6jI5fhESIXqekcPePve9LU2t8CTwGkCD0wl6o42WSqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763834765; c=relaxed/simple;
	bh=usgZ50lsKAOs/daHoCBRLBx0aO1Pg/3aRrkQMCznHx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/DOF83LXFhbIYm5t8amC0QjHIp4bnielM2Y4BQdvfvJMXEhJmMa6orTEwa9RUHskZ8uXQvpqoFkRiNwlKPh8R2VpfRWkeIEnT2EKoogD8GY5hrXPM7FE0BlfbVmewgCCBpY1dgQLlrneb3FXy2yUbNcJes1j8s1ruoX8/piNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyeRt0Xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lq3+Q1qb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMGdlAk3212871
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=; b=YyeRt0Xw9hj+fUHW
	cK4aXbymvgcae4MXMKybcuK9VtwkpziSRjmOqiUcOihCRo3tFeieeselY65R+POR
	fqifg/wufuQ4/U/IHcH3VHngnDcdffwlqGdKi4ednwDrhqLn5fv3SJMXI3+f9uBP
	HxlCSdr9HWW9qrLDeuNX+8ey1FvI9PVvh5n98jRy8tV0yF1fbUc6bivchP06CFNe
	zEIiDK3O82mY/vpYRzjKRcPnTVMDDaWUsVkSivKgqV6iMLj1OcXYNIrxDj9cXRh5
	u6kXj34obzh+3rckjoYXt1sygJrin5/HRcfVWiWoxILfLwMGUb6tQwmhyYDuBJVc
	4vFMLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691h3bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso7198430a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763834761; x=1764439561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=;
        b=Lq3+Q1qbesBV7HB2FdpbAxZ6muNthWb1CpsnAfymHCzkbdlfV+/HfQwbQxgnd1F6tZ
         ccYR+H9zhWuR0AB+Qjgwrd/LGxooWiPLK6Eqd9btFDu+pVn0A2CcWZECncRgbHtcW+4V
         VhoM+lIGNBy6ppn9cpkzZ/WLItA5OoRc309+cj6cWDlOxKffOUuWj5ulsQ7yPme+NpqZ
         1pTbKt52N4NjlkLa9UJec803q3WeuvfM0+nRfIBKpXJIu1z0/yLcf2qHPfFUqADSa1GT
         QYYp3IKJLt1aIAdN2UrHphKkSJPIU6Xbf2ZjSjF8jleDyNInLcR67ojfaWPIz6VZYk6h
         VWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763834761; x=1764439561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=;
        b=MIjiMv2EyisS2RonDP0XYdNaCqwm7oHolfDHF9wJjhV3XOLuZL7nGLmIH1Qpi3SqlW
         9xQpVsmJKnJaghEib/BggbFFi4EOr74V1c28GigIzoIPQ5vF5EzDL7Hix2U/3Z1k1DJW
         dcEVqQ8+E0RwILWBgOrZuo5LEg0/3mOOBKdbmZ25jjyiNJSpbuMcBgBHyccAQTrwi67F
         aOfI9/uccKluDlRzYZfvti2G6GpigbbK/2MGIMHxsb9LvqKsxfWRY352gQEKCgoAAGbJ
         jTKRcRtURETFUuZkosDulG8AYpB79OusNyaJoGGkTF2SGAiaH1BdlaAyapECr7+JPRmF
         698g==
X-Forwarded-Encrypted: i=1; AJvYcCW+OGVfWRjZ7VZUDwbwEtkyf1gqelOFRCKVQE/S72wR0k0XJgV4nFQ3vmYGnJAdQB2ZrphQpakdMCNkR/em@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+crr55FFosBwX8/SLzdF/jV5XlPfuM4/UnH4PBWmDCfE7JT1
	PukPperhya6uqnuM51P2aEgvNdSYJdr61jy9ayLd9sa1zQ0Q3F8P6iq/OzWTtb1pozeI561vRop
	T0sY05r7+4Kuwww1G2Zk2vyYwSG5p3cBXfJ9U9xheoi1IYJSAz7DPB9M/jQKgVxfx98R7
X-Gm-Gg: ASbGncu1u32Dy/Y16Z7fy9r+rui6qqiLz7uJYkI5IMQhqI5qcLFsOy00GYsLeuB23X8
	BUIPPG/QOZ0JnJmA39OuaW0zlSA+mLYi9gvXru8tptE6e1RA8TFuJ246aN2bcIRBtTbQkhDW050
	4y/ODYA32r1AUfXnGWkjFFmX+S6RUXWM+14EoWeJyF12RBkpWqHzQztQTMGRUTxQCoTlOVIFPBn
	PDE/F6U1M3aNXLJ2+hN+qWnspBitV4dJrPm1WEH9VPK8tU9a7wpjwQcMHpY0pdIzhPAcbeMcwXn
	GvmSQVQuGy/iubL3s53uKncFBsuVmQotu3Q3SCHI09u5h8AzP9nm1FxAzwNfvIu9hN3IPCQk89p
	rMpmMHn3dMtFNGTMnV64Y99FtH+4flZfYXvzLZVMmZEfT0g==
X-Received: by 2002:a17:90b:2b50:b0:340:ec6f:5ad0 with SMTP id 98e67ed59e1d1-34733e55257mr5999381a91.1.1763834761030;
        Sat, 22 Nov 2025 10:06:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8Q3Vwhdetg7OFvyAcv7ginE73yeRL9+GumCPtMyoF9318svFS+oZEbcsRUpDgmTAS6kpAig==
X-Received: by 2002:a17:90b:2b50:b0:340:ec6f:5ad0 with SMTP id 98e67ed59e1d1-34733e55257mr5999366a91.1.1763834760522;
        Sat, 22 Nov 2025 10:06:00 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd760fafe57sm8763553a12.33.2025.11.22.10.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:06:00 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 23:35:44 +0530
Subject: [PATCH v19 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-next-15nov_expose_sysfs-v19-1-4d3d578ad9ee@oss.qualcomm.com>
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
In-Reply-To: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763834754; l=2280;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=usgZ50lsKAOs/daHoCBRLBx0aO1Pg/3aRrkQMCznHx8=;
 b=CRQqs+Q/CFiIjzboSpFW8bgjM07eldLYs+opndTcqLPPh6wJQmp08ljteF7qZi0b7ihl22j4N
 s6WEtr6cJRNAcEQuvuJ80jQFH6nFT/gPa6+EzEIDMc98o3q0RHOsoWb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=6921fb8a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LKyF0dicRlewKW4vAhwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: e535fFDyO8AAecjrKs-FmK7LW8uZSSHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDE1MCBTYWx0ZWRfXxSDCzF8aGe24
 gIN1BHaLN6d9/lsmwHEYUAv57Vrpa2Ux0x8lDA24od2Iyd2OXtnjIIEbPqqEa1AngX4AI1925xB
 THFfRww92l3g5McTRZJm9jKCO2k3lE1vNzrhugFaLGS1zw+Me8ho3Z0pFMNkzXAXB6nK6SKWNFl
 Fp9wpZ9V4mXum0ovWOU/MulwmBCPizv9l3KYxwlo1xlMBJxY5Q4KD2omP5AhOgImg26YawesEF5
 is7sYSnJ83CEHpuESlwGfNxYLzrHDDKbQnGWHrlZRCs5rciH2QXeBqLyP6ZSSCN7d1m0cURNO5T
 4SZr7wfTv/9/MuFQm6MKq4Bnc/K4kbVY7rQEQ1sy2tK+aILhnzHB+/+Cbmh4kd8r5UofOgJ7whw
 ha7MR4O6hgRlgK0UeHlVH9wPQN6pow==
X-Proofpoint-GUID: e535fFDyO8AAecjrKs-FmK7LW8uZSSHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511220150

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes, a
read-only sysfs attribute exposing the list of supported reboot-mode
arguments. This file is created by reboot-mode framework and provides a
user-readable interface to query available reboot-mode arguments.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..a50f9433942b8cab4cb3d699e9c0955299ec48f0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,36 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		November 2025
+KernelVersion:	6.18.0-rc5
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a space
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 recovery fastboot bootloader
+
+		The exact sysfs path may vary depending on the
+		name of the driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/qcom-pon/reboot_modes
+
+		The supported arguments can be used by userspace to
+		invoke device reset using the standard reboot() system
+		call interface, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.

-- 
2.34.1


