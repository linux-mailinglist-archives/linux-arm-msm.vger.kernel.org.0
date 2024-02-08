Return-Path: <linux-arm-msm+bounces-10161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BC84DE9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C511C2545A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9D6BFB6;
	Thu,  8 Feb 2024 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUWIHf+d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E1F6BFD1
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389464; cv=none; b=CYOn+HwTlY7ESq0CP4XCiWHoF6Lspn6ebzYsbzlqz8Ayb1FvBAxnxlpog5NvxyInmI4XifNC2TVRlt+Ilf1gq6jHDPBVcr277n8USvw+rF02mFxRj/lHKbKOyf/co3bq2lDndjgV59xb1Yw0f21BbGA7Nkg7Mj/I+jKtpPZKif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389464; c=relaxed/simple;
	bh=IWArNLZ3xDrsSDqWOXDxHf5p6Q90JkYqIDCD6gxy8vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjgaFgHaFQH/eEOeV0ky33e1EVCSeQaN8CKEdm6HCCAA+yuLmNPrBXNGiPq8DzcebKL3ePfBxnEddsfWTLOrkwxpA1mWgwlwyKV2SfoR+Lv1iyVOlwAnTpPC8j///WCsXQsnyej71kHsIZ0U+4bwA+UkzUkFoX3MbWV0IShcrNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUWIHf+d; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33929364bdaso1099077f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 02:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389461; x=1707994261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5I3l4WhlIWRRaOY916CuXQO0MyuJYtjuOqUh0/NNez0=;
        b=uUWIHf+dMIBKNxzXhe1ua0ARaTqOqGlmBkh8DC2gP5I6Bj80nPXl9Faf0qScKPqtv6
         TEeJvKK9+TH1Cy5ooBcG5hVVgDSNBzG4EaTtKj3ITNfHl8hXFTFblcMGEyLIPvKvmKKI
         5eSCcBkk2dIWXJm9+ZivTufLFolJpcjUlPZKpezlzVMuMrkPQrYCTKv+z6ulCeXy4+vy
         Nzfioq4+bxsltXUuTEp7vhIn1wEAlQPUGTypTDr8/fPeiHvc6YKcK6AvUvsCJJQhX8vD
         RI2KvXgwAM9TRUA6NOYAFIVMqryw/ifrmSwY62Q62Stpxsu9IpwzNFC7YyKu3hAfxpAg
         XACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389461; x=1707994261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5I3l4WhlIWRRaOY916CuXQO0MyuJYtjuOqUh0/NNez0=;
        b=QSd4tldeueZQIol9XVRVIasnAovyAyDhiv+3Upu62fV2tdWzhszP7jOEOoYg1pG/QJ
         ajXS4Phg2lnWf0FGfpjTzirTnBtH2Es0WEZBUSTuM1Zh6VEg1gXSFZAR9YT7yp6oH2l6
         8Hl4/jCDBbRQxbtVdF0OgP85qEWwgulh64kT5x7Br/H8XVRXOfuAwPjz0/n6BWr69W4i
         rFR+PURdxb/wqBUUBGVMB5+qAEbFux6czEiT/EVedg9R80cXPMh6dT2/xDIfQpTJcBmH
         YHXR2BPiGd4WF3fgkKz9g2yeMB0LCK3jjgacihZEQjhRaWxJYFtYlDD4rRKY+mt8Hsfw
         oKAA==
X-Gm-Message-State: AOJu0YyoYrWSfn/WtaLrf/TKKyP9LvPfQg+RkiOrvYZHxUWgQ/uPeXSd
	54cqqc+7Oh9Ki7Jv2oLeG8aEw26giWB4vmUk8Vj33Wj/Tx6nO/cfR+8lHzp51fo=
X-Google-Smtp-Source: AGHT+IHm/6oo5GLFfJ1rN3KEeBopdXbRtYFMSOzZXcsC9Y77R7p2xScPw4PyeVgNgev7Lo2FxEtG8A==
X-Received: by 2002:adf:e50b:0:b0:33b:4b01:cc94 with SMTP id j11-20020adfe50b000000b0033b4b01cc94mr4910006wrm.63.1707389460848;
        Thu, 08 Feb 2024 02:51:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhHJbwEUhsihpmwTQPsy9/9ymYTz3BnBONguKKNuGhV0fbeRQbqNX/jwLlp4yEEM5Y4Wk6DFJhneAwhrkitJ5p/U+wwrm1WrHn71cgNWvniWWVVTeAdyigoUUeXFNmbuFMs4U4QpwW4xAt6daWKPu8OyTODifkt2fbAZBnLmjbNDMY0bMzekfwPoF48XGMWTiqYYnEa2UghIfeHfrG5HSpC9cAeFuAVJm5uLOVLbfRcjkl
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d69c1000000b0033b4719eb6esm3308283wrw.27.2024.02.08.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:51:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] interconnect: qcom: constify things
Date: Thu,  8 Feb 2024 11:50:50 +0100
Message-Id: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Still some things were left non-const.

Krzysztof Kozlowski (6):
  interconnect: qcom: msm8909: constify pointer to qcom_icc_node
  interconnect: qcom: sa8775p: constify pointer to qcom_icc_node
  interconnect: qcom: sm8250: constify pointer to qcom_icc_node
  interconnect: qcom: sm6115: constify pointer to qcom_icc_node
  interconnect: qcom: sa8775p: constify pointer to qcom_icc_bcm
  interconnect: qcom: x1e80100: constify pointer to qcom_icc_bcm

 drivers/interconnect/qcom/msm8909.c  |  6 +--
 drivers/interconnect/qcom/sa8775p.c  | 56 ++++++++++++++--------------
 drivers/interconnect/qcom/sm6115.c   | 12 +++---
 drivers/interconnect/qcom/sm8250.c   |  2 +-
 drivers/interconnect/qcom/x1e80100.c | 12 +++---
 5 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.34.1


