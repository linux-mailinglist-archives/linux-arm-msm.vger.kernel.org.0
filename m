Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D621286083
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 15:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgJGNyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 09:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728525AbgJGNyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 09:54:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6BBC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2020 06:54:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l13so2045909ljg.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2020 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+sjGwUCForYLKcLQq9DGEuXXrYuATWmMTrF6KufZso=;
        b=zHpHfN/gdFircP82dZh7ocH215p3xA1ys4m/d8VtbITetrkStl0nu7OZZ9VtyhCIDp
         IWU34Vzk6P+qY6ieDAzDkfx1EiItwl1dJ8/Npynl4lVHm0+hodjkceHrXFRvrdTAK2Cn
         TRg3lQ+p3jgdnomRHPlG12QSKAb6/4oyrLQ1NTSYJ8Ul3cVp/KjBcQIeV1UVS5hjNSzV
         5KNaS4DHzG5kZJnK5/9kx6YOxjTtkmdiDfakzX6/U2vEa21aydkeApMWgl0SzKJB4SX5
         PnHAPsC0a0FA/elk8WJA1KFKHZM/Z1KYNLi7SU6tK89V1jbkWN66l912OuSmEsEbClST
         ZTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j+sjGwUCForYLKcLQq9DGEuXXrYuATWmMTrF6KufZso=;
        b=QSZMFNfDe5vLRsa1BPBupbS5Cho/ApVsRYFZymwFPhljNNC9KWuZpdZxeFiNv2HjDm
         AK3HCT9PYCVA4kwwXBZfFa8xlyEFvPkTHo6W/NfPK4zXLI3nG0omsGYaSrY3hwOVtbKQ
         gZ/P/f/9Y+wH4NaJN907HcfLMtesH5BnvzMOy3rTP697RotaYSmITMDC+s65zWp4xPNJ
         40lu5kiL2/g/NX6bTTBVmYDQwFLrey3rAt+6EEG2Yb6cqeE195QGbS7Z+BDbBvCj9Iox
         +0k7MjYPvUvqCmbylnCGRgJcRNbecM7NsIif7a3kmkPjwhsvhHXjGE/ske5cZKPsrgo6
         TkLA==
X-Gm-Message-State: AOAM5307fK5IuuMIoRWXq5bOhRr/BcMHjnsgyVyyFOaVU3QXrn3EONS5
        2kszNsL9Jy/AdN0UbNK43tIMAQ==
X-Google-Smtp-Source: ABdhPJwXLM09QvKLnzuBfTs6JeUwCWArC7p4uIey9ak6b53wNQI6Ak3hk/TGs7MJIr3/9JQogznutQ==
X-Received: by 2002:a05:651c:543:: with SMTP id q3mr1241175ljp.6.1602078880968;
        Wed, 07 Oct 2020 06:54:40 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.250])
        by smtp.gmail.com with ESMTPSA id n3sm339768lfq.274.2020.10.07.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 06:54:40 -0700 (PDT)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
Subject: [PATCH v7 00/10] qcom: pm8150: add support for thermal monitoring
Date:   Wed,  7 Oct 2020 16:54:23 +0300
Message-Id: <20201007135433.1041979-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch serie adds support for thermal monitoring block on Qualcomm's
PMIC5 chips. PM8150{,b,l} and sm8250-mtp board device trees are extended
to support thermal zones provided by this thermal monitoring block.
Unlike the rest of PMIC thermal senses, these thermal zones describe
particular thermistors, which differ between from board to board.

Changes since v6:
 - Added include <linux/bitfield.h> as noted by Jishnu Prakash.

Changes since v5:
 - Reworked DT bindings:
   * Removed qcom,adc-channel, instead it is parsed from io-channels
   * Renamed qcom,hw-settle-time to include -us suffix
 - Re-added monitor enabling which got lost during refactored. Noted by
   Jishnu Prakash.
 - Use threaded IRQ handler as susggested by Jishnu.

Changes since v4:
 - Added kernel-doc comments to ADC-TM structures
 - Used several sizeof(buf) instead of hand-conding register size

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


