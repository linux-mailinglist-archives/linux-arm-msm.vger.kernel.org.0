Return-Path: <linux-arm-msm+bounces-81982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342DC61752
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 16:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92202353668
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A7530C37B;
	Sun, 16 Nov 2025 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gA8sQmID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcCZSt+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524DE2F532C
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306415; cv=none; b=OcCvGB7gIUBwJY0KcVuC36662Z/X9uCUWFqKoPd+w5sFudOjBv7+EWsSV3ejOVL4YDfweOrVWxfuE3DEHMnNi1cyK/wWTTNs3ZBvvyYo/GWp/I7chL94E+/z+ju6crM9PSKndVEFhyydtUTRstEq/DpkRaVJn3AmEwrm3jCz7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306415; c=relaxed/simple;
	bh=MC5JEYdXy7P4R4AAjgzZeqWyCBV/Peo4M8omPHYHvTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rgoVDgcVE4bSU5uVoQMa+v1heD5G5aLn57mMM1kVO6LPPz5vhNLdHpmnyZRmylPRcAlN9a0BbbWOl5drDsPd8qOw0zTjsW4jTNlhMPubn4rWWY/ARzxc1FIdHVA+Ou9Wo0z4DCgboCjh6AsxoQMRZektV+ldM6V7LHl+eVDMVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gA8sQmID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcCZSt+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGEPqpi1369042
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q0/6IowwQRnaHgr2jz4j7p
	hEMr+u8umowWWdSoOsEVg=; b=gA8sQmID8VQwXVopJQ1POGkWVnPgkWfR3ZejbZ
	AmPHALzJddhyIHnZFA9Kif9YqeWdxa7ykQJ/MHrl//6hOhKuGViWoqCIfL17Om1w
	ba8FvcWEpz01C3+mhNxhdqwUK9BzrIUx3pA0+1FGWu3MHDhg6F9vDROxxdLWhSEV
	XSg2PvGioEZdyYKBh8LjjValbptbvUTRtSgbc6Eh2r7idbzfy+a0KVzo4FIJ1pYo
	mLJONa7q9B1f/Xn7tfFxaozjKZWFt9KgJQcJDGLcmjb1t0XBSZsfew3k0VLqgNeP
	+g+E2+pNKE0r8ThVA+CyGX1z/rzZICpokHDApVT+0ArMUrwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejk1j8s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f48e81b8so57458095ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763306410; x=1763911210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0/6IowwQRnaHgr2jz4j7phEMr+u8umowWWdSoOsEVg=;
        b=QcCZSt+UMkWyjKUZvnGOEHZmlUaBELFmjVSOo/8fBzR7s+4RTN0QxeqTktL5T4z4PL
         KBAsEAIRO+/yiWzxuNAB3usxvbwt4h6eufz+xmUlgEtBgHpLdUWXTtffqVTGpJyUknJc
         tfMQdV5zCPycCcpTQ7JfZ5DakmKr5vcegEI9q3XtrtG+UsBUR7MUpNkkkivRen+/24/4
         GZuHwHJSLa5RoVLo8ejNW2gG6gd6cciui7nm6Jf9G5R3otpIVEaGBmK7yNIkdhca9Y/5
         MxIxyI+n7N+REAglHBcqpHOF6Cyo3bhoTT4B2OCioCz0qldAu9RWNiuv2cfTKTaF7eW5
         NICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763306410; x=1763911210;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0/6IowwQRnaHgr2jz4j7phEMr+u8umowWWdSoOsEVg=;
        b=iDcKicfkGk58G3ypb91sB0/zzRn2NpXaCyA/9PofSYpcBNSkMMExFbbhLzowfXWnMI
         OlggBs+qg1JHWqacL6H23PEAdS7+KeUEqbN7RVsuTb+gudbwC63OI3ikdljtkr5hhX7H
         7Y3sRODoRSu5hkpEP9H7iahrSlSNXKOUfiPU0z8UbuPUVHanI0u6dApF8D9AhB0sRC16
         rrHG0/WXvxJtxbPDLipmjyRLiZ1pDQ8ooJaqk+x5OphthHTxnsoVIyqAg6j2Jy6xrgmW
         PwkNGGnXVldBRac+NTCFO+ZbfYRnWdX0ycv8DYNstZzh2lNz+qDpvjqAwKsm/GddjL1D
         va1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzzB8KCF0AfHVRDifjrDTtrWgIpjG77GfvUP1uMuTvr9/0noIiZT+5gMz5B15JhRIkacHH2uZtil8kJDaK@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSo43KXerJ0LBWUqoE/8HWZqKYQemiPHY1WJ++PsJMRXSxxY4
	PwUEZfvzrYGqCx01GhdItMhRCZ6/FxpEfShhCT1ZbpaWINqxnUxmXG9KqndLoEjQb8so1nfYLpO
	hvGBQDeUI6aoXhgaYzIobacfYHsW88rhJtNBAC/JM4l+lHf9Dnvq5sGyFaDXmXMWEJFig
