Return-Path: <linux-arm-msm+bounces-86749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED781CE5478
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE88E300BAF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDED242D70;
	Sun, 28 Dec 2025 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ay5zcqfI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcFup8dB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3862367DC
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942506; cv=none; b=b8zjaD0M3TN/7s0Ym1774xR1uYALoeiUqFnByy0lM6aZMD7NscwSbDKZ1urNjzacaNsKHLXQqAjbZqd5mtLg0+WITD/0xmstYo1D4y5Gyy182BeteyMXvYDOehxybwyxyBFs2jafu0t2AS8i/8PVBfmei0GE/4zxIm+2bX0M0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942506; c=relaxed/simple;
	bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQVf9qpIigxeSK4AFIJGxRzJWwOU4uzkqmw/hDjQjtpvKRAyOP2ups7ieMbIIUv13r0DRGG6y1hyXULda9oIFW9t/0c0A0Wf0/iNMqYYp9G0mkHSgr4pD7HfqEbHDRYUF/I0R23Hl+wk5OerImIGBb97zUoKai4DmjXj0Hg6RSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ay5zcqfI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcFup8dB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSEkYC73483487
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=ay5zcqfIOFCL+B6p
	XwZiip/uLTkamPkdcq5FLuRjk1ukMksFGKZgOS3zz0Kxru2tne6vAQKUoYdm6JU+
	9mJCL6nGe6Xee7nuZCup7Wqj/BOYj0KPMMf8wcxrvwYugQcBmrn/AJRTOath2D0Z
	wh8cy15akUANBkT3TaEMgz0d91O334sqgSGV0ZS1ulK5lALqQSHvYUSCaeQcfxRH
	NoAPNgEIpJNgvup57tcezmpQHPMx4ScvlEKX/UVT6PJBAeJN7qoK2Y1dFedOjZPu
	x3bTTKoFqv0Sy++SDCmuiLcNJE/SN+B33p2sjMJMYiAf1ojKRfAiZXHjGzWe89QD
	jUNKPA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f62jad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:21:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a351686c17so78665475ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942502; x=1767547302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=AcFup8dBhv5HG5ygOdKWHDqF7AWkUkTYaya8AheOEen0PSTEKD0PHNJdz13uos5Pra
         5Q7wzjlmLoQ+roocEsBRzGLZqkffIqNxZe9aJQE7jwR1Qz9rurGLUfTonhGyLdbWr8Qd
         /OIf7VWECz1aVnJFA5bidDOLk9FzFBVPA9lb+FAV3IoiarywdQy6fpu+tN1F4wRr++ES
         XcjcLZa90WcAjo2uB4NBf2A5NKbVq/BEI1yT+nQ0t2T04zQf08ga5Xf30kZvPjiSeYMz
         fA8fj7G30mJW3UrMB3egP2q4qjfFvVla7pTh+DSElfYEJ7ResX1KxYSbMKB5dXcDwcy0
         WEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942502; x=1767547302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=jxxOz8T+BfmB8WzZzOrr0A4vRgszcAoe0JgQaV12T0EZamiGV7pYccjw0LXCtP6SOq
         YZWHwflgQl3HmfG0k9SgBcnJHkOp6LfVoKX10yRqG96TrsCRJ3WQTe8h8Uz9HHG6AkdC
         OmvaApEZhe+io5c2nSV+5FNMmPF/KRwLyvPDiT0uVzij8WDZxfzZa7+vclvf+QYow9Jg
         O7Qvi3TaCZHbsFcg/q3L+sH0eID2j8c3rpkcMVUiZZTcUNBBWFFIrkYxWahgqehFjuLV
         YStfABY6Fa90xu3g+m8ML80FRYBNQ2GXBMC9Do6uOvCHN58Was3ec6VXlkgU3Sdq3Ffq
         8kaw==
