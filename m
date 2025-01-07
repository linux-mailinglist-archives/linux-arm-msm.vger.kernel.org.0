Return-Path: <linux-arm-msm+bounces-44205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F2FA04AAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D567C3A559B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393611F76BB;
	Tue,  7 Jan 2025 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BMnr8HJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFD1F756A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280498; cv=none; b=KLkTf/vzSt+YGhfZnmfJMFjNcMsL71NMrcYI3mpjlDVeMDjSv3dk+HS2d4g0Qrkvsb5Oqdy1u+mCh2TYgV4cLOsdu7S2yOCvVjwOA2113sgiW4AfbPAoXrbjvUM6Z4ilP15PpqVw4096hBqqFrmH8scgM3CK4KZoKccWogZ5UuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280498; c=relaxed/simple;
	bh=iXSbvGK/GRKHVLZGDgeu68FgJ3g7CX4QZMvsuVny4LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh6xrdffCxwWtdGJWdNbomFO1jMb7vNE6YvEKSO7xa1iAluZdpbs7eAyxC+Fe5TU2YmD21kvrl37j3+ltmzP1qW/fLiU1KH/MO6cuC3Q53tVzd4hbT+bBp5apywpI2XrXMkClEHQqSAG2eJFBwD/udmcJOha5VQ0bFVoKGLlLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BMnr8HJf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216395e151bso2081575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280494; x=1736885294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7JIcKoOn+aj6A6FGmZdKgBjeiVX3ZBuDhppF1K0+s8=;
        b=BMnr8HJf1jqrZaYD7eZY9Q2pEFXjZ8d31+ELyOgj4QfxO8LId0Pyc1QxNwR2HZgeGJ
         1aPZzMLb57M4eqIgrvT/qduiZiW0KmiHz0l82GgQ6l+KX2bHlL7Udlujk12Kt2ZAtbNA
         SAsQ8Q8V3QvqfKIuKcHkjaRm8kky+ffL4Tyhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280494; x=1736885294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7JIcKoOn+aj6A6FGmZdKgBjeiVX3ZBuDhppF1K0+s8=;
        b=MfUQOVdVjhqU6oGwRmETdo6nEi4JTjXcRzuu3ZKM4ZCzcOTZcjLss4W58NlalefjOR
         pPnG6UglaQTHhcPFwfJ6Rsz1E0diPQqGUCgMozcNiCjVwN5MWfx22WEek1ORgcTftlh7
         mupZ00wPHNXb90drcTrapzlY1MAwZAJ7ZVVV7mp/y7QjXH6QSUpEzsNQ/xTP4o9AnNxe
         YB/2cvPxcGMiLdaFYT/ypQiruFCPLBDJzgia95wlsRope+FPc1lD5ZpMv1dTxYFSusUG
         rg+6Id4NBLUVBjjMPkzxolcSG5tI77tcUamPkhIfAkIuwanpTOK0t66dn/szRFzitR+m
         2yZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ytJsJqVXtBFIReoCOQUp7nBkbQGfzGvXgu4jo/Jc686qmyG0Wjc50Irqjut89GG71wJLwDGoa1Q4UHZB@vger.kernel.org
X-Gm-Message-State: AOJu0YxYqnDtk9Med9cSo5YwCWVqw2EONtrrN+63062jkrp4YHDDmRLs
	nHKWAOY7ZPLDdRqu7MFGxoYCstzYlYd/cifq1R55Ob5yVfrL3BwBBNBVF52G1Q==
X-Gm-Gg: ASbGncvXA6eMY3eZ3TCgc76rUjVJta9H5I2OfjM4G3Df+/mPlVsgeYltu2ZvVfDHvE+
	nrSwi2gwwCUebMZlKi8IGv+oFtWgSJ2fZqGon/OY4f9ixjufrOxkRcyFyIgiNRQ+3zq9XlZno/I
	Q1vZCfvmGUolwpupyi2OODny+RNjN+qYJpX9U/4fRsJCely1JYE2Ro34C3s5wHc/MTDc2fEVbFT
	fF/8f9loUpCRHiAAi/2ta7eN7/IEJSQYNrHRCf6mmhAKmSnsuAAdKvNBXQwxXOqLGI44p2BEKHB
X-Google-Smtp-Source: AGHT+IFYwu/b5vkXAi4S+EzyiEJNxnfulDMZqRNb7srUjlr5I3jIs0W0BPEczm+Ttsn4js6vyxWAkQ==
X-Received: by 2002:a17:903:41c6:b0:215:758c:52e8 with SMTP id d9443c01a7336-21a83c148abmr5723375ad.12.1736280494447;
        Tue, 07 Jan 2025 12:08:14 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:13 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
Date: Tue,  7 Jan 2025 12:06:00 -0800
Message-ID: <20250107120555.v4.3.Iab8dbfb5c9b1e143e7a29f410bce5f9525a0ba32@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm has confirmed that, much like Cortex A53 and A55, KRYO
2XX/3XX/4XX silver cores are unaffected by Spectre BHB. Add them to
the safe list.


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Cc: Scott Bauer <sbauer@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Re-added KRYO 2XX/3XX/4XX silver patch after Qualcomm confirmed.

Changes in v3:
- Removed KRYO 2XX/3XX/4XX silver patch.

Changes in v2:
- New

 arch/arm64/kernel/proton-pack.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 17aa836fe46d..89405be53d8f 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -854,6 +854,9 @@ static bool is_spectre_bhb_safe(int scope)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_SILVER),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
 		{},
 	};
 	static bool all_safe = true;
-- 
2.47.1.613.gc27f4b7a9f-goog