X-Gm-Gg: ASbGncvxNEwFHfnD0DIs3rhum5jJNsOdggZPbqrBAJ/4pYO7wYxLs6iR1YfD1+oomG3
	uxPAP9roJX0EUFktdt1Nwe7MZTonrs8cuDwG/MjfjdBQQu+z6/aqiMPmSHI9JnFsgj/n7PIHnbB
	QEFWDyGIxlxF6/YnKYIqsqcZlumxyEDr5tqebzfbRTUZ07zwb0sAOq89mlfM+LC8/hk3UCB2a0z
	BBeaJcrs2pJZp/Za6afF2BWhoxkXXcg8S02UmcOn2oxest5DtrDuRDhjbeifzSxjVgxekZt/+GQ
	vmjtWU/ViOTje+2owi6q39vSQBiR+NlO1EeJLFRresDQSGIp0qi26VbD1awiDHtzyU8gfsMv5uF
	pMH5R21u9F9WLkw8Ci6uA5t0ZUf0UkEfJKw4=
X-Received: by 2002:a17:903:4b4e:b0:297:eb3c:51ed with SMTP id d9443c01a7336-2985a52bd4dmr160885325ad.16.1763306409716;
        Sun, 16 Nov 2025 07:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgsCsSC0I+c8dSyeB+kkc3Yi1tduArSbUGLqIA58UJUoYeuSp2N6gfdsmdk4+QDGGxgjKTxA==
X-Received: by 2002:a17:903:4b4e:b0:297:eb3c:51ed with SMTP id d9443c01a7336-2985a52bd4dmr160885035ad.16.1763306409180;
        Sun, 16 Nov 2025 07:20:09 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c241f89sm111166205ad.28.2025.11.16.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 07:20:08 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: [PATCH 0/2] reboot-mode: Expose sysfs for registered reboot modes
Date: Sun, 16 Nov 2025 20:49:46 +0530
Message-Id: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJLrGWkC/x3MQQqAIBBA0avErBOcwKCuEhGlY81Gw4kwpLsnL
 d/i/wJCiUlgbAokulk4hgpsG7DHGnZS7Kqh051BxF4FypdCE+K9UD6j0CKPeFFWu8167czgVqj
 1mchz/s/T/L4f8JLgR2kAAAA=
