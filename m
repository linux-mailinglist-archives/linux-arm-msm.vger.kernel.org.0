Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0D4520105
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 17:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238327AbiEIP1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 11:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238204AbiEIP1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 11:27:11 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C6E2A1883
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 08:23:14 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v65so15520434oig.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REojqMTypU3/iERzyVKWOawFG50CjfHR0afcTjLuxM0=;
        b=jBb0jbM39pGn+Md7Husess5D5OKzKj906uv1BI0sHPD3y1nCOhro/8dNlnoF3xdp++
         UHfXxeee2gQWOgvK0avSEj1PYUXdwbYI4ZDqyjex5T1gh/3PL2lP2xwlusoFMMo6hQnY
         g/wSdypa+lJm9Q66Ucb8TYyVfKURJJyxI3J+o6L7PV4lP8CaNSQG+L7oujmCf/AwFFex
         zfKtS5rDV5X/E2eAYi5jhIDENhFV3MBU6s9ENGTDcData07T+NfZwdnfTOT9PdX1SWkd
         c7gJi46erOrrpoLBaKsUOZTzWAh2sI3UgzcdVPFmveenYnPD8ynaNxPNA1xJcQQTwVOJ
         1Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REojqMTypU3/iERzyVKWOawFG50CjfHR0afcTjLuxM0=;
        b=PIaIBayNNcMX0GTbkWJptHZCAL9Sf3uNcQjzST3E/32rosSftOggTIVI1SxMTB4PYr
         QNW77h4mNZWJylNnTrJQZvpAcbYdq5eyrXaflrhhJOKzKI/ijuJ6I9Fqn5tyz9ohwJx5
         aNNGbZgGRrU+wOdNrczYVnMM5XzLFD2m89UCrBRtPWDx9VBQeu/V/qTdBi8zIfLNUqt2
         sdQP92NWA0fgnKOgw4sutbi7hBV+bHjdyCIY3RrXQlZbw8EbBI4TFMMMjzwQkKqMekPA
         LQuaEt50I7gTqyAUAm3173I95y0Zbc+E3nbKeTtmKK+KATiCOCSse9BBOCo1fyJcUPJu
         YMmQ==
X-Gm-Message-State: AOAM533QlhFmzy4AfmIONA3pkUArMMtFzsnNPGDpIbGIHPzUzLoWqgsv
        SnLv7onpCWT6Crsk1YwaG8sPMA==
X-Google-Smtp-Source: ABdhPJzNbJWnvjVt0Sxu1YmytFAB5FhsVfRm9P5Jy8Zc0DzeRDBagQM0LpnOtBrg0cuX5F9QRHY2nA==
X-Received: by 2002:a05:6808:192a:b0:326:a728:f8a3 with SMTP id bf42-20020a056808192a00b00326a728f8a3mr5731967oib.153.1652109793810;
        Mon, 09 May 2022 08:23:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k18-20020a056870d39200b000e932746d33sm4372902oag.28.2022.05.09.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 08:23:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.18
Date:   Mon,  9 May 2022 10:23:10 -0500
Message-Id: <20220509152310.306179-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.18

for you to fetch changes up to 18019eb62efb68c9b365acca9c4fcb2e0d459487:

  arm64: dts: qcom: sm8250: don't enable rx/tx macro by default (2022-04-11 21:40:57 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.18

This disables the two Soundwire controllers as well as rx and tx macros
by default on the SM8250 platform to avoid crashes on devices where
these aren't available.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8250: don't enable rx/tx macro by default

 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    |  4 ++++
 2 files changed, 16 insertions(+)
