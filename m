Return-Path: <linux-arm-msm+bounces-44203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0AA04AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF43A3A5B86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D3E1F7085;
	Tue,  7 Jan 2025 20:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROePip+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0691F7076
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280494; cv=none; b=iMakXLnjMZe6zpC5rS9Mhtj8Ekrr5AKyrYLBGaDxYQ4saQrPazbM/3Q01Nc1zfIFjSDOtgAHKAjxuzbLjVo88AuUOpdSkZz0qV03sHSQl0ugKcVlHjKmT8n5ws6ry4Yd7UEJBM2mOOJMxNRuK/YxTuS56pMPqbpQki374JjKeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280494; c=relaxed/simple;
	bh=4/CkRjq9kcUokUjRmbo9S34/t4UeumZJsbesld2STWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J90eOeqCZ7coR2Lgz65Oi8yl47v4PuJnoMLh0EJa8wo7m+ZKseShRssCwqwXE14TC/CAMZLn4lKlOq3BZW6jV91PPJpdbtueXhL/zvaFKbrl+gR0ISu3xzWx+ryly5wvA8/l+DmZnpOnEwwqa5G98+QlyWMUdjnXPBbb750cIXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ROePip+n; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216728b1836so215819045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280490; x=1736885290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KrxwWdw54K0Yj+RKR+q5UWCVF10MxJgob7ZMKnFuvw=;
        b=ROePip+nHNwLAIrpFg+8tCzs0mL0XCNKxdWTETBa5ccyD7IC50fw45pgflCDLr4oME
         IwUbRt3pUa/4FcO43ZfuqO7RJ4/+mJQP9EM0Afy2WPPBQ9oBuF+6eV+fkPtH2UrQFNmU
         0en5z+fIWWEAP4RSqaMqWD0catzTAQyc8rxnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280490; x=1736885290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KrxwWdw54K0Yj+RKR+q5UWCVF10MxJgob7ZMKnFuvw=;
        b=WbZO1DbBBk9uwh4k4gofhCqHge9ukFybWxZwScxnWPgfD0SlrKDMK5ffJXet++UH/6
         8kY15psQdIhxh6d9DBd+mR2ZUubmh5pUaJ2MduLfRsR+jrUAuCCYUHDk4XC6JWJZ/N6/
         U2GqfMfErNQEFFdGmN4nHWoKyzu/d9hBcwylroBGeH6wciFAXi0adXZmZTQWHRHAT7Xr
         PSUeghGHzwiNIHlRkWtNyc5VBHfK/EdTQOuccf7iZjyxwkQ1dlqNtbHV0Pm2/pyGHy2u
         pWb6MBRmevl1iQH0nSwCDHeqKw4E5cWRo/qZrkrNLD871xjDSNznja0bgKLS5/0rZnPX
         K+gw==
X-Forwarded-Encrypted: i=1; AJvYcCWIw9PhfZH7Er1qZSY1m6eFn6biYa/LJDbpT4cLYXfBBByKkYC47sfqzg6q0nAWOVQLnewSd42PhVUawBLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kNqVaLcNkUUttrtLam9nWfxGTXO/HsNHfn5X/jGc8BQyTDtG
	fo9z/8Nhexg3ghGqoP+N/28a1pwTBn/I4nBiXD2bhqcX99COQBqjuU1dBRvSEA==
X-Gm-Gg: ASbGncu522lFAtOqo1FkG6fNcj7Z8IJVX84qxr5dflfa5ffC9Jkabx/udf1OThQ4j3b
	HFeEgQknHdr7quJ7c3Z3V0RO0illHTzYVw4J4/wodkkszwaQn9KZkFJAX/QkNqT+oqKKKTGeMTg
	mmlvJe66+P2I9W7aLM8x//aPnumekgU+8Ht07E7aHhACNND762HHiH/Bh2um4mbqGcFKzhOw3zW
	U3cfEeAZJhGyUglGms/pioR0I39MIJOOtwZJTennWCYvX9RXBctgLKJWtusteJhzBxVcdye4ASp
X-Google-Smtp-Source: AGHT+IGlYlv+o4b4M4lfyay2yfIQhWPrIig5AxGmXyZ7/rDfeJh96vHrE9iSzFs341VZqJN1Vu/LmA==
X-Received: by 2002:a17:902:d48b:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-21a83f5510emr4528055ad.18.1736280489913;
        Tue, 07 Jan 2025 12:08:09 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:09 -0800 (PST)
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
Subject: [PATCH v4 1/5] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
Date: Tue,  7 Jan 2025 12:05:58 -0800
Message-ID: <20250107120555.v4.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
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

Qualcomm Kryo 400-series Gold cores have a derivative of an ARM Cortex
A76 in them. Since A76 needs Spectre mitigation via looping then the
Kyro 400-series Gold cores also need Spectre mitigation via looping.

Qualcomm has confirmed that the proper "k" value for Kryo 400-series
Gold cores is 24.

Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Cc: Scott Bauer <sbauer@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.

Changes in v3:
- Removed QCOM_KRYO_4XX_GOLD k24 patch.

Changes in v2:
- Slight change to wording and notes of KRYO_4XX_GOLD patch

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..e149efadff20 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.1.613.gc27f4b7a9f-goog


