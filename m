Return-Path: <linux-arm-msm+bounces-77289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B4BDC7FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9FBA422D8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABAD2FC012;
	Wed, 15 Oct 2025 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVbfbNGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FB2FE071
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503149; cv=none; b=Dp4B9D+ZpiwZll29/bZL6diKQ1k7iKwlMrM2+FcVMJzvTfT6dyKqRwr5dTTALEKtMe/26s0h8o/PxpYMvfOqMIrAv43W/v15A9pKm1096Jq1uWeWT/RBpaYA58aH8TSTtTHZfqj48X3HTQAbiI75eDHaQEwYyW1gyoeViN2s8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503149; c=relaxed/simple;
	bh=KFgiW8gV17tkLoapLwqyOAY0szRkrPgc6e7FXqmO8tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ubg0Gxo9pnbLN8rDhfr7qWXZyu8tcK4GzmkWzL/UzSLvi/mn0qwMM6PmK6EdL4fo7AurstMlb3BpkPCe8AtJV10OZvXBqY1ToPjAfTL3jbcZi8PfPEOTvsulRDgpnJ5E3lPkluAFYcJ3/wUamwNBpjIFDDKckdjU0/wrqU/3jFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVbfbNGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sZHr003755
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrOrNsgBB4ApEJhsQnAwXueczH37teuImyTZcRxvw9s=; b=eVbfbNGpU8zcYAVW
	GPz0AtqXtTw8qfqAx3aL6Gm1Ykkra8Wn2LmzG/Yj7U5FXmjlxhSnUsRFKXOBJUXP
	ckd01ra9HbgNQIuDezYW37K/GDAFPHQHDDsoWaCn7NeDYZdhVOBnOVcTs6Hhd50w
	Lu4fQDgLXKmvTRsU4xrFP1e0Ephu627Bbz1ydWEGF8oMZ6trnoHIoksHMOgnez4k
	L8J/vLGAy6XmLlkwOpA4r9tMwxEQtTOraRk93FvA91WDUHUUvy0DMLhn9OHjdadt
	Pav32PCq8hldiokCuePYRsM88Xfcl01/BPDwEOvwudFwcAkUoMblnL5uELtxIBMH
	jA9kig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9348r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:39:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55443b4110so402444a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503145; x=1761107945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrOrNsgBB4ApEJhsQnAwXueczH37teuImyTZcRxvw9s=;
        b=Y8FVMq4fgXmfQEx/7WzhNW9lAOTRIC7KQc2Jb8mQaGVlWMAQcCE3zqHoScBtH8fqZO
         YqSxgFAtkEIglKLbFybRMWm6j8YWGHpwcC3K+w8AWZm/Dm1w3flo8NgmbFNLjbZxRc0n
         xwhB7rb6bqP0Ie+8okYm4J1O3UcxgTmj0kSyjzxcelO3QG8+nXpiB+/TlxMtaWFrKJNf
         A0aj6wrlgVDzsehflPFmri1suJg6wsGJQr9bo/MAiAfODE7m9/E/3t3SriLPiB9L3BMc
         o16eOoDAoKjacn963LrvfWDJ0YM6p0KGp+Z368UzUiYx5DAs26FNR2yPbiVeA9aUU62o
         ek1g==
X-Forwarded-Encrypted: i=1; AJvYcCVV+DFHq7lFyjOoNVpDWeSeNsoyv+HlI0RDDRCIJIXOAN7BdY0EdansgYI9B8S2n3+JbanpJ4jXMimKT+j9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WbvT/WvZXj/QwP6ACdVJNfm9Km5tvlG8sFAqzU1CoL6elsxI
	3o+CqGbvinxMWyLUoTAB98xOSJh+OkSkxD7nr3tHTaRxtHJHrXlmgq43nney2Tg0WMECkPFRmNr
	Fqdohayv+Y0zTGilb1KBqV4q64Xf4ggs1D4l92ktlGnjiTCphXgQvqlE3ixj0OBbtVAFA
X-Gm-Gg: ASbGncv0EL1AL1x6nkwf/sfwxh92vNAqLeCNBlbqkRJMH1TCknOnFy+SuuGH48RqqG9
	b977MF3/sQ3Ij7fVYBR4NhB+XOhSBcwikmwaJUISPTJvQNA5oJsASDtxy3shSBTdzXF3AroP44O
	o+2c60oKz06VueiHbe0lQ+gamQoiTVckvIy7G0+EdwF7H0N5si48/40TbDzzLWpqw3Ah4Ji/OZu
	oAyVK1WXG+xxh4NAsVaK8AjOpHHH6UOl9nhbHV+SSA5fA8SP8J4u5akXXOr4sIhxD+UALkMad3X
	lK82TCwPiSGnXSIDimDu7vzmo4+ntwfbbUAZydpjWPFZLJJ4oT2/++CQAxtmL3QXx6nNQue5Ry5
	a
