Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA8E288D04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 17:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388696AbgJIPpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 11:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389313AbgJIPpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 11:45:06 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63533C0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 08:45:06 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c21so10034663ljn.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78OLxeXd/qqHICuSPZPT2mV0KDo9INE1o8uV6MpD8lE=;
        b=dkhypCfVvytecpOifa9Nwq1YYrAmA87B1xjSGQiJs0fg9sPK8Z4XaCSPrkr8Ln8gpH
         udsmQ+zhWRY/i5AoNcOCRdKyUprefllEuMkHGCAW7AGUPLzf34wL/DQyqkDWBivv0Q8g
         qDtotQBk0yGlVZshk+LB8iF6euDDaCly5LUJQyqPecD6eDXGGAv/QacvNqC5oSm9dgVc
         uU5vKorx3l5JjofTrQM/xUNCZypkqD10aEBjOjCVAdKxwVyNMG8PT6L35W3pYjdnfP26
         XRjq7Sc/aP3rRbHJESKeBa8m7ybky4kuoNm5BNd+r1TYFbT16dPI7E75a1y2Jbkdjtyg
         1mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78OLxeXd/qqHICuSPZPT2mV0KDo9INE1o8uV6MpD8lE=;
        b=KdAy1P+AtMIenL5XnyAEca1aKwcaobIw+wsiGEM4X2Ozcwl+HlZ9++vLXj+0K8iO0S
         SglZErVGytMrRUBjXv9n5zG+C3uwjDy+Eh51AXs2OeGNrqh6CGtEMFFQUyeSFKagn10y
         LilqA8S9zS/3Gre6nNo9KjxxWv1CwrDntxQx/YTQfP1qfwGzcXDE0JZBlEOCshSZyJ6h
         Yxr3xdUL8xYG6DQiri3zOOoPE3kEhfCw6COzRUqn9YKDStM/bceLbz0XVduWqYM784OT
         sXnnz3VufbDk/8q/FndlWvbPnzXkNkId2zhAGyrwK+tKYHAEk2V+VkTib+PHA5Ia0mfS
         PV+g==
X-Gm-Message-State: AOAM533qYjZ3UzX/8qkRmQmfT7Jmht047IbNteduXaTkqHH/+q1+y1lT
        d7GUdABy386GAFABMqB6orDKrA==
X-Google-Smtp-Source: ABdhPJwgnobWRlQ1yWB3wNqiOFb/QLw+U5G2YtchsBVf1l4gzwJxMph8xyyajcLtQWFY1F6BE0c0qA==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr5716703ljp.375.1602258304606;
        Fri, 09 Oct 2020 08:45:04 -0700 (PDT)
Received: from eriador.lan ([188.162.65.231])
        by smtp.gmail.com with ESMTPSA id r4sm1505597lfc.162.2020.10.09.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:45:03 -0700 (PDT)
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
Subject: [PATCH v8 00/11] qcom: pm8150: add support for thermal monitoring
Date:   Fri,  9 Oct 2020 18:44:48 +0300
Message-Id: <20201009154459.106189-1-dmitry.baryshkov@linaro.org>
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





