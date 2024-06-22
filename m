Return-Path: <linux-arm-msm+bounces-23717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBC91366A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566AD2849BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51E27A140;
	Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGiBKUyd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4716EB5B
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093743; cv=none; b=NomPHJh7TAzBnIs58ipDWUdVbX+Z/gtTiLA7fVhc4Uw7oNbKmCfBFlNSnJmh0NhbYSiA2TEogLN8cro971QX00Dh7DnG+5125FVzhbbzHa0CLxMBFbLZrb9HcTAsnD+Y9uilDiYIhKbOePK3SXAMXy//wOahWU4DQg0VkI6xIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093743; c=relaxed/simple;
	bh=h0lqf9slPd5eUxk6pPihIhSWYhdShDER4/lwQr5RwCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BspAIggBAluEuTu+TLc/Ok/kW2gFQyWbapb7msJ0lz/hd2asdc8ktJwayrb9rcd/ZzJe5yjD10Bd8tABr3h6ASL8+uMw0u7VkuSAzOv7nTgI+D95fbCz79sqgTLnXxVR7c07Uy7F6VWCnzNGCBAcOb4BwGXfO95xVD59r4tjqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGiBKUyd; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso36384961fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093740; x=1719698540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaaD0TUxicSQ9bcBzddmbploW93tWtfw/qjS+oWjoTA=;
        b=CGiBKUydMeXWqPLWpNGW0tW80g4XyuOuiHxWf2BC/IbSUKZHYl7nCt8DwuBDL7fwwr
         dbBMaLkV9Iate91Kk+HQ4JRrWuoehZqkA1VCdrai4tYjEravGXIfWhWP9zQrvmuXP1PP
         tMGwY4khF+FHGYY8UanHqdTmUUwbq3Lp51TnnU+UOY3sKJfrIRLZQ4xwvdGZIxX2DLAV
         2YhPzZ44kEvr/SmkdpmOU58SzWERHjiqEuAL2kqES1hsDwueOof2IV0Kt+pFzYnMcv3o
         hmWgrCkHCxnKZUQ0/9GJtNSlMEC6L7JGm9n+tbycIIp22TV6FiFqDi0S/6C4My+S6WFx
         1+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093740; x=1719698540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaaD0TUxicSQ9bcBzddmbploW93tWtfw/qjS+oWjoTA=;
        b=utqXkGxt5odccWK1D0Gz29ihv5X0vwXPCyhGHOkkAry5iFWOCJlT5Un2NBxemW0alW
         BlL2esnnXjMN72j0mnmNbUcTiG30HOIEG+6+ud3aw/MmNkcGiUD6sKSi7j4jy2b6Qfjm
         4QJqw9Z2wN59ZLaan7ERP+/7Hdk+VedbtW/8p3uvDg5uDKki995fOFrENxye5NRNAwdP
         x7NrtArjLIKPh9b69X6sKKzID5Yjjm/jwNl3z/fDNtXKZtuqLQcQlzpMrF1JFnqtDyUg
         hRHMJ0cU+ErsgEV3AiQ762j40FKoW5quGVVagpkCbDVJIlZus0JA+EI1NxAjTj10bTwH
         bc0A==
X-Gm-Message-State: AOJu0YwUdtzGA8g5xraR92DqZqCpnxZVtlTGinjAb86K49fvPQbTX1/o
	xV58DrVoLfhhdrTiccDGiQROy1SjEf8EbR1447Cf+Sk+uPkqArOfpOOJyHBibgE=
X-Google-Smtp-Source: AGHT+IH31u6dzIAuNw0VNvPZ2GqCzxLoG78KUvKhD6XvPjNqmtALsT04SfRsx1ap83ri/b4wewW5YQ==
X-Received: by 2002:a2e:3218:0:b0:2ec:5685:f06b with SMTP id 38308e7fff4ca-2ec579837bamr11068451fa.27.1719093740178;
        Sat, 22 Jun 2024 15:02:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:15 +0300
Subject: [PATCH v3 02/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-2-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h0lqf9slPd5eUxk6pPihIhSWYhdShDER4/lwQr5RwCE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q554sXjVmrzHatz+7ke/5WkuGWZkd97RrOzMsB/A6ns
 nNcrB51MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiK9LZ/5n5inesrmwVuLDO
 W6HR11dVtny2II/Ft7CzSpG3pHf7lNnZcXv/3CrsuaRUprmtUs3mJZdH7ZPIOSd577cYtqlJ7/r
 Id/7WpIVspzOPzOZb9rUugdtzLdOmtge6eR9OOjXw1nHp9OuxJCyb3fKWU1HOtWfa4RNGu6M22y
 fkMk+IYDd8sed83ILEhoKdV7kM3WeqqvakCP4523vvy+G3K3d0BDfu1Zwzz3rn8iPzDrY9SGedp
 JC73+ay5m7vuuU6vu9DZfKvs7X1qzwxYAsNvtt0Sij2TsvGbFPTPUvbN6orqR9Y1tDOccq3ceLq
 Ho0HaQv2myd1bNg5Kczjvs23789+NjA+Or3OeX25zlYTAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8c6c9dffffd6..818c66efdfed 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -234,9 +234,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.2


