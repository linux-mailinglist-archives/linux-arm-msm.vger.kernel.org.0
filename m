Return-Path: <linux-arm-msm+bounces-96872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMsTLeoBsWkzpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:47:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50B25C894
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26308306A82A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC153491C2;
	Wed, 11 Mar 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5gG9g2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ee7eoyPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA057317151
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208012; cv=none; b=fzKzWBFIpjt+Z1d/fbe5NwCMQ3nHOul3sI9F5lLX4ArA6AFzPr59gGRn6ci2vD+eVUCEaRl2aL5VGaXafq+2vP/4WDUZvR0hB3FfqtKQyKZYnXAoCOGpLLsfoepnDD/3nHSbIC9pGiy+G1jtzSvI/POnWGFAMUHVeHzA+Kus1p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208012; c=relaxed/simple;
	bh=HXTzUVUWHHI9t+jZnXs1tFKVOZiz2FaIEWHfeEPLanw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oFCVmlYPACM43TyZ4vgEuOYQGv8tBICU+99sWxIPZEyETEdi5xcwlxn8z1UKdxYd2BZ0ta0kQAMVz0z9DHlqHhJgxeaAuZEiQUUN1E3R7gMWRog9YV0McCQFAGkRXrYf+XkRPmh+wlz9NKKWqQlItWKc5VzwTD2zzLOJsV/cWz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5gG9g2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ee7eoyPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3ORaY3760444
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1Q4XFB39ddq7htOB8iFfiUhkv9bnXZHIaXV0U9eiRE=; b=C5gG9g2jdG8T+HOI
	CpCPHp686o3hEUs43od/E/z0Dfh6xp9PVCq0D4oBjX2rstjGCYMttsdY1xoxYbAZ
	S3EgAnhEcD1brKFnoWRUD5thUuvY44xMTr44Ol83/SOvv4xBI6vX3y1spjf/QIsu
	+2DVzNLc9RU2mtORSOFujefZrhL6YJVLrEdsUXmp4qMGtyZo9ZEKB3WGnBcZr3U+
	KOZGTWLVm3jxhlDQRD/Ib4jk3V2VKGm512g6GVzInasjbADezxwRv1eMt/U+QYFF
	Wi4eT2weApPIVT3sxp01c1RKRQAQt2cZX48j8vSQt26hLV5tznlBr3rCqiHXpIaE
	M9Z5Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ukccp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:46:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35979a03106so11065712a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 22:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773208009; x=1773812809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1Q4XFB39ddq7htOB8iFfiUhkv9bnXZHIaXV0U9eiRE=;
        b=Ee7eoyPpaGrEI+rXjxIK/de2P4Jpe+0ONUrNXPLxhWBsVWnI7gG2PBcjDbMhYG0Ohz
         9osSfozrtcPbneszj/ff/pWrnL8huKfZDF9fXV9X1uOBb7OXrtrDnYchFJsU0stQlP/5
         GVqeV/4xz+JY4XCT44t6DfumPf7VVgnMjWlKaX75GbVZwb45UjFmG/aJNskcxHMO74bC
         rOzM0elJ9vhC95f0traeqIFjn7VyGCqtIjBs9PNx2gjMA2fbCW2qq/DN5Z01jL7tc3Dg
         nIrJ2KJqaNaf6g1lIuWgwDKJhqJkweNF/mKgIRP7RdzTqO+S5/cAX0mCjTbpUtRQiNmF
         i5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208009; x=1773812809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1Q4XFB39ddq7htOB8iFfiUhkv9bnXZHIaXV0U9eiRE=;
        b=S+P6tRf5VC/R7fgy7CHRN7mgyUWNWvzY8fOLIRcufAkyeigbzBQkL7K57OoZ8Pc2w9
         SmN7s/miI3ZccCctiTqP3uzzHN83p4hVc2aWMBT0/CLzupa367RdLoFoEpIRbEMJBQdk
         4PE4BghIZso+qP+tRNfzQA0UHB/sbxg8MNS/LdT52E7B7NwDWLZ+2pROkmfuSQMMko1T
         NXGlRZbU4f3rcN/YtUJEduGu8iMeaebzDQXBJ6WXDKfeMQz+19QQDKd5EvY4FNKHwRR8
         i0V9npOs/9B5wD0mVpw6i8I5Dlyr+9EquhEHNXeG6f4mMU8tG17E84GboMgYcgkJpRNR
         RhQg==
