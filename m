Return-Path: <linux-arm-msm+bounces-48186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A4A37FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA03188D295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B83C218EAB;
	Mon, 17 Feb 2025 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsEMpFNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55843218AC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787480; cv=none; b=ZEoEN2MNTUlBVwvv/m7p43NwgFkZYL/xVkvG28YCDPn48zDMyBuq7AynEaQ6kvfSYM3xrxCyYC3+BraTmPKR4BQ6PbyPfnw1zoekPeAH6/dDq7SZ0NDQoxVqxlHHkvwgiAOUpC5JEf+vPNql8iBKM0bZPyu4XmEg+UMedF0oeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787480; c=relaxed/simple;
	bh=61J2pu5l3ndGn9woBnkjvneIE/RD9R+0X2yrx5ajIWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPTEsYOs1hWLSjWznf6D9Wdiu3/uC8R18/uOQOpV9L+BLLHdMvNKjdzcZEui39+cGODHyPwFnNZSPDOXNG6g6Q1dUb1kTwHuV7316Ism28V6gtq1Y+z2SJhEKWuBtd6kdP1sr9ffZ6kNAFekRNNckSgzQaqZ7CFGkzyUOIponU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsEMpFNt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb79af88afso297716466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787477; x=1740392277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldGwrx2cT3RoWK8xQPpncYSf7C74wmzaVDctYgnNzT8=;
        b=ZsEMpFNtgC8tqQQhhiNG9KGHmENdgB4rAu9TzSfsY1MSvj3kXgq+zR+OVmeyE23lfY
         hIOT3cC2fIbGcc3Hzbf1dVsmey8oQxNt9XMXlNncyUSDe1Rvj2UouxOZ4iGlTzGRBfoC
         pZksizHBgwUvweaz535oIlBw/CTWRn9nfeek0P3NytAJ/ck1PqSOG75pFOD7fYRIh3gG
         O6nwqs5eEGWqJfIuGCDSIw9uRuAMXV92lTqoOVNC9s8i3VuzuxUFB+lS3gs5+9o1ecq/
         Leib4/k/6UMbNc6yq9iTHWf3RDatAVe5pYDPb+fGwOIwr77wjdmuRPqiVrJlBvBC5gUk
         uP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787477; x=1740392277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGwrx2cT3RoWK8xQPpncYSf7C74wmzaVDctYgnNzT8=;
        b=XkZK6E+crbOhhWBD2X9cNDc0tj2Bt8m8CFOZ7sYGk1hBgD7L0bjJIh3/6zbcD8AXz9
         vbqZdhYJ5owc3Abu+bZH+PMxNqrmwBOcIPpbUQJYtzjeKRKUpVCigAUWYTKjiAY2D4h8
         q7glDIfHYkvNWGAAtC50M716v3IjVoA18BMA7hlEhb5J022wgLT7zzTg2XgxXCMEmgSr
         S2ADofo8Fwrr4vwpIvj7zhpfOvG7JR4ATHn4wfgCJlxvT+GOBxNh+AE+ntR59AbOeXng
         guLA6/YoY6EHsi9+wM4nTuAbhEka6HE3J59kT2rtZ7ubGpfRRGT2dtM4A4xAEm8a7J6j
         FeBg==
X-Gm-Message-State: AOJu0YwZWfiTZbb8gEEYWwmp009fyk4cxe2BTZKGbZSYl9QUapp5d5JJ
	H7GAV7NJOsrY80qXOaY3LiugrSLkbEZemuT04SRA+zvnv4/YKYYw9LvcPU4hgAFTO9U6DAawIdm
	UMxk=
X-Gm-Gg: ASbGncv476KZln3z4gevf1WSsjag/mtkBxRVflgKlOOd/NGIu5xA+20mXrzmpe9HW0S
	K+Jghylw5bMt+z1X6SyXi0dWxxubHZlrBZ/Ozw7Ul4Ydhq3DvI261A3ARrQD/ZRc8Atrf4qZrxu
	DacLkOdWdyOCgldm6ugmRNvDQ+77mHrXPcbO+xnJhPd45pu/21clWQgjHbZLJDXNo7KK81B5ZhT
	83Jk9YgIb722u/V5QwXBd6cLglY019el8Ea0chlQLI1BRVbpGjLVj0iiPbdbAa6pd8LVfzGmm0n
	40ljjg3+26+YJY9rVZ+uB7wx
X-Google-Smtp-Source: AGHT+IGLJ6wBq1Q2Otx2cXUsLqwI686ZT/K4uXqflhPHhYRM3ByDKMZpdTFQUXVBYhqRHLkwN7a7fQ==
X-Received: by 2002:a17:907:78b:b0:ab7:c115:68fd with SMTP id a640c23a62f3a-abb70e61a23mr916824766b.53.1739787476706;
        Mon, 17 Feb 2025 02:17:56 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:56 -0800 (PST)
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
Subject: [RFC][PATCH 07/10] printk: export symbols for buffer address and length functions
Date: Mon, 17 Feb 2025 12:17:03 +0200
Message-ID: <20250217101706.2104498-8-eugen.hristev@linaro.org>
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

log_buf_addr_get() and log_buf_len_get() can be reused in another module,
export the symbols.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 07668433644b..022947f9b61d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -588,12 +588,14 @@ char *log_buf_addr_get(void)
 {
 	return log_buf;
 }
+EXPORT_SYMBOL_GPL(log_buf_addr_get);
 
 /* Return log buffer size */
 u32 log_buf_len_get(void)
 {
 	return log_buf_len;
 }
+EXPORT_SYMBOL_GPL(log_buf_len_get);
 
 /*
  * Define how much of the log buffer we could take at maximum. The value
-- 
2.43.0


