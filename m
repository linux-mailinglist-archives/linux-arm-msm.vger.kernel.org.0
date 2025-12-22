Return-Path: <linux-arm-msm+bounces-86090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8754CD4A25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 287EF3004F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196DA324B24;
	Mon, 22 Dec 2025 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/fpNBIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEk2oKdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766932570D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374424; cv=none; b=nHDGW5NQX/NAcK/jajNJrepYp26+xxCjhTMjs5x9q/ySvgJx+OhVk/MPrgSDru1cK5YyJVkB2Rai3PBJ9okwpIuKpGs7/vdFSLC6oS6uR0lQ0f8Sg7qeEf3rhpkG1TOZxn+NHfGK7RKefqC8cwXTv1ncIwep3hIZdudO7oBodUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374424; c=relaxed/simple;
	bh=VbqIQMroIlq6JMMANB+DTWjTL1f1TuzU3o0hZWDdc+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLWNiP6rL4MCHOA7JEB3y98db3neeipuF1x0eotl400K7qAVfY1ASKSXjo5oVvHsGAp4l2RDLlz5MSdo9TGb5senUfQOTyxXdYXFSuUDNrsqvAuK/ywJPS1hDYBMEPmLlnMUaMlfeWxiQdxtRV27VmPJRq1/xfdJFauQuhpPrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/fpNBIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEk2oKdM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMutim4116971
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=; b=F/fpNBIYl6HNaJLg
	aNAmKjLIzQqgdtCe3eeJAYz2AUnDPs/cF9+vWUBowBC63lOG93CnaqONVQoV6KGn
	bmtYxSVrtzLpHwlgrXycM8v0xOq/27tzzqXXdbXu2L02xIdb2d2MPtDXt3DmNjhP
	ZlxoGNBDgTyabaHDHFvPZprjP+lxRF4x1JNSRCv82O9DX0tiZ20Y3HugodcAVVI5
	BkI0auNXYCW1O4Rysab3NPR/Gf0wPaArpxWFP5QazGH9NTdkNqSXznWHbEDFtjGp
	YchcZW2cni7TaPtY3q8yVHCkkewYlWIBMA5QCuqnMUM7UiPaiuyIe45tZmATL5jY
	LXubFA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux3f00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso6752900b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 19:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766374420; x=1766979220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=;
        b=CEk2oKdMZJJ6ILrO8pmmHWWfvkZs2+M6Z5PEUcmNtlVG7PiHolBk6vwBocCBAwKQNt
         60UFSjPzqWs8N6ksOy2eDJFUV+gdW+aaO/Swsjs1NOJqem0+tToIIoHnD8sUEIyvh3y6
         zcK00gpfjuvikc8AIeHQnM1WtylpU2mjxzv3xWxblF7C626eGFnsmI94YjG04A/KIeFC
         j2g1kM2t/qhx+yUF19eToXpdlffDMgtzvVYSLK9ohIBnunkvWiGLNlswYx2f3L/oTRRI
         GnV+Bq4AdFnPv1gI5T3q7mwof9doRcYBXvqpMkhh0VFHg+fli2aJaC42MIFuvxu5XsE8
         Unjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374420; x=1766979220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=maLQn0/g6TQ0tBQyQOJF0vW4h969wzxQrbt5sqlv9hw=;
        b=SXaw1qv+3Nu7QfxAOqf8x5mcmBCI4nQLd5EzQfH5ptovxXNFJp3Efc4HhNF8GWKPpT
         d1d8TVVyzC/L1KwnWgCLCtO9zw1CRZm2lb/wDkoF+b5W9PutyQeyJYqd+IAPPcE7wGZ6
         nhA87v+nT5tLEwVblMuymNhXeWOgDMF5VePq7gDfFsf0vi3fp1VywqrsO8teJp0uBL4V
         okiYSDSYWmg4DDFCAkr55bJX+M1KNQzAAr27b6+zqLjOXni0ucZJYMWUYw6H7za7cnhq
         kBEi5TGLIduCEnu72ah0qd69tLcqGFJc46WuSYj9yAFMiwuhOM4T27W366HaUgHfkVZ3
         +ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCXabn8zP55yDTt//qAkpaPonl9M6tK0nnpkcdLA2bejW6lTlJTUuip0Xi1NoapWXXHLqezQZX1Kfozi8tah@vger.kernel.org
