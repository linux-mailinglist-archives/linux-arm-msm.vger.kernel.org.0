Return-Path: <linux-arm-msm+bounces-77290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D216BDC811
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A22DD4FE22E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE8F2FF170;
	Wed, 15 Oct 2025 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbXPvs1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C92FF64E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503157; cv=none; b=pryQKYEvqekmaLSjI9KNa7r0jnP7IwE3JBXzM4o5kXaIRfPqvm/uStVnDNmvhFGTI9Lx1CvSyAE261+aaWHoUcGQhD11/lSPysJXzEWHHIf0j3tZQ/fX53AJFm3tZpgQUzIu+5n66Jpzf+uCD/3oehxkQuTlxuGe++1FphwZf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503157; c=relaxed/simple;
	bh=KkC4QSxclwx5Tk4AVwolzQwcYruXvNFOfpqU998deKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQWozqvrDE0/HIoP6X2p5DRrctjxaWQwkyuaT4axCRJsk4W8NREtruDXahb6cqtrTHNm4ch+QGtObyC7q6infkswXMKeFAsaj/uRjDU+7649YpTgcrcOr8x4vZNQZKl+CJSF3fGTXr9m7xO7y9n/jY8uIsk+PMLDlRCOxxbUGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbXPvs1s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2snZ9010182
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=; b=cbXPvs1sDHgld0fG
	QqpifzS/Mk/1tf2zVQOYOazzoiLXk+PRDNQlf8XOMjiuH8IgFGcCYaC4eTGz54/n
	CLtl5v20hoRXSiNXqTnJHRxCxd84xUq9wOFVPnbYuf1E/XYNNzFhjlFv9sQYyt6s
	qmFFgXXUIKXOlgUNOATyicjbCT5wlpa9xq8H7kvJQ4Gdm5ar8FCaFBesqlWc7SfZ
	57Br/g8gCKnGEjkE7V7ybGSh6Uom+KJwKRJFzHSl5PUem8DS7J7UxyWsjh7YGreK
	dUp89ifinUJ5qRvm3x18+UtOux47QgPCNyg8bf1U2g5PiNVgv8QK5PfyriAtWRZc
	2uCFgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c30sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so108977915ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503154; x=1761107954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zriVHHzMQQ8ELUT932V4l8RDRcEXWAm2X8YnUX13NY=;
        b=iIjCAV/O43Edidg+QAKspdVRjEIXIsouq1uYo0Oy/is/qL/1w+Wy8SLLBwLet+EvUI
         Dj25kVCJ7yk0FqAkdB5JJX6EvHeQNJt5ZE0QnXiEdPg9MYYc8ZIDLknx+/2KWEAzlfuC
         Q9XSxVRBCxfSX//g4X2rbn9sn1kISJit29flJz+1FgwlNosex4FENYCIvSrawnYKDW7i
         9CRhFsYYlQlmbDgynHkwYkPe0Q83z+8oinqMSS6sB6g5J99r4aI0Gk9RUd2T26hTUTDl
         Ou15dLxaW9WDumnnvK99urNGKfumtzZmldF1UEudmSkpsRHJBn3f1oFrmBjY2qGgW7Tr
         wZ4A==
X-Forwarded-Encrypted: i=1; AJvYcCXu/5xOJtN+R6BRnUpv1Nlkfdt9BmMe4PYPtG0ScJ6Ens7ryFycKfW2Js3NxmX4uIx6QMiV4/+Q+WjH3MJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEsMew2lM8cnpr1FhNAOAA7kfzcrMRvcCy2K5ihgMpmP0YVdH
	h5jQGTHvnkSCzmhUIgy0AgJ94B4RG1y4cnvjAh9fCJaXWRSeOacz2M6D2QsKuaLoOAiYXjD29mD
	XonYp3hyDlPZ5tPMRJ8Ew5bZyM/JgceKsb8AKXe62V4QG3MPv0WzWxr1oyv9iFP35ClAw
X-Gm-Gg: ASbGncuBELBeK83tlgwXAM2r4M2jActH6H1kTV4r/s6ku7Y10E3+weBx+JM7+nbVVuq
	PHrRSVt+Cf3Pyv4apQ2j/pL5E+v6XHPwN1uYUSaXw0cuiuDGQ+ivHD0bJskWtv0ViNfsmWeDsUU
	8bMXkwYEhEjfkGxcbb2nib/Eh4UfkZdVAbPZlLGegbGFhNoRYCDGryCMlOIEbIL6pYUek7DMyZ8
	XGkAVhTNprZg+YTVqNBKTg9/uzLKViy/JSa2ko79l8twckt6X/OzT0tP71vXrTibypteqUXXYL5
	vucLe+joMnFSBFpDVwf29TM8FhqPRCfOGd0DtHPEi7YWtpZ+porUu7K3cNdv17/bdmR6wUKlwwq
	M
X-Received: by 2002:a17:903:1a2b:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-290272167d8mr343984425ad.10.1760503153715;
        Tue, 14 Oct 2025 21:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD/q2ZAyeonVx5Bl1SpVHse69Gj4E2Egf2d4zHl0TDjVXVsdjY7bQQBwsO8PFsGdYg78s5JA==
X-Received: by 2002:a17:903:1a2b:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-290272167d8mr343984115ad.10.1760503153214;
        Tue, 14 Oct 2025 21:39:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:12 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:19 +0530
Subject: [PATCH v16 04/14] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-4-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=2381;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KkC4QSxclwx5Tk4AVwolzQwcYruXvNFOfpqU998deKY=;
 b=ZZwqtg9gVy1w3/zW2svJRlN5sbGqfaom+icR4QjkzNyB1j4w/IVVyTvO8fBI0HPRCUa0b3EqR
 9kxmtNWCmFNDHs4zr97HOYv/TnV4I+0Ghy0HeurEavrD1TNcxLRLLG4
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: g_52VkUmWypfZLa9Q6mXpHMz_k26qaKt
X-Proofpoint-ORIG-GUID: g_52VkUmWypfZLa9Q6mXpHMz_k26qaKt
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef2572 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5CgfHzhl2afHKY-Ush4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX+yxWvOdxJ0KO
 3IhFA9ietNEEmQPv/J8e67UBbI+z8KTEtUZZrcmX1i99dXCYI+zCroIS830HxGai7cjl/SSKmT/
 rFmHGeYJVXIZNHl7VthLxrjuoNK1QoBPUw1G8QsSyuDHSUFS4d9/ahShXMN/wv8RH4hGS3R3Hg8
 GCLQTAiigKG4tGHnBKlEkyRRZV2g0LKlnVgmP4goMvDi2AbUAj86g4S1J+prbqBl07iI+fK2xde
 JUiv2JsxjE5eTiklEkQIGPWizeEwsHH+hKwoxFHvFWAzLYi7hVVWfoMsEfRxyVbSBvYRqMfhXxf
 yRbMBdaHoGS7NhpvFGM3B9vvbN3wMuY6gPTIAjSfMwQBpKy5qnCdM0ujI5AH9R30XU6a9BiotRg
 6JdT4tANFGAE1vLx5+zwoSjIdWJ3Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
a read-only sysfs attribute exposing the list of supported
reboot-mode arguments. This file is created by reboot-mode
framework and provides a user-readable interface to query
available reboot-mode arguments.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..6a3fc379afae3a6caf56ad0b73b1c06c43a9fee7
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		August 2025
+KernelVersion:	6.17.0-rc1
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
+		The supported arguments can be used by userspace
+		to invoke device reset using the reboot() system
+		call, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		Example:
+		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
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


