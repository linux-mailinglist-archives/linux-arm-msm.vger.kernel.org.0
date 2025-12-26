Return-Path: <linux-arm-msm+bounces-86669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75CCDEECC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D4883009498
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D1F278753;
	Fri, 26 Dec 2025 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHhhSnoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxJaYJuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0E24677D
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766775405; cv=none; b=LinOPG0HvHbS/n1hkpMAhwyftEl3ZxsndshA03S+LC2AylqAhtjhST3/gMVQEHOaHUud2zdf95i5rqQ2PGrgnwkyCISOS0HILTTTbZS6iLln8QSIJ2KvDMiGa/BirBiA7bXJUgCTLmMjONUqzfgpe0VUt1d9ZREhgPJ+SOOgXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766775405; c=relaxed/simple;
	bh=VbqIQMroIlq6JMMANB+DTWjTL1f1TuzU3o0hZWDdc+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyuTnzU6xuzVCJ7Bvf0D5juQCdyQWA4lSSMr5wFBRRFNaAsnet90PWyrQLg1zZa0iCYqV0N31EVjJWiFdm5+zNVWcNDhsZWiyP46LN3WdwcBmCx9is7ooO/3jFL/nK2T8IfrViqRfOIyMfaYkFnfMxJsFv8+YFiKWXZOvpUnr7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHhhSnoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxJaYJuu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQGU2Zv1719455
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=; b=lHhhSnoMJYdVHeZl
	PpIZjGnobDA0orpmLSNWu5yRdrBXr9oszi3rQDyEv+lQOTJjaVbfOPVML8xvikU1
	D+LZJwJXWh7+r5QvfglSw8rePqNVjSOZdaqKLsjrSsJLIz1++52kTlKM9Rhw9Nul
	3SH3uGD4iTA4/5eNrW0zMSeQouW7f1766xlQyrVy5nKMfnsq1wxkMmtHp2j0EIYu
	aSvpRcyT4PA9r61UsQyphtoAZqljP63+jKymcFStM0Uf9F+dGuGDx9K5WRGc9BHX
	QWk5G3zgawnMXT7qfErrOa7XtufXFCOxyDH2dCrKLSE19uQpeHbW4H3iP4d44cr3
	nwWEIw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvjb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:56:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c1df71b076so14834745b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766775402; x=1767380202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=;
        b=TxJaYJuuWbbNvQxrDhQyw0ruwSk7fchj8xe+/WOWxND0fkA45R/MgS3YB0miQJ6nTO
         IupxwIE7IQW7u7NkFEe7WhZQkB5NulQ5oO68fpUuufShrTM8/Ib3f39vfMugyAYgH0vq
         fJm7XubyRCyj+0V/o2u4s1KKDtN/RKxANKp749vsy10AMR0rzs1KkLFLYoDzAdwbHJnL
         E27ZQdOUzZYWBotQq2tq+IoPfRpiykkCAxZFB0grOjlLyIW/2FW0hdJZJmdViJk0WD2M
         Z3S0uccdFZQnX3xS+30pyg3Xu2Jwtv4kGFUqgVKXyrEIcjJ8RBzUbH6ZB7U6lEACZ2gs
         ebhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766775402; x=1767380202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=;
        b=VyBjUIMur7kgAO+j/KdNAz5yvc/H/xCkSD2iYgSf4FHdnBAwQ81C/+AKQFIaxkwH14
         yZVOEMvOs8Cup7xiRaqQTgfkhuGUbpvHnZfoDDEbmIucaaTywhYKCj/1R2PprtJxI5YY
         mZ+oOjBFEhqo9FtwyUWlRPlk78WxsnN1ks43fk6lKuBQuB/rSbOb64JGGeSrJ8MTJjZ+
         cJ7y1rBaNCjXoeY86K2munMZ/+JRtVmxtYZxNJoWgSV/DmjT1DufljFLDrhR9roWSIbF
         3gkwizGW4OQgtRSE3bxqyZ9OnkKlOs/is32WcpT7PEgWrMjV80V2jVbfJTm6nHRYy0hS
         tUUw==
X-Forwarded-Encrypted: i=1; AJvYcCX/MD7xQvCvI6alQCDTKmXqL96v+HjHk+WtnC/KwJNRpWLzyyLHOjR2eCLe6H7BN6fl+11OC8lbhF0yOuDP@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/aBsTFA8ew7l+kzTOG8WNaW85PsnZJOxDlyUYSJt0uTenXaQ
	eZtJeKA40OBCM3WTmYlmC726Sm3I/Y+bHXnud12XIXpQJb9zvqi00W0OdRxHJsveV8h/x9h4DhN
	VGIzuyxU7cCd0E9Bu/ZsGbfKoP/QC99faYRZMDAoZz6EOdh2Ukhu35JJ+fGrSAQQmR8Jl
