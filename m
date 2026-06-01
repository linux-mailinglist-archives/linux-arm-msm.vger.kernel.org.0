Return-Path: <linux-arm-msm+bounces-110494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMU+Jm0HHWpUVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E40619657
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 06:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B151830134BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 04:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B21F31F99B;
	Mon,  1 Jun 2026 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="OBQu9TFU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED131E840
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 04:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287304; cv=none; b=mJSrRvsOcq95abZgYbeaZ5JV+DltGD/7n7UK6MXUlyBQkuP8VjEva33H4FA7QV9BVChT/vXBsbsljH+zKtHPiux/HsGi3g5Vlk36cHWshLpAMs93WHwoAYAvOjyA6GfoVu/VO+/t67b348MmCxefC27NUYzMPfCxys23cDmaAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287304; c=relaxed/simple;
	bh=qP1yh5897y52gQrS74KSiUYqrl7D3oKp/uam3uTjwNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kge2Teuj/9U30G+lghu2nHcco8IIFkYn+Lk0sJGNJSq8DCQNwJDvjp+zWRtGtpS6FMYZhASH/d693s/edAzSNvaSDAVRAvmuKEHZPBTgZmGpKgKKtSSuMPrCLBC8smCinopA9wu0DhMbYlmQa0TasXQCeMPn6BaKPLMvLhLoeFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=OBQu9TFU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf22d29dabso19171945ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 21:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780287301; x=1780892101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY0Jgb/4pMElVA1zHn/XIVXj9XsaeotvHlofGf2Tv8E=;
        b=OBQu9TFUlrgkRa0pqSee9VE6S4ewBtzjEs5r9lxuWGntjsPgRyEpY+NQAyXv1HQxD2
         EnFEEZtTq19D10YeRd1SbJ6H7z1eR0vOXKEjDaq1HHrsZzO5hwgTlPm9zu11KwhO4Y58
         yQr5v/WflKgcWzALA0GOvAJxIMEzlAfF97W9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287301; x=1780892101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bY0Jgb/4pMElVA1zHn/XIVXj9XsaeotvHlofGf2Tv8E=;
        b=WU3X9OfxBgWVz1DsmwMCd16l6425itcaWv3X5ytxE613Gle1X5kkIukgYptcuyUVvK
         w3VEKpXbXOA+FWLr4CdlU4GwimRkaivtOwCQM4d3Tp095bw+R6Kjn6e+TZx4zc2XRlq2
         4hYSRoJ9NFLmTPynjF+5InMuwDf6+3mm5YrSW++Q/AOKcpOEi1P0o8oeATROlRSpD2cK
         TBVxMY3JKjAzzy+uTZ9F8o3AYErQXqvwj+/JuFfqDfrV5mWtjWiPTEkvuV83LZhgG9yD
         EEhrIvQzFZnkBIhohtdxPqh6zMbcQnZTH2QaUVlhfDPZVQAkvuNCsr4JAmucapxHld3a
         DLxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iz85wlvtknXaQd2KpBA7AOXRAuO/9aezSLTgF5cFWqDrqCXRvn04HlCd7WzFVzf7D7D/mhbqKwTj5cas0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEOD0IGaEGhm60GjN7HBT1Mi64rbKvh2nJlieRDuw8dTJmM0w
	VT/CDbP8Px4yy1cN68whxEul0qdVY96TarPHv3VRnfOgsGmG4J+HBqpfkObz3J0Do3AcrHpXIsT
	odDYo0j+Npw==
X-Gm-Gg: Acq92OHqN8wQZS0m88stUdicQnmOySt05k6VayWbVbuPgkLWJOmGVQGWoyWK21SrDRS
	Csm7qMdTZEMSWR4nW0FEWhHD2/bHvNTnuGdFbVKP7r9lqXlhlV6PY4VFu7SNJWpYEkdYMsUfvA5
	EkjkK8B2wEbBX30g514HmeGj3RFGDJmJLC+fMCrHuKtoAMVLdT0fsE/fx04icllYIowyleAk/NK
	klvCRarXDJZm0IG+CcWTDhN9ffPgA82h9aWYu1GByn+qUvPk2GnNHrAPbpm0NDCFAvvvCoMmvCM
	9ki6ddoY2MLJu/C5OFNecU8llrqPKxRRHqgx/DgSexZmvBFBCRYvjQ5UQj+GL/9YquyEszwaHo5
	nc5LXXigJVTUO6rB4vaEoDeHkNOLnMvzQah6uE3Mp9afO7E6OvuPJ6Ri6nhvjtn4RDru2MQ9rlM
	bPzf0bqEhyrBVlO81WbGwLWU3CiYgxiD0dXLVITOTFhLuSNhqKigBm/uNzixF1N5xxzvgKZOVT0
	Rj+NHVaESZTM4qUiK56m0XmB1DXsqQF2tQ2WOcbLE8ftCeVJRPKuMRCpqbBLQeiq+DIt2I+Z/84
	4JF8jIS1p03bRDfiVQGsgkTt/kUdA06QyaNPGdFVA5gsKUWHzlCAy6usR1OgPRD1eNVypc2F4cx
	4VOY=
X-Received: by 2002:a17:903:1207:b0:2be:bb7f:ae2f with SMTP id d9443c01a7336-2bf36846815mr104349185ad.27.1780287301511;
        Sun, 31 May 2026 21:15:01 -0700 (PDT)
Received: from aegis ([175.176.67.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm92980405ad.76.2026.05.31.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:15:01 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
Date: Mon,  1 Jun 2026 12:13:34 +0800
Message-ID: <20260601041336.9497-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601041336.9497-1-daniel@quora.org>
References: <20260601041336.9497-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110494-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ui.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quora.org:email,quora.org:mid,quora.org:dkim,ffe00000:email]
X-Rspamd-Queue-Id: 17E40619657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with web pages that drive
multiple concurrent video decode streams, eg ui.com.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000)
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

This applies to all current hamoa.dtsi consumers (X1E80100/X1P42100/
X1P64100 boards); other Iris-bearing SoCs (sm8550/sm8650/sa8775p/
qcs8300) do not include hamoa.dtsi thus not affected.

Backports also require the preceding binding patch ("dt-bindings:
media: qcom,sm8550-iris: Allow IOVA reservation memory-region");
without it, dtbs_check rejects the second memory-region entry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..e2af0bc5e064 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -724,6 +724,15 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * Iris DMA below IOVA 0x25800000 triggers unhandled SMMU
+		 * faults on hamoa platforms; reserve the range so the IOMMU
+		 * layer keeps allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};

 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5479,7 +5488,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";

-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;

 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
--
2.53.0


