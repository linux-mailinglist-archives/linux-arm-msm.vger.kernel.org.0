Return-Path: <linux-arm-msm+bounces-29351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AD95CCD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3CAE288698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E059185B65;
	Fri, 23 Aug 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnyncHNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7928DA0
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417491; cv=none; b=kZg3gRmTz8XMrg80PXkr88hkzbu6yrZvd5Mz5oRhV4DKZZwnyXYjCC6zMlnwB+3fC3Ns+XVluuHrC77Vz51ctgRcnZd5F4RSAT8Uv8aljsMlXVBCUaf3LNi2hNAgXokTIzFavxQx9K50w/uvPHoPgmqg/s30ZyTfayvbm4mw5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417491; c=relaxed/simple;
	bh=doKufXAKMRNCsn5SPLoA4KKhEyeldEXGGKtTRg28kUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DnFkB3PE68KLKPI2J3RAz50KlFZoYcRLCEs38Ds/9zxjcZqwApBpEvqp7B6ttUhrdthl8sS0mNrYvcPbN7PtsncRkqXljwLOeMCImlYNL5ZrmwJAo0cc03/ZODxpRGPQuuhAqpP4lNyrSldYFJCYuVp2ogrJAN0OFbojFjBIcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnyncHNy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bef259a71fso268908a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417488; x=1725022288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6VRAUboa3WzQTgQJ0jIxMCacKDHDbO46atHYsrK+XI=;
        b=fnyncHNyPBRielxqZM3wZE5hhWkmxXWrDU9XahsJRtlswq6+2RAe6v6Sbp8DStEAGR
         y8lYd3Lnj3IFDVh4kPocLR6t5/tIB7cKHTcZ3K+Ri8omQNvPzJPLFSAZ48ZJZVcZPH6e
         OZNZlCSm9ND+G/DcOefdeiA/sFhTiOSqQbTchziz14XLaxQM6qdyMyMXgnjuXbO8B4pW
         TF/2mGTwRG8k6OLfXoJsaaqlA7U3sgtgnwNJPU/ttnWSfoFp1WT31MfwUxZZ+MGgERMR
         OE0js51PmQ1qzk3i9RP07l6YCygE/JL21H0gaulyMkWRQ0kR9mQZPbte0JtPt1dYcwx2
         6Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417488; x=1725022288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6VRAUboa3WzQTgQJ0jIxMCacKDHDbO46atHYsrK+XI=;
        b=o281X1LRAJVtqSA4xK1137Mv3KqpOe4NhC6eng57InMp8sRaLi6aRYrHyyu6Kb4Ln8
         IQWmA2E03wBnSO2HLyHBRNKE6ZA5KN9liQjg9AdZpoiHKsPbqT9pZnOlU22PuOO8sLAl
         cFDeiQM+4oHOa3CYyxapmfvQrY9Db9YIUXl3ahnPUCFh8rjot+E2BHZE3cGg4SHCL3pi
         ipC7aEA8CeXmj5MOtVHeR/Jd2CseCKpYYwGLX97azrTghwdqwkkmpAAjdUJMecwyXvqk
         Jl8EqEJ1GFNPicJCnlMDgLaKmpomE1x5FUxqStMxXMAUpXZ92nnxYsaxPwt11HCFQuFB
         ZBtg==
X-Forwarded-Encrypted: i=1; AJvYcCWNQ8umc+jIGxqbfaeKCWh71QUziaB0O/w8VkUBTwoPqpuhn9kyZtAn5h+aca9aZpfi/EGY8qa0yVBJl2wM@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvIeYy3XOUn4o8oXDyh9/p/yXaktWx1mPppPQ7dHDcVt8ubba
	lL1K04M92YZ6QJqTleSuGfATDFF4ps3YqXtxiZG8wf3QBZnVl6mLQT9UBWYCxy4=
X-Google-Smtp-Source: AGHT+IFIw4ZV5rZ6uPAb4nJL/OhmF0EN2Y+olYkcjQZWRyRIZCTqIZuXXX1ufsuaXoLSxxzdDu3Uwg==
X-Received: by 2002:a17:907:9724:b0:a7a:9f0f:ab1b with SMTP id a640c23a62f3a-a86a54bb7e9mr71228766b.7.1724417487610;
        Fri, 23 Aug 2024 05:51:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] pmdomain: Simplify with cleanup.h
