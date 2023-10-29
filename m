Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D727DAD52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Oct 2023 17:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjJ2Q6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Oct 2023 12:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjJ2Q6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Oct 2023 12:58:02 -0400
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABB7C4
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Oct 2023 09:57:54 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id B12CC1C258F;
        Sun, 29 Oct 2023 17:57:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-088-078-198-137.088.078.pools.vodafone-ip.de [88.78.198.137])
        by srv01.abscue.de (Postfix) with ESMTPSA id 3E4AD1C258E;
        Sun, 29 Oct 2023 17:57:49 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 0/4] ASoC: qcom: check ADSP version when setting clocks
Date:   Sun, 29 Oct 2023 17:57:12 +0100
Message-Id: <20231029165716.69878-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The apq8016_sbc driver currently works on APQ8016 and MSM8916 devices. It
should also work on MSM8909 (and newer SoCs like MSM8917 and MSM8953 if
the quinary MI2S line is added); however, newer devices with these SoCs
ship with newer firmware that uses a different interface for controlling
the digital codec and bit clocks, which causes the driver to fail because
it cannot set LPAIF_BIT_CLK.

In order to fix this problem, modify the LPAIF_* clock implementation in
the qdsp6 driver to use the newer clock API if a newer firmware version is
detected. This seems to be a better solution than exposing the firmware
version to other drivers like apq8016_sbc and forcing them to figure out
which clock to use.

On MSM8916, a hack is currently used to control the LPAIF_DIG_CLK directly
through the GCC driver, but on devices with the newer firmware, the
INTERNAL_DIGITAL_CODEC_CORE clock provided by q6afe-clocks in the qdsp6
driver can be used instead. Add a fallback to make this clock work with
the older firmware too, allowing one to specify it as the codec's "mclk"
in the device tree:

  compatible = "qcom,msm8916-wcd-digital-codec";
  clocks = <&xo_board>,
           <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
                     LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
  clock-names = "ahbix", "mclk";
  assigned-clocks = <&q6afecc LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
  assigned-clock-rates = <9600000>;

This works both on MSM8916 and on the newer SoCs mentioned above.

---
Changes in v2:
- Log unknown AVS versions
- Move some checks to q6afe-dai as suggested by Srinivas
- Also implement LPAIF_OSR_CLK for ports that have it

Otto Pflüger (4):
  ASoC: qcom: q6core: expose ADSP core firmware version
  ASoC: qcom: q6afe: provide fallback for digital codec clock
  ASoC: qcom: q6afe-dai: check ADSP version when setting sysclk
  ASoC: qcom: q6afe: remove "port already open" error

 sound/soc/qcom/qdsp6/q6afe-dai.c | 98 +++++++++++++++++++++++++++-----
 sound/soc/qcom/qdsp6/q6afe.c     | 30 +++++++++-
 sound/soc/qcom/qdsp6/q6core.c    | 65 +++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6core.h    |  9 +++
 4 files changed, 185 insertions(+), 17 deletions(-)


base-commit: 66f1e1ea3548378ff6387b1ce0b40955d54e86aa
-- 
2.39.2