X-Received: by 2002:a05:6a20:430e:b0:334:8d0b:664e with SMTP id adf61e73a8af0-3348d0b691fmr161604637.19.1760503144569;
        Tue, 14 Oct 2025 21:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED3KT6iJOHB0QR97LJwnEFVWmCUIRvccoaecK/jxZmN5wve0OZM1pA9n7IiCA/VdzfV9Ya8A==
X-Received: by 2002:a05:6a20:430e:b0:334:8d0b:664e with SMTP id adf61e73a8af0-3348d0b691fmr161571637.19.1760503144066;
        Tue, 14 Oct 2025 21:39:04 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:18 +0530
Subject: [PATCH v16 03/14] power: reset: reboot-mode: Add support for 64
 bit magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-3-b98aedaa23ee@oss.qualcomm.com>
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
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=7035;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KFgiW8gV17tkLoapLwqyOAY0szRkrPgc6e7FXqmO8tM=;
 b=vYHU640Y16ueIfSEsXx9ZkAmLg1yZeeXz7AhUc80IUcqyjYAZTjRXXEIYxLt2wTSBgb409YGb
 BVxS6XyIC9+BBxWrgO988e22RQvhoJmf3T+IfiQZrnY/PapgeZ/Ej/7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: NrJzufPVpAAl6nbqU1tZMIwaSVSz5EX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4GZR3MidK7Sq
 cosQAx4RI/s4f/OzkhZRIovWXgPqyRKtofK7NC/MfWa4pox/T9hN1jVXRhcbXV1GDiZtoA7Ty2q
 vXeCEK9ijx44sXv3oP9KVZ8nh8W/J+kuuyG1WzIc9HFGGhCTkygxAuo713vukyj2MFFd4Cb0SFV
 PQ7YFV4unU6/6LV0gUy665GPUOW5L/7mQrG99gIdG/wmyoPE0jebd9JibNRqYdNX2PAyKu1idP7
 17phpPUCtEmIzIWQBXms8FqUKCrLEXMgZZMDPof/AezHc0/e7zD60HR1JJye1vhtpZbuuaSYbb4
 B/9qRTmScB9lAhQ3wPFsmZLdv/ElvlWB2pPw7F8BJ5Q2w0aH1kM4M760/nggU2hQRYquQz/Nwl6
 fmdhHVrf9l5VhKKl7HER6cg50cq9Ag==
X-Proofpoint-GUID: NrJzufPVpAAl6nbqU1tZMIwaSVSz5EX6
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef2569 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bqVjg2-MoX4cBg1ZSeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate dual 32-bit arguments when specified via device tree.
In cases, where no second argument is passed from device tree,
keep the upper 32-bit of magic un-changed(0) to maintain backward
compatibility.

Update the current drivers using reboot-mode for a 64-bit magic
value.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
 drivers/power/reset/qcom-pon.c           | 11 ++++++++---
 drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
 include/linux/reboot-mode.h              |  3 ++-
 5 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_32;
+	int ret;
+
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
 
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,22 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic << pon->reason_shift;
+
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_32);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index c8f71e6f661ae14eb72bdcb1f412cd05faee3dd9..79763a839c9b0161b4acb6afb625f50a880971cc 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -19,12 +19,11 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -60,7 +59,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -84,6 +83,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	if (!fwnode)
@@ -108,12 +109,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 				goto error;
 			}
 
-			if (of_property_read_u32(np, prop->name, &info->magic)) {
-				pr_err("reboot mode %s without magic number\n", info->mode);
+			if (of_property_read_u32(np, prop->name, &magic_arg1)) {
+				pr_err("reboot mode without magic number\n");
 				kfree(info);
 				continue;
 			}
 
+			if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+				magic_arg2 = 0;
+
+			info->magic = magic_arg2;
+			info->magic = (info->magic << 32) | magic_arg1;
+
 			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 			if (!info->mode) {
 				ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,21 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
+
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_32);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 7f05fd873e95ca8249bc167c21aa6b76faba7849..3a14df2ddd1db4181ea76f99ef447ed8368a3594 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,11 +4,12 @@
 
 #include <linux/fwnode.h>
 #include <linux/mutex.h>
+#include <linux/types.h>
 
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 	/*Protects access to reboot mode list*/
 	struct mutex rb_lock;

-- 
2.34.1


