Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4925E58C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 04:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiIVCrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 22:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiIVCrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 22:47:04 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A50185F8B;
        Wed, 21 Sep 2022 19:47:03 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id y141so6676312iof.5;
        Wed, 21 Sep 2022 19:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=h1angYPs614TPXEI7kKlA5pZMOV1qeh0yN6lGNKuXZA=;
        b=Lj5mw0VgCTWu8452v3MHJPjCGErBsrxpWmv7YLQum0zJLOBBpIwaOyqcRy34nQMCmq
         x0a4Iqa5rjSZMc0nTX0As6n/a6u3w0lxrv/yNRWmCnP9J9YKkOjUSfagnXkXyrjEJT6V
         Ge9V/sSV4By8hlnV4WQVPeDI9avKHF+PYuAu9ZKwexsyzIdHOAtYAmqKWXY/XzeEh37q
         EsYmGQdGPDG2R3uVQ+co9lphYbOwfbn/AtrtQquZ+/plJEzIsCiBS9n8M8qbjd0AOlfP
         SIVWkOdUJDckV/BXmI8Sd9aZgbAVWSlYxKYJY5HOquuzeWGsLtiiwUlXw9czPMoMUuqw
         Htnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=h1angYPs614TPXEI7kKlA5pZMOV1qeh0yN6lGNKuXZA=;
        b=07s6FID1SMYcpgFhUsI+nM7t7w+GYurreh9NBgtKbg9XcaGu4gJOttlDatsp1I0NaV
         Z8G/cQkmuWu6PUXBxZiX9rDd3jrsIUmUcW4Up+DxCt0dW4jCONtrSBsPqcKtiOuE2x5L
         yxB6uwkTF96o1rS77qDPpD/VCX0VdswZEuhIbUzO4kTrGzwI3EZy89dAnN3IY5nUDdYe
         jzZT/hHTW++6IGupDwLAj8/eB4eZMpznrdQqsDmmC0AASZC/f9r/wdLr2+NVFA7Yt8C1
         W7V3bHhSjS2brmb8UzlCkT6/jAgDslP5nCeQHAnaUbs3QnF5CIqb4wxM2kTSugVE/1Im
         ZGHQ==
X-Gm-Message-State: ACrzQf0Tgu30l6+GxwUPxkUtV0EdgFGrGIW8E7M3z7YF4HoFM2N1VZqG
        u8lTlnzTXno+pvi3kQZ2RX9UikJHpCg=
X-Google-Smtp-Source: AMsMyM4YflKoLYGiqMpOqd+yPzlN9/XCcePyq1JTPj4Zuu0zLFikCgTjfu5/f02I1wQPJV7YMtrWvg==
X-Received: by 2002:a02:93c7:0:b0:35a:3271:1c83 with SMTP id z65-20020a0293c7000000b0035a32711c83mr737360jah.105.1663814822421;
        Wed, 21 Sep 2022 19:47:02 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::61a4])
        by smtp.gmail.com with UTF8SMTPSA id p1-20020a02b001000000b0034edaddd1d7sm1707606jah.144.2022.09.21.19.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:47:02 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/2] SDM670 USB 2.0 support
Date:   Wed, 21 Sep 2022 22:46:54 -0400
Message-Id: <20220922024656.178529-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
 - drop driver patch (some maintainers might be excluded from v3
   recipients because of this)
 - add entries in usb clocks and interrupts

This adds compatible strings for USB 2.0 on the Qualcomm Snapdragon 670. I
have no way to test USB 3.0 because my SDM670 device doesn't have USB 3.

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 3 +++
 2 files changed, 4 insertions(+)


