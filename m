Return-Path: <linux-arm-msm+bounces-41534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3D9ED2D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D621188A45D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343561DE881;
	Wed, 11 Dec 2024 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC3XrN6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FF71DDC3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936080; cv=none; b=nTr+PC9db0IOptAdtgSQpoW+o+9D4tDpI1yn0nkqk36c0VV2peJk2fwq/zpSnLy3G6Bh5twbFUu14w6jRsQWm6oonuC/4CbaUlmC/1vl/lPPYjclkgjVlCL/9UIjLPWJiOcqKImT/c2djCe+8zxtDOcf8vpvLAZpPlQPrBzfO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936080; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBouFaDbdLBLAW0VeFmFVeNhzZJf2EtfOTOBgJukWdMM5U60WRMp4WJ/R4dmtvVmOpY4/ywl4ttEglm+bkdhEePXB3dizOQ1fF7IlfDbKkT5CVMt3u9XY2vikVkBGvwbZfomXBZPi07e1rw0ST8ytSU7x7tYpzlbSMT1oe4mxWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tC3XrN6N; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so9588172a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936075; x=1734540875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=tC3XrN6NwnJEzhQl00utYZrObhor26u41cLUk7Fo62iUelX3UZtX6pzBqzSGq5Frah
         JJop4cZaLWsjpTJwCDgCtiPxVw7U0lUZi4xFq6g/gj+FPjoCXoI2S1QZFDG5zuDpYUfd
         bZdYOvCn9iT//H2+2THybZdam1vNs3gA36TeSQNMjm1qCctzrALYOExTuS6gzMHKRqpp
         DUM37c0cWRj0WI27QiJHvffzOAmeWU0XAaRDDmctxy/lP4WdGqzlWPs6xeLPtwo/WFvU
         y/6ILyZ5F1tJBM8vdLyLiOdexPY7aBJ7W5ryIrPUgcmwuPFp1C4e12lJhOh6ydvNylKc
         nxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936075; x=1734540875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=iKjGX3faUUfJsoKAydORvY+4A8MCOXYmJoJe7Z/S+hmoNjn+oXN2QP5tRiOtTzeJJu
         BSwoJwu0mltubU+9v+ZGVtSGgpoBj8jSNRwTf3UNbbeWXQZpCWXnqS4M2x0nw3V2QuQs
         xa9QNp5rQpMdydusGJ61TcOL0gQ9W5PnHh26MJLskIMmQp+vCgF1UyF5dOwUcvoQy+qd
         1E3S3GRlhsCxjOLNu1dhwC6ML7wrpavdnjdga0uHgR4RgMeUlyjUxOXvRUQcAcK+AxTn
         7mfSC768cQLXpYEMudelVA6f0pVhR0GuxkmfWizx7GUkuhACfhM/vf16WJRcDqh+1BmL
         Fotw==
X-Gm-Message-State: AOJu0YxPO1Bz9u6fE4MeTV+1ZN9sUObQ/fHBYbhzJgxEiV5RyP/T9zN3
	zdKE7283NVKkBA4GNr177jDooOk4UqIHkveLtFjKMlzsXmrMqN4MDVtsQw8BjNo=
X-Gm-Gg: ASbGncspPNRkoRoW6yB1pL08SLQb11E0QOpkfgNvG145VgEPICW90zddRXteSDFD9sJ
	X5wT5+dCnHEh/O3OX6d641iZQdRPCSr75PZtzo5Ou7DUWmZm8fdB5Gjffg2uJkhql5GDYSItXS6
	1KFvQH75JeoTjwHikxua9j/uxSS8tnrsfZ0j3+eRCJOlzpFkvcc2E1usvEnvycMba/hGvCLQ4hm
	EV85iRDTTaSEVakexg58rabZgz4kUFuHwbwK2d6wSVTQs8QDSYCVBrgNWgOM+I=
X-Google-Smtp-Source: AGHT+IGwueC9pvbwJZHuJYb+mS/4YZvMH5+SuK3PdaZwf4O36I3sCcLiX8mfNLPMNDkWhsXmFfYC/A==
X-Received: by 2002:a17:907:9145:b0:aa6:966d:3f93 with SMTP id a640c23a62f3a-aa6c1b0a214mr45781766b.23.1733936075518;
        Wed, 11 Dec 2024 08:54:35 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:35 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 16:54:32 +0000
Subject: [PATCH v8 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
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


