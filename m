Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2187932FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 02:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239933AbjIFApH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 20:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjIFApH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 20:45:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D80199
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 17:45:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcc0adab4so460937666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 17:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693961101; x=1694565901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PCA9M0ErtIMnGr2+NMuuG37Qgx1f0Dgh7duQchM62bY=;
        b=A2oEcAAvbhQUSjKITVqSb90/UcaivL5QmE15VQOt3eFZGgLVMaWd6i2+brTZItUOld
         748TZjoJWuiV3V4nOMvjN/9umchWPFG9Yi0XDGWM+zDyERO8uGNtRbM4n7+IKnNSz71k
         V7cAenF8AoOIH8/SRBjBr1NnW/Q/8+sVkGTI2ow8fJ4VNjKcRC5+wKA2LWKbraRFb3Xc
         pIgaEXeKV619BVjI7cJZYGUFVCSiQwMTe3ErYagxNJax+Sv+oJaxyqlJMASKAH+K7J02
         Eq3kAmtizri95cg519JrqXHyZq/coX9iRvuXtX7ON3l18XqT5UKZmmgmWKMhIbGcVh/9
         k+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693961101; x=1694565901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCA9M0ErtIMnGr2+NMuuG37Qgx1f0Dgh7duQchM62bY=;
        b=jLSBwP+c0+CRaSckJQl3S6xD8Qg2841qW5SfXlF0iAe20Dyy7Ho4Sl5XZN3Zp6Gdsw
         Ind3RtifTLHJp7Dr++u3vvLCInt7dwpL4wOQrlTWmTj454CV4Sag+bVmd5IgpfotJY5o
         E5tU6OUZxIZfdVhpO+MNMLi4hKrakfJ/F/Q9x90PyuDBlhu13Tp6nsPM6O8p1xD3B4NA
         1A0foPH2OLiu+VPDwpHegvZQTBm67+kGqbdaFZ/io41/YtT3gJoRIcyGsb16J2Zm7h6Z
         0k8GdSgbof0bHcnKTBdqeM3ERUW+vgxzNGYrtT8NLRejRpX7t5irYKs8ApWZDF7OuRc7
         qG8g==
X-Gm-Message-State: AOJu0YzpH4/B3pu7qbufTISJ71NR2R62m2WGzz/WBEv8dEdhlj503DT5
        cnr6b5vvt2stRf4FlDgDxQnclNlEhGQ8gANSQzY=
X-Google-Smtp-Source: AGHT+IH1vE4SBXZ/Sa6e+78HiEzsV22rk2zukfewmzq/KUqgxMnGrmsQ+PwJPfw0HNb2UzZSFkqstQ==
X-Received: by 2002:a17:906:3caa:b0:9a2:2635:daa9 with SMTP id b10-20020a1709063caa00b009a22635daa9mr1081028ejh.6.1693961101257;
        Tue, 05 Sep 2023 17:45:01 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906c30700b0099cbfee34e3sm8224585ejz.196.2023.09.05.17.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:45:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Subject: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
Date:   Wed,  6 Sep 2023 03:44:59 +0300
Message-Id: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please pull in firmware updates for the Qualcomm Robotics RB5 platform. This
includes SM8250 DSP firmware updates, video encoder/decoder (venus.mbn)
firmware update. Also as a part of this update is included the board-specific
firmware for the Sensors DSP.

The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8ddb5:

  Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2023-08-04 06:33:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb5-update

for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53a8:

  qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: sm8250: update DSP firmware
      qcom: Update vpu-1.0 firmware
      qcom: sm8250: add RB5 sensors DSP firmware

 qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
 qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
 qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
 qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 bytes
 qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 bytes
 qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 bytes
 6 files changed, 42 insertions(+)
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn
