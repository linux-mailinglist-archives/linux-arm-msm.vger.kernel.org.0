Return-Path: <linux-arm-msm+bounces-41133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AD9E9D53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB931671C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5591BEF75;
	Mon,  9 Dec 2024 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WKeOy/6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B031B4234
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766331; cv=none; b=DpmavPbCm/u5XADPqcXryKtr/N3EQBCdhWNXbEdZ+Xd4I6qBqVDGZgmJHvL5CuBh0RuLwZRSA5RHm5BqS++sQU+4VwDcalDvq5guRyurs1OBttcg5fCkO69R/5IUc4WwEZlLuMX79jCKTJ4fk5PNDVwM1p6HnZoArv5bTlmEfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766331; c=relaxed/simple;
	bh=GmNqesxkgBcJIscVO6PMD2XTQoHeWt84/rl2brvJAtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYALPK0i+seI/oV1o7QKD02fO/91SH0oPUjh7/cxQy8U2B5Wqtt+E10T0zVmssxe5oqBGLpV31hJlTHEPiI+kngdJ5GTOh5VfmcNTKS/uut/pTpgJudZ3LaX07vAVIlfOyQygXUQyUVs8ux2lG4a4UqfqJI52eHFB6PE3955Ht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WKeOy/6q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725aa5c597cso3432819b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766329; x=1734371129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qETIrWIvBOaJo01797E2hvCoFBrPeIJqundEykxnLWc=;
        b=WKeOy/6q2armRGhaVvnP6PmnrZBWCqITFsA2UWUDL/uvb2iZF+DGIofk6y/UYN2s4v
         +wc410KNOqdcohqVYkF9zUHrkkE5KGTY1oWRTs3VAdQho5dqhRvsmtZBxwklYCxrcrFU
         gW6GwXzZTuOlNEWUP4k40ydF2d+MOS1pWk/0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766329; x=1734371129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETIrWIvBOaJo01797E2hvCoFBrPeIJqundEykxnLWc=;
        b=AKrxvozGPMmveizCSGlvefd/o1cz8EfH8kSybb7m9BnE4X9J3teD584QzhHlAuJMgZ
         vZByDjnPiwcOBeEmFsFNsDC17RJ9xiux4f3DvL/5WbWhxO5C7CsQ0CxQFvjSm02NER7v
         QtZlRqsuTFLzH0QoTNVxyLq9+N15Xj3PVGU7j7VqIjkuTB5mD+gZRX5HQt1uhdVIoK+B
         Xk4k34/FbbntKCeOA43HRvmQSPmvcgDg2WPLifoHN7zvKmkZcyFg5U13aOurUmS7x+r6
         2rP4fQqnjRlCaz+2AyJmv9TpGuLRcSfP7SLHCIWieSywJbEmLU+sbq4TFCt0uIwOMjT9
         o6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU1tTE92pox6Fk6/mu7NgGi89edevY58i5tAErubeLjIXi5seK2YP6XplW+jbp3ZeRqo9TUvM6JS9aWzik2@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVAZsoejQCSK6HZAPl06D724nKL0aYVw055dUcJb70YE6sM0n
	B2gdt8Hx8Pv9NEYQhG7/av+f6vR9K3h+DzDcAMQ7h1XO3ieo3MOReVooCPzOww==
X-Gm-Gg: ASbGncts4MtwnC4BMjSzq1hq96exhO/GmZ2h4K3ciOtk/Az+2/3EHzzEwp8++kAlivz
	GSiKvAk3vRH9E5otnKRy4+lX7mhCY1BkVTNc5Ba2TQ49TqRNFljgBrqZj/C4cHHza+cOyJarY6r
	LDcIAiIBJTOYLaZMEAtsw/GRquP9YogQhbHdIK6glsBOc1yammWrKBUFUlqAMRWMUKybsghxAcs
	87HyGpTPSeIccFBYh07M6pl5+fCNMRnzSNqmyn15ks8ZoHqtci1zOJA/vjWpwBwC4yqaBwFYg==
X-Google-Smtp-Source: AGHT+IEXGhJtpWKLCDTsUasg4AZJ83eo6fiziwMvcakNMUhC1SAx4Xv/ur4wHscvWzwdgagPxhNRYw==
X-Received: by 2002:a05:6a20:3d89:b0:1e1:a3cf:c199 with SMTP id adf61e73a8af0-1e1b1b8a4fbmr2336458637.28.1733766329338;
        Mon, 09 Dec 2024 09:45:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:28 -0800 (PST)
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
Subject: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the spectre_bhb_firmware_mitigated_list
Date: Mon,  9 Dec 2024 09:43:12 -0800
Message-ID: <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
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

Qualcomm Kryo 200-series Gold cores appear to have a derivative of an
ARM Cortex A73 in them. Since A73 needs Spectre mitigation then the
Kyro 200-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't really have any good way to test this patch but it seems
likely it's needed. If nothing else the claim is that that Qualcomm
Kyro 280 CPU is vulnerable [1] but I don't see any mitigations in the
kernel for it.

NOTE: presumably this patch won't actually do much on its own because
(I believe) it requires a firmware update to go with it.

[1] https://spectreattack.com/spectre.pdf

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index e149efadff20..0437be7c83bc 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -925,6 +925,7 @@ static bool is_spectre_bhb_fw_affected(int scope)
 	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_2XX_GOLD),
 		{},
 	};
 	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-- 
2.47.0.338.g60cca15819-goog