X-Gm-Gg: AY/fxX6DhgDL4T49YP/pJrMfZ0fh749fwWYInafsusqw1i6gcz12LEIZnTdFzpZJCA/
	zECI4y3Pe/t/VhrSDnsuvc35hQtrvToLugoxHFPmm3XRgCHcYIMt4o73DsfBdrnajF8xVjBLfP2
	zReGEXgAWf8VuoM+bn87K8SEtcK7Gex+VtphLIAWoWfbDYql0sU3Nuq7At5flZ9gdowLC7Z2k+f
	I6nXCp7+8zSSPtyI3zrY7dAkEzAf0tKKWFxj7m04Q2eyAAoqJOA/+S4h0/zWyUNkmGyaXWbi9CD
	N3Rk+g1l+zHl/RvtwYuqFuGeKnFhtFQz1r+JC2T0hb06z44je5KLmbQVbfjClKBnHZf2jeV2592
	ppoEUASjIV7qSWX087qTtDtWNBOoXx1mfSRneJl4lZV9lnA==
X-Received: by 2002:a05:6a00:1d27:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-7ff6667cdb2mr20548017b3a.55.1766775402143;
        Fri, 26 Dec 2025 10:56:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERWjkBwyqqrCPa7tb3AVg5b/stcMwi80y4amP/imcusyJfTWAvkM8b4jFCAfc7rNtZDEIG3g==
X-Received: by 2002:a05:6a00:1d27:b0:7f7:1857:8456 with SMTP id d2e1a72fcca58-7ff6667cdb2mr20547997b3a.55.1766775401707;
        Fri, 26 Dec 2025 10:56:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm22638187b3a.64.2025.12.26.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:56:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sat, 27 Dec 2025 00:26:33 +0530
Subject: [PATCH v22 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-next-15nov_expose_sysfs-v22-1-2d153438ba19@oss.qualcomm.com>
References: <20251227-next-15nov_expose_sysfs-v22-0-2d153438ba19@oss.qualcomm.com>
In-Reply-To: <20251227-next-15nov_expose_sysfs-v22-0-2d153438ba19@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766775395; l=2330;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=VbqIQMroIlq6JMMANB+DTWjTL1f1TuzU3o0hZWDdc+U=;
 b=YwXhOppQlqYvmBBf4fFNIoB7tI3zaKTtQvQ09Aq2dEY2KHHMWL6LPmNCn4iulQmTqKnjZWxr2
 IWYEMyCGav/BcyUaB38KPl+ey2tvAJPHkVy/02G+lZ3f2HmvJJSDVPl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3NyBTYWx0ZWRfX/gUv8YFF9TYN
 fGqCMOO8pzwVAR73iWueeMbClRCh8gpH0atOd0sEd9dGiV14oULX7/Tn6o6xYc4V2lTGoOaCZxv
 cf2rDRXhxiO+kPO7OJ4Y8arePp/V51OxnrGHAHQF9cPbHIvoj+7CSqDXFlrTlXZ++SmckKzJd5B
 4GpZXuMg2xixW4yBk36upf7kB43HQ19ZSHPHWQteSLNcVufnTdf6z6bdZFYmECrEb3Mmnx8M+ED
 ukFsoskWiLJvIlCnydxi6XQpn2wCYjoLXj4hmgN6hFOPaVteCX1mjrqgSpWNJUWhts6Cbpc1Suu
 CcxIfv1I9YXkaEtyK2lLUNMCUUCIk1lngGfb6Sq3wHodOQgWS0Fd9lvnHH3KGniw0Fz/BUyAz0M
 hAWtOw9AGZsmd1ejMm+xALUVdnzmZGST9yRibNbY+I+HM0NXhcJtsjcrB91NyypakhCRW/JLGq6
 4E7b8kzuIyaI4U+D5TQ==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694eda6a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=LKyF0dicRlewKW4vAhwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: y5xRvmZB-60YadeP50X5mBqz520PtrA9
X-Proofpoint-GUID: y5xRvmZB-60YadeP50X5mBqz520PtrA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260177

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes, a
read-only sysfs attribute exposing the list of supported reboot-mode
arguments. This file is created by reboot-mode framework and provides a
user-readable interface to query available reboot-mode arguments.

Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..dc27cb4e698eebc99e72821225e8bf3bbe7cc7e6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,36 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		December 2025
+KernelVersion:	6.19-rc1
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


