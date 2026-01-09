Return-Path: <linux-arm-msm+bounces-88175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B45D0723A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF2B303C9FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56301DA628;
	Fri,  9 Jan 2026 04:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMYaSpvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADA2DC78D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933249; cv=none; b=OKYUZWEYD+Q7PX1EKmap8KOgSWa7G7+mCnAPw1/gId9D8ii3Yya1ew1BcTkCyz4z2LcKQ6VTCht0kvNL1Icqw00zFnacBeqGaMe5+EgAgBdh4+NTXXrIGLC4pL0scyrXuE+SrlYLo3Kj+DwWtSyXZuefFG97NSP6wom+asAICZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933249; c=relaxed/simple;
	bh=64oxlB1oPc2I3UCUYL7TYYxHgANHA24BJHFDbLU57BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jtg1oDz1CqNakgVcNDCHKGdQ+q73d/YmTzujQsJ9NbmrGmFKlDQeFcNd7qEjDxf4qhIO8kM7SJBmFuxmWvPhmoU0h64RqPx3i5K0fn6VUjvDyEj1XLIEzElsbYCcy5adjcOEHBKz4eRxyAOpHUPuwJwxFU89p93nMMK2zyfgSnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMYaSpvs; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3e3dac349easo3493697fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933246; x=1768538046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP/uE01G83nxTUrDw+o0CPnPYzVPpmwRmdm0c2AEYD8=;
        b=fMYaSpvs/LisUHPKs6l6qeZZ+N4Ayp9xVYKwIrk0F6wN4DIe/LUDcyx2rX8bSQmYwN
         3n2QmUHWscFPsTDxcusQF+HRd7SXdhm3bFTnwcBxe8cpDm4R+RFcMM3SBxbccVyOq3u4
         Mquj5T3IYw4GdTBzSwJP88msvwTMDDUn+tJTNg7zm9IkyqHFLo/LoRRx0aTKAJJ4Fp/l
         4+DK3v3F5c6vRnetmHcZN0ciSxHw1uDFkQr3jISDfrTACDhLd25DAe71t80Y+Hcnh6M3
         oOltjrzDDwUilN86wx3JaXxj+maRqEBLDz1ZRQJ83NH4aLVZ/vq8U6CQxYWNh/biNbhA
         DOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933246; x=1768538046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DP/uE01G83nxTUrDw+o0CPnPYzVPpmwRmdm0c2AEYD8=;
        b=dmsPA4Bl9PFIQE5+3Ussf62MjIi8/KOehWZMkqvnJzN04kxJes7JSQc9IeuqqhumQO
         Du+FPPOrmIYoVBYSLnt41LA1ocqYXKTvhsvU+qjLEJOXPm+DjVhFiv/fHevO+KwaUhf8
         bebqzAqwBR0XUFYliZclGkLPqD8UWaxLUrIm8bZtjKhzHwZyTYPxA/f8w6i6J2ZOn91z
         FSRWDBRxYQObJ6PnB8d25GvYHly12wTPW5RQowxeeTOMPGabgGHZrbA8zpHIb35gUSpb
         RHZ3sj47PrjgvCDRKwQ8aMAeHlEGtTOfOgs4BjYPinRhaK1/tQi0eYwL2trh9b86AFqz
         frGg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Bu7XJtETseCwuT2jL3UtZnOzZQuzX7hxMrXYLG/kBGjgWbV0F2Y4sjEG2uPAO1d+q59gR7egXn7qEpmG@vger.kernel.org
X-Gm-Message-State: AOJu0YyMoJBdbLfl2LztbKvMDo2QIZLkQWOsHec7S7jjgnx6F/TLdk9V
	dlKGwwp5sEvapiydy4rx0j50ZLpcAETd6C6R9QETmPGvphMt0okGzbAo
X-Gm-Gg: AY/fxX6QOEqKfwRZCjwupFvKumuXQlfU7s5p3YRYlfmS5om9eIe95pKh2qDaIxFcNgU
	CcSi27W9sKVNJMpBARz73FiQ8gbWpO63fSkixNSn4w3q4uvTAVmWPUUkhsuWY80CbtElpF/VreT
	h1u6gBw0bCa1+lozUjYxt5CKoNxKXpDqwYAlnPf1LMZ1tXCoAYYYdvkcb6NwvilgMF9850Pe2++
	xVrbDIdHeI3vRCULWHPe0qmTZ6wW+INEnATHBHDES+mIlgTkwEi2ISb/pX81T5jBklwFs1w4Q8p
	OoVoFlYFUXEv10tpRsHOiwljCKAaluk876dBnklJv5eu2aq6O1bAxO02ph2hCMvj18RN0T9XJAZ
	y7i5xQRHChitrvMN5WD7QZIuh6oqTPn9pTk8jup4Fc3YelJFAVy6e2YDOqe3UaeEQzAzIyk7UZz
	sTgXR8/5jzA57IMTdK8I/aOXQgtD/IofDyXbBGffjquMyTyJvCqrHeeBqFPigKMcTvT3QSj0qLy
	AQIpTZng+kGI+HWnThUwmlV6x75
