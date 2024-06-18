Return-Path: <linux-arm-msm+bounces-23099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBC90D784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 17:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1D0FB35CEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9204315B0F2;
	Tue, 18 Jun 2024 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0iOTl0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD9315ADA5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721751; cv=none; b=GqvKtjyLo1q1DLUDiyYdzUe3eBHqChAuirRhtXE5TeEJrzO5Oz46uFxMz84snWUj2XvbKkk33/E2Dm85Hfrdb2lXgbGtBwdcG3NaoKzRKNCdHGOfANSy6wP57JeSyrzzr0EI26pAVPcAV1gBNgPc5/UH3ZodhchkjoJn5tz8+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721751; c=relaxed/simple;
	bh=WWxKwf/arpUungYPOcs5Jw+SlcDPaH/hTG9JTBj39dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TeiM1y/Fz53qBL108W3Bd7pGu1By4IAh3ON54kA57tN6TR/MVq1ejDuSEIfh2QFPvXwO+Xrs8uVVEJhQIWDBzSrD1AkL5mjeXJY4yL/ZaS1wHHFCDeF5TRJgzudHHEGAd5tLXDpBqIi5nWEeqnJQ6ASws9y0b9X02vrYsjrVOag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0iOTl0e; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so65595921fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721747; x=1719326547; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRrjGPDAQCR13Q8F1953shfkW5IRb02NqVysm3ok23Q=;
        b=r0iOTl0efb/8y9vnaZbNwqWyGy31h/kUe0hn1YMzOI6P6h1tn5hQsrzBr08rCZoto7
         kqU4YyTJUY9IA06qXM+HUe1Cn+UGL9L2ogDy8lLhZMxh8VdGSJ1tXjPCX8Ec4NY69ZX7
         FP/OuSKMXLsva27owzG2uFNsISmSozVrzgwotUjec3UlOUXHO1LBRqYVnx3B84xG/NFB
         4yyTCbAL6yYoNFL78WksPmAexJxZBJTk+q2jkYqrTEPm+q3SRqyBDZvyu1sUcrm6yKfm
         /D20zdMCVL9BjuYq6NMpKIHpOzUJJ0uu1+vWi2ZKtz7J2BZ7QX92vdnx86R4B9HMghcP
         ABtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721747; x=1719326547;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRrjGPDAQCR13Q8F1953shfkW5IRb02NqVysm3ok23Q=;
        b=GT40RgG4VJDXwQakpbUpI/76lKHBGwmBBU3rocIUemmqYeppH8WkheAi/SB97qAVQa
         03/4RBeqtCa02z2X3n5ZkcNO14t+n+QCo90Y2ozknygA0cxyXrROyfq9pdxRpf5fjgxN
         J6qeU3yRBpVuxHfWFzokvQ1Tp+HO7SH19LjuwSzsNOAlvKh45ad8R9pHInuLOR/wJWbH
         aN4Ggmwyd2EngjwHL0fizpOuuS6wT/v5UHKAiSS7QLu7Ty7FyYMLr75wSFS2gZoivddH
         jniZxxtfFzcvK1OnnoeNw0HQHXa35fm1i7wv/YHiNAJ3S3nKUIA0qRqe+uKKMfK88E4s
         gFvw==
X-Gm-Message-State: AOJu0YzqSUbzdPQoFtnNJilVZcqP0/OeiLgGEsc464npLYlUVEPbyCtv
	xMYzGL7gk06kwiY2Ry4sUbiDX67FZ0/Id6iz1oy9BV/mPQCTyqaQguEU+78SxcQ=
X-Google-Smtp-Source: AGHT+IH7o/2iW8adDQ1VcHtsTbecxJYYHAumInUcxMuFH9tZghs6xo247QAp1+jv1PlSXADfOnLe8A==
X-Received: by 2002:a05:6512:1056:b0:52c:ba7d:f032 with SMTP id 2adb3069b0e04-52cba7df104mr6159501e87.16.1718721747492;
        Tue, 18 Jun 2024 07:42:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cc477f19bsm263673e87.224.2024.06.18.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 07:42:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Jun 2024 16:42:18 +0200
Subject: [PATCH] interconnect: qcom: qcm2290: Fix mas_snoc_bimc RPM master
 ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-topic-2290_icc_2-v1-1-64446888a133@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMmccWYC/x2MQQqAIBAAvxJ7TtiWqOwrESK61V4yNCIQ/54Ec
 5nDTIbEUTjB3GSI/EiScFbp2gbcYc+dlfjqQEg9Dt2k7nCJU0QajThnSE3e6sqIjBZqdkXe5P2
 Xy1rKBxhALthiAAAA
To: Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

The value was wrong, resulting in misprogramming of the hardware.
Fix it.

Fixes: 1a14b1ac3935 ("interconnect: qcom: Add QCM2290 driver support")
Reported-by: Stephan Gerhold <stephan@gerhold.net>
Closes: https://lore.kernel.org/linux-arm-msm/ZgMs_xZVzWH5uK-v@gerhold.net/
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/qcm2290.c b/drivers/interconnect/qcom/qcm2290.c
index ba4cc08684d6..ccbdc6202c07 100644
--- a/drivers/interconnect/qcom/qcm2290.c
+++ b/drivers/interconnect/qcom/qcm2290.c
@@ -166,7 +166,7 @@ static struct qcom_icc_node mas_snoc_bimc = {
 	.qos.ap_owned = true,
 	.qos.qos_port = 6,
 	.qos.qos_mode = NOC_QOS_MODE_BYPASS,
-	.mas_rpm_id = 164,
+	.mas_rpm_id = 3,
 	.slv_rpm_id = -1,
 	.num_links = ARRAY_SIZE(mas_snoc_bimc_links),
 	.links = mas_snoc_bimc_links,

---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240618-topic-2290_icc_2-8da9da970e0a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


