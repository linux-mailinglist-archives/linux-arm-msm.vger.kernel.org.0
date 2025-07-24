Return-Path: <linux-arm-msm+bounces-66558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764FB10C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3FD35A6717
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA622E5414;
	Thu, 24 Jul 2025 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o06eEJlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A92E2F04
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365393; cv=none; b=F8pFWCOBUw0d1Z7U6hfxQlpAElGMNDFelv9earjYiw0auMwCib1gkCugt0W/7Lof3c6GRAHDi86Wa94nktrkkTNxg+JlLVAlJ6eTlFsQEXEBvsRttQFGSzdminpIntsksvwVPWmgBSACwoWn59a6Z82BKlidCNhUFUjdCVSiUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365393; c=relaxed/simple;
	bh=MqHhOcNuXJ5oZB2p2GySncf4wGrMH13kPtoLfjjbjDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eo5NhSxmNXlsxNmPEb/w5XUEJZ8N1+mEcmCihpTbw0A5oU9ihh1M85ybEXsx68DJCOy0tOKsvKvPOM+4NqhfvAHgvagLQcX/H3VNJLVECk+92QGy4YpqYnJpoeIbWc4+8fpZGiKec0g/bTAVkqhk3JkjReP0I75pqAM6f69UcLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o06eEJlu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561ca74829so10971345e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365388; x=1753970188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/nDqiXo0oPmiwRgkXmDbqPxo4RR6UizLNSv2BWaLmE=;
        b=o06eEJluMpAq6dy3fOCgn7NAaSzuSdLBhZBZaMD6U2xLGIldpXohgymHLeLK9+xWTN
         9+x0DVM9KcOW0fY4UPa1AaD5nV7oIzwVpF86Ej2cHoXm1zIYpl5+rvdOgT3Nwm//QP27
         byvBAXdS/Fi5AYtUoXybNwolzf07pLMWW2vPPD0u5s2YcKeuBP0MFfJcWjzmtYUZSWbZ
         m7kL2edMOTv0Q7FZaKNHgT8kD4xvBPzICoJsgGAxesIxE7W+mMeflzXYeWut6unLzIP9
         NnwKtQwIthA7zFhcSIuGq9GPzo7rCpXXzNpyZyLhxNRncTKJhsKt2uydcdTkW4BEbf9W
         bZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365388; x=1753970188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/nDqiXo0oPmiwRgkXmDbqPxo4RR6UizLNSv2BWaLmE=;
        b=h9sF/mzh3Tf3ALjN5/NN5B5D7bcstxSsfUWeMpBK9rxHYonvJ6NmlTriqU/wx3ial+
         P2gVJQ2s+F3GbzFgIgNAzaSSTQUeQFcIE6B9ZRg0pKB0CHNTXV2FmN3uFt8ZCiVnxheT
         hzF0oml0BVsQC1FuMLVqL9KUt/GW5AeKvgiHoloXNLEK+Nm4GDMSxcqEILvkjZnRiVSZ
         D/WyLFWZ0On4r+fchFrCYGGbxo+S9h9Eni+3UOngN+pnO/hQlBgQFOq35iU+gXQt9iCQ
         bQixe2cFEJpuw3JGkGChwURn7qifke+rbza46jrV8MjOJAc0Be1TklnpsDeKKhgoXZ63
         S7OA==
X-Forwarded-Encrypted: i=1; AJvYcCXaCP+i29k9JgoDZ3EsRWXbZG1G471PvpNQgcU8oh4zorv71ZST4K20K9QqbwbVblOzqKJCi8pp+SYIFURQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5VxqV8VrldOwfkCJyRLYuHt61SQpYr9ciRyjmbEd9ZAyxi4s
	PPisl0hE1YOHlEOby1wdCwdItFIM0oD5Q4t9MqmsNCxHgw5pi9DlkJWr1U5c3rTeb94=
X-Gm-Gg: ASbGncvIZZhhitOD5mQ0na+Xt9bQ1wLQfga4mfsJls+xkSqBxTDLljOsAmJElxES2L6
	s3+Ul5DL/Zu5zhRJpHedg+6PthOYzOzNeodSvN57N2KFmJc+Tky8hyQO4d4FnvNdZOliXbHttwg
	e1wCB0dcjkInnJ7h4rxbVj5xDBzOEHjqA8/swLoQ4pM10Ri4m4+2FiYWXi8yvIOA+sIlwDwAneO
	NuHybKBAmMHrzPKhJYioSWOF0oADTICew1LG3wOXYSAADR9zV5U6l559EAq9J53p9LS/RQZopjD
	xnN1dUs44hC7DlwtCtRwS5rMkUcvK/+Plk726d6tUxkdD4ixkrSML09dcwiKp1N/f+BMyq9VySr
	MjCxpQQWHzQWNC5H2eMNYfTz/vFzUTHScVnEl7umbZGlSuAor0NNBR/7oxpQn5ufn4q6a9HB765
	C/9idajze2zKRL
X-Google-Smtp-Source: AGHT+IFsfIJWNObH04glJtR4VMihBKDX2X1KMe4027IfQD5dai+xqhfpETfw7nG5oExxx5Qg+IUmng==
X-Received: by 2002:a05:600c:8719:b0:456:2ce8:b341 with SMTP id 5b1f17b1804b1-45868d47860mr71077715e9.17.1753365388431;
        Thu, 24 Jul 2025 06:56:28 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:28 -0700 (PDT)
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
Subject: [RFC][PATCH v2 07/29] init/version: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:50 +0300
Message-ID: <20250724135512.518487-8-eugen.hristev@linaro.org>
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

Annotate vital static information into kmemdump:
 - init_uts_ns
 - linux_banner

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 init/version.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..f5910c027948 100644
--- a/init/version.c
+++ b/init/version.c
@@ -16,6 +16,7 @@
 #include <linux/uts.h>
 #include <linux/utsname.h>
 #include <linux/proc_ns.h>
+#include <linux/kmemdump.h>
 
 static int __init early_hostname(char *arg)
 {
@@ -51,4 +52,7 @@ const char linux_banner[] __weak;
 
 #include "version-timestamp.c"
 
+KMEMDUMP_VAR_CORE(init_uts_ns, sizeof(init_uts_ns));
+KMEMDUMP_VAR_CORE(linux_banner, sizeof(linux_banner));
+
 EXPORT_SYMBOL_GPL(init_uts_ns);
-- 
2.43.0