X-Gm-Message-State: AOJu0YytdyJ5rOKKOMqC5PwS/7cqhMplGKIQN+nF+S9mWxM1nbu+zUc8
	Pj/fscIeSS/qMguYAwRpYb5VBm1Xi5U5BlkhtuoKgHDxxRwbOEnOtH3Nxd+lIv99ZzbiC9xzKtj
	Q9fdo7h3MSyRuJtql3/sLPdo74VlBzizLhYxuBegKLLORrhvxa5mY/M7l1nHMLEWrRT7K
X-Gm-Gg: ATEYQzz/8XTZ6yVBwpGM9nx27YotkwXJV37rtIkER2k0ym3J4+OStdWsrbANSSfrZD3
	Fg/upnKOiMkMUb6eI8TGr5uMyZFE0ddfj5C/lpIj6B/4eRfUvPWGjJe4YDblGYtlvlKKhhRZ5yj
	OqauiYSPTVq9aDBMMchEO9HOdN7O0Wv/Ue6yFrtTZjcyMketUw7qJ655HyAYuFIkVs9hvDjf8I9
	ILS1NtgQ/IHknoJd4hC74VEJ+3bZRlb11sdGEJqbIKqzNFgCF5KFVWaKL2SZDUtP5h1kzBuexWj
	mDBPpdhVxejV6e8jMmPpMgT24y/6mGOL51gk/17ijnm2ahRq35hj+NeLGV460exqjY/XxlJ0rBr
	4eoSpoUacd0WS2e20eyMxDQOeipuGQ7BBm3m0xONI7rvTHOo08ukN5ho=
X-Received: by 2002:a05:6a21:700e:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398c61698b3mr1065916637.64.1773208009299;
        Tue, 10 Mar 2026 22:46:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:700e:b0:398:71b6:33aa with SMTP id adf61e73a8af0-398c61698b3mr1065883637.64.1773208008746;
        Tue, 10 Mar 2026 22:46:48 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eebf43sm1114108b3a.39.2026.03.10.22.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:46:48 -0700 (PDT)
From: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 11:16:31 +0530
Subject: [PATCH RESEND v8 2/2] watchdog: Add driver for Gunyah Watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gunyah_watchdog-v8-2-4c1c0689de22@oss.qualcomm.com>
References: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
In-Reply-To: <20260311-gunyah_watchdog-v8-0-4c1c0689de22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dd521
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773207995; l=10652;
 i=pavan.kondeti@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=AkD6Bx3QmX4ZCXK1sI5kNwmAIUv8jyMHiiakfJwVVFE=;
 b=FtAr0y2zCMhnE4sE7CCC8Ex1SyPEmd0r0yJeT1aYilu1SurYGDiUcNvss/UNcEDrvuF4+eO/N
 GPwax495BuUCkVRGWEwRu/qyHLvG13uVaITv11NFetuTr3Bi0Z1dnXt
X-Developer-Key: i=pavan.kondeti@oss.qualcomm.com; a=ed25519;
 pk=Pdl9NnQpMlqbYaAGGkgBGpURTnZFe2de5LRZSGHkbHY=
X-Proofpoint-ORIG-GUID: wodqDELJR8VrRupA2Cooopsh3xQ8hUcE
X-Proofpoint-GUID: wodqDELJR8VrRupA2Cooopsh3xQ8hUcE
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b101ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=_jlGtV7tAAAA:8 a=uHUF2ZwmFKjH5m5PrtYA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0NiBTYWx0ZWRfX8cedwReY4HX5
 H1KjOdL7kesPSnsx7QIOnI8Ohb0O5k4WBbzv6iaUAX62g0MpZuJHJ/5jt9NwGQfaAkQn//qB225
 me/DeJb6q2u4Fi9QTTbiNiFkyMhfb/k4qDPajnrQothETsI2QNADKWQqzR+R3FQcksfzLp0sokl
 KGlzhCctuQe6wg+uvoyWU1txz4wfewrGesa5xJPT/93IL6CD+AUnhjp4DxkvMKV/ZB4Zql7UqsA
 NJBH++0KjdvbvtGTYL7zdkiSlfirsAM1wZ4FDsurBIA4YsQPHNeJevfMFRNrWCm4Njz6Wiwqj6Q
 LKs3RSTXCC3SPtm0RunCALJZKZhaKDYv+8CnAbVTiPcdxfCthIr4Tno58Ey/PUePo/JkvD4l6ss
 W23/AldML9Ac4gRRuSQdagvY6shQ4rQvDNU1lFGha7aBoz3nK6HMmsuP+RX0PQR86uTLZkhboEk
 McisTvJDsG2QDr++6nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110046
