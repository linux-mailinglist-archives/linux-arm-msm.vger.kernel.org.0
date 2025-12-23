Return-Path: <linux-arm-msm+bounces-86377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD9CDA0AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D471302C0C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1C23090C2;
	Tue, 23 Dec 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJW59uGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhR7mswz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B5346798
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509695; cv=none; b=Z0eFNgjlC2VhKxpbkTn3UWZjfcH+VDkkPn9Am7CIuHfGk/EfJpjJYleaXnAw1nl1VG7u50PTLvI3U2+o9ezU6/KT8fT+Q1lb6h7zswxO8cmm7+rDOMiYD4sMW3mV3pM7KHL5Sf/mqXfVZhsfuVsfU0aye2L7nhxNSvvYpMHgT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509695; c=relaxed/simple;
	bh=2o2cT38Ly46xd/419lqAtzNeNc4dO02E+TShPOPKLWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qYW2hJ8qsyHDysn1P4fOH8/BBorm0Zl4RPB8mtNYA2/eZkyrXMy4ycgVl0exJm2dT46WHGWcXSdColjCeM6HaMw7NfFweewPpToqaCAUlBEZd9RROj271lKZCrN92GVl4SpuurNmqvS0PnKqhqNJ0GAWkS5tAOvPvXNOuvKOpvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJW59uGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhR7mswz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEmw8o2116374
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=; b=KJW59uGpb8HkkLVK
	xDoavrn4MmeLJb+PXS0aMTmD105NuKRIRhuMJXXJ88k5I20iGy98cfm9pu1cLNEp
	r5Th+IFHeMFZ+XxFQy5FovEEooftgnFr4tNojHWbEfmq3sU+/e7razRdqO53YORY
	ow2q7Lv4zy0Iv7v600styZbeIVlOTUWXNL1vFRHpaceZwy4PR0earaGHH5DeOipc
	eMkHNsDGBVuyY9cwZFFqU2rPpLCTfAzGq4xQhPt4GJW0tJn+QC17kY+2BUmIiSJC
	StkG23iQYhqctdzgZV3qJQZqfvNWOsaMkUAfdibJCGJSlQuYzwslIux0pvNzAtvy
	jM41GQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudkf9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0dabc192eso114294325ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509691; x=1767114491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=;
        b=FhR7mswzBlXO6z933RUQVlzGPq+QRFOCQRRwpaKHsD9iAnjEIgERryJH3Av6wJczIj
         aZbTk3fXwbBZS60e776IkAHMa8Aj8zzEGlsk+3u9BQxnvtDbmbtBSe7ilTv55mc3d0FN
         Mgml6Bk9i7x5quXYWdCUljr8qvtNwXZfaWs27Cz7qONNmnpfL/JvMkNHChOMll1ByZ5K
         8WF8qTC1qAgy8CP1NeCxoIb3al9JL/B2T+zteon60DhTUmK/ZJRzhdoI/6XCvax9HA72
         s2zfLX0EFr5ULVYNbn2e+iRm2BCpaZ7/ECXNCkVw7AQBZhHhksE9uv797ahvXsxwjmx3
         z+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509691; x=1767114491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=;
        b=aqBf2YSSsDSu6kuVwVaOeNu+prhOzr5nPc4mnBEACjTgM4tWQReoV9V8Jcs46ud7Gh
         Xt8uf3KW+HnMnpZorMi6M5AooAYxBb0B91zRgMCpYwIrIghDuNRvBHbLJDDyTcrj11po
         1513c7tTEUSIsD4LnIHNJLWZ7UvOZJ5MEcXndc0rPlLZoesaH7XoukaIbnJinnDCulL/
         1FVPAcbEhsQud5SdQtWfx/c0AAqIftpot1pX2LzHi9msAKkKuSemUfRCaCdPYNGfb8cD
         5gbUQGgFfCiP7286zwvs5JUnB7aqffQRrU7DG4VtlICVx37Uu4szLq2GBJxVLxVPB8Pi
         E2Og==
X-Forwarded-Encrypted: i=1; AJvYcCVw0YYUB1HCu+LTP6bIlcLdo0G8Ee1CzNqLDmkmwYBzVw9nwnLldEuhxpBM3tgcFeBdC9pLLCvJfRSaMJrF@vger.kernel.org
X-Gm-Message-State: AOJu0YyStVw3wLUgs2e5fkcgJPeCwx/EYeQksHJe8FXzgk5bsW1BqI6X
	dpufBPzbQBU8+NFNTgBTdsYb/VHvmYcQxr0r6I+XwTdk5ddC5S4Oob71qS6UWmkSft44VI3Fhgw
	qMsQOKMLGwAuAXnnRwWeMGGUVyZwmpo2xknD8K1rpTOeMUDtjxPrRJVSbOlkkSuA1LAOg
