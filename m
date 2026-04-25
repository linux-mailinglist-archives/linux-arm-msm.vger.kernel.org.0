Return-Path: <linux-arm-msm+bounces-104527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d9N8Dwzk7GmrdQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 17:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D734466D59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 17:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 228FF3009CDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B603C303C87;
	Sat, 25 Apr 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QH67l05X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwmIYzYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74308282F2F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777132553; cv=none; b=e/sgFE43MqvaKZ/RnVpwZZ5ZgUvWW7lDuQPMMRM7XsF+hIrsCwfXjJY/PMvMs6fL1PGyIgbd58aw1aGY3tMwxc3p6yviYLeYmm1+rEM+AX8tr68P4jg9BhQC3A3zAKpjSfsuBRpIbFGzSeheLxNkL0+izC3S7JcTEEsC3VNez0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777132553; c=relaxed/simple;
	bh=P+4h5fwiOnJO1t6o29m/cyIkqRizFv8mO7bSwaelWlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5+K8aPGl5Wz9pzOaC0QDXOQzY2/5BI8HBCGVSMBNE2tMTvKpXsJ6xH8altZPTpV14nkR9gB0phm4Cs9jbwkIEcvj4L6qFpeTygECguxcvuOr8H0BkcdGlKp6fpyhglFRV7YM8G4Fx3p0lnho+28YFAjossBwp6ugTpZHBqt1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QH67l05X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwmIYzYT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3Mlah206330
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRV
	D9jX0PII=; b=QH67l05XA6U75Uyd4949Wxo+dijfYsqZuGx212a06H67q0HoSF1
	Wb/uuUNVzDjwwppI/9Rar+x13umR8Dp1Ch8/G31YMVw56KSZBPL89G8jgWAas/MS
	cCNwjyMwxEypLAJQl+fisJPjcMDjIsEXYcOI+sh+ZYvAt4DAAZv6TVvduEMhzzaa
	YOzqnuTXp8H18nuYn1otRHkEgX1jk9UK1QF4dYCXMUzRom6i5RkYxKb3i2C+HVAJ
	DyaX/gfntLVIlxnGRQ+4sfNvaS5ZaKgZ8bOpKpFjEvAQKrHByP+xeGFdICr0s8Uo
	CGS5OB2C3WjXrG917s8851+6Q5GpXAGHFYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf186c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 15:55:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso119490271cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777132550; x=1777737350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRVD9jX0PII=;
        b=WwmIYzYTLPcvq+XBxJR6BJdzb0AWfiBQdKvHfx6XhwT1MgIRzZc61dI581WJciKo8V
         M9tW4lfHS2PVr5z2gska1qQ73yXeTG8mlkVd36gFnrQzJQhRl8yJWvfYMHBNaoeOmJmc
         4SQsbrEEdEqCNmE66rDwKK0d65UY0aZowKV/0GdGFwzPEoB5efiUi01AY5HtVBFRv9Yk
         ZReHXDybt+zH49FNVccyuIJXUFt3MTjZH+0LbPdaPoXP6XoZUKj/wHCq5K/09vJjkP0S
         7dqsAwS7MwgQBs/s6LY14yG+XZYaH7bih2+T5afi2BdO5VBsf2ZY5f1QBHlNoGvJTAay
         2suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777132550; x=1777737350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHdirXqhE4f6X9ISU7T1X5gfWDY1d/OSWRVD9jX0PII=;
        b=ensxqx5R4v/ElqG+Pj2EeiCSsl7Q4nP+pxOfpDMQrP+xuLMUnZ1CBGSU6a4G/mPc84
         2QQ4GyrnMiB+9jTsPhLoj4vMqsspUx7tBuEUv0wmXeMSzuQROsY1YKbF9JzdLTsFDdGe
         zdXJATU70q6j6H3B1iOK91TaWX3ZRJLfkLWwlZJrdT5OG8gNy0hVm153z2oQaa5DBhw4
         wr7cLXzLKz2OxuW5+qmYn/DReAlQT6pvAW9suLbiAjADe4RVYJDaurOIpwVGUPzwK+Sk
         orQlc+NrpEjsxHzxsIVs4jzGW1MvW5ZZxbgyzLzYtAdZwpeuH11dwZ19aF4+Y5uIiBAU
         0Alw==
