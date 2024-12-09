Return-Path: <linux-arm-msm+bounces-41136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B78259E9D5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B607281672
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA741F0E44;
	Mon,  9 Dec 2024 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JIVATiFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF31F0E2E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766338; cv=none; b=jeArV0qw0ubChKe9nng4DuY8DbhxghoCSWByvy7IdeHHzMM7fkXDuSsOT5kEjb7RkKRlSBFZ24VJFqPRo6fC/h7Ct/EvKsepOcw1WFxQrxsnKaK6dfNdZpHN2luwJE9K5SSX98NS8Zgc2iWw6qZf83RXCe6UXtOhwKpuoSPUff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766338; c=relaxed/simple;
	bh=a9W7lPfTL24mvpVVw+B1vw215RW9SqbAYxd81amSaJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJqdR+tUB1vqbAdvmAlaZY7jWzZyTE4pzqq+doGmF4D7/y+KWfk6Sqz3uQ+m04bjwFFJ6svIaj+HjQUGZVvkIUD0YAqP5lo4DKPE8Dl5wxc2FayTRcuczq1JSUHQQXGz06g/M5jmUj/crHWtxJdqNUtk8dfrfi+8wdzYCHv0P84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JIVATiFX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725f4623df7so912961b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766336; x=1734371136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldSIoyp9NzMDNJ5LpZ1ZVmXMctRJ96jT6CjLzy1v53A=;
        b=JIVATiFXKgEVB6Np4+BzpJv/Kw1+jPTSnDQLMgFGjdb7xZVZRlHEyNdZj4O5Kyc/d8
         bFSHydRQ8dUqpsu8Z/tRgJnAQEOC6LvJtNwV/KmyfRgHApF5DSAtUAcUd+ZQOqMxRo9a
         3zSH2I9//tkIBm07a5N/aDryNq7RLA9mhGaWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766336; x=1734371136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldSIoyp9NzMDNJ5LpZ1ZVmXMctRJ96jT6CjLzy1v53A=;
        b=Ig5cSCyzYXi2MG5RQGRu/2BLDfq0ipDorAKe8dsJ7dgPIIa1JbJMN6rhwAr3pD/JUm
         HqzsoEncoyW3/60RCcg6U8vTcVh/s9dMCMqs3BkguJctTRiL9GEHKL9bFVz37QARt5OC
         8mLGrpw+BXYVeVAC9Ki78UhdFgGfrLp24Ter3Dk9fxJJx5D1zK57B7EKvhyDoCxiJqZJ
         XftFTwsGdZ9kE11QCeuhvE26aZq4QH6LlQ63rCHV4YqflifB5Sha+gHoU5bFGapmsP9K
         dO9uk7rMBzZ7kN1Pc9VAn6hU5PaVMqLk63Pko9BLyEarQsGJk97VIBu5bZ3dkyLOp63n
         rXlw==
X-Forwarded-Encrypted: i=1; AJvYcCUggg9okW2YVeFGyWO3UNyeSPTPd2gBzhgJWHbuRMSnctijZ1Ke9xY7JOq+OoUt4KHUea0r3S14lRObuTkQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJNNpwjmhrxXY9qG4sBKH3aIqMV2XMd21uSA2F7fnjuaas2oF
	Oz/9QHTe8CoT6OhiBVXZx+HIhcOJ1c5QsYhYuDrBjZwF/fYbANw7CqNVxScZNg==
X-Gm-Gg: ASbGncux2gPYZxhUzqRBbg1G+u8YmdP8MmJDjQzTKl95NLF8HJJm5D37qqoMoyEOi5c
	cwv8DVKQgjvCprd4qH8SXAB63j5ktvQVw6GRilNv7lrZOdjrsxyaYtH3YAvIwMENFhJLcXRKTWC
	QIXfQjaCC3+YP+LQyT3oFbR1DqVArxBGSn4BsBGwZmczY/Y0LtvpYWNVyhZFMsRbBjAn7LJX+hx
	IwORC/k7hU57lGPH79QouACcjDXwotNPVc3N4CTnUyiaAjz9AKxr9FXzf/zCVCpKqDrnHhGVA==
X-Google-Smtp-Source: AGHT+IELiiIw8x+6pqx5MHw1/w0eLnkGYWzCh4ZJPcD9ZKeamtyRCjQeyjxABNpF1rwAj87E+o4Ygg==
X-Received: by 2002:a05:6a21:32a8:b0:1e1:9893:9a1a with SMTP id adf61e73a8af0-1e1b1baeb1fmr2540833637.46.1733766335943;
        Mon, 09 Dec 2024 09:45:35 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:35 -0800 (PST)
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
Subject: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
Date: Mon,  9 Dec 2024 09:43:15 -0800
Message-ID: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
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

Qualcomm Kryo 500-series Gold cores appear to have a derivative of an
ARM Cortex A77 in them. Since A77 needs Spectre mitigation then the
Kyro 500-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Yes. I know. This patch DOESN'T COMPILE because
MIDR_QCOM_KRYO_5XX_GOLD is not defined. That value needs to come from
Qualcomm or from testing on hardware, which I don't have. Qualcomm
needs to chime in to confirm that this Spectre mitigation is correct
anyway, though. I'm including this patch so it's obvious that I think
these cores also need the mitigation.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b1881964e304..212481726f04 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -867,6 +867,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.0.338.g60cca15819-goog


