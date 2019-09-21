Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A50B9D60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407521AbfIUKRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:17:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33533 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407520AbfIUKRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:17:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so9184318wrs.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nmYjW7bSzM2kmwhgRXFmODtD0mzZcHl+kN/Q0bV+18=;
        b=cqbPuYVtgS9MjVfCoD/yipIXWY901d8oMk4vnjSYILaWp7Fo2qz+g2IzzidtknQkat
         5GCxKjJ+uIeergjUkFFjTl4TNFMF1eGwhs54xq0/ghQ55X2TypoU+TrsBD5Y3cmmpjNO
         lyhberhkHWcevJ89Z2MUpPmFhTEu0l0JQlZIta8IIuJNA9eCqUXLyrdiFSkASXYePf8Y
         +r1rSp8yrg1/x4FdpkWJCNFaJ20jQMzsBRf8uRexTeFQvHeZNdFp9/2Iy1JVNnnFp4rb
         tzRMxb6FPNLBql+XB9BkTLGir0Hb+Q6LM21DTThiyMtTKx9uysGUMNudQQ5uwsvo8GE9
         8OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nmYjW7bSzM2kmwhgRXFmODtD0mzZcHl+kN/Q0bV+18=;
        b=f7JwBzmhmwGiQOCtCr3Yo2v5FPAYBrDII4daM27dvOayKrRfBarxM2DxjGtmyw+sRd
         kdJG7zfSGUoOxAYTGi9a/0UVQFpmMkclcmbObdLQlBcW3+CgjNbvIQxI6kumsqmq8vC4
         czVwXUbPrvnI7RsWoR0ArMsaJAue75MraraoEWAxbIjkYuX0wKdI0CV5An3P/czH1ROL
         os9+FQBVXFT08NONGgGgy52pRlOkU1PE5jUhVCbUa2iNAvw+ohN45TZN5L25IHCC7s7R
         rdFSsSora1u12DV4jlFSbadG3eWvG/Nis/cYgHH37/WmTQmP8YHbTC6yf1Q1rN5F/kRb
         5YCw==
X-Gm-Message-State: APjAAAU/vezU4DtjCqgalfL4NBigfnwuzc5KkBNhNhsqATRuugW0RrCx
        s3sZgUbAURzajhSLoV16nKtf8TRUJ6E=
X-Google-Smtp-Source: APXvYqyQnp/Ag9J8sO0tSFLAgbzOVWbuW15Atll09Ol7QwN2EXuZCJzzjyphSWFknq6O6c/cxDmuvw==
X-Received: by 2002:adf:e545:: with SMTP id z5mr14954504wrm.263.1569061066983;
        Sat, 21 Sep 2019 03:17:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s19sm8313020wrb.14.2019.09.21.03.17.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:17:46 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH 0/2] Add TSENS support for MSM8956/76
Date:   Sat, 21 Sep 2019 12:17:38 +0200
Message-Id: <20190921101740.430-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the TSENS support for MSM8956/76 using TSENS IP v1.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

Angelo G. Del Regno (2):
  thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976
  dt: thermal: tsens: Document compatible for MSM8956 and MSM8976

 .../bindings/thermal/qcom-tsens.txt           |   1 +
 drivers/thermal/qcom/tsens-v1.c               | 188 ++++++++++++++++++
 drivers/thermal/qcom/tsens.c                  |   3 +
 drivers/thermal/qcom/tsens.h                  |   2 +-
 4 files changed, 193 insertions(+), 1 deletion(-)

-- 
2.21.0

