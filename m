Return-Path: <linux-arm-msm+bounces-7729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CF835D18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 09:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB45E1C23D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 08:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23A83613A;
	Mon, 22 Jan 2024 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H2JTazOf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF8D39AEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705913243; cv=none; b=rOpzRBiXhymEeHVTbvbez/UaUwuM3MYkc2iaW8hLSSThEKtesCuF/f2vsId3/O6g8DYXKTFQ2mX7RAnMAcYmx6eQJl0zmFN2enkcauc+ETeicAyfYWKOfJYxashwwvaZM+thOnukQcgFqXz6sVEuAmqrZewl2oh2VUG9qGgtgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705913243; c=relaxed/simple;
	bh=PuHh3PbCyA0LlLQilbmkPYe3nWD0aK16atA4Eh810a8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GEYPigQoe4CZHraHB4H5PHnSrUDprmY8uGQMqu6TxnwiLj9dDvhIGq2su8FWn03Bn84G34I6EBTattBd3MNI/E/KwcgMrobAv2AIhdNesRbOrSCr2ApFkh0pjdMZKN6OWE3X2HRFbdYIsvbiNZKKKL+84CzEkemYFxQngCEuYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H2JTazOf; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so2398690a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 00:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705913240; x=1706518040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x39o7uppt38NkcUrSwijK0oeJl+InnHX1d+Fyj766CM=;
        b=H2JTazOf0BTot0LPtoHhf+jWd2VKTt6/xgg33AVFsIgNVvpZbZDQ7deLumq7lPIr4E
         bh/UX+GHtgez9grFuPVS2dvzZyz5/7dZw+JWznltOjlDp0a0E+PNN8iLA1cJXULt1t5K
         ZRZWkQodXE/dnEI9iJFHveSycizdqwSihMsrriB2Rc5zVmnbTbAcVaVY1SNn3LleoZiY
         hVnNwf2ZJAywWmpjRaA8tXuEtY4ezfLABEhZzVVMh+qIw8cHMIY/0PUWSiJVVroz0dl/
         Zoqcll4ZPEX+0G1PfugHqFIUBsNW2XAWFbAg9V8rD4iGBrJhR512Q3wXqPROV27WKCIQ
         U24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705913240; x=1706518040;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x39o7uppt38NkcUrSwijK0oeJl+InnHX1d+Fyj766CM=;
        b=YtyUF4a1D/00hPCIPznp6PbgNB6c5ClZ9XFdnPX5UGRlkaG3vroX76pfeQy28zV1TD
         lnP8mgDVnHtKsrVQY6M62lpUgHd8eylny4afHyRs0PUOJRD/kerf59dLqZi2Ivmu88PP
         c/wM63arRNH2VNDPfGaauW7H8XRVTuZc+LE1I6P8jZRTMHVGmLrXnlMuOucWL4J7Iph+
         oit/cR53ZLJeM2K/ufQpXPpp4YPu7/9hCyf8bGNvG2miHT3t12vzLfQYDwd+9jb0bLxs
         s8MYi0yE9hqUj0QmnSiI64pu9fFuv3IhX8gok32Ie1OjdqTbxHUJfIyzrWg6XA4R8NGr
         ZZBw==
X-Gm-Message-State: AOJu0Yy1sGZxamPptnjlsqbPU+oG7/UWa8Jp8YxUpv06k1IH3tm4zw/+
	H62HQ3MM4RnvytUsHYXf23GsulfJieLk1uZ68tXVEMeRYNgJiuqlDBibXnaS5AE=
X-Google-Smtp-Source: AGHT+IE6awfpcmrylrKwFE9aaBFI7uxMe9cZn7J8roUwX5TaaK9T99ZQlI7zvDPHuwy/K7NAkbCIQA==
X-Received: by 2002:a17:907:a08b:b0:a27:d14b:215 with SMTP id hu11-20020a170907a08b00b00a27d14b0215mr2448384ejc.98.1705913240309;
        Mon, 22 Jan 2024 00:47:20 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b00a2c4c23cd12sm13075462ejb.217.2024.01.22.00.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:47:19 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v4 0/5] PM: domains: Add control for switching back and
 forth to HW control