X-Forwarded-Encrypted: i=1; AFNElJ+RLjUhQ/C4Vy/nuN3Exy145UM0e7NvOxNAc9IM+hlYPd88MnB4VHZv3fH8p2EvzKppNJD2a2mc8E3heqOp@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQfV+9xB9JVjW/+fGydSdrl+sL28cHK0tT1J2R4wCYhuMMw/6
	ktLoqAocB2UP7g2N1fzIQ94PDte4nfZgONEKPF58H3iRwhPZohPz9Ak0vrHaEaEhdwCJZ+eQKjD
	NkFO0o0hMGb3aRobo1nMY01liaNr4wIqIcpGVTxYzT+/8kqR7kMngdDeavImuGGoGytUp
X-Gm-Gg: AeBDiev5enB/e64M4n4PZ/fY1tGKhV7aUytrslV1ohfxlheBd0XMpCWrfdcqinfJdSN
	RfHz+eeTcbqDBwm0onZZaGG3EOrVqWWbXlVFsAQ0sVW1twxCfivYtM5o1Q7FkY0b7MhOTSwYmzZ
	u6ocDB5mLbpw8ZgMoo8Hg1sl9IVQpnzvLRMd0lJ7orv3qHu7Yvm69rl/YkH3RJXysM9zq35oJdh
	2MYLHJJrR6Q4GPl1eDn2YyDtTzb3MrN35KOt31OV+qK1Nt3vXA/0O3MPrgDDaQsI3eW2U9NrRtL
	/3/LpjVQg2WwQINe4gaX6EEJvMuxmBVNbIPTEMe2HaqLZ4HSjcBHuQMkd4CBlCjacbhOh0wKwhI
	xRi3cH57KFz33n6cZ5uUmx29bgFXOmrFRojIxiSeGKK1xbgmDLm9J0EaYr41nWurXcGFjN48rHq
	r61gUI89+pjVNcJGIJF7xtqZxkRenms2gaJ19amJw=
X-Received: by 2002:a05:622a:429b:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50e36b865f5mr505994901cf.3.1777132549431;
        Sat, 25 Apr 2026 08:55:49 -0700 (PDT)
X-Received: by 2002:a05:622a:429b:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50e36b865f5mr505994561cf.3.1777132548840;
        Sat, 25 Apr 2026 08:55:48 -0700 (PDT)
