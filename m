Return-Path: <linux-arm-msm+bounces-60102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85EACC0FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A793A1A21
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCE62690CB;
	Tue,  3 Jun 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvH5pLH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C926A1AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934684; cv=none; b=IgfQ+74GIKheVuhWOuBJ3x2gkvVzvMVx74/cEKG3xJzrltBzSFv90Q+2zp3hNs5Sh+qNn3Gt1OZqGD7YSbEtcGkG46xl1XoeUlrRWb2JYMrEOvQLABacIOTRt39GNROwd50KLD49f0qRi+OQ1zLZZWL0Eq+hwBDHV/BSnemjf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934684; c=relaxed/simple;
	bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oqCBJM8PNVAWGTZvboNS5g5wlHguxRC0Lx3QyA4AKQPTIGfOXiturWZ6iQ7q5c2i215yNfnwbf+dpjylD81e/X5CIRMMSDIrR4Bz6507g/d9Nks78TsOn3GQEc0IPt5rG6Lbm807qLQHxXmCMsAQcVGxiwF/msonFInoPpN3sIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvH5pLH1; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso447172b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934682; x=1749539482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=FvH5pLH1b6kp9imnOPC0OrdaQiByt11G83EL/kFVHCgFv9ZuQnqIboC1ZOiQ4nT7uX
         MChcHtArqMxX4n4YKx1ko1ebkjBSiS0yVmdtf9ZcEjC+YjxobQCwMJjY9ihkSH69R6Xk
         r5+j86OiDULsjUc0uxYQC6xwHNjN+G4tOzAtf3QLZevts/xaoYBOvTBbl0623PgCw/3c
         YL+oRd8Dy9/QBrxgEZXJ9lL8ITvI+AK/W2eIBImdEZPrfEjZXkNOCyRXPe4bfVrkPZIb
         V+FO2tlBLJzTjXojQfA7JLAVhBsC+24Ac/8bGMJzN8BM6pSk466dzntlt9ZMvXQfjFmT
         Wo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934682; x=1749539482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=wNMH+cE/UO5XgJ6Z2mrrcjNSAd3q1EQqXNrVI8cSK5sDvCtqNYIhI7a866tqbqv0pi
         ay1eAjK3doA+JgIp1t0vybU38OkjQ/lbw0u/h00eAWhEr55+RPDrrXOhmfklljVACkne
         98MaWDp2C43QfbY9EHtZc09wTYsrvtbIc1u9KgGA4HUCehBER6U01cPMYmWFLuRBP2uf
         7Q8RbkKzKb7E5TLqklb8kcfpHBEJktP7du1iRokMYVftsfSXDBEurPwsjZJHsL8V0Z8B
         NEeUYGW/O2Zro+zBCGU/LphR+5MlcCQZRlbW8S3Kzd4suY0YnR1foWetfGZ36Q5kT8pB
         QQEg==
X-Gm-Message-State: AOJu0YyHJTpsQGE61kU5OC4CmpmZyJCdSr8cAJbTC+/wLjNHhMwj1OMN
	e2pRaEY6gGvzUiAa9hD+N5o3wFfICuuBM190gwSmpVycuHR/7aFirhCjjKaaIYuwfwI=
X-Gm-Gg: ASbGnctt0qbuB7uInYruK4zNKZUm3UjlsQWdxx9zpfkZhvrayki+k1OTVZ2zF5aE3Jw
	qhnwq8Q6gZzYy9MVcOzJhpgP+tm5MbtE0+gQF42fTC4K9XmrWpBr7pJDk6fJdPlqXZnyL4cpqT4
	c9BmH8tHo13wjy5uAURXSima28CuVzBJYpLB3/97cAw6Wb257sRKuf+paFzLYWShAPCABQ4RAju
	MIbDDsDZSg5Z87pux19I4FtYBteRJuvTYHFDR8C6ZP+DotNRce0FFG1KIBH3yDM0+9c5Srxj8h8
	2mgQxGsBpk3fRPdYyxgNGgERIazsohKmX6xNIAZXof2sHLZF3BZAF/kQYJb5
X-Google-Smtp-Source: AGHT+IH0yPSQUYs3KibIp/x7iu1Nwa/LdAsHJOBdWwn18yMWEz2cHx1TONGezh4asP/Kv/HQW6UCEQ==
X-Received: by 2002:a05:6a00:b90:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-747c1c46345mr18149708b3a.20.1748934681648;
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:07 +0800
Subject: [PATCH v11 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-8-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=CgR/9p+yyw53c62J4hPQLpiSpKACzV7q2lWs+QQNgAMiZCDbEiDbtB3b+Dw7VJHj5NfLllHTF
 +027St0KrfsDn0M/IkAQ5jiVE64mIN5CYIH8SaWl6j4l0k0+akcU2Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


