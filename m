Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8D872F883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 11:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243628AbjFNJAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 05:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243938AbjFNI7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 04:59:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5451BDA
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 01:59:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f62b552751so8153936e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686733192; x=1689325192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJu8gPArW2pKxAwcLTACWfXF007XZf4qmmeSySXd5qo=;
        b=JFD/F+N3kHanfga+bpjSVTN3+M/er4toz6zdObmdq6cVJUG2lXQyYV7o9B0PlTtB8H
         1XTBEqfbVrew2bWnU5TrhA31z1m/5e9NhWMA/r9rDaeRD64PFtIWREqi4MqdLridxsyc
         jcUKGozIPraG3lCkDLPftrKFLh9L83RUDc81tY94+KsK+D9wqKZuQjVPjoMAskCxBwIx
         Fa0EK8VdiE+/5CeyuW4byJK24KPzzz4f4ALTTM6HnTDoNuADKF4RShclY0UgV/MN1vr/
         KzcbcLQI70iRXx7YLKppycppca8TwVyDGMXjEVJOgMiLk83nPppwWn1SdVFSxDNjrhL2
         oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733192; x=1689325192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJu8gPArW2pKxAwcLTACWfXF007XZf4qmmeSySXd5qo=;
        b=OL2AQ/7PHoEnWB0FYa6Lpui1dfRRh40sq/+uEG6Tdszs5b22lEMMaTDZVQeHCUDHoh
         Ep1bcyqFzri2xreqIThBtXjG+CftWMbMNtfUB2a3Cj0roeox5SOMS9XOj0qNJtkRjbJc
         KZoXpGV6ty6rNpNpEltTf3O4vlIvwdLxOFqN8g7Ski0bC5v9RjUyDX1v2oSAXub2a1TV
         o/frRQ4yqT+c5pbV+ExgMGqrAJdJ2Y7/PYRXsOoY7xMDmOdtK7dqJqEuODy4zNRW1XJt
         Xk3prNVCoAx74pzEHNVS8FuqLdGVPmkYiBAngT5tzx2YbMQHRrhnec3kvckwqOv6VLVX
         ruLw==
X-Gm-Message-State: AC+VfDyP6VsOPqpucUMzIg/nhiqMHe9itcvqflTOHP3LLLTptrgriv09
        278rjPj5ATPPANC6kdXglmx2XrMi9nCL+S52eDc=
X-Google-Smtp-Source: ACHHUZ6BVvJlptjJKSTh0QBwvkbzzGtLrBTWpHN9h6HmmXfknCcNJKbU5K/uqS+i7nbRXi6nvFPKyA==
X-Received: by 2002:a05:6512:1c6:b0:4f7:672a:453 with SMTP id f6-20020a05651201c600b004f7672a0453mr586915lfp.17.1686733192084;
        Wed, 14 Jun 2023 01:59:52 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b19-20020ac25633000000b004eedb66983csm57766lff.273.2023.06.14.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:59:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PULL] Update firmware for Qualcomm SDM845 platform
Date:   Wed, 14 Jun 2023 11:59:50 +0300
Message-Id: <20230614085950.238378-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 1cd1c871c9162a2c34380e6dd0c8ac9474d36522:

  rtl_bt: Update RTL8852A BT USB firmware to 0xDAC7_480D (2023-06-12 07:08:48 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb3-update

for you to fetch changes up to 01a7a844cda3009327145d117844fd78bf01011b:

  qcom: Update the microcode files for Adreno a630 GPUs. (2023-06-14 11:54:16 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: sdm845: update remoteproc firmware
      qcom: sdm845: rename the modem firmware
      qcom: Update the microcode files for Adreno a630 GPUs.

 WHENCE                                  |   7 ++++---
 qcom/a630_sqe.fw                        | Bin 32056 -> 32304 bytes
 qcom/sdm845/a630_zap.mbn                | Bin 14256 -> 14256 bytes
 qcom/sdm845/adsp.mbn                    | Bin 10420560 -> 10425168 bytes
 qcom/sdm845/cdsp.mbn                    | Bin 2704916 -> 2709012 bytes
 qcom/sdm845/mba.mbn                     | Bin 242400 -> 242400 bytes
 qcom/sdm845/{modem.mbn => modem_nm.mbn} | Bin 5652688 -> 5673184 bytes
 7 files changed, 4 insertions(+), 3 deletions(-)
 rename qcom/sdm845/{modem.mbn => modem_nm.mbn} (73%)
