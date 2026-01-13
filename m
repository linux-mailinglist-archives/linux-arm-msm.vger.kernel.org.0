Return-Path: <linux-arm-msm+bounces-88667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C0D16D28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DBAF30312DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92870368299;
	Tue, 13 Jan 2026 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXCQjw9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwyTIUWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0542122FAFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285475; cv=none; b=TG79gAT69sS9vQOhIrNf30X9hDX1DOVVxCWamws0PT6twJe7LSbiBwMW3SqumngocwjbO1PzjRnKGfUUQgHFN/ACYNRK14YKXJgjh0/RmQ+EPmn7VbvrMGya9BKE70uQrF1s05o1XP1I8Jck2YWUCb4ITUok/E9UmfGD8wA/RC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285475; c=relaxed/simple;
	bh=9R9d5MZ+Rg409Z594WhcPXh/1yixAU8E+fucp+ksQJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ajdhBbtxwP7ZAJiePPbQhAqVr+i7FTY22x8GoMaGShH4Yj6p+q6ZB7kqtLdGs+NGU8lBoHEUCSjdjT25IZgfNjepAPOsdMyiBfq7xDlnxP4wn2ARynuEfCxx6LwIS1rIgwFYv8MeXD0Bk+4o2FkO6Z0+Kv0lzmxRzMuAF/e9CXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXCQjw9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwyTIUWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aqGa3636924
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3wLl5N/aW4pxrAPVKZWOn2
	uWWkHkuchBlMXjCsADP6A=; b=TXCQjw9RaOHqz2dB4MHiESOvW2xzkwuuOAfGOp
	MDSrPxCaKdnvd1wQupyKUcVcdD/gEe5RQTto8c0vVdgyXJqIkWidBsJf53LHOqEY
	9Fjy9ofTSt2w21FOEFOF8YhKMoJ/TmlJHqO2uAjPlN87l9V7kiUV7c6W0cDtmx99
	V7FBUWJ9MsEyJTpk1MCmdRB4dnlULk8/6/1UdiQvezxXeO8tHnwZeDAJJU5HzUXj
	08F9HxCTWB1qV6ad4Nzy9pYTMPKLMYGFlP1c8b3+CBl0TYBpg5ryuq2wGqBOxS6A
	fC7FVMZ5oU/oRwhBLCZV4S2zyZPCwAs94feIpMWL8BVcsakw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c04pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:24:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1232dd9a256so232269c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285472; x=1768890272; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wLl5N/aW4pxrAPVKZWOn2uWWkHkuchBlMXjCsADP6A=;
        b=WwyTIUWxLvzynj6IS5s1cldzkswF8ucmRzk0ajr1sA6gMNOAZPjJxB77oOPgAwclAF
         tE1sRHWadqUrdElsJHoZ5glss2z+8IlRaTCRVyaW/deubicib5E8qXw2ONDMgCJENXWK
         RG5u5XUd2yNHO39pVZgXdIujCJQRHXZYMb8OQhcHl/2PZXXd7PHEc8MQ4IAx71PuoiLa
         zTMa5FNXFzq5w2y34SbTVjWT1iTHKjQfBXcNFqYZXq2WJcPgtEYUfiqsPYVodzzDHHwX
         DdhSYCwnSm76mm1Bxw83i3rSA6vz5mPtXrjbERNy5IbcSlZu2TmcYivkN1TTwo10Rz68
         eXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285472; x=1768890272;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wLl5N/aW4pxrAPVKZWOn2uWWkHkuchBlMXjCsADP6A=;
        b=ilAJOBD++kPeTd4kupIosPN7k0vR67Ff+6+wzXGL/mY5bA4qCBuglBaV7cFd1nNECZ
         YnPKpWT6AcQ1q5JbE/4GIDbPnFtU2sEKoQM77zZyTUiLAZhCfdlak9SA9FLGBs1Tt99k
         nWurM7SehHvQ0alWxh1dy805ia5bHE58Z2TBT0ek6Pnf0L0rPKV1TOJWBLAeNzfeyEg3
         FW4ENEqAQAgC3Bgh/ALAcKENFU2d7LqEnFgrnvtjFSkiLLlvPaxDXVv2nVLRuxaEqFdK
         /ksHQEdv4oE+Od4rdTlQ1wWzVMUlC0JLar7k64LJXVxo0hxh5csYB/xFfK71w6l7wm9V
         aKmw==
X-Gm-Message-State: AOJu0YzITLSp34QteovCi5iE3O52K3KzvneISh4ieTtulZFKH2HLGWWd
	JS9emAR/s1B2wIqblkJ+Z2jCp4zkBLOK0zM78SE91u2Haxw3nlOFUQrdYOYAMSOFvMLPyVPHFy5
	aeBEm/GsXLjLxBhyfmoX+3dmkJKLJim1RPuv5c3BvIgbJxKpZYrKFvmJlZdMuaSKWPWB3
