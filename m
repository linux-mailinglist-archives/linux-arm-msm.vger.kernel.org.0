Return-Path: <linux-arm-msm+bounces-39348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4179DAB18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 16:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EFC2281E67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B2B200121;
	Wed, 27 Nov 2024 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoRdU7N4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E85200132
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722844; cv=none; b=NHT3v0isjHHd9ZF2fummieGry2Wwfq5WZxkYG8sGIwwXo/IQ6qscvvTBnnHlisIqrpWgyEzGCsaT2ZMIC1f4SatIRw1pmXeClNRpDT+XiLK+BCROTfQJ2H6UDDLC5QCjwasQS+40XmBSLj6cHLd7gAChGIwOuJEeTXBgMPx30TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722844; c=relaxed/simple;
	bh=9DcDIgyiPEQQcegeEN1oWtNvqOat5t+dI1L4z5w/npc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efW0pCTwazboEUjQZ60dejvXcCCA5yooMs5Zpr2ZX1VoKf/7zmDS7ogyJIIYmSQJqKFJbnFfvaM86McYlAGiva6sEmhzcN/eZ6ejTXsP7AsDjWunRuwk1Y07V59MyOssUm0+X4EW5N0YYZdQ6g7JSbltDmEYMfhbZoq8iuVQkWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FoRdU7N4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so27387445e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732722840; x=1733327640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=FoRdU7N4z/bLNPK3GWhdHpF9I8Qjhg4eE2sv7C1vvXSV44Z+qhWG+ODL5NanTIqJId
         K5CwNYkVDDWNDQPvMsHTR/WPK7pTDvC45CJpyz7N0D9H7FOFALQRF7tnJppyv6BYkgZR
         FHybeX5QOhZyVYI1aTE/8s0U7p0HR+p0jFAUelc3gXfxldExMJZt82DfAdvUPrKoT4aZ
         QwJvJmZxZMO6WRFwHI9j0SXMrvlhBkncVUH4fIKSaiuNsyxbrekra1rvRZ4CdafX47sF
         uSqpFIKPkHyPqnli7bDVhdhGp41CIEeKZdn3U7l9aTN5zV81Wr+BZyV19dzLw1xCmGjV
         Y1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732722840; x=1733327640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=Oh/lM9oN8V5YZqL+ZGHaNxlshP5n6tOqyyxWAd8AgzChQAH23d53A97/p9uU7jzc+g
         aLJXF3UeFhPj0+PxnuQCvPZApI9F7zHvUNLmoIMw7LmBZ4biA1Wn4e6FJKh2BTbrGHzf
         bo2LfGwTy7tDmKbY6JWphIiafcNYQz3m7i8kye8EII7mT3DUmkQTel2MH0fXLvHg24RI
         qax9xe/m5+VzPpHiE/+X/iP1dh44n+dEpLDyY/k7DULr7gYiiPXrohHNM28lvYZthhV0
         Ph+aR2qgOfreCDBD8ceqKGesgQjTsl6ZlbW/6/W4xLNFTTQGq1PHvU8E664M4NEsmArq
         YdyA==
X-Gm-Message-State: AOJu0YyTVL7UvEAXGOYp+2Gj+27aN3d3rRKj4i1d8cagExJeSvalSwZ5
	RM/hZW4L5K0qKAbQj49JRcPZ4TM2EWWvcOhDdrl7GH0fn2NtLMybPtLQ1fIyquypYIA+BqhKtFL
	tOYo=
X-Gm-Gg: ASbGncsrFGWIJcPnOSwLAUn/05cyle/Fxm1gtTyjPrZvZc5xAj+itL1e2M3ccVVhrcH
	amtXQw6iuoL/KHM/Ql1h4aasKCKQdl2Tp+0og/WwRKv2eQsOu0LrOVybXdCOqvvbJZTqN+YgZ0M
	NP8GydgFDrp5vgNYpuayhXKvaKZuBOCf15OnIJ59COBkues8eN+9DVQGI2C0z++T0AGMiHUXO2Q
	SrBKaPVj+g0+F6H7WF9BBkkp1gR8XPri2Dw0qtUDlnMTBqZYdYBpWMmp40=
X-Google-Smtp-Source: AGHT+IHGDQZYsAgi8Ipqt/f4XhqJRd2WRzf+LxuX9QIopr2zx3rLNuUzg/Jh4dFa9IVL5CZPYN2lfw==
X-Received: by 2002:a05:600c:444f:b0:434:a5bc:7103 with SMTP id 5b1f17b1804b1-434a9dce666mr31055245e9.19.1732722840401;
        Wed, 27 Nov 2024 07:54:00 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d1a90sm24795235e9.32.2024.11.27.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:54:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 15:53:55 +0000
Subject: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
In-Reply-To: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..7727295c57c8f6672d46d2380e1ff5ec2ac68d42 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -283,6 +284,21 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = 0,
+		.num_pd_names = 0,
+	};
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
+	return 0;
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -299,6 +315,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = qcom_cc_pds_attach(dev, cc);
+	if (ret)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


