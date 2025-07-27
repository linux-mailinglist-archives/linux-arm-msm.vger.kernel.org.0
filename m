Return-Path: <linux-arm-msm+bounces-66796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2467B1307F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 18:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01CB177F93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jul 2025 16:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A3F223301;
	Sun, 27 Jul 2025 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll2dnarX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7221FF57
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753633537; cv=none; b=TxrIA7w1U0nlq8u3uP6PKp93/9sCMp27O/tXjj85E082UIdgIVSNNY9aw5TUjX+o9ATbEvdbVSoduBxrF/TPuE4hA7EEBIuZga+BS1uS/u9UmslHvxvLNNf6puh7m0WLHTYt0zJ2T7ESW9L1xjJLUUksagXm+DbbvSeVf4H53Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753633537; c=relaxed/simple;
	bh=B5BLAbfGWAu1tjZeNLd2S/l/pA+itiinQJEbqhqQ7Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiXgU1nGCtas44rC4ColRmntRUWQ+rtcSVF3hCB3ApCl5+5ynL/1BsxFpQlyeIrXxAqHDEsE53xQCpOx6g4W5/K4QRC1BQAED+ZgGwu+M3eINamaXMzTNFKNjd+0WE3u3YNLqCoSuW3wOWSSkA5XvTb79VZaXjB6p9SD5RHJs6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll2dnarX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REOEuR018457
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAjdEtX3RT7zSV5WrhnDDtIT/eTrigKKIJeo9CD77g8=; b=Ll2dnarXF3tA763o
	n0D2snUMmai1xsB9hkOvnb2fifsSLg1eWkxr6LBWGPBJWONv1lc7QUlNM3CJ5E3H
	NMm/+P1jsD/L+TRxS2KeEdHs1QuQ+5eeZ/Bxyz/1Ko/TJAVN90y0DFU0kzbO7TZb
	1uazZIYQWW2I3TZJoyZconGYcOXvAs85jsqQwgeH903e71Uy8IM6YxYyE9LMN25K
	2RCMgvxVUxaIDe3Bm0tJjyp/b7K82bwNDMIheJX9tSheGicesNanxpmyUXn2PzGP
	/kc/qpXNoKhDl9WOfzHEPgFE9zdV/Ve3LVmgzyG7HiI38Rn1+tN9+5y5JkxJg5p2
	qDCFEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xjat8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 16:25:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b41f56fdab3so498490a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 09:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633534; x=1754238334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAjdEtX3RT7zSV5WrhnDDtIT/eTrigKKIJeo9CD77g8=;
        b=jfgYizKRidlVh4/AkzgCxIUVcrRK/F7KLMkDVTuRWDWx3Y9UE1sEju3XVDU55znk6D
         dCVWPJxOYrWDThepdiWuL62EJKRvxjaCrNTYCOEypUaeeoUbViWo9fi9IrdHEQ+WhK18
         MY5Mf7ekCY923e9LYDG1VGeDOqKR2yrAqpiMhmxhMMauIYYsXGvxNqKmWjvhX894HnWh
         CiPjwbtlXADnpBUUt4P3fhExZ8QPpCgu5IFnAZhEVzLHhu2UWGg6wL/1wH5vIFc+MzFv
         960ThEX9Mg6Mkg2N0bu9RdsVJij3949WK43JEEM0wGavcCFCK9L63+4fdX7BbfGEmpCD
         ziMg==
X-Forwarded-Encrypted: i=1; AJvYcCWBRFHa3RYdWwRz7aVpuGgj2VP2aoY8zuXkG4wVb4MguQsotS5svvchjYHkMKEsGf4OoEWpbrirVyCJgYv0@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaHlQNWEmvfzhgFVWCPxf3MJaPmQFtVReFA5sl+N/mL19jZ48
	DzpvqciDrJ+6kcWxo3OtNWoR68cqUttcHdyzHVqJgCRNdhJ3Yi5bDxBYRC8OYydC/Mc/OJEieYE
	fMTlo28HrU/zG6oJD5ZSvPor3iFVtHXPmcvvK/zUxg+2jNHSBbp/Cc3Qx7QkDzp1rp3KqYM2r4U
	rC
X-Gm-Gg: ASbGncv+uKuR5hrJ9Ga9XtA+SIjikLJxn6+la+AzlRGobLKweM3rS9C66hMT6C06ysh
	EFjMTipVRPB0Fj2LEXmToDHmLztKT55G7Fxq//ps7kLJu8jwCtO6LbwCs8QmGz7EmWXTXtiT2aB
	n5RssF58wkZFjMs38mBJki+niRkbVaXzFP1Cmlo+Tm0yMAJRUW9+UyMJpJHeMRaGWjxP7/WUvlP
	OQYEuQ3pDJwtVkGqcJcqEW3XemH+Wx1JjKTCppDf36Ej+tqoZ11JQQlIRCpHbCupk6pyMQ2FM1F
	OCkK8vSj8C6V/XyX+HW6XeQfg/zcapwjkkoRHHUyhLmuEtDzLgdB7mLfqsuyjM4IlFAiMcm4rLj
	v
X-Received: by 2002:a17:902:d2c7:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23fb30b3224mr145314815ad.32.1753633533693;
        Sun, 27 Jul 2025 09:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7X/a1NVbBv9ysYl7a3wo9LMuxbvZnRFcCXyu7AESYMzqbL9vACORQwwTa7YynJTdngrt2rw==
X-Received: by 2002:a17:902:d2c7:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23fb30b3224mr145314215ad.32.1753633533214;
        Sun, 27 Jul 2025 09:25:33 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:32 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:47 +0530
Subject: [PATCH v13 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=2307;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B5BLAbfGWAu1tjZeNLd2S/l/pA+itiinQJEbqhqQ7Iw=;
 b=pgH9mIPi7GA0ayDqkKnR2+E/P0dq3sd1IZAeVGSFF5+JaYFGGS/XBZthLHPT9KAF1UJ/RpQH4
 Hoy706MVMLNDID9ZV+MW3XmZWBEhJJ0oZVWXtccIrzCMNUZQ3rPFPly
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=688652ff cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5CgfHzhl2afHKY-Ush4A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 0oa9X7E3N4hB6Funtjy5YSoGBAJkn-dC
X-Proofpoint-GUID: 0oa9X7E3N4hB6Funtjy5YSoGBAJkn-dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX6cskyGcngugm
 QMj5ISnEOIPGWjv4ABwzxG+IGYfsAdSYVGVIL03HuTqkD8tU6OyYk/eVAwR+iW4qcc/CnH4meoT
 Wxho/Ei0w5IQcFoNn8TmKuiso/g5blYp056zH+sFCqzHQNW3QTmOgA24ebrSy+JkJ4Ajwd/4Kq9
 xp3AcIYUfh9/N6YiuCN8dfDUS4wroA26omtLZexSq9GjWgxAiLDmX45Rq+Zk+NclIf9WvbV9yp2
 n7pFhVvuUPdEmL98dQdSkSr4Lbfx0Ot1z7kDi3t8BVoP1Z6ERLgObmblZgL7Ta9Gu8nIgzNLEoY
 DS+AioD42n2qX1DknFC49fzLizKOIvUz60Dfp2m2SnxXNE7+d/Hb61Hj/LoB1ZIgcaPEvTp8nkU
 9lsgb2yKkVThqZ1GL4nAkwJveNXJ85esqSWKnV4VTCNilx25zGJSp5HMNs81gMdNY57qOsmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270141

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
index 0000000000000000000000000000000000000000..7147a781e5d4d11977c3a156bf4308aa13310e39
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
+		 recovery,fastboot,bootloader
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


