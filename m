Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E2E2A3201
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 18:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgKBRt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 12:49:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgKBRt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 12:49:57 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226DFC061A47
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2020 09:49:57 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id m16so15989043ljo.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2020 09:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRD84/ne18IE0hT03lsb66bab982FuGq6Gl9WYSoal4=;
        b=i8ZvvguMhFQvhTx+6nzimaIKFEqvNVCw1Nypy+BwhgzcVrTYE7PrPHin21H4e3+HfG
         rG6aH5YK/0NALsHsoXxEo2hQcDr5Cx7A7FIK1K+Ljb3KZIxguUkLxwXkR2IF9Cu2rI3Q
         Fo61NldwOGa7jCcdhSE86JYfKX1poQr70klRiwjr6R7avR81MUQW8LNMMqopEvMT619f
         32S4su0Qx6eV4hXMUc5+DplSOjsuoLH7RXzgIrkAYSf4m0BrLzG8RKjqXklnjxOfeGi+
         NkFKDPL+8EFZZBS4JKN2M7uswLc37dPfXXvvOqhGMGQWXu4YFrR+eKz8tLn9sOgKJRwJ
         URbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRD84/ne18IE0hT03lsb66bab982FuGq6Gl9WYSoal4=;
        b=QaEjwlxyDzwTGfFBG6xMa9ajeqXzx265YZZEhqQJEU0ubk6u2DrPqtnG4T7DzwFSlN
         0XoxJE4nvg7RdIHBZ9xDeczuu3rAcR9sPp7lgOg72hR/ezZ32x2pSqRxRPJN6TpFHXs2
         OOr27kovn/uffeRKfBQZiVh1Rwg3MIS3TiOmDhQ5/aCr9WujZ1iPcfAtB9pipkBg7wKA
         6Petj1Dhhbsml6AMbby78MRQzFt/d4Z2uIM7bnaMbfsxgNi7d5txt8tQHfAkJsRggWgh
         U7+HTtj3+WagZNguzU0283AWZhdAYfXi5cIX8k2n5FqCU2TwHuV6GNrj0bYMSFwT99hL
         +7lw==
X-Gm-Message-State: AOAM533TUxiD/jFEAVxzg6PjCXVgmdj/TzwqSsimZUQS2Zm5LjL3qPzv
        h3wIgSE/BVOWoK5na5fLFiA7SQ==
X-Google-Smtp-Source: ABdhPJwFjPERtQiqcdGssb9PmEtpPtYbHIN8+7XRTiGv9PU6t9Nn0DYnkiil6KeNbv65GhAHLcPGVA==
X-Received: by 2002:a2e:7016:: with SMTP id l22mr6716623ljc.466.1604339395537;
        Mon, 02 Nov 2020 09:49:55 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
        by smtp.gmail.com with ESMTPSA id r7sm2516163lfc.206.2020.11.02.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 09:49:54 -0800 (PST)
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
Subject: [PATCH v9 00/15] qcom: pm8150: add support for thermal monitoring
Date:   Mon,  2 Nov 2020 20:49:35 +0300
Message-Id: <20201102174950.1148498-1-dmitry.baryshkov@linaro.org>
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


