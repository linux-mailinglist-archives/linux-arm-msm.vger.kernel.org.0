Return-Path: <linux-arm-msm+bounces-6469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB5824423
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 15:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA861F22834
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E4D23758;
	Thu,  4 Jan 2024 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rT0trL4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805623741
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jan 2024 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5542a7f1f3cso751639a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jan 2024 06:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704379947; x=1704984747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZIogcHqx9uTCJq4N+XqsoGveT+CoaQkQRlLlJgbysk=;
        b=rT0trL4T+rPH20VUfXhX+AJENp6UiC0NJ3ShflemLgDGYmV/5T5kCLCO/IyR003m7f
         Wc1WcsGTY/xY6j4QRXXuhUZdv4ihScZQwHFqCy26hH8hjkkjmAdQn453LD1DQSY029PS
         5Z17HxJTOsm/RNR0Cmq+gmsyfGzS3E4g9Q8chCfM/tR3BlEbIMsqXm3qLnuLLZQJ1M6D
         4pdChcNKfkM+Xx3zR6PkcbJfMjoJYNyjpDcMnutz0h6HB1HDxYG7Ap/DIM3yxhsQ8x7L
         xtdDJhQ21wMB5+fN4t/PJu7YKati70soKRX3aPYht7QFhriCWbC3mDrxR10PMYSgCRw1
         bQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704379947; x=1704984747;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZIogcHqx9uTCJq4N+XqsoGveT+CoaQkQRlLlJgbysk=;
        b=Z2UDGIuN5mCKJK/faRCtXH3nve3tGcm7Rea1AzbQmu8EHIgIxzQHXq8ODDzEbwufRt
         jAjtYWwTNfFn5qAEJQpxPiizvl8Lj6z8v2Z0O9nOJWaovGY74p/qhYKwXQCZ/v2mCi8u
         j4W8zoRIW3JHmT0zHpBVdGdk5krnnT1wMviOzK6QGeu7Gx+Ty2yAaDPOA0vtix8fu/wg
         yCHJVocET9q9y/yz/DAuOClDbkohjOYqKtpGfXQ0kC62keBIuo5Jr0gAufTIiFYRgMDh
         Y11tMltjqWqYm7kbQSvXHsLZHl34hf+EvjXWGBy8VNYLN27cSahVxzzxUsa7G1QSfhh0
         lpbQ==
X-Gm-Message-State: AOJu0YwqkS6HmGuud7+2ijs1ojEfeNVul+bZkLkPDJ/CUXRKo9e+Rj2g
	v5TPSf1OZHm9uUaf39YxIL5GPfkYUG9rTQ==
X-Google-Smtp-Source: AGHT+IFXAx2ANimczd8Sgl4948w4u3Nl18N4rN5i/YkygdtqRa/cmktNNtOAN3WAuyYeZwnltT6Z0w==
X-Received: by 2002:a50:c259:0:b0:557:c43:1e51 with SMTP id t25-20020a50c259000000b005570c431e51mr311959edf.23.1704379947335;
        Thu, 04 Jan 2024 06:52:27 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id k24-20020a056402049800b00555e52fed52sm7970592edv.91.2024.01.04.06.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 06:52:26 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qualcomm: eusb2-repeater: Some fixes after the
 regmap rework
Date: Thu, 04 Jan 2024 16:52:10 +0200
Message-Id: <20240104-phy-qcom-eusb2-repeater-fixes-v1-0-047b7b6b8333@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrGlmUC/x3MQQrCQAxG4auUrA0kaTd6FXFRx1+bhe2YqCild
 3dw+fHgrZQIR9KhWynw9vRlbtBdR2Ua5xvYL81kYoOoDFynLz/Kcme88mwcqBifCL76B8llb6K
 qvfRWqD1q4B/a4njath9VivBTbwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=639; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=c+pvrccSCpOgqh7ydKwxbBRfYF462jh89UpoQ5iwwdk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBllsYmbj67PZ2TtbJqISo/ydyuy6XlIWLzEi/YC
 RLLrn2b6wSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZZbGJgAKCRAbX0TJAJUV
 VtK/EADFV3NeX2ydmpryOIbecPaE7INDEqVyyKUK0wmtewgsUL+Z04L7kGWr9dB42XrpBKSjr3M
 /io8L/lcSjgBSNHQP+NZCD+4t6ce1kyI+GmPxg/A/1CuI8QARQr8eKm96/hOw5c+M16TshuYy6t
 VERh3FlNrt7JFRa1eHQfNUrVPkfyVzfGwIo7hjyBpadNB43yBamxlWhTBIxsR5f5WW2S9/KK/qA
 NCgb+3oqLR5pwe2fEAm+Crrc1QZjX3necfvdTf2cCcTANUJ8W07OHPeFaLB4P9bVuhRdXQU5+Bx
 Wn4eJCcs17xQW3i/ATAOn7NX8/3vY1uiXdSPJ0r64SF4BDKOicoGXH3Ej8I2aUJyKYWMAQUZ31N
 /0bRVXCd0+0wLiEZDLj2WpQu/jQFZypgbZX3Fo7oiM8taOYDEa60ati6YivJj2CPpx6/rImiS6q
 njArJwRyZqNFUduN8gFFZCPtsluxUUG5k10IMpnwS4BXn/RdhM8Ce83y/vUdzCfe1Vn2g07ZSpD
 eSQAQh49FK1UfBR2LCsVvEEcv15hhu0bM6xGr6Aaus1Wi90efLSXg+njYRWnAk7sNrkDVKITTIy
 PL1Q6l3q2GUn+DVglE7rUcsuje8Ylf+Bvs5tpUKM472dt1Wb+4Fsr/XwzOWkfV4/eYERjR4r+9I
 ySvKGnl1XeZlUkw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Found the first issue (from first patch) while adding support
for X Elite (X1E80100) which comes with more than one repeaters.
The second fix is just bonus.

---
Abel Vesa (2):
      phy: qualcomm: eusb2-repeater: Fix the regfields for multiple instances
      phy: qualcomm: eusb2-repeater: Drop the redundant zeroing

 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)
---
base-commit: 0fef202ac2f8e6d9ad21aead648278f1226b9053
change-id: 20240104-phy-qcom-eusb2-repeater-fixes-c9201113032c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