X-Gm-Message-State: AOJu0YxT55a9P1ZgdF6nDnfRdC7fhhNhSnU8nSFiOMV7jdvuIpT1mt6Y
	duBT4znyaw6Qk7RDdBiEfhpwXabdAdzmOzEEk/nzKj5XczMRQ7yq3nFF+UY5ccvTTD1D3iynUdC
	NdqBUdiW7e9GB6VEpNb+4Qcy4KEuKI+JQ6jX6JeJkHYpl9p5uoFHNmoOn8DWeTtBY2vV4un1FZE
	BZ
X-Gm-Gg: AY/fxX4Am/4n+BrcuTBWJoxjTqmvurqhBoPaxyXT/OkHx92IrQv7370ZFQ+Kr+IvOlf
	W1i3XoyWQOFMjI6P56lZRC5v+qfB8Piz9IT/XtGd2ADusoCDnOgSpOJWMLh8DGzgeLiH4vB7qdz
	nXqM4O9YgXlQbgCjRheLXKzMhFEOIY5IAUtURfZa0yo7wbNMKrNnZPWgbxWI0uGO4UYlKn2iYEJ
	cOF7IWyKB7RNFi2aUMa+27lG0ppPYp9NjqrN5Ku3WDWTNbJJiKpQLKcov/X2mhDC18eiEzGU/rw
	bop+IV+H5Yy1LqRoFCkpoDKAB730NWPgILDUPW6o4D0ixyZRQtiJdZ1qH5e8/lfWAophjunS9mf
	5r21tzHKtKz9GLHL87XcD9l1SrOy+UQAECXEzW0nkdzYdOQ==
X-Received: by 2002:a05:6a00:278e:b0:7f6:fd3b:caa6 with SMTP id d2e1a72fcca58-7ff648e960dmr8020680b3a.19.1766374420093;
        Sun, 21 Dec 2025 19:33:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3QmlHGy4R/5KCHdv5JakzwKHqFIBpAMkQx1RSf2GWhEA8H3a8GxhflUP36jW16Vr8xOKCiw==
X-Received: by 2002:a05:6a00:278e:b0:7f6:fd3b:caa6 with SMTP id d2e1a72fcca58-7ff648e960dmr8020662b3a.19.1766374419570;
        Sun, 21 Dec 2025 19:33:39 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f30bsm8633837b3a.48.2025.12.21.19.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:33:39 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 09:03:22 +0530
Subject: [PATCH v21 1/2] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-next-15nov_expose_sysfs-v21-1-244614135fd8@oss.qualcomm.com>
References: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
In-Reply-To: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766374413; l=2330;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=VbqIQMroIlq6JMMANB+DTWjTL1f1TuzU3o0hZWDdc+U=;
 b=C9EPPyOVk0N+CORGqGEGXbEzd2hhvAhcAHUiniYT0EhnRLbDR1Ty1ZmeOPaGp61VTSeeZwt7y
 rb1ux/CI/J7CGfOc8h+Ir3w8G1xlThmYj1Rt4uvSPw60ikotJ7J4tJW
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: QKlqGk7fkdjyKMAPADSnZ9v0sGwiHZFa
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6948bc15 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=LKyF0dicRlewKW4vAhwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: QKlqGk7fkdjyKMAPADSnZ9v0sGwiHZFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOSBTYWx0ZWRfXwk0XpVx2l+s2
 hY//hA08Q3qn/46ReRVHhx+L/PnaZ93aw3SG3x5r7rSAP3QqrQBTzJECUOyWOJHpf8pafjqegqn
 G3p9bntRgeAurUOqh3GxIK2g+saqZN8yzJk2f7e4S2ZvdSsTN5rnQwOK9EHWZ1qSlPx7q3CUKrG
 ZECi02hssS8b5OoJZAzrxHhqhwedu5SWNndx497PHXajhlZkLBx8kf4QvwJjUbcVOPZO3x2pGcp
 TEnLDh0Qr9Ux6Qlt/WE/WgOmWaV8s1AIK29Ioi5ZODIKoC0WEk1SYa/IR0cJ6VY6DoKVk/J0Vdi
 th5b498aGwNaYhihD4F32l/nFz8JidcKkgYQhVY2cjQa488nJASgDn3avi/2ocrXGgIjHA0/LxK
 r5cllrPnkhXI4bOvMmOdssTiRiKbw/xPz2z5MgkFfKD6nL9hmXK1apf/n3uuaQg+z2CNxhU01Mb
 HYE7q1WUoCLndsyeImw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220029

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


