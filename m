Return-Path: <linux-arm-msm+bounces-79473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C17C1AF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E991B22AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED0C548EE;
	Wed, 29 Oct 2025 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB6FDNwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B721C5D46
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744816; cv=none; b=TJ6ZEDGTtvb/FXlnvxblJhJ8++GnWZzThwsjZNLgIMkbu1jBq9bn5G7KL3G9k/o0bg5QUF/gFV7REywbaOcv8exJMDWLGu1pAcWSzUSx1Dl6ZI1qS2Mu20mU6NF0kxZPmvCFnG+cfP4jvjjA+ONqi/TNHsTlIPtn5hnRBxi4OZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744816; c=relaxed/simple;
	bh=nsjttZq8PuEoDQMx1bwWfoY1j5ZCVlCBFQu8V8UWH+M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NGrmjVVjNBFutCqHkeoxc6p7Be4lCGYp+hZUSNcILyf0Yr/LfZrycIYm+hgWoxXbczLgt8/jPeA5vEkw3Cyb16dEfHWckjcoEccZq/qOHNouJq1X5z6dcVPzc+AihnVIedMPLz8iRLH205v3abRmGQ2KtJetTGPiHrkpgAFWTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB6FDNwu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475dae5d473so45182845e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761744813; x=1762349613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WF7nqrj2THb4vlhOESgpe7tcZwa84JrbSuJCtvoqqIc=;
        b=JB6FDNwuXCx0TpgMywH0OPZx9zz5uJmQipNj2JloxT2sHFCDAKvfxQP2fTm8wuk2jt
         0dlkrAHs9wEzYQ8dnjyGRAXigIfF0TBJW93o/tui4CcyouUlAokHH1Xr/1Ogs21cj+in
         QzX+ogujvTF330RfPosjmJ8TuRisFQcTrleBUXH3Zrh/uB4VTacrlHeVT1uX2l/TvSeC
         juuaQiP0z6c9nBFWLU6MrVnhzCY1Gk0K+J5V5Fcb49WZLbVvrSFhlNjuMFIRTpFmtzKx
         VsUEoQPJZTfPQLbWS+AEWT+lfuRVv2SuPti3iizrCvv8yVWNYw749MEFNO1/UBB1h8PX
         F0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744813; x=1762349613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WF7nqrj2THb4vlhOESgpe7tcZwa84JrbSuJCtvoqqIc=;
        b=euRw4Nj2V3mvjOPcC3a04bQ8WWAOoV1Jgwy4cEqvSOC8Ko/28SmEDAc5IKuOJBQyQd
         h2u/PoJGHeRqBV/ytuC7Yk5JHoxr1YdooNKRbBj4loqdB0NkYBongnwEV97F+8zTiA7a
         aChs5QRqz9Qb/xG/Oo4Nt+E12xtDsaefY/BtTBIAFEfHrvUuEJ00+DKTJco8ih5bGaHq
         fLJrfvErL1FfVwEi5zrzulrQZXNimMmfUeKfeG+Cy6A7plP6JrOO21aQ6O3VMUtLc5/R
         G00nOg6/kHnHdqYENcXLiu08Ca4/scPOspBNG7yRHrhxvbEB0R8K+eLBa1yz9nsIjg/H
         BvbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWxRnc3GK7mC+lVPyxP68ObD7geExlA5MU2RfHOCqvLFgCNMUk1cIAkR6nfoZNDj8GBy8Q23I0ywRYvfYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvj5QNm5fbiRNAChd2CW+hvx8zqk+6UaYNWV7pGy/OaRQzpHFZ
	EKuqmPk86WiNKRd3C0/M+3Ld89GtQ2hgg0YIra6jSq8njgeacHAaLjpa
X-Gm-Gg: ASbGncvMzOIJIK8tnKg8cXXdtLzaHXWfKd+UH8UIJk2H3/lSjs13Fdo/F8AvvfzfmGh
	+k3bTixlu1hvfgZs7vYr4dib3Fhl8GJT1wO5QW2SLEQQyznSm/KUHD6j1FuLby9uIThrrxnI7oR
	v9eXXsrXHz7GJgr6w6nvHYeM8Y+q4Bgswtc9LFt40WaGG36DxaIZaCUN7Zgq6J1oXlo1btyd2+g
	U6aCvy5iPo29c1Q4Z/N+yzDpReNLQX1S7Cg6uQFKlp1oHyn+HeWpDN37bOTzHeajH8Khgp4r26T
	1D8B8jlmmQSr7Jnd+PqJK8ugngSVhKBbBHLyKq2QngyUHSIc1MlK2ORXav+C/QXphr+iaaVXz4r
	eDKeKQTK5sP+sDeOWf0lVEZLv4oqY7YbcGC1wtHUAbEDkpf1I1SXpNBwN1jwcFlC4ZCPRGRhKmq
	KFcU2zzP365BG0lDdbeUAWW8UPwzvxEg==
X-Google-Smtp-Source: AGHT+IH1wnB+c+Tv3QvNjludDqom86fj/5j7GLlptXYKIF9eMEqcj/69GJzxgHdIDmKX/xBciiwWGw==
X-Received: by 2002:a05:600c:37cd:b0:46e:1fb9:5497 with SMTP id 5b1f17b1804b1-4771e360859mr25948655e9.18.1761744813034;
        Wed, 29 Oct 2025 06:33:33 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4771e387a14sm47955195e9.3.2025.10.29.06.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:33:32 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] err.h: add ERR_PTR_CONST macro
Date: Wed, 29 Oct 2025 14:33:19 +0100
Message-ID: <20251029133323.24565-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ERR_PTR_CONST macro to initialize global variables with error
pointers. This might be useful for specific case where there is a global
variables initialized to an error condition and then later set to the
real handle once probe finish/completes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/err.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/err.h b/include/linux/err.h
index 1d60aa86db53..a38071881b20 100644
--- a/include/linux/err.h
+++ b/include/linux/err.h
@@ -41,6 +41,14 @@ static inline void * __must_check ERR_PTR(long error)
 	return (void *) error;
 }
 
+/**
+ * ERR_PTR_CONST - define a const error pointer.
+ * @error: A negative error code.
+ *
+ * Like ERR_PTR(), but usable to initialize global variables.
+ */
+#define ERR_PTR_CONST(error) ((void *)(error))
+
 /* Return the pointer in the percpu address space. */
 #define ERR_PTR_PCPU(error) ((void __percpu *)(unsigned long)ERR_PTR(error))
 
-- 
2.51.0


