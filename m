Return-Path: <linux-arm-msm+bounces-74181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E84B8967E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 507E7163805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1792F310628;
	Fri, 19 Sep 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N13wDTSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3E30FF08
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284259; cv=none; b=lsE87WONTsrZUoHeqe2PYq0arv730zA1sC2B2a0bAz4tf41OVvj+Oge176V6Zagn7L5gwJD8AjGxzxNi1i++xpuyLKvMdva1y+K96VNu4BCiLwHU6fh8lOC9gZroqpLnhMY4k9RYu2ortYhURGT/H0H4gbBAnW9lvOMuV2koJfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284259; c=relaxed/simple;
	bh=SdGpmTC+LKgK19BvUf9yW/Fp11UDvjXE5sjy2+/Mh/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmiTfAx3QGCucp0EoiUCZnf5QEm7Ob0TiK/L9/ifDzG8ErYZd6c7i2owcvsvWVCmLF7Ux2MoLjkvp/Rsp3HB+bp5K2gvdyJqkap1NQgL24nw/r5wypeHN5lWF4jzxMNkH9jbv4AUXPHxAbYo25yqf9D8aF/DT/SBK77YJ334nXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N13wDTSK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so15957755e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758284255; x=1758889055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUabflASE+6vplUQ9XK7OmtiqdkIjEnnJBBKIE665XU=;
        b=N13wDTSKuGEC7T9IUf8q9QMjScUAMoyDrtTEVXXn5kXjxD0WIAdHGpx/6U8/fb4T3J
         rOqCnMHr9EXRXrkbCowCppmytXdxtuj8ppKQUHf08DUGPQ8Ap8qZHWlBXslfE6zx0wLI
         uEexYLDIWDtQrlhXhJlagpBmnBBd6nfLvjRTSs3oN+G44kKlYZDu2i4fdGCTDtZnzLGv
         rLu0VZYZTmcJlPWq9Ik6xyZ5id4YJ5HQiLKhzO/4CfpTqHxf+qGH+daQ6A28FoCPpptZ
         PujqIkLMFJn6sth3uvwzWtWYt1/j6Rk5OTovCmPukR5ik2ZddyCtDJ4gVBB6zGAN0MpJ
         COHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284255; x=1758889055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUabflASE+6vplUQ9XK7OmtiqdkIjEnnJBBKIE665XU=;
        b=M/Soohk81vb8AnRHWQkBFFH/9rle78RSMI4cf+gJ1NSap1/gjLIiWzsb16OvDGJ5mI
         MvNPGVFQaUWkgS4niv53N+ZKu8Kpk5CbsPH+RXzF51RhT2yfka6cFdv6NNNYMG0NPQWV
         eSjXMhD/WyY/KL2YJZXz7LBBW4SBfbKeetqm3+w09SRh4372km9KNWbGT+Vzh5MrJvCB
         qSqO/XXPQw5s3ESC9UI7XEWte0qTKKP0wNN0Y7Poc9sCkT+nIn5UKFGaxlYn8Wi3F9ir
         79DpbVFCLHGJjZepWlhx/CCrKT52WvQNUuumZ75PNx5gR239nu3mA2eeWjpewhv2RSeh
         g6yQ==
X-Gm-Message-State: AOJu0YxDtUxuTVC3DBNXooATG5J8vDazT5340gxnjyN9oV13wkCSk5JC
	HlWN+uNtd2r27NVwm9TvIs0yUsgFH/xYviw667tavWn6SggOB3eMqpQ1bMsSJpjtVZw=
