Return-Path: <linux-arm-msm+bounces-39347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EA9DAB14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 16:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E143B2194B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEC20013B;
	Wed, 27 Nov 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iVuz2VU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2E200123
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722842; cv=none; b=ToL8rFqSbdPP+qV4rTLOCwMF4ujfeyLy/pp2MIf0EAbG2lUA6lFjKCpwMcnZqR9Ezr+MsLFQwxNoeUdRwijEdPAUoUdsTe5BgQjSXa365fmHgpzqmeHbDcwts6QWmhZwfvuNA5dQAyaCLokcpNcVuxJncewqrQCxj/loGLrD1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722842; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POjOHW5ZTH4uLT74RRiFqQEURA9chm6op4qRINg/yiMsikhMaGYwqswl9ysKJedwIpWcixW0nBtsC3IVwG2nphu6zK4B+in9qpRz0q6+1SR13rjYt9I6q129QHRozkigyiPq1ykXE00NSVy5b3tlctOp5RVwMwVOAymGt9yNy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iVuz2VU0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a95095efso6098375e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 07:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732722839; x=1733327639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=iVuz2VU08c86+7CpdTHgmymTC9Xk5kQFrHI3Rm85MZzG4mMoFBbZjE894yrfX9Juju
         J6aPgdu2cuJbd8SjEAE5F8WKLlV71LoSiJsDXQoXKw9qxUEvv1+bybyD2oLHm/fvuARy
         lS9eaNc+9L+1NM2pYsvehxAjuuoZPzHNqTbvNfJUwJ1hiP+ncvfEZtKmj7WL2XiVC3zb
         ZLFCeeI9f6EOTO5XSG3Q61ppks8CMLfrHtTmo2UVAX+aOpieItKZbd7n9jGflbsppyi8
         P7prLo67uIlVdTxFa16h2useyzLybazkRJGUT5i7ZrzdgNd0q2bbzkX/v8SSOwYQuP36
         lotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732722839; x=1733327639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=cL3QEfzr8nfAC9qjUBY6eoCqfo4U8d+DhPVIatfDHXEUfU2gtLDo3ih5VbtyYeREHZ
         4M1jUbM3YEegT+TywSlIMjXfgYPKEBnyDi0nNHCQriBRvV2dJPOTLwwK6xqIX59uAbWL
         tzbAMI7HyCU1ibidmtdcjXTkhKOBtvLHzcGDvYzvXKoCnpiDaSX+5tr1+S9qAPWfjrdZ
         +KqtQ/11/93fWC4A/HMQFFD7rqL/DQZ+XPuzpHwQMN+XRhEHMLJ5BU3MAWhNLy2e34eR
         il0geUQukL8lOURPVXQ0q5LEFFp7GxyGzucWbicQoZ9cQbTktOb2f9zF5ToUCoKTitnp
         68ag==
X-Gm-Message-State: AOJu0YyrAmPI9UFJ5RYqJcBu7EdqfWLLibNYsfuXn1M5xj2pXxBwMqGz
	yOopfm+3Ot8aFGBCkcUCid2kYeNZBFqqU5mVcnujmheysY/Res97dzeWO6ZGRFWs0h1lp74vcc3
	Wkb8=
X-Gm-Gg: ASbGncsueWhzOMyXjFj3Wa9w9y9gWz7zpznQJLb7Bx3hPqGWXtC3EPq/VBwadChdOJ8
	gVeYbKpYfE+PpHXws00AdTLCLTRwnKMLcXb/au2gonzgDSNtNCpUjh68otMj2rXTw76abmcb9uM
	pc1ZL8NdkL3ICmX625SZaZJHtcv8fZIb5lsaRFNhtzjZ+U/DVnnDdhlKo0XwVM9PkFHYkwuwsXS
	UlV8mis5sfOfkj1gU5sUMqu/98urGltwq++ISd7Jnblx/xDuTF1ns8GtH4=
X-Google-Smtp-Source: AGHT+IGCi2IOz/AsR8JkzwtkPOnmB+mXyN8jzsNxSflDpZl/p5VLachhORnZ/NXQOdxT2X5iZEFsNQ==
X-Received: by 2002:a5d:588a:0:b0:382:4aab:eb9b with SMTP id ffacd0b85a97d-385bfb1e53cmr6558642f8f.27.1732722839393;
        Wed, 27 Nov 2024 07:53:59 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d1a90sm24795235e9.32.2024.11.27.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:53:59 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 15:53:54 +0000
Subject: [PATCH v4 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-1-4348d40cb635@linaro.org>
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
In-Reply-To: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);

-- 
2.45.2


