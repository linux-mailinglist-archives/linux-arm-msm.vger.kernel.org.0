Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839685002C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbiDMXvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiDMXvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:51:14 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABE1496BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:48:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b21so4086608ljf.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORBNSb55HLrQXXkE7Gee3v6upYJe8NBlLeoTQT4L488=;
        b=qVr99L287eaB0tbftUfAAeP/Uy4c/WBia3R1tOnTUUEPfTnI0+o3JZuJZKwXKtC79t
         1OMEUeHlZNJWLtfdVT4LWmFdg6nrk64/zPVhH/RsAuLh/7hl1ov0eiWarg9wLqxSkgc8
         TXvKAXHijgPFcqfUf6N5iuQQAs8cfB7SsOYfm9bLMwgjISDEn0WrgQuhOS8+NWaoNfUM
         nOJe951Pyo4ZmOe+gnXXHq1RjFgTkuZpy0ZJljMCtz2pKNBKMh2MlDccpCRCeNcfR+R8
         CQwTTo9DBgtL3nW5+KGFAN9vVCVkFWPahVdFHFJt3LpeotpviOcIfFithdw9OO8Rf+bX
         S6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORBNSb55HLrQXXkE7Gee3v6upYJe8NBlLeoTQT4L488=;
        b=04clCrYV9J7/pI2aNALFtQpLlWArcKXHvm9mBpmLCaQuuWoLrmlOFqYGwzjD2mDuZH
         MdtU1c1c626iabL7WHmT3VD0thMzijEWKdibE9V/XyEHRkTP0HkDXi0qtPPE7UdAmYkI
         zPg7jhYxGqBDtn5BPDBZ4ZqbG7gyyvA3NAfN55bQxD9Apw8HcGs8AJHW6gt220ueus0X
         FHw4fRVvEWhimiRYHUMkoeGIJ0/f5TXnuW3P9lzC6Nr//UpuZPeApate3kXfD0BP/PlE
         CZ6kZ5eb9+ySThQcrgozYDAETFBZUGDZQhenHzKCIdxkezhoix1UPBjby+uhQVWuSugQ
         np4w==
X-Gm-Message-State: AOAM533GjdBHBOI+wJYCsLcD9jLpql0W6yKPcGjD8d5vVZqHC+n80L8u
        OXeT1/HvjrZ+Or3aYPedAprV7wpoorejZA==
X-Google-Smtp-Source: ABdhPJwBaiLZCv1bv96pZqmIezsxQUGweUw4jgihNGi3bblfXt8xxbHpETMPKm0FIDy9S57g3rf68A==
X-Received: by 2002:a2e:9241:0:b0:24b:63e8:1cd with SMTP id v1-20020a2e9241000000b0024b63e801cdmr68170ljg.390.1649893726644;
        Wed, 13 Apr 2022 16:48:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l20-20020a056512111400b0044aba8206ccsm41901lfg.253.2022.04.13.16.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:48:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PULL] qcom: add firmware for APQ8096 SoC
Date:   Thu, 14 Apr 2022 02:48:45 +0300
Message-Id: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi linux-firmware maintainers,

Please pull the audio and modem DSP firmware for the Qualcomm APQ8096 platform.
The firmware files come from Dragonboard 820c BSP available at [1] or directly
from Qualcomm at [2] (registration is required).

[1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
[2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip

The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:

  rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware apq8096

for you to fetch changes up to afc44bb26f7656e4bda1b63e530f787ffefb7609:

  qcom: apq8096: add modem firmware (2022-04-14 02:34:16 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      qcom: apq8096: add aDSP firmware
      qcom: apq8096: add modem firmware

 WHENCE                  |   6 ++++++
 qcom/apq8096/adsp.mbn   | Bin 0 -> 10533521 bytes
 qcom/apq8096/adspr.jsn  |  21 +++++++++++++++++++++
 qcom/apq8096/adspua.jsn |  21 +++++++++++++++++++++
 qcom/apq8096/mba.mbn    | Bin 0 -> 213888 bytes
 qcom/apq8096/modem.mbn  | Bin 0 -> 7434352 bytes
 qcom/apq8096/modemr.jsn |  21 +++++++++++++++++++++
 7 files changed, 69 insertions(+)
 create mode 100644 qcom/apq8096/adsp.mbn
 create mode 100644 qcom/apq8096/adspr.jsn
 create mode 100644 qcom/apq8096/adspua.jsn
 create mode 100644 qcom/apq8096/mba.mbn
 create mode 100644 qcom/apq8096/modem.mbn
 create mode 100644 qcom/apq8096/modemr.jsn
