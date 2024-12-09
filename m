Return-Path: <linux-arm-msm+bounces-41137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72B9E9D5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCCC18882A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B061E9B07;
	Mon,  9 Dec 2024 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UgW0Al7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7531F0E4A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766340; cv=none; b=CiQpuYaSXWhHOVAAEn40pDoFL6Hocy33IRz2GNk/Z2BRj1nKKib8DK9skXNdN1YuM/Sy0WFjmgSeF96ELUgpM8LvKLrK8/m4uF6DlJIvyPZ6ajZRr9BdYN8RdP2C8iouMkUtYcZ24jcLumqZb/BHzLZSJqi0Y9OxUiQfiPhfFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766340; c=relaxed/simple;
	bh=93qaJ3GVaHtB9LawpPgXq1EAwtT4MSNyTdLDOphV9YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LX8F9jg04NFZRMfFBJsTTodlzdHJpNJx7LZHS60BXcEZFZXxPt7eCoR4Klnla/hA0orrspc9zWQGTqwWEyPmjuN7W2wntmAVB1IjXuiWzG8YMnG8ouEEcZ+f4Z5ZTmTZqrkodgNd28Ih6HEEXLIGsgCjfnyG4UUFCv8/asdkKq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UgW0Al7j; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so4005264a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766338; x=1734371138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPxl3QSUuHKTV79x7MMAWoOiUWB66qwESu+TwnhAWUM=;
        b=UgW0Al7jzpJSHMgS4O3g56QcneFqPeLA7SPGCRZ8D0Ik/jAF8qGBQTDRcontVhnrqr
         gSeJPzOwZhhmHRKL71isKrJMYOQqxSGwpZEMAKl7E65J5JSQgm50mAo4gqoVmDYHG8tk
         Xdy1aJxvm21JuBegVfDgHxJjh5dI0KyFu6azE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766338; x=1734371138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPxl3QSUuHKTV79x7MMAWoOiUWB66qwESu+TwnhAWUM=;
        b=fHzMB3n8nQozL9yNKejI30HJoWovGJu+jEiPUtp3SbN+mhXA+eC4IDIbrCJ2Yc/f9c
         v8pigzw/uU/h/e4WzJpSFIsG0FgoeKgrYJoeG5TEgwzEXChl705Mao1QSrKW1abmvcaq
         tUaTrCOlRk87qTVWBEGMsg0joiJpZDtZxjpz1k/DmB7KaSCgjpply5OPtm1WlmgXmKqJ
         ZNtysuPoNeHw3p+XwUuWIvVfeDS0lS3UFtMyU4D+WfK2VKHTw0PSLX5PtNsGyTWEMzPL
         GKxqjuLph07xlbKz+hgxOXQkbhTx/8aXUC7Is9+jePcIY9djuhPIOoibpvU93aYOE8np
         pELg==
X-Forwarded-Encrypted: i=1; AJvYcCXb2VVCiCnrHmKzxGzugGl+qV/UVct9tpu6UhYcuJLo9WtIvhejeto/ZaTCnflsacMBP74948kyoUXRx4fU@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuDsceyLr+CVHPD2AUIa9/NzFtfGPvv4MZ0XPaYHR+9LofwW6
	hdP6mZqFgTAKEItbXYbUFxBPAoEfZYMGzIEMJH8Y0DsBtBr6cIq4t5FgUGgm3w==
X-Gm-Gg: ASbGnctldMRNT2toXGBOqcvPx5Ae3V2ER6HGY3kmsmtDQafvOq/I2/Qx9x5QVSY8h0L
	5KsrBebyfqRpfIh/yHSWG5WumnvQQW/58RqVqmrFIwlrw9A9SfRddAGfDg+zXqb4XGSP4YKbzvc
	3Vy9KacetLHuasnP/og8z9krVIILbYy1+7jtvU+4eXvKb1dYFX4bxMA2y1kR71s4I0j0G+QSmob
	qusCb/oQgpnHsLYhuEzFOcJ1n7kaeoSo1UHKD/JOFtD+4N/fOkvoTByVFbrceB7HYN84Q==
X-Google-Smtp-Source: AGHT+IEQ1TiQkcWM60OYrpKHzb5BVzSSsklo7u5kyWPZtuHxhJvmJhyRRo76EY6ccYMPTPOgDAZo6Q==
X-Received: by 2002:a17:90b:2783:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2efcf137ac6mr2051960a91.6.1733766337960;
        Mon, 09 Dec 2024 09:45:37 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:37 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
Date: Mon,  9 Dec 2024 09:43:16 -0800
Message-ID: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
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

Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
mitigation then the Kyro 600-series Gold/Prime cores also should need
Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Yes. I know. This patch DOESN'T COMPILE because
MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
defined. Those value needs to come from Qualcomm or from testing on
hardware, which I don't have. Qualcomm needs to chime in to confirm
that this Spectre mitigation is correct anyway, though. I'm including
this patch so it's obvious that I think these cores also need the
mitigation.

 arch/arm64/kernel/proton-pack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 212481726f04..67aa54017dea 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -860,6 +860,8 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k24_list[] = {
-- 
2.47.0.338.g60cca15819-goog


