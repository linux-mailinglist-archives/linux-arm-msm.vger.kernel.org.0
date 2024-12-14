Return-Path: <linux-arm-msm+bounces-42213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6F9F1B8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3145188D117
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAB9433D8;
	Sat, 14 Dec 2024 00:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GHL4kUZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD963A268
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137597; cv=none; b=gfSdwmk1GNKNT8R64AcZRthGN1rsAK8Rs3/uJfaWsJYO84YwLSZ8KDK8FpcXIYFSQfGdc0dGOkFwy+v1p6MRgkxGoux4WbqkW4lwdgvjcQPwzSZo0ZUToVW5+NsD4RKPnSd+G7+efTuPLHXh5zU6K2bp+keM6xe0lovYNhRSnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137597; c=relaxed/simple;
	bh=DRY0q/4lkC+b+1JUfhPJH5/uaKyj3aTDNMkw3d4TEtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8cfCtHzEtcv8EHjH8bKOvTCn4XuWA0yjEg053r9FPZSEA+c89gpczNaZ69qMoLKeBjV6FCxhK5JALLEvAWtQWAm/pS6RjZGuBZVZgUo3nVXvKTYKNQfng5ufgephaQBVZAR2HsvNhI6ya1xvkipgmva8wWsrwGNBxGIjHrSXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GHL4kUZj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so1578728a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137595; x=1734742395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDl/86yemlzCX5AmWhge7CoGQnGj7feSxXoMoerczhc=;
        b=GHL4kUZjkPzxKX1jDExTn8dwjkfBeXQlCWHpgGr0ReFoOfNeVe6FmegXcR7b4eZEn+
         oZw0cYSWuW5TtTdSZLsEMEC29biGthIEZPi6iu2z1rTty6sskaE8S/AJVmpSxFEZPluV
         YfzD/h2JNRDR4y6yccpfDsbdqTGuK0bHta9dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137595; x=1734742395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDl/86yemlzCX5AmWhge7CoGQnGj7feSxXoMoerczhc=;
        b=FCGKeFrcvLyoI/JfnGbbUCeKBDgBJlsBbDrARVroWxKQ06BFZ0pZOHoCOi9kPQx3Np
         lZCO0PksuKbtpbmHt0N79yCzlhxD9QV4BMORLvcRUrco4DPyKs7Qg3DvTULM3NfAsx3r
         FpVwmDBEJrZpeMAuRQuo+2E63Cm3/cHNuxyxlO0RjHAoyGlDXJOemhE9SgzUTMVHnuyT
         /KdBzbGW3+60SJ+WKd+4GkKWumdV9jaJ5J3sRPi5YOQv8s+ST/nMG/Zp/NuL32be7wZ9
         m1GyBaKzmnFLITfqlwNSJn1RoXIJf+GxndLh+722UFI1MY6AIRrHvhvhtbdn76jAXcB3
         v16Q==
X-Gm-Message-State: AOJu0Yye3RnYg78mBZqK/sE879kAHkT9pwzZJbVg8Ei0PVKRnMuQy9mx
	jA6RCpAcvPdtqwdbEtrCUab6AtnxFMbp/N/sP+7QOWvUxzrbrUlUoT0bLU0wVg==
X-Gm-Gg: ASbGncuVr8URlkV/bmZVQ1EkJzS5JqNVoFUeQUGEH8CdUEK8dlhM6rQRn0jtos/pGO2
	aP4NYJKn2GOwk7S+nzdt9hqE/8fbpDIzDzercZEuqiznfR5Gc/BPQyxCgh/1Wxc8dSYQ7onFYKZ
	z+ERi5CbTY4yqcEOYKWw09Hy0wyRWUJ2ytgVxDQr8tf8xLTc1+i2bZhFudRKtOOiNYqgYu+5TK6
	aLh+kMwsEJQYDmC4NhdowIgLZ4l6L1LXDXwXkdDIh6uZihNiRt0+1ozK74ztBG8gjxi0Aebx5yH
X-Google-Smtp-Source: AGHT+IEWnlkjBeBQBC3iIoArI1oOo5CsVi/i/Wbk8mN1sXE73heVuvKgGafObymqxw6xhGs3c8XA1A==
X-Received: by 2002:a17:90b:4b51:b0:2ee:d186:fe48 with SMTP id 98e67ed59e1d1-2f2900a6737mr6197559a91.28.1734137595490;
        Fri, 13 Dec 2024 16:53:15 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:14 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Fri, 13 Dec 2024 16:52:05 -0800
Message-ID: <20241213165201.v2.4.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
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
ARM Cortex A73 in them. Since A73 needs Spectre mitigation via
firmware then the Kyro 200-series Gold cores also should need Spectre
mitigation via firmware.

Unless devices with a Kryo 2XX gold core have a firmware that provides
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
likely it's needed. If nothing else the claim is that that Qualcomm
Kyro 280 CPU is vulnerable [1] but I don't see any mitigations in the
kernel for it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update (one adding
ARM_SMCCC_ARCH_WORKAROUND_3) to go with it.

[1] https://spectreattack.com/spectre.pdf

Changes in v2:
- Rebased / reworded QCOM_KRYO_2XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 04c3f0567999..3b179a1bf815 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -844,6 +844,7 @@ static unsigned long system_bhb_mitigations;
 static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
 	{},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