X-Gm-Gg: AY/fxX7OUUTHERNloA8imuAiz4RfkfwXEsLd7Hjip1gBX8ZSMFPhZ3pgjnyG96odL9n
	fNZS4rfnUH0D5viaIKpVbVjD5ViOfzLcGY4LgsGQYMaS+gr1MuM9QJLL5jGM6GFECNdRtzMlP7G
	ZRbCVQQofUeaZI7KbQsJYGf4hQwmhRyxFTmIAMKOTzX+0/O0OeXp+i/XvfpjQOVE2UQ1mtF+1yr
	2aDm7FnfdR/XA/ToBIvRoq01XuuaZNUjbvvJcOhGrp+eix6s8YIYt1gwA+3/gswp54iyDHJpJhJ
	QkVS6JUfIh+TurSNJ9F/E5duj1Ti6KhPVJFL+8pJ7kjFhUMZoOcm8ULscgwmXE4K8J+UfY3Ntyd
	HcuFpxOMs66lMOc9EyMIvXCxxbjv7EDRNlngjxXCjRbnH5VY8lYeMnaZpVzXWbGab
X-Received: by 2002:a05:7022:307:b0:11d:fc25:af63 with SMTP id a92af1059eb24-1232b5b936bmr2039275c88.11.1768285471880;
        Mon, 12 Jan 2026 22:24:31 -0800 (PST)
X-Received: by 2002:a05:7022:307:b0:11d:fc25:af63 with SMTP id a92af1059eb24-1232b5b936bmr2039248c88.11.1768285471259;
        Mon, 12 Jan 2026 22:24:31 -0800 (PST)
Received: from hu-satyap-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24346b5sm27572556c88.3.2026.01.12.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:24:30 -0800 (PST)
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 22:24:06 -0800
Subject: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAXlZWkC/x3MQQqEMAxA0atI1hbaIhbnKiJFk1QDjkoDIoh3t
 7h8i/9vUM7CCr/qhsynqOxbgasrwGXcZjZCxeCtb61z3pDoOK0c9Y+IUXeMQobJdpwaCiEkKOm
 ROcn1bfvheV4mS2f7ZgAAAA==
X-Change-ID: 20260112-disable_smccc_soc_id-ed09ef4d777f
To: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, satya.prabhala@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768285470; l=1982;
 i=satya.prabhala@oss.qualcomm.com; h=from:subject:message-id;
 bh=9R9d5MZ+Rg409Z594WhcPXh/1yixAU8E+fucp+ksQJc=;
 b=6IhJXSGy4B29tw7x441sQgxggIBB0UmATvgPjlBoFmm9x5/q14EwKP0EqoQvm//CLDHrkfGXK
 mW7QTeFcS+GDyc8ojDOMuyVe5ah5TjvMz8NMpxnkLiFCkQe2qgw7xo0
X-Developer-Key: i=satya.prabhala@oss.qualcomm.com; a=ed25519;
 pk=N96J7WMj6/IKz17G+h6uiK/39yry7OdLwoUtHgPtafw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MCBTYWx0ZWRfX0/LXk0fMIpFd
 73/kT8R1Y8RbNddcfYJTQt1BZgyZX8QGlXd7K6lbQla0XyCoBQzWM4MR9oPFNkV9Hop16uwOdKx
 q7nebqaUTYAGs1H5TZkP2IFItAxEmve84JdZ2tecLpcaX4G3lURPNimeJP4pd6Aw0qNe1rGvB+i
 HEthmoNOSqjOEwrZF1Eg3ljr/w/qY0ts3sw+NjaV5UC+N7sZgASWo69HdymX6cN7UphqekxQQ31
 BT5ERq5vggtVS+nt16w0LuLXK4ZBap9+WWJJjIQ2VYlUtHQeoSVYr5gd850epelTVu4m65XNjZ0
 cmLsvtWMH39JTfg6W8JHYCxhlUM+KPyhQmflDh1kbImUdOz7AXlV3hT6W0kfIRq8c3B/rXni+bO
 6iBWigsP+RZH6/GeYmQNyNZ9Rs1/924sdWpDzrCzJ191DyG3y0yhzhMZ/33xoj/I4Ps3U62rjJc
 RV0pkua6GI6rMgAvMgA==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=6965e520 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5JjZXzRyNiR89YENP3AA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: uRaFV0D0lHOs8jh8eGXSw3g3NFSQTE4g
X-Proofpoint-ORIG-GUID: uRaFV0D0lHOs8jh8eGXSw3g3NFSQTE4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130050

The ARM SMCCC SoC ID driver is currently enabled by default and publishes
SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.

On platforms where a vendor SoC driver already exposes widely-consumed
attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
of a vendor logical ID like "519") and breaks existing userspace consumers.

Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
prefer SMCCC over a vendor driver can explicitly enable it.

This avoids unexpected format changes and keeps the generic SoC sysfs
stable on systems that rely on vendor-specific identification.

[1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c

Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
---
 drivers/firmware/smccc/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a6..f830d11ebdca 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
 config ARM_SMCCC_SOC_ID
 	bool "SoC bus device for the ARM SMCCC SOC_ID"
 	depends on HAVE_ARM_SMCCC_DISCOVERY
-	default y
+	default n
 	select SOC_BUS
 	help
 	  Include support for the SoC bus on the ARM SMCCC firmware based
 	  platforms providing some sysfs information about the SoC variant.
+	  Note: Several vendor platforms provide their own SoC information
+	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
+	  formats in /sys/devices/socX/*, this driver defaults to disabled.

---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f

Best regards,
-- 
Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>


