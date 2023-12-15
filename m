Return-Path: <linux-arm-msm+bounces-4860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32F813F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 02:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795201F20F0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 01:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC21CA66;
	Fri, 15 Dec 2023 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anx1mVty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C4CCA64
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e0d1f9fe6so125100e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 17:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702603944; x=1703208744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvajZ+ZUy8QF9H1RwC0LbPByFG+e+2PVqzj8CMpNiSM=;
        b=anx1mVtyXcwfjXRlJAcbdX/B2oxTw1KrrsGwVW1dE0PoiQcvc//ANeTVUaDtdptUDz
         CkygVjdMhdcR2JcGIOn8mJV/OEZeDhXxn9oV1OxvMcO0mCl+5Bh5aWMAk19sAfxbPVal
         4JWkRaebhrSD7WqosEcd+yyFbk94arRTwICScoQ7nwfk6lGBpHGJznKpUuZODXy2cqfe
         VBfRt30B5zhKXrQEzB56JCKmjySnS++PGPCxe06jG9UZeBlivrWiOlYvBJYxnhdZimRk
         X2v6Vq2AqkjIk4giYqqKbn/X1wdc/tDowjk+E/eSSfpAiNHKvFprkBaLPCYKj0XhnHxU
         xxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702603944; x=1703208744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvajZ+ZUy8QF9H1RwC0LbPByFG+e+2PVqzj8CMpNiSM=;
        b=TpSYBJGjEQ54Vum7e+gdTQOO+14Sfd8+4EFQ0v69OF5/wXpnmrpfmNP8bXTbvOZ5pj
         PMSODNL4vE13moAzpGELAbWwWGIPqbFNcuYHjIgY0EQUy9KhvuuXo5lmeJLwYgk8wRCk
         EjB9FV4qJZ7ljoxK7odIB+dy7sp0PzasRziuK1YcozZcFIaEWNDIGVhd7Z8pUndOxeXW
         MxgiMAlE9JsCnt9QrI32b+JAEISyP0dCsgBrgE6wk+VFb7OOVPAqfq75qQhHHQVeJx7n
         VmgJ0d7FLffFNZf7Nm9omjjQZ+XHjzu6Z0GMm6mmCqj6yg93FTSu1e/KGybHD7qIqfa5
         Intg==
X-Gm-Message-State: AOJu0Yz2/MIucQ1qBhiWYbeq7ZCsJ5DdXePKQ2Sid1OmsHf6XYu3BagB
	qSy0uuUAEnU/Wgz6wxgXD3E98w==
X-Google-Smtp-Source: AGHT+IG9AALVEdM99z/DNBleWnGYSw0gOO+GW35xtmr8C4UrkL9kLrHXdxVhfa1C376SrT6Cbs9q5w==
X-Received: by 2002:a05:6512:3053:b0:50d:faa1:acce with SMTP id b19-20020a056512305300b0050dfaa1accemr5091786lfb.56.1702603943944;
        Thu, 14 Dec 2023 17:32:23 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g40-20020a0565123ba800b0050c0f7ab038sm2001587lfv.53.2023.12.14.17.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 17:32:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdss: specify cfg bandwidth for SDM670
Date: Fri, 15 Dec 2023 03:32:22 +0200
Message-Id: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lower the requested CFG bus bandwidth for the SDM670 platform. The
default value is 153600 kBps, which is twice as big as required by the
platform according to the vendor kernel.

Fixes: a55c8ff252d3 ("drm/msm/mdss: Handle the reg bus ICC path")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 455b2e3a0cdd..35423d10aafa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -562,6 +562,7 @@ static const struct msm_mdss_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
-- 
2.39.2