X-Change-ID: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763306406; l=3373;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MC5JEYdXy7P4R4AAjgzZeqWyCBV/Peo4M8omPHYHvTs=;
 b=ICXgME0ElElVSAgpSIC26++9HJVKMDuxCev/7fAz1U8IbNSM5qcHQ/+Hyb4Q2iEowssPaXF9U
 v6so/z644RKDI6fxYqX8AdQdEFN03HB4J4Cp1uz9vQ9iWy9cfv44cOg
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: F4Ey9xivN2-AqrPI47TXWXswDYsRV7tq
X-Authority-Analysis: v=2.4 cv=OpZCCi/t c=1 sm=1 tr=0 ts=6919ebaa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=amjtPp5AYEGc_Cr1mlwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEyNyBTYWx0ZWRfX/Bqd8i2JfPPX
 Ej5ciJzvQmAouY8QKMJDLpWxMzBSL1CsYjytjh5z1jMv+oViyfBkvI96h/3HWH3VPuB8na3xKqs
 ZGTOoqwRXKmwK0snAs5vJEBRNvQExNBPUMDbpBYWibLXWkGpeHNkyN6Tb2ddiAFOyyuPaZEud6R
 /v290WRtS5S2rYGfWDBa+09HKVLRMY7yllXCQ8W2OO8bmyi0Z4UwRFnhX2o7Kd4CiHZh3ou95iT
 Syw1AFlAwrk9JPBri+sNyT0DlV9221Sr5VrpH3siwGe++Be2zijqgezjJ4023J95PjZY2O2PMEH
 g8m/v+Yy3XdZ1u6DQ9tXoRGI/BWdSgODXShPmp0lnKVsENHtrP+3r3c6iVWnradfAm9d7v8DEGd
 OAJotHoNNqu5OMQQpfLWBaid2DlpzQ==
X-Proofpoint-ORIG-GUID: F4Ey9xivN2-AqrPI47TXWXswDYsRV7tq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160127

The reboot-mode framework provides infrastructure for drivers that want
to implement a userspace reboot command interface. However, there is
currently no standardized way for userspace to discover the list of
supported commands at runtime. This series introduces a sysfs interface
in the reboot-mode framework to expose the list of supported reboot-mode
commands to userspace. This will enable userspace tools to query
available reboot modes using the sysfs interface.

Example:
  cat /sys/class/reboot-mode/<driver-name>/reboot_modes

The series consists of two patches:
  1. power: reset: reboot-mode: Expose sysfs for registered reboot_modes
  2. Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes

These patches were previously being reviewed as part of “vendor resets
for PSCI SYSTEM_RESET2”, until v17. Following the suggestions from
Bjorn, the reboot-mode sysfs patches have been split into a separate
series here, for focused discussions and better alignment.

Previous discussion on these patches:
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com/
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-4-46e085bca4cc@oss.qualcomm.com/

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Changes from previous version:
By Bjyon
 - class is made static const and moved on the stack and registered
   using class_register.
 - Renamed name of class variable from rb_class to reboot_mode_class –
   Bart/ Bjyon
 - Renamed function name to prefix reboot_mode* to better align naming
   convention in reboot-mode.
 - Changed reboot_mode_device as static in reboot struct and registered
   using device_register.
 - Used dev_groups, instead of creating the sysfs attr file manually.
 - Continued the reboot-mode registration even if the sysfs creation
   fails at reboot_mode_create_device.
 - Used container of dev in show_reboot_modes to get the structure
   pointer of reboot.

By Bart
 -Synchronize class registration, as there may be race in this lazy
class_register.
 -Remove inversion kind of logic and align the return path of
show_reboot_modes

Other changes
 - reboot_dev is renamed to reboot_mode_device to align the naming
   conventions. 
 - Keep a check on status of device_register with bool flag as
   device_unregister should be called only if the registration was
  successful.
 - Add a dummy function reboot_mode_device_release to avoid warn in
   driver unload path.
 - Date and version change in ABI documentation.

Link to previous series:
https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com

---
Shivendra Pratap (2):
      Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes
      power: reset: reboot-mode: Expose sysfs for registered reboot_modes

 .../testing/sysfs-class-reboot-mode-reboot_modes   | 39 ++++++++++++
 drivers/power/reset/reboot-mode.c                  | 72 ++++++++++++++++++++++
 include/linux/reboot-mode.h                        |  3 +
 3 files changed, 114 insertions(+)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251116-next-15nov_expose_sysfs-c0dbcf0d59da

Best regards,
-- 
Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>


