Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA5C6F77B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 23:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjEDVCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 17:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjEDVCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 17:02:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6B114352
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 14:01:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-0007eG-9l; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-0018F4-3j; Thu, 04 May 2023 21:45:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet0-001JhD-03; Thu, 04 May 2023 21:45:06 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/18] remoteproc: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:35 +0200
Message-Id: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3577; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1MtyBZrEfa4B8pF3gNxwA18Zw/gtonyelyJbi+5OOFE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAm8mOKc9b0/danYJCdc61k/Zj773LlxBpbUo 6ju5XkgRdqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJvAAKCRCPgPtYfRL+ TiAxCAC1E8bg6I203hTsrJ3wz7jlhRBG+fWX/irJYFYhOed/WIzieyXyY+YZZGF/caBCQuNl/H2 EULhxcNYvCWrNjmBRI2piNO1ZuXOFto63zWyAhJTPQS/uggSvQbcfHNyOiYTw+E1WbsQfb/7M/0 EOM9LXiivD71kmmMXWccckezN3teMuquCvd1trbFddSRdCChxk18k0WQHX+OZeFnQkvAvVLiXSi XfaTFa/jEyblKAeusAq7t4qaGgHsVYZ5AwobaS9C6vwD4koSOeOH0MKmDL+JgToipyEaSNtlaAo VlUdExOqycUZ2WBDSRZ6kr8sK7G70uAtTEfaN/SN2UzfTwnZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

this patch series adapts most platform drivers below drivers/remoteproc
to use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak. One driver suffering from
this problem (s3c2410) is fixed by the first patch.

By changing the remove callback to return void driver authors cannot
reasonably (but wrongly) assume any more that there happens some kind of
cleanup later.

There is one driver (i.e. ti_k3_dsp_remoteproc.c) that might return an
error code in .remove(). I didn't look in detail into this driver, but
if that error happens, we have exactly the bad situation described
above. (Note that kproc->mem and the register mapping goes away.)

Best regards
Uwe

Uwe Kleine-König (18):
  remoteproc: da8xx: Convert to platform remove callback returning void
  remoteproc: imx_dsp: Convert to platform remove callback returning
    void
  remoteproc: imx: Convert to platform remove callback returning void
  remoteproc: keystone: Convert to platform remove callback returning
    void
  remoteproc: meson_mx_ao_arc: Convert to platform remove callback
    returning void
  remoteproc: mtk_scp: Convert to platform remove callback returning
    void
  remoteproc: omap: Convert to platform remove callback returning void
  remoteproc: pru: Convert to platform remove callback returning void
  remoteproc: qcom_q6v5_adsp: Convert to platform remove callback
    returning void
  remoteproc: qcom_q6v5_mss: Convert to platform remove callback
    returning void
  remoteproc: qcom_q6v5_pas: Convert to platform remove callback
    returning void
  remoteproc: qcom_q6v5_wcss: Convert to platform remove callback
    returning void
  remoteproc: qcom_wcnss: Convert to platform remove callback returning
    void
  remoteproc: rcar: Convert to platform remove callback returning void
  remoteproc: virtio: Convert to platform remove callback returning void
  remoteproc: st: Convert to platform remove callback returning void
  remoteproc: stm32: Convert to platform remove callback returning void
  remoteproc: wkup_m3: Convert to platform remove callback returning
    void

 drivers/remoteproc/da8xx_remoteproc.c    | 6 ++----
 drivers/remoteproc/imx_dsp_rproc.c       | 6 ++----
 drivers/remoteproc/imx_rproc.c           | 6 ++----
 drivers/remoteproc/keystone_remoteproc.c | 6 ++----
 drivers/remoteproc/meson_mx_ao_arc.c     | 6 ++----
 drivers/remoteproc/mtk_scp.c             | 6 ++----
 drivers/remoteproc/omap_remoteproc.c     | 6 ++----
 drivers/remoteproc/pru_rproc.c           | 6 ++----
 drivers/remoteproc/qcom_q6v5_adsp.c      | 6 ++----
 drivers/remoteproc/qcom_q6v5_mss.c       | 6 ++----
 drivers/remoteproc/qcom_q6v5_pas.c       | 6 ++----
 drivers/remoteproc/qcom_q6v5_wcss.c      | 6 ++----
 drivers/remoteproc/qcom_wcnss.c          | 6 ++----
 drivers/remoteproc/rcar_rproc.c          | 6 ++----
 drivers/remoteproc/remoteproc_virtio.c   | 6 ++----
 drivers/remoteproc/st_remoteproc.c       | 6 ++----
 drivers/remoteproc/stm32_rproc.c         | 6 ++----
 drivers/remoteproc/wkup_m3_rproc.c       | 6 ++----
 18 files changed, 36 insertions(+), 72 deletions(-)


base-commit: 1a5304fecee523060f26e2778d9d8e33c0562df3
-- 
2.39.2