X-Rspamd-Queue-Id: 4C50B25C894
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-96872-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,roeck-us.net:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>

On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
through MMIO is not available on all platforms. Depending on the
hypervisor configuration, the watchdog is either fully emulated or
exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
Specific Hypervisor Service Calls space.

Add driver to support the SMC-based watchdog provided by the Gunyah
Hypervisor. Device registration is done in the QCOM SCM driver after
checks to restrict the watchdog initialization to Qualcomm devices
running under Gunyah.

Gunyah watchdog is not a hardware but an SMC-based vendor-specific
hypervisor interface provided by the Gunyah hypervisor. The design
involving QCOM SCM driver for registering the platform device has been
devised to avoid adding non-hardware nodes to devicetree.

Tested-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Signed-off-by: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>
---
 MAINTAINERS                   |   1 +
 drivers/watchdog/Kconfig      |  13 +++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/gunyah_wdt.c | 261 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 276 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..842306623b1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3325,6 +3325,7 @@ F:	arch/arm64/boot/dts/qcom/
 F:	drivers/bus/qcom*
 F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
+F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5..5f1dfb6ac41b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2354,4 +2354,17 @@ config KEEMBAY_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called keembay_wdt.
 
+config GUNYAH_WATCHDOG
+	tristate "Qualcomm Gunyah Watchdog"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on HAVE_ARM_SMCCC
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for watchdog timer provided by the
+	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
+	  to interact with Gunyah Watchdog.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gunyah_wdt.
+
 endif # WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index d2fb16b9f9ce..4d1547702ef0 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
 obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
 obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
+obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
 
 # X86 (i386 + ia64 + x86_64) Architecture
 obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
