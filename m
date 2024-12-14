Return-Path: <linux-arm-msm+bounces-42214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F169F1B92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9CB188D197
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679937EF09;
	Sat, 14 Dec 2024 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dnexty68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49B474E09
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137600; cv=none; b=bot7o27gLOlPJoBtIu/kU7RxvKFejHoEZ0Tjja5fdTv5QC3/GBU/ADNfC2MQYepM9XxfwS2Si86yAbsRuDjOf0UjkFBMyITPcbh63H97Xbta7RWh/fpGdqTgZnwonA+rPoC72IdlPSQkUCBeH1+7OuGAjzJ+SMuIzGdXGHbiPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137600; c=relaxed/simple;
	bh=wtOPnKbsorF7XJRH1GXzXj2KmpV4JSzbTQjjrqjiA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7AlJk7m/Mj+ff4q5lgC0zmOhFAmh5KjjUSEzKc5tDK8HNwdLdYBfMhsureDNaDXM2sryY8rR3e0d/2uktUXXgOxZ19FLt6dO7pjdYXqPx+0yRE81AhzJYtxCIuJ7WA5lHyPDw289TdjJH8r2LwLFt/tcWEBHu52tTkRPoyIThk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dnexty68; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso1581875a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137598; x=1734742398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrdqv5su9sKfrkNYXwk3VMWny97c1fSpv0cdthxhYIM=;
        b=dnexty68MmZaR2XUnmm8HfrxZKDViRGTfHbMiwe8Du5vrjkrHxU2BiyoSs4MR2U1LT
         eK6VvUTg30WllBGRgxU4qJfL1G4jyZq1W/2+daHbUWuztmkSoe0xgMrOExMZwLA6WGIJ
         CCHPcvCsY7eVFf6q/M++P0NBfDvhlzS9kRSTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137598; x=1734742398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrdqv5su9sKfrkNYXwk3VMWny97c1fSpv0cdthxhYIM=;
        b=X/8xmDbHe8GhLLct1Q2llKxvoHbKy6QCAhyxQkBR2JvaxTcblWx0Lfl4yiiTrzyQyd
         fgjeP0hOWGbd8bUvswW3QWWLIGACBAgMr2TaSi+F4mAPEFyyC37Xt7YoZKu4oEr0Ew7B
         4zhdHIS5RpdkaA3P6DY08MNsr6EVt1Xmwk+e3tTNsqQPzFocCRoEY9xpB9x9+3U3/aov
         VY6XcOlirHBXs8bO+skVcp/M2yJwSgoyx8xbWD7jzcRjvNDJgM00igMcc8JwwVLt9EQ7
         mBJLzQzprHYQ3BN5IVhUm20dqlx4/9O2qS1Ip4UBwVuE5SB5cFd4oXe9JAwu6FPDNV7l
         ChmQ==
X-Gm-Message-State: AOJu0YwJ0sqjCAsivc/kbjbO1vdgkv7m70Uc4XWCOpQBcLtZ8WxotHwM
	1C410FmlZ887JJRLKHif4NJ7gBTcG6kCKIfW9beLtubR8RQseLdKiADywbQdEg==
X-Gm-Gg: ASbGncssmEprUpHiH+hMtXiqs5UJIo/F1IaS03OIDXiC7DQt14+/Tt+qjVWHGnHqeOu
	6VtVeQB7O3delWThXbqe9ewvfhYlqk/urhITWgqtv19hQBaRqq81HIiEaSiS4SLs0Wxhh6f8oCq
	dnr2KTISIIUtGrLnst/4qNhTmgjo9r5yOMxEXs0XRam32R/Olpe+lGNGELfIdHFy1n8jgOpe1T7
	Evr0wYgK+XolabST1VRBQKkV6iUdqZszlBaPtUGO2UY3MVjfU/jpRy1ngrLk2LWFbCycQnJV9yq
X-Google-Smtp-Source: AGHT+IHOcPfHNBrkQn6M2DPoYqrW9wGOVpvFmhjU4MB0966dHygCTCiPIakP//mkJvwDEs162n4ynA==
X-Received: by 2002:a17:90b:4b81:b0:2ee:b66d:6576 with SMTP id 98e67ed59e1d1-2f2901b3256mr7290054a91.30.1734137598295;
        Fri, 13 Dec 2024 16:53:18 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ae86:44a5:253c:f9bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm3788270a91.41.2024.12.13.16.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 16:53:17 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Fri, 13 Dec 2024 16:52:06 -0800
Message-ID: <20241213165201.v2.5.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
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

Add a definition for the Qualcomm Kryo 300-series Gold cores.

Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e751349..c8058f91a5bd 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -119,6 +119,7 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
 #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
@@ -195,6 +196,7 @@
 #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
 #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
+#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
-- 
2.47.1.613.gc27f4b7a9f-goog


