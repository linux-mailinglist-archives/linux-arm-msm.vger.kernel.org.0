Return-Path: <linux-arm-msm+bounces-83906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51935C9534B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 19:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2567D4E113C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 18:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB19C2C0F78;
	Sun, 30 Nov 2025 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9Dysfuf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1OjTCIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EC2C0283
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764526894; cv=none; b=IeX/aVo+Z9rfz3SuqN6CA0fJKNXUb6rYxkybb0+ORN8LC0awNFJL1x+JzSk0pVhOvk2rW9hGFyCOSlQybCZMT17XWnxef4aB/ccyPAzlWDRuyq57O2jojCaZTzC2uY/nsADVWV3jntiv0ouhUlhpX+QZQfIdYanaTgUddLx9Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764526894; c=relaxed/simple;
	bh=usgZ50lsKAOs/daHoCBRLBx0aO1Pg/3aRrkQMCznHx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmJq8nO3Cg21Xkr6tHUMz5GoGiKJfvCOjzl3R4w1ROb96oZushMn7TJxSEqiggHuqkvN9blOgek4QDCAiWthCnT+CMShcdQ7B1+riXItQ4QqR4FhsxetdMnFItHkek7GnyQ41AhcuURbCKBxbsSoltA64ExiMdefV42dBrXah34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9Dysfuf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1OjTCIU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUEFZfp1176913
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=; b=E9Dysfuf+TXjfmeT
	XlkZF19It1mpqJU5gUuXbv+TgNhQUAWrKQ6ZzPyybrYPU3LLzbrMdgQso8vZDh8t
	PqN9VqKO0DGivFCWo7XMNHBlKb9Vl5a1Y4dyrRP3HNEqaFnh3biltwMuh2pL/GFs
	3lZd2yO+7V+49nKNlVGnSb9tP2aWqqBrpsF5LIOVfNgRz/x/WvyrWmp94q3xA7bN
	6y1suCLlIbctmL8+BTi8bkLRLn/dpkeI6uY4GJlqxduy7gGZ/2UclH0nKnsJK3iB
	0cGuWZW+I0Pr0SlLB6oV2+n5Nk/Cr5raM+D6DG90OdBufV6Pdacs91+ZXBxvLNrg
	I9YgqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt46afy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297d50cd8c4so104186835ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764526892; x=1765131692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=;
        b=R1OjTCIUZW2n+tSzMFzKD+yzhYwwyZTjOfTX4v+qNVq4PmlAWQC3kJ5Z48q2MI6bhU
         YJoxsw22gR3YaN0wWO6O3wbnCp30o4DkJjWFLJZxdGNG7A06CCm+4qK6Er6MuxER8hro
         Z2qHWqnkFaiRjJKSV6NnPl8DG+MnU7wQiAQthNohjoLagm0maiHfBfxiGUol3BCFCgGh
         EktONKEM3Jn+5EnjFFyZJb0izsbNm/8dZPd3SDxHcnCFkrzysyomXVy7TOs04ZLVgjCp
         Zaw4nvNrrtH4cgf+BXo5S38liZHdtMuF2isbiI0J+yUNcpayWCLb798TqZD8F4X08Jsk
         esGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764526892; x=1765131692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zbSn4WvxMEi5fN3EkuAFKvYhh+IG+Q93MMbD1rInegA=;
        b=Qo7811Tl4HDws1WcneRuK95/HC8h/BpZ8O9UGZ1hhWFJCr/cAK8mS+Msi+zt97uS6+
         3ATH7RnEpFzYbzP+BvdHGgvUCQP8TdgpBVjrKkE30pa00eZAVyG9u/o+mA9Em+wiKUbu
         gKpSMkxRZxjGHhf4pa41iWSp3E2DU4eM9CjfCis5SFZ/xPXEEjIKfO7FoaaLHY0ILV6Z
         6ML+c8fTSaKdkJVAJPj5LHp8WQmMCfFLmlrX8Cx4tkDEjnf3NMYUS9D0+Em7VoGZZEAD
         qOPYFE+IpixLj/NrTXcOdgCCNKb2NzISfh3FRZSP1ToDN/WHfqt10XVsUYxK2gvhwy82
         dHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLn6OX+FQ4QeQsOdn4Aus3tnTGIFsbCmr8SS1DR3PRuPgsuiJx3KHU7h4E8RG1RPtjGC5+vwo4uDpQeLEm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KxOMrVZ/BkMHSE+uwzYlHsnmS6jL3R8qh3+PmdYP+05upZvm
	ffd7LYJrgz7gGwrIxBQcIaKPIib2glW41L5gkTLGoh0H17sidIHBN3oq/LKqhMuRB4FYgWu0bSC
	ap1QqMcO+KJ0L0uhR53CL1FFrKr4T6Rlx47pdRki/GWK11vsyNIygsSQmlG1F/7cabtFh
