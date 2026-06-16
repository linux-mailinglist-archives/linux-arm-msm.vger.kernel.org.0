Return-Path: <linux-arm-msm+bounces-113415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id INZPBSZKMWqPgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:05:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7128868FBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:05:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lT1NAqza;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YXi8nZOk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63E20318D04A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4230335AC32;
	Tue, 16 Jun 2026 13:04:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD131A682B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615055; cv=none; b=HS+HZNWy87puhcwoCXBIpdol4NoiwFF5lAuAafKhrX1ZcTcv0xQy0unLLidQ5KhnfJ4O7tQPgexQbSui5k9R35cAEvk077Sn4hCN1IC3jtsw5UEMXWKRLQrpkdwTpgXf7PqjG5Hl08qjx4dGAcx04qgGpiJo8NQI8xECckrmMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615055; c=relaxed/simple;
	bh=Qj7nElh8Dxw2oCGhto93gjgUW0SgkImRKgctY43R//U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FY7D9Mzgc6n1KGIf81Wt1eE1LauK/7htb7Dpvtou9X9XTkDCRHMZmQcSDw61VEizly3+14wz1N4BkBBRM0KIP+bLtqFg+b4gH9TCiCf5o4WELwcgCvDY6Wgc37pWVJZbQVXhwIncSJ1r+N8T4u7WLerhiLAE5h0pYoiAt5DRWDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lT1NAqza; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXi8nZOk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GAC11G3256252
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ef5Ji2dDzze
	Kj36vpeP5fZdbDYLrkWxDfp9sewJA92o=; b=lT1NAqzaVk8DXcX0Z8muBay5nbR
	sgT8bMIaoPXQNX4Rlj3B84lQolsmQUp0VSTEaPIOkxUgJu3ne82cDor6Yag8jvHq
	i/aTUKYOcWPs3+MgdlfEMrdLBpYNCUM7sgdIZuROcdF2aA7QcPAU3VNPyRvpaEcA
	P5GEUZIz2WgRb1ZGotDLPsqOj1KuildFR+g0C2L5S1Ro1ZcS82etA4fE5g1Ik7a/
	VI8iA1+QEswjwCEjyYwcPfSPu56cAkESOE0VQnUYyZYJkgdpLH+kOXQhQRfNrhOG
	Jx/SaeMtune8wt0BCMBTjNZyEcYs1RqztpAVtoYLo1M0WpM0CWFH0BYE2yw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9unf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:04:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a20348ceso4460665ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615052; x=1782219852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=YXi8nZOkmKoIxVeL0P9LwslWLjzJiaHFWEfeP0Lx1H6A4AvO2z8VEBMES1Ppdkbg6x
         aeLJyvXjf/ifBcDal3JMnYDIB3NaUSYTuGzxGalWtcKv0yZVR6xlO2/IkWmZHjUN28R2
         MeiE9rkECKLdtuzaglRNuu5nXw1PB5f3GS7lTL5PIxbiUYS6oc0QuLj0M25MXuhmM1jk
         Xl7UUS20z0xzjomnNWxvHKCsULIIv0sFIDwDlvxg82s9l5/q1Mj0PpiVNtDigMLO1+9+
         uN1PS+BTnLp0wlz2KL6QCkzYc2Z1r02QgMvWH7+ci74IhW9wGZNcYEAOZVJsySCfMq7b
         H6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615052; x=1782219852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ef5Ji2dDzzeKj36vpeP5fZdbDYLrkWxDfp9sewJA92o=;
        b=jlgCNwPv3uZ1SQe4jk3+FayIuz+jTGsYhXC3amoAqPNZvkHHjstdamNJoHJlxtiFsn
         p7F6ZaZzSpbPAmntBMBzj7THG/2NQ3SKL7tvUnel9vjxXR3bEst4+fB1O8wbQuHe3Fcq
         Cqjt+lzcdBeVg6JtUgwDuATpelgszYLo09hlEruQ+2p2EaHY8FrOxeTMPoIcdreTeehU
         HT9JaT1y467AOPBBALmZxaIZmL1RSl0399Ps7uTYvV+1zaKVz52/MabisxIsvGWc5MDx
         iEizFTLtQ13/LZQ67c0DJgMVY0BYAcloOzzI3df436TtWrVsmgsSUQpc9BCrMjwOKd6g
         2WGA==
