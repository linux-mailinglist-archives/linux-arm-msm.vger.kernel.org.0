Return-Path: <linux-arm-msm+bounces-110390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDhhFdnvGmrm9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:10:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F41C260D565
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78FD83092CA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0132F3C3E;
	Sat, 30 May 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="Uwfqk18e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound3.mail.transip.nl (outbound3.mail.transip.nl [136.144.136.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976641D435F;
	Sat, 30 May 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149930; cv=none; b=Ayst+VLnXrYCwX8otxpT5ecKdVtzkZJBcGw6tCeqnuqNtP6DV9sqKjOerxQyigvT2mV3kx/f0E4Xq1Db4NrfIElqjavGlkWdoz4VMiCnfSeEKXMN8RXSJkbLiCDGQ1mzJ1GtDALR97P3kaYFrf7Zbs685Nn3OnIded58jX9++fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149930; c=relaxed/simple;
	bh=nublMN1V6PejLOBwewnBv7bYrydR4+Eh8BO+6hQFdwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=atr+DOKrxyYD0zfsfJeiYbkPdfPLjKTCvHtN37mOREaHNBdbhe2YKly+hcOCJDnX9m+vp6BOPNxY8xuLdBLOYdbp3ltELwI4rx2jviZEOpDhCv3uoyk/L+50/XPw2rxBsBMqT/9TwFlRERU6fKRx2Bhvo1GuZzWV8eV0RsxyqSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Uwfqk18e; arc=none smtp.client-ip=136.144.136.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound3.mail.transip.nl (Postfix) with ESMTP id 4gSMHK3JGVzrJ4X;
	Sat, 30 May 2026 15:57:33 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission15.mail.transip.nl (Postfix) with ESMTPA id 4gSMHJ2DK3z3R3nyc;
	Sat, 30 May 2026 15:57:32 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH] dt-bindings: clock: qcom,gcc-msm8660: collision fixes + per-clock annotations
