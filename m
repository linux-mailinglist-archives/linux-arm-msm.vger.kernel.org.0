Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18DBC5FA7D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 00:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJJWqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 18:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiJJWqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 18:46:11 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B725D7F0A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 15:45:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b2so18556370lfp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 15:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
        b=gZlEGIYHv5Yda3m/gkN6SfDBeVu9EFOQN7P0fTjQQrMcfVmC7NQrf3NzO7a1N8a61F
         WlK08fZAnFbiTv5p15MktG9cXvHFZ8BEd117RCFUTZGABRsXmKrn56uy2bUtiHjBvItc
         P78Yy0pbqsLBVNrgT+e/yreJ7kJSSVvaNwSXUeuBr+yUov4qQYGXuvJJIXuT8CGZ8eYJ
         FfVcZnePCE8h1zeT1VsnXcsNzT7bKd4AvuMxO19ELCDOIaJhSBlRpYwlFhE2ucyZGsxx
         /74t3vcrO+lATfBoOkcvkgXYrDLQ2c44+R6NxhcoaXAK8HDDS2baUT4WS8wGoMsDhnXX
         iZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
        b=NVs9h2j3GW2RypIycK5qCQNvr6w8Kutg1v1+Eqtrx2ujWOikgYCZBjjiMZj3dYKrd9
         XJIH1HpY9dPSHsfAwsy/fAXdqEfOuXLcnD1u7PmNN7Ws1qx211AwaCamOrFAE7OHGZiF
         8obRvRpI1sIZbu4183gX2SdrNHwiq89GKBz+q4xY0gxsUmilDKaVfaTGh8Jj9upyRtbV
         Uri3R42+wuR5tfrRdtOuSF2Nk5zlrjkEZCLy3KeCT28WoVmPd1GvPUTD8/OoPBBYHSY1
         1flOl1wBBGPx/FZmcefm0Pqc5e3K8IMqwMUzjdBdtT/XBkHFOmNHOR8vbqW6TozE4fW5
         4pnQ==
X-Gm-Message-State: ACrzQf2T3GyIrrsevuwOXw8BtNLlJBhYCAkMCUGyOQw2Bnp7EzyFcKon
        iavdzyBHTFzEtV+mCrbxCMaFJw==
X-Google-Smtp-Source: AMsMyM5p1CJmxCtHf5WjzdKCcKLbCFjNxJi+YH+CB8LLEucq2hy6XvfgdYTs8HMsYomnPJ5aQHyC/Q==
X-Received: by 2002:ac2:5a5d:0:b0:4a2:3d64:8ad3 with SMTP id r29-20020ac25a5d000000b004a23d648ad3mr7596244lfn.530.1665441925095;
        Mon, 10 Oct 2022 15:45:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b004994c190581sm1585272lfo.123.2022.10.10.15.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 15:45:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org
Subject: [PULL] qcom: add squashed version of a530 zap shader
Date:   Tue, 11 Oct 2022 01:45:23 +0300
Message-Id: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:

  linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware a530-mbn

for you to fetch changes up to 44fa25ddf7d803f347dcdb0ecc52f72268979b92:

  qcom: add squashed version of a530 zap shader (2022-10-11 01:31:10 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: add squashed version of a530 zap shader

 WHENCE                    |   1 +
 qcom/apq8096/a530_zap.mbn | Bin 0 -> 17188 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/apq8096/a530_zap.mbn
