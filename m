Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF9C73A912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 21:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjFVTl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 15:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjFVTlY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 15:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99481BF6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687462840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=YAdDzI7a2w7zSAyjPyNNq/Ev472c8eoVURScYubF4TQ=;
        b=ZxKzSNad/or2mqmP5cjxxeS7vRaQXt89LPTyvBeU87wjU7IscIb3qLJEfZtQ745krOAIXD
        O+Yamqyf5jIJ7iOWTF1t6+SnnRS9Zomz+HUg6dxvebAMZpAGksStQ1uyEEVRPUGwC0sGbu
        H51JbTNGHb5JKOGBePfycCiknYe7Knc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-CJ_qWPISPlu5Qg0zblnaNg-1; Thu, 22 Jun 2023 15:40:37 -0400
X-MC-Unique: CJ_qWPISPlu5Qg0zblnaNg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-62fe611af5bso81652916d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687462836; x=1690054836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAdDzI7a2w7zSAyjPyNNq/Ev472c8eoVURScYubF4TQ=;
        b=fvfgpfsICF9/n6mVFPpvby/NB4xLoML/BqbpOZ8RwTsg4h1j+DtNkTypicLloJNtO0
         pL4blVkX2rjIS6ZYWn38uWZD6Q48NyFES3DyxO5Q9CVygdgebeWhXVSUoHtWl/rb/fyG
         +ucdQ2eL7MZmX3hTyQ8w0st7OBpPsNPs0HKFW+z4cLiOnqM69WSZqwEdOqEZbHixuWht
         gZ8exbVuOocuM8RgE1FdaKxRlkLmYGL+RSkCvn48VW62u5Hm9Ndon3+zUjxRltNwEWY+
         mMkDDtwwOvWaW1HCwrP6DFlVXt/Lt7HZC05gx4/FkahkRQfTCibmyio5iGwIYMyO8WO5
         M85A==
X-Gm-Message-State: AC+VfDxIFnkWgVVUdsKjvAYL0R/TuQh/sfk/ifPs9gqVYTjoDKBgUY/w
        eBGGnlUO7H5klO6STo+IUl/jsEsTyAmUL/nbsZi8TbDQEu4524+Jh2u3NrwFWZmb/pL4LmNYXTf
        z+X6SP3w9XhCFUXpV28wNKeniSA==
X-Received: by 2002:a05:6214:2348:b0:628:8012:bee7 with SMTP id hu8-20020a056214234800b006288012bee7mr23807896qvb.20.1687462835927;
        Thu, 22 Jun 2023 12:40:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Us4gIajbkbBYAl1GQwlecTXJ2MQWP3hipq9LV+yvMlB+t2tpeI2+qq/juzy83d2qaMcEJfg==
X-Received: by 2002:a05:6214:2348:b0:628:8012:bee7 with SMTP id hu8-20020a056214234800b006288012bee7mr23807877qvb.20.1687462835633;
        Thu, 22 Jun 2023 12:40:35 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id jo30-20020a056214501e00b006301819be40sm4174183qvb.49.2023.06.22.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 12:40:35 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 0/3] Fixes for qcom-snps-femto-v2 PHY driver
Date:   Thu, 22 Jun 2023 15:40:17 -0400
Message-Id: <20230622194021.80892-1-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains a few fixes for the qcom-snps-femto-v2 driver,
notably:
- make sure ref_clk is properly enabled
- add system sleep PM ops to disable the clocks on system suspend

v2 -> v3
- "phy: qcom-snps-femto-v2: add system sleep PM ops" - add link to
  downstream driver used as reference (Andrew Halaney)
- add commit "phy: qcom-snps-femto-v2: use
  qcom_snps_hsphy_do_suspend/resume error code" to make sure PM ops don't
  always return 0 (Andrew Halaney)

v1 -> v2
- keep cfg_ahb clock and use clk_bulk API to handle both cfg_ahb and ref
  clocks (Bjorn Andersson)
- add system sleep PM callbacks (Bjorn Andersson)
- add Link: and Fixes: tag (Andrew Halaney)

Adrien Thierry (3):
  phy: qcom-snps-femto-v2: properly enable ref clock
  phy: qcom-snps-femto-v2: add system sleep PM ops
  phy: qcom-snps-femto-v2: use qcom_snps_hsphy_do_suspend/resume error
    code

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 87 +++++++++++++------
 1 file changed, 59 insertions(+), 28 deletions(-)

-- 
2.40.1