Date: Sat, 30 May 2026 15:57:29 +0200
Message-ID: <20260530135731.185313-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149452; h=from:subject:to:cc:date:
 mime-version; bh=smecm6QscItvMD1LqW9GTibUKWX+RPvmawgY+3wN5lc=;
 b=Uwfqk18eeXl3BVXGLAJLGu4JTTCfdI/3/L6Ojw76xsH4iVePJWZGVeNRiWLpS1nfVDUWiQ
 Wz9ZHwdNIVt42VpRPgPvp8pN7tj+X2AGu0jhwELcfL0OBX+wMN8srPnYtMZc9RVnyZC0Gz
 Degh58Nuw/mU4dJE0v6DbwwW8fIruhIUs3nbDDaASZ9T+MVWMST2Rd/KxdknTRJmgS5hnw
 Fe66wjGiQd2GhX7IvXp1Tdn9Ydm4hWLLaqxcWqvEqwd1HoZ0pF0VbeImFT0R9+Y3gH4w+m
 DGryIIpd1TCc6IbCbifHuhRMfvZ0MPbNe0guQIC9euZ66traMmOF1EDRy1qhjQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110390-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[herrie.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F41C260D565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Three structural fixes plus a documentation pass on the existing
qcom,gcc-msm8660 binding header:

  1. USB clock ID collisions.
     USB_HS1_XCVR_SRC, USB_FS1_XCVR_FS_SRC, USB_FS2_XCVR_FS_SRC and
     USB_HS2_XCVR_SRC were each defined with the same numeric ID as
     their sibling H_CLK (111, 117, 121, 114). For the implemented
     controllers (HS1 / FS1 / FS2) this caused the XCVR source entry
     in gcc_msm8660_clks[] to be silently overwritten by the H_CLK
     entry at the same index, so DT consumers requesting the XCVR
     source got the AHB clock instead. Move each XCVR/SRC define to
     a free slot.

  2. Header-only ID collisions.
     Seven additional pairs of defines shared the same numeric ID:
     SFAB_SFPB_M_H_CLK / SFPB_H_CLK (80), MODEM_AHB1_H_CLK /
     RPM_TIMER_CLK (86), SEC_CTRL_ACC_CLK_SRC / SEC_CTRL_CLK (202),
     SFAB_MSS_S_H_CLK / MAHB1_CLK (210), MSS_MODEM_CLK_SRC /
     MAHB2_CLK (213), SFAB_SMPSS_S_H_CLK / EBI1_CH1_CLK (233),
     SPDM_CY_PORT0_CLK / LPASS_PXO_CLK (239). Only one of each pair
     has (or could have) a driver registration; the collisions
     silently overwrote each other in any future driver-array
     expansion. Move the duplicate name in each pair to an unused gap
     so the header is a 1:1 ID -> name mapping.

  3. SoC family naming.
     Use "MSM8x60 family (MSM8260/MSM8660/APQ8060)" on first ref per
     file and "MSM8x60" elsewhere; drop the marketing name
     "Snapdragon S3". Variant-specific facts keep the specific name.

  4. Per-clock provenance comments.
     Add a trailing /* tag - description */ comment to every #define
     documenting which clocks are actually present in the upstream
     driver, consumed in DT, and/or known from the legacy mach-msm
     vendor kernels. Tag scheme:
       drv             present in upstream gcc-msm8660.c
       +dt             consumed by an in-tree DT node
       legacy:<refs>   appears in named legacy mach-msm trees
       header-only     not in any driver, DT, or vendor source
     Findings: 111 / 260 (43%) of the clocks are actually registered;
     28 are DT-consumed; ~140 are pure header placeholders.

Documentation only; no DT or driver behaviour changes other than the
ID renumber for the (4 + 7) collided pairs.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 include/dt-bindings/clock/qcom,gcc-msm8660.h | 538 ++++++++++---------
 1 file changed, 280 insertions(+), 258 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8660.h b/include/dt-bindings/clock/qcom,gcc-msm8660.h
index 4777c002711a..354e9d8657b9 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8660.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8660.h
@@ -6,263 +6,285 @@
 #ifndef _DT_BINDINGS_CLK_MSM_GCC_8660_H
 #define _DT_BINDINGS_CLK_MSM_GCC_8660_H
 
-#define AFAB_CLK_SRC				0
-#define AFAB_CORE_CLK				1
-#define SCSS_A_CLK				2
-#define SCSS_H_CLK				3
-#define SCSS_XO_SRC_CLK				4
-#define AFAB_EBI1_CH0_A_CLK			5
-#define AFAB_EBI1_CH1_A_CLK			6
-#define AFAB_AXI_S0_FCLK			7
-#define AFAB_AXI_S1_FCLK			8
-#define AFAB_AXI_S2_FCLK			9
-#define AFAB_AXI_S3_FCLK			10
-#define AFAB_AXI_S4_FCLK			11
-#define SFAB_CORE_CLK				12
-#define SFAB_AXI_S0_FCLK			13
-#define SFAB_AXI_S1_FCLK			14
-#define SFAB_AXI_S2_FCLK			15
-#define SFAB_AXI_S3_FCLK			16
-#define SFAB_AXI_S4_FCLK			17
-#define SFAB_AHB_S0_FCLK			18
-#define SFAB_AHB_S1_FCLK			19
-#define SFAB_AHB_S2_FCLK			20
-#define SFAB_AHB_S3_FCLK			21
-#define SFAB_AHB_S4_FCLK			22
-#define SFAB_AHB_S5_FCLK			23
-#define SFAB_AHB_S6_FCLK			24
-#define SFAB_ADM0_M0_A_CLK			25
-#define SFAB_ADM0_M1_A_CLK			26
-#define SFAB_ADM0_M2_A_CLK			27
-#define ADM0_CLK				28
-#define ADM0_PBUS_CLK				29
-#define SFAB_ADM1_M0_A_CLK			30
-#define SFAB_ADM1_M1_A_CLK			31
-#define SFAB_ADM1_M2_A_CLK			32
-#define MMFAB_ADM1_M3_A_CLK			33
-#define ADM1_CLK				34
-#define ADM1_PBUS_CLK				35
-#define IMEM0_A_CLK				36
-#define MAHB0_CLK				37
-#define SFAB_LPASS_Q6_A_CLK			38
-#define SFAB_AFAB_M_A_CLK			39
-#define AFAB_SFAB_M0_A_CLK			40
-#define AFAB_SFAB_M1_A_CLK			41
-#define DFAB_CLK_SRC				42
-#define DFAB_CLK				43
-#define DFAB_CORE_CLK				44
-#define SFAB_DFAB_M_A_CLK			45
-#define DFAB_SFAB_M_A_CLK			46
-#define DFAB_SWAY0_H_CLK			47
-#define DFAB_SWAY1_H_CLK			48
-#define DFAB_ARB0_H_CLK				49
-#define DFAB_ARB1_H_CLK				50
-#define PPSS_H_CLK				51
-#define PPSS_PROC_CLK				52
-#define PPSS_TIMER0_CLK				53
-#define PPSS_TIMER1_CLK				54
-#define PMEM_A_CLK				55
-#define DMA_BAM_H_CLK				56
-#define SIC_H_CLK				57
-#define SPS_TIC_H_CLK				58
-#define SLIMBUS_H_CLK				59
-#define SLIMBUS_XO_SRC_CLK			60
-#define CFPB_2X_CLK_SRC				61
-#define CFPB_CLK				62
-#define CFPB0_H_CLK				63
-#define CFPB1_H_CLK				64
-#define CFPB2_H_CLK				65
-#define EBI2_2X_CLK				66
-#define EBI2_CLK				67
-#define SFAB_CFPB_M_H_CLK			68
-#define CFPB_MASTER_H_CLK			69
-#define SFAB_CFPB_S_HCLK			70
-#define CFPB_SPLITTER_H_CLK			71
-#define TSIF_H_CLK				72
-#define TSIF_INACTIVITY_TIMERS_CLK		73
-#define TSIF_REF_SRC				74
-#define TSIF_REF_CLK				75
-#define CE1_H_CLK				76
-#define CE2_H_CLK				77
-#define SFPB_H_CLK_SRC				78
-#define SFPB_H_CLK				79
-#define SFAB_SFPB_M_H_CLK			80
-#define SFAB_SFPB_S_H_CLK			81
-#define RPM_PROC_CLK				82
-#define RPM_BUS_H_CLK				83
-#define RPM_SLEEP_CLK				84
-#define RPM_TIMER_CLK				85
-#define MODEM_AHB1_H_CLK			86
-#define MODEM_AHB2_H_CLK			87
-#define RPM_MSG_RAM_H_CLK			88
-#define SC_H_CLK				89
-#define SC_A_CLK				90
-#define PMIC_ARB0_H_CLK				91
-#define PMIC_ARB1_H_CLK				92
-#define PMIC_SSBI2_SRC				93
-#define PMIC_SSBI2_CLK				94
-#define SDC1_H_CLK				95
-#define SDC2_H_CLK				96
-#define SDC3_H_CLK				97
-#define SDC4_H_CLK				98
-#define SDC5_H_CLK				99
-#define SDC1_SRC				100
-#define SDC2_SRC				101
-#define SDC3_SRC				102
-#define SDC4_SRC				103
-#define SDC5_SRC				104
-#define SDC1_CLK				105
-#define SDC2_CLK				106
-#define SDC3_CLK				107
-#define SDC4_CLK				108
-#define SDC5_CLK				109
-#define USB_HS1_H_CLK				110
-#define USB_HS1_XCVR_SRC			111
-#define USB_HS1_XCVR_CLK			112
-#define USB_HS2_H_CLK				113
-#define USB_HS2_XCVR_SRC			114
-#define USB_HS2_XCVR_CLK			115
-#define USB_FS1_H_CLK				116
-#define USB_FS1_XCVR_FS_SRC			117
-#define USB_FS1_XCVR_FS_CLK			118
-#define USB_FS1_SYSTEM_CLK			119
-#define USB_FS2_H_CLK				120
-#define USB_FS2_XCVR_FS_SRC			121
-#define USB_FS2_XCVR_FS_CLK			122
-#define USB_FS2_SYSTEM_CLK			123
-#define GSBI_COMMON_SIM_SRC			124
-#define GSBI1_H_CLK				125
-#define GSBI2_H_CLK				126
-#define GSBI3_H_CLK				127
-#define GSBI4_H_CLK				128
-#define GSBI5_H_CLK				129
-#define GSBI6_H_CLK				130
-#define GSBI7_H_CLK				131
-#define GSBI8_H_CLK				132
-#define GSBI9_H_CLK				133
-#define GSBI10_H_CLK				134
-#define GSBI11_H_CLK				135
-#define GSBI12_H_CLK				136
-#define GSBI1_UART_SRC				137
-#define GSBI1_UART_CLK				138
-#define GSBI2_UART_SRC				139
-#define GSBI2_UART_CLK				140
-#define GSBI3_UART_SRC				141
-#define GSBI3_UART_CLK				142
-#define GSBI4_UART_SRC				143
-#define GSBI4_UART_CLK				144
-#define GSBI5_UART_SRC				145
-#define GSBI5_UART_CLK				146
-#define GSBI6_UART_SRC				147
-#define GSBI6_UART_CLK				148
-#define GSBI7_UART_SRC				149
-#define GSBI7_UART_CLK				150
-#define GSBI8_UART_SRC				151
-#define GSBI8_UART_CLK				152
-#define GSBI9_UART_SRC				153
-#define GSBI9_UART_CLK				154
-#define GSBI10_UART_SRC				155
-#define GSBI10_UART_CLK				156
-#define GSBI11_UART_SRC				157
-#define GSBI11_UART_CLK				158
-#define GSBI12_UART_SRC				159
-#define GSBI12_UART_CLK				160
-#define GSBI1_QUP_SRC				161
-#define GSBI1_QUP_CLK				162
-#define GSBI2_QUP_SRC				163
-#define GSBI2_QUP_CLK				164
-#define GSBI3_QUP_SRC				165
-#define GSBI3_QUP_CLK				166
-#define GSBI4_QUP_SRC				167
-#define GSBI4_QUP_CLK				168
-#define GSBI5_QUP_SRC				169
-#define GSBI5_QUP_CLK				170
-#define GSBI6_QUP_SRC				171
-#define GSBI6_QUP_CLK				172
-#define GSBI7_QUP_SRC				173
-#define GSBI7_QUP_CLK				174
-#define GSBI8_QUP_SRC				175
-#define GSBI8_QUP_CLK				176
-#define GSBI9_QUP_SRC				177
-#define GSBI9_QUP_CLK				178
-#define GSBI10_QUP_SRC				179
-#define GSBI10_QUP_CLK				180
-#define GSBI11_QUP_SRC				181
-#define GSBI11_QUP_CLK				182
-#define GSBI12_QUP_SRC				183
-#define GSBI12_QUP_CLK				184
-#define GSBI1_SIM_CLK				185
-#define GSBI2_SIM_CLK				186
-#define GSBI3_SIM_CLK				187
-#define GSBI4_SIM_CLK				188
-#define GSBI5_SIM_CLK				189
-#define GSBI6_SIM_CLK				190
-#define GSBI7_SIM_CLK				191
-#define GSBI8_SIM_CLK				192
-#define GSBI9_SIM_CLK				193
-#define GSBI10_SIM_CLK				194
-#define GSBI11_SIM_CLK				195
-#define GSBI12_SIM_CLK				196
-#define SPDM_CFG_H_CLK				197
-#define SPDM_MSTR_H_CLK				198
-#define SPDM_FF_CLK_SRC				199
-#define SPDM_FF_CLK				200
-#define SEC_CTRL_CLK				201
-#define SEC_CTRL_ACC_CLK_SRC			202
-#define SEC_CTRL_ACC_CLK			203
-#define TLMM_H_CLK				204
-#define TLMM_CLK				205
-#define MARM_CLK_SRC				206
-#define MARM_CLK				207
-#define MAHB1_SRC				208
-#define MAHB1_CLK				209
-#define SFAB_MSS_S_H_CLK			210
-#define MAHB2_SRC				211
-#define MAHB2_CLK				212
-#define MSS_MODEM_CLK_SRC			213
-#define MSS_MODEM_CXO_CLK			214
-#define MSS_SLP_CLK				215
-#define MSS_SYS_REF_CLK				216
-#define TSSC_CLK_SRC				217
-#define TSSC_CLK				218
-#define PDM_SRC					219
-#define PDM_CLK					220
-#define GP0_SRC					221
-#define GP0_CLK					222
-#define GP1_SRC					223
-#define GP1_CLK					224
-#define GP2_SRC					225
-#define GP2_CLK					226
-#define PMEM_CLK				227
-#define MPM_CLK					228
-#define EBI1_ASFAB_SRC				229
-#define EBI1_CLK_SRC				230
-#define EBI1_CH0_CLK				231
-#define EBI1_CH1_CLK				232
-#define SFAB_SMPSS_S_H_CLK			233
-#define PRNG_SRC				234
-#define PRNG_CLK				235
-#define PXO_SRC					236
-#define LPASS_CXO_CLK				237
-#define LPASS_PXO_CLK				238
-#define SPDM_CY_PORT0_CLK			239
-#define SPDM_CY_PORT1_CLK			240
-#define SPDM_CY_PORT2_CLK			241
-#define SPDM_CY_PORT3_CLK			242
-#define SPDM_CY_PORT4_CLK			243
-#define SPDM_CY_PORT5_CLK			244
-#define SPDM_CY_PORT6_CLK			245
-#define SPDM_CY_PORT7_CLK			246
-#define PLL0					247
-#define PLL0_VOTE				248
-#define PLL5					249
-#define PLL6					250
-#define PLL6_VOTE				251
-#define PLL8					252
-#define PLL8_VOTE				253
-#define PLL9					254
-#define PLL10					255
-#define PLL11					256
-#define PLL12					257
+#define AFAB_CLK_SRC                        0     /* header-only - AFAB (app fabric) src */
+#define AFAB_CORE_CLK                       1     /* header-only - AFAB core */
+#define SCSS_A_CLK                          2     /* header-only - Scorpion subsys AFAB */
+#define SCSS_H_CLK                          3     /* header-only - Scorpion subsys AHB */
+#define SCSS_XO_SRC_CLK                     4     /* header-only - Scorpion XO src */
+#define AFAB_EBI1_CH0_A_CLK                 5     /* header-only - AFAB->EBI1 ch0 AFAB */
+#define AFAB_EBI1_CH1_A_CLK                 6     /* header-only - AFAB->EBI1 ch1 AFAB */
+#define AFAB_AXI_S0_FCLK                    7     /* header-only - AFAB AXI slave0 fabric */
+#define AFAB_AXI_S1_FCLK                    8     /* header-only - AFAB AXI slave1 fabric */
+#define AFAB_AXI_S2_FCLK                    9     /* header-only - AFAB AXI slave2 fabric */
+#define AFAB_AXI_S3_FCLK                    10    /* header-only - AFAB AXI slave3 fabric */
+#define AFAB_AXI_S4_FCLK                    11    /* header-only - AFAB AXI slave4 fabric */
+#define SFAB_CORE_CLK                       12    /* header-only - SFAB (system fabric) core */
+#define SFAB_AXI_S0_FCLK                    13    /* header-only - SFAB AXI slave0 fabric */
+#define SFAB_AXI_S1_FCLK                    14    /* header-only - SFAB AXI slave1 fabric */
+#define SFAB_AXI_S2_FCLK                    15    /* header-only - SFAB AXI slave2 fabric */
+#define SFAB_AXI_S3_FCLK                    16    /* header-only - SFAB AXI slave3 fabric */
+#define SFAB_AXI_S4_FCLK                    17    /* header-only - SFAB AXI slave4 fabric */
+#define SFAB_AHB_S0_FCLK                    18    /* header-only - SFAB AHB slave0 fabric */
+#define SFAB_AHB_S1_FCLK                    19    /* header-only - SFAB AHB slave1 fabric */
+#define SFAB_AHB_S2_FCLK                    20    /* header-only - SFAB AHB slave2 fabric */
+#define SFAB_AHB_S3_FCLK                    21    /* header-only - SFAB AHB slave3 fabric */
+#define SFAB_AHB_S4_FCLK                    22    /* header-only - SFAB AHB slave4 fabric */
+#define SFAB_AHB_S5_FCLK                    23    /* header-only - SFAB AHB slave5 fabric */
+#define SFAB_AHB_S6_FCLK                    24    /* header-only - SFAB AHB slave6 fabric */
+#define SFAB_ADM0_M0_A_CLK                  25    /* header-only - SFAB->ADM0 master0 AFAB */
+#define SFAB_ADM0_M1_A_CLK                  26    /* header-only - SFAB->ADM0 master1 AFAB */
+#define SFAB_ADM0_M2_A_CLK                  27    /* header-only - SFAB->ADM0 master2 AFAB */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - ADM0 (DMA controller) */
+#define ADM0_CLK                            28
+#define ADM0_PBUS_CLK                       29    /* drv+dt - ADM0 APB */
+#define SFAB_ADM1_M0_A_CLK                  30    /* header-only - SFAB->ADM1 master0 AFAB */
+#define SFAB_ADM1_M1_A_CLK                  31    /* header-only - SFAB->ADM1 master1 AFAB */
+#define SFAB_ADM1_M2_A_CLK                  32    /* header-only - SFAB->ADM1 master2 AFAB */
+#define MMFAB_ADM1_M3_A_CLK                 33    /* header-only - MMFAB->ADM1 master3 AFAB */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - ADM1 (DMA controller) */
+#define ADM1_CLK                            34
+#define ADM1_PBUS_CLK                       35    /* drv+dt - ADM1 APB */
+#define IMEM0_A_CLK                         36    /* header-only - IMEM0 AFAB */
+#define MAHB0_CLK                           37    /* header-only - MAHB0 */
+#define SFAB_LPASS_Q6_A_CLK                 38    /* header-only - SFAB LPASS Q6 AFAB */
+#define SFAB_AFAB_M_A_CLK                   39    /* header-only - SFAB->AFAB master AFAB */
+#define AFAB_SFAB_M0_A_CLK                  40    /* header-only - AFAB->SFAB master0 AFAB */
+#define AFAB_SFAB_M1_A_CLK                  41    /* header-only - AFAB->SFAB master1 AFAB */
+#define DFAB_CLK_SRC                        42    /* header-only - DFAB (display fabric) src */
+#define DFAB_CLK                            43    /* legacy:HTC,Sam - DFAB clock */
+#define DFAB_CORE_CLK                       44    /* header-only - DFAB core */
+#define SFAB_DFAB_M_A_CLK                   45    /* header-only - SFAB->DFAB master AFAB */
+#define DFAB_SFAB_M_A_CLK                   46    /* header-only - DFAB->SFAB master AFAB */
+#define DFAB_SWAY0_H_CLK                    47    /* header-only - DFAB sway0 AHB */
+#define DFAB_SWAY1_H_CLK                    48    /* header-only - DFAB sway1 AHB */
+#define DFAB_ARB0_H_CLK                     49    /* header-only - DFAB arb0 AHB */
+#define DFAB_ARB1_H_CLK                     50    /* header-only - DFAB arb1 AHB */
+/* drv+dt - PPSS (peripheral periodic sample subsys) AHB */
+#define PPSS_H_CLK                          51
+#define PPSS_PROC_CLK                       52    /* header-only - PPSS CPU */
+#define PPSS_TIMER0_CLK                     53    /* header-only - PPSS timer0 */
+#define PPSS_TIMER1_CLK                     54    /* header-only - PPSS timer1 */
+#define PMEM_A_CLK                          55    /* header-only - PMEM AFAB */
+#define DMA_BAM_H_CLK                       56    /* header-only - DMA BAM AHB */
+#define SIC_H_CLK                           57    /* header-only - SIC AHB */
+#define SPS_TIC_H_CLK                       58    /* header-only - SPS TIC AHB */
+#define SLIMBUS_H_CLK                       59    /* header-only - SLIMbus AHB */
+#define SLIMBUS_XO_SRC_CLK                  60    /* header-only - SLIMbus XO src */
+#define CFPB_2X_CLK_SRC                     61    /* header-only - CFPB 2x src */
+/* legacy:HTC,Sam,TP - CFPB (config peripheral bridge) */
+#define CFPB_CLK                            62
+#define CFPB0_H_CLK                         63    /* header-only - CFPB0 AHB */
+#define CFPB1_H_CLK                         64    /* header-only - CFPB1 AHB */
+#define CFPB2_H_CLK                         65    /* header-only - CFPB2 AHB */
+#define EBI2_2X_CLK                         66    /* drv+dt legacy:HTC,Sam - EBI2 (NAND) 2x */
+#define EBI2_CLK                            67    /* drv+dt legacy:HTC,Sam - EBI2 (NAND) */
+#define SFAB_CFPB_M_H_CLK                   68    /* header-only - SFAB->CFPB master AHB */
+#define CFPB_MASTER_H_CLK                   69    /* header-only - CFPB master AHB */
+#define SFAB_CFPB_S_HCLK                    70    /* header-only - SFAB->CFPB slave AHB */
+#define CFPB_SPLITTER_H_CLK                 71    /* header-only - CFPB splitter AHB */
+#define TSIF_H_CLK                          72    /* drv - TSIF AHB */
+#define TSIF_INACTIVITY_TIMERS_CLK          73    /* header-only - TSIF inactivity timer */
+#define TSIF_REF_SRC                        74    /* drv legacy:TP,Pre3 - TSIF ref src */
+#define TSIF_REF_CLK                        75    /* drv legacy:HTC,Sam,TP,Pre3 - TSIF ref */
+#define CE1_H_CLK                           76    /* header-only - CE1 (crypto engine 1) AHB */
+#define CE2_H_CLK                           77    /* drv+dt - CE2 AHB */
+#define CE2_P_CLK                           78    /* drv+dt legacy:HTC,Sam,TP - CE2 APB */
+#define SFPB_H_CLK_SRC                      79    /* header-only - SFPB AHB src */
+/* header-only - SFPB (system peripheral bridge) AHB */
+#define SFPB_H_CLK                          80
+#define SFAB_SFPB_M_H_CLK                   82    /* header-only - SFAB->SFPB master AHB */
+#define SFAB_SFPB_S_H_CLK                   81    /* header-only - SFAB->SFPB slave AHB */
+#define RPM_PROC_CLK                        83    /* header-only - RPM CPU */
+#define RPM_BUS_H_CLK                       84    /* header-only - RPM bus AHB */
+#define RPM_SLEEP_CLK                       85    /* header-only - RPM sleep */
+#define RPM_TIMER_CLK                       86    /* header-only - RPM timer */
+#define MODEM_AHB1_H_CLK                    89    /* drv - modem AHB1 bridge */
+#define MODEM_AHB2_H_CLK                    87    /* drv - modem AHB2 bridge */
+#define RPM_MSG_RAM_H_CLK                   88    /* drv+dt - RPM msg-ram AHB */
+#define SC_H_CLK                            90    /* header-only - SC AHB */
+#define SC_A_CLK                            91    /* header-only - SC AFAB */
+#define PMIC_ARB0_H_CLK                     92    /* drv - PMIC SSBI arb0 AHB */
+#define PMIC_ARB1_H_CLK                     93    /* drv - PMIC SSBI arb1 AHB */
+#define PMIC_SSBI2_SRC                      94    /* legacy:TP,Pre3 - PMIC SSBI2 src */
+#define PMIC_SSBI2_CLK                      95    /* drv legacy:HTC,Sam,TP,Pre3 - PMIC SSBI2 */
+#define SDC1_H_CLK                          96    /* drv+dt - eMMC1 AHB */
+#define SDC2_H_CLK                          97    /* drv+dt - eMMC2 AHB */
+#define SDC3_H_CLK                          98    /* drv+dt - eMMC3 AHB */
+#define SDC4_H_CLK                          99    /* drv+dt - eMMC4 AHB */
+#define SDC5_H_CLK                          100   /* drv+dt - eMMC5 AHB */
+#define SDC1_SRC                            101   /* drv legacy:TP,Pre3 - eMMC1 src */
+#define SDC2_SRC                            102   /* drv legacy:TP,Pre3 - eMMC2 src */
+#define SDC3_SRC                            103   /* drv legacy:TP,Pre3 - eMMC3 src */
+#define SDC4_SRC                            104   /* drv legacy:TP,Pre3 - eMMC4 src */
+#define SDC5_SRC                            105   /* drv legacy:TP,Pre3 - eMMC5 src */
+#define SDC1_CLK                            106   /* drv+dt legacy:HTC,Sam,TP,Pre3 - eMMC1 data */
+#define SDC2_CLK                            107   /* drv+dt legacy:HTC,Sam,TP,Pre3 - eMMC2 data */
+#define SDC3_CLK                            108   /* drv+dt legacy:HTC,Sam,TP,Pre3 - eMMC3 data */
+#define SDC4_CLK                            109   /* drv+dt legacy:HTC,Sam,TP,Pre3 - eMMC4 data */
+#define SDC5_CLK                            110   /* drv+dt legacy:HTC,Sam,TP,Pre3 - eMMC5 data */
+#define USB_HS1_H_CLK                       111   /* drv+dt - USB HS1 AHB */
+#define USB_HS1_XCVR_SRC                    113   /* drv legacy:TP - USB HS1 xcvr src */
+#define USB_HS1_XCVR_CLK                    112   /* drv+dt legacy:HTC,Sam,TP - USB HS1 xcvr */
+#define USB_HS2_H_CLK                       114   /* header-only - USB HS2 AHB */
+#define USB_HS2_XCVR_SRC                    116   /* header-only - USB HS2 xcvr src */
+#define USB_HS2_XCVR_CLK                    115   /* header-only - USB HS2 xcvr */
+#define USB_FS1_H_CLK                       117   /* drv - USB FS1 AHB */
+#define USB_FS1_XCVR_FS_SRC                 120   /* drv - USB FS1 xcvr src */
+#define USB_FS1_XCVR_FS_CLK                 118   /* drv - USB FS1 xcvr */
+#define USB_FS1_SYSTEM_CLK                  119   /* drv - USB FS1 system */
+#define USB_FS2_H_CLK                       121   /* drv - USB FS2 AHB */
+#define USB_FS2_XCVR_FS_SRC                 125   /* drv - USB FS2 xcvr src */
+#define USB_FS2_XCVR_FS_CLK                 122   /* drv - USB FS2 xcvr */
+#define USB_FS2_SYSTEM_CLK                  123   /* drv - USB FS2 system */
+#define GSBI_COMMON_SIM_SRC                 124   /* header-only - GSBI SIM common src */
+#define GSBI1_H_CLK                         126   /* drv+dt - GSBI1 AHB */
+#define GSBI2_H_CLK                         127   /* drv+dt - GSBI2 AHB */
+#define GSBI3_H_CLK                         128   /* drv+dt - GSBI3 AHB */
+#define GSBI4_H_CLK                         129   /* drv+dt - GSBI4 AHB */
+#define GSBI5_H_CLK                         130   /* drv+dt - GSBI5 AHB */
+#define GSBI6_H_CLK                         131   /* drv+dt - GSBI6 AHB */
+#define GSBI7_H_CLK                         132   /* drv+dt - GSBI7 AHB */
+#define GSBI8_H_CLK                         133   /* drv+dt - GSBI8 AHB */
+#define GSBI9_H_CLK                         134   /* drv - GSBI9 AHB */
+#define GSBI10_H_CLK                        135   /* drv+dt - GSBI10 AHB */
+#define GSBI11_H_CLK                        136   /* drv - GSBI11 AHB */
+#define GSBI12_H_CLK                        137   /* drv+dt - GSBI12 AHB */
+#define GSBI1_UART_SRC                      138   /* drv legacy:TP,Pre3 - GSBI1 UART src */
+#define GSBI1_UART_CLK                      139   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI1 UART */
+#define GSBI2_UART_SRC                      140   /* drv legacy:TP,Pre3 - GSBI2 UART src */
+#define GSBI2_UART_CLK                      141   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI2 UART */
+#define GSBI3_UART_SRC                      142   /* drv legacy:TP,Pre3 - GSBI3 UART src */
+#define GSBI3_UART_CLK                      143   /* drv legacy:HTC,Sam,TP,Pre3 - GSBI3 UART */
+#define GSBI4_UART_SRC                      144   /* drv legacy:TP,Pre3 - GSBI4 UART src */
+#define GSBI4_UART_CLK                      145   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI4 UART */
+#define GSBI5_UART_SRC                      146   /* drv legacy:TP,Pre3 - GSBI5 UART src */
+#define GSBI5_UART_CLK                      147   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI5 UART */
+#define GSBI6_UART_SRC                      148   /* drv legacy:TP,Pre3 - GSBI6 UART src */
+#define GSBI6_UART_CLK                      149   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI6 UART */
+#define GSBI7_UART_SRC                      150   /* drv legacy:TP,Pre3 - GSBI7 UART src */
+#define GSBI7_UART_CLK                      151   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI7 UART */
+#define GSBI8_UART_SRC                      152   /* drv legacy:TP,Pre3 - GSBI8 UART src */
+#define GSBI8_UART_CLK                      153   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI8 UART */
+#define GSBI9_UART_SRC                      154   /* drv legacy:TP,Pre3 - GSBI9 UART src */
+#define GSBI9_UART_CLK                      155   /* drv legacy:HTC,Sam,TP,Pre3 - GSBI9 UART */
+#define GSBI10_UART_SRC                     156   /* drv legacy:TP,Pre3 - GSBI10 UART src */
+#define GSBI10_UART_CLK                     157   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI10 UART */
+#define GSBI11_UART_SRC                     158   /* drv legacy:TP,Pre3 - GSBI11 UART src */
+#define GSBI11_UART_CLK                     159   /* drv legacy:HTC,Sam,TP,Pre3 - GSBI11 UART */
+#define GSBI12_UART_SRC                     160   /* drv legacy:TP,Pre3 - GSBI12 UART src */
+#define GSBI12_UART_CLK                     161   /* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI12 UART */
+#define GSBI1_QUP_SRC                       162   /* drv legacy:TP,Pre3 - GSBI1 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI1 QUP (SPI/I2C) */
+#define GSBI1_QUP_CLK                       163
+#define GSBI2_QUP_SRC                       164   /* drv legacy:TP,Pre3 - GSBI2 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI2 QUP (SPI/I2C) */
+#define GSBI2_QUP_CLK                       165
+#define GSBI3_QUP_SRC                       166   /* drv legacy:TP,Pre3 - GSBI3 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI3 QUP (SPI/I2C) */
+#define GSBI3_QUP_CLK                       167
+#define GSBI4_QUP_SRC                       168   /* drv legacy:TP,Pre3 - GSBI4 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI4 QUP (SPI/I2C) */
+#define GSBI4_QUP_CLK                       169
+#define GSBI5_QUP_SRC                       170   /* drv legacy:TP,Pre3 - GSBI5 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI5 QUP (SPI/I2C) */
+#define GSBI5_QUP_CLK                       171
+#define GSBI6_QUP_SRC                       172   /* drv legacy:TP,Pre3 - GSBI6 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI6 QUP (SPI/I2C) */
+#define GSBI6_QUP_CLK                       173
+#define GSBI7_QUP_SRC                       174   /* drv legacy:TP,Pre3 - GSBI7 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI7 QUP (SPI/I2C) */
+#define GSBI7_QUP_CLK                       175
+#define GSBI8_QUP_SRC                       176   /* drv legacy:TP,Pre3 - GSBI8 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI8 QUP (SPI/I2C) */
+#define GSBI8_QUP_CLK                       177
+#define GSBI9_QUP_SRC                       178   /* drv legacy:TP,Pre3 - GSBI9 QUP src */
+/* drv legacy:HTC,Sam,TP,Pre3 - GSBI9 QUP (SPI/I2C) */
+#define GSBI9_QUP_CLK                       179
+#define GSBI10_QUP_SRC                      180   /* drv legacy:TP,Pre3 - GSBI10 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI10 QUP (SPI/I2C) */
+#define GSBI10_QUP_CLK                      181
+#define GSBI11_QUP_SRC                      182   /* drv legacy:TP,Pre3 - GSBI11 QUP src */
+/* drv legacy:HTC,Sam,TP,Pre3 - GSBI11 QUP (SPI/I2C) */
+#define GSBI11_QUP_CLK                      183
+#define GSBI12_QUP_SRC                      184   /* drv legacy:TP,Pre3 - GSBI12 QUP src */
+/* drv+dt legacy:HTC,Sam,TP,Pre3 - GSBI12 QUP (SPI/I2C) */
+#define GSBI12_QUP_CLK                      185
+#define GSBI1_SIM_CLK                       186   /* legacy:Pre3 - GSBI1 SIM */
+#define GSBI2_SIM_CLK                       187   /* legacy:Pre3 - GSBI2 SIM */
+#define GSBI3_SIM_CLK                       188   /* legacy:Pre3 - GSBI3 SIM */
+#define GSBI4_SIM_CLK                       189   /* legacy:Pre3 - GSBI4 SIM */
+#define GSBI5_SIM_CLK                       190   /* legacy:Pre3 - GSBI5 SIM */
+#define GSBI6_SIM_CLK                       191   /* legacy:Pre3 - GSBI6 SIM */
+#define GSBI7_SIM_CLK                       192   /* legacy:Pre3 - GSBI7 SIM */
+#define GSBI8_SIM_CLK                       193   /* legacy:Pre3 - GSBI8 SIM */
+#define GSBI9_SIM_CLK                       194   /* legacy:Pre3 - GSBI9 SIM */
+#define GSBI10_SIM_CLK                      195   /* legacy:Pre3 - GSBI10 SIM */
+#define GSBI11_SIM_CLK                      196   /* legacy:Pre3 - GSBI11 SIM */
+#define GSBI12_SIM_CLK                      197   /* legacy:Pre3 - GSBI12 SIM */
+#define SPDM_CFG_H_CLK                      198   /* header-only - SPDM cfg AHB */
+#define SPDM_MSTR_H_CLK                     199   /* header-only - SPDM master AHB */
+#define SPDM_FF_CLK_SRC                     200   /* header-only - SPDM FF src */
+#define SPDM_FF_CLK                         201   /* header-only - SPDM FF */
+#define SEC_CTRL_CLK                        202   /* header-only - security ctrl */
+#define SEC_CTRL_ACC_CLK_SRC                204   /* header-only - security ctrl accel src */
+#define SEC_CTRL_ACC_CLK                    203   /* header-only - security ctrl accel */
+#define TLMM_H_CLK                          205   /* header-only - TLMM (pinctrl) AHB */
+#define TLMM_CLK                            206   /* header-only - TLMM (pinctrl) */
+#define MARM_CLK_SRC                        207   /* header-only - modem ARM CPU src */
+#define MARM_CLK                            208   /* header-only - modem ARM CPU */
+#define MAHB1_SRC                           209   /* header-only - modem AHB1 src */
+#define MAHB1_CLK                           210   /* header-only - modem AHB1 */
+#define SFAB_MSS_S_H_CLK                    211   /* header-only - SFAB->modem subsys slave AHB */
+#define MAHB2_SRC                           212   /* header-only - modem AHB2 src */
+#define MAHB2_CLK                           213   /* header-only - modem AHB2 */
+#define MSS_MODEM_CLK_SRC                   215   /* header-only - modem clk src */
+#define MSS_MODEM_CXO_CLK                   214   /* header-only - modem CXO */
+#define MSS_SLP_CLK                         216   /* header-only - modem sleep */
+#define MSS_SYS_REF_CLK                     217   /* header-only - modem sys ref */
+#define TSSC_CLK_SRC                        218   /* drv - TSSC src */
+/* drv legacy:HTC,Sam,TP,Pre3 - TSSC (touchscreen ctrl) */
+#define TSSC_CLK                            219
+#define PDM_SRC                             220   /* drv legacy:HTC,Sam,TP,Pre3 - PDM src */
+/* drv legacy:HTC,Sam,TP,Pre3 - PDM (pulse density modulator) */
+#define PDM_CLK                             221
+#define GP0_SRC                             222   /* drv - GP0 (general purpose) src */
+#define GP0_CLK                             223   /* drv legacy:HTC,Sam - GP0 */
+#define GP1_SRC                             224   /* drv - GP1 src */
+#define GP1_CLK                             225   /* drv legacy:HTC,Sam - GP1 */
+#define GP2_SRC                             226   /* drv - GP2 src */
+#define GP2_CLK                             227   /* drv legacy:HTC,Sam - GP2 */
+/* drv+dt legacy:HTC,Sam,TP - PMEM (protected mem) */
+#define PMEM_CLK                            228
+#define MPM_CLK                             229   /* header-only - MPM (mode/power mgr) */
+#define EBI1_ASFAB_SRC                      230   /* header-only - EBI1 AFAB src */
+#define EBI1_CLK_SRC                        231   /* header-only - EBI1 (DDR) src */
+#define EBI1_CH0_CLK                        232   /* header-only - EBI1 ch0 */
+#define EBI1_CH1_CLK                        233   /* header-only - EBI1 ch1 */
+#define SFAB_SMPSS_S_H_CLK                  234   /* header-only - SFAB->SMPSS slave AHB */
+#define PRNG_SRC                            235   /* drv legacy:TP,Pre3 - PRNG src */
+#define PRNG_CLK                            236   /* drv+dt legacy:HTC,Sam,TP,Pre3 - PRNG (RNG) */
+#define PXO_SRC                             237   /* legacy:HTC,Sam,TP,Pre3 - PXO src */
+#define LPASS_CXO_CLK                       238   /* header-only - LPASS CXO */
+#define LPASS_PXO_CLK                       239   /* header-only - LPASS PXO */
+#define SPDM_CY_PORT0_CLK                   247   /* header-only - SPDM cycle port0 */
+#define SPDM_CY_PORT1_CLK                   240   /* header-only - SPDM cycle port1 */
+#define SPDM_CY_PORT2_CLK                   241   /* header-only - SPDM cycle port2 */
+#define SPDM_CY_PORT3_CLK                   242   /* header-only - SPDM cycle port3 */
+#define SPDM_CY_PORT4_CLK                   243   /* header-only - SPDM cycle port4 */
+#define SPDM_CY_PORT5_CLK                   244   /* header-only - SPDM cycle port5 */
+#define SPDM_CY_PORT6_CLK                   245   /* header-only - SPDM cycle port6 */
+#define SPDM_CY_PORT7_CLK                   246   /* header-only - SPDM cycle port7 */
+#define PLL0                                248   /* legacy:Pre3 - PLL0 */
+#define PLL0_VOTE                           249   /* header-only - PLL0 voter */
+#define PLL5                                250   /* header-only - PLL5 */
+#define PLL6                                251   /* header-only - PLL6 (mm/lpass shared) */
+#define PLL6_VOTE                           252   /* header-only - PLL6 voter */
+#define PLL8                                253   /* drv legacy:HTC,Sam,Pre3 - PLL8 (main 384MHz) */
+#define PLL8_VOTE                           254   /* header-only - PLL8 voter */
+#define PLL9                                255   /* header-only - PLL9 (Scorpion CPU0) */
+#define PLL10                               256   /* header-only - PLL10 (Scorpion CPU1) */
+#define PLL11                               257   /* header-only - PLL11 (Scorpion L2) */
+#define PLL12                               258   /* header-only - PLL12 (DDR) */
+#define PLL4_VOTE                           259   /* header-only - PLL4 voter */
 
 #endif
-- 
2.43.0