Date: Mon, 22 Jan 2024 10:47:00 +0200
Message-Id: <20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIQrrmUC/x2NQQrCMBAAv1L27NKkFQ9+RTwkm22zoKnuFiuU/
 t3E48AMs4OxChtcux2UP2KylArnUweUQ5kZJVWGwQ2j987jnIwwb7TqA/04Oc/h4igmqEUMxhg
 1FMqtedPy7Jvf5w1b0JyX8iTf//F2P44f/H1R7IEAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-media@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=PuHh3PbCyA0LlLQilbmkPYe3nWD0aK16atA4Eh810a8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlriuJ0l53IZcMLPr1+7bSqoYv5mqCND8EPAhwY
 CkOnHbuRAmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZa4riQAKCRAbX0TJAJUV
 VtiwEADGnPGPijJh6gpXLFpi8areOxQMLPDJOWpQGrgGInW5uSgmLfVzb9+3QtPPgncP85KXC/b
 bFcWjMZpvHnTnjmYebbkRqj5dtwPEGwzCf3aVWC2HmpVa6p+YVsgY8z53nWTCq5sGjEUi3fP5oC
 TKFtdiwM+23W+1q9NSBv3RQaxSoWamtMaXlhZRXvXIeWdVUuaOH8RFElM+706jwNeWWcSz0KDdB
 5gtxKGFv+32Ai0obNJaZ9RsvsabRwWMCM+8eYf1sapex2XLELEvd2vUe7nyWgvVDnjhj6Y9EthE
 9aenwCqeLntDMo/kkLEc1lPE99h1tkyKomiRY9DRLMHcCvRbBKl0+QjVx6W+MZMxbUmpDLbL4NY
 CjlajTKHv3KLdwGbRJ3LwXZQSmUQIk+3WmT7+MWA0M6PRZNN4aDtrC2rEZl1+JsFn2HBVO9SJY2
 Ln/HPhDvWtKUXkQ9sLnu/mm/uLEh4irA3JAz5xqGRoHXvGfhAkZ5UnXa67Qmt0kTLk2dnaC5aQ0
 WiXw4ScoBhd7XWMCfG+NF/4DgfGBKUMtXamJXwI6HJAFleLC80h1Hnqbr9ofAA4J8ys8syPZXY8
 4N8XQDCYANBNV8GIu/kLrGGY7uBUCshnNHsgeLhYOrwAhLbAw2Ij2hYIrPOYKm2QNSVo+CgIpVg
 ISsS3AmftmxuhmA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v4:
- Re-worded 1st patch commit message, as per Bjorn's suggestion, and added
  Dmitry's R-b tag
- Added Bjorn's and Dmitry's R-b tags to the 2nd patch
- Re-worded 3rd patch commit message, to better explain the HW_CTRL_TRIGGER flag.
- Added mode transition delay when setting mode for GDSC
- Added status polling if GDSSC is enabled when transitioning from HW to SW
- Re-worded 4th patch commit message to better explain why the
  HW_CTRL_TRIGGER needs to be used instead
- Drop changes to SC7180, SDM845 and SM8550 video CC drivers, as only
  SC7280 and SM8250 have been tested so far. More platforms (with v6 venus)
  will be added eventually.
- Call genpd set_hwmode API only for v6 and dropped the vcodec_pmdomains_hwctrl.
- Re-worded 5th patch commit message accordingly. 
- Link to v3:
  https://lore.kernel.org/r/20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org/

---
Abel Vesa (1):
      PM: domains: Add the domain HW-managed mode to the summary

Jagadeesh Kona (3):
      clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
      clk: qcom: Use HW_CTRL_TRIGGER flag to switch video GDSC to HW mode
      venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode

Ulf Hansson (1):
      PM: domains: Allow devices attached to genpd to be managed by HW

 drivers/clk/qcom/gdsc.c                        | 54 +++++++++++++++++
 drivers/clk/qcom/gdsc.h                        |  1 +
 drivers/clk/qcom/videocc-sc7280.c              |  2 +-
 drivers/clk/qcom/videocc-sm8250.c              |  4 +-
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 +++----
 drivers/pmdomain/core.c                        | 83 +++++++++++++++++++++++++-
 include/linux/pm_domain.h                      | 17 ++++++
 7 files changed, 169 insertions(+), 15 deletions(-)
---
base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
change-id: 20231101-gdsc-hwctrl-13f01ea60cbd

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


