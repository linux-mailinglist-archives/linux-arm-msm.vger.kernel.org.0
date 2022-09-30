Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D93A5F0205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 02:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiI3A4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 20:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiI3A4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 20:56:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E9C17F54E;
        Thu, 29 Sep 2022 17:56:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DBFC9B826CE;
        Fri, 30 Sep 2022 00:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FE7C433D6;
        Fri, 30 Sep 2022 00:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664499407;
        bh=BDMwS0TcIm/D15ce+TeY20NYbZU2HWwOfIec0BvE7xM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tA0i547FrphRZG7zKKkdVrMKMhoSos9jCeN9bjgIVJA+i2Wg2W5dDYfNiPr4UvJ+/
         VVt4kclwDP+vxWM1xSGd13cfDIQQHBIKlaNGi6IjZuag5pBX4wyTV7cCDOA0QwJxMR
         HObUv1lU4BuGwIQs3KAJu0uAOyPtHd0kDotpPJ50u2S+HUuP06fC8gNbRdAgTZPPS8
         QuGnp9BqneXOM0EljZbbaGPHi/EGTLGBUseQESGAaNM9OXV7bgNGzeEWP7exKJdfP6
         7Z+s/BtOcfDxgy1znk2mnfhrKFyKXAt42aBlfwnz0FHPg5WY135fiUBsOeoiCHvtfN
         jUiLNZ2Q1gg1g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org> <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 3/3] phy: qcom-qmp-ufs: provide symbol clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Thu, 29 Sep 2022 17:56:45 -0700
User-Agent: alot/0.10
Message-Id: <20220930005647.99FE7C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-09-15 23:17:40)
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

The previous two are on clk-fixed-rate branch if you want to pull it.
