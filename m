Return-Path: <linux-arm-msm+bounces-41535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D849ED2D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EDF283B4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208621DE8B4;
	Wed, 11 Dec 2024 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiyioXtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B281DE2DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936081; cv=none; b=WB58UALXcTCQyyLbsrbrdUL3fpIX0qAlxyMUcEzDzz0BGh6uqmrBf6/I1Qs62O7P54lTpbLgymI4AJncwFo3HpBc2sfQ1tfRayy1sfIoR60qZarf7UNytNm7IXiJThC8yLQG7tLjLcBukqkUZdO90aw240cxGgs9vzUHqZt2nzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936081; c=relaxed/simple;
	bh=BCcVhjXqM/11poMT/N4HvI5IzpguMzkE/XgunRZ0xcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCPVnMVkJQy3GaQghOgvrpJvKmUrIMrdtePox5bkQDokNLaKirgQac+BZ5bNOz4sf9gtylQUb6agllUpBduqjSfJHgpQccaFQgVnlI8p0xNx4zKt3/Tlk5Bi4OJkow3UEquZ9oMharYIW/RL1GLCREuokQQUDHCFNFXrA1wH17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiyioXtN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so659798866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936076; x=1734540876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=ZiyioXtNISlbz54XwcZMzsOFdv54pbxF++l9vpZehqEE9OAQFjikPh7wyTsRTkuvjq
         jgXxTEcrRW834+4qF9oNiQzdw65WvQG4zJ11KKQCHcUB577rmbd5EqmHS6Umtt7irSzZ
         5u3H69oB1ARbPhSUPX5f0f7jIyfWWiqTT/m8KWTkNWAAMRBfTQixzk+VCiRe7Z42UvkN
         mLx1flUYmdaBwlgo1SzJ0NACbVgfgeYYegIn7ZqaOuE1gz9MkNnjtpJhl4IAs/ihTCRy
         DFFo2cciOA7XmN3Ls9Y65TKI1n/eqEwBDOxKq7qqCdb2Pt1CuWYUXKKYlrIhPi/NspTj
         Mn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936076; x=1734540876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=FdoQkF29CZ63hWl9R0QS2csDsdi8QLwG1lYf+1H/ie3L0Moa7lu9aeLoxMyXmKYa+i
         4t20AiIrq+YqDrvSOYAGA/j9upfQjxNPnj5XCTs6YtwNUy6BOd5piNyJfCiYyNSzeXnD
         jXtPEqtTiBHzSQ8mapIgn3RT5Kh54yAlCmxd/NIUode6e1tWGABqgYI+pl9t4AzUSM7b
         HkRjj4CHxmaWqs9YA+OgLksTL3SZhaBFJh4MjgEZNACKcB3ZcHAJBHI/0efdUdexxiQD
         85xFraY02SDw2DGkiQLLX9J4R/awG/sZVlredBUZFZJze/Ph5VXTziih8463C5I3LCaB
         h3NQ==
X-Gm-Message-State: AOJu0YzgVxM76fCZ8dPbbZ/e/DlnsadP7xzgVUsPjYVxFX5e9dJ4TzlG
	zF8OS1VamcnvJfLZo3Z7Vx1yj5CT5BHI0rOhLdytf1n7TivY3APRUsQFAHnVMS8=
X-Gm-Gg: ASbGncsNCvSs560dJOMAR6uEIRv7rsJDikHTJkGrYPM3xt0LrcvMTrj1sgqC5t4snFC
	hufAo8QlLG6RZ+WlftIiAcHrO+mYyyCwPeV3Zc74XzSen1ntEsnAS7/g+mzvMpER7+etH8eMsEo
	Ndl9noJZfa2ed0uJzccLP6OKE4qnqChN1ovgS54PsfD2DS+hXtHOb2ufj59TDXrOKYxG0LjNDHj
	SMGesOaIofcAbGjlWtLKGePpKTF+oEcFpkzwSd+ELt/1vbSJTulS4jb6reBoO4=
X-Google-Smtp-Source: AGHT+IEGmnyW9beBMmVPguYzlZIsjQtmiTPL/wxqpdtxkv2SvAJyTXjCcC0PWY+7jCcfU3tEC9CUPA==
X-Received: by 2002:a17:906:9c0f:b0:aa6:75bd:eb5 with SMTP id a640c23a62f3a-aa6c1d028e9mr56988366b.57.1733936076512;
        Wed, 11 Dec 2024 08:54:36 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 16:54:33 +0000
Subject: [PATCH v8 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
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
 drivers/clk/qcom/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


