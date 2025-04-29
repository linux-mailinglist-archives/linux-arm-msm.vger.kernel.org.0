Return-Path: <linux-arm-msm+bounces-56152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EDAA0F99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9AE8477C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9854121A425;
	Tue, 29 Apr 2025 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rdhHIgrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BEE21A42C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938215; cv=none; b=N1s/lTc0/f6VjX9dC14zcQKnia85SF4YtG3NT0mV8Q3nqemvaH+GMm+I6UJAnW2JWNXTkxuFX8tQ/gBdaKSfIE6Ni3DzhJlP02bKD4e/NwqWMnhMEArF1mx0FNmTFDSA8ZETZ9WnvgOhXNxVJPorR/UKZED8stQ7EQhMaPRQWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938215; c=relaxed/simple;
	bh=L3zpgU519v8FVSiC0s2Bs8xmKn3xEU74xngr5HHW3/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXDB2BCq93yzoqGG+u0O1ONMcOj9y+9GP0DXlMpDSKu25YHTXuD8gyztWleOWbVBt9BVl5bQ+IvkDJSXwrct5pcFFH5Is1a24KCEfaad0JDAMYOk7g42Fr5C6qIw9A5AW0WJG5Hyw9Cfx9ei3S1gP7hHEAY/cmwpH4tEnLOk7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rdhHIgrh; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 56CA83FE3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938206;
	bh=RSy77QzrzSmmFSEMn2500QmRFAOtgtgt9hqimIHbc+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=rdhHIgrherdP5R3MgilQKuch6H1VnVijAbafsfpIRvbDU7bQoi6NcmjmPGVPqY4l+
	 ZzazL0bRW23phfMBEW7QOgNz4pmTI0le+8sCFkGsVjcCjcrzvu24rCyP/Zr8K5z5Qq
	 zEdvRNXRrQP/saRELO0Dp07ySL6ae/bYTOaXkM5angYEd6I4uvru9LeNks2v+tqOOg
	 rf3WqUAgMsMv5aMQ3DEsEIwc4Uqk2edJnsbdLhUhvYwaF/p/wCD5IAhhL91p9Vy5Ux
	 2vKTMpvvHDPtaO1jVIj9wLkKkO2hBApPkAJcm9Thzum97fy4FFtCXL6rSIzQ+pDUDl
	 bZdwp2x9O5wrA==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so26784395e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938205; x=1746543005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSy77QzrzSmmFSEMn2500QmRFAOtgtgt9hqimIHbc+k=;
        b=BdDOW3Z2W9HZrI2ueZm5ZCQuBfu0LUY936SPm0xm+btc87ltH0bp4xeOOoF8kIfehB
         wErlhC48ixsLnSbcN8OghRWqyi1a42WFxjJQjCXKMiSAP+MTCz3kdq7NlJlFGt2suzwn
         qyUTL3W00O2gd4x85eNkUrLzzbQj3laSF/EMp1K16NaJtIDmzfezMIj8nhZZtXRAb/rF
         sckHHkN36jb9DFWr2irLbdYZqT0d7sY/PjQv1s0gYyS7oISGltZwrycEdBL5KP3CiuQW
         2+1VnONE3jhinxSWxJgJJM9Q23mLk6JR9kencc2ErpBrdPIflb4e8wJKMjeM50EpS7RV
         fsjA==
X-Forwarded-Encrypted: i=1; AJvYcCWSs1Y/25QMjt2KfJiBCE26NYjvgvrHLgGeMcUeCU1Aq1Tz1gmy+0LlcYDOal35EywpzBpk1vUQfMwwmrNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMs9kT0MSd78h9D5IfdE1Z/PW1VRB3FovPq3w+ew7n3gfT0yHL
	xNvSY4wmvbLG1ZVadbEIq4IeMEkxnLgjKY4XqQBYmL2zrz2lZ7N+cMSK3c30BfAs4ytvbGF0sni
	/aHlugOaMhjmlLAMd04bbf4fIisiAz1vGKAWjNo967juCEr2LwI1qZI9BXfzCAiEoxVIDfEBlCd
	NczGPwtp3YaC8nNw==
X-Gm-Gg: ASbGncs1WaifccwaLo8zv0DJUIzkv38qztDFNu4JBewchjy6b55bc5tUJ1+Qev0YWCA
	eQKp6ItDKZWQAYh/4xXCPsAsGDcQYxhBb7OpS4IAuiGP0tWXpAYn66+LNXU/+tbpocgciTatss+
	4+b/saOap3npLThxydBh1Q/DU80EBnkGOQADTIrflACiu5CixRfEBXFFAN7qVM1sbkcjHiJNkx6
	qOo45UkMgH5s4uTc7h8/4qjRq5ySdPNCPvmeXjJz4j66FnygVVOtfHFw4s7MicG7GxPDwvC5t4K
	THcJr1Qrswc9dXxHpk+JF6M3qip9WVvYTElP6k+Wb06hU4Qi/YgLErWT
X-Received: by 2002:a05:600c:5108:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-441ad3a0c7amr26386795e9.6.1745938205613;
        Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBNLMGGQmzZ+4zNN01rof2/5j+W5PiK8ohD3ubXhioaoE87XpvqLSxiAYvqj+ZGGSHoStcVg==
X-Received: by 2002:a05:600c:5108:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-441ad3a0c7amr26386605e9.6.1745938205274;
        Tue, 29 Apr 2025 07:50:05 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm197378085e9.29.2025.04.29.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v4 4/4] firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:57 +0200
Message-ID: <20250429144957.2088284-5-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250429144957.2088284-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..e7262ad11509 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
-- 
2.43.0


