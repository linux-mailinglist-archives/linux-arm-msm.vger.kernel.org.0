Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7C0249925
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 11:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgHSJRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 05:17:00 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:25067 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgHSJQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 05:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597828615;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=KBxaiKTiUrR6hC8o8gRpoaXAi+p+Ke5nJCb3qamL0rk=;
        b=JYfK7JXkW//QpLbOAxOEwfQb+u0hjwS/ecNIe6ZwLdfJxY8Xs4wB7eBATMt25n3Kg5
        MTq+gpb4lMTanYJobgDIsw/EEQGwKYvVCFgOxMSG0CNjOfJ9q9QOayXr5X4sqwCd1pRw
        ZINZjBSpUaKUKQ5mMQJhUoGQCpq1UYJN5K7XQYKRwg/XXWPW9dYU0bLAaE3KOA3NlXkN
        7m0wPSwOWFWTjv0c4JY2gFbIvUMnAoDtxvdbNtq1OLOEYzwAqIi9Uz8yyx8wc/iCThXw
        /fTgGTdpJe0TmcBB/C02bbcj6+nL6BxpxxhzcL2kp95gbCcV8LwObSzfMKTJGdBRxEeF
        uELA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NDwQo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7J9Gt0SQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 19 Aug 2020 11:16:55 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/2] ASoC: qcom: common: Parse auxiliary devices from device tree
Date:   Wed, 19 Aug 2020 11:15:31 +0200
Message-Id: <20200819091533.2334-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases we need to probe additional audio components that do
not appear as part of the DAI links specified in the device tree.
Examples for this are auxiliary devices such as analog amplifiers
or codecs.

The ASoC core provides a way to probe these components by adding
them to snd_soc_card->aux_dev.

This patch set allows specifying them in the device tree through
a new "aux-devs" property.

Stephan Gerhold (2):
  ASoC: dt-bindings: qcom: Document "aux-devs" property
  ASoC: qcom: common: Parse auxiliary devices from device tree

 .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
 Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
 sound/soc/qcom/common.c                                   | 4 ++++
 4 files changed, 27 insertions(+)

-- 
2.28.0

