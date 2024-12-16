Return-Path: <linux-arm-msm+bounces-42311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E100B9F2BE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 886C018846C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C71320124E;
	Mon, 16 Dec 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSzErFPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7530E2010E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734337664; cv=none; b=KQSIea+PmLN/U45+9UeALkutZxJxLQGGCiMz/0u+Zx1xavLYcwzefFzxezqWsyBrTn7/iDuJuK5NgrHVs74rIyQLkhQG28zmR+eNlEpRzyHkQ1fTKxWr2VGHqJmglu0B0i/CstRqnwXm9aVNe3+9TYnJf/rALghBn+oY1NQeGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734337664; c=relaxed/simple;
	bh=3vj4siDBQO7f315YdNktE17SvgKgBr413yqy0N6ohvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5kSIO3KrbgIZWtYiqYuutBJpjyT3d16Punf7d4l7PXpOxaDt/6UQHWCLTB2rL87Jj+Vltk87tzQcU9QRbnlTV/u/PFW1jddsFzbtz8oQeN5Y0/ApNWTnEfQN1m+fAWYG31gG6YM2oOBCUaEStCHtG9XR8NUlnliKRWFLFCHsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSzErFPa; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30039432861so44172211fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337661; x=1734942461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNvaBXD6rf3EQuRmCg70rZ7MEJhSs632gKbKOrH7Zm8=;
        b=eSzErFPaUw8Bfvy3qmfczhU2zl3e1Wn51TVf3WTKNRMgVmHvjiRk4tVariinOCnNfq
         X4jSbqTDIl0YdY74IfgQ1yl1PwM00dnF5Lt5Gl3/XbIjSmT8L0GRohNYSOMeu476SVx6
         seMkSmz4WkGT3B/6qhEk+JOnkfZjsFltEkh4zxecXsNBvQQ/R1FM15SjNZ7rvr9nSbXX
         k475Q9e2KN1A0U6AZNCxOgXZO03IYtxMf9ApiM07QvKlVFCrFLsD/14MmVDoc3pW02ye
         4gP6KG0+8LmoWVy6c1T044XASVytt2CAV8WzXNjEYxtVzOsbXZMjuyNyqPSzQrfNlM9c
         F/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337661; x=1734942461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNvaBXD6rf3EQuRmCg70rZ7MEJhSs632gKbKOrH7Zm8=;
        b=vFreacH6H/Qblb7VvGiqzy8tCTfIR7wWrcD03tzo2jANATUz5GDmGlFyVbZ+QGf5nU
         HN2ESBKtnFtf8q5RxPrOEJXRsT3HQ3Bp72E5NkGYE/YBFdXiBBOBlwFxGvcmK9xo6Qol
         qH2YOdqRybHDa3zYrE8ATE+OT0bX6Sq6DMv6QXG8Zh5vkjasXjX9RTIQ737WdtJN0whu
         +IiPyNM2r/BKJKf+ygiqFGGypofoYCfazfUIcLbl5UacOF0/YNC1FKT2d6rGKOYEZYL8
         YdVKIDT9KJuKPGrRUcx/UujgSQPSN43obxWaFeBTV9x/OadGUVn2L8WIqUbu/JsWWrpV
         ArKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcExCTzoQ5qffAyr2WCodl7guVWSLuOR6K7lPnZOunnOKG+uYW3tD4ry72vIIUO3/iTpB8wFyiGtr8B0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlj0fj3nrBuvQnETuojQdQ/jtohXj3F0t9emArK5kZ1eiL0F6v
	IN/rH3oJ+4BT5Il/xmWV7ihxqcob2F8tmvcoWbJTGFP03NIw5QmTPZe+2kb3APo=
X-Gm-Gg: ASbGncu0vmOQd6GHn0Il9im3jD+pBux4uLCHvSXNbJ+Be2Dh7xnFLJmY52F6v2yci2y
	Jdck03SBTjvb+hXHLL0MTSVTSW3R8ZcV8bwSQMoLxr3GefHd4naZ3swSIDY3bwYlBtNuSeoQ2rz
	s0OsXLNLp4E327RvyXTYEj+7WQZozpJ0uQnIzMFa3hOhCzMocOek9NpOu5YMpkw3fzRQY/r/o8N
	oHSLtNP0CHOQZj6wIXR1BXxQjWORL0Y+O+TtECPlSO9loFzWaRUoR6g9UklhCjY
X-Google-Smtp-Source: AGHT+IFPKDhcXSU0UCTh/igp+MQWxIINBR6P0+8IXDlL++c5r9BUnSmEl0bO6pvB1WZJK4q3wU3VCQ==
X-Received: by 2002:a2e:9d8f:0:b0:302:264e:29dd with SMTP id 38308e7fff4ca-302544d37bamr35796821fa.24.1734337660711;
        Mon, 16 Dec 2024 00:27:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:27 +0200
Subject: [PATCH 6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-6-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3vj4siDBQO7f315YdNktE17SvgKgBr413yqy0N6ohvc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsvFTxBZ9VJCMmml3J0WOzPS0ojzqlE8FEK
 RhPWnm5aU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1QSpB/0RNWf+SOymu2pMymtdPsFsrkyWTVAOo8hqG3wKYgwYnA+cLkN1U3hjojOStIB0O5rx1Ub
 AA6ze5HSaUFrTXAqcbWPuo2MoyojkWNGiTi/E5RTl9aht/VafStHh3jWX2+FqW66sCl9cB6ZJy6
 XoroA0Iw6HouEimgf9nUHuN585Y9Yz4lfv/4ahiOdTXkIvhu2hQsFVu6D/HLu6h7X7RdbNro/wx
 g/sXvGBKaCoTITVZCQw/QPgldCKJbUKocpTNVwgHovUmo7e1vddHIGMqk8HPmvJ35cmEMs7gMA+
 fPoL5pkcF8tX1j+aT7DohRZCLMNyHKiJj0lbiQRxRH/B5pqB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: b94747f7d8c7 ("drm/msm/dpu: add support for SM8650 DPU")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..e187e7b1cef1677261a5de7b01ea3fa8136723ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,

-- 
2.39.5


