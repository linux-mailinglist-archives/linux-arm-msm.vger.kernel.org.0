Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868AD7428C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 16:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjF2OrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 10:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjF2OrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 10:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC822707
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688049981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=CNL+hnN23HboCzCP5TjwREUx1ktgKGnxEOC00C2eDE0=;
        b=e/vXXUr+biXmghpfN6/QcZLWksiYIyGbZ3RUfZ3zfEXUOVEhULPy59WLau/khy7VNIzGfu
        eg2RkXZ5iTidDhDgzBaKjTUtGoJ6juChpug2lht0DGEfpnaRp//ZQ29IkS2g9dmFnbK3UC
        AUyLsyh0RknkYPz0bRa1tRins4xPdGI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-IyPJr0clPf2yLAdzIarIaQ-1; Thu, 29 Jun 2023 10:46:20 -0400
X-MC-Unique: IyPJr0clPf2yLAdzIarIaQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-635a4267cf5so8594286d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 07:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688049979; x=1690641979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNL+hnN23HboCzCP5TjwREUx1ktgKGnxEOC00C2eDE0=;
        b=mHDBq83xoKoLWs5DOrhSpJRzGU3ZcBIUaCNCDffNyALsa8nZDauZuWPnei7wQaMOMM
         vAllTTYs861CVXFiUKg7OAcJ0rauTB60nLFSQK8B7Bx0jNHikz/iDpkyKQxEx+qz5+vN
         5qxdIfE600cISl0n6UXh3qROsv91mupCBsfuoalZCXpnOa/NF5WQkBxMkoZ9hnxzl2QP
         BTlDZNe011Ewu1SdnZWzJRPIWxVS4OHKYBPYYuJX/+M9XrcpHPx9C3R0AsUTq45zmef/
         dOYuXL9DmxWnsJwH6nnhcGfIytz1KNLxV8NmfBfBdMlY2DADnkFygV40UGEWNHtmclS/
         niCw==
X-Gm-Message-State: ABy/qLbdJDjQcL6Mv7l2jCfavyS636YEhXT7nvL51a0maActWau4IdOa
        TBxmqEVZC227LYXOchcfDCj190HY3pMkn9UdwQEfLlRGK7K0UemGFajmYAOBfNluzGHgogWdHgo
        0LhSq4WP2iRo7uNz3nnX3+ZeYww==
X-Received: by 2002:a05:6214:29eb:b0:636:2169:4298 with SMTP id jv11-20020a05621429eb00b0063621694298mr2089039qvb.1.1688049979427;
        Thu, 29 Jun 2023 07:46:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHM3fYxBjd3fdjmDJ0KQXKCOe9yHzW98ieDfK7Cgocpm7rc0LvYNrrxFwg9+YVkOrSgV5Mzqw==
X-Received: by 2002:a05:6214:29eb:b0:636:2169:4298 with SMTP id jv11-20020a05621429eb00b0063621694298mr2089026qvb.1.1688049979165;
        Thu, 29 Jun 2023 07:46:19 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ccdd1000000b005dd8b9345b4sm7055590qvn.76.2023.06.29.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 07:46:18 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Fixes for qcom-snps-femto-v2 PHY driver
Date:   Thu, 29 Jun 2023 10:45:37 -0400
Message-Id: <20230629144542.14906-1-athierry@redhat.com>
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

This series contains a few fixes for the qcom-snps-femto-v2 driver, mostly
clock-related.

v3 -> v4
- remove commit that added system sleep PM ops
- add commit "phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during
  runtime suspend"
- "phy: qcom-snps-femto-v2: properly enable ref clock"
  - dropped "HACK:" comment (Bjorn Andersson)
  - check for IS_ERR() for the optional cfg_ahb clock (Bjorn Andersson)
  - don't print an error message in case clk_bulk_prepare() fails (Bjorn
    Andersson)

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
  phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime
    suspend
  phy: qcom-snps-femto-v2: properly enable ref clock
  phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 78 ++++++++++++-------
 1 file changed, 50 insertions(+), 28 deletions(-)

-- 
2.40.1

