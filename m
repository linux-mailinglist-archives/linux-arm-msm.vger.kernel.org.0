Return-Path: <linux-arm-msm+bounces-80874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA3C44086
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 15:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3CC13472A4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 14:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77542F9DAE;
	Sun,  9 Nov 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N16ebbxP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rgn0kDz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A262FE566
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Nov 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699113; cv=none; b=gGnpnY+E9rfInAai9kBgBs6dnHiNe/0MHZlgDvCo0y+j5CY93vg1CAANWEiUpi/SCt+jNvBDvtPDblFnWWyLr6gnXZP63f6MRg0aMTaF5PZVjtv6ndOlMv4HBTUzf8o1rfOgyu1s+LMVVmxjgym1CYztvlBtaOZKfUBh7fy4Xsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699113; c=relaxed/simple;
	bh=EQ90lYVfyz+tdTJF0OEbz8TSgTdlKU5QUPgYOVB1ofo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pw6bMR685VE5jedUEXLlOp8hRAiRlFWkgZ/39IyjEJGuSzGlXRIo+kGfu9Gz54aScFQ7P/kG+9bHoSeDU8pn/kVWGcM2lKz74FmhOGUUKB8ybKocBWE8StDqVP5xkKE2ZCMwBNX3lz7DC7C1J/Xb54Y7toEeFNno6ESu838QOQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N16ebbxP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rgn0kDz9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96cjUd3930498
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Nov 2025 14:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=; b=N16ebbxPOt3GpNtx
	jpG0IO/0FkAxRRg6/c8MjDBZhXu6j8FM3svRePT4ztmHzX5UghwK/wfX/t4pfDrp
	jlXybmneV2MDf6uLMfiIDcG5jCz+eYUfYDdvnHDilpMsAr27rhAF3BH2cEb41Ad4
	uqZGGN8Qjmu3R8CPaZhndVM5vLiVcjSBgEWDemrhvUdYWNfL7PKpcK1NxaCc71jy
	ZQhwpK8ZK+mXEewjnkHVb6i4/69OJf1VYlbJIkC03dRboxrSEMB65t7blIa3+pY7
	csTGuWjK5HRAT6Yxr/G96N/ZT8DbU2imiSEEvtpqrMxxTLtbCie2xbQDT6Jr3Zyr
	YjUA+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu9t7d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 14:38:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso375562a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699110; x=1763303910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=;
        b=Rgn0kDz9Y9XM3udPJ78fvxa+ThE3YUFkIU4XEQvCSxGbJr8AijhNYxWww7ANbTgYS4
         OS6H3JHZpw8iQbgrF+IEj7SbODVcBO1mg7jtJe9cMJeJdC+ONyp1vTsVkVJXCSavhz41
         nKEf1o3bKxiiIL0zXwHBXixN2sBbfvcUKWnC+64ZJO6jzNJ026QRK5CrSBlSx5nEXK67
         4GAGY6xmWiSpiGMCPYXYOHs9cLNstmO24BEAJ1QYgCqdZPmnlymv842B7yFdp6n8y7wO
         zbe57ueoviCTIuTMBmA/u+jHZPcQfd36Bk8S/obMFUZECD+kVb9vJ7t2Sd+OyPoZ5Aiv
         +SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699110; x=1763303910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XW2y5qioC+SPBlfV5RMk7FiC5oEKR479wtD8KF5rP1Q=;
        b=akTDyN/urlnpU1Uq0NyDh0vTLwTss2YxgFex7d1J1Sb3CR85X6QIWRi5e4yyePklvN
         IALdQNZrHiaVOrPsN6CWfHxTGqdkuin0edFjoFJJcyRmG9foMItPhjcldqhq+9xZokTx
         Q47nlYQ1txPBlAbbDIZkL/1lR0bMz2GwoC7eryQITWvgi2UAISJR/u/glAB1FlqVsTHB
         7gMtA1VFmIZHwC7azOnUNf6TR+iXpsF01npDh1ojXvIi2UCtPiRG6+XrKv/Ue0d2YIl4
         jlGSCOD+1lddMUpEZBikd0UrezS2lPJGnOgcZad3r7g/r8IVa04wAAV1SmF3hQTrOu/y
         tZZA==
X-Forwarded-Encrypted: i=1; AJvYcCXS4j2tWySzQ3ett9BToorG7v357TFpQM1KP5B4APlxvUOIOZoiJ5tVhzVw3eztc8KKFDJebZo/gJkOFAky@vger.kernel.org
X-Gm-Message-State: AOJu0YykaaNGH8ldB7FJhJ5W1Oys0lAR+KOriYqWZoOkcIsHNQ5tdfOO
	TBHyYxPfEp3kBfvNjvrFXeeYgk3aMIOGdnEPNPtepPDAK4whcwUgDytG9idAoFKqHybNXq5ofek
	l1n9w1XUEXxUqrBPq6t0DNCjT1m0Aq77DQD8SJxkThPtaEMx2ODjvjEcx4U/hyPOSJwTC