new file mode 100644
index 000000000000..49dfef459e84
--- /dev/null
+++ b/drivers/watchdog/gunyah_wdt.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
+
+/* SMCCC function IDs for watchdog operations */
+#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
+#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
+#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
+#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
+
+/*
+ * Control values for GUNYAH_WDT_CONTROL.
+ * Bit 0 is used to enable or disable the watchdog. If this bit is set,
+ * then the watchdog is enabled and vice versa.
+ * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
+ * it's expected to be 1.
+ */
+#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
+#define WDT_CTRL_DISABLE BIT(1)
+
+enum gunyah_error {
+	GUNYAH_ERROR_OK				= 0,
+	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
+	GUNYAH_ERROR_ARG_INVAL			= 1,
+};
+
+/**
+ * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
+ * @gunyah_error: Gunyah hypercall return value
+ */
+static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
+{
+	switch (gunyah_error) {
+	case GUNYAH_ERROR_OK:
+		return 0;
+	case GUNYAH_ERROR_UNIMPLEMENTED:
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
+			   unsigned long arg2)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_smc(func_id, arg1, arg2, &res);
+	return gunyah_error_remap(res.a0);
+}
+
+static int gunyah_wdt_start(struct watchdog_device *wdd)
+{
+	unsigned int timeout_ms;
+	struct device *dev = wdd->parent;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+	if (ret && watchdog_active(wdd)) {
+		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
+		return ret;
+	}
+
+	timeout_ms = wdd->timeout * 1000;
+	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME, timeout_ms, timeout_ms);
+	if (ret) {
+		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
+	if (ret)
+		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int gunyah_wdt_stop(struct watchdog_device *wdd)
+{
+	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+}
+
+static int gunyah_wdt_ping(struct watchdog_device *wdd)
+{
+	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
+}
+
+static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
+				  unsigned int timeout_sec)
+{
+	wdd->timeout = timeout_sec;
+
+	if (watchdog_active(wdd))
+		return gunyah_wdt_start(wdd);
+
+	return 0;
+}
+
+static int gunyah_wdt_get_time_since_last_ping(void)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_smc(GUNYAH_WDT_STATUS, 0, 0, &res);
+	if (res.a0)
+		return gunyah_error_remap(res.a0);
+
+	return res.a2 / 1000;
+}
+
+static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	int seconds_since_last_ping;
+
+	seconds_since_last_ping = gunyah_wdt_get_time_since_last_ping();
+	if (seconds_since_last_ping < 0 ||
+	    seconds_since_last_ping > wdd->timeout)
+		return 0;
+
+	return wdd->timeout - seconds_since_last_ping;
+}
+
+static int gunyah_wdt_restart(struct watchdog_device *wdd,
+			      unsigned long action, void *data)
+{
+	/* Set timeout to 1ms and send a ping */
+	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0);
+	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1);
+	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0);
+	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0);
+
+	/* Wait to make sure reset occurs */
+	mdelay(100);
+
+	return 0;
+}
+
+static const struct watchdog_info gunyah_wdt_info = {
+	.identity = "Gunyah Watchdog",
+	.options = WDIOF_SETTIMEOUT
+		 | WDIOF_KEEPALIVEPING
+		 | WDIOF_MAGICCLOSE,
+};
+
+static const struct watchdog_ops gunyah_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = gunyah_wdt_start,
+	.stop = gunyah_wdt_stop,
+	.ping = gunyah_wdt_ping,
+	.set_timeout = gunyah_wdt_set_timeout,
+	.get_timeleft = gunyah_wdt_get_timeleft,
+	.restart = gunyah_wdt_restart
+};
+
+static int gunyah_wdt_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0);
+	if (ret == -EOPNOTSUPP)
+		return -ENODEV;
+
+	if (ret)
+		return dev_err_probe(dev, ret, "status check failed\n");
+
+	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdd)
+		return -ENOMEM;
+
+	wdd->info = &gunyah_wdt_info;
+	wdd->ops = &gunyah_wdt_ops;
+	wdd->parent = dev;
+
+	/*
+	 * Although Gunyah expects 16-bit unsigned int values as timeout values
+	 * in milliseconds, values above 0x8000 are reserved. This limits the
+	 * max timeout value to 32 seconds.
+	 */
+	wdd->max_timeout = 32; /* seconds */
+	wdd->min_timeout = 1; /* seconds */
+	wdd->timeout = wdd->max_timeout;
+
+	gunyah_wdt_stop(wdd);
+	platform_set_drvdata(pdev, wdd);
+	watchdog_set_restart_priority(wdd, 0);
+
+	return devm_watchdog_register_device(dev, wdd);
+}
+
+static void gunyah_wdt_remove(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd = platform_get_drvdata(pdev);
+
+	gunyah_wdt_stop(wdd);
+}
+
+static int gunyah_wdt_suspend(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdd))
+		gunyah_wdt_stop(wdd);
+
+	return 0;
+}
+
+static int gunyah_wdt_resume(struct device *dev)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	if (watchdog_active(wdd))
+		gunyah_wdt_start(wdd);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
+
+/*
+ * Gunyah watchdog is a vendor-specific hypervisor interface provided by the
+ * Gunyah hypervisor. Using QCOM SCM driver to detect Gunyah watchdog SMCCC
+ * hypervisor service and register platform device when the service is available
+ * allows this driver to operate independently of the devicetree and avoids
+ * adding the non-hardware nodes to the devicetree.
+ */
+static const struct platform_device_id gunyah_wdt_id[] = {
+	{ .name = "gunyah-wdt" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, gunyah_wdt_id);
+
+static struct platform_driver gunyah_wdt_driver = {
+	.driver = {
+		.name = "gunyah-wdt",
+		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
+	},
+	.id_table = gunyah_wdt_id,
+	.probe = gunyah_wdt_probe,
+	.remove = gunyah_wdt_remove,
+};
+
+module_platform_driver(gunyah_wdt_driver);
+
+MODULE_DESCRIPTION("Gunyah Watchdog Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


