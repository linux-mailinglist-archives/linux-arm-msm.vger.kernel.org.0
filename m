Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6547932C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 02:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242551AbjIFACV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 20:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236879AbjIFACU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 20:02:20 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007641B4
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 17:02:16 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso4245374a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 17:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693958535; x=1694563335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is2n8guo2Uwi3PELiICF0O4hEvBWi3NTMahMKutEeG8=;
        b=Og2O3ZRUe51FNv+tmC/vyH4OPWwDNeSOv8BISFpf/4qlt2LajhaguzEoPiUbavGHnO
         QR4T4LhKU3iNjjvDuzc/HzFK6G/W6fKRfhl18VlH8iVhYXdN5GhveU64o3v/ZQrEjNOt
         9SHXxlwU7hhRrqqsQE8q/i2L8okv2IpwMMlQWJWE0qpKsxcysC9KVMzZ/cUyxfGeDmZW
         E3kgma9WbwpzTkCJpz9o/04aLiRwCdpINVuKN/koHLYBj2cnNeNIhIK/xPOd1I+GHbVU
         Z7XEpOpT0tzG/wmjrMmQEJUz+AqSb39xb02InbnYRciHZcy9+kFPJxXNvCUDNLOmA3uv
         93WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693958535; x=1694563335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is2n8guo2Uwi3PELiICF0O4hEvBWi3NTMahMKutEeG8=;
        b=eUcvWePXxNUWmzZ2k/3osp5NVYOzZQyxWbPPUcKdOnCV+90XrBr6S4gwJfymOwV2oq
         StmRQbrHZv7m6w9tdKjZzP6zRPmBOikzWwZu59sHEsvoTIQklq21BvUyxU3g2QuNkKqz
         jM8dz33hWDtViC6YbchUuZAqp9/hi4FeYNHpBv1v1MjoV8ME3VT4LgdxWkSJLBJ6EGKV
         EGo94SGqynmL4h99RJi4oE4q9nemOXnx9FXYQWufCUatIV/F3MIN3UKVSzIjh/iHK3up
         m4rV8ZD14De9ww1ULKiOxFo1UlhDSu3vR9ki0jOoC5MwVc0M0/222PFd/DTNV/WqnpWS
         /GQQ==
X-Gm-Message-State: AOJu0YwHdz+5gkzENyYFIt7gjf2zcR60T2yqi7Kcbz/86/Mj2ps+rt4+
        vWjPgGWHpB+59JWMt3EmpdEr5g==
X-Google-Smtp-Source: AGHT+IEjqSmuVIOY2bs3zNmK2bo0d6wgPXsvVOkNEphpsGvuQgk2FWY39wOz9LuZQ6foyTIaxfTWmA==
X-Received: by 2002:a50:fb0f:0:b0:522:3d36:ff27 with SMTP id d15-20020a50fb0f000000b005223d36ff27mr992930edq.31.1693958535361;
        Tue, 05 Sep 2023 17:02:15 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p11-20020a056402074b00b005231e1780aasm7609318edy.91.2023.09.05.17.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:02:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Kalle Valo <kvalo@kernel.org>
Subject: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
Date:   Wed,  6 Sep 2023 03:02:13 +0300
Message-Id: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please pull in firmware files for new Thundercomm boards, Qualcomm Robotics RB1
and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, video
en/decoder (venus) and Adreno GPU firmware files.

The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8ddb5:

  Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2023-08-04 06:33:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb12-fw-v2

for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632be:

  qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-08-23 20:24:47 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (5):
      qcom: add GPU firmware for QCM2290 / QRB2210
      qcom: add firmware for QCM2290 platforms
      qcom: add firmware for QRB4210 platforms
      qcom: add venus firmware files for v6.0
      qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210

 WHENCE                    |  27 +++++++++++++++++++++++++++
 qcom/a702_sqe.fw          | Bin 0 -> 20388 bytes
 qcom/qcm2290/a702_zap.mbn | Bin 0 -> 13804 bytes
 qcom/qcm2290/adsp.mbn     | Bin 0 -> 12826756 bytes
 qcom/qcm2290/adspr.jsn    |  21 +++++++++++++++++++++
 qcom/qcm2290/adsps.jsn    |  21 +++++++++++++++++++++
 qcom/qcm2290/adspua.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qcm2290/modem.mbn    | Bin 0 -> 8881672 bytes
 qcom/qcm2290/modemr.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qcm2290/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
 qcom/qcm2290/wlanmdsp.mbn | Bin 0 -> 3828228 bytes
 qcom/qrb4210/a610_zap.mbn | Bin 0 -> 14384 bytes
 qcom/qrb4210/adsp.mbn     | Bin 0 -> 13196348 bytes
 qcom/qrb4210/adspr.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/adsps.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/adspua.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qrb4210/cdsp.mbn     | Bin 0 -> 3003924 bytes
 qcom/qrb4210/cdspr.jsn    |  21 +++++++++++++++++++++
 qcom/qrb4210/modem.mbn    | Bin 0 -> 8881672 bytes
 qcom/qrb4210/modemr.jsn   |  27 +++++++++++++++++++++++++++
 qcom/qrb4210/modemuw.jsn  |  33 +++++++++++++++++++++++++++++++++
 qcom/venus-6.0/venus.mbn  | Bin 0 -> 1794076 bytes
 22 files changed, 306 insertions(+)
 create mode 100644 qcom/a702_sqe.fw
 create mode 100644 qcom/qcm2290/a702_zap.mbn
 create mode 100644 qcom/qcm2290/adsp.mbn
 create mode 100644 qcom/qcm2290/adspr.jsn
 create mode 100644 qcom/qcm2290/adsps.jsn
 create mode 100644 qcom/qcm2290/adspua.jsn
 create mode 100644 qcom/qcm2290/modem.mbn
 create mode 100644 qcom/qcm2290/modemr.jsn
 create mode 100644 qcom/qcm2290/modemuw.jsn
 create mode 100644 qcom/qcm2290/wlanmdsp.mbn
 create mode 100644 qcom/qrb4210/a610_zap.mbn
 create mode 100644 qcom/qrb4210/adsp.mbn
 create mode 100644 qcom/qrb4210/adspr.jsn
 create mode 100644 qcom/qrb4210/adsps.jsn
 create mode 100644 qcom/qrb4210/adspua.jsn
 create mode 100644 qcom/qrb4210/cdsp.mbn
 create mode 100644 qcom/qrb4210/cdspr.jsn
 create mode 100644 qcom/qrb4210/modem.mbn
 create mode 100644 qcom/qrb4210/modemr.jsn
 create mode 100644 qcom/qrb4210/modemuw.jsn
 create mode 100644 qcom/venus-6.0/venus.mbn
