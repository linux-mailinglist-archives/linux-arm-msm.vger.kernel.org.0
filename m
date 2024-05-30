Return-Path: <linux-arm-msm+bounces-21114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4F8D4D71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0EB1F222C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8EB186E45;
	Thu, 30 May 2024 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/B8RX2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D584D186E4B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077934; cv=none; b=e/qAXmvYW8D9rsrXoZbkDMZdkCvFGaTg5u3ZcQgFM3JP5Ew0cvvRaUR0qyKxpGU0SpQDzzAV0B5lUVSQJGz0OcvZx6oTeHosZkr8p9/5oKbBdZV821Rz7S3XtCq3+S0vuC8LgQBVHv493ONNUUTBkJiCw1oF3VGTrjf+EGu7EFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077934; c=relaxed/simple;
	bh=ESd0gNsxszqbQaloGtME7oCQ3PNGImKH+e9qTcBH1qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JqXqQeAqqg3K/aoM0Ty7lhELz/b6XEomhajvzaRYjrIna7Y2fzoMbvj27sj6DbMklzFftwWRxzoGw5LgX7/Er8l1E3aV3ptZSI2oKgjHYm9KPUmmBYC7MfzJfhxrg1F0KctAEbxyAssAF2yu6eooxIpaVCtb86HIOR6W9qwVkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/B8RX2Y; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a1e980a65so700971a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717077931; x=1717682731; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ozNVAnxqE0lL+qF5HV2h+4/UhN7PSqlhKtJqHseh0HI=;
        b=L/B8RX2YxSaggGp7tw6FdKibbb1unU3VPPON/2IXs3mh+d50C+Fs6Olj3BGQGD5L6q
         /+38Nkwht8CgJhrrK4NZqszbRS0XqIy7lnEX8y28t6KB5wGKH7bFwYyyPLY0hJip9wlX
         u2GWI2xeVoilzIsioojVNWS+ECDBzLr+CErKNjDMm/ms5IK+b5Vd4s+dfNWQ/He8Pykb
         TAUvNL+U4Zu6JVBo6hwwywcE/s50PqlHsN9A5v6AdnQxvmZH/L7dw6HAWtl7wxwY1IxA
         nsGT43SXv9v+CpJTwqXu5nKuym1H7+P81ND8iVhXqJbP0lZDsJyJ5XX2+BKyAeSr3jni
         Xojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077931; x=1717682731;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozNVAnxqE0lL+qF5HV2h+4/UhN7PSqlhKtJqHseh0HI=;
        b=XO1zJlJbxEdk7FruOJI0IFaNxIFiv6WW6RJNV6jBj51ZQ0zVvyDFDYEikFzP1dn5oW
         w5h6TmP7VTY4AjA9lth2cVwDaUxgj9q52EIOyzL6whZaoTI2GVMRO8TQMgXJcco0w9PN
         lwKeLJT9VNWiRdICzpIJJKUvfYH4eKkSWtKVDYovMXLxFEtln/+/DbuiDorOjQPnN15A
         zHOMvzXfKvAy+6JJxkzqONDq3JxelLJKT1F2UDT4COc4n9oEaskVBQZ598Em7mvk3/vw
         QPmDGLIjOxQ0drm5dku5/PLaWQMWIhkF5+tMSNsMWcKlQdLRV7nIh/p4TXlcHh01ZTYW
         ebTg==
X-Gm-Message-State: AOJu0YxAIRdu4f3dzNaI1tylAf5yUROxTlBPSfkb3irs58pZZVeDQvDa
	L+/7RFFYPadzDhAbpqfpTqCLwrs/1Y8sPeQ3dfMai0HQPw9PT0dPN2+UpIR4r58=
X-Google-Smtp-Source: AGHT+IF/EgUdnO2R7u5brYgNfOJ73YaN+O9YN+pDX7gvTyYiHIa/WTphpHtPpGYtAukA9aMRxwrvhw==
X-Received: by 2002:a17:906:2550:b0:a66:7666:fc64 with SMTP id a640c23a62f3a-a667666ffcemr88422766b.4.1717077930807;
        Thu, 30 May 2024 07:05:30 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a663848c9aasm49630566b.207.2024.05.30.07.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:05:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 17:05:24 +0300
Subject: [PATCH] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and
 tert PHY pipe clks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKOHWGYC/x2NwQrCMBAFf6Xs2YXdpAX1V8RDTF9rUGLZpFIo/
 XeDt5nLzE4FllDo2u1k+KaSPrmJnjqKz5BncBqbkxPXy+CFN8VZVITj+8VzjLyWh+eCyBVWG1R
 egiFXtlDBvZNwgVP1o1KLLoYpbf/h7X4cPxJIJf+AAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ESd0gNsxszqbQaloGtME7oCQ3PNGImKH+e9qTcBH1qk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWIel1xURmFNij+ie/FjjZdjHt5Q7HW7elDTa7
 lANeTceYDSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZliHpQAKCRAbX0TJAJUV
 VnMiEACLXvkhX7K/Kz112drtLnDhAMbNb6HDLeh++fS2QCXs9qI+bIjcbdPR6/30p/LtLiLWIJb
 cNK46wGJVKbF2oXJlCr4ESUl0lbRlFXM5RRafqQl8DUWiFpYkRDkqpDa3l3nSf+ola7xybzXgsY
 F5V7jgqIRTeYb4HjYsJ/3TB+YLEgejcaVhksIHEbi2Nk8Cczc0X4M9TkJYWl2oRg7frJtffiC2K
 VJAbg3WTVGwFP0a/cUK9AEqaAWLHfD4z8gk8qZDHylXYu0vbC5wtb58lpmfXTB8v3hws6qJR9H8
 O6aqeWGh8Y/L+4+O+cwtKri95vnQEmRPsTUoQrqi2SA/qhEGfTH4uctL4HXkmgLHh9HJMp6Vs5Y
 GOyiB8b8PhFXXV3W3S42oGLE194Pq/kBlNI3gWhM8a12+SUfwIwAtwrfgmEWm7E3gC12+rNLAhg
 oHqyu7C0FyXM4Bm1fM7y5WWNGdbL8tpPUQBxc6OmWe5DzwGHKTwzZL2XtNAUemLc7uGrwCimIFa
 +2dmQChazyn6oDAWyUQ8MeUOJE+jRWOwGfY+oFUOm1NpeTr0TKdXRpgosj1/eUdKjkkmtmsn4xt
 w6YLx9za4BQJKWqHIcGMX++JtUCMcrJJe+CnkZG5vp54+8ENcD/LNr13FAE1Jx/b0BIxgrdZbyl
 zWF9Hj8ix0ZoohQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Allow the USB3 second and third GCC PHY pipe clocks to propagate the
rate to the pipe clocks provided by the QMP combo PHYs. The first
instance is already doing that.

Fixes: ("161b7c401f4b clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 1404017be918..8c72fdc99fd9 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -5269,6 +5269,7 @@ static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 				&gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5339,6 +5340,7 @@ static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 				&gcc_usb3_tert_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-420a9e2113d1

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