X-Google-Smtp-Source: AGHT+IGZBF8CWH9Y4AsgArGmLsciCkh8nXRx0fV3kjm1s9pw8Jm99eiy+DaFGOLLrhK4ZAZqC7M1/w==
X-Received: by 2002:a05:6870:71c4:b0:3e8:3176:a342 with SMTP id 586e51a60fabf-3ffc09ff519mr4258246fac.22.1767933246452;
        Thu, 08 Jan 2026 20:34:06 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:05 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: mathieu.poirier@linaro.org,
	konradybcio@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 3/9] dt-bindings: clock: gcc-ipq9574: add wcss remoteproc clocks
Date: Thu,  8 Jan 2026 22:33:38 -0600
Message-ID: <20260109043352.3072933-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit da040d560319 ("dt-bindings: clock: qcom: gcc-ipq9574: remove q6
bring up clock macros") removed these clocks on the idea that Q6
firmware is responsible for clock bringup. That statement seems
incorrect, as these clocks need to be enabled before the Q6 is booted.
Otherwise, the host CPU core that starts the Q6 hangs.

Perhaps the statement meant that the TrustZone firmware will start the
clocks. This only happens in PAS mode. Under native OS loading, the
host needs these clocks, so add them back.

Besides the clocks that were erroneously removed, also add defines for
GCC_WCSS_AHB_S_CLK, GCC_WCSS_AXI_M_CLK, and GCC_Q6_AXIM2_CLK, as all
these clocks are required to operate the remoteproc.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 include/dt-bindings/clock/qcom,ipq9574-gcc.h | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,ipq9574-gcc.h b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
index 0e7c319897f3..8c74f50a2790 100644
--- a/include/dt-bindings/clock/qcom,ipq9574-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq9574-gcc.h
@@ -132,8 +132,16 @@
 #define GCC_NSSNOC_SNOC_1_CLK				123
 #define GCC_QDSS_ETR_USB_CLK				124
 #define WCSS_AHB_CLK_SRC				125
+#define GCC_Q6_AHB_CLK					126
+#define GCC_Q6_AHB_S_CLK				127
+#define GCC_WCSS_ECAHB_CLK				128
+#define GCC_WCSS_ACMT_CLK				129
+#define GCC_SYS_NOC_WCSS_AHB_CLK			130
 #define WCSS_AXI_M_CLK_SRC				131
+#define GCC_ANOC_WCSS_AXI_M_CLK				132
 #define QDSS_AT_CLK_SRC					133
+#define GCC_Q6SS_ATBM_CLK				134
+#define GCC_WCSS_DBG_IFC_ATB_CLK			135
 #define GCC_NSSNOC_ATB_CLK				136
 #define GCC_QDSS_AT_CLK					137
 #define GCC_SYS_NOC_AT_CLK				138
@@ -146,18 +154,27 @@
 #define QDSS_TRACECLKIN_CLK_SRC				145
 #define GCC_QDSS_TRACECLKIN_CLK				146
 #define QDSS_TSCTR_CLK_SRC				147
+#define GCC_Q6_TSCTR_1TO2_CLK				148
+#define GCC_WCSS_DBG_IFC_NTS_CLK			149
 #define GCC_QDSS_TSCTR_DIV2_CLK				150
 #define GCC_QDSS_TS_CLK					151
 #define GCC_QDSS_TSCTR_DIV4_CLK				152
 #define GCC_NSS_TS_CLK					153
 #define GCC_QDSS_TSCTR_DIV8_CLK				154
 #define GCC_QDSS_TSCTR_DIV16_CLK			155
+#define GCC_Q6SS_PCLKDBG_CLK				156
+#define GCC_Q6SS_TRIG_CLK				157
+#define GCC_WCSS_DBG_IFC_APB_CLK			158
+#define GCC_WCSS_DBG_IFC_DAPBUS_CLK			159
 #define GCC_QDSS_DAP_CLK				160
 #define GCC_QDSS_APB2JTAG_CLK				161
 #define GCC_QDSS_TSCTR_DIV3_CLK				162
 #define QPIC_IO_MACRO_CLK_SRC				163
 #define GCC_QPIC_IO_MACRO_CLK                           164
 #define Q6_AXI_CLK_SRC					165
+#define GCC_Q6_AXIM_CLK					166
+#define GCC_WCSS_Q6_TBU_CLK				167
+#define GCC_MEM_NOC_Q6_AXI_CLK				168
 #define Q6_AXIM2_CLK_SRC				169
 #define NSSNOC_MEMNOC_BFDCD_CLK_SRC			170
 #define GCC_NSSNOC_MEMNOC_CLK				171
@@ -182,6 +199,7 @@
 #define GCC_UNIPHY2_SYS_CLK				190
 #define GCC_CMN_12GPLL_SYS_CLK				191
 #define GCC_NSSNOC_XO_DCD_CLK				192
+#define GCC_Q6SS_BOOT_CLK				193
 #define UNIPHY_SYS_CLK_SRC				194
 #define NSS_TS_CLK_SRC					195
 #define GCC_ANOC_PCIE0_1LANE_M_CLK			196
@@ -203,4 +221,8 @@
 #define GCC_PCIE2_PIPE_CLK				212
 #define GCC_PCIE3_PIPE_CLK				213
 #define GPLL0_OUT_AUX					214
+#define GCC_WCSS_AHB_S_CLK				215
+#define GCC_WCSS_AXI_M_CLK				216
+#define GCC_Q6_AXIM2_CLK				217
+
 #endif
-- 
2.45.1


