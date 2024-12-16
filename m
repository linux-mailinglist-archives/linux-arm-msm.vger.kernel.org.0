Return-Path: <linux-arm-msm+bounces-42308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 414C39F2BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829051884897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAAA1FF7BC;
	Mon, 16 Dec 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhEmDeVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4C200116
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337657; cv=none; b=P2sq6lqWS3p5+0iYYKqgFR4SR6PYHvuQz3O3u42MoDF9UY02WdoORFi7SZxeZgkyeSGRXvWUBm8N+Y8SEU36plsp05DpEU2xAgeExg5WNkmDEGcAv+tqJu8hQxahlICL0a6aYFARFwCjK1/sMmgo9btNAIkUdjwULjEosOY3E/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337657; c=relaxed/simple;
	bh=yl0V5Ivn93jx2EQt5ftkkxVs5AyWzNRaoZkPTxOHYqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ0oO8otk+VzQ+0TvVDkLq0LRuOBHzwa736Chu7YjDc44NKnemxgfHEp3Um4n/gON+YkprhTC2eMzSrjQqlk624aAu6Mpim0Wxfv3VICalA49qBb3MeCl83SpXhSEkShec7h/K1bOknUSWZxFkctk0bjxSgmKUHl1SGc8uodp0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhEmDeVZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-300479ca5c6so37605491fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337654; x=1734942454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
        b=VhEmDeVZkNTpwocFB522FtYjS5sqr+SfKqgbvFXo9Szlu5RmydX0DnzVqEWV9roCtO
         K8xUZ1eczToopBrGkolC6gctSTwsotNR1wk9fl889PUT7y1jLWS1YSFean0QHBsYBYxV
         vf87uekvL++EA7TY6rx4fYwsyHsyhichGfuGRe9zXkr+wKPPZUTjNIhDTgWbzKaUIzwV
         bJ6cN9zWQZPNzv5UQS5mnXT6WiK9XxJqacqZxnATKJ9l2OaYiikB/3FGRSc/jPeisCX9
         rovjQpGvs3tY/mEDKTf9AjhEgT9WuVozxxJSZqmpRnVZr3Ooiz7CF57hprXEZehH7MBM
         Ueew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337654; x=1734942454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
        b=WbWbncGUbxvH61g9pN9O6VRuMA0nvrt5FPxqnoGCPTB7eMVdbVkiL8JMEDWunQOYK0
         b7Yp6KIJG+FRVLmpLA9sXN3yP/rjxQRFdobIgwg/I0bEBgp/1pKM5bM0EafaBuYBqBuN
         2MD+naZ1L6bVXj7/MgtpHZQJvrpRDEnrTbe++Ogwa2kcgk4rQx8B0BhTCbhgxfKAB2nH
         zknVrY2jtul/df7Bs74yGTUphnziVFkI1+1tp6ISM9pg00mn8dZNSNKuykHxYg0ySNZW
         cMDpbuwzB5mwnfrK7b4nQ/VK/nuTvJt4A6DiVsBXGUFDSxXAcmT9DW8CxvHlC6A7/XYO
         8hCA==
X-Forwarded-Encrypted: i=1; AJvYcCU653aiai9jvTmwRUxWK0obxOYCSiGYY60mzPJTUuU6/sZ7zEqe+9bThj2VJ85++9CjkkKBXEpNsq3oygEF@vger.kernel.org
X-Gm-Message-State: AOJu0YyuK+OP/IgSB3yHgNDm1pqoM8C0SJkZupZYiLa5vidE8Cu7n8Gq
	6HFCvdZuKucGB9HepgSv1DTcOjHq27kDiTLuNdisja49LpSGM457T6dWQgoGWaoO+YdFzeZp8M2
	B
X-Gm-Gg: ASbGncvWGivZYT8R3rFc/I5EpOsCOauE1O1yzfli0365Ope5/S/A1VXPVqeG7NOplD6
	BTvrqim8R6KoSgxOP3XXkn5IgbyiJbEbgKAVVpZjjl4CCU19Li8SOP0JYvGUK3cF2zjH0A0gqoK
	3J85o5anuTSHaTtq+KEBuugVdUbCMqjGrtaR4zmeM46sTzkw4Mbhnwi+E9t3loRA9umk4khX3tg
	QfRh/+pAn1Yer9m1kVA754y1TN7l/mLBHZsSa9gEx/r35Fzw/4RWLcMGovbUAyQ
X-Google-Smtp-Source: AGHT+IEjxE5JIr4I0Nm0OK3tkP2CuqAphMvXWSvP6WKojU0Rmwh9ouZ5/B23d8RiNZkCJxKI3XPBFQ==
X-Received: by 2002:a2e:a99e:0:b0:302:25ef:813e with SMTP id 38308e7fff4ca-302544cd566mr44359121fa.32.1734337653638;
        Mon, 16 Dec 2024 00:27:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:24 +0200
Subject: [PATCH 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-3-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yl0V5Ivn93jx2EQt5ftkkxVs5AyWzNRaoZkPTxOHYqg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsNa4mfff9jlJCLVtKJCVNAAOA4sqhGhdPP
 ZRfeHjaZJ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1R5xCACE0lAdnhvMx22yf+S5fY20DT3I1EtoBvnhHEJOC1FXew7rU/BZ53+LAzPkmEs3vZdnDNY
 kwdwQoGw0qrXMIHK2qbwCAZSSut3s25QfWa7Cd3b29i24/nLx0pptqs1uonxBtwyBQhDUKoF06c
 PEGk/tCs1wYqbPLvR+IDrWg6zK0OGSv9BQjZlQXRM6xBclFYVdXT/3j1tQbBS2HGjGYguN3wjRd
 3c1jGeTe1y7RxmNPL2e4hVHgCvixm/CewFJlsh44yx2hI2WgEb7iQfukYQHmACnAa7K6v2oiMO0
 WpfYKq+iVxIFsQE+pz4M0gvGMdsRFyoYjiJyxTp5ZWIdmUUz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..e8916ae826a6daf30eb08de53521dae89c07636c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5


