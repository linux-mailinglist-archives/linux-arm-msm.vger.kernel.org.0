Return-Path: <linux-arm-msm+bounces-18373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FA8AFDE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 03:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3AD01F22E92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 01:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C5FBE58;
	Wed, 24 Apr 2024 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmLqbMMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9EC79CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922774; cv=none; b=ZEIRkbLwiajnmLmkR2m8b+0u9fJkGAlSVXIggnX2o6VWZ83rj8jFz2oFX/ruhZDnITZhkXtKAlzsTJ3PbSoXHXnyBn2wU58X8RspLV8pQ5aDbB9In7URBKKmn+32j4smbT+SPB75Zd9uQWM3zzlSwEAN06POWhWvOI0HSm9x9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922774; c=relaxed/simple;
	bh=5q4NhWGDdtCddnYBrTLpMflmM72w85gXkEVwAtxbGEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RzBPTi4JslfuQBOvmygIzVCsmKSMUTjd+wTAqV58WljkL+qifBZgLejLVE6aqngMbhdAjNZJHDcG/kbhuW8CoToo8xGxZxwx0EB5Tnj35ywu+RNaXPl1omRLgASyu+5hG5NrvPb0sTc36EN2by2V1UWbkAJBwkvadGpWzAyHmxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmLqbMMY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5176f217b7bso10639882e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713922771; x=1714527571; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KwrOu+mn4qUHUoF/ypvY6dT95fqwOQv7ZBOs9tgmqQ=;
        b=VmLqbMMYZ0YOc4hNa53NFBaDQqRABSpeR+oaA3Q/3zZFWK3VJdu05MyQ9mOEto31Cp
         3J8fSHxNOjgL22iVkqkDI95MKIdTtGjTdlZGGcs0ULub77O9XgV4j3EVecdDELKFEz2O
         4UkDa0imy7hRGMswG9vTaLGbEHDDArCax5dED8A/hMczy/OQzh5a6FlRasGabMqwx4ZI
         in7CbjpWmgpcjtnl7YHqKWKOnIBUiicpWELeA/ZSq6IK3qbBs0bD70nYjAq774n8q1gX
         mrMhAxRoUlogXDcV/5LKf/YxS/0A9LdA99HIcGKjXvI8JkUOfQPkNUIjlA5caIJp2q8a
         Tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922771; x=1714527571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KwrOu+mn4qUHUoF/ypvY6dT95fqwOQv7ZBOs9tgmqQ=;
        b=FQazg3wFJlgYHZbpET3l3hFz5fD1jFenVMjD3kMk5UqVyV1qvWCw2RT5Al+Ytck79c
         QyDzEioAiXuGuHxo9Ik/mTuD5n1x3150L05k1tmPH0VqhaXj2oLzFnlaWU0mXEP/2U7M
         ByDfyFXywKIyGGvNyl+CzVoMwroi5kMuSow/7It/29WcetqUeXPCCZObKKS3rYiYidwC
         NHN9xDnMpVQvcFsZo6iMDLq3R9vnyTTTJ83u4e04u2mVCJFzo3s1g8xRBURz7P2kMOhZ
         3gEKxymrTKITZ92rh5bUBeNrvXyacpyWKztS3YPqPwLMpBFJNtkDQco4oituZdAyn+IU
         7BOw==
X-Gm-Message-State: AOJu0Ywqh+SIZqJvAeAtS2HbGCYVldQj6DfRY3d/h0PCs12VFO+4a41Y
	CloUStqvfEsPWkeGTD99gRMq62ej/E4NWlGGa/nU5bIkI+iANhCMQcV8D6RyiZo=
X-Google-Smtp-Source: AGHT+IF8zBOyGz3Noyn42UlTQ5loU9u6fXXbczhZaHr4EsPsGAEx7UMM64nPsYzL54r+KCNElZRF0A==
X-Received: by 2002:a19:c50f:0:b0:516:cdfa:1802 with SMTP id w15-20020a19c50f000000b00516cdfa1802mr902338lfe.63.1713922770880;
        Tue, 23 Apr 2024 18:39:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b0051bb40c7ee7sm308220lfc.185.2024.04.23.18.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:39:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] clk: qcom: dispcc: fix DisplayPort link clocks
Date: Wed, 24 Apr 2024 04:39:28 +0300
Message-Id: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBiKGYC/32NQQqDMBBFryKz7pSYJmK68h7FhSSjDpUkJEVaJ
 Hdv6gG6fA/++wdkSkwZ7s0BiXbOHHwFeWnArpNfCNlVBimkEkr06DhHa9FFtFuwz4yaSDttZHd
 THdRZTDTz+0w+xsor51dIn/Nhb3/2T2xvUeBsSCkjpJW9Gzb2UwrXkBYYSylfR56dcrEAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5q4NhWGDdtCddnYBrTLpMflmM72w85gXkEVwAtxbGEs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKGLRyzBa99J33q+8Z6DCW+4lilQocSB7nffpn
 FCboN4blTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZihi0QAKCRCLPIo+Aiko
 1YnoCACLmzG1j9xY2nu07YENygnT/QelXsxKYBwzQUwelXzhbuMP2MZiC1ngX4WZbJgHySAQicm
 hsao0mB5I71GJKpNXVXD9yB39ne5p7s9XGik9WqEQQ23iU83gAfRg4NlCxkdJn6EVdWamg2+neo
 H+cXbtjz9H88YVS1XhoQuSjBEdGJpeAHbsCgxB5zeTxwfXqpyU8oIP9bBuky3dfH2Itd3WNKYRA
 lb+z1bnNkzEWgnP/oRmBEkLLWUCzU+k/wdZzjHgUpCXXy0qxkMpmhJ4tDYTR0diqz62XLkKX9dx
 bjOqeHEs7Pt4ACOwWUGRalPkx964xsiJpz8RwyOIRV8afpOq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On several Qualcomm platforms DisplayPort link clocks used incorrect
frequency tables. Drop frequency tables and use clk_byte2_ops instead of
clk_rcg2_ops.

Note, this was tested on SM8450 only and then extended to other
platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expanded commit messages to mention exact issue being fixed and the
  triggering message (Stephen Boyd, Bjorn)
- Link to v1: https://lore.kernel.org/r/20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org

---
Dmitry Baryshkov (4):
      clk: qcom: dispcc-sm8450: fix DisplayPort clocks
      clk: qcom: dispcc-sm6350: fix DisplayPort clocks
      clk: qcom: dispcc-sm8550: fix DisplayPort clocks
      clk: qcom: dispcc-sm8650: fix DisplayPort clocks

 drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
 drivers/clk/qcom/dispcc-sm8450.c | 20 ++++----------------
 drivers/clk/qcom/dispcc-sm8550.c | 20 ++++----------------
 drivers/clk/qcom/dispcc-sm8650.c | 20 ++++----------------
 4 files changed, 13 insertions(+), 58 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240408-dispcc-dp-clocks-5ee5d5926346

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


