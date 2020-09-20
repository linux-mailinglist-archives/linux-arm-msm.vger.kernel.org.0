Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B60F27150D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 16:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgITOtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 10:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITOtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 10:49:22 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB158C061755;
        Sun, 20 Sep 2020 07:49:21 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so10174853wrv.1;
        Sun, 20 Sep 2020 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd6duPfNt70xEAbCRcfOYiMfgD2RFfKORSS3zhHyvpw=;
        b=HIgXtd8dJm/cVRw2H8qPAM1ft0D2NTHfP5p7bIvJkNoJmPP90uCnpCc4TrNw1NFlSD
         mH7Q826lhU/r02vaNeowH+exjP7Nok8C7XrptYvtoZcDVH35RL6RlURQWErItjDf0RKs
         3ebKcEf2+AFZDUCQtUJMJ/oUwuYvL5eFeedyzt1SEWHcuf2fvFc4Lfsw70ds6pi6H5qU
         LbTd1c6/g1dx3verJc7OMM8CdYY9XoQ+HSQOAmSGfpWQimG97DL4ePqGuorXr/3csarp
         /MtA85P5oLR56H6dzMOmyUQ/eDkKnwYH4MFo75Fdmid3GwLuZRa0qEN8a/FeHyEtLp/C
         49pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd6duPfNt70xEAbCRcfOYiMfgD2RFfKORSS3zhHyvpw=;
        b=LTJiqipQUUQt/l+FLpUzlqbUGfm8tZGjZIilIXkKldeonRCC4MKUuEoAAl/L+WfhIq
         83uqSQ1g7hgI41PikerhBVtXmAcIrTcUUnkQFmIhi2Idf9fnmh34sP57JRGHxCJDCaHq
         KpcPTmBdWU7+8CzajtgiD4KMs/Hve/5DR5fKToBxkh9upHlVEejQxa+T4bY+smrVfb4M
         rFcZqPU0PhjZobl4EbJmqAiGaUH8MdpM338juG1qWiNeAoJ6SdP6FBtuvuu86KAfqMDv
         P7abxRVDGlaZSI87iR/c9s8Rk9UtkBpZYiKXoPWHZl2CnoHZB2ERJ/q3QcUrRJlDW/sc
         Xxxw==
X-Gm-Message-State: AOAM5302joYNg3rnQVrR59ivEFnsCXsr8vHI2QbOpHfF1M65Gui+moMr
        Hia4XGEfyOFNBKYrEHqq6gY=
X-Google-Smtp-Source: ABdhPJxWcQxGWCl3fyX6ZO97RZDkkJ2ByFQDSmg/fZxUGlTBD5L8ZZheOho1XarRk9lacvWAh0uC1w==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr46042114wrn.333.1600613360436;
        Sun, 20 Sep 2020 07:49:20 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id h4sm17706662wrm.54.2020.09.20.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 07:49:19 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH RESEND 0/7] ARM: dts: qcom: msm8974: klte: Enable some hardware
Date:   Sun, 20 Sep 2020 17:48:52 +0300
Message-Id: <20200920144859.813032-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for various hw found on the Samsung Galaxy S5:
- touchkey (the two buttons around the home button)
- touchscreen
- notification led
- wifi
- external SD card

Please note that for working wifi the correct firmware is needed. Check [1]
for links and locations.

Also note, that to actually run a mainline kernel on the klte, you'd need
to apply this patch [2]. Any feedback on getting this to run on pure
mainline are welcome.

Original patch series submission: [3]

[1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/firmware/firmware-samsung-klte/APKBUILD
[2] https://gitlab.com/postmarketOS/linux-postmarketos/-/commit/765f55b248cd3b231af8431fe2f2aeca263b4e4b
[3] https://lkml.org/lkml/2020/6/30/643

Iskren Chernev (7):
  ARM: dts: qcom: msm8974-klte: Merge pinctrl nodes
  ARM: dts: qcom: msm8974-klte: Add support for touchkey
  ARM: dts: qcom: msm8974-klte: Add support for touchscreen
  ARM: dts: qcom: msm8974-klte: Add support for led
  ARM: dts: qcom: msm8974-klte: Add gpio expander chip
  ARM: dts: qcom: msm8974-klte: Add support for wifi
  ARM: dts: qcom: msm8974-klte: Add support for SD card

 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 301 +++++++++++++++++-
 1 file changed, 292 insertions(+), 9 deletions(-)


base-commit: b652d2a5f2a4e93d803cc33eb57fdc41ee528500
--
2.28.0

