Return-Path: <linux-arm-msm+bounces-42215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 289869F1B98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927E0188ED23
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F1614F9CF;
	Sat, 14 Dec 2024 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PS/SVhCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D47DA9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137603; cv=none; b=adH3QcA4VBzrTJxP9uSprGRjUQwk9je3FaDnXmPMyhwWU3noyr4jYnk6t7NJBrjg3kr9hQeeU3alBiihFB6MobN2LPhP6Nlf51jfSurIRNJwbG0ycMWRmStI7XVJEffBJJePskghgy8h73UgqUQS4P+ydJ4lujZ4nvukorzSG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137603; c=relaxed/simple;
	bh=0U4zcnqAM+KNnaDs1qdzfHSYLMjiJX0a1xgu5GDyZrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNd0pSWrUzHlIYenDDNIKy144KzCxlL2VdfcUkQZdRFV27zDNdIjWUmNITBd6ne9Lo9EIHcZoTEOwo0SnwHTJV/vvFMawFleIiqAWI+d9eQooCLXZEiS+jm4SgA3VuFKF7EyfSwpq21MCT9pxwHT7jy98Bf2IWwbh7VHEaTCumU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PS/SVhCA; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd4998b0dbso1988459a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137601; x=1734742401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nevtJ7/NdNl+3R/l/o9OoX53K9dVtdSsX5xkWCrYzfY=;
        b=PS/SVhCAkcmyNf6MBKpLf1h38taoACTzmNvKUhpMesqWOGCxLxpXfR7eUps1YtNyFV
         jwl8eKpVozbME8IoVWETe4yt9Z2sH99+YS/Oo+oxjZgWTt4LRZQCtGIsDLpgddeqhnsr
         jEvKuSICPqgOK/N+X9fvr5EglnS8aRiiZ9Z5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137601; x=1734742401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nevtJ7/NdNl+3R/l/o9OoX53K9dVtdSsX5xkWCrYzfY=;
        b=VODXnpYtkHRyvKTjuV87yPSDK4xNCxxpeZ78DlG/tdkXxchJ5gxs+uyg2Qxe5OXwpT
         z35zPYa+DMUS3kAOB3/qKdz/NHIubksAZUFdDpPpdGs8WxT4Tx+Qxdizv6s5twwDrDVy
         vJK/sZhQJaP4Wr/v1ySJuEzi2aCJSV/Ylmq0rjMAwLcd0WTvjaypDDY07FvBNztPvrTK
         2KlYG3rCCKZnJVlD5CTLyEVBfM1g6aSREmDd51nqbZl550cZF2IJ6PFXpLN0dgWUgaNn
         vlVqJDhDSBPQfOxK7EEkbMtu0qfh1DzsAfKXx7y2WS1FXCcKxyqZIUvrBSQ4NMMOZYDp
         LPaQ==
X-Gm-Message-State: AOJu0YxABjw9uP3P+cxuHKfSKZMGg6/Q4vNnnM81TN85KqXdHXqQM9B4
	jDBXIetqoYBG+5cWkA87Z+Bc7K1PU0TmOQBH/iLRG8JnuSd84nFna8EmzcIwQw==
X-Gm-Gg: ASbGncut/9vY9EjKZyVA3bCiLOlUdsMPBCZQytxHv/q3ujv8IwoGYS4wbTc6gX6dxA+
	iw0yDzv0i7VHAcX29vN+/ZvNrmSP5iOu5wNOOBtLcPf9zY4+k/gso2NOtPA0BjO2TpmvxWMK8Cn
	mSY8gmzPYdrUOqUOQML79RXeCgndFOKtBeg1cWAEMVCVlctjh6ygM/kUeQgZyZiP+NOicGVrPK+
	FzkdItHmCxet9viZ4tCMLHyDXmorAOt0tLEJ1ENxwUtM8TDoMiJEW/2eG/G8iHsjs8XomC2b58V
X-Google-Smtp-Source: AGHT+IFJ8Kx/APKjEY2akHY9UEwVqJx5Yk5K0Is7GrRpeWUBuPmnbC0N3jdlyzrLaN+NBvohTNedbA==
X-Received: by 2002:a17:90b:28c8:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f28fd73e92mr6735419a91.19.1734137601489;
        Fri, 13 Dec 2024 16:53:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: errata: Add QCOM_KRYO_3XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Fri, 13 Dec 2024 16:52:07 -0800
Message-ID: <20241213165201.v2.6.Ic6fdf0e43851269d10596da7e6ceae959431f9fa@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241214005248.198803-1-dianders@chromium.org>
References: <20241214005248.198803-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm Kryo 200-series Gold cores appear to have a derivative of an
ARM Cortex A75 in them. Since A75 needs Spectre mitigation via
firmware then the Kyro 300-series Gold cores also should need Spectre
mitigation via firmware.

Unless devices with a Kryo 3XX gold core have a firmware that provides
ARM_SMCCC_ARCH_WORKAROUND_3 (which seems unlikely at the time this
patch is posted), this will make devices with these cores report that
they are vulnerable to Spectre BHB with no mitigation in place. This
patch will also cause them not to do a WARN splat at boot about an
unknown CPU ID and to stop trying to do a "loop" mitigation for these
cores which is (presumably) not reliable for them.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't really have any good way to test this patch but it seems
likely it's needed.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update (one adding
ARM_SMCCC_ARCH_WORKAROUND_3) to go with it.

Changes in v2:
- Rebased / reworded QCOM_KRYO_3XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 3b179a1bf815..f8e0d87d9e2d 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -845,6 +845,7 @@ static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
 	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_GOLD),
 	{},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