X-Forwarded-Encrypted: i=1; AJvYcCXD/qQJD8wlhzEH+z0afL5t/64l1+KadIXzA8p1RmKbOxS2u0acDgtpjY9YKXpS++vzKi1gP2wpYF7LFO+s@vger.kernel.org
X-Gm-Message-State: AOJu0YxRA/sH2ePj3IuDcK1PTFarjOidOaEfo5EglN58AoOo5C8KBxq1
	+qDqq85Z8Nd96r2KMWdnvzfjXeIeVTye6Hb3rtZLOFo1ClhQgXXDd7P+Y9aCLLF1LoWy1mcw/wh
	DwaqFGQBbXOkPzzigMuw6T6/2olu0rKL1IspXmwK2e97/uoLqRMit6eE4tGDlx6a+Rjrk
X-Gm-Gg: AY/fxX781NZ3bdTXF+aYyzNh2VhXlpDiWmeNqhvb73e35iTkKrHj8S/DMuCNeBj2kff
	3MiGjeTMZ4KHFLOnqN5tMVHMNAEiP5dqasFuVmJHrNzdJ/0O2Sxrxz19wwhTJHzMKJ4cbYHP1Rz
	m+knBO583Tc/+BonhiD7OLLBqOxlb26D8MSPYX1GZMUxowQJ9G5CkK+S2+md5/cHFj56Kie2cDQ
	eudAZJdC1rak0c5LPaSd/ZiMIJroeqoXVEwYv7Ka/eteWi2084vSnh5jPM19w/BnPSdCk7on2XE
	GPbVadaP1UltsAz5jOS3kDTU+tYDe3WgINStoT1IJauDmZgWmAgvDLA5KaK3NgEel2ZBiF7Q0SC
	3aFFUbUMBvJq/ykAl8TSsXALPv2NWUtWO+1tw/3gYoGMpDQ==
X-Received: by 2002:a17:902:cece:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a2f222359cmr260366725ad.15.1766942501890;
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq787p1Ho63fjlcy8G81u/QrkDgHtvjgeeroB0B78/24OrcR7OHDo58D/xrcx/ezuepD0T/A==
X-Received: by 2002:a17:902:cece:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a2f222359cmr260366545ad.15.1766942501409;
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:27 +0530
Subject: [PATCH v19 09/10] arm64: dts: qcom: monaco: Add psci reboot-modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-9-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=1066;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
 b=Mj5E0OFdKuDieuQWf1uoUuRUrw7EexTkeFGSadCtQdobt1WP6IyHfOp7HA3VEEGikWX6W8k+a
 m+7/ZZbc8RBDyEenZKLfJRCu0VwCGaKF+UCG7idWnBegycJqDiGXCS8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: jB6z9xpjFsPx2viGPVYheOsIuk9t8Mx8
X-Proofpoint-ORIG-GUID: jB6z9xpjFsPx2viGPVYheOsIuk9t8Mx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX67SAAV023UXi
 djcKmkWp5Jg6CMP4CGE0X4kSiaTvF9h2dCCq2e96RLid96JRd7xNTlpa92nK2W4PMMj5Je79MbQ
 bVTGawbhHHCeGQP3hpA8OxZBUwO6xMmuPJpRjOp11qQx9kltfaZCAdLtjZMwh4aTVig+PPKofiS
 300gKboN2qTF+uUFnG0Rx91nNpv4X7UtrSZMjTs3QSxDq3A02V+e7mgTbuMOmd/n9WM0rcnTq3m
 4iZQeC+217FS12rNL+ZrOyIdtczGzNfjtm85d2rwCinebkySVhe7TTpm1z0xh729p9CgKJifHWq
 mkq+pLCBeLDtvQw8OiaIQBxvSU980dYC+HWgCVkoVSTp2rhftAKD/EtJ7Rq4GlVjacMomWYRigI
 quhF/vRPAyALHCRun2go8UC1CVdq4vF+N8tQduuXJ5etx7GfmJ8IOJveSb3lnXdFeQeiZF/pqET
 gAx7R7NmdGKt4pGF+qw==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=69516726 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280158

Add PSCI SYSTEM_RESET2 reboot-modes for monaco based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..9c8087f870fc8889edffda63c62f4d5167729cbc 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -732,6 +732,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&system_sleep>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


