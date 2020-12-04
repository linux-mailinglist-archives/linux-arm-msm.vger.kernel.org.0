Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD2E2CE5FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgLDCz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgLDCz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:55:58 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F0BC061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 18:55:18 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s9so4893168ljo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 18:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36w/Kq59tNMZ1rcX0N78zne707RUAoZsetdEALnoH4s=;
        b=XV38rAwzypOp9F8eGayqPKGp+geDnf9zK6chD2lZAZz2ANpFM3JIri7kX10Jk2k9f/
         ftVU6gCtzlx0198/FTTUqXexLs+mlfhJoaZY5tk8GFKk1RB5srMCkG7Lnf2SLm5Ww4fm
         UTfd5dyw/1iRq1HZfHOu9c0Ylx/ky8m2non8pOHNnBYKR8nlQyBWxRV2ZjedbP8nSDwk
         MNWPyYHI+EDCNQTxT/z9YT8MHgBHweg6KYiwuhXQtO20QRBVYfKWZp8bQ+jmypPWHmEc
         qvT4LaIJgfXycATQEct5tpSxMge8T2XCmF5kK5ry5mwxrTSD/+b+D6HO4/VRc6zu1g2j
         ipzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=36w/Kq59tNMZ1rcX0N78zne707RUAoZsetdEALnoH4s=;
        b=r6dk+UYYZr8h6B7NH7WZqM/G7EPPMBy9+gvaDPdMTvqfg/iT8NCdzUaBWQwBQ5Aitx
         OqbbKS9A6LSoWg3ra5jZEDvoC3Ri//seVShEd+TxRt1DAAUUhRKXSww6IcnuI5cKR1O2
         1fc1f68X8IlMZS16aNspfAUjTBuu3Yz2U7Qu6iiXqogSin6PAnngO7P5gYY1ZfF1zsOt
         4vjdUQN5moa0R0uRJBplmPIEDmGjykPj5IZuf0FBjbChDY1YfM9IJT5cjdlNsATYaOY9
         9IJkLF3bMec3u6IUCsTe0BNYWWniQde8SsQ5PN9FsvKNNPrbtr13jAywmC/MKU9PZl8N
         kUyg==
X-Gm-Message-State: AOAM532gWGmjqdjO0bhsN6rGx+NsHV5f2r1Px6B6W2Cis/26Abj0aXo9
        NhFc2u2eubBjUUI98ORFbkwZMw==
X-Google-Smtp-Source: ABdhPJx4KZFj3sxAnYsGWQ7t8aaUxTJG92bb/YpkZ6g+HR6pSwex9LWAoa9hA3zGUBM4jpbUZfaZ1g==
X-Received: by 2002:a2e:9244:: with SMTP id v4mr2278438ljg.438.1607050516852;
        Thu, 03 Dec 2020 18:55:16 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id b8sm1131667ljo.68.2020.12.03.18.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 18:55:15 -0800 (PST)
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
Subject: [PATCH v10 00/15] qcom: pm8150: add support for thermal monitoring
Date:   Fri,  4 Dec 2020 05:54:54 +0300
Message-Id: <20201204025509.1075506-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
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

Changes since v9:
 - In patch 12 add comments to the code as requested by Daniel Lezcano.
 - Change copyright comment in qcom-spmi-adc-tm5.c to clearly note
   driver history.

Changes since v8:
 - Simplified qcom_vadc_map_voltage_temp() code by removing ascending
   tables support
 - Simplified qcom-vadc-common volt/temp mapping code
 - Implement suggestions by Matthias Kaehlcke: message formatting,
   rewrite comments, remove unused variable initialization.

Changes since v7:
 - Move qcom-vadc-common.h header to include/linux/iio/adc/ dir.
 - Use explicit sizeof(var) instead of hand-coding 1 when accessing
   adc-tm registers.
 - Remove buffer read from adc_tm5_init().
 - Remove extra on-stack var from adc_tm5_get_temp().
 - Minor formatting changes as suggested Daniel.

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


