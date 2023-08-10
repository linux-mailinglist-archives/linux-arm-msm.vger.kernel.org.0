Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD78777228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 10:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjHJIJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 04:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbjHJIJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 04:09:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472B02106
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 01:09:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so5519205e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691654954; x=1692259754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsX5oKEyFSe+RgZBEB8JkNzTpB96tD6QQCUVk3EhDv4=;
        b=yZWUCfTHC7LgxowkMm97O88bFAr77Q7obnNSg4cGopsi/uqBRPVsruAFADVTUr3fQc
         pou96Zmf+K8VrjJcYz0PwRwx/I0TOagmb6iDEPTfTRfI0t0MljUh7Sq3yfPvsSEGiyZE
         D452pmg7V/go7sIoHuCTSJz4jevW3pj0oLBID14MipZMUGZcRiWv/t4lDttis8uBAK8W
         eWMkm3r7iBV7hQVjJXy28YXDSrhCIDZVlJ6qsEqH0/iXg970m9zAciZQy7cJsdxFlMVu
         /OO8gGmdddDMtddSZW9MN47Jv8cABZ+ppPO/jM7jV26CTkiBUXbAcYJFRcZFmuuYKZ17
         tMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691654954; x=1692259754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsX5oKEyFSe+RgZBEB8JkNzTpB96tD6QQCUVk3EhDv4=;
        b=UPf99BPN1cv9XLpnzgkeToydG0MRUxxQf/86ZlrAH2uvKQdUzTebzCdtJfvPhPhCqu
         xyw/K/oJSQ47APokiGAJah51FOKgLU4RQAjdYGzVcVPWYVUFqnRp3xWM9UsE2FUg8JyB
         MXPBwIlAYl6dYm2FtASNeOFZvcf9Z8FhT76pj/lLX6cm2oTmbvwzUlfpBmMUxhA7A7n6
         2bC3JgiJaCeeT3so7dj0af0jKd2dbz4uISKDTtLURzMlPwa1ijxZt6oSnXj/87J1rzxg
         1Yetdje/aFl/Ooj1kkyt9qvvnC7G4bSbAlg4YXL2XNxIEkOKAjqfjEEr7K7eUdww2YC6
         BLgg==
X-Gm-Message-State: AOJu0Yx3caEMl65GsZaKHGykxLYpAbqRfPjXpz4N/7vw4B+ZE4djK5Ci
        wFpmcKNrxEXkC5q3EWmm7v8P1Q==
X-Google-Smtp-Source: AGHT+IFerTkKdSdiC8LnKg+PNItLplFhmiGNknJh7WpIPMZ1ebJmQ1fWhTg1F7ajrQn/O/Z705YH9g==
X-Received: by 2002:a1c:f716:0:b0:3fc:92:73d6 with SMTP id v22-20020a1cf716000000b003fc009273d6mr1204841wmh.11.1691654953620;
        Thu, 10 Aug 2023 01:09:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:74d3:226a:31b3:454c])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003fe2f3a89d4sm1321790wma.7.2023.08.10.01.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 01:09:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/9] arm64: dts: qcom: enable EMAC1 on sa8775p
Date:   Thu, 10 Aug 2023 10:09:00 +0200
Message-Id: <20230810080909.6259-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This series contains changes required to enable EMAC1 on sa8775p-ride.
This iteration no longer depends on any changes to the stmmac driver to
be functional. It turns out I was mistaken in thinking that the two
MACs' MDIO masters share the MDIO clock and data lines. In reality, only
one MAC is connected to an MDIO bus and it controlls PHYs for both MAC0
and MAC1. The MDIO master on MAC1 is not connected to anything.

v1 -> v2:
- remove pin functions for MDIO signals and don't assign them to MAC1
- add a delay after asserting the PHY's reset signal, not only when it's
  released
- remove the entire concept of shared-mdio property
- add aliases for ethernet nodes in order to avoid MDIO bus name
  conflicts in stmmac

v2 -> v3:
- add a patch sorting aliases in sa8775p-ride.dts and sort the ethernet
  entries
- remove a newline between clocks and clock-names properties
- collect tags

Bartosz Golaszewski (9):
  arm64: dts: qcom: sa8775p: add a node for the second serdes PHY
  arm64: dts: qcom: sa8775p: add a node for EMAC1
  arm64: dts: qcom: sa8775p-ride: enable the second SerDes PHY
  arm64: dts: qcom: sa8775p-ride: move the reset-gpios property of the
    PHY
  arm64: dts: qcom: sa8775p-ride: index the first SGMII PHY
  arm64: dts: qcom: sa8775p-ride: add the second SGMII PHY
  arm64: dts: qcom: sa8775p-ride: sort aliases alphabetically
  arm64: dts: qcom: sa8775p-ride: add an alias for ethernet0
  arm64: dts: qcom: sa8775p-ride: enable EMAC1

 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 102 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  42 +++++++++
 2 files changed, 136 insertions(+), 8 deletions(-)

-- 
2.39.2

