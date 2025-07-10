Return-Path: <linux-arm-msm+bounces-64331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27FAFFDDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23263AE160
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD322949F5;
	Thu, 10 Jul 2025 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuFpUYcf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D1293C75
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139091; cv=none; b=lsX2jubvWOAxIT/HS45chCh8xZYb9Fw/ixca2Dq0UhM7kXpwAflHN9hggV2EaA8UnA3kbAUgQU3PU3MOB7EQqKhzZ52hXFtUqINR5bIuotEse6uybPUCE9cysNNS82rqOJniAVt4k4GzqUM4m+e3LwZCQjKpTKTqyeD5tDg3+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139091; c=relaxed/simple;
	bh=sNPObCAn0hHlmeXuawxrFyQE6vuwG7PdJUJ999/BvyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUyQgsz0OKe/qoVfYvMgJQDzGjBQErCPrT2Uagx6NbmVSKKOYQ3tbQl+9rYzXU1cLEUWRuv/mmR+TT/gjkmFudgXftiMiYvn7NDu1uHunaDVq8qdi/ZAwc5vrHJx+rLiKPitn+znIEwLQJi9JlkLRdIGgCSlhcWX6aHl5Elq5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuFpUYcf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9FNT8011560
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBKj3/crUvYp4Ips85Vws+1r2KlgFDtGQkXcgWnVP/g=; b=BuFpUYcfun8Vz84J
	pQVzInUwJbie1KwsmBsVwgfqtoydkX3bU4J6CPTHbCijc/jrxpUUsklvC45H7zoo
	resLbWnzGbGbhwXIBUDRRSK3+E7fQ8ZzMGyj6riDtHsXvrdnIUQAYkAiR9Hg8+kH
	94jMFaC+g3gd8x18/Uo2tc+U+xEniso/2x70Ho6yErR2Tf/a9MGoxpcVPvdgrjqS
	N5tZUkkt/2drZR9/ffl6PkDZg61/lsxcbNpUjMeNXF5kd3695KT+eNqfHod9y0WL
	rBGymV1q4fqaccvOQe/1n2B8W2lQ+bDLZdgazSQYDsq+vsZ8H4ReDjMMfgn2lFJP
	a+TTfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafmatw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so8419475ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 02:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139087; x=1752743887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBKj3/crUvYp4Ips85Vws+1r2KlgFDtGQkXcgWnVP/g=;
        b=Ndm9ptXan7hoqUO78rDvlwI743MTuiAVnQBxpk9qR6xoFDU/6UW74sd8XKLQe1nUoR
         myBej0cZwAcAbr3ayybSYgiTKK87KkulaikhLCNwoppVS4oxh6cMxU/JAD54fBXDylwI
         BbX+fJA6/XwwnysGmkrwDmVX3KU7b7icinPII8n4cvxrkLNdiolqOWJQGlGsaAQw+UrL
         xPVjCFCZ4EwindLBwGP6DZWjxNpi478p8ILnFSYE6hfVMLJJUIax+mByupuKHxGwhQlK
         H4QxDu/AY1v+Nzjuq6wc8H5urToO99RWp80BWbZAZxzmUeYIUhSr0xSbz9IL/FrGm4Ka
         73xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGX7Lxc62/AQeAElzHn0OdlteG/kQy9JQsDGvgjH21ael96PIw5IqRTSxKzU0fuAZzB5hdXUI9VPHSM3IS@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+cD0W5GwPzyiGU2TdEknIqrjtXs/Im3ub9myKBm/bN2kAf/q
	EnYR4P0KgzbK/xvOyQwSshm+HzAAfU5AfYQiSAZn+s3kATQHGOq/OUESUUfLfac1RCHggHDai9h
	y7j/k5Xn2MGKb2FZ9IHTP0GVvkivJy0UfTM4bsK+tI9+lzyU4TrlsqOsPmyWGnxRGyNxz
X-Gm-Gg: ASbGncv0uMZHdmNHmREgpc0YGFXBOuUNV9zvQC5YdGuLfl7xh3WEv1s1QyfVYhjDR1q
	okkq3qqWAp2Cc8pQhjt7u8rL58FPPez7oZUFiBZMeLYlonG1iLCsfuPbRDj6oJK94UZQpy0vma+
	Y2fnwop09uaIPHip8INwRnAv8vUOMOZwI+rXKEbx3wpqVvPYvRHtswohD8hbPk1RKIUaT5qINBD
	wiNbqG+btLhIyeN5HOs8TK8bEcLF87qvbP7x9hXwtTiXnM4wObqmLioTURCX2SdGLhBUws3yP8r
	gNKx3Oc2GgDHEsagto/F5scakpfJ6m/kdbmL4zUKMAySl3MYR5lB6qR73rw=
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26726125ad.8.1752139086645;
        Thu, 10 Jul 2025 02:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3++zCHPG72HaamcNpmeO+Bll209rYHNgNyYOmL53l1Ne2aXD9CjDh3cQHGGPnX41YVpDvag==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26725325ad.8.1752139086179;
        Thu, 10 Jul 2025 02:18:06 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:18:05 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:51 +0530
Subject: [PATCH v10 09/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-9-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=2284;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sNPObCAn0hHlmeXuawxrFyQE6vuwG7PdJUJ999/BvyI=;
 b=2a7c4y1EVymbu2XIDK/bSBzOWXavwNhKH+7Kgou3PJREQpHdjfWF5P3WklEYYjhjkesTJleCj
 E7fEUYVuTpACaFQwTlNOMKw/oaee09IuFwlJ2c2sTZy2gFGks/QjdBN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f8550 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: TGMFAKufSmRDsxIkB6tIxYTTPmpCHbX2
X-Proofpoint-GUID: TGMFAKufSmRDsxIkB6tIxYTTPmpCHbX2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX53WtmKvYuaVc
 P8Y5vZhMgwefMon+HQJc361WxoT2pyEKvTFR7EBrY1Vs+JhMT6e5dRWKD2R0tq6f+2zmGmItwRR
 z7BqZJ0aZeTZb63D9VC0f8PcsNYd9oQ687FiRyADHT4Sedv15kT1Ah/FKtxzbdNXhCUWnJFEf/M
 ysmQT1EwFn4Sm0htFRJjh4oHPh4oFqAlYIw1Hcl6uO7ct/Uyhq6MnqQI5SDb6pa7h1s3+y/hZ49
 Bf4+aWDavMpTON+0enLRQAspdlmkOev6Ovuip1I9c/m+M36I4/Mbz1K+bq4fLw7vTW9JQV96lTX
 LbCBzwQcn3LFBYgDzW2jqlG8TPiD+KhAdvySNQrqki3F06KFtACOAy+UwnDLJuTXkxvWjAyvSmk
 C23OcCHDLOIJKTZZ9I487luZFgH75IWVVFyTjiHIOkV+c2iqLOO58HlUfiZ2Hp4glTUiXQCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
a read-only sysfs attribute exposing the list of supported
reboot-mode arguments. This file is created by reboot-mode
framework and provides a user-readable interface to query
available reboot-mode arguments.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..bf49e6c1dee6f48d791987a50c3d0b349e6714bc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,39 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		July 2025
+KernelVersion:	6.16
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a comma
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 normal,recovery,fastboot,bootloader
+
+		The exact sysfs path may vary depending on the
+		driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/pon/reboot_modes
+		 /sys/class/reboot-mode/reset-types/reboot_modes
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


