Return-Path: <linux-arm-msm+bounces-66576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF6B10C99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34B1563EA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA822EBB9C;
	Thu, 24 Jul 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpN1qSTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5B2EAB66
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365410; cv=none; b=R+83KmKtW2D4svl7Lwl40OAIalnXdqxg+XThoeP/WIi4IUKF8k9tazHTOujRjAeFz1yjrZhiyHe4rKokMLbMstzjoZgKVsyW17tr3S2yNUItsAjwnEkzQBlfh7DJxB7vkEaLROw+ojDd+H7lrBiIg7/1hu0jzdBzT9o9A/VbAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365410; c=relaxed/simple;
	bh=DC8BX+UCsCDL0s+QjMq45E4j2zLW64ooBSHspomP5gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW41hI0tNkKBz8pyyL+mDymAmj9HM2OBJyPAeMXIZA8rLNiCNJy7Ub9WyLR+P1FJ1SmIcU40YtLTIud9BtKhNtgxT70yclsh8Fe++f33QhyJWGj1+IZwAzJUef5DfVj4O2EL6D4XBcv3+2jXqgYI7qTX+aynuxkT4o/X1a0uQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpN1qSTE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1132141f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365405; x=1753970205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAPeYZVy8llrcCGwu3MIGe2nhyxNrtHRlXTr72itWZc=;
        b=bpN1qSTE5qttk/lJ/GnHbd0ERBi37+C3fAMBhgPXYw+BVR/WyOg0llV5z/0JJ7K2sm
         bDTGWXiQz/1Y6EShBsHND4rx8+2J9ALqjcHQvZA9S8raNMW9NIGuUxAR45E8oD5KIj3k
         MMeACj8mR3w8DdB1YvvhdJf0G1TcovVBN41fR8+CdmgJDlu7U4BinEBWL2j6PfzZmR1R
         WhGUVRXll9Qk0QS+28daFSbHOaE3DdEp/1s9q5S2tmvIzjk+efVkVWvH7AQ7oukiDmiM
         t3AyKk1j4j7YI6a84OnDQdFVn+XSH2YYYTVUJfV2hAAjoDwVPKh8P+A5rJcLcChPYEtp
         Z8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365405; x=1753970205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAPeYZVy8llrcCGwu3MIGe2nhyxNrtHRlXTr72itWZc=;
        b=NoyDf8c+XatAC9xS3ky9K4h7HqIOKCq+PMgsAOhrbRr5KDVGhKHW7Kxq6SYxfsxKYK
         ZfACe+xCZAdR3ce7r50fSknGnhIqRAT2RuO7D9VEn/bznQgIaijwWGdSB8NGC5yuGpcU
         sWa4oVSXgm20QxNKd97X7jXRABVmdjOXqcGacc6oOeFofvszz6UP3ksuMGp8Hz3vEg+K
         6npwbIgJjGNpq2KU0H4Bt6IOY5VgYTQksBBCqE4PvgAHXHiXP4MyyI9wDI1m2vHFjs/C
         pjcA4VylN1rpv3yTIn+atKEXFnn+R0/V01g+Zn+ZlL1t97axHNmIoMUR11oL+ZTk2lnx
         gReA==
X-Forwarded-Encrypted: i=1; AJvYcCVv0xnM3vTfwjrCx5155EW78zHySTZACGZZt0X9iPWmbqS1EE+FpaXD3yg1cTDTw9shYKIAMo66A5PcEOn9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/78M2Aq+SmQB1PvsN3B5j4D+1DlQuQI7ALSBbYQI2Bg+fKboI
	E/VNc5ZpauIamEAEe3JrRgL9AjI0FAfDvBRHoEhQd1YcvGzdV+JRaVssB1EH0GSM/p0=
X-Gm-Gg: ASbGncscxHGWs8fzkaDHUL3mcPdNJ1JbyqncPtq0S+RVO7CDDsAE1lCJIwwGbBpyi1Y
	gj1Kidaphg7hQrn8gi4mTOOONPslAS8BM37WjgrIj+lEzKnliq4N/iwabcFOj4AeJaapN+MCodB
	v/62M6Iz2X9c+A3so6GJY+lUw8e/SAoZnYw+O/s5oIaiNGwoOMjEtqOWPFg1HfNGl1RXNqj7leI
	QbRbp57Qn6zFB1t7wsKN6OZn6GCGCD7Xmksiqz2jOMiPfKUWpR0KGZQ2D1zu1Tn+FRfDg31Uqhb
	Uf4gejRVq4qQ/PxMVf/dcpCzT9bc0b0lrWHk11TuOCUnnC0Uk6HPw+1vUhenVHkMSzO47o7tQF1
	QRp5l4iTUwpt3HfDBDcfc3dku74Da84b44uO/LoT6Q5AzKBfjpg3mg2JRMnXM9rOvupzdTnpjwK
	E0hoTVjTnPZVip
X-Google-Smtp-Source: AGHT+IE/tOxCaZJgBIx1z77DRVJHCm2c/RVz26viacIOb6VPqsOvedK5J5brFqoj/rS9r4t912qyvQ==
X-Received: by 2002:a05:6000:2482:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3b771356cacmr1929316f8f.17.1753365404772;
        Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:44 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 25/29] kmemdump: Add additional symbols to the coreimage
Date: Thu, 24 Jul 2025 16:55:08 +0300
Message-ID: <20250724135512.518487-26-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional symbols which are required by specific platforms
firmware for dumping an image.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/kmemdump.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
index 7933915c2c78..94493297d643 100644
--- a/include/linux/kmemdump.h
+++ b/include/linux/kmemdump.h
@@ -35,6 +35,22 @@ enum kmemdump_uid {
 	KMEMDUMP_ID_COREIMAGE_high_memory,
 	KMEMDUMP_ID_COREIMAGE_init_mm,
 	KMEMDUMP_ID_COREIMAGE_init_mm_pgd,
+	KMEMDUMP_ID_COREIMAGE__sinittext,
+	KMEMDUMP_ID_COREIMAGE__einittext,
+	KMEMDUMP_ID_COREIMAGE__end,
+	KMEMDUMP_ID_COREIMAGE__text,
+	KMEMDUMP_ID_COREIMAGE__stext,
+	KMEMDUMP_ID_COREIMAGE__etext,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_offsets,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_names,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_table,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_token_index,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_markers,
+	KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names,
+	KMEMDUMP_ID_COREIMAGE_swapper_pg_dir,
+	KMEMDUMP_ID_COREIMAGE_init_uts_ns_name,
 	KMEMDUMP_ID_USER_START,
 	KMEMDUMP_ID_USER_END,
 	KMEMDUMP_ID_NO_ID,
-- 
2.43.0


