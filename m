Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3A5252ABD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 11:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgHZJwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 05:52:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:11244 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbgHZJwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 05:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598435537;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=F/c9iaxZixYGzGo5s+iEIuFcmUCvaL5Q1xK1gdH/2pQ=;
        b=CXrvnvMsa5Sr8yVBvB03YgKPIgU1Qn8VJLpZKnG69ncEe/2npG/827xbFG4qZfDyGA
        KAWylIyWsA8Uqc61dKYYTke6qqwH9p+RhajR3K+FFPQq43OnVJYA0FkyXwxhFJW42TAi
        vcd9vvY919XSAiLqNxy+XEvY1Nyf3A09uAM4W3/QnSlP3kabhCCyur53kn/Gx0lzv/xv
        owyrJVwokUG6cx/BSPVcN/rU/C1pn5GNU/wUty3fjVPks4dwOXeCWv4qOF8ePTsM6Zpp
        jUgSHoIWv2XknBAUZ9eKbyH7Rn9Ze4C7abgIXnytOrmJ+HI36YZfE3/3289p/YE/j2c9
        j2RQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6NYn8D"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7Q9qGl6U
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Aug 2020 11:52:16 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 0/2] ASoC: qcom: common: Parse auxiliary devices from device tree
Date:   Wed, 26 Aug 2020 11:51:39 +0200
Message-Id: <20200826095141.94017-1-stephan@gerhold.net>
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

v1: https://lore.kernel.org/linux-arm-msm/20200819091533.2334-1-stephan@gerhold.net/
Changes in v2:
  - Fix value type in device tree bindings:
    aux-devs should be array of phandles without any arguments, so change
    <phandles with arguments> -> <array of phandles>

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