X-Gm-Gg: ASbGnctuq+kZFJxVbz0fTpKVZGHFOzJ9r9WO6X3KNkW2uxmOAPvbq4/c05MM6wmVOuL
	e0QS/XCPTBg6K87Lvjcym9e8eIs0nEZ7zY7GAJMhpZgOjL84U53gHN5hm2QElQzlgJCBmzyCXiG
	L0nyLoxUlmHdV2dK8b4zgfc/8ydKGY+TVDLqdbVjS5ehLmxHcCII8R/m/lIZBfq65OPgPjPNLpA
	qeNPeCkW51Z5AiBSO1JmsPpx2B9H4n6I7ZI3DuxGKvT/rafyM3pleo7CQeWjXs+taYol8QIppGm
	X6pOp0XQzkz3iV82poN37PTaI2UCsR1+WHhP6EjXFCsRIId/1No0aHgXn9gIJdTrXEpqD38w00k
	5lAoKKUPjbjKrbQ7nsNnwMl5rNNkw3wdloy8=
X-Received: by 2002:a17:90b:3811:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3436cb73e66mr8014996a91.6.1762699110236;
        Sun, 09 Nov 2025 06:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI4EIvuNbEFq4KLN5FHWa444x808BHx17XtNyZvkZvzfUrXB1Z2wx/ZIkwrpEWFTg952zrqQ==
X-Received: by 2002:a17:90b:3811:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3436cb73e66mr8014978a91.6.1762699109678;
        Sun, 09 Nov 2025 06:38:29 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:29 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:16 +0530
Subject: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=7027;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EQ90lYVfyz+tdTJF0OEbz8TSgTdlKU5QUPgYOVB1ofo=;
 b=Kfod+JF3iywzY91KfPB+jr89CkaOtAE9QTJIxP8g1QAeDEUgfTCQDbAeZK29nw7pALYzMYwOb
 j+WD81Ci+AoACXN9Mr18MfiNM7RGg0kMomlao55X5svxU3hYIhQHjh9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: RkfmtQ3TvPZB0C5HZqBlGd_voMGNIOVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfXzyke+mL7SVo+
 ZWSCZLvtxCGwJFwAuvWGt4vR+VAfxLx3zozZGlCADJ7k7n1nd+sKfam1DWi6V/FyYBls+9vMP/I
 WecMY27RNRDHJg9A1ZJjVYtrg6WN0iO/JIOwSdDS4Go3unNrWOqfQbIcZ3ylaKjNGKM/WCpcrdS
 L3RMLUJXKbt0dCyRFy0dqcvtOV3/glo6PMWg34ooryhUF7mBF1eKt6CMzHNvEfTNFym96O+uZ/H
 QH526bjef8PgpO2/bmuaqjMAvMjDyxFHMz2lHJLOtEUygOkcRslWnx6n4VaVWzda+ZiO8cygCYZ
 dASUgwLstmdOUwbPZ8HZ7qWjmamxiTUvX12xqIhvq2oaRqM+7U1Ds+rZshJ5c3TFQtXTAnS5O2Q
 Cdd+4reSsZM2Junjg3l8d3qmUPwepw==
X-Authority-Analysis: v=2.4 cv=ZPXaWH7b c=1 sm=1 tr=0 ts=6910a767 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bqVjg2-MoX4cBg1ZSeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RkfmtQ3TvPZB0C5HZqBlGd_voMGNIOVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129

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
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
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
index eff60d6e04df2cb84ba59d38512654336f272f8a..873ac45cd7659b214b7c21958f580ca381e0a63d 100644
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
@@ -56,7 +55,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -80,6 +79,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	if (!fwnode)
@@ -101,12 +102,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			pr_err("reboot mode %s without magic number\n", info->mode);
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
+			pr_err("reboot mode without magic number\n");
 			kfree(info);
 			continue;
 		}
 
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
+
+		info->magic = magic_arg2;
+		info->magic = (info->magic << 32) | magic_arg1;
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
index 22f707ade4ba93592823ea8718d467dbfc5ffd7c..e0d3e8a54050a76f26846f456120b4c7e371d284 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -3,11 +3,12 @@
 #define __REBOOT_MODE_H__
 
 #include <linux/fwnode.h>
+#include <linux/types.h>
 
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


