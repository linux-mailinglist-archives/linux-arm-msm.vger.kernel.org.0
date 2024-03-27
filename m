Return-Path: <linux-arm-msm+bounces-15463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718888F010
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 21:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286C51F2E5EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 20:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9AC152E16;
	Wed, 27 Mar 2024 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FO9RNtOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2B214F9FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571267; cv=none; b=VhBEsXlURAHOSRiRE3xuZsiFF0cAX8kyZYoQVDti2P+TpWcVjEbcaMFI2iV/iH8sq7dMTOzrlWLrqOyBJjJ+B+iiPRJGJ2PGXCVsi4F5j1Bmv5JmmgQGnoG8qOsnwEZLN5MSii770aSNInilqGUodER7a+3A48d+U+M6mQKf8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571267; c=relaxed/simple;
	bh=5oad9tk6xdefUEpfxlO0qYtx6N8maziQMfOniCqwJyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hm3RZwDkV/hnlF27bGS5ggCOYYqpIxoD8FjviKI1PeCS3bMxPnsdluxjA88I7gZ3JXwUnFSLhI8Vq6f1n+NNKQMnVePj+PgRDDAc99FtN5INf/lXPLU25UPeKFsOBZCGW5ML9NTBP44dyTTtcNVpEiM+e+wNojUSuTNwLklKlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FO9RNtOh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5dc949f998fso124521a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711571265; x=1712176065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOsAStJoLrdj/BC0nTULl44A6A/+Mu8syVTsqrg00QY=;
        b=FO9RNtOh9nmWPrsc0Wbt4Qb0e9boRouaPAalzw174s+6dQUxuDYtdJz+M2ynUZ9KgE
         wEANRs/JjRMK7KkmPKYBRK7PGnOdBbd8C3iODKCuOdEC/Ndetd4G0HSPdTD9ROUafBYa
         pzCSAXP4pHonrrdhTkuBQ8cGF38U0g6OvKQPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711571265; x=1712176065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOsAStJoLrdj/BC0nTULl44A6A/+Mu8syVTsqrg00QY=;
        b=I1HQpJ1NG61CcpAsD5KaY1ocwMlcpFKWHPdll1HlumjThny+7tapDamPSYhS0S8PBR
         C3ORx/XtL5tSKjfKxR89DW+JnPmcWJYg4cWKmufNvSFhxiOMg4X+sfQVzlj8/MCRLq0U
         J698JxtOMRA2wILlwocud7lYzNJ3DuGSdn8QwE0oyg6v5+EY8ffli4F11Z2ae8pKR4Jn
         WbFOYElj9GRzazaD9MTllMzfmV0tUVa/Wsd4B4oeamzaxGjAZd+4myZWjg2I5N8nQm8h
         UZ3HPLmISvEWeJwVFMF7W3dF133sY3ex+kyFpRX2yLmBjzmheU42H0SH5EgulfkgCttH
         v8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz78xtwFyImgFYEjxBb/he1vbCCKFCRWTNcK2MBy0S/BnqNWh5OTEXeMI8XRjl36pJNbEJ0Mx0feUt0fq8uyjpGFUlPK2RE1QDyIVz4Q==
X-Gm-Message-State: AOJu0YwmNB0XMogyxAz/0SeixT6mJJAJ8yN+exepfamBqX65tEM9BH+Y
	nXOvIaPkWA0+XkdCjHQLTVMvQONY92ZKXZNfUYsLYJORrHdJoT7fLoGJZPDO9Q==
X-Google-Smtp-Source: AGHT+IEsci/FRTRW4pt6BJLZbr1PpuxpETOrv0oWRHOV5f+8PsFRccHqiRauOWrEOQ+yKC5ucYNhyg==
X-Received: by 2002:a17:90a:8402:b0:299:72d7:5b9a with SMTP id j2-20020a17090a840200b0029972d75b9amr706179pjn.24.1711571265285;
        Wed, 27 Mar 2024 13:27:45 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id si13-20020a17090b528d00b0029fe0b8859fsm3602158pjb.1.2024.03.27.13.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:27:44 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 1/2] clk: qcom: dispcc-sc7180: Force off rotator clk at probe
Date: Wed, 27 Mar 2024 13:27:37 -0700
Message-ID: <20240327202740.3075378-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240327202740.3075378-1-swboyd@chromium.org>
References: <20240327202740.3075378-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'disp_cc_mdss_rot_clk' is parented to 'disp_cc_pll0' and enabled out
of boot on sc7180 Trogdor devices. This is a problem because the mdss
driver (the driver for compatible node "qcom,sc7180-mdss") turns off
'disp_cc_mdss_mdp_clk' and that clk is also parented to 'disp_cc_pll0'.
When the display pll turns off, the rotator clk gets stuck on.

We don't really care about this clk being on through boot, so simply
disable the clk during driver probe to avoid this issue.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/dispcc-sc7180.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 9536bfc72a43..a3356a7758b3 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -705,6 +705,20 @@ static int disp_cc_sc7180_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	/*
+	 * Force off 'disp_cc_mdss_rot_clk' so that the driver for the
+	 * "qcom,sc7180-mdss" compatible node can disable
+	 * 'disp_cc_mdss_mdp_clk', which in turn disables 'disp_cc_pll0',
+	 * without making this clk stuck on. When the mdss driver runtime
+	 * suspends, the mdss_gdsc will turn off. If 'disp_cc_mdss_rot_clk'
+	 * isn't off or parked on XO at this time it will wedge the GDSC and
+	 * then 'disp_cc_mdss_mdp_clk' will fail to turn on because the GDSC is
+	 * wedged.
+	 */
+	regmap_update_bits(regmap,
+			   disp_cc_mdss_rot_clk.clkr.enable_reg,
+			   disp_cc_mdss_rot_clk.clkr.enable_mask, 0);
+
 	/* 1380MHz configuration */
 	disp_cc_pll_config.l = 0x47;
 	disp_cc_pll_config.alpha = 0xe000;
-- 
https://chromeos.dev


