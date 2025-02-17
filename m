Return-Path: <linux-arm-msm+bounces-48187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27423A37FF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 716E01890748
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10287219A99;
	Mon, 17 Feb 2025 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCKS6Tup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E975218EB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787481; cv=none; b=S3o8qM4elN4b1FUnhiL6N69iMHrfu/VgDyNc7klHFKcZfn9NDhBmwQ707ht3mNEyINNO5Q6hSBccp8CRIW/i1QTV8p4VELGnTyPZ34jcFDMI9TsM2mBuAKtpQAV2uyRY+9AWZRxvG537mpkEeJz1p4dPBnG87VFazC1p6A7hF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787481; c=relaxed/simple;
	bh=6JLAQiXiBCTaZy1rpRUfOhG9JvPaEfv2VkDTKVoBVm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5hK1NJva8+fE/nh0qL8hkgE9ANz0akllf+EoavBBloD9SgRQkSElmM/boDaZPreX9g6cRvRzRzUgVZAkqrVFcjJV1anyyoDO+ApLe9gULdFiPhyZqIV8RTtwkJF+z9qxDI+6bbzPd8zAFyV7kLi8LTa3QOKLZYWM1pmcIF8/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCKS6Tup; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso622263566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787478; x=1740392278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Td102jvjcyxJvAztEsXWW/VUH0CMT8UhqkeVVK6uLU=;
        b=sCKS6Tuprl/dYZRp9WH3Ijo33jFNfIf/A37scAt5+zGyFA1t+uzX6VWzy2Up4AaaEP
         rIvRcQHGHZUbwSR5zhg8CbBGfkP8xJVOgV+XG1iaPVUnt7bdlbMIbxu+7E6hkJL95owb
         4jakP3fTtCzUU08ui5gj3dUUZZlN8wqCS5xLsI68ZmyXObdD7fTiC/hzaqC5Pv835ARc
         x8umw/067y4wYYJOzbupwclrgqd2DynTVu1X/79YPj9TaEfcK1DI+qPy5it45oOXHoZD
         mQtENqCGQBZA4XZq0gV7F4UhlOqLU8UzNB+97CT4YxhBJyvf6M6TYMK+6+1uqR+Cauag
         9xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787478; x=1740392278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Td102jvjcyxJvAztEsXWW/VUH0CMT8UhqkeVVK6uLU=;
        b=YIUswhNcax6/9RAHC0tiJTtp9M7PMlW0UWV5uP1OEL84oSg2jjxf9qGwMbRwBgYmho
         +gCWJUQ0omivyv/MFpFMrl/YaSlyEcVkT0Z2Bz6c93sQ0je7Xbc3zTa5JabUYxQ8+glh
         q8cs1zsz7DqrUh+ClGINo9+/jNeUKziMX6PwQ07hpgbUNG1/8nnh68GcHOcylVpRXIrj
         NuvYlLfU/rclUTBGztwETLz7GfPPfDIQ7ZWKz83+8V3GLFdgDz9+ZgRwjhxjHjMzash+
         XdBPaUrkEQ/rn9+ITeuoy29ovSOJUmx7Kye1PczUTgwHIf3Z5AEGA3NowaOrLwIMiM1w
         qZ+Q==
X-Gm-Message-State: AOJu0YzzzTGQlR4e8cgxDP6zFLyhiodpYdseC+8QDXME1AtnGtZ5KUTA
	MK5I0K3PC0gcqrvFL049lamKuMLXsS6EheG3NIZWJ2tPuibLCVttOtLaXGT/skPjqIo1e6c3Kmv
	K47A=
X-Gm-Gg: ASbGncvTQ05iXYgFine1uB/U5TbzK0wHP/MkDWyFIORzrenbu7+wPayJmQNPaiXMLwo
	ILcZsczIKacExtCM5bN/VM6vmIrVj6i261koyKIqlcAsmMDdxX8YUFR3Lx2NMbH1kmfFq+bIwkH
	Qi/BQ1c7C/LNbJYNnVF4Z+E6cbADJwJhR310jQ4Dw7etV1AwFbvsZNZFzqQM2Py3SEtodiavgzY
	rNv0IpvewwTRTdl888feOhLblyCp10dpOHCZJ6x8JdOvj8UV/xXDwx1abhY97Kh7kt/faKBz3z4
	PYA9aRjVBAzREv8qPacTecvw
X-Google-Smtp-Source: AGHT+IHY65P+Xz4TNjemyphPqqQ9+ru/mohlrB5vFIKJf/R1MNkDOblIAzwWX9YVxAvz0IWpeGk+4w==
X-Received: by 2002:a17:907:7752:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-abb7091cedcmr752835166b.1.1739787478322;
        Mon, 17 Feb 2025 02:17:58 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:57 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 08/10] pstore: register kmsg into directly mapped zones if available
Date: Mon, 17 Feb 2025 12:17:04 +0200
Message-ID: <20250217101706.2104498-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If dmapped zones are available, register the log buffer into one zone.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 fs/pstore/platform.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 32448d9dd316..9a5c1d6d5031 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -452,11 +452,22 @@ static void pstore_register_kmsg(void)
 	kmsg_dump_register(&pstore_dumper);
 }
 
+static int pstore_register_kmsg_dmapped(void)
+{
+	return pstore_register_core_area("dmesg", log_buf_addr_get(),
+					 log_buf_len_get());
+}
+
 static void pstore_unregister_kmsg(void)
 {
 	kmsg_dump_unregister(&pstore_dumper);
 }
 
+static int pstore_unregister_kmsg_dmapped(void)
+{
+	return pstore_unregister_core_area("dmesg", log_buf_addr_get(),
+					   log_buf_len_get());
+}
 #ifdef CONFIG_PSTORE_CONSOLE
 static void pstore_console_write(struct console *con, const char *s, unsigned c)
 {
@@ -582,6 +593,9 @@ int pstore_register(struct pstore_info *psi)
 		pstore_dumper.max_reason = psinfo->max_reason;
 		pstore_register_kmsg();
 	}
+	if (psi->flags & PSTORE_FLAGS_DMAPPED)
+		if (pstore_register_kmsg_dmapped())
+			pr_warn("Registering kmsg as dmapped failed.\n");
 	if (psi->flags & PSTORE_FLAGS_CONSOLE)
 		pstore_register_console();
 	if (psi->flags & PSTORE_FLAGS_FTRACE)
@@ -628,6 +642,8 @@ void pstore_unregister(struct pstore_info *psi)
 		pstore_unregister_console();
 	if (psi->flags & PSTORE_FLAGS_DMESG)
 		pstore_unregister_kmsg();
+	if (psi->flags & PSTORE_FLAGS_DMAPPED)
+		pstore_unregister_kmsg_dmapped();
 
 	/* Stop timer and make sure all work has finished. */
 	del_timer_sync(&pstore_timer);
-- 
2.43.0


