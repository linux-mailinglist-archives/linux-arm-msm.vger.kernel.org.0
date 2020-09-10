Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4369C2647D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 16:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731001AbgIJORL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 10:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731118AbgIJOKc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 10:10:32 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109B2C0617A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b19so8275515lji.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y7MyZ2TAFWflP+dgDfOZRILQ5unvhNefHjzHbPK6lnw=;
        b=uPNJQH4ZDH1SErn2VoMF7NeG9/CwPSkWhpQyPpAdVsFvRpia7azZAoR80hDV8JaHdH
         SYM5q1GT1qs0Avr3xMeYVs1Qr82/B/v99vwbZQdvfNp9/J0ASt3lKnn7Yg98bXBviRr9
         CqQ+jANQ0BhKDNN/Go86XnzMC1//J2G5omtfy8fgfFGhoZY8Qh630vFTH4lJZkdA0cCk
         WBZP6h1ulHmLRycC+5ty+ASoGb1S4HHh73YdOIVAKa5yLoDoLGUrklbUoCcX9epI+znk
         tSIvdfddzmP9RRDNrWsZ6C0AnvxW3lYSJQJ5AHuE0PXvLqSeNo2ZvEFltCmFDmZpSZPq
         wcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y7MyZ2TAFWflP+dgDfOZRILQ5unvhNefHjzHbPK6lnw=;
        b=l0PIgXckP11TMcMCggUeipyQ7P4R4Dh3ZoIQ+ae90MCxl66OQSwb86fxNpu8BIQhWZ
         5DciGnozcNPT+qj/8YLoUs2wSOU0KU1ehtXFR2uBRR1Cskoem2WYutHClYm0/KZj9LpO
         E6gmuuXgbR148TqwOUvUNSy0oKDYLNPr0AQrDEfKQGuql/n4sv0+I4FEtGOvaOFcp2OE
         yw2WeNn6tlMB9UVLaW3eCnqc0ZBWwlTvS+/9FF7dIhh69FJrCIwytzyMs83IUHjNEy85
         4j+tj5pCpCj6mY4nHzVqPaYuqqPQatg+/iqKuxXFf1OHv7+VuiZL7CEcDLKugqRt64k5
         BKFg==
X-Gm-Message-State: AOAM532BBgQWJ3DkX+KuOnYfhqKWNn/NSGHebyOUS6OJ8F7pwaNXz5ur
        1aPD7UQSSAWdLvV3VcQMCJT2mQ==
X-Google-Smtp-Source: ABdhPJwv788ve/n35Qorbazt2TmGE6tS6NCan+WQy3ViD2fXgJ+VCgP/heVrwfzvp1ajLMjpge9Emg==
X-Received: by 2002:a2e:8541:: with SMTP id u1mr4920154ljj.101.1599746408815;
        Thu, 10 Sep 2020 07:00:08 -0700 (PDT)
Received: from eriador.lan ([188.162.64.156])
        by smtp.gmail.com with ESMTPSA id t82sm1367646lff.43.2020.09.10.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 07:00:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 00/10] qcom: pm8150: add support for thermal monitoring
Date:   Thu, 10 Sep 2020 16:59:50 +0300
Message-Id: <20200910140000.324091-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch serie adds support for thermal monitoring block on Qualcomm's
PMIC5 chips. PM8150{,b,l} and sm8250-mtp board device trees are extended
to support thermal zones provided by this thermal monitoring block.
Unlike the rest of PMIC thermal senses, these thermal zones describe
particular thermistors, which differ between from board to board.

Changes since v3:
 - Fix DT description to spell "thermal monitoring" instead of just TM
 - Fix warnings in DT example
 - Add EXPORT_SYMBOL_GPL(of_iio_channel_get_by_name)
 - Fixed whitespace chanes in qcom-vadc-common.c
 - Removed error message if IIO chanel get returns -EPROBE_DEFER

Changes since v2:
 - IIO: export of_iio_channel_get_by_name() function
 - dt-bindings: move individual io-channels to each thermal monitoring
   channel rather than listing them all in device node
 - added fallback defaults to of_device_get_match_data calls in
   qcom-spmi-adc5 and qcom-spmi-adc-tm5 drivers
 - minor typo fixes

Changes since v1:
 - Introduce fixp_linear_interpolate() by Craig Tatlor
 - Lots of syntax/whitespace changes
 - Cleaned up register definitions per Jonathan's suggestion
 - Implemented most of the suggestions from Bjorn's and Jonathan's
   review