X-Gm-Gg: AY/fxX7wjuAy3NwakC+cyQsVFnlhzDv+xVZNksLTeayeMRXWSMbOpiGBNjzlmLbPXX8
	8URszNkEnCLBtZEmsR2vyDF/0MiBDVKgnzA7WP6Euggjhp7E+z0n0YqlwT8CefpvatCe8mRMfBZ
	NGNM3MoM/5zx64dQkt7WPUH88YO2ei/fLrFf5MncoHjRrZpKxw4tLip+5BSZJbasRaNzgQQt7dU
	K+zA3E+W5PlwgsWG34Qdubb3YsA7lmKNyw+EeW2edWBMkfHfQx8flIiAJMmE8BRxS0f88EuUfQs
	WwaSLhT79ChcOnfyth+SU9+DQiEu1flmmM0OQM3hjTye6siLCh/y2dP/uvbj9VbF+K5W7HJ+wkt
	jss2nL6JKOn31VRu0TiVkAEoYqxcBFykHzFFvTC6iskG2lA==
X-Received: by 2002:a17:902:ec8b:b0:2a0:d436:e7ad with SMTP id d9443c01a7336-2a2f2832c51mr157277855ad.49.1766509690507;
        Tue, 23 Dec 2025 09:08:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ4aOnLvyrVaT66N/eDSlqnerZMeyA1rrRBgGG9I3JAKDcbQUsSMiZ5xQmSXBqsbJ2CmnO9w==
X-Received: by 2002:a17:902:ec8b:b0:2a0:d436:e7ad with SMTP id d9443c01a7336-2a2f2832c51mr157277475ad.49.1766509689927;
        Tue, 23 Dec 2025 09:08:09 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:09 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:33 +0530
Subject: [PATCH v18 02/10] power: reset: reboot-mode: Add support for 64
 bit magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-2-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=7589;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2o2cT38Ly46xd/419lqAtzNeNc4dO02E+TShPOPKLWU=;
 b=ErA8eTOuOFOVhrWwNxeIIP8Srfsn/pUO1IpTWe2NedElfQ2IN4YB6eCoG1OL1KxxLRWA2O5U9
 jE3AMKHa3WXBeBut/eiy7DVsRaP290clHrPDEVmXVTJPn/xTrYR/pwP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694acc7b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZdY3TYxf9UxvAHJeCnH2HNhpqFBhALOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfXznA5s9gyipNF
 keXFUJBTHk9FadaX6xkizBvHWHmQmU2kIGI9pf4CmU8xL8GrogPjrnwvy8i6eH3QptWWYhRxb6x
 VE+uGj2jBLoaiGOipnyYdyaO0acAjymhx0syci1158oSAYdWRRw5IvVtg+n9ugvDhJJ/ZhPmJX7
 IH+KwqKgqM12e6AqofLaK2jJHHRDxoOzXE7YykHf2U/4wnUb4/Ir0zh26dHUJWJSsfXXLvSY43U
 stXrVBRR8b/oX9BUI7tDItTKT7OvLlG4AukO4gLQ5DXZs4TLaJ3/xta6lM5yTdxRc4ZXAmGNDLa
 ufKkOjr6WQ8wPT/zB7TX+Vdz3EVWmwKxqLtmIL83Gp8/vgqA+rBdNXtCjd6J5JeSG2WzVZUTyuM
 v5E1EGPU/JcQKnyyE/gd/aXtTZKMMyHX+PEuF6tVEjqE6+M6LFOg8jYCNhzfxDu08uba0wlrdje
 JsSh4Nj99Aq/NyXwIQg==
X-Proofpoint-ORIG-GUID: ZdY3TYxf9UxvAHJeCnH2HNhpqFBhALOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

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
accommodate up-to two 32-bit arguments.
u64 magic
--------------------------------------------
|    Higher 32 bit  |   Lower 32 bit       |
|	 arg2	    | 	    arg1	   |
--------------------------------------------

Update current reboot-mode drivers for 64-bit magic.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++++----
 drivers/power/reset/qcom-pon.c           |  8 +++++---
 drivers/power/reset/reboot-mode.c        | 24 ++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  8 +++++---
 include/linux/reboot-mode.h              |  6 +++++-
 5 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..b3d21d39b0f732254c40103db1b51fb7045ce344 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,17 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_arg1;
+	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, sizeof(magic_arg1));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..ccce1673b2ec47d02524edd44811d4f528c243e8 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,19 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_arg1 << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 4b6ae4007c4f6fb7d51520b4be2bf3cb1dff518e..54adcda57e44edf2fd2cda0f752226f747aa72d7 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -17,12 +17,11 @@
 
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
@@ -54,7 +53,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -77,7 +76,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -86,10 +86,13 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (of_property_read_u32(np, prop->name, &magic)) {
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
 			pr_err("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
+		/* Default magic_arg2 to zero */
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
 
 		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
@@ -97,6 +100,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
+		/**
+		 * Format of u64 magic
+		 *-------------------------------------------
+		 *|    Higher 32 bit  |   Lower 32 bit      |
+		 *|        arg2       |       arg1          |
+		 *-------------------------------------------
+		 */
+		info->magic = FIELD_PREP(GENMASK_ULL(63, 32), magic_arg2) |
+			      FIELD_PREP(GENMASK_ULL(31, 0), magic_arg1);
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,18 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_arg1);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..a359dc0c6dede0ac5ce67190a00d46a7e7856707 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,14 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