Received: from quoll.mediaserver.passengera.com (user-31-175-2-65.play-internet.pl. [31.175.2.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm676083465e9.3.2026.04.25.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 08:55:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: Make important drivers default
Date: Sat, 25 Apr 2026 17:55:06 +0200
Message-ID: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24919; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=P+4h5fwiOnJO1t6o29m/cyIkqRizFv8mO7bSwaelWlQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7OPZros0Cpd2Oh02GAmGI62SbiIH4OfBzFLAC
 FRwz+MqK92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaezj2QAKCRDBN2bmhouD
 17fwD/9Xaacev8/AKN2AsLk4O/ioR4qZk1GBiJXyFZ0lLegMp2OAF+Z+mUquwYcX67XKVJ55M6S
 FG5zmVAMWp7H5GL7Mv416VqfD9PXhfZQATCabq9fhxbStW8JHkuT5mRWVOkMtAYbfpApphEsSWX
 7rqusuOuoM2b6ryO847sQbi4fzScTqJrPSnahFAEGyFqWbQ09Fo3o2MIY73d65SQEkEMeye2zkR
 F5cDL02tlQyvYOJLXSR60ZWMjPubDzhJihsGlQP5llWEyCYA6UplXT48LnKf4Ns2RMn5aphahw9
 LJ4STmTLAHZXSEQJerQVPRRRcF/DZI5WUCg8BCEkKoOru+mw0rI8dxv4Tk2zyEnfosKatB8ZBPx
 AxZymb3RSFlWiLvaDncjDKShRR/ezFq0ovYVj+Gp156tVZdCSaj+WwO4B+jOxUkhENRmetHDgvY
 h0QXBp7fdVgBTrGlIBJitjSLidyddLjH7lQIyXBm59oVfKN0dHxPRdOe8XYfESj/zZuJTjacHK/
 P+rOkMHjZmgYuCXv8dHpF5QrEcTOWYRjMykbreWnML51lUaYZSF2flgyE0s4k8ZpTfgWyf0njUv
 s6V60cUO8J+xje3XdNN3Kdc3GNhEjVk9G5FAwe74Y+P7AArF/jsJPi/gijhZTdTSYayn+Xv0tCR LfEEyd2edN1l1NQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wMoWNtL6g9YnKwTtwd91JmG48FqSwUKU
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ece406 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=0C0oXSgccRrV03aUni/DzQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Amw14q-JFhzbT9FOICoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: wMoWNtL6g9YnKwTtwd91JmG48FqSwUKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE2NSBTYWx0ZWRfX3O++rMi+l0j6
 2PEL07fuCBzNeHJRXH2Eppu4YDwc7dGuS2ypEoBCGFvgcN7r4HwHu5czvD8K7BFy9Mycu+DWuMN
 syF2drpWgRsKiMkMLjelFbznQRVSpCSVmXuy4ODLb3SVMge4+FJQShXDiLJ1xhaEOwKaIHde2g4
 dRPMpApFW/yK1bahpl1lg9YkqO3kXIx3cLqkodLrHukJpfo9kN+gtDzZe74L6jCfyPKiEUEmUCz
 SMHIrBy8uPcPi9/RQ5oOvZzI6nXHnhuIA9WPhj0y0HfJpRC+sKTvm/iSuhRz7d5LfRCXyXkXkdP
 7GVaYU914nxTcvgZFVCPWpGom1veW3QxhXU+R1AE8TIfwmVoF/aJxLuxjJhrOSuPIRe95RCqDIb
 ODI2VYQ58l0lOGjm7Meo8F8D0tmn0B5tI2YfARy4qHf3KLGnA97bomrRrQIdtDqQBti8q6BcHK/
 w56/j7xH7D2rqLZxgVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250165
X-Rspamd-Queue-Id: 7D734466D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104527-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
essential for booting up SoCs and are not really optional for a given
platform.  Kernel should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
   not selected before but should be, because these platforms need them
   for proper boot.

2. arm qcom_defconfig: no changes.

3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
   platforms, which are already enabled on qcom_defconfig.

4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I did similar change for clocks and I will be continuing with
interconnect and other missing pieces.
---
 arch/arm/configs/multi_v7_defconfig |  8 ----
 arch/arm/configs/qcom_defconfig     | 15 --------
 arch/arm64/configs/defconfig        | 46 ----------------------
 drivers/pinctrl/qcom/Kconfig        |  1 +
 drivers/pinctrl/qcom/Kconfig.msm    | 60 +++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 69 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..3847a6c17193 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -483,14 +483,6 @@ CONFIG_PINCTRL_PALMAS=y
 CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S500=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..03309b89ea4c 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -123,22 +123,7 @@ CONFIG_I2C_QUP=y
 CONFIG_SPI=y
 CONFIG_SPI_QUP=y
 CONFIG_SPMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ4019=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8226=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MDM9607=y
-CONFIG_PINCTRL_MDM9615=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8909=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_GPIOLIB=y
-CONFIG_PINCTRL_SDX55=y
-CONFIG_PINCTRL_SDX65=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..f4dfd0cc853c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -652,54 +652,8 @@ CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_ELIZA=y
-CONFIG_PINCTRL_GLYMUR=y
-CONFIG_PINCTRL_IPQ5018=y
-CONFIG_PINCTRL_IPQ5210=y
-CONFIG_PINCTRL_IPQ5332=y
-CONFIG_PINCTRL_IPQ5424=y
-CONFIG_PINCTRL_IPQ8074=y
-CONFIG_PINCTRL_IPQ6018=y
-CONFIG_PINCTRL_IPQ9574=y
-CONFIG_PINCTRL_KAANAPALI=y
-CONFIG_PINCTRL_MSM8916=y
-CONFIG_PINCTRL_MSM8953=y
-CONFIG_PINCTRL_MSM8976=y
-CONFIG_PINCTRL_MSM8994=y
-CONFIG_PINCTRL_MSM8996=y
-CONFIG_PINCTRL_MSM8998=y
-CONFIG_PINCTRL_QCM2290=y
-CONFIG_PINCTRL_QCS404=y
-CONFIG_PINCTRL_QCS615=y
-CONFIG_PINCTRL_QCS8300=y
-CONFIG_PINCTRL_QDF2XXX=y
-CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
-CONFIG_PINCTRL_SA8775P=y
-CONFIG_PINCTRL_SC7180=y
-CONFIG_PINCTRL_SC7280=y
-CONFIG_PINCTRL_SC8180X=y
-CONFIG_PINCTRL_SC8280XP=y
-CONFIG_PINCTRL_SDM660=y
-CONFIG_PINCTRL_SDM670=y
-CONFIG_PINCTRL_SDM845=y
-CONFIG_PINCTRL_SDX75=y
 CONFIG_PINCTRL_SKY1=y
-CONFIG_PINCTRL_SM4450=y
-CONFIG_PINCTRL_SM6115=y
-CONFIG_PINCTRL_SM6125=y
-CONFIG_PINCTRL_SM6350=y
-CONFIG_PINCTRL_SM6375=y
-CONFIG_PINCTRL_MILOS=y
-CONFIG_PINCTRL_SM8150=y
-CONFIG_PINCTRL_SM8250=y
-CONFIG_PINCTRL_SM8350=y
-CONFIG_PINCTRL_SM8450=y
-CONFIG_PINCTRL_SM8550=y
-CONFIG_PINCTRL_SM8650=y
-CONFIG_PINCTRL_SM8750=y
-CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 80af372a1147..ed5347cebb4c 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -6,6 +6,7 @@ config PINCTRL_MSM
 	depends on GPIOLIB
 	# OF for pinconf_generic_dt_node_to_map_group() from GENERIC_PINCONF
 	depends on OF
+	default ARCH_QCOM
 	select QCOM_SCM
 	select PINMUX
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index 836cdeca1006..1f77ccb2dcaf 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -4,6 +4,7 @@ if PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8064 platform.
@@ -11,6 +12,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
@@ -18,6 +20,7 @@ config PINCTRL_APQ8084
 config PINCTRL_ELIZA
 	tristate "Qualcomm Technologies Inc Eliza pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -28,6 +31,7 @@ config PINCTRL_ELIZA
 config PINCTRL_GLYMUR
 	tristate "Qualcomm Technologies Inc Glymur pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -38,6 +42,7 @@ config PINCTRL_GLYMUR
 config PINCTRL_HAWI
 	tristate "Qualcomm Technologies Inc Hawi pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -48,6 +53,7 @@ config PINCTRL_HAWI
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
@@ -55,6 +61,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ5018
 	tristate "Qualcomm Technologies, Inc. IPQ5018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -64,6 +71,7 @@ config PINCTRL_IPQ5018
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
@@ -71,6 +79,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ5210
 	tristate "Qualcomm Technologies Inc IPQ5210 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -79,6 +88,7 @@ config PINCTRL_IPQ5210
 config PINCTRL_IPQ5332
 	tristate "Qualcomm Technologies Inc IPQ5332 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -87,6 +97,7 @@ config PINCTRL_IPQ5332
 config PINCTRL_IPQ5424
 	tristate "Qualcomm Technologies, Inc. IPQ5424 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -96,6 +107,7 @@ config PINCTRL_IPQ5424
 config PINCTRL_IPQ8074
 	tristate "Qualcomm Technologies, Inc. IPQ8074 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -105,6 +117,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm Technologies, Inc. IPQ6018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -114,6 +127,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_IPQ9574
 	tristate "Qualcomm Technologies, Inc. IPQ9574 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -123,6 +137,7 @@ config PINCTRL_IPQ9574
 config PINCTRL_KAANAPALI
 	tristate "Qualcomm Technologies Inc Kaanapali pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -131,6 +146,7 @@ config PINCTRL_KAANAPALI
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -139,6 +155,7 @@ config PINCTRL_MSM8226
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8660 platform.
@@ -146,12 +163,14 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
 
 config PINCTRL_MDM9607
 	tristate "Qualcomm 9607 pin controller driver"
+	default ARCH_QCOM if ARM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9607 platform.
@@ -159,6 +178,7 @@ config PINCTRL_MDM9607
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9615 platform.
@@ -166,6 +186,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8974 platform.
@@ -173,12 +194,14 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8909
 	tristate "Qualcomm 8909 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8909 platform.
 
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
@@ -192,6 +215,7 @@ config PINCTRL_MSM8917
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
@@ -201,6 +225,7 @@ config PINCTRL_MSM8953
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
@@ -210,6 +235,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
@@ -218,6 +244,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
@@ -225,6 +252,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -232,6 +260,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCM2290
 	tristate "Qualcomm QCM2290 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCM2290 platform.
@@ -239,6 +268,7 @@ config PINCTRL_QCM2290
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -246,6 +276,7 @@ config PINCTRL_QCS404
 config PINCTRL_QCS615
 	tristate "Qualcomm Technologies QCS615 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found on the Qualcomm QCS615 platform.
@@ -253,6 +284,7 @@ config PINCTRL_QCS615
 config PINCTRL_QCS8300
 	tristate "Qualcomm Technologies QCS8300 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm QCS8300 platform.
@@ -260,6 +292,7 @@ config PINCTRL_QCS8300
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm Technologies QDF2xxx pin controller driver"
 	depends on ACPI
+	default ARCH_QCOM if ARM64
 	help
 	  This is the GPIO driver for the TLMM block found on the
 	  Qualcomm Technologies QDF2xxx SOCs.
@@ -267,6 +300,7 @@ config PINCTRL_QDF2XXX
 config PINCTRL_QDU1000
 	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf, and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -275,6 +309,7 @@ config PINCTRL_QDU1000
 config PINCTRL_SA8775P
 	tristate "Qualcomm Technologies Inc SA8775P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm SA8775P platforms.
@@ -290,6 +325,7 @@ config PINCTRL_SAR2130P
 config PINCTRL_SC7180
 	tristate "Qualcomm Technologies Inc SC7180 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -298,6 +334,7 @@ config PINCTRL_SC7180
 config PINCTRL_SC7280
 	tristate "Qualcomm Technologies Inc SC7280 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -307,6 +344,7 @@ config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -315,6 +353,7 @@ config PINCTRL_SC8180X
 config PINCTRL_SC8280XP
 	tristate "Qualcomm Technologies Inc SC8280xp pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -323,6 +362,7 @@ config PINCTRL_SC8280XP
 config PINCTRL_SDM660
 	tristate "Qualcomm Technologies Inc SDM660 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -331,6 +371,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM670
 	tristate "Qualcomm Technologies Inc SDM670 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -340,6 +381,7 @@ config PINCTRL_SDM845
 	tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -348,6 +390,7 @@ config PINCTRL_SDM845
 config PINCTRL_SDX55
 	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -356,6 +399,7 @@ config PINCTRL_SDX55
 config PINCTRL_SDX65
         tristate "Qualcomm Technologies Inc SDX65 pin controller driver"
         depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -364,6 +408,7 @@ config PINCTRL_SDX65
 config PINCTRL_SDX75
         tristate "Qualcomm Technologies Inc SDX75 pin controller driver"
         depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -372,6 +417,7 @@ config PINCTRL_SDX75
 config PINCTRL_SM4450
 	tristate "Qualcomm Technologies Inc SM4450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -380,6 +426,7 @@ config PINCTRL_SM4450
 config PINCTRL_SM6115
 	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -388,6 +435,7 @@ config PINCTRL_SM6115
 config PINCTRL_SM6125
 	tristate "Qualcomm Technologies Inc SM6125 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -396,6 +444,7 @@ config PINCTRL_SM6125
 config PINCTRL_SM6350
 	tristate "Qualcomm Technologies Inc SM6350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -404,6 +453,7 @@ config PINCTRL_SM6350
 config PINCTRL_SM6375
 	tristate "Qualcomm Technologies Inc SM6375 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -412,6 +462,7 @@ config PINCTRL_SM6375
 config PINCTRL_SM7150
 	tristate "Qualcomm Technologies Inc SM7150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -420,6 +471,7 @@ config PINCTRL_SM7150
 config PINCTRL_MILOS
 	tristate "Qualcomm Technologies Inc Milos pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -428,6 +480,7 @@ config PINCTRL_MILOS
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -436,6 +489,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm Technologies Inc SM8250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -444,6 +498,7 @@ config PINCTRL_SM8250
 config PINCTRL_SM8350
 	tristate "Qualcomm Technologies Inc SM8350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -452,6 +507,7 @@ config PINCTRL_SM8350
 config PINCTRL_SM8450
 	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -460,6 +516,7 @@ config PINCTRL_SM8450
 config PINCTRL_SM8550
 	tristate "Qualcomm Technologies Inc SM8550 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -468,6 +525,7 @@ config PINCTRL_SM8550
 config PINCTRL_SM8650
 	tristate "Qualcomm Technologies Inc SM8650 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -476,6 +534,7 @@ config PINCTRL_SM8650
 config PINCTRL_SM8750
 	tristate "Qualcomm Technologies Inc SM8750 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -484,6 +543,7 @@ config PINCTRL_SM8750
 config PINCTRL_X1E80100
 	tristate "Qualcomm Technologies Inc X1E80100 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
-- 
2.51.0


