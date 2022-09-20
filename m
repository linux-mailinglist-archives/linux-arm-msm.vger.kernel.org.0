Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2855BDA36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiITChV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiITChV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:37:21 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8E847B94;
        Mon, 19 Sep 2022 19:37:20 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id x13so696417ilp.3;
        Mon, 19 Sep 2022 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=T6Bc82z40BHWQf4QIPmDTMbTTv/alemCOLcqzv8oHg4=;
        b=CWonZ132sQRpUFVvRamub4wrJhQyq+YCoDlqhfGAkAdROBYLw/cenOn6o8Ls50aKbz
         VVnAl1A1LO8EPuz6vbRi1qus/973e5F12PMEAz7ZItaTeL3prF2i8PcASsNrWR/M2pBV
         P35N+F29aJh+/Sla8BDrCBFPhfzgBsXrxPWZCoYSRTRqUMIOwiL1x26lxLcwZ6nDIVja
         /76+yI07yKTA25HWlv3cHlIKSaGxSVl+tZA44dQ1/aLnlsdqvh2t2PsQ0juJp/zfTSxB
         kFtJjdYErjWrSzj6yRqqAlo0gtT50WOj5WsqxRLT2iGwrPlf7u7lpctcJ9B99v56MDHn
         6XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=T6Bc82z40BHWQf4QIPmDTMbTTv/alemCOLcqzv8oHg4=;
        b=KxtCvxnjTz9C78ES8IlHzXdvHC9LYks1F1QnfmXN1886aLNnZTJtGj/uesE0b3Zzcx
         mkjQnwe6UvCLEJUuX/hEdITbgWszXAyFYAWGnT4CEzQH51CB3tR9oD8wkC8WA+YZk4A2
         keK+mKrDwXTyKZVPtWUl2PLJGOaVhB9yOWhHLqEbxNnL3myAoqaymcU/8HBM3M4fXO8P
         rVhm8dIolsa7tjmknuskZXxaJV0rHoitKMB1/XghFtLY3/HXRxFC/B6uJq4T/9KJPkc9
         zw0FPPbOpxKRoYb9FwXw3g7YSICATCj+HYAUm/XZ2HxJJVdoCJ0Q3vBZo7BFDg82O5GO
         JQ/w==
X-Gm-Message-State: ACrzQf2NPMcdGjjgANJeMTMVHyi72OioTwWSKZmnTZ3SGXfKmxCv8l8p
        +3YzKgkRxRA7aHBSU3cTtPawsWmiid8=
X-Google-Smtp-Source: AMsMyM7UI4AgxcVDOP9RfP0al2XR1nGD0ur6FErKe+nwNhmS1Sz3Cln83qkQFeHW/g2aefXKWUGtPQ==
X-Received: by 2002:a05:6e02:1d17:b0:2f1:4cae:df88 with SMTP id i23-20020a056e021d1700b002f14caedf88mr8650656ila.198.1663641439658;
        Mon, 19 Sep 2022 19:37:19 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id g15-20020a05660226cf00b0068a235db030sm128966ioo.27.2022.09.19.19.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:37:19 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] SDM670 RPMh Clocks (real)
Date:   Mon, 19 Sep 2022 22:37:07 -0400
Message-Id: <20220920023709.4865-1-mailingradian@gmail.com>
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

This patch series adds clocks controlled by RPMh for Snapdragon 670.

Note that these patches add the actual clocks, and is not a duplicate of
the regulators series which I mislabeled by accident.

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml      |  1 +
 drivers/clk/qcom/clk-rpmh.c                         | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)


