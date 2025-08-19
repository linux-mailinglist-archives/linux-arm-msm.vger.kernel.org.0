Return-Path: <linux-arm-msm+bounces-69735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA8B2BFE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417055E838E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7933B326D53;
	Tue, 19 Aug 2025 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgNIohIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83398322777
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601705; cv=none; b=pEqv5PWav6+oMpklaq3hmcvF4op7Tz+Q9QjUn0X96a+LtE/2FUjm0Ub8YFE2TCqCAj/kmKt8grnE/HcVgXGlPDJtpFhA7fPTsquE/ndJmo7o0u6rrQ8J2eY6f8o2GygLN/i7Lc9Ik16hYAJHMlWzfpB3SxUOMw7RogrNPO9ia+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601705; c=relaxed/simple;
	bh=FDAp9yWzU6h2a01wyYHSgRU7k3MWfcA551Cze90JEG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDfyZrAEzXWxy2S9O6Rbp/qyM3M09/6+5zwcCsTf2Wo9du9bBKWD2KUYCOa3y+9iP6ZGZJjaRWiXe5EcbdzKCchtXMBchL2m9Jtxgk9ytMo8K4zm26KLLTNgGEE4RDFm58Q64w2e0ZLJum40Jfwj0Px+zhEiwA9hhfjzCKN0w+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgNIohIh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb79f659aso777249266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601702; x=1756206502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqqWuSSSaSs4/5B548uIsqcez7udu8s/zMuVb9X/jRU=;
        b=xgNIohIh+9ndLl+Wl3N64y7YH3Y3/TbI6SrWuwMwHho3k1uclPbHPkdkgYXlY07cx4
         aVj81yWjAvTcHifWJhiCuwG+pOIrvKqJlGafSTHGNQ+QMUcDkplpkA4aWViStPOphzxc
         tbgmkM4Lj76BXLd1qfmcFLD36Wa+dB7vc7/mBc+Kep4vnnl+u9pCEPn+c46aggRcKYbp
         vAil5mOJ+bURC4uL6ke2DasKa8YTwLpTa6shm+8g6HxvihtpESUNlHy8ZZ3rl84sfL/Y
         dMcIg+29Z4Gu0oV2/PjqEx67ZSaG4WA/jTHrpO/0j4RcyqIxYE8AqsRxrfB8BsTcECFA
         6ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601702; x=1756206502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqqWuSSSaSs4/5B548uIsqcez7udu8s/zMuVb9X/jRU=;
        b=w0GMmv6YlTs4b9ZZhtKcQ4+913snA4cyO1hjSmObjSfKN6DC1kOmEO1EV8eronFo6r
         2wqdsY+xvcQ7FOEkhVjsf6DsPdGDMQVt0rbHbY8oSa3GhLKVuyn/DqN6bN6OfB3TkjIY
         GkeuwjoItMsN+2Cz+IBn5cjVOaUt8k+H/qlHOWnRQWoYfp+qhYkWPbnlu3S1sfZzsopi
         TI+6KZYFXpYmYhoazjIeWT58/iDYTPUyGALz2JEo9Hlbzj1LLLtoI2FD0QAxoINDPqBk
         z9LyOUaoFlx7ltYDaQ0Z54mozkHN8qnAOi1CP3pMHSyqZIeUVSsN52OM4DK7e2i5sPNC
         dyjg==
X-Forwarded-Encrypted: i=1; AJvYcCXuUJqIAwEwkT4ikXe0iAT/hvd5nun2hINKt3+d8Y2TdjdIQ+InRSzZIvpT2T+FrNzHn2Hb9radCGt1ho6O@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpR0u0I2x7Te/tQ6cWpVo7jtRk78oWIbfHOBUZOqPTB71z6pA
	fnz9CBgwXkjGGXXSMg+fs3toKUGNoYBlikpX5ibdPOhNxNsdpNoF/+KenigGZekBMyQ=
X-Gm-Gg: ASbGncsNbIA1XKZvVKmgUYQh9fEjr3H3pwXjBvFi+4k7L1zmm48MS0GOTjZaP94/qEc
	26fDVqoM9tiqhKDmnNCO5y3QxMKPOa6AmL0eRgcwDnDUfoq25pww31CGIiudkpb5xcZcXjKlBbI
	6qR1V3Eq8hrvvngxqTN/z7haDkA2XOF/2P/8Ggo4qtUbspVrYYtUBg+z7aLUeBVWTWvzs77nQNi
	MJldJ0lEuczw3qGVxHkUJNq9HUqczRt3i7BosO4Kn5egfyvpXtKpzQ9nO0qV8mESW3uozEoj+HZ
	EWrW2iwjoMSaLhtK/XjAovvsP2iqKpkQ5518eALrbVR+mSw2mZF6jOxgil+JebhxHAw9yTy8Xvf
	QlrH1IFVrOT1MYVanC8ps4vVEdr+vx7tb/hodpN7Uw4ePT73n
X-Google-Smtp-Source: AGHT+IEu47SOpD2q0+bOP6DYIa6GuWe1e9d5W3TXltO+50fVmPfaG/a5eVbK0rgp24zmwdwtvRU6Hg==
X-Received: by 2002:a17:907:3e10:b0:afd:d9e4:51e9 with SMTP id a640c23a62f3a-afddd24e9d1mr167513266b.65.1755601701738;
        Tue, 19 Aug 2025 04:08:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 13:08:02 +0200
Subject: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

enable_irq() and disable_irq() are reference counted, so we must make sure
that each enable_irq() is always paired with a single disable_irq(). If we
call disable_irq() twice followed by just a single enable_irq(), the IRQ
will remain disabled forever.

For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
will end up being called twice, because disable_irq() also happens in
qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().

Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
sense to have the rollback handled always by qcom_q6v5_unprepare().

Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 4ee5e67a9f03f5f766f04396b9a3e45f77293764..769c6d6d6a731672eca9f960b05c68f6d4d77af2 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -156,9 +156,6 @@ int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout)
 	int ret;
 
 	ret = wait_for_completion_timeout(&q6v5->start_done, timeout);
-	if (!ret)
-		disable_irq(q6v5->handover_irq);
-
 	return !ret ? -ETIMEDOUT : 0;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);

-- 
2.50.1