X-Gm-Gg: ASbGncuM7ftVm/m3HImPbCMoT71mJHTdbvlcLv10FTMBDr9g6478bp0nJ92SZv8Rhr2
	7ypMU5eHUzIdwFFdQNNz60JCnXEYh4T5TsiNIiI9aKzVmnm3HZdI51CdbCilzXDR+ZQ95H7RnvN
	NxmY3il8T7dilkyJZgLU+ex1mdwHDYseqQEyzoPIR/RS+Q6UtdrfM0E04cgOescmxbgxbu79MGH
	OZWIJSwATjCXbNx/oqshUyEvdwUBu5qmUzRX3oysLe0LVcsl9Z3lisvfxwPK0JnmzpNB4ALx6YX
	udhKRslEFOQ+zajjQODDzqsgp+bsHFBWMGM+8p3Zh4Y1a85SWOJWI03eMNW+ME7hETREt7NTVeX
	lMpk3WEBoykTXy4jSYXBym2KUWuW6a2ay0A==
X-Google-Smtp-Source: AGHT+IEm1zNvRP64p97SmF5zBsPRhlOyd1TYwTgUAKfJzmHXRryQz2eEQp1ibm+E9nxfvdNNjZXkwg==
X-Received: by 2002:a05:600c:450c:b0:456:942:b162 with SMTP id 5b1f17b1804b1-467aad1449amr27743565e9.11.1758284255454;
        Fri, 19 Sep 2025 05:17:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf20b9sm7655176f8f.57.2025.09.19.05.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:17:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 19 Sep 2025 15:17:11 +0300
Subject: [PATCH 1/2] pinctrl: qcom: glymur: Drop unnecessary platform data
 from match table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-pinctrl-qcom-glymur-fixes-v1-1-426ea410aa94@linaro.org>
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SdGpmTC+LKgK19BvUf9yW/Fp11UDvjXE5sjy2+/Mh/k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBozUnZt/5qTrvt9MqqryKoaUxqZEtIcboDQe9mC
 xiCPJmCUYyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaM1J2QAKCRAbX0TJAJUV
 VrB9D/0SfiJmSN6tUAyB1JjcJXXAi+YAm7WkyEd8CMsJeZqH9d7L0WrmqevyoZNGlGSAJ5EiVOG
 xeAmzB/smZ7T78ItnJNSTp7w2MbyBhL1jBRPm9N1EynAoPKcnbeZuFPNLkLM8uGliVZXp45Z1E2
 Ej5fxzrfFZt0ztCBB3NGXdkbzEegPAtsltOiLCOYWOwJJvanvJvaX6BgCHv5aKFzMEeyduh90pc
 BcwaWiH3WowOkwCn4b0KIW+QG5dfAC0NMGEeogNggJ6R6wS8YUKFBqp2Tqy2lr6mKaIe3+PFRr7
 nA6i6tIF2XLMiIwXgl4ZgqH5yfynNwDmwqFJypvE1apxy0mnDNvGol36lqLnlKqYUIVxglkuo0R
 z9vhZmHmZTJ+5zUnPYYyvHVDPnS61d+hHG/AQ17XV1sGsd37yZmAuFckwkt8PH8ezQm2E5PNNF/
 0pANEnTP0rerApK4ZZ8QwKF421fZKCzdF/yy7h5un3u3sbJ5TFGRWfpvwYuufYZ1sQvxNmNlmT7
 BB648NQBY8JRFl4kzvSwvIKlo2Jk009+rIm6ENEM6qTfS98tZMVrmx1S9knPWm20ATzPBBx094F
 AP40cGySErIA5Ad9Gr2CPq6vt1KDZbhOaNZwKF2Y42uui6qfS9NjG/mTSa/AgDTukIQr+sKu/nN
 97ptDmOD+XNVTLA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The platform specific configuration is already passed on to the generic
msm probe. So it's useless to exist in the match table next to the
compatible. So drop it from match table.

Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 9913f98e953110d32e804c8d210220857583ba46..9781e7fcb3a11c85dbd5497170188e2da051215b 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1743,7 +1743,7 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
 };
 
 static const struct of_device_id glymur_tlmm_of_match[] = {
-	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
+	{ .compatible = "qcom,glymur-tlmm", },
 	{ }
 };
 

-- 
2.48.1


