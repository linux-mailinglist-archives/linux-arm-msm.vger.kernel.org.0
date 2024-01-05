Return-Path: <linux-arm-msm+bounces-6505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A299B8251B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 11:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3378D1F2154B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6793C2D62C;
	Fri,  5 Jan 2024 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/nyzYEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107322D615
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1915034144so160301266b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 02:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704449788; x=1705054588; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEdYVhrehgTxb2xPeGPy8ZmHUEqPAqYAW54ixn4xFbo=;
        b=Y/nyzYEZ80RacohYjsxkrkDNxwQuQjKd/VrBVYrfvXqQAO0MlHT5Wzd8YKdt49OI37
         DO4bjavXH+Y6ei4KQByOLAREiQRcf8Zp/EQQyaAjHuByyd6N/PZhbfwANYawFx11mnHe
         2iLp++xug05085esCafMtuISak/muxSH4tlmFHHFgo2LN2hFfijnhiVXMTj1dl2cPhnj
         4A1Nsa0o7jYxl0OZVd+xi3u6AobQxx+ARJFT9jkKgplIw5BoIf6jit8HBVur9t/Q9vp2
         hCoy9EPNf+cSSQuItOqNT05TsHEggY8vUz3aiR50zyM7dHteZvTl9LSxM55Vj2GwBimZ
         S3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704449788; x=1705054588;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEdYVhrehgTxb2xPeGPy8ZmHUEqPAqYAW54ixn4xFbo=;
        b=ra0y/zhF3XMwJnJiYFq+45QoIzOlmSttJhTw1tmWxGAjKN65shUD4vhhCnxSdgL5Jp
         Bcci4Mbe0hmDb6Hb2Teaek9REwwU/pWW7e1jZI/K9bdVnZFjW4XKC3rmie3/VOueVDPg
         Qw0TEzCEmA9pjIXhGqsOvPvzzcUBfVXFvcPwdSzQb6YOKn7Nxyx0UFHXxkSnryPDMrgR
         p2JpB++bjgTqQKR35TkaE9RhjS1wCiK2WmL1vZEglgoEWvCRUCt2/QYU9naY+KNfSlB7
         Lm1Ht0fg19ViIvRrFC0oAtbDae85eC8A4TvFjT0XLDU1XXDJqbmXQ8Q8Nc2P8lsVL/9l
         zebg==
X-Gm-Message-State: AOJu0YwSLpY+3MdYLmJm837HTcq4T2DrNdsV6fi9l7O2hBqWgs6oHzXx
	iUExtaZrMD0x8DrKOo7fuNdWDIZsvFRNicQ4inWIC7imijo=
X-Google-Smtp-Source: AGHT+IHXszKz6YoDG5ESGGOO/jQA7HvVNO9DLvuBEm1mEOAj0fYQG14FVh+OjKPjAnLApWAgadvYvg==
X-Received: by 2002:a17:906:c417:b0:a28:e546:1efb with SMTP id u23-20020a170906c41700b00a28e5461efbmr1024879ejz.115.1704449788331;
        Fri, 05 Jan 2024 02:16:28 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906358900b00a2824bff5b1sm713180ejb.216.2024.01.05.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 02:16:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] phy: qualcomm: eusb2-repeater: Some fixes after the
 regmap rework
Date: Fri, 05 Jan 2024 12:16:15 +0200
Message-Id: <20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/Wl2UC/42NQQ6CMBBFr0Jm7ZhpS0RdeQ/DgtYRJlGKUyQSw
 t2tnMDlez95f4HEKpzgXCygPEmS2GewuwJC1/Qto9wygyVbkqESh27GV4hP5HfyFpUHbkZWvMu
 HE4aTJWOMI2cD5MagvA05ca0zd5LGqPN2N5mf/bc8GSSksvKVP/ijc+7ykL7RuI/aQr2u6xc16
 E+tywAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=xkpoCUfYUnRlKp4mUYR1zyLDW4HOErb0ofza230yj5Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBll9bzhtIy9JFvKOV55EJCAuxUM2665z65pjA9O
 MV3tU+LoOmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZZfW8wAKCRAbX0TJAJUV
 VmP8D/9l8aBD7nGZ4ofFcmrf5G3oLZn5pbgBkzkdf4mNvLOVgcjfcwQkpL4o8Z75Px8herVyJk7
 SjZYUQOM4TsUu69JNQIen0N+wcaUJlH9OWtIwOLRStJ4cYRYY4N7XXwwELbU2qJhrS2+PDOKHSr
 ztM+2YpCIojhFOhwT6FgkP1OmXiXKu18aQGJHBSTnni1SnFRxXqdld5B9E1oSJgs9r/twfw7hAN
 Vbx4v/aUZlGzkzIqF+/1G2d5NHCd1iADCY6fGWIPiejOdxkUfAmvX9fqEYK/eAvtqVs2YbHRq3u
 lx+GxR8OiUiM56vbc5kUfxk+RQp6cjy7LhFWnDjbF3ra6yHblL4kdvK2m25ZdHvTXzpIdQxMOZh
 zoZccUFVyaO6uY+fzTK0XOCSuI/bnwTMFcBGvtBpEjNDjwFHWP68pMvUqxaXZ9/kTHKitLUfxlB
 mfo29Oxqx/e36B5KGtQAA34RtBtI60a3VOOTO16UwDIAl0mLJ6f/9zjFj7rhcCg6pNl897KJPLf
 Q0QneGWztEmEDnq4h4eDrzPXz14MQWdku8TYN9s27FTfcWLcqGghDx10Rb4+rze4N27Fltjufhb
 VbG4GgVc5P5fqJnfy3B+eRtlIwndJ5Les4ut97e7M6V2ekcCHrjAmM5l9+dyWbs6jKpH14NFy+5
 rHH8bPJHkr1utyQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Found the first issue (from first patch) while adding support
for X Elite (X1E80100) which comes with more than one repeaters.
The second fix is just bonus.

---
Changes in v2:
- The regfields is being dropped from the repeater init, but it's done
  in the second patch in order to not break bisectability, as it is
  still needed by the zero-out loop.
- Added Konrad's R-b tag to the first patch. Did not add Elliot's T-b
  tag as the second patch has been reworked massively.
- The zero-out loop is dropped now by holding a copy of the init_tlb in
  the container struct. This led to dropping the cfg from the container
  struct (see second patch commit message for more details).
- Link to v1: https://lore.kernel.org/r/20240104-phy-qcom-eusb2-repeater-fixes-v1-0-047b7b6b8333@linaro.org

---
Abel Vesa (2):
      phy: qualcomm: eusb2-repeater: Fix the regfields for multiple instances
      phy: qualcomm: eusb2-repeater: Rework init to drop redundant zero-out loop

 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 53 ++++++++++++++------------
 1 file changed, 28 insertions(+), 25 deletions(-)
---
base-commit: e2425464bc87159274879ab30f9d4fe624b9fcd2
change-id: 20240104-phy-qcom-eusb2-repeater-fixes-c9201113032c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


