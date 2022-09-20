Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBDB5BF05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiITWnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiITWna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:43:30 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD8866A4B;
        Tue, 20 Sep 2022 15:43:29 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id d8so3605463iof.11;
        Tue, 20 Sep 2022 15:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=nFAUedsUxBlySo2MTS0W3FNkaJTiK1eOxhG9I/NOEvk=;
        b=fYTPTuolkUTeEMR8/B4KqNuwol/Kp2cWBXJuZUP4aSGZENbHy8h/vro3DPJYoXuD0y
         Xv0eWzfb//Jq8fPADfk7PFg6sgxpHrqvTkui7QAn6KgkH7K+nANLo9PDS4zoopS2hhkd
         I0xXkatWsF4bayLRyeogGGGPWDVeOUuWiKf6cTEP4I5WLO1hAQYXOn1+NMN5GtE9FNGo
         r4bjbHJuaXUCZKDFBO+5NVRt79nP+Un3bsI6VP03TYPxBMyUwT9hCuzDUP/XsL+tUfgb
         ImOXjOezSafIm6mCBWVKb2o8JgnWjk/drYEHNoomBvAYGIweFzDvQHX0w18lP0CFKs2Y
         KLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=nFAUedsUxBlySo2MTS0W3FNkaJTiK1eOxhG9I/NOEvk=;
        b=DHBC9pX3rc6urLTocz1najvD8KmWpP8c0eWy7yT5rdeIQxUxA6NCyAX/Nmvz4qU7pC
         50zkc73/SZ+MvV0u8h9ZYmDoZh3eJUrZ+LAxssFvCQsUzljQGktGq0ws5oWdr7n44Psj
         d+0ONauA0gtg44yK4WhVIFV4HZbfD4Ez3abuKeL+smgROYw5jY/5+QcIfDAMqB/opvx4
         vsVzXhKaiZtU6vO9tR0p1R7FBIEhvgyuOAxpzTlzm6PhemAfFvg0vQaUsruaXPgbYviD
         Y0nhmfW0jFa4je2XCKkU4pDQrELi9pZeFt7C7ArMDorjywW4aXO7cZrSkJPl7P0ES4tm
         0AHQ==
X-Gm-Message-State: ACrzQf2wtK0g5aHQMuU7yW6Xma5eKXiuevNfMY+lUG03GAyWiZuF4nuX
        4rj+a6j0aeikNPRxE2LjDLm/q3QSVKY=
X-Google-Smtp-Source: AMsMyM6QDkvI5JccVZkUC6pDooMsxg5WyMFda4zAZHddt7tf12r8xJtGk1JGb4kHikqRnKcSWlH1/w==
X-Received: by 2002:a05:6638:1686:b0:35a:2566:6786 with SMTP id f6-20020a056638168600b0035a25666786mr11835273jat.180.1663713808345;
        Tue, 20 Sep 2022 15:43:28 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id c97-20020a02966a000000b0034d90222997sm392192jai.66.2022.09.20.15.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:43:27 -0700 (PDT)
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
Subject: [PATCH 0/3] SDM670 USB 2.0 support
Date:   Tue, 20 Sep 2022 18:43:17 -0400
Message-Id: <20220920224320.152127-1-mailingradian@gmail.com>
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

This adds compatible strings for USB 2.0 on the Qualcomm Snapdragon 670. I
have no way to test USB 3.0 because my SDM670 device doesn't have USB 3.

 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml      | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                              | 1 +
 3 files changed, 3 insertions(+)


