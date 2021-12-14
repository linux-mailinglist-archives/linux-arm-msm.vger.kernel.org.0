Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5A724744B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 15:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhLNOWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 09:22:49 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:30473 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhLNOWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 09:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491754;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=av2Qq+J6PbfFPBH/diii4rDrGbpUSmagYYOyWFKE/74=;
    b=YhzjZZ+gWbTGnypGjUd6vNQku9LSEHDjS5PPDI8T9/md/Z+xKOSdwiO3meQXQkNOsb
    bgHJaHdM5MsJBdU9eNbV53m6bIlGfgsmCHi3gV9qX03sd8GzR43tXNS8qtdNl6Jy81ib
    k9btp3sZ4CkPnh0fV2sTD4VCjjkxsWWyxrn31OgQd3j6/iqWsL6yf04Zc6p8Rfadvvgv
    nxeEUsd/+lufYpbv55aLAR1V2hJa1hfEImoHZoQmoi+0/nvamY1KxBW3LuSFKCSzlStq
    a1tofc/PJdZRrpxFvxv3/q31GuJyCjpWK16rQjtwei4sRMg1iIm96msuCfucx3UfRTke
    IjYw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEEMX8rV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 15:22:33 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Paul Cercueil <paul@crapouillou.net>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 0/4] ASoC: qcom: Parse "pin-switches" and "widgets" from DT
Date:   Tue, 14 Dec 2021 15:20:45 +0100
Message-Id: <20211214142049.20422-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some sound card setups might require extra pin switches to allow 
turning off certain audio components. simple-card supports this
already using the "pin-switches" and "widgets" device tree property. 
This series makes it possible to use the same properties for the Qcom 
sound cards.

To implement that, the function that parses the "pin-switches" property 
in simple-card-utils.c is first moved into the ASoC core. Then two 
simple function calls are added to the common Qcom sound card DT parser.
Finally there is a small patch for the msm8916-wcd-analog codec to make
it possible to model sound card setups used in some MSM8916 smartphones.
(See PATCH 2/4 for an explanation of some real example use cases.)

Using pin switches rather than patching codec drivers with switches was
originally suggested by Mark Brown on a patch for the tfa989x codec:
https://lore.kernel.org/alsa-devel/YXaMVHo9drCIuD3u@sirena.org.uk/

Stephan Gerhold (4):
  ASoC: core: Add snd_soc_of_parse_pin_switches() from simple-card-utils
  ASoC: dt-bindings: qcom: sm8250: Document "pin-switches" and "widgets"
  ASoC: qcom: common: Parse "pin-switches" and "widgets" from DT
  ASoC: msm8916-wcd-analog: Use separate outputs for HPH_L/HPH_R

 .../bindings/sound/qcom,sm8250.yaml           | 16 ++++++
 include/sound/soc.h                           |  1 +
 sound/soc/codecs/msm8916-wcd-analog.c         |  7 +--
 sound/soc/generic/simple-card-utils.c         | 45 +----------------
 sound/soc/qcom/common.c                       | 10 ++++
 sound/soc/soc-core.c                          | 50 +++++++++++++++++++
 6 files changed, 82 insertions(+), 47 deletions(-)

-- 
2.34.1