Date: Fri, 23 Aug 2024 14:51:04 +0200
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALiFyGYC/x3MTQqAIBBA4avErBsof6C6SrSwHGugTJQiCO+et
 PwW772QKDIlGKoXIt2c+PQFbV3Bshm/ErItBtEI1XRC4rKT8VfADdfLRIvhQHsehj1KTbPqWye
 166H0IZLj53+PU84f0fUIrmsAAAA=
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=doKufXAKMRNCsn5SPLoA4KKhEyeldEXGGKtTRg28kUg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXBrIW/SnJDYANEVfUZJeHlBLPHoJYAFcIls
 LKf1yo7+J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFwQAKCRDBN2bmhouD
 10UID/9Be979xbWnI1yNlRdhU3gmdGm2uSL6tdqrVpXd81h6X7rzBxahTfI/Hzqbt97F/oueKjk
 j2CZtKc4mia7EB0naYB6Y2kYe/UYMX7hzF5nBqcZm3y8GaKUiS5Hnkf6osuRobTRmTavNDPc55M
 tYm6P+KvXABS/esDPWw5kNpcjN2MuvAY7oZXwM8/pJ4VFAzVuH8agIayXftS3DQHLjfiLkSKlVo
 HJs0moMNU2y8bXR1TQyyLdYvVFSBD4Nf9qtEzxkZmsJkqwRx5z2JZd6dS+Pm8JzFVG51YgNHvfK
 dRT7vceacHyYZm3q/1e+eHlU0u78Ap9USdAlPpoqIlXOq1qkZ0v4vGyfYM2TIMp2i9Mc8qfUAyN
 sjrpEmfY3Torcb4TTe0BI4EZAGKS9MOAKUNjZpyM9bZpM/hJAwFMaa7aTzHjt/qgQn4Rt9mtWTF
 U7YDazP9uDvq7Xy7sbYqPtLVBXnth2hn0+XPGjcgaq3UU8gPz2rfpxEQX0t9UiKyrtsHAbdtH/y
 n5ggehcfh76LOc2Qr/lQErudzXIqhDm4SibFNAsH24bNzONwGdSJHQ0xx6WxWr7MpHEqG0XxOUd
 AgbTG2xDIIdB7MXeKSlddcEt6AG/9fcfCaJ9ejr7c4rYlUL+9RdquPPiuJUcqy+/SEGpr7bbC93
 DHJTA1zS+8Bow6g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify the code with scoped loops, guards and __free().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      pmdomain: rockchip: Simplify with scoped for each OF child loop
      pmdomain: rockchip: Simplify locking with guard()
      pmdomain: imx: gpc: Simplify with scoped for each OF child loop
      pmdomain: imx: gpcv2: Simplify with scoped for each OF child loop
      pmdomain: qcom: cpr: Simplify with dev_err_probe()
      pmdomain: qcom: cpr: Simplify locking with guard()
      pmdomain: qcom: rpmhpd: Simplify locking with guard()
      pmdomain: qcom: rpmpd: Simplify locking with guard()
      pmdomain: renesas: rcar-gen4-sysc: Use scoped device node handling to simplify error paths
      pmdomain: renesas: rcar-sysc: Use scoped device node handling to simplify error paths

 drivers/pmdomain/imx/gpc.c                | 14 +++-----
 drivers/pmdomain/imx/gpcv2.c              |  8 ++---
 drivers/pmdomain/qcom/cpr.c               | 58 ++++++++++++-------------------
 drivers/pmdomain/qcom/rpmhpd.c            | 11 +++---
 drivers/pmdomain/qcom/rpmpd.c             | 20 ++++-------
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 26 ++++++--------
 drivers/pmdomain/renesas/rcar-sysc.c      | 28 ++++++---------
 drivers/pmdomain/rockchip/pm-domains.c    | 25 ++++---------
 8 files changed, 68 insertions(+), 122 deletions(-)
---
base-commit: e188fd67a69319f3d105d9b90e424b8d1ff9580c
change-id: 20240823-cleanup-h-guard-pm-domain-35eb491f35f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


