Return-Path: <linux-arm-msm+bounces-41135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C829E9D59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65CFE1888900
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289341F0E22;
	Mon,  9 Dec 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FAR6xBXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0F1ACEA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766336; cv=none; b=sGi1mUa6fexi2A4lWd0vRAHDLIJyqXIb+3vHWgoAeh49KDXc9ADX7IxIWWYfDdEpPSXLqGXqJvybiyxp8PL1g4VLl9qkEN0HgHRAlnNNvTOuwPJWwfjFqTkV5+GrWf9NJldPoJnzlpKkbeNSRNERUswFa8E4symFdK9Z1jlRt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766336; c=relaxed/simple;
	bh=51iLuxBMckF9PLpCnsh9tOBy/nP2wx6MKEOSwidGqOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HA8zQ5o6jcTHzj/NdXJOJq2hniUzAFwNg/YfXwi4CWGgPAHebarxz97QcY5wL9IBmPLpW3BQEjJnTxVloIzu0g+0zGAOCXT+ferYmLm7oqNH+8TDyFlZqFUIn715siTVGMeYePO3lk0n7OjhnCsJgXY2Oj+bsJwNBmAfRBUqLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FAR6xBXo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso3276967b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766334; x=1734371134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev4g8LO+jsu6za6TCZISAQbXcC0h2bQ18wxFdEcBjYE=;
        b=FAR6xBXoB6/XlSar1MvySlrHlPW804/ESPl3DavhHzHIgl36qzcm8AZ7nGb3lDa04i
         ARac94sdRSQp/HtHSlKMJfl+Zu7xvWyQ3/8BbJn2apfMZqKJUU7/eMGqdW2vNPzGcZT1
         xFDOzhy0ufJzLT4YhpXaCz0pB9WzfEyDc9gD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766334; x=1734371134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ev4g8LO+jsu6za6TCZISAQbXcC0h2bQ18wxFdEcBjYE=;
        b=VVpH9wORA80Rp81C8PiowAoVg/GirUeJAn7pBdMVl6RVJa1dqsM7JFA1RJ1q/bBFNn
         28qvTitfG3o3XJ5tkm3Sinrozkk7JlaNFQG7/NBZcALrt8AJLtWNCMhrCjxa6IhLEoOU
         3dgNyh4NElWKBnZKcM31obMt85Dtpz9HDk2ADRevP/9APq6hGsaYNNYlr0vOTr2XlmMA
         QxnfVHdxiq5GmipKl5fSY83BCFwAsukA/FMayIN7fHLbpWfJJ+7ULHI4K4B8HqL6aXCB
         hkmsYlFy64qdkZs+3sH3teaY3SOb4wwkuOTUj41cfaq9ZVu52CiKuiuRk6RcTDagrXwY
         YH4A==
X-Forwarded-Encrypted: i=1; AJvYcCW34vU/O5yX4Aj2LMDc4pcOVggLqj7YVNyZy0Syn3SYO5sLwCBVZ7Tni/IanU7H0dcFVfVSP8MJItemLGSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw76vSEtr+2GhFnUr4uOI4MIg+zr11NQ/6QjMUwwpiCPKzWLK0P
	JI8jCNluvFRFevTQXRP1etwf6ocrTdIpnjF8YVbpf9vgFzoouVt7WePWV5qNLQ==
X-Gm-Gg: ASbGnctVbwO/43016ktJlUTpmFH5JfPqleG1xEWzPKIyHScl+XP4g+SZ0nGWUCuHhT9
	GMHji2vuQprAly4t3Ak0PvBRiCiuJR17eqg4wTW9u3tSoJFFMX9yTdv39XbAwINxdaBP+7gPSkl
	FRlps0S2ia89XG/Idk4KaP7THgQK3u3+I4rXODEUES9xPSUw+mxp4o7eYxILJrMnGHfbWelO6Gh
	woizLZOd4wEuqLb1kb0jlvchmk4PvyjuTDrB6QtQ1p+lxUwo2AuGipPdFJf8LdtFFhfog==
X-Google-Smtp-Source: AGHT+IEnZSRvcamRsFqfzU4vT8XoxmVAFMYsZp4K0Vnxwtmo9CBfsTPWh3l3tzKCmptOqc3Lav+yqg==
X-Received: by 2002:a05:6a21:3290:b0:1e1:a885:3e21 with SMTP id adf61e73a8af0-1e1a8853f19mr7243347637.7.1733766333900;
        Mon, 09 Dec 2024 09:45:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: errata: Add QCOM_KRYO_3XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Mon,  9 Dec 2024 09:43:14 -0800
Message-ID: <20241209094310.4.Ic6fdf0e43851269d10596da7e6ceae959431f9fa@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm Kryo 300-series Gold cores appear to have a derivative of an
ARM Cortex A75 in them. Since A75 needs Spectre mitigation then the
Kyro 300-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no idea if this is actually needed and this patch is purely
speculative. Given that A75 needs some sort of Spectre mitigation it
seem hard to believe that the Qualcomm Kryo 300-series Gold cores
wouldn't need it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update to go with it.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 0437be7c83bc..b1881964e304 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -926,6 +926,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_GOLD),
 		{},
 	};
 	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-- 
2.47.0.338.g60cca15819-goog


