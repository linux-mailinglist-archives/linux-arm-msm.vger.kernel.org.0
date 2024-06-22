Return-Path: <linux-arm-msm+bounces-23719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB11913681
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36BFC1F231C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4975982482;
	Sat, 22 Jun 2024 22:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9e316zs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C177109
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093745; cv=none; b=Iz7le3YkUG+EvrFC13v/gry4tgTcTr0e4HBxdFTs88WqQMffulN8ydhQaLUcgLwhLtSrTMG1aHXNq+MdJsFTKdRWTDL5ILNFfkd1Wm9nJ2tqC+su+tXZ9gxA6Ltaaio+RrXmjPEcs1vrBcoHaAl2HC5VfWtwxXI4EUDCOqNagPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093745; c=relaxed/simple;
	bh=/H9AIeRGXj1iPiMEVlXfEy/zaUhCvcXeyC4fw6d5vqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0kqTNnGtxeE8jck7eqUz1MmtMO7jN4HEB2QGuOqAiQgTGkeYWEFHEnZI8knQCfL2UKFlEJlymb+SX9+J9R7pvgvoydNnIgQhRJ2m+p9EAIG/t3BKXCx8wxLphY9PZbvTtDvRjUY/Ofn2hbKcNOsqkDqZW6/XjRDq+h1+n1sWis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F9e316zs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe3fb5d4dso27516031fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093741; x=1719698541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUSF3z8flXPuG1mf393BlemBX3xprfFWvuJAVHzccy4=;
        b=F9e316zs4yCdv6E3OcXSZvXsjhNY4gCAoK+CMCaIoYWj4LQuzJxMft+74rcfq0YxuB
         x6oQ776i36i92xwWJt2m5g7vRJPeldzJbOLZa0BXjN62j2e7kR9vw/qOLvnwKvFgpjCH
         0mzYEErHxhSJNg0n6Vm5SvvyM7aLuCB9MqbZjldvGGwtcrWIWSF5hExhjdXAMkU9Y3fa
         xe7itryzQNigxhkXLA9yuJqjeGk4wRl9EaRFxum0KhrJQysMIInYcwbX65XCodL2nPjf
         V6Wfg8cWU+i6AoPh6C2qhphMNU6bRU2P+VgTmtLz3QE+Gly7qskLm1aDP+gDag/S0LST
         gSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093741; x=1719698541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUSF3z8flXPuG1mf393BlemBX3xprfFWvuJAVHzccy4=;
        b=w/HJZIbhOFwOLSYcsMJZYXrg8EWVYHZDxl8FRhglAnNt3xxphxDHsAZBSFBqZBu513
         HdH3ey3K9PLoKzmCGnZvgXGgCDUd+JUCi9METrf7sEOAGD01QiHYc8cjZMj1OmQVBoaB
         MlgtRVOF94Nb+36XjkpHohMAXgL6oJ5LI6HjIDKDTU87UExfmsUPyFwse18DtCylltJO
         HGZGcXOMLkwwpCM+gLTiUwtiwW1+IEgkD5vtI0QNHozBJ9hX8GLhSWG4JRqPQiumIRG4
         XVlKLD+1wo4vizp4iLTjRj6l+wzQN0fWXLmryo2juLmbA6W8PYZMiy8jnYOZ2ocBfHg1
         9qyQ==
X-Gm-Message-State: AOJu0YxkV+mlqA2jR1I/bclj4iv7SQoljHNHioBKXWcrEGp5xshRRaXj
	0Fculsya4LVht2LkDHRcZmh8AX6CRYtaf4HF5Ok/bJmN78Wqd4FYNpvGcZFvQHA=
X-Google-Smtp-Source: AGHT+IGMMMmICL3mibO+4e1/Qy4RQb1df6S7as4drSTw9qVUH8VTk4mQZRIsei13f4OmQ9lhypqjyA==
X-Received: by 2002:a2e:890e:0:b0:2ec:500c:b2d3 with SMTP id 38308e7fff4ca-2ec56c6cbabmr5669221fa.2.1719093741652;
        Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:17 +0300
Subject: [PATCH v3 04/13] drm/msm/hdmi: drop clock frequency assignment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-4-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/H9AIeRGXj1iPiMEVlXfEy/zaUhCvcXeyC4fw6d5vqM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0noU4Zk6ai+BqxKLQv+DuZB+HcLkitfG198w
 TKh43wQY+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6AAKCRCLPIo+Aiko
 1XFTCACCZWRtDa5j3veTt161Zzru2wbC1iIJaNc44Trwd8tq0lKZPNaJtAbeZFP22J2h8xrUaYp
 LT4OKi/B1z2c5RvUzdMh4lnE9mumYKIvvIndLML9nDw8b4Zykw1kSnJMS/aOk7QqZqRxnuZUhS/
 mzdPf07mi6DNoOsX1SMaIDRuCZG0Nprsl1+Vh0OGmzawZtVT5ysQtnvykWHr67OohWaJJ7afXqh
 aSNhYQILCJChPwf6hmk19Cgpg8cpFJsPcOeqIDSar+FkOdOjxzUSTUDAnBym5kh7swsh6Nt0KVy
 Ml6vk1OxPM86QTaOSHPgXlR9JqC/l8XWsNEfzLKpvxIYAN4V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3a65d82cedc7..9a39ad1847b9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,12 +235,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 1f8c5045a78c..14472b2d6229 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -94,7 +94,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char **hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa35417..7ae69b14e953 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.2