X-Gm-Gg: ASbGncvrC4SKCnm2FbktSkSoUAgqtnQfjKthKUngKS4NkpyzHL79Kf8uukL6D+SiwIu
	XcDUjuWxkVoCkBozohKuNmVVOVV02z/Uo8gU7knQOOaTcGDjQH63J6+1E5eq5NmaETTArBxZMdm
	YD0gVZd8ANIh0jMj8tHjNOVKD2C8sadxj8Yz24GSdG5HEjOFgdboGnfmZ0PIyVTuReVoyzJGXdA
	6zpwS2r51hhDR0aa1lENIOL/nn32wYc4vc6FO8m+IECDMwnRzTu/ZcrHyhSnhRfkGePqB2fHMbn
	wQDeJeZwrQDAHM6UzJ55yybEU9eyyLImeT6etPXSLNwHpJOw12zTZfN4q8op8oWdf2NFvBlYwZp
	k4kJWWlgOo8+EI5yRFWVYWlq7kpywE2+oPRsi7g8XOuDdEg==
X-Received: by 2002:a17:902:e882:b0:298:344:1229 with SMTP id d9443c01a7336-29bab1da652mr261181165ad.55.1764526891637;
        Sun, 30 Nov 2025 10:21:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP+RmJw+aup4mPhjKFzb+zfYoq8ozIQAK1imr0RTv1Os4D/YXP04NwYec2eM1Ac94wW7bo0A==
X-Received: by 2002:a17:902:e882:b0:298:344:1229 with SMTP id d9443c01a7336-29bab1da652mr261180975ad.55.1764526891254;
        Sun, 30 Nov 2025 10:21:31 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27691sm100911385ad.64.2025.11.30.10.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 10:21:31 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 23:51:23 +0530
Subject: [PATCH v20 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-next-15nov_expose_sysfs-v20-1-18c80f8248dd@oss.qualcomm.com>
References: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
In-Reply-To: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764526885; l=2280;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=usgZ50lsKAOs/daHoCBRLBx0aO1Pg/3aRrkQMCznHx8=;
 b=Q1xhijBVgDmDYaUV0LIScQ/DSz4W9ZS1DLIgSeXO630+u+GgJgoNgZvwdvix8h4H/hD4epZmA
 LKMFNhjH+stAwrbbZjgl2veh1eABz9M7T2KvuBqmryV+PqlsG+agSOy
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDE1OCBTYWx0ZWRfX/A3OCKxCSXQa
 ytey+rD3W1kuXRjYyaub49hV+zQ/Ys+ivvZfstbS/p/GmRyhUYLBvvs7Sclqlaq04MIN9S3SJvk
 c5b4XWf1rlrvZOAlNNvibzEyotevgdfLqmnzlqvdq1l5AC0CuhfXfsAGoKlhQ5D5GKDRqvjmZth
 ycApGe5xvCIoc4XvQSNPp424up0zp1R4XxPQ8DO1SMUbT5Hyrz2e7YiaDW3NYNH0VvHNIh6Fmr9
 dN4xJGOMy+EsVIX3AHtd4u1JToimQnNmxQ7FjKBNUtJTXV6qSdfxSeoXECQooe9WaWP6JzD6CLO
 YJK1LeUy2e4VwY3iA/jzRR9nLd/HTLMvPIa4qfUzoMkz5FasnrVsqP0sIJjyDmCl/NmmmqIX4X+
 Ir+P3JgUDKbOMNLVyvAqIVcVoOIDfQ==
X-Proofpoint-ORIG-GUID: 9qRWR-oCU4QmKA5jw8GL4sYqcQ5rmqBa
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692c8b2c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LKyF0dicRlewKW4vAhwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 9qRWR-oCU4QmKA5jw8GL4sYqcQ5rmqBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300158

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