X-Gm-Message-State: AOJu0YxixLdGxi+z2V7MLFUtdXao0tovPQQqLq+FZxYY3s/60rm1vKQe
	UuVLdQpMpd5jaoa7dIhvxIAGCVuYqrGBSQVX6/W3I/0m/4D6Hnlr0UHKA3RsQbirirGXOruhiik
	GUJRv3/7GKWX9OtAIWud4cDKLN0oa9+fqWeLLU3VuGt0bDLxWQE/c9h7Pf+rarRSID1tS
X-Gm-Gg: Acq92OFNtNHPahjBhpw3IrRmc7kYDO3gBSKL9Yriw42fDPJJVNaqYDMrXoHKi0LE6vb
	b4tIWOvk9o//jIhF4pRAM5M7nSRQrZtsG14CLWwjvoN2RY2poNjMY5VpaxfrxZTvwPKxfcGXqBn
	gT2ugN8PPqKC8VmljLxvfxHRXVjy/7HKhbck825J7QDzoM414mDjyy4q5qnxbDXKjHr2i0cDHrn
	WDPSjc7zwbJIp5hwfakUIDQGlz04qnJG51e3RHuKIYB8Av2gapBKo1hz8+LDnF0iBpzNJ8ECVo1
	AtIy7sfPhmDWaZESpK4J9d//thmYxU7USrCtTJNv+ftHhAt8U7CPL7NYZYTDH0v4XfmI9Av4vXJ
	K/lP8ewHo9VmzgShDQZGqseITGxSDu4XfAm3hNzCZZF3xzzEn9EjteEwh
X-Received: by 2002:a17:902:cf08:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c69a1b55d7mr39233865ad.29.1781615051557;
        Tue, 16 Jun 2026 06:04:11 -0700 (PDT)
X-Received: by 2002:a17:902:cf08:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2c69a1b55d7mr39233265ad.29.1781615050999;
        Tue, 16 Jun 2026 06:04:10 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c58c3sm134867235ad.23.2026.06.16.06.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:04:10 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V2 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Tue, 16 Jun 2026 18:33:46 +0530
Message-Id: <20260616130347.3096034-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX9vtIVJZsTUjZ
 kKM7cjnPmIBFkDQzfzNVjZsX2R56oN9SRn+tzSAG7ZTfJpcG7g7DLsf5d37iriDB0wL3m6+FV4u
 7doQsc9crlV8GoO5bAO83fqx9zXrbq4=
X-Proofpoint-GUID: FB9mdaOXosMPIsxajI1oxDWeQoI_EK-Z
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a3149cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MGA-IAg3UYKhKOWSYZAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FB9mdaOXosMPIsxajI1oxDWeQoI_EK-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMyBTYWx0ZWRfX25BIu36sA13B
 SWBtVEZl76+M13fMZtei5QybZn/+jZiWYCW1bH0u5n5GI/o9byN0AemNA2q5IXlca8KyWAhBfuV
 j369gCc2g/aLM0M4gWDvwhzbjGVk5UwMXMaDhCoJbgyxH4mWv7LdppnbiOPbMblkF8Drg99aUnK
 VHoCqNOuSaz9oIMCAuX8sdNXzcsuJu39CRhYC3Md7MKtZ+rJNcj4Hm46oRsvAPrPuD01Ys8T/PP
 ujQU6KAej3fDnCZD0qs5rXqYb4Sa+p6fehCyGhKjYtg9iD0r7+dd6IFJ3FiBibaBZgfSFo8g2qU
 xahItp7TgkV1inoCF6lveWqHbhuMiPtECf2fLhrABcFklgzk3EXMwcgcnDG55rlPYovlbirptGP
 88PKR/2LvMD7fgPyz3+DEBZZjkyBGLraUajvcuJF/qCtapdzqltlBe4jRWH/FghA8GQKirGHPm4
 RImnoB9y4yE55hyvJMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113415-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7128868FBB5

The monaco EVK board supports either eMMC or SD-card, but only one
can be active at a time.

Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
to support SD Card for storage via a device tree overlay. This allows
eMMC support to be enabled through a separate overlay when required.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..3c5983bff00c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -69,6 +69,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
-- 
2.34.1


